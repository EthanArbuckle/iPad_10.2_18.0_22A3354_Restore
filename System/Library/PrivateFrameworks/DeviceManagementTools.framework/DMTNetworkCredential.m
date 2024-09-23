@implementation DMTNetworkCredential

- (DMTNetworkCredential)initWithNetworkName:(id)a3 credential:(id)a4
{
  id v6;
  id v7;
  DMTNetworkCredential *v8;
  uint64_t v9;
  NSString *networkName;
  uint64_t v11;
  NSString *credential;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMTNetworkCredential;
  v8 = -[DMTNetworkCredential init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    networkName = v8->_networkName;
    v8->_networkName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    credential = v8->_credential;
    v8->_credential = (NSString *)v11;

  }
  return v8;
}

+ (id)credentialWithNetworkName:(id)a3 credential:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetworkName:credential:", v7, v6);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DMTNetworkCredential networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("networkName"));

  -[DMTNetworkCredential credential](self, "credential");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("credential"));

}

- (DMTNetworkCredential)initWithCoder:(id)a3
{
  id v4;
  DMTNetworkCredential *v5;
  void *v6;
  uint64_t v7;
  NSString *networkName;
  void *v9;
  uint64_t v10;
  NSString *credential;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMTNetworkCredential;
  v5 = -[DMTNetworkCredential init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("networkName"));
    v7 = objc_claimAutoreleasedReturnValue();
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("credential"));
    v10 = objc_claimAutoreleasedReturnValue();
    credential = v5->_credential;
    v5->_credential = (NSString *)v10;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DMTNetworkCredential *v4;
  char isKindOfClass;
  BOOL v6;

  v4 = (DMTNetworkCredential *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
      v6 = -[DMTNetworkCredential isEqualToCredential:](self, "isEqualToCredential:", v4);
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[DMTNetworkCredential networkName](self, "networkName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DMTNetworkCredential credential](self, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DMTNetworkCredential *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DMTNetworkCredential *v9;

  v4 = [DMTNetworkCredential alloc];
  -[DMTNetworkCredential networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[DMTNetworkCredential credential](self, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = -[DMTNetworkCredential initWithNetworkName:credential:](v4, "initWithNetworkName:credential:", v6, v8);

  return v9;
}

- (BOOL)isEqualToCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[DMTNetworkCredential networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[DMTNetworkCredential credential](self, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "credential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSString)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end
