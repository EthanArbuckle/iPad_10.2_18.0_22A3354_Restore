@implementation COMeshControllerQueuedRequest

- (COMeshControllerQueuedRequest)initWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  COMeshControllerQueuedRequest *v9;
  COMeshControllerQueuedRequest *v10;
  uint64_t v11;
  id completionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMeshControllerQueuedRequest;
  v9 = -[COMeshControllerQueuedRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    v11 = objc_msgSend(v8, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v11;

  }
  return v10;
}

- (void)invokeCallbackWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, void *, void *, id);

  v4 = a3;
  -[COMeshControllerQueuedRequest completionHandler](self, "completionHandler");
  v8 = (void (**)(id, void *, void *, void *, id))objc_claimAutoreleasedReturnValue();
  -[COMeshControllerQueuedRequest request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshControllerQueuedRequest destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshControllerQueuedRequest response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5, v6, v7, v4);

}

- (COMeshRequest)request
{
  return self->_request;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (COMeshResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (COMeshNode)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
