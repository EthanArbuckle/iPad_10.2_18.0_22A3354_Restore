@implementation HMDAccountIdentifier

- (HMDAccountIdentifier)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAccountIdentifier)initWithInternal:(id)a3
{
  id v5;
  HMDAccountIdentifier *v6;
  HMDAccountIdentifier *v7;
  HMDAccountIdentifier *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDAccountIdentifier;
    v6 = -[HMDAccountIdentifier init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_internal, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccountIdentifier internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccountIdentifier *v4;
  HMDAccountIdentifier *v5;
  HMDAccountIdentifier *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccountIdentifier *)a3;
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
      -[HMDAccountIdentifier internal](self, "internal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccountIdentifier internal](v6, "internal");
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

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccountIdentifier internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountIdentifier identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@)%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccountIdentifier internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("KN"), v5);
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccountIdentifier identifier](self, "identifier", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("ID"), v9);
  v16[1] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccountIdentifier senderCorrelationIdentifier](self, "senderCorrelationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("MID"), v12);
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[HMDAccountIdentifier internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isAuthenticated
{
  void *v2;
  char v3;

  -[HMDAccountIdentifier internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  return v3;
}

- (NSString)senderCorrelationIdentifier
{
  return -[_HMDAccountIdentifier senderCorrelationIdentifier](self->_internal, "senderCorrelationIdentifier");
}

- (HMDAccountIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDAccountIdentifier *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.internal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMDAccountIdentifier initWithInternal:](self, "initWithInternal:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDAccountIdentifier internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.internal"));

}

- (_HMDAccountIdentifier)internal
{
  return (_HMDAccountIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

+ (id)accountIdentifierForAccountHandle:(id)a3
{
  id v4;
  _HMDAccountHandleIdentifier *v5;
  void *v6;

  v4 = a3;
  v5 = -[_HMDAccountHandleIdentifier initWithAccountHandle:]([_HMDAccountHandleIdentifier alloc], "initWithAccountHandle:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInternal:", v5);
  return v6;
}

+ (id)accountIdentifierForAppleAccountContext:(id)a3
{
  id v3;
  _HMDAppleAccountIdentifier *v4;
  void *v5;
  _HMDAppleAccountIdentifier *v6;
  HMDAccountIdentifier *v7;

  v3 = a3;
  v4 = [_HMDAppleAccountIdentifier alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_HMDAppleAccountIdentifier initWithIdentifierString:](v4, "initWithIdentifierString:", v5);
  v7 = -[HMDAccountIdentifier initWithInternal:]([HMDAccountIdentifier alloc], "initWithInternal:", v6);

  return v7;
}

+ (id)accountIdentifierForMessageContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "senderCorrelationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountIdentifierForSenderCorrelationIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)accountIdentifierForSenderCorrelationIdentifier:(id)a3
{
  id v3;
  _HMDIDSAccountIdentifier *v4;
  HMDAccountIdentifier *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[_HMDIDSAccountIdentifier initWithIdentifierString:]([_HMDIDSAccountIdentifier alloc], "initWithIdentifierString:", v3);
    v5 = -[HMDAccountIdentifier initWithInternal:]([HMDAccountIdentifier alloc], "initWithInternal:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
