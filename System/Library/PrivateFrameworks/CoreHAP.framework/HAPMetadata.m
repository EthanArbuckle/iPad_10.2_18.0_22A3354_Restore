@implementation HAPMetadata

- (id)getDefaultCharacteristicMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPMetadataConstraints *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HAPCharacteristicMetadata *v16;
  void *v17;
  void *v18;
  void *v19;
  HAPCharacteristicMetadata *v20;

  v4 = a3;
  -[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minLength");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v7, "maxLength"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v7, "minValue"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v7, "maxValue"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v7, "stepValue");
    v9 = (HAPMetadataConstraints *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_7;
  }
  v9 = objc_alloc_init(HAPMetadataConstraints);
  objc_msgSend(v7, "minValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataConstraints setMinimumValue:](v9, "setMinimumValue:", v10);

  objc_msgSend(v7, "maxValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataConstraints setMaximumValue:](v9, "setMaximumValue:", v11);

  objc_msgSend(v7, "stepValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataConstraints setStepValue:](v9, "setStepValue:", v12);

  objc_msgSend(v7, "minLength");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataConstraints setMinLength:](v9, "setMinLength:", v13);

  objc_msgSend(v7, "maxLength");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataConstraints setMaxLength:](v9, "setMaxLength:", v14);

  objc_msgSend(v7, "validValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataConstraints setValidValues:](v9, "setValidValues:", v15);

LABEL_7:
  v16 = [HAPCharacteristicMetadata alloc];
  objc_msgSend(v6, "chrDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "format");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "units");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HAPCharacteristicMetadata initWithConstraints:description:format:units:](v16, "initWithConstraints:description:format:units:", v9, v17, v18, v19);

  return v20;
}

- (id)hapCharacteristicFromType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)hapCharacteristicMap
{
  return self->_hapCharacteristicMap;
}

+ (id)getSharedInstance
{
  void *v2;

  v2 = (void *)currentMetadataHook;
  if (currentMetadataHook)
  {
    (*(void (**)(void))(currentMetadataHook + 16))();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)getDefaultCharacteristicProperties:(id)a3
{
  void *v3;
  void *v4;

  -[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)characteristicUTIFromType:(id)a3
{
  void *v3;
  void *v4;

  -[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isStandardHAPCharacteristic:(id)a3
{
  void *v3;
  BOOL v4;

  -[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSArray)hapCharacteristics
{
  void *v2;
  void *v3;

  -[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)hapServices
{
  void *v2;
  void *v3;

  -[HAPMetadata hapServiceMap](self, "hapServiceMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)validateMandatoryCharacteristics:(id)a3 forService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  -[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "mandatoryCharacteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v7, "mandatoryCharacteristics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSubsetOfSet:", v8);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)serviceUTIFromType:(id)a3
{
  void *v3;
  void *v4;

  -[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isStandardHAPService:(id)a3
{
  void *v3;
  BOOL v4;

  -[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)hapServiceFromType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAPMetadata hapServiceMap](self, "hapServiceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)hapServiceMap
{
  return self->_hapServiceMap;
}

- (HAPMetadata)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  HAPMetadata *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *v11;
  NSDictionary *rawPlist;
  HAPMetadata *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HAPMetadata;
  v7 = -[HAPMetadata init](&v27, sel_init);
  if (!v7)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadata setParsedUUIDs:](v7, "setParsedUUIDs:", v8);

  if (!-[HAPMetadata parseVersion:](v7, "parseVersion:", v6))
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse version information", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    if (!a4)
      goto LABEL_21;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 1001;
    goto LABEL_15;
  }
  -[HAPMetadata schemaVersion](v7, "schemaVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v10 != 1)
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMetadata schemaVersion](v7, "schemaVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v32 = 2048;
      v33 = 1;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Newer schema version %@, current %lu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    if (!a4)
      goto LABEL_21;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 1004;
LABEL_15:
    objc_msgSend(v17, "errorWithHMErrorCode:", v18);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("HAP"));
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (!-[HAPMetadata parseMetadata:](v7, "parseMetadata:", v11))
  {
    v23 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v25;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP metadata", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 1001);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  -[HAPMetadata setParsedUUIDs:](v7, "setParsedUUIDs:", 0);
  rawPlist = v7->_rawPlist;
  v7->_rawPlist = v11;

LABEL_6:
  v13 = v7;
LABEL_22:

  return v13;
}

- (BOOL)parseVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("Version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadata setVersion:](self, "setVersion:", v5);

  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("SchemaVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPMetadata setSchemaVersion:](self, "setSchemaVersion:", v6);
  -[HAPMetadata version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HAPMetadata schemaVersion](self, "schemaVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)parseUnits:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  HAPMetadataUnit *v13;
  HAPMetadataUnit *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "hmf_dictionaryForKey:", v10, (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hmf_stringForKey:", CFSTR("DefaultDescription"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HAPMetadataUnit initWithName:description:]([HAPMetadataUnit alloc], "initWithName:description:", v10, v12);
        if (!v13)
        {
          v16 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v25 = v18;
            v26 = 2112;
            v27 = v10;
            v28 = 2112;
            v29 = v12;
            _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP unit %@  description %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v16);

          v15 = 0;
          goto LABEL_13;
        }
        v14 = v13;
        objc_msgSend(v4, "setObject:forKey:", v13, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v7)
        continue;
      break;
    }
  }

  v15 = (void *)objc_msgSend(v4, "copy");
LABEL_13:

  return v15;
}

- (id)parseProperties:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HAPMetadataProperty *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v23)
  {
    v7 = *(_QWORD *)v25;
    *(_QWORD *)&v6 = 138544130;
    v20 = v6;
    v21 = v5;
    v22 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v5, "hmf_dictionaryForKey:", v9, v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmf_numberForKey:", CFSTR("Position"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmf_stringForKey:", CFSTR("DefaultDescription"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HAPMetadataProperty initWithType:bitPosition:description:]([HAPMetadataProperty alloc], "initWithType:bitPosition:description:", v9, v11, v12);
        if (v13)
        {
          objc_msgSend(v4, "setObject:forKey:", v13, v9);
        }
        else
        {
          v14 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v16 = v4;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v29 = v17;
            v30 = 2112;
            v31 = v9;
            v32 = 2112;
            v33 = v11;
            v34 = 2112;
            v35 = v12;
            _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP property %@  bitPosition %@ description %@", buf, 0x2Au);

            v4 = v16;
            v5 = v21;
          }

          objc_autoreleasePoolPop(v14);
          v7 = v22;
        }

        if (!v13)
        {

          v18 = 0;
          goto LABEL_16;
        }
      }
      v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v23)
        continue;
      break;
    }
  }

  v18 = (void *)objc_msgSend(v4, "copy");
LABEL_16:

  return v18;
}

- (id)parseCharacteristicValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  HAPMetadataCharacteristicValue *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HAPMetadataCharacteristicValue *v13;
  void *v15;
  void *context;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MinLength"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MaxLength"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
    v6 = -[HAPMetadataCharacteristicValue initWithMinLength:maxLength:]([HAPMetadataCharacteristicValue alloc], "initWithMinLength:maxLength:", v4, v5);
  else
    v6 = 0;
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MinValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MaxValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("StepValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("ValidValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || v8 || v9)
  {
    if (v6)
    {
      context = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "hmf_stringForKey:", CFSTR("ShortUUID"));
        *(_DWORD *)buf = 138544898;
        v18 = v15;
        v19 = 2112;
        v20 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v20;
        v21 = 2112;
        v22 = v4;
        v23 = 2112;
        v24 = v5;
        v25 = 2112;
        v26 = v7;
        v27 = 2112;
        v28 = v5;
        v29 = 2112;
        v30 = v9;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has both length and value metadata: minLength %@  maxLength %@  minValue %@  maxValue %@  stepValue %@", buf, 0x48u);

      }
      objc_autoreleasePoolPop(context);
    }
    v13 = -[HAPMetadataCharacteristicValue initWithMinValue:maxValue:stepValue:validValues:]([HAPMetadataCharacteristicValue alloc], "initWithMinValue:maxValue:stepValue:validValues:", v7, v8, v9, v10);

    v6 = v13;
  }

  return v6;
}

