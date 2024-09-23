@implementation HMHAPMetadata

- (id)serviceTypeDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v4 = a3;
  -[HMHAPMetadata hapSvcMap](self, "hapSvcMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "svcDescription");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = CFSTR("Custom");
  v9 = v7;

  return v9;
}

- (NSDictionary)hapSvcMap
{
  return self->_hapSvcMap;
}

- (id)categoryForCategoryUUIDString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  HMAccessoryCategory *v13;
  void *v14;
  void *v15;
  HMAccessoryCategory *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMHAPMetadata hapCategoryMap](self, "hapCategoryMap", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "uuidStr");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v13 = [HMAccessoryCategory alloc];
          objc_msgSend(v10, "uuidStr");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "catDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[HMAccessoryCategory initWithType:name:](v13, "initWithType:name:", v14, v15);

          +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:](HMFObjectCacheHMAccessoryCategory, "cachedInstanceForHMAccessoryCategory:", v16);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)getSharedInstance
{
  if (getSharedInstance_onceToken != -1)
    dispatch_once(&getSharedInstance_onceToken, &__block_literal_global_30406);
  return (id)getSharedInstance_sharedInstance;
}

- (NSDictionary)hapCategoryMap
{
  return self->_hapCategoryMap;
}

+ (id)encodeProtobufWithVersion:(id)a3 characteristics:(id)a4 services:(id)a5 categories:(id)a6
{
  id v9;
  id v10;
  HMPBMetadata *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HMPBMetadataCharacteristic *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  HMPBMetadataService *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  HMPBMetadataCategory *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v44 = a5;
  v42 = a6;
  v11 = objc_alloc_init(HMPBMetadata);
  v41 = v9;
  v12 = objc_msgSend(v9, "intValue");
  if (v11)
  {
    *(_BYTE *)&v11->_has |= 1u;
    v11->_version = v12;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v56;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v56 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v16);
        v18 = objc_alloc_init(HMPBMetadataCharacteristic);
        objc_msgSend(v17, "uuidStr");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_storeStrong((id *)&v18->_uuidStr, v19);

        objc_msgSend(v17, "chrDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_storeStrong((id *)&v18->_chrDescription, v20);

        -[HMPBMetadata addHapCharacteristics:]((uint64_t)v11, v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v14);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v45 = v44;
  v21 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v52;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(v45);
        v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v24);
        v26 = objc_alloc_init(HMPBMetadataService);
        objc_msgSend(v25, "uuidStr");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_storeStrong((id *)&v26->_uuidStr, v27);

        objc_msgSend(v25, "svcDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_storeStrong((id *)&v26->_svcDescription, v28);

        -[HMPBMetadata addHapServices:]((uint64_t)v11, v26);
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v22);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v43 = v42;
  v29 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v48;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(v43);
        v33 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v32);
        v34 = objc_alloc_init(HMPBMetadataCategory);
        objc_msgSend(v33, "uuidStr");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_storeStrong((id *)&v34->_uuidStr, v35);

        objc_msgSend(v33, "catDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_storeStrong((id *)&v34->_catDescription, v36);

        objc_msgSend(v33, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "intValue");
        if (v34)
        {
          *(_BYTE *)&v34->_has |= 1u;
          v34->_identifier = v38;
        }

        -[HMPBMetadata addHapCategories:]((uint64_t)v11, v34);
        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v30);
  }

  -[HMPBMetadata data](v11, "data");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (BOOL)applyProtoBufData:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  uint64_t v9;
  NSNumber *version;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  HMHAPMetadataCharacteristic *v16;
  HMHAPMetadataCharacteristic *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  HMHAPMetadataService *v28;
  HMHAPMetadataService *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  HMHAPMetadataCategory *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *context;
  id v51;
  HMHAPMetadata *v52;
  HMPBMetadata *v53;
  NSMutableArray *obj;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  context = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v52 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v51, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v6;
    v74 = 2112;
    v75 = v7;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Unpacking [%@] bytes of metadata", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v53 = -[HMPBMetadata initWithData:]([HMPBMetadata alloc], "initWithData:", v51);
  if (v53)
  {
    p_lock = &v52->_lock;
    os_unfair_lock_lock_with_options();
    if (-[NSNumber integerValue](v52->_version, "integerValue") >= v53->_version)
    {
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v9 = objc_claimAutoreleasedReturnValue();
      version = v52->_version;
      v52->_version = (NSNumber *)v9;

      os_unfair_lock_unlock(p_lock);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableArray count](v53->_hapCharacteristics, "count"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v11 = v53->_hapCharacteristics;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v66;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v66 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v14);
            v16 = objc_alloc_init(HMHAPMetadataCharacteristic);
            v17 = v16;
            if (v15)
            {
              v18 = *(id *)(v15 + 16);
              -[HMHAPMetadataCharacteristic setUuidStr:](v17, "setUuidStr:", v18);

              v19 = *(void **)(v15 + 8);
            }
            else
            {
              -[HMHAPMetadataCharacteristic setUuidStr:](v16, "setUuidStr:", 0);
              v19 = 0;
            }
            v20 = v19;
            -[HMHAPMetadataCharacteristic setChrDescription:](v17, "setChrDescription:", v20);

            -[HMHAPMetadataCharacteristic uuidStr](v17, "uuidStr");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKey:", v17, v21);

            ++v14;
          }
          while (v12 != v14);
          v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          v12 = v22;
        }
        while (v22);
      }

      -[HMHAPMetadata setHapChrMap:](v52, "setHapChrMap:", v56);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableArray count](v53->_hapServices, "count"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v23 = v53->_hapServices;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v62;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v62 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v26);
            v28 = objc_alloc_init(HMHAPMetadataService);
            v29 = v28;
            if (v27)
            {
              v30 = *(id *)(v27 + 16);
              -[HMHAPMetadataService setUuidStr:](v29, "setUuidStr:", v30);

              v31 = *(void **)(v27 + 8);
            }
            else
            {
              -[HMHAPMetadataService setUuidStr:](v28, "setUuidStr:", 0);
              v31 = 0;
            }
            v32 = v31;
            -[HMHAPMetadataService setSvcDescription:](v29, "setSvcDescription:", v32);

            -[HMHAPMetadataService uuidStr](v29, "uuidStr");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setObject:forKey:", v29, v33);

            ++v26;
          }
          while (v24 != v26);
          v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          v24 = v34;
        }
        while (v34);
      }

      -[HMHAPMetadata setHapSvcMap:](v52, "setHapSvcMap:", v55);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableArray count](v53->_hapCategories, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = v53->_hapCategories;
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v58;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v58 != v37)
              objc_enumerationMutation(obj);
            v39 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v38);
            v40 = objc_alloc_init(HMHAPMetadataCategory);
            if (v39)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v39 + 16));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMHAPMetadataCategory setIdentifier:](v40, "setIdentifier:", v41);

              v42 = *(void **)(v39 + 24);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMHAPMetadataCategory setIdentifier:](v40, "setIdentifier:", v47);

              v42 = 0;
            }
            v43 = v42;
            -[HMHAPMetadataCategory setUuidStr:](v40, "setUuidStr:", v43);

            if (v39)
              v44 = *(void **)(v39 + 8);
            else
              v44 = 0;
            v45 = v44;
            -[HMHAPMetadataCategory setCatDescription:](v40, "setCatDescription:", v45);

            -[HMHAPMetadataCategory identifier](v40, "identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKey:", v40, v46);

            ++v38;
          }
          while (v36 != v38);
          v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          v36 = v48;
        }
        while (v48);
      }

      -[HMHAPMetadata setHapCategoryMap:](v52, "setHapCategoryMap:", v35);
    }
  }

  objc_autoreleasePoolPop(context);
  return 0;
}

