@implementation HMDRemoteLoginInitiatorSession

- (HMDRemoteLoginInitiatorSession)initWithSessionID:(id)a3
{
  id v5;
  HMDRemoteLoginInitiatorSession *v6;
  HMDRemoteLoginInitiatorSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteLoginInitiatorSession;
  v6 = -[HMDRemoteLoginInitiatorSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessionID, a3);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDRemoteLoginInitiatorSession sessionID](self, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[Login-Initiator-Session: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
