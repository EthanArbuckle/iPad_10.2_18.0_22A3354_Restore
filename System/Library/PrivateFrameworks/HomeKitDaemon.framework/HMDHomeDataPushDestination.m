@implementation HMDHomeDataPushDestination

- (HMDHomeDataPushDestination)initWithUser:(id)a3 destination:(id)a4
{
  id v7;
  id v8;
  HMDHomeDataPushDestination *v9;
  HMDHomeDataPushDestination *v10;
  uint64_t v11;
  NSString *username;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDHomeDataPushDestination;
  v9 = -[HMDHomeDataPushDestination init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_msgSend(v7, "userID");
    v11 = objc_claimAutoreleasedReturnValue();
    username = v10->_username;
    v10->_username = (NSString *)v11;

    objc_storeStrong((id *)&v10->_destination, a4);
  }

  return v10;
}

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((shouldLogPrivateInformation() & 1) != 0)
  {
    -[HMDHomeDataPushDestination destination](self, "destination");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("...");
    v4 = CFSTR("...");
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[HMDHomeDataPushDestination user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeDataPushDestination ignoreConfigCompare](self, "ignoreConfigCompare");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[Push-Destination: User: %@, Dest: %@, Ignore-config: %@]"), v6, v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)pushDestination
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDHomeDataPushDestination destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDHomeDataPushDestination destination](self, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDHomeDataPushDestination user](self, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)username
{
  return self->_username;
}

- (HMDUser)user
{
  return self->_user;
}

- (NSString)destination
{
  return self->_destination;
}

- (BOOL)ignoreConfigCompare
{
  return self->_ignoreConfigCompare;
}

- (void)setIgnoreConfigCompare:(BOOL)a3
{
  self->_ignoreConfigCompare = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