- (void)setHapSvcMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapSvcMap, a3);
}

- (void)setHapChrMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapChrMap, a3);
}

- (void)setHapCategoryMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapCategoryMap, a3);
}

void __34__HMHAPMetadata_getSharedInstance__block_invoke()
{
  HMHAPMetadata *v0;
  void *v1;

  v0 = objc_alloc_init(HMHAPMetadata);
  v1 = (void *)getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = (uint64_t)v0;

}

- (NSNumber)version
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_version;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setVersion:(id)a3
{
  NSNumber *v4;
  NSNumber *version;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)characteristicTypeDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v4 = a3;
  -[HMHAPMetadata hapChrMap](self, "hapChrMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "chrDescription");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = CFSTR("Custom");
  v9 = v7;

  return v9;
}

- (id)categoryForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessoryCategory *v7;
  void *v8;
  void *v9;
  HMAccessoryCategory *v10;
  void *v11;

  v4 = a3;
  if (v4
    && (-[HMHAPMetadata hapCategoryMap](self, "hapCategoryMap"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = [HMAccessoryCategory alloc];
    objc_msgSend(v6, "uuidStr");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "catDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMAccessoryCategory initWithType:name:](v7, "initWithType:name:", v8, v9);

  }
  else
  {
    -[HMHAPMetadata categoryForCategoryUUIDString:](self, "categoryForCategoryUUIDString:", CFSTR("0FBA259B-05AC-46F2-875F-204ABB6D9FE7"));
    v10 = (HMAccessoryCategory *)objc_claimAutoreleasedReturnValue();
  }
  +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:](HMFObjectCacheHMAccessoryCategory, "cachedInstanceForHMAccessoryCategory:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)shouldNotCacheCharacteristicOfType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = shouldNotCacheCharacteristicOfType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shouldNotCacheCharacteristicOfType__onceToken, &__block_literal_global_96_30390);
  v5 = objc_msgSend((id)shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes, "containsObject:", v4);

  return v5;
}

- (NSDictionary)hapChrMap
{
  return self->_hapChrMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapCategoryMap, 0);
  objc_storeStrong((id *)&self->_hapSvcMap, 0);
  objc_storeStrong((id *)&self->_hapChrMap, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

void __52__HMHAPMetadata_shouldNotCacheCharacteristicOfType___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("00000073-0000-1000-8000-0026BB765291");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes;
  shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes = v0;

}

@end