- (id)parseCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  HAPMetadataCharacteristic *v24;
  uint64_t v25;
  void *v26;
  HAPMetadataCharacteristic *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  __int128 v42;
  void *v43;
  void *context;
  void *v45;
  void *v46;
  HAPMetadata *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = v4;
  v49 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v54;
    *(_QWORD *)&v8 = 138544130;
    v42 = v8;
    v45 = v6;
    v46 = v5;
    v47 = self;
    v48 = v7;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v50)
        objc_enumerationMutation(v7);
      v10 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v9);
      objc_msgSend(v7, "hmf_dictionaryForKey:", v10, v42);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_stringForKey:", CFSTR("ShortUUID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      if (v13 != kMetadataShortUUIDLength)
        break;
      -[HAPMetadata parsedUUIDs](self, "parsedUUIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v12);

      if (v15)
      {
        v35 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = v37;
          v59 = 2112;
          v60 = v10;
          v61 = 2112;
          v62 = v12;
          v38 = "%{public}@characteristic %@: UUID %@ is already defined in the metadata";
          v39 = v36;
          v40 = 32;
LABEL_23:
          _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);

        }
        goto LABEL_24;
      }
      -[HAPMetadata parsedUUIDs](self, "parsedUUIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v12);

      objc_msgSend(v11, "hmf_stringForKey:", CFSTR("DefaultDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_stringForKey:", CFSTR("Format"));
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_numberForKey:", CFSTR("Properties"));
      v19 = v12;
      v20 = objc_claimAutoreleasedReturnValue();
      -[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v19;
      objc_msgSend(v19, "stringByAppendingString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hmf_stringWithSmallestEncoding");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = [HAPMetadataCharacteristic alloc];
      v52 = (void *)v18;
      v25 = v18;
      v26 = (void *)v20;
      v27 = -[HAPMetadataCharacteristic initWithName:uuid:description:format:properties:](v24, "initWithName:uuid:description:format:properties:", v10, v23, v17, v25, v20);
      objc_msgSend(v11, "hmf_stringForKey:", CFSTR("Units"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMetadataCharacteristic setUnits:](v27, "setUnits:", v28);

      -[HAPMetadata parseCharacteristicValue:](self, "parseCharacteristicValue:", v11);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if (v29)
        v29 = -[HAPMetadataCharacteristic setValueMetadata:](v27, "setValueMetadata:", v29);
      if (v27)
      {
        objc_msgSend(v46, "setObject:forKey:", v27, v23);
        objc_msgSend(v45, "setObject:forKey:", v23, v10);
        v31 = v51;
      }
      else
      {
        context = (void *)MEMORY[0x1D17B7244](v29);
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        v31 = v51;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v42;
          v58 = v43;
          v59 = 2112;
          v60 = v10;
          v61 = 2112;
          v62 = v51;
          v63 = 2112;
          v64 = (uint64_t)v17;
          _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%{public}@characteristic %@: Failed to parse - UUID %@  description %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(context);
      }

      v7 = v48;
      if (!v27)
        goto LABEL_25;
      ++v9;
      self = v47;
      if (v49 == v9)
      {
        v6 = v45;
        v5 = v46;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
        if (v49)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    v35 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v42;
      v58 = v37;
      v59 = 2112;
      v60 = v10;
      v61 = 2112;
      v62 = v12;
      v63 = 2048;
      v64 = kMetadataShortUUIDLength;
      v38 = "%{public}@characteristic %@: UUID '%@' length needs to be %lu";
      v39 = v36;
      v40 = 42;
      goto LABEL_23;
    }
LABEL_24:

    objc_autoreleasePoolPop(v35);
LABEL_25:

    v34 = 0;
    v6 = v45;
    v5 = v46;
    goto LABEL_26;
  }
LABEL_18:

  v33 = (void *)objc_msgSend(v6, "copy");
  -[HAPMetadata setHapCharacteristicNameTypeMap:](self, "setHapCharacteristicNameTypeMap:", v33);

  v34 = (void *)objc_msgSend(v5, "copy");
LABEL_26:

  return v34;
}

- (id)parseServiceCharacteristics:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[HAPMetadata characteristicTypeFromUTI:](self, "characteristicTypeFromUTI:", v11, (_QWORD)v19);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v15 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v24 = v17;
            v25 = 2112;
            v26 = v11;
            _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@Undefined characteristic %@ referenced", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);

          v14 = 0;
          goto LABEL_13;
        }
        v13 = (void *)v12;
        objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = (void *)objc_msgSend(v5, "copy");
LABEL_13:

  return v14;
}

