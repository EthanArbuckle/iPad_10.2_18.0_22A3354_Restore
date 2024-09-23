@implementation HMDIDSMessageContext

- (HMDIDSMessageContext)init
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

- (HMDIDSMessageContext)initWithIdentifier:(id)a3 destination:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDIDSMessageContext *v11;
  HMDIDSMessageContext *v12;
  uint64_t v13;
  NSUUID *identifier;
  uint64_t v15;
  NSDictionary *userInfo;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  if (v8 && v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDIDSMessageContext;
    v12 = -[HMDIDSMessageContext init](&v18, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(v8, "copy");
      identifier = v12->_identifier;
      v12->_identifier = (NSUUID *)v13;

      objc_storeStrong((id *)&v12->_destination, a4);
      v15 = objc_msgSend(v10, "copy");
      userInfo = v12->_userInfo;
      v12->_userInfo = (NSDictionary *)v15;

    }
    self = v12;
    v11 = self;
  }

  return v11;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMFMessageDestination)destination
{
  return (HMFMessageDestination *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
