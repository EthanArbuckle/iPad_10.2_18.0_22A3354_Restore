@implementation HMDModernMessagingRegistration

- (HMDModernMessagingRegistration)initWithMessageName:(id)a3 xpcConnection:(id)a4
{
  id v7;
  id v8;
  HMDModernMessagingRegistration *v9;
  HMDModernMessagingRegistration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDModernMessagingRegistration;
  v9 = -[HMDModernMessagingRegistration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageName, a3);
    objc_storeStrong((id *)&v10->_xpcConnection, a4);
  }

  return v10;
}

- (id)prefixedMessageName
{
  void *v2;
  void *v3;

  -[HMDModernMessagingRegistration messageName](self, "messageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:](HMDModernMessagingRegistration, "prefixedHMMMMessageNameWithMessageName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)matchesPrefixedMessageName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HMDModernMessagingRegistration messageName](self, "messageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDModernMessagingRegistration prefixedHMMMMessageNameWithMessageName:](HMDModernMessagingRegistration, "prefixedHMMMMessageNameWithMessageName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (HMDXPCClientConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

+ (id)prefixedHMMMMessageNameWithMessageName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("HMMM.message.name.prefix_"), a3);
}

+ (id)clientHMMMMessageNameFromPrefixedMessageName:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 <= objc_msgSend(CFSTR("HMMM.message.name.prefix_"), "length"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("HMMM.message.name.prefix_"), "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
