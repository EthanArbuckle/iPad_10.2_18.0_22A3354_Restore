@implementation HMDDeviceHomeKitSetupSession

- (HMDDeviceHomeKitSetupSession)initWithFirstResidentForHome:(BOOL)a3 clientConnection:(id)a4
{
  id v6;
  HMDDeviceHomeKitSetupSession *v7;
  HMDDeviceHomeKitSetupSession *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMDDeviceHomeKitSetupSession;
  v7 = -[HMDDeviceHomeKitSetupSession init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_firstResidentForHome = a3;
    objc_storeWeak((id *)&v7->_clientConnection, v6);
  }

  return v8;
}

- (BOOL)shouldRelayRequest
{
  if (-[HMDDeviceHomeKitSetupSession isFirstResidentForHome](self, "isFirstResidentForHome"))
    return 0;
  else
    return !-[HMDDeviceHomeKitSetupSession hasFailedRelayAttempt](self, "hasFailedRelayAttempt");
}

- (void)markHasFailedRelayAttempt
{
  -[HMDDeviceHomeKitSetupSession setHasFailedRelayAttempt:](self, "setHasFailedRelayAttempt:", 1);
}

- (BOOL)isFirstResidentForHome
{
  return self->_firstResidentForHome;
}

- (void)setFirstResidentForHome:(BOOL)a3
{
  self->_firstResidentForHome = a3;
}

- (BOOL)hasFailedRelayAttempt
{
  return self->_hasFailedRelayAttempt;
}

- (void)setHasFailedRelayAttempt:(BOOL)a3
{
  self->_hasFailedRelayAttempt = a3;
}

- (HMDXPCClientConnection)clientConnection
{
  return (HMDXPCClientConnection *)objc_loadWeakRetained((id *)&self->_clientConnection);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientConnection);
}

@end
