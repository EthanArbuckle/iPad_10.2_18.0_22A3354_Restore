@implementation HMAccessoryAllowedHost

- (HMAccessoryAllowedHost)initWithCoder:(id)a3
{
  id v4;
  HMAccessoryAllowedHost *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSSet *addresses;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMAccessoryAllowedHost;
  v5 = -[HMAccessoryAllowedHost init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAAH.name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAAH.purpose"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_purpose = objc_msgSend(v8, "unsignedIntegerValue");
    v9 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("HMAAH.hostAddresses"));
    v12 = objc_claimAutoreleasedReturnValue();
    addresses = v5->_addresses;
    v5->_addresses = (NSSet *)v12;

    v5->_unrestricted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMAAH.unrestricted"));
  }

  return v5;
}

- (NSString)name
{
  void *v3;
  NSString *v4;

  if (-[HMAccessoryAllowedHost isUnrestricted](self, "isUnrestricted"))
  {
    +[HMLocalization sharedManager](HMLocalization, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getLocalizedString:", CFSTR("ALLOWED_HOST_UNRESTRICTED_NAME"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_name;
  }
  return v4;
}

- (NSString)address
{
  void *v2;
  void *v3;

  -[HMAccessoryAllowedHost addresses](self, "addresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
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

- (unint64_t)purpose
{
  return self->_purpose;
}

- (NSSet)addresses
{
  return self->_addresses;
}

- (BOOL)isUnrestricted
{
  return self->_unrestricted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
