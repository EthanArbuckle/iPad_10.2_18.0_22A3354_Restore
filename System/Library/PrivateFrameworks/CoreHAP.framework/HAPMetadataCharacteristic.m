@implementation HAPMetadataCharacteristic

- (NSString)chrDescription
{
  return self->_chrDescription;
}

- (HAPMetadataCharacteristicValue)valueMetadata
{
  return self->_valueMetadata;
}

- (NSString)units
{
  return self->_units;
}

- (NSNumber)properties
{
  return self->_properties;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (HAPMetadataCharacteristic)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 format:(id)a6 properties:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  v18 = 0;
  if (v12 && v13 && v14 && v15 && v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)HAPMetadataCharacteristic;
    v18 = -[HAPMetadataCharacteristic init](&v29, sel_init);
    if (v18)
    {
      v19 = objc_msgSend(v12, "copy");
      v20 = (void *)*((_QWORD *)v18 + 1);
      *((_QWORD *)v18 + 1) = v19;

      v21 = objc_msgSend(v13, "copy");
      v22 = (void *)*((_QWORD *)v18 + 3);
      *((_QWORD *)v18 + 3) = v21;

      v23 = objc_msgSend(v14, "copy");
      v24 = (void *)*((_QWORD *)v18 + 2);
      *((_QWORD *)v18 + 2) = v23;

      v25 = objc_msgSend(v15, "copy");
      v26 = (void *)*((_QWORD *)v18 + 5);
      *((_QWORD *)v18 + 5) = v25;

      v27 = v17;
      self = (HAPMetadataCharacteristic *)*((_QWORD *)v18 + 4);
      *((_QWORD *)v18 + 4) = v27;
    }
    else
    {
      self = 0;
    }
  }

  return (HAPMetadataCharacteristic *)v18;
}

- (id)generateDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataCharacteristic uuidStr](self, "uuidStr");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPMetadata shortenHAPType:baseUUIDSuffix:](HAPMetadata, "shortenHAPType:baseUUIDSuffix:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("ShortUUID"));
  -[HAPMetadataCharacteristic chrDescription](self, "chrDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("DefaultDescription"));

  -[HAPMetadataCharacteristic format](self, "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("Format"));

  -[HAPMetadataCharacteristic properties](self, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("Properties"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &stru_1E894EFE8, CFSTR("LocalizationKey"));
  -[HAPMetadataCharacteristic units](self, "units");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HAPMetadataCharacteristic units](self, "units");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("Units"));

  }
  -[HAPMetadataCharacteristic valueMetadata](self, "valueMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "generateDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v15);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPMetadataCharacteristic name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataCharacteristic uuidStr](self, "uuidStr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataCharacteristic chrDescription](self, "chrDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataCharacteristic format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataCharacteristic properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HAPMetadataCharacteristic %@(%@) - %@ - format %@, properties %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)dump
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataCharacteristic name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataCharacteristic uuidStr](self, "uuidStr");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataCharacteristic chrDescription](self, "chrDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataCharacteristic format](self, "format");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataCharacteristic properties](self, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataCharacteristic units](self, "units");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544898;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataCharacteristic %@(%@):  description: %@  format: %@  properties: %@  units:%@", (uint8_t *)&v12, 0x48u);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setChrDescription:(id)a3
{
  objc_storeStrong((id *)&self->_chrDescription, a3);
}

- (void)setUuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_uuidStr, a3);
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_chrDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
