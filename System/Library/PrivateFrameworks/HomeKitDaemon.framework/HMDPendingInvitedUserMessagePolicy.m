@implementation HMDPendingInvitedUserMessagePolicy

- (HMDPendingInvitedUserMessagePolicy)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDPendingInvitedUserMessagePolicy)initWithHomeManager:(id)a3
{
  id v4;
  HMDPendingInvitedUserMessagePolicy *v5;
  HMDPendingInvitedUserMessagePolicy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDPendingInvitedUserMessagePolicy;
  v5 = -[HMDPendingInvitedUserMessagePolicy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_homeManager, v4);

  return v6;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
}

@end
