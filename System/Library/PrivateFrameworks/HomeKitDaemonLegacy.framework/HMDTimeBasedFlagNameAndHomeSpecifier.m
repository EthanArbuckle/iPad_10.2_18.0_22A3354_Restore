@implementation HMDTimeBasedFlagNameAndHomeSpecifier

- (HMDTimeBasedFlagNameAndHomeSpecifier)initWithFlagName:(id)a3 homeUUID:(id)a4
{
  id v7;
  id v8;
  HMDTimeBasedFlagNameAndHomeSpecifier *v9;
  HMDTimeBasedFlagNameAndHomeSpecifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDTimeBasedFlagNameAndHomeSpecifier;
  v9 = -[HMDTimeBasedFlagNameAndHomeSpecifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flagName, a3);
    objc_storeStrong((id *)&v10->_homeUUID, a4);
  }

  return v10;
}

- (HMDTimeBasedFlagNameAndHomeSpecifier)initWithCoder:(id)a3
{
  id v4;
  HMDTimeBasedFlagNameAndHomeSpecifier *v5;
  uint64_t v6;
  NSString *flagName;
  uint64_t v8;
  NSUUID *homeUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDTimeBasedFlagNameAndHomeSpecifier;
  v5 = -[HMDTimeBasedFlagNameAndHomeSpecifier init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flagName"));
    v6 = objc_claimAutoreleasedReturnValue();
    flagName = v5->_flagName;
    v5->_flagName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    homeUUID = v5->_homeUUID;
    v5->_homeUUID = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDTimeBasedFlagNameAndHomeSpecifier flagName](self, "flagName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("flagName"));

  -[HMDTimeBasedFlagNameAndHomeSpecifier homeUUID](self, "homeUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("homeUUID"));

}

- (BOOL)isEqual:(id)a3
{
  HMDTimeBasedFlagNameAndHomeSpecifier *v4;
  HMDTimeBasedFlagNameAndHomeSpecifier *v5;
  HMDTimeBasedFlagNameAndHomeSpecifier *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDTimeBasedFlagNameAndHomeSpecifier *)a3;
  if (self == v4)
  {
    v11 = 1;
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
      -[HMDTimeBasedFlagNameAndHomeSpecifier flagName](self, "flagName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTimeBasedFlagNameAndHomeSpecifier flagName](v6, "flagName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[HMDTimeBasedFlagNameAndHomeSpecifier homeUUID](self, "homeUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDTimeBasedFlagNameAndHomeSpecifier homeUUID](v6, "homeUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDTimeBasedFlagNameAndHomeSpecifier flagName](self, "flagName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDTimeBasedFlagNameAndHomeSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDTimeBasedFlagNameAndHomeSpecifier flagName](self, "flagName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimeBasedFlagNameAndHomeSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)flagName
{
  return self->_flagName;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_flagName, 0);
}

+ (id)specifierWithFlagName:(id)a3 homeUUID:(id)a4
{
  id v5;
  id v6;
  HMDTimeBasedFlagNameAndHomeSpecifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDTimeBasedFlagNameAndHomeSpecifier initWithFlagName:homeUUID:]([HMDTimeBasedFlagNameAndHomeSpecifier alloc], "initWithFlagName:homeUUID:", v6, v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
