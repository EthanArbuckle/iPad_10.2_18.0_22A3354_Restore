@implementation _HMDAppleAccountIdentifier

- (_HMDAppleAccountIdentifier)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (_HMDAppleAccountIdentifier)initWithIdentifierString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _HMDAppleAccountIdentifier *v9;
  uint64_t v10;
  NSString *identifierString;
  _HMDAppleAccountIdentifier *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    +[_HMDAppleAccountIdentifier namespace](_HMDAppleAccountIdentifier, "namespace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithNamespace:data:", v6, v7);

    v14.receiver = self;
    v14.super_class = (Class)_HMDAppleAccountIdentifier;
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

- (id)kind
{
  return CFSTR("AA");
}

- (BOOL)isEqual:(id)a3
{
  _HMDAppleAccountIdentifier *v4;
  _HMDAppleAccountIdentifier *v5;
  _HMDAppleAccountIdentifier *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMDAppleAccountIdentifier *)a3;
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
      -[_HMDAppleAccountIdentifier identifierString](self, "identifierString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDAppleAccountIdentifier identifierString](v6, "identifierString");
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

- (BOOL)isAuthenticated
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[_HMDAppleAccountIdentifier identifierString](self, "identifierString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "isEqualToString:", v5);

  return v6;
}

- (_HMDAppleAccountIdentifier)initWithCoder:(id)a3
{
  id v4;
  _HMDAppleAccountIdentifier *v5;
  uint64_t v6;
  NSString *identifierString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDAppleAccountIdentifier;
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
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_HMDAppleAccountIdentifier;
  -[_HMDAccountIdentifier encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock_with_options();
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifierString, CFSTR("HM.string"));
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)identifierString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierString, 0);
}

+ (id)namespace
{
  if (namespace_onceToken != -1)
    dispatch_once(&namespace_onceToken, &__block_literal_global_17471);
  return (id)namespace_namespace;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
