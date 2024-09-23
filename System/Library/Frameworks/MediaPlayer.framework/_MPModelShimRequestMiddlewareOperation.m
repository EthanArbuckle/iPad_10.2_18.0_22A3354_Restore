@implementation _MPModelShimRequestMiddlewareOperation

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)execute
{
  MPModelRequest *modelRequest;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MPModelShimRequestMiddlewareOperation;
  -[MPAsyncOperation execute](&v5, sel_execute);
  modelRequest = self->_modelRequest;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49___MPModelShimRequestMiddlewareOperation_execute__block_invoke;
  v4[3] = &unk_1E315D5E0;
  v4[4] = self;
  -[MPModelRequest performWithResponseHandler:](modelRequest, "performWithResponseHandler:", v4);
}

- (_MPModelShimRequestMiddlewareOperation)initWithMiddleware:(id)a3 modelRequest:(id)a4
{
  id v7;
  id v8;
  _MPModelShimRequestMiddlewareOperation *v9;
  _MPModelShimRequestMiddlewareOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MPModelShimRequestMiddlewareOperation;
  v9 = -[MPAsyncOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_modelRequest, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (_MPModelShimRequestMiddleware)middleware
{
  return self->_middleware;
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

- (MPModelRequest)modelRequest
{
  return self->_modelRequest;
}

- (void)setModelRequest:(id)a3
{
  objc_storeStrong((id *)&self->_modelRequest, a3);
}

@end
