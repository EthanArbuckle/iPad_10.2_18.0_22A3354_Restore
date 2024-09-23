@implementation COMeshControllerQueuedBroadcastRequestMarker

- (COMeshControllerQueuedBroadcastRequestMarker)initWithRequest:(id)a3 includeSelf:(BOOL)a4 recipientBlock:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  COMeshControllerQueuedBroadcastRequestMarker *v14;
  COMeshControllerQueuedBroadcastRequestMarker *v15;
  uint64_t v16;
  id recipientCallback;
  uint64_t v18;
  id completionHandler;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)COMeshControllerQueuedBroadcastRequestMarker;
  v14 = -[COMeshControllerQueuedBroadcastRequestMarker init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    v15->_includeSelfInBroadcast = a4;
    v16 = MEMORY[0x2199F3D40](v12);
    recipientCallback = v15->_recipientCallback;
    v15->_recipientCallback = (id)v16;

    v18 = MEMORY[0x2199F3D40](v13);
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = (id)v18;

  }
  return v15;
}

- (id)destination
{
  return 0;
}

- (COMeshRequest)request
{
  return self->_request;
}

- (id)recipientCallback
{
  return self->_recipientCallback;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)includeSelfInBroadcast
{
  return self->_includeSelfInBroadcast;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_recipientCallback, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
