@implementation HMDTimeBasedFlagNameSpecifier

- (HMDTimeBasedFlagNameSpecifier)initWithFlagName:(id)a3
{
  id v5;
  HMDTimeBasedFlagNameSpecifier *v6;
  HMDTimeBasedFlagNameSpecifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDTimeBasedFlagNameSpecifier;
  v6 = -[HMDTimeBasedFlagNameSpecifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_flagName, a3);

  return v7;
}

- (HMDTimeBasedFlagNameSpecifier)initWithCoder:(id)a3
{
  id v4;
  HMDTimeBasedFlagNameSpecifier *v5;
  uint64_t v6;
  NSString *flagName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDTimeBasedFlagNameSpecifier;
  v5 = -[HMDTimeBasedFlagNameSpecifier init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flagName"));
    v6 = objc_claimAutoreleasedReturnValue();
    flagName = v5->_flagName;
    v5->_flagName = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDTimeBasedFlagNameSpecifier flagName](self, "flagName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("flagName"));

}

- (BOOL)isEqual:(id)a3
{
  HMDTimeBasedFlagNameSpecifier *v4;
  HMDTimeBasedFlagNameSpecifier *v5;
  HMDTimeBasedFlagNameSpecifier *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDTimeBasedFlagNameSpecifier *)a3;
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
      -[HMDTimeBasedFlagNameSpecifier flagName](self, "flagName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTimeBasedFlagNameSpecifier flagName](v6, "flagName");
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

- (BOOL)isEqualToGroupNameSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDTimeBasedFlagNameSpecifier flagName](self, "flagName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flagName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDTimeBasedFlagNameSpecifier flagName](self, "flagName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[HMDTimeBasedFlagNameSpecifier flagName](self, "flagName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)flagName
{
  return self->_flagName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagName, 0);
}

+ (id)specifierWithFlagName:(id)a3
{
  id v3;
  HMDTimeBasedFlagNameSpecifier *v4;

  v3 = a3;
  v4 = -[HMDTimeBasedFlagNameSpecifier initWithFlagName:]([HMDTimeBasedFlagNameSpecifier alloc], "initWithFlagName:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