- (id)parseServices:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HAPMetadataService *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  const char *v65;
  NSObject *v66;
  uint32_t v67;
  __int128 v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  HAPMetadata *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  uint64_t v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v9 = v4;
    v74 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    if (v74)
    {
      v75 = *(_QWORD *)v84;
      *(_QWORD *)&v10 = 138543874;
      v69 = v10;
      v72 = v7;
      v73 = v9;
      v76 = self;
      v70 = v4;
      v71 = v8;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v84 != v75)
          objc_enumerationMutation(v9);
        v82 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v11);
        objc_msgSend(v9, "hmf_dictionaryForKey:", v69);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_stringForKey:", CFSTR("ShortUUID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");
        if (v14 != kMetadataShortUUIDLength)
        {
          v62 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v88 = v64;
            v89 = 2112;
            v90 = v82;
            v91 = 2112;
            v92 = v13;
            v93 = 2048;
            v94 = kMetadataShortUUIDLength;
            v65 = "%{public}@service %@: UUID '%@' length needs to be %lu";
            v66 = v63;
            v67 = 42;
            goto LABEL_48;
          }
LABEL_49:

          objc_autoreleasePoolPop(v62);
LABEL_50:

          v58 = 0;
          v4 = v70;
          v8 = v71;
          v7 = v72;
          goto LABEL_51;
        }
        -[HAPMetadata parsedUUIDs](self, "parsedUUIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v13);

        if (v16)
        {
          v62 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v69;
            v88 = v64;
            v89 = 2112;
            v90 = v82;
            v91 = 2112;
            v92 = v13;
            v65 = "%{public}@service %@: UUID %@ is already defined in the metadata";
            v66 = v63;
            v67 = 32;
LABEL_48:
            _os_log_impl(&dword_1CCE01000, v66, OS_LOG_TYPE_ERROR, v65, buf, v67);

          }
          goto LABEL_49;
        }
        -[HAPMetadata parsedUUIDs](self, "parsedUUIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v13);

        objc_msgSend(v12, "hmf_stringForKey:", CFSTR("DefaultDescription"));
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_dictionaryForKey:", CFSTR("Characteristics"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "hmf_arrayForKey:", CFSTR("Required"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadata parseServiceCharacteristics:](self, "parseServiceCharacteristics:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = v13;
        v81 = v21;
        if (!objc_msgSend(v21, "count"))
        {
          v40 = v9;
          v41 = (void *)v18;
          v42 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v88 = v44;
            v89 = 2112;
            v90 = v82;
            _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_ERROR, "%{public}@service %@: No mandatory characteristics", buf, 0x16u);

            self = v76;
          }

          objc_autoreleasePoolPop(v42);
          v45 = 1;
          v46 = v41;
          v9 = v40;
          v31 = v19;
          v47 = v21;
          goto LABEL_37;
        }
        objc_msgSend(v12, "hmf_numberForKey:", CFSTR("ServiceProperties"));
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_arrayForKey:", CFSTR("LinkedServices"));
        v23 = objc_claimAutoreleasedReturnValue();
        -[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "hmf_stringWithSmallestEncoding");
        v26 = v21;
        v27 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v27;
        v78 = (void *)v22;
        v79 = (void *)v18;
        v77 = (void *)v23;
        v29 = -[HAPMetadataService initWithName:uuid:description:mandatoryChrTypes:properties:linkedServices:]([HAPMetadataService alloc], "initWithName:uuid:description:mandatoryChrTypes:properties:linkedServices:", v82, v27, v18, v26, v22, v23);
        if (v29)
          break;
        v45 = 1;
        self = v76;
        v9 = v73;
        v31 = v19;
        v38 = v28;
