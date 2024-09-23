@implementation _HMDIDSAccountIdentifier

- (_HMDIDSAccountIdentifier)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (_HMDIDSAccountIdentifier)initWithIdentifierString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _HMDIDSAccountIdentifier *v9;
  uint64_t v10;
  NSString *identifierString;
  _HMDIDSAccountIdentifier *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1880]);
    +[_HMDIDSAccountIdentifier namespace](_HMDIDSAccountIdentifier, "namespace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithNamespace:data:", v6, v7);

    v14.receiver = self;
    v14.super_class = (Class)_HMDIDSAccountIdentifier;
    v9 = -[_HMDAccountIdentifier initWithIdentifier:](&v14, sel_initWithIdentifier_, v8);
    if (v9)
    {
      v10 = objc_msgSend(v4, "copy");
      identifierString = v9->_identifierString;
      v9->_identifierString = (NSString *)v10;

    }
    self = v9;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _HMDIDSAccountIdentifier *v4;
  _HMDIDSAccountIdentifier *v5;
  _HMDIDSAccountIdentifier *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMDIDSAccountIdentifier *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[_HMDIDSAccountIdentifier identifierString](self, "identifierString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDIDSAccountIdentifier identifierString](v6, "identifierString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)kind
{
  return CFSTR("IDS");
}

- (BOOL)isAuthenticated
{
  return 1;
}

- (id)senderCorrelationIdentifier
{
  return self->_identifierString;
}

- (_HMDIDSAccountIdentifier)initWithCoder:(id)a3
{
  id v4;
  _HMDIDSAccountIdentifier *v5;
  uint64_t v6;
  NSString *identifierString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDIDSAccountIdentifier;
  v5 = -[_HMDAccountIdentifier initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.string"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifierString = v5->_identifierString;
    v5->_identifierString = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HMDIDSAccountIdentifier;
  v4 = a3;
  -[_HMDAccountIdentifier encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[_HMDIDSAccountIdentifier identifierString](self, "identifierString", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.string"));

}

- (NSString)identifierString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierString, 0);
}

+ (id)namespace
{
  if (namespace_onceToken_162 != -1)
    dispatch_once(&namespace_onceToken_162, &__block_literal_global_163);
  return (id)namespace_namespace_161;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
