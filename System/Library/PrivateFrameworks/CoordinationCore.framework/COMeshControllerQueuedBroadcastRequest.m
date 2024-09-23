@implementation COMeshControllerQueuedBroadcastRequest

- (COMeshControllerQueuedBroadcastRequest)initWithRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  COMeshControllerQueuedBroadcastRequest *v12;
  COMeshControllerQueuedBroadcastRequest *v13;
  uint64_t v14;
  id completionHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)COMeshControllerQueuedBroadcastRequest;
  v12 = -[COMeshControllerQueuedBroadcastRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_destination, a4);
    v14 = objc_msgSend(v11, "copy");
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v14;

  }
  return v13;
}

- (void)invokeCallbackWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, void *, void *, id);

  v4 = a3;
  -[COMeshControllerQueuedBroadcastRequest completionHandler](self, "completionHandler");
  v8 = (void (**)(id, void *, void *, void *, id))objc_claimAutoreleasedReturnValue();
  -[COMeshControllerQueuedBroadcastRequest request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshControllerQueuedBroadcastRequest destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshControllerQueuedBroadcastRequest response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5, v6, v7, v4);

}

- (COMeshRequest)request
{
  return self->_request;
}

- (COMeshNode)destination
{
  return self->_destination;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