LABEL_36:

        v47 = v81;
        v46 = v79;
LABEL_37:

        if (v45)
          goto LABEL_50;
        if (v74 == ++v11)
        {
          v4 = v70;
          v8 = v71;
          v7 = v72;
          v74 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
          if (v74)
            goto LABEL_4;
          goto LABEL_40;
        }
      }
      objc_msgSend(v12, "hmf_stringForKey:", CFSTR("BTLE_ShortUUID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v19;
      v32 = v30;
      if (v30)
      {
        v33 = objc_msgSend(v30, "length");
        if (v33 != kMetadataBTLEUUIDLength)
        {
          v36 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v28;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v88 = v48;
            v89 = 2112;
            v90 = v82;
            v91 = 2112;
            v92 = v32;
            v93 = 2048;
            v94 = kMetadataBTLEUUIDLength;
            _os_log_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_ERROR, "%{public}@service %@: BTLE UUID '%@' length needs to be %lu", buf, 0x2Au);

          }
          goto LABEL_22;
        }
        -[HAPMetadata parsedUUIDs](v76, "parsedUUIDs");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "containsObject:", v32);

        if (v35)
        {
          v36 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v28;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v69;
            v88 = v39;
            v89 = 2112;
            v90 = v82;
            v91 = 2112;
            v92 = v32;
            _os_log_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_ERROR, "%{public}@service %@: BTLE UUID %@ is already defined in the metadata", buf, 0x20u);

          }
LABEL_22:

          objc_autoreleasePoolPop(v36);
          v45 = 1;
          v9 = v73;
LABEL_35:

          self = v76;
          goto LABEL_36;
        }
        -[HAPMetadata parsedUUIDs](v76, "parsedUUIDs");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObject:", v32);

        -[HAPMetadataService setBtleuuidStr:](v29, "setBtleuuidStr:", v32);
      }
      objc_msgSend(v31, "hmf_arrayForKey:", CFSTR("Optional"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMetadata parseServiceCharacteristics:](v76, "parseServiceCharacteristics:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v28;
      if (v51)
      {
        if (objc_msgSend(v51, "count"))
          -[HAPMetadataService setOptionalCharacteristics:](v29, "setOptionalCharacteristics:", v51);
        buf[0] = 0;
        v52 = objc_msgSend(v12, "hmf_BOOLForKey:isPresent:", CFSTR("AllowAssociatedService"), buf);
        if (buf[0])
          v53 = v52;
        else
          v53 = 0;
        -[HAPMetadataService setAllowAssociatedService:](v29, "setAllowAssociatedService:", v53);
        objc_msgSend(v72, "setObject:forKey:", v29, v28);
        objc_msgSend(v71, "setObject:forKey:", v28, v82);
        v45 = 0;
      }
      else
      {
        v54 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v88 = v56;
          v89 = 2112;
          v90 = v82;
          _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_ERROR, "%{public}@service %@: Error parsing optional characteristics", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v54);
        v45 = 1;
      }
      v9 = v73;

      goto LABEL_35;
    }
LABEL_40:

    v57 = (void *)objc_msgSend(v8, "copy");
    -[HAPMetadata setHapServiceNameTypeMap:](self, "setHapServiceNameTypeMap:", v57);

    v58 = (void *)objc_msgSend(v7, "copy");
