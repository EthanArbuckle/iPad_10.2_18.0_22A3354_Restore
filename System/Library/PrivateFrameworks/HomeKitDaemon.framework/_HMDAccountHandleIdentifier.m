@implementation _HMDAccountHandleIdentifier

- (_HMDAccountHandleIdentifier)initWithIdentifier:(id)a3
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

- (_HMDAccountHandleIdentifier)initWithAccountHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _HMDAccountHandleIdentifier *v7;
  uint64_t v8;
  HMDAccountHandle *accountHandle;
  _HMDAccountHandleIdentifier *v10;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)_HMDAccountHandleIdentifier;
    v7 = -[_HMDAccountIdentifier initWithIdentifier:](&v12, sel_initWithIdentifier_, v6);

    if (v7)
    {
      v8 = objc_msgSend(v5, "copy");
      accountHandle = v7->_accountHandle;
      v7->_accountHandle = (HMDAccountHandle *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _HMDAccountHandleIdentifier *v4;
  _HMDAccountHandleIdentifier *v5;
  _HMDAccountHandleIdentifier *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMDAccountHandleIdentifier *)a3;
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
      -[_HMDAccountHandleIdentifier accountHandle](self, "accountHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDAccountHandleIdentifier accountHandle](v6, "accountHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

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
  return CFSTR("AH");
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[_HMDAccountHandleIdentifier accountHandle](self, "accountHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_HMDAccountHandleIdentifier)initWithCoder:(id)a3
{
  id v4;
  _HMDAccountHandleIdentifier *v5;
  uint64_t v6;
  HMDAccountHandle *accountHandle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDAccountHandleIdentifier;
  v5 = -[_HMDAccountIdentifier initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountHandle = v5->_accountHandle;
    v5->_accountHandle = (HMDAccountHandle *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HMDAccountHandleIdentifier;
  v4 = a3;
  -[_HMDAccountIdentifier encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[_HMDAccountHandleIdentifier accountHandle](self, "accountHandle", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.handle"));

}

- (HMDAccountHandle)accountHandle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountHandle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
