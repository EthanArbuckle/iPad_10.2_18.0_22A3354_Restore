@implementation AKPrivateEmail

- (AKPrivateEmail)initWithAddress:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  AKPrivateEmail *v9;
  AKPrivateEmail *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKPrivateEmail;
  v9 = -[AKPrivateEmail init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateEmailAddress, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (AKPrivateEmail)initWithAddress:(id)a3 forKey:(id)a4 withBundleId:(id)a5
{
  id v9;
  id v10;
  id v11;
  AKPrivateEmail *v12;
  AKPrivateEmail *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKPrivateEmail;
  v12 = -[AKPrivateEmail init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_privateEmailAddress, a3);
    objc_storeStrong((id *)&v13->_key, a4);
    objc_storeStrong((id *)&v13->_clientAppBundleId, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("clientKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateEmailAddress, CFSTR("privateEmailAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientAppBundleId, CFSTR("privateEmailClientBundle"));

}

- (AKPrivateEmail)initWithCoder:(id)a3
{
  id v4;
  AKPrivateEmail *v5;
  uint64_t v6;
  NSString *privateEmailAddress;
  uint64_t v8;
  NSString *key;
  uint64_t v10;
  NSString *clientAppBundleId;

  v4 = a3;
  v5 = -[AKPrivateEmail init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateEmailAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    privateEmailAddress = v5->_privateEmailAddress;
    v5->_privateEmailAddress = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateEmailClientBundle"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientAppBundleId = v5->_clientAppBundleId;
    v5->_clientAppBundleId = (NSString *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKPrivateEmail *v4;
  uint64_t v5;
  NSString *privateEmailAddress;
  uint64_t v7;
  NSString *key;
  uint64_t v9;
  NSString *clientAppBundleId;

  v4 = objc_alloc_init(AKPrivateEmail);
  v5 = -[NSString copy](self->_privateEmailAddress, "copy");
  privateEmailAddress = v4->_privateEmailAddress;
  v4->_privateEmailAddress = (NSString *)v5;

  v7 = -[NSString copy](self->_key, "copy");
  key = v4->_key;
  v4->_key = (NSString *)v7;

  v9 = -[NSString copy](self->_clientAppBundleId, "copy");
  clientAppBundleId = v4->_clientAppBundleId;
  v4->_clientAppBundleId = (NSString *)v9;

  return v4;
}

- (id)description
{
  NSString *clientAppBundleId;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  clientAppBundleId = self->_clientAppBundleId;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AKPrivateEmail key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPrivateEmail privateEmailAddress](self, "privateEmailAddress");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (clientAppBundleId)
  {
    -[AKPrivateEmail clientAppBundleId](self, "clientAppBundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<PrivateEmail: {%@} -> {%@} [%@]>"), v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<PrivateEmail: {%@} -> {%@}>"), v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)clientAppBundleId
{
  return self->_clientAppBundleId;
}

- (NSString)privateEmailAddress
{
  return self->_privateEmailAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEmailAddress, 0);
  objc_storeStrong((id *)&self->_clientAppBundleId, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