LABEL_51:

  }
  else
  {
    v59 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v88 = v61;
      _os_log_impl(&dword_1CCE01000, v60, OS_LOG_TYPE_ERROR, "%{public}@No HAP characteristics", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v59);
    v58 = 0;
  }

  return v58;
}

- (id)parseCharacteristicServiceTuples:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  HAPMetadataTuple *v24;
  HAPMetadataTuple *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (!v7)
  {
LABEL_18:

    v26 = (void *)objc_msgSend(v5, "copy");
    goto LABEL_27;
  }
  v8 = v7;
  v9 = *(_QWORD *)v47;
LABEL_3:
  v10 = 0;
LABEL_4:
  if (*(_QWORD *)v47 != v9)
    objc_enumerationMutation(v6);
  v11 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v10);
  -[HAPMetadata characteristicTypeFromUTI:](self, "characteristicTypeFromUTI:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v40 = v11;
    objc_msgSend(v6, "hmf_arrayForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    if (!v16)
      goto LABEL_16;
    v17 = v16;
    v18 = *(_QWORD *)v43;
    v41 = v6;
    v38 = v8;
    v39 = v9;
    v37 = v10;
LABEL_9:
    v19 = 0;
    while (1)
    {
      v20 = v5;
      if (*(_QWORD *)v43 != v18)
        objc_enumerationMutation(v15);
      v21 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v19);
      -[HAPMetadata serviceTypeFromUTI:](self, "serviceTypeFromUTI:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        break;
      v23 = (void *)v22;
      v24 = -[HAPMetadataTuple initWithCharacteristicType:serviceType:]([HAPMetadataTuple alloc], "initWithCharacteristicType:serviceType:", v13, v22);
      if (!v24)
      {
        v30 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = v32;
          v52 = 2112;
          v53 = v40;
          v54 = 2112;
          v55 = v21;
          _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP metadata tuple %@,%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v30);

LABEL_25:
        v6 = v41;

        v5 = v20;
        goto LABEL_26;
      }
      v25 = v24;
      v5 = v20;
      objc_msgSend(v20, "addObject:", v24);

      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        v6 = v41;
        v8 = v38;
        v9 = v39;
        v10 = v37;
        if (v17)
          goto LABEL_9;
LABEL_16:

        if (++v10 == v8)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
          if (!v8)
            goto LABEL_18;
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
    v27 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v29;
      v52 = 2112;
      v53 = v21;
      _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unknown service '%@' while parsing tuple", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    goto LABEL_25;
  }
  v34 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v36;
    v52 = 2112;
    v53 = v11;
    _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unknown characteristic '%@' while parsing tuple", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v34);
LABEL_26:

  v26 = 0;
LABEL_27:

  return v26;
}

- (BOOL)parseMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *context;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("Base UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v19;
      v20 = "%{public}@Failed to parse HAP base UUID suffix";
      v21 = v18;
      v22 = 12;
LABEL_13:
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);

    }
LABEL_14:

    objc_autoreleasePoolPop(v17);
    v16 = 0;
    goto LABEL_35;
  }
  v7 = objc_msgSend(v5, "length");
  if (v7 != kMetadataBaseUUIDSuffixLength)
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v19;
      v48 = 2048;
      v49 = objc_msgSend(v6, "length");
      v50 = 2048;
      v51 = kMetadataBaseUUIDSuffixLength;
      v20 = "%{public}@Base UUID suffix length is %lu, should be %lu";
      v21 = v18;
      v22 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  -[HAPMetadata setHapBaseUUIDSuffix:](self, "setHapBaseUUIDSuffix:", v6);
  objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Units"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadata parseUnits:](self, "parseUnits:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HAPMetadata setHapUnitMap:](self, "setHapUnitMap:", v9);
    objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Properties"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadata parseProperties:](self, "parseProperties:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HAPMetadata setHapPropertyMap:](self, "setHapPropertyMap:", v11);
      objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Characteristics"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMetadata parseCharacteristics:](self, "parseCharacteristics:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[HAPMetadata setHapCharacteristicMap:](self, "setHapCharacteristicMap:", v13);
        objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Services"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadata parseServices:](self, "parseServices:");
        v14 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v14;
        if (v14)
        {
          v41 = v12;
          -[HAPMetadata setHapServiceMap:](self, "setHapServiceMap:", v14);
          objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("SupportsAuthorizationData"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPMetadata parseCharacteristicServiceTuples:](self, "parseCharacteristicServiceTuples:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 != 0;
          if (v15)
          {
            -[HAPMetadata setHapSupportsAuthDataSet:](self, "setHapSupportsAuthDataSet:", v15);
          }
          else
          {
            context = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v47 = v38;
              v48 = 2112;
              v49 = (uint64_t)v40;
              _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP addAuthData tuples: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
          }

          v12 = v41;
        }
        else
        {
          v33 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v42 = v12;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v47 = v35;
            v48 = 2112;
            v49 = (uint64_t)v44;
            _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP services: %@", buf, 0x16u);

            v12 = v42;
          }

          objc_autoreleasePoolPop(v33);
          v16 = 0;
        }

      }
      else
      {
        v29 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = v29;
          v31 = v12;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v32;
          v48 = 2112;
          v49 = (uint64_t)v31;
          _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP characteristics: %@", buf, 0x16u);

          v12 = v31;
          v29 = v45;
        }

        objc_autoreleasePoolPop(v29);
        v16 = 0;
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v28;
        v48 = 2112;
        v49 = (uint64_t)v10;
        _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP properties: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v16 = 0;
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v25;
      v48 = 2112;
      v49 = (uint64_t)v8;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP units: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    v16 = 0;
  }

