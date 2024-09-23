@implementation AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl

- (AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl)initWithID:(id)a3 outputDevice:(id)a4 authorizationTokenType:(id)a5
{
  AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *v8;
  AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl;
  v8 = -[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl init](&v11, sel_init);
  if (v8)
  {
    v8->_uniqueID = (NSString *)objc_msgSend(a3, "copy");
    v8->_outputDevice = (AVOutputDevice *)a4;
    v8->_tokenType = (NSString *)a5;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl;
  -[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl dealloc](&v3, sel_dealloc);
}

- (void)respondWithAuthorizationToken:(id)a3 completionHandler:(id)a4
{
  self->_completionHandler = (id)objc_msgSend(a4, "copy");
  -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl outputDeviceAuthorizationRequestImpl:didRespondWithAuthorizationToken:](-[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl parentAuthorizationSessionImpl](self, "parentAuthorizationSessionImpl"), "outputDeviceAuthorizationRequestImpl:didRespondWithAuthorizationToken:", self, a3);
}

- (void)cancel
{
  -[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl enterTerminalStatus:error:](self, "enterTerminalStatus:error:", 4, 0);
  -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl outputDeviceAuthorizationRequestImplDidCancel:](-[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl parentAuthorizationSessionImpl](self, "parentAuthorizationSessionImpl"), "outputDeviceAuthorizationRequestImplDidCancel:", self);
}

- (void)enterTerminalStatus:(int64_t)a3 error:(id)a4
{
  void (**completionHandler)(id, int64_t, id);

  completionHandler = (void (**)(id, int64_t, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3, a4);

    self->_completionHandler = 0;
  }
}

- (AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl)parentAuthorizationSessionImpl
{
  return (AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)objc_loadWeak((id *)&self->_parentSession);
}

- (void)setParentAuthorizationSessionImpl:(id)a3
{
  objc_storeWeak((id *)&self->_parentSession, a3);
}

- (NSString)ID
{
  return self->_uniqueID;
}

- (AVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (NSString)authorizationTokenType
{
  return self->_tokenType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSession);
}

@end
