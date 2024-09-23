@implementation AKBeneficiaryManifest

- (AKBeneficiaryManifest)initWithBundleInformation:(id)a3 manifestOptions:(int64_t)a4
{
  id v7;
  AKBeneficiaryManifest *v8;
  AKBeneficiaryManifest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKBeneficiaryManifest;
  v8 = -[AKBeneficiaryManifest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessibleBundleInformation, a3);
    v9->_manifestOptions = a4;
  }

  return v9;
}

- (NSDictionary)parsableRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBeneficiaryManifest accessibleBundleInformation](self, "accessibleBundleInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));

        objc_msgSend(v9, "bundleName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("name"));

        -[AKBeneficiaryManifest _bundleTypeFrom:](self, "_bundleTypeFrom:", objc_msgSend(v9, "bundleType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("type"));

        objc_msgSend(v9, "bundleDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("description"));

        objc_msgSend(v4, "addObject:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v4, CFSTR("items"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AKBeneficiaryManifest _isAllOptionsSelected](self, "_isAllOptionsSelected"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("all"));

  v16 = (void *)objc_msgSend(v18, "copy");
  return (NSDictionary *)v16;
}

- (id)_bundleTypeFrom:(unint64_t)a3
{
  if (a3)
    return &unk_1E2E9A310;
  else
    return &unk_1E2E9A2F8;
}

- (BOOL)_isAllOptionsSelected
{
  return -[AKBeneficiaryManifest manifestOptions](self, "manifestOptions") == 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *accessibleBundleInformation;
  id v5;
  id v6;

  accessibleBundleInformation = self->_accessibleBundleInformation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accessibleBundleInformation, CFSTR("_accessibleBundleInformation"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_manifestOptions);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_manifestOptions"));

}

- (AKBeneficiaryManifest)initWithCoder:(id)a3
{
  id v4;
  AKBeneficiaryManifest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *accessibleBundleInformation;
  void *v11;

  v4 = a3;
  v5 = -[AKBeneficiaryManifest init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_accessibleBundleInformation"));
    v9 = objc_claimAutoreleasedReturnValue();
    accessibleBundleInformation = v5->_accessibleBundleInformation;
    v5->_accessibleBundleInformation = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_manifestOptions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_manifestOptions = objc_msgSend(v11, "integerValue");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKBeneficiaryManifest *v4;
  uint64_t v5;
  NSArray *accessibleBundleInformation;

  v4 = objc_alloc_init(AKBeneficiaryManifest);
  v5 = -[NSArray copy](self->_accessibleBundleInformation, "copy");
  accessibleBundleInformation = v4->_accessibleBundleInformation;
  v4->_accessibleBundleInformation = (NSArray *)v5;

  v4->_manifestOptions = self->_manifestOptions;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)accessibleBundleInformation
{
  return self->_accessibleBundleInformation;
}

- (int64_t)manifestOptions
{
  return self->_manifestOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibleBundleInformation, 0);
}

@end