LABEL_35:
  return v16;
}

- (id)serviceTypeFromUTI:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAPMetadata hapServiceNameTypeMap](self, "hapServiceNameTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)characteristicTypeFromUTI:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAPMetadata hapCharacteristicNameTypeMap](self, "hapCharacteristicNameTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isStandardHAPServiceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAPMetadata hapServiceNameTypeMap](self, "hapServiceNameTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)isStandardHAPCharacteristicName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAPMetadata hapCharacteristicNameTypeMap](self, "hapCharacteristicNameTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)isStandardHAPUnitName:(id)a3
{
  void *v3;
  BOOL v4;

  -[HAPMetadata hapUnitFromName:](self, "hapUnitFromName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)allowAssociatedService:(id)a3
{
  void *v3;
  char v4;

  -[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowAssociatedService");

  return v4;
}

- (id)descriptionFromServiceType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "svcDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = v4;

  return v6;
}

- (id)descriptionFromCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chrDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = v4;

  return v6;
}

- (BOOL)isMandatoryCharacteristic:(id)a3 forService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "mandatoryCharacteristics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)characteristicValueUnitOfType:(id)a3
{
  void *v3;
  void *v4;

  -[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "units");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)btleToServiceType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("-0000-1000-8000-00805F9B34FB")))
  {
    v5 = objc_msgSend(v4, "length");
    if (v5 == objc_msgSend(CFSTR("00000000-0000-1000-8000-00805F9B34FB"), "length"))
    {
      objc_msgSend(v4, "substringWithRange:", 4, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;

        v4 = v8;
      }

    }
  }
  -[HAPMetadata hapServiceMap](self, "hapServiceMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_firstObjectWithValue:forKeyPath:", v4, CFSTR("btleuuidStr"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "uuidStr");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)serviceTypeToBTLE:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "btleuuidStr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "btleuuidStr");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (BOOL)supportsAdditionalAuthorizationData:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  HAPMetadataTuple *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[HAPMetadataTuple initWithCharacteristicType:serviceType:]([HAPMetadataTuple alloc], "initWithCharacteristicType:serviceType:", v7, v6);

  -[HAPMetadata hapSupportsAuthDataSet](self, "hapSupportsAuthDataSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "containsObject:", v8);

  return (char)self;
}

