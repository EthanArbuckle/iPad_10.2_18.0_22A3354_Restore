@implementation HAPMetadataProperty

- (HAPMetadataProperty)initWithType:(id)a3 bitPosition:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPMetadataProperty *v11;
  HAPMetadataProperty *v12;
  uint64_t v13;
  NSString *propertyType;
  uint64_t v15;
  HAPMetadataProperty *propertyDescription;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HAPMetadataProperty;
  v11 = -[HAPMetadataProperty init](&v18, sel_init);
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      v13 = objc_msgSend(v8, "copy");
      propertyType = v12->_propertyType;
      v12->_propertyType = (NSString *)v13;

      objc_storeStrong((id *)&v12->_bitPosition, a4);
      v15 = objc_msgSend(v10, "copy");
      propertyDescription = (HAPMetadataProperty *)v12->_propertyDescription;
      v12->_propertyDescription = (NSString *)v15;
    }
    else
    {
      propertyDescription = 0;
    }
  }
  else
  {
    propertyDescription = v11;
    v12 = 0;
  }

  return v12;
}

- (id)generateDictionary
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataProperty bitPosition](self, "bitPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Position"));

  -[HAPMetadataProperty propertyDescription](self, "propertyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("DefaultDescription"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_1E894EFE8, CFSTR("LocalizationKey"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPMetadataProperty propertyType](self, "propertyType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataProperty propertyDescription](self, "propertyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataProperty bitPosition](self, "bitPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Unit %@ - %@ - bit %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dump
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataProperty propertyType](self, "propertyType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataProperty propertyDescription](self, "propertyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataProperty bitPosition](self, "bitPosition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544130;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataProperty %@:  description: %@  bitPosition: %@", (uint8_t *)&v9, 0x2Au);

  }
  objc_autoreleasePoolPop(v3);
}

- (NSString)propertyDescription
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPropertyDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)propertyType
{
  return self->_propertyType;
}

- (void)setPropertyType:(id)a3
{
  objc_storeStrong((id *)&self->_propertyType, a3);
}

- (NSNumber)bitPosition
{
  return self->_bitPosition;
}

- (void)setBitPosition:(id)a3
{
  objc_storeStrong((id *)&self->_bitPosition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitPosition, 0);
  objc_storeStrong((id *)&self->_propertyType, 0);
  objc_storeStrong((id *)&self->_propertyDescription, 0);
}

+ (id)init:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HAPMetadataProperty *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("Position"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("DefaultDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HAPMetadataProperty initWithType:bitPosition:description:]([HAPMetadataProperty alloc], "initWithType:bitPosition:description:", v6, v7, v8);
  return v9;
}

@end
