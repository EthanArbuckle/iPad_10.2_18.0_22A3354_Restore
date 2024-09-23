@implementation ENAccountIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENAccountIdentity)initWithAccountKey:(id)a3 deviceKey:(id)a4
{
  id v7;
  id v8;
  ENAccountIdentity *v9;
  ENAccountIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ENAccountIdentity;
  v9 = -[ENAccountIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountKey, a3);
    objc_storeStrong((id *)&v10->_deviceKey, a4);
  }

  return v10;
}

- (ENAccountIdentity)initWithCoder:(id)a3
{

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ENAccountIdentity accountKey](self, "accountKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kENPersonalIdentityAccountKey"));

  -[ENAccountIdentity deviceKey](self, "deviceKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kENPersonalIdentityDeviceKey"));

}

- (ENAccountKey)accountKey
{
  return self->_accountKey;
}

- (void)setAccountKey:(id)a3
{
  objc_storeStrong((id *)&self->_accountKey, a3);
}

- (ENDeviceKey)deviceKey
{
  return self->_deviceKey;
}

- (void)setDeviceKey:(id)a3
{
  objc_storeStrong((id *)&self->_deviceKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceKey, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
}

@end