- (id)getDefaultServiceProperties:(id)a3
{
  void *v3;
  void *v4;

  -[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)characteristicTypesChangingTargetState
{
  if (characteristicTypesChangingTargetState_onceToken != -1)
    dispatch_once(&characteristicTypesChangingTargetState_onceToken, &__block_literal_global_15786);
  return (id)characteristicTypesChangingTargetState_characteristicTypes;
}

- (id)hapCharacteristicFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadata hapCharacteristicNameTypeMap](self, "hapCharacteristicNameTypeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hapServiceFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HAPMetadata hapServiceMap](self, "hapServiceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadata hapServiceNameTypeMap](self, "hapServiceNameTypeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hapUnitFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAPMetadata hapUnitMap](self, "hapUnitMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)hapValueUnits
{
  void *v2;
  void *v3;

  -[HAPMetadata hapUnitMap](self, "hapUnitMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)hapProperties
{
  void *v2;
  void *v3;

  -[HAPMetadata hapPropertyMap](self, "hapPropertyMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)hapSupportsAuthDataTuples
{
  void *v2;
  void *v3;

  -[HAPMetadata hapSupportsAuthDataSet](self, "hapSupportsAuthDataSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HAPMetadata)initWithServices:(id)a3 characteristics:(id)a4 units:(id)a5 properties:(id)a6 addAuthDataTuples:(id)a7 hapBaseUUIDSuffix:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *hapCharacteristicMap;
  uint64_t v30;
  NSDictionary *hapCharacteristicNameTypeMap;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSDictionary *hapServiceMap;
  uint64_t v43;
  NSDictionary *hapServiceNameTypeMap;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  uint64_t v52;
  NSDictionary *hapUnitMap;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  HAPMetadataTuple *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HAPMetadataTuple *v65;
  uint64_t v66;
  NSSet *hapSupportsAuthDataSet;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t n;
  void *v74;
  void *v75;
  uint64_t v76;
  NSDictionary *hapPropertyMap;
  uint64_t v78;
  NSString *hapBaseUUIDSuffix;
  void *v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  HAPMetadata *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  objc_super v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!objc_msgSend(v13, "count")
    || !objc_msgSend(v14, "count")
    || !objc_msgSend(v15, "count")
    || !objc_msgSend(v16, "count")
    || !objc_msgSend(v17, "count"))
  {
    goto LABEL_44;
  }
  v113.receiver = self;
  v113.super_class = (Class)HAPMetadata;
  v92 = -[HAPMetadata init](&v113, sel_init);
  if (!v92)
  {
    self = 0;
LABEL_44:
    v92 = 0;
    goto LABEL_45;
  }
  v81 = v18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
  self = (HAPMetadata *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v84 = v14;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v110 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        objc_msgSend(v24, "uuidStr");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadata setObject:forKey:](self, "setObject:forKey:", v24, v25);

        objc_msgSend(v24, "uuidStr");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "setObject:forKey:", v26, v27);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
    }
    while (v21);
  }

  v28 = -[HAPMetadata copy](self, "copy");
  hapCharacteristicMap = v92->_hapCharacteristicMap;
  v92->_hapCharacteristicMap = (NSDictionary *)v28;

  v30 = objc_msgSend(v90, "copy");
  hapCharacteristicNameTypeMap = v92->_hapCharacteristicNameTypeMap;
  v92->_hapCharacteristicNameTypeMap = (NSDictionary *)v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v32 = v13;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v106;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v106 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
        objc_msgSend(v37, "uuidStr");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setObject:forKey:", v37, v38);

        objc_msgSend(v37, "uuidStr");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setObject:forKey:", v39, v40);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
    }
    while (v34);
  }

  v41 = objc_msgSend(v89, "copy");
  hapServiceMap = v92->_hapServiceMap;
  v92->_hapServiceMap = (NSDictionary *)v41;

  v43 = objc_msgSend(v88, "copy");
  hapServiceNameTypeMap = v92->_hapServiceNameTypeMap;
  v92->_hapServiceNameTypeMap = (NSDictionary *)v43;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v45 = v15;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v47; ++k)
      {
        if (*(_QWORD *)v102 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
        objc_msgSend(v50, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setObject:forKey:", v50, v51);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
    }
    while (v47);
  }
  v83 = v16;
  v85 = v13;

  v52 = objc_msgSend(v87, "copy");
  hapUnitMap = v92->_hapUnitMap;
  v92->_hapUnitMap = (NSDictionary *)v52;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v17, "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v82 = v17;
  v54 = v17;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v98;
    do
    {
      for (m = 0; m != v56; ++m)
      {
        if (*(_QWORD *)v98 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * m);
        v60 = [HAPMetadataTuple alloc];
        objc_msgSend(v59, "characteristicType");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadata characteristicTypeFromUTI:](v92, "characteristicTypeFromUTI:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "serviceType");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadata serviceTypeFromUTI:](v92, "serviceTypeFromUTI:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = -[HAPMetadataTuple initWithCharacteristicType:serviceType:](v60, "initWithCharacteristicType:serviceType:", v62, v64);

        objc_msgSend(v86, "addObject:", v65);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
    }
    while (v56);
  }

  v66 = objc_msgSend(v86, "copy");
  hapSupportsAuthDataSet = v92->_hapSupportsAuthDataSet;
  v92->_hapSupportsAuthDataSet = (NSSet *)v66;

  v16 = v83;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v83, "count"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v69 = v83;
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
  v17 = v82;
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v94;
    do
    {
      for (n = 0; n != v71; ++n)
      {
        if (*(_QWORD *)v94 != v72)
          objc_enumerationMutation(v69);
        v74 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * n);
        objc_msgSend(v74, "propertyType");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:forKey:", v74, v75);

      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
    }
    while (v71);
  }

  v76 = objc_msgSend(v68, "copy");
  hapPropertyMap = v92->_hapPropertyMap;
  v92->_hapPropertyMap = (NSDictionary *)v76;

  v18 = v81;
  v78 = objc_msgSend(v81, "copy");
  hapBaseUUIDSuffix = v92->_hapBaseUUIDSuffix;
  v92->_hapBaseUUIDSuffix = (NSString *)v78;

  -[HAPMetadata updateRawPlist](v92, "updateRawPlist");
  v14 = v84;
  v13 = v85;
LABEL_45:

  return v92;
}

- (BOOL)updateRawPlist
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HAPMetadata generateDictionary](self, "generateDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_storeStrong((id *)&self->_rawPlist, v3);
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate plist.", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

  return v3 != 0;
}

