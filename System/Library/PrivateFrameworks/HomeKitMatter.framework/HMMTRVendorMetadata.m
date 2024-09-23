@implementation HMMTRVendorMetadata

- (HMMTRVendorMetadata)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HMMTRVendorMetadataVendor *v19;
  void *v20;
  HMMTRVendorMetadataVendor *v21;
  uint64_t v22;
  void *v23;
  HMMTRVendorMetadata *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMMTRVendorMetadata *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMMTRVendorMetadata *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("Version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "hmf_numberForKey:", CFSTR("SchemaVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "hmf_dictionaryForKey:", CFSTR("Vendors"));
      v8 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v8;
      if (v8)
      {
        v9 = (void *)v8;
        v40 = v6;
        v41 = v5;
        v39 = v7;
        v44 = -[HMMTRVendorMetadata initWithVersion:schemaVersion:](self, "initWithVersion:schemaVersion:", v6, v7);
        v10 = (void *)-[HMMTRVendorMetadata mutableCopy](v44, "mutableCopy");
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v47;
          v43 = v10;
          do
          {
            v15 = 0;
            v45 = v13;
            do
            {
              if (*(_QWORD *)v47 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
              v17 = (void *)MEMORY[0x242656984]();
              objc_msgSend(v11, "hmf_dictionaryForKey:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                v19 = [HMMTRVendorMetadataVendor alloc];
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v16, "integerValue"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = -[HMMTRVendorMetadataVendor initWithIdentifier:dictionaryRepresentation:](v19, "initWithIdentifier:dictionaryRepresentation:", v20, v18);

                if (v21)
                  objc_msgSend(v10, "addVendor:", v21);

              }
              else
              {
                v22 = v14;
                v23 = (void *)MEMORY[0x242656984]();
                v24 = v44;
                HMFGetOSLogHandle();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "objectForKeyedSubscript:", v16);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v52 = v26;
                  v53 = 2112;
                  v54 = v27;
                  _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Ignoring vendor value that is not a dictionary: %@", buf, 0x16u);

                  v10 = v43;
                }

                objc_autoreleasePoolPop(v23);
                v14 = v22;
                v13 = v45;
              }

              objc_autoreleasePoolPop(v17);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          }
          while (v13);
        }

        v28 = (HMMTRVendorMetadata *)objc_msgSend(v10, "copy");
        v6 = v40;
        v5 = v41;
        v7 = v39;
      }
      else
      {
        v35 = (void *)MEMORY[0x242656984]();
        v44 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v37;
          v53 = 2112;
          v54 = v5;
          _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find vendors in vendor metadata dictionary: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v35);
        v28 = 0;
      }

    }
    else
    {
      v32 = (void *)MEMORY[0x242656984]();
      v44 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v34;
        v53 = 2112;
        v54 = v5;
        _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find schema version in vendor metadata dictionary: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      v28 = 0;
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x242656984]();
    v44 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v31;
      v53 = 2112;
      v54 = v5;
      _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not find version in vendor metadata dictionary: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v28 = 0;
  }

  return v28;
}

- (HMMTRVendorMetadata)init
{
  return -[HMMTRVendorMetadata initWithVersion:schemaVersion:](self, "initWithVersion:schemaVersion:", &unk_250F3FF30, &unk_250F3FF30);
}

- (HMMTRVendorMetadata)initWithVersion:(id)a3 schemaVersion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMMTRVendorMetadata *v10;
  HMMTRVendorMetadata *v11;
  NSDictionary *vendorsByVendorID;
  HMMTRVendorMetadata *v14;
  SEL v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v14 = (HMMTRVendorMetadata *)_HMFPreconditionFailure();
    return (HMMTRVendorMetadata *)-[HMMTRVendorMetadata vendors](v14, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)HMMTRVendorMetadata;
  v10 = -[HMMTRVendorMetadata init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_version, a3);
    objc_storeStrong((id *)&v11->_schemaVersion, a4);
    vendorsByVendorID = v11->_vendorsByVendorID;
    v11->_vendorsByVendorID = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v11;
}

- (NSSet)vendors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[HMMTRVendorMetadata vendorsByVendorID](self, "vendorsByVendorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadata version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Version"));

  -[HMMTRVendorMetadata schemaVersion](self, "schemaVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SchemaVersion"));

  v6 = (void *)MEMORY[0x24BDBCED8];
  -[HMMTRVendorMetadata vendors](self, "vendors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMMTRVendorMetadata vendors](self, "vendors", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Vendors"));
  v18 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v18;
}

- (id)vendorWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMMTRVendorMetadata vendorsByVendorID](self, "vendorsByVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRVendorMetadata version](self, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToNumber:", v9))
    {
      objc_msgSend(v7, "schemaVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadata schemaVersion](self, "schemaVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToNumber:", v11))
      {
        objc_msgSend(v7, "vendorsByVendorID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRVendorMetadata vendorsByVendorID](self, "vendorsByVendorID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToDictionary:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMTRVendorMetadata vendorsByVendorID](self, "vendorsByVendorID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMTRMutableVendorMetadata *v4;
  void *v5;
  void *v6;
  HMMTRMutableVendorMetadata *v7;
  void *v8;

  v4 = +[HMMTRMutableVendorMetadata allocWithZone:](HMMTRMutableVendorMetadata, "allocWithZone:", a3);
  -[HMMTRVendorMetadata version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadata schemaVersion](self, "schemaVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMTRVendorMetadata initWithVersion:schemaVersion:](v4, "initWithVersion:schemaVersion:", v5, v6);

  -[HMMTRVendorMetadata vendorsByVendorID](self, "vendorsByVendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadata setVendorsByVendorID:](v7, "setVendorsByVendorID:", v8);

  return v7;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRVendorMetadata version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Version"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRVendorMetadata schemaVersion](self, "schemaVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Schema Version"), v8);
  objc_msgSend(v3, "addObject:", v9);

  -[HMMTRVendorMetadata vendors](self, "vendors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRVendorMetadata vendors](self, "vendors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Vendors"), v13);
    objc_msgSend(v3, "addObject:", v14);

  }
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)schemaVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)vendorsByVendorID
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVendorsByVendorID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorsByVendorID, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
