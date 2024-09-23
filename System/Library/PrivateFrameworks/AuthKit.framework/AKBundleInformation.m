@implementation AKBundleInformation

- (AKBundleInformation)initWithBundleIdentifier:(id)a3 bundleName:(id)a4 bundleDescription:(id)a5 bundleType:(unint64_t)a6 otherInfo:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AKBundleInformation *v17;
  AKBundleInformation *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)AKBundleInformation;
  v17 = -[AKBundleInformation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleName, a4);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v18->_bundleDescription, a5);
    v18->_bundleType = a6;
    objc_storeStrong((id *)&v18->_otherInfo, a7);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleName;
  void *v5;
  id v6;

  bundleName = self->_bundleName;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", bundleName, CFSTR("_bundleName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleDescription, CFSTR("_bundleDescription"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bundleType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_bundleType"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_otherInfo, CFSTR("_otherInfo"));
}

- (AKBundleInformation)initWithCoder:(id)a3
{
  id v4;
  AKBundleInformation *v5;
  uint64_t v6;
  NSString *bundleName;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *bundleDescription;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *otherInfo;

  v4 = a3;
  v5 = -[AKBundleInformation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleName"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleName = v5->_bundleName;
    v5->_bundleName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleDescription = v5->_bundleDescription;
    v5->_bundleDescription = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bundleType = objc_msgSend(v12, "integerValue");

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_otherInfo"));
    v17 = objc_claimAutoreleasedReturnValue();
    otherInfo = v5->_otherInfo;
    v5->_otherInfo = (NSDictionary *)v17;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKBundleInformation *v4;
  uint64_t v5;
  NSString *bundleName;
  uint64_t v7;
  NSString *bundleIdentifier;
  uint64_t v9;
  NSString *bundleDescription;
  uint64_t v11;
  NSDictionary *otherInfo;

  v4 = objc_alloc_init(AKBundleInformation);
  v5 = -[NSString copy](self->_bundleName, "copy");
  bundleName = v4->_bundleName;
  v4->_bundleName = (NSString *)v5;

  v7 = -[NSString copy](self->_bundleIdentifier, "copy");
  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = (NSString *)v7;

  v9 = -[NSString copy](self->_bundleDescription, "copy");
  bundleDescription = v4->_bundleDescription;
  v4->_bundleDescription = (NSString *)v9;

  v4->_bundleType = self->_bundleType;
  v11 = -[NSDictionary copy](self->_otherInfo, "copy");
  otherInfo = v4->_otherInfo;
  v4->_otherInfo = (NSDictionary *)v11;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)bundleDescription
{
  return self->_bundleDescription;
}

- (unint64_t)bundleType
{
  return self->_bundleType;
}

- (NSDictionary)otherInfo
{
  return self->_otherInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherInfo, 0);
  objc_storeStrong((id *)&self->_bundleDescription, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
