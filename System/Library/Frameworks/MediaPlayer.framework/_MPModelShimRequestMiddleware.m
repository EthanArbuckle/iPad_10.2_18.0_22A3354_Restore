@implementation _MPModelShimRequestMiddleware

- (void)setInvalidationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationObservers, a3);
}

- (void)setModelResponse:(id)a3
{
  objc_storeStrong((id *)&self->_modelResponse, a3);
}

- (MPModelResponse)modelResponse
{
  return self->_modelResponse;
}

- (id)operationsForRequest:(id)a3
{
  id v4;
  id v5;
  _MPModelShimRequestMiddlewareOperation *v6;
  void *v7;
  _MPModelShimRequestMiddlewareOperation *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = [_MPModelShimRequestMiddlewareOperation alloc];
    objc_msgSend(v5, "modelRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[_MPModelShimRequestMiddlewareOperation initWithMiddleware:modelRequest:](v6, "initWithMiddleware:modelRequest:", self, v7);
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelResponse, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

@end
