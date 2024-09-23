@implementation HMMTRVendorMetadataVendor

- (HMMTRVendorMetadataVendor)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HMMTRVendorMetadataProduct *v22;
  void *v23;
  HMMTRVendorMetadataProduct *v24;
  uint64_t v25;
  void *v26;
  HMMTRVendorMetadataVendor *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMMTRVendorMetadataVendor *v31;
  HMMTRVendorMetadataVendor *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  HMMTRVendorMetadataVendor *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_24:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_24;
  objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("Products"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v39 = v6;
    v41 = -[HMMTRVendorMetadataVendor initWithIdentifier:](self, "initWithIdentifier:", v6);
    v10 = (void *)-[HMMTRVendorMetadataVendor mutableCopy](v41, "mutableCopy");
    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("Name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v11);

    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("AppStoreID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAppStoreID:", v12);

    v38 = v8;
    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("AppBundleID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAppBundleID:", v13);

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v37 = v9;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      v40 = v10;
      do
      {
        v18 = 0;
        v42 = v16;
        do
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x242656984]();
          objc_msgSend(v14, "hmf_dictionaryForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = [HMMTRVendorMetadataProduct alloc];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v19, "integerValue"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[HMMTRVendorMetadataProduct initWithIdentifier:dictionaryRepresentation:](v22, "initWithIdentifier:dictionaryRepresentation:", v23, v21);

            if (v24)
              objc_msgSend(v10, "addProduct:", v24);

          }
          else
          {
            v25 = v17;
            v26 = (void *)MEMORY[0x242656984]();
            v27 = v41;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", v19);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v49 = v29;
              v50 = 2112;
              v51 = v30;
              _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Ignoring product value that is not a dictionary: %@", buf, 0x16u);

              v10 = v40;
            }

            objc_autoreleasePoolPop(v26);
            v17 = v25;
            v16 = v42;
          }

          objc_autoreleasePoolPop(v20);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v16);
    }

    v31 = (HMMTRVendorMetadataVendor *)objc_msgSend(v10, "copy");
    v32 = v41;
    v8 = v38;
    v6 = v39;
    v9 = v37;
  }
  else
  {
    v33 = (void *)MEMORY[0x242656984]();
    v32 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v35;
      v50 = 2112;
      v51 = v8;
      _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_ERROR, "%{public}@Could not find products in vendor dictionary representation: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v31 = 0;
  }

  return v31;
}

- (HMMTRVendorMetadataVendor)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMMTRVendorMetadataVendor *v6;
  uint64_t v7;
  NSNumber *identifier;
  NSDictionary *productsByProductID;
  HMMTRVendorMetadataVendor *v11;
  SEL v12;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)HMMTRVendorMetadataVendor;
    v6 = -[HMMTRVendorMetadataVendor init](&v13, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSNumber *)v7;

      productsByProductID = v6->_productsByProductID;
      v6->_productsByProductID = (NSDictionary *)MEMORY[0x24BDBD1B8];

    }
    return v6;
  }
  else
  {
    v11 = (HMMTRVendorMetadataVendor *)_HMFPreconditionFailure();
    return (HMMTRVendorMetadataVendor *)-[HMMTRVendorMetadataVendor products](v11, v12);
  }
}

- (NSSet)products
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[HMMTRVendorMetadataVendor productsByProductID](self, "productsByProductID");
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
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Name"));

  -[HMMTRVendorMetadataVendor appStoreID](self, "appStoreID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AppStoreID"));

  -[HMMTRVendorMetadataVendor appBundleID](self, "appBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("AppBundleID"));

  v7 = (void *)MEMORY[0x24BDBCED8];
  -[HMMTRVendorMetadataVendor products](self, "products");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMMTRVendorMetadataVendor products](self, "products", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("Products"));
  v19 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v19;
}

- (id)productWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMMTRVendorMetadataVendor productsByProductID](self, "productsByProductID");
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
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;

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
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRVendorMetadataVendor identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToNumber:", v9))
    {
      objc_msgSend(v7, "productsByProductID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataVendor productsByProductID](self, "productsByProductID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqualToDictionary:", v11))
        goto LABEL_12;
      objc_msgSend(v7, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataVendor name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      if (!v14)
        goto LABEL_12;
      objc_msgSend(v7, "appStoreID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataVendor appStoreID](self, "appStoreID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = HMFEqualObjects();

      if (v17)
      {
        objc_msgSend(v7, "appBundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRVendorMetadataVendor appBundleID](self, "appBundleID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = HMFEqualObjects();

      }
      else
      {
LABEL_12:
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMTRVendorMetadataVendor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMTRMutableVendorMetadataVendor *v4;
  void *v5;
  HMMTRMutableVendorMetadataVendor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[HMMTRMutableVendorMetadataVendor allocWithZone:](HMMTRMutableVendorMetadataVendor, "allocWithZone:", a3);
  -[HMMTRVendorMetadataVendor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMMTRVendorMetadataVendor initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[HMMTRVendorMetadataVendor productsByProductID](self, "productsByProductID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor setProductsByProductID:](v6, "setProductsByProductID:", v7);

  -[HMMTRVendorMetadataVendor name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor setName:](v6, "setName:", v8);

  -[HMMTRVendorMetadataVendor appStoreID](self, "appStoreID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor setAppStoreID:](v6, "setAppStoreID:", v9);

  -[HMMTRVendorMetadataVendor appBundleID](self, "appBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataVendor setAppBundleID:](v6, "setAppBundleID:", v10);

  return v6;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRVendorMetadataVendor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Identifier"), v5);
  objc_msgSend(v3, "addObject:", v6);

  -[HMMTRVendorMetadataVendor name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRVendorMetadataVendor name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Name"), v9);
    objc_msgSend(v3, "addObject:", v10);

  }
  -[HMMTRVendorMetadataVendor appStoreID](self, "appStoreID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRVendorMetadataVendor appStoreID](self, "appStoreID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("App Store ID"), v13);
    objc_msgSend(v3, "addObject:", v14);

  }
  -[HMMTRVendorMetadataVendor appBundleID](self, "appBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRVendorMetadataVendor appBundleID](self, "appBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("App Bundle ID"), v17);
    objc_msgSend(v3, "addObject:", v18);

  }
  -[HMMTRVendorMetadataVendor products](self, "products");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRVendorMetadataVendor products](self, "products");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Products"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  v24 = (void *)objc_msgSend(v3, "copy");

  return v24;
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)appStoreID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppStoreID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)appBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)productsByProductID
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProductsByProductID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productsByProductID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_appStoreID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