- (id)generateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Base UUID"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[HAPMetadata hapValueUnits](self, "hapValueUnits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v78 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(v12, "generateDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Units"));
  v60 = v3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[HAPMetadata hapProperties](self, "hapProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
  v63 = v6;
  v61 = v15;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v74 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        objc_msgSend(v21, "generateDictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v21, "propertyType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);

        }
        else
        {
          v24 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "propertyType");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v84 = v26;
            v85 = 2112;
            v86 = v27;
            _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP property %@", buf, 0x16u);

            v15 = v61;
          }

          objc_autoreleasePoolPop(v24);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v60, "setObject:forKeyedSubscript:", v15, CFSTR("Properties"));
  -[HAPMetadata hapSupportsAuthDataSet](self, "hapSupportsAuthDataSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadata generateHAPMetadataTuplesDictionary:](self, "generateHAPMetadataTuplesDictionary:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v29, "count"))
    objc_msgSend(v60, "setObject:forKeyedSubscript:", v29, CFSTR("SupportsAuthorizationData"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[HAPMetadata hapCharacteristics](self, "hapCharacteristics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
  v62 = v30;
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v70 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
        -[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "generateDictionary:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v36, "name");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, v39);

        }
        else
        {
          v40 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "name");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v84 = v42;
            v85 = 2112;
            v86 = v43;
            _os_log_impl(&dword_1CCE01000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP characteristic %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v40);
          v30 = v62;
        }

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    }
    while (v33);
  }

  if (objc_msgSend(v30, "count"))
    objc_msgSend(v60, "setObject:forKeyedSubscript:", v30, CFSTR("Characteristics"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[HAPMetadata hapServices](self, "hapServices");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
  v46 = v63;
  if (v45)
  {
    v47 = v45;
    v48 = *(_QWORD *)v66;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v66 != v48)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * m);
        -[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "generateDictionary:metadata:", v51, self);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          objc_msgSend(v50, "name");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v52, v53);

        }
        else
        {
          v54 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "name");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v84 = v56;
            v85 = 2112;
            v86 = v57;
            _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP service %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v54);
          v46 = v63;
        }

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    }
    while (v47);
  }

  if (objc_msgSend(v44, "count"))
    objc_msgSend(v60, "setObject:forKeyedSubscript:", v44, CFSTR("Services"));

  return v60;
}

- (id)generateHAPMetadataTuplesDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "characteristicType", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadata characteristicUTIFromType:](self, "characteristicUTIFromType:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "serviceType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadata serviceUTIFromType:](self, "serviceUTIFromType:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v13);
        }
        objc_msgSend(v16, "addObject:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(id)a3
{
  objc_storeStrong((id *)&self->_schemaVersion, a3);
}

- (NSString)hapBaseUUIDSuffix
{
  return self->_hapBaseUUIDSuffix;
}

- (void)setHapBaseUUIDSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_hapBaseUUIDSuffix, a3);
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (NSMutableArray)parsedUUIDs
{
  return self->_parsedUUIDs;
}

- (void)setParsedUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_parsedUUIDs, a3);
}

- (NSDictionary)hapUnitMap
{
  return self->_hapUnitMap;
}

- (void)setHapUnitMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapUnitMap, a3);
}

- (NSDictionary)hapPropertyMap
{
  return self->_hapPropertyMap;
}

- (void)setHapPropertyMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapPropertyMap, a3);
}

- (void)setHapCharacteristicMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapCharacteristicMap, a3);
}

- (void)setHapServiceMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapServiceMap, a3);
}

- (NSSet)hapSupportsAuthDataSet
{
  return self->_hapSupportsAuthDataSet;
}

- (void)setHapSupportsAuthDataSet:(id)a3
{
  objc_storeStrong((id *)&self->_hapSupportsAuthDataSet, a3);
}

- (NSDictionary)hapCharacteristicNameTypeMap
{
  return self->_hapCharacteristicNameTypeMap;
}

- (void)setHapCharacteristicNameTypeMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapCharacteristicNameTypeMap, a3);
}

- (NSDictionary)hapServiceNameTypeMap
{
  return self->_hapServiceNameTypeMap;
}

- (void)setHapServiceNameTypeMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapServiceNameTypeMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapServiceNameTypeMap, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicNameTypeMap, 0);
  objc_storeStrong((id *)&self->_hapSupportsAuthDataSet, 0);
  objc_storeStrong((id *)&self->_hapServiceMap, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicMap, 0);
  objc_storeStrong((id *)&self->_hapPropertyMap, 0);
  objc_storeStrong((id *)&self->_hapUnitMap, 0);
  objc_storeStrong((id *)&self->_parsedUUIDs, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_hapBaseUUIDSuffix, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

void __53__HAPMetadata_characteristicTypesChangingTargetState__block_invoke()
{
  void *v0;

  v0 = (void *)characteristicTypesChangingTargetState_characteristicTypes;
  characteristicTypesChangingTargetState_characteristicTypes = (uint64_t)&unk_1E8989BA0;

}

+ (id)currentMetadataHook
{
  return (id)MEMORY[0x1D17B7400](currentMetadataHook, a2);
}

+ (void)setCurrentMetadataHook:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x1D17B7400](a3, a2);
  v4 = (void *)currentMetadataHook;
  currentMetadataHook = v3;

}

+ (id)shortenHAPType:(id)a3 baseUUIDSuffix:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasSuffix:", v6))
  {
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v6, "length"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

@end
