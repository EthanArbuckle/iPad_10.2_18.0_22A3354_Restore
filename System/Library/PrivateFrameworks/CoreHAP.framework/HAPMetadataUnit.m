@implementation HAPMetadataUnit

- (HAPMetadataUnit)initWithName:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  HAPMetadataUnit *v8;
  HAPMetadataUnit *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  HAPMetadataUnit *unitDescription;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HAPMetadataUnit;
  v8 = -[HAPMetadataUnit init](&v15, sel_init);
  v9 = v8;
  if (v7 && v6)
  {
    if (v8)
    {
      v10 = objc_msgSend(v6, "copy");
      name = v9->_name;
      v9->_name = (NSString *)v10;

      v12 = objc_msgSend(v7, "copy");
      unitDescription = (HAPMetadataUnit *)v9->_unitDescription;
      v9->_unitDescription = (NSString *)v12;
    }
    else
    {
      unitDescription = 0;
    }
  }
  else
  {
    unitDescription = v8;
    v9 = 0;
  }

  return v9;
}

- (id)generateDictionary
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataUnit unitDescription](self, "unitDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DefaultDescription"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_1E894EFE8, CFSTR("LocalizationKey"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPMetadataUnit name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataUnit unitDescription](self, "unitDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Unit %@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dump
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataUnit name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataUnit unitDescription](self, "unitDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataUnit %@:  description: %@", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)unitDescription
{
  return self->_unitDescription;
}

- (void)setUnitDescription:(id)a3
{
  objc_storeStrong((id *)&self->_unitDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)init:(id)a3 withDictionary:(id)a4
{
  id v5;
  void *v6;
  HAPMetadataUnit *v7;

  v5 = a3;
  objc_msgSend(a4, "hmf_stringForKey:", CFSTR("DefaultDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPMetadataUnit initWithName:description:]([HAPMetadataUnit alloc], "initWithName:description:", v5, v6);

  return v7;
}

@end
