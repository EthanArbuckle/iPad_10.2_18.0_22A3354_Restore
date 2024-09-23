@implementation _HMDCameraPowerAssertion

- (_HMDCameraPowerAssertion)initWithPowerAssertionHandler:(id)a3 remoteRequestHandlerSessionID:(id)a4
{
  id v6;
  id v7;
  _HMDCameraPowerAssertion *v8;
  _HMDCameraPowerAssertion *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HMDCameraPowerAssertion;
  v8 = -[_HMDCameraPowerAssertion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_assertionHandler, v6);
    objc_storeStrong((id *)&v9->_remoteRequestHandlerSessionID, a4);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_HMDCameraPowerAssertion assertionHandler](self, "assertionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMDCameraPowerAssertion remoteRequestHandlerSessionID](self, "remoteRequestHandlerSessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterRemoteRequestHandler:", v4);

  v5.receiver = self;
  v5.super_class = (Class)_HMDCameraPowerAssertion;
  -[_HMDCameraPowerAssertion dealloc](&v5, sel_dealloc);
}

- (HMDCameraPowerAssertionHandler)assertionHandler
{
  return (HMDCameraPowerAssertionHandler *)objc_loadWeakRetained((id *)&self->_assertionHandler);
}

- (HMDCameraSessionID)remoteRequestHandlerSessionID
{
  return self->_remoteRequestHandlerSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequestHandlerSessionID, 0);
  objc_destroyWeak((id *)&self->_assertionHandler);
}

@end
