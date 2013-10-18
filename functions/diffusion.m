function out = diffusion(params, metaData)

% out = diffusion(D)

paramNames = {'diffusivity'};
if nargin == 0
    out = paramNames;
else
    assert(length(paramNames) == length(params))
    
    D = params;
    x = metaData.initial;
    N = length(x);
    dt = metaData.timeInc;
    
    for t = 2:metaData.T
        x(t,:) = x(t-1,:) + randn(1,N) * sqrt(2*D*dt);
        x(t,:) = x(t,:) .* (x(t,:) > 0); 
    end
    
    out = x;
end