@implementation HMDApplicationData

- (HMDApplicationData)initWithParentUUID:(id)a3
{
  id v4;
  HMDApplicationData *v5;
  uint64_t v6;
  NSMutableDictionary *appDataDictionary;
  uint64_t v8;
  NSUUID *parentUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDApplicationData;
  v5 = -[HMDApplicationData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    appDataDictionary = v5->_appDataDictionary;
    v5->_appDataDictionary = (NSMutableDictionary *)v6;

    v8 = objc_msgSend(v4, "copy");
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSUUID *)v8;

  }
  return v5;
}

- (HMDApplicationData)initWithDictionary:(id)a3 parentUUID:(id)a4
{
  id v6;
  HMDApplicationData *v7;
  HMDApplicationData *v8;

  v6 = a3;
  v7 = -[HMDApplicationData initWithParentUUID:](self, "initWithParentUUID:", a4);
  v8 = v7;
  if (v6 && v7)
    -[NSMutableDictionary setDictionary:](v7->_appDataDictionary, "setDictionary:", v6);

  return v8;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (NSUUID)uuid
{
  NSUUID *uuid;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSUUID *v8;
  NSUUID *v9;

  uuid = self->_uuid;
  if (!uuid
    || (objc_msgSend(MEMORY[0x24BDD1880], "zeroUUID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = -[NSUUID isEqual:](uuid, "isEqual:", v4),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", self->_parentUUID, 0, &unk_24E970BE0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "zeroUUID");
      v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_uuid;
    self->_uuid = v8;

  }
  return self->_uuid;
}

- (void)setApplicationData:(id)a3 forIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAsset *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (v5)
    {
      -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v6;
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v51;
        v38 = v5;
        v35 = *(_QWORD *)v51;
        v36 = v8;
        do
        {
          v12 = 0;
          v37 = v10;
          do
          {
            if (*(_QWORD *)v51 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v12);
            objc_msgSend(v8, "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v13, "isEqualToString:", CFSTR("kAssetsKey")) & 1) != 0)
            {
              v15 = v14;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v16 = v15;
              else
                v16 = 0;
              v17 = v16;

              v41 = v17;
              if (v17)
              {
                v39 = v14;
                v40 = v12;
                v48 = 0u;
                v49 = 0u;
                v46 = 0u;
                v47 = 0u;
                v18 = v17;
                v45 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
                if (v45)
                {
                  v43 = *(_QWORD *)v47;
                  do
                  {
                    for (i = 0; i != v45; ++i)
                    {
                      if (*(_QWORD *)v47 != v43)
                        objc_enumerationMutation(v18);
                      v20 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                      objc_msgSend(v18, "hmf_dictionaryForKey:", v20);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "hmf_stringForKey:", CFSTR("kIdentifierKey"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "hmf_stringForKey:", CFSTR("kAssetURLKey"));
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "hmf_dictionaryForKey:", CFSTR("kAssetMetadataKey"));
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v23)
                      {
                        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v25 = 0;
                      }
                      objc_msgSend(v42, "objectForKey:", v20);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      objc_opt_isKindOfClass();
                      v27 = -[HMDAsset initWithIdentifier:metadata:resourceURL:]([HMDAsset alloc], "initWithIdentifier:metadata:resourceURL:", v22, v24, v25);
                      objc_msgSend(v44, "setObject:forKeyedSubscript:", v27, v20);

                    }
                    v45 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
                  }
                  while (v45);
                }

                v10 = v37;
                v5 = v38;
                v11 = v35;
                v8 = v36;
                v14 = v39;
                v12 = v40;
              }
              else
              {
                v28 = (void *)MEMORY[0x227676638]();
                HMFGetOSLogHandle();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v30 = v14;
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v56 = v31;
                  v57 = 2112;
                  v58 = CFSTR("kAssetsKey");
                  v59 = 2112;
                  v60 = v15;
                  _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@%@ is not a dictionary, but %@", buf, 0x20u);

                  v14 = v30;
                  v5 = v38;
                }

                objc_autoreleasePoolPop(v28);
              }

            }
            else
            {
              objc_msgSend(v44, "setObject:forKeyedSubscript:", v14, v13);
            }

            ++v12;
          }
          while (v12 != v10);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        }
        while (v10);
      }

      -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v33;
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v44, v33);

    }
    else
    {
      -[HMDApplicationData removeApplicationDataForIdentifier:](self, "removeApplicationDataForIdentifier:", v6);
    }
  }

}

- (id)applicationDataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
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
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

        }
        else
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kAssetsKey"));
  v17 = (void *)objc_msgSend(v7, "copy");

  return v17;
}

- (void)removeApplicationDataForIdentifier:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

- (id)dictionary
{
  void *v2;
  void *v3;

  -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)dumpState
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id obj;
  uint64_t v23;
  HMDApplicationData *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v24 = self;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v26)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v28 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v3);
        -[HMDApplicationData appDataDictionary](v24, "appDataDictionary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v4;
        objc_msgSend(v5, "hmf_dictionaryForKey:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v30;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v30 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12);
              objc_msgSend(v8, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v15 = v14;
              else
                v15 = 0;
              v16 = v15;
              v17 = v16;
              if (v16)
              {
                objc_msgSend(v16, "dictionaryRepresentation");
                v18 = objc_claimAutoreleasedReturnValue();
LABEL_18:
                v19 = (void *)v18;
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v13);

                goto LABEL_19;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v14, "shortDescription");
                v18 = objc_claimAutoreleasedReturnValue();
                goto LABEL_18;
              }
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);
LABEL_19:

              ++v12;
            }
            while (v10 != v12);
            v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            v10 = v20;
          }
          while (v20);
        }

        objc_msgSend(v25, "setObject:forKeyedSubscript:", v7, v27);
        v3 = v28 + 1;
      }
      while (v28 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v26);
  }

  return v25;
}

- (void)updateWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDApplicationData *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDApplicationData *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "appDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "appDataDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[HMDApplicationData setAppDataDictionary:](self, "setAppDataDictionary:", v7);

    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDApplicationData appDataDictionary](v9, "appDataDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDApplicationData parentUUID](v9, "parentUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data from transaction: %@ / %@", (uint8_t *)&v17, 0x20u);

LABEL_6:
    }
  }
  else
  {
    -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllObjects");

    v8 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDApplicationData parentUUID](v15, "parentUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing entire app data for container: %@", (uint8_t *)&v17, 0x16u);

      goto LABEL_6;
    }
  }

  objc_autoreleasePoolPop(v8);
}

- (void)updateParentUUIDIfNil:(id)a3
{
  NSUUID *parentUUID;
  void *v6;
  int v7;
  NSUUID *v8;
  NSUUID *uuid;
  id v10;

  v10 = a3;
  parentUUID = self->_parentUUID;
  if (!parentUUID
    || (objc_msgSend(MEMORY[0x24BDD1880], "zeroUUID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[NSUUID isEqual:](parentUUID, "isEqual:", v6),
        v6,
        v7))
  {
    objc_storeStrong((id *)&self->_parentUUID, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", self->_parentUUID, 0, &unk_24E970BF8);
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    uuid = self->_uuid;
    self->_uuid = v8;

  }
}

- (void)encodeForXPCTransportWithCoder:(id)a3 key:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if ((objc_msgSend(v9, "hmd_isForXPCTransportEntitledForSPIAccess") & 1) != 0)
  {
    v7 = CFSTR("com.apple.homekit-entitledclient.identifer");
  }
  else
  {
    objc_msgSend(v9, "hmd_applicationBundleIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDApplicationData applicationDataForIdentifier:](self, "applicationDataForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v9, "encodeObject:forKey:", v8, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDApplicationData *v4;
  void *v5;
  void *v6;
  HMDApplicationData *v7;

  v4 = [HMDApplicationData alloc];
  -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDApplicationData parentUUID](self, "parentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDApplicationData initWithDictionary:parentUUID:](v4, "initWithDictionary:parentUUID:", v5, v6);

  return v7;
}

- (HMDApplicationData)initWithCoder:(id)a3
{
  id v4;
  HMDApplicationData *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSUUID *parentUUID;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[9];

  v19[8] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDApplicationData;
  v5 = -[HMDApplicationData init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.appDataParentUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithUUIDString:", v8);
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSUUID *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v19[6] = objc_opt_class();
    v19[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("HM.appData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    v16 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_appDataDictionary, v16);
    if (!v15)

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  -[HMDApplicationData parentUUID](self, "parentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("HM.appDataParentUUID"));

  -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("HM.appData"));

  objc_autoreleasePoolPop(v4);
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  _BOOL4 v5;
  HMDApplicationDataModel *v6;
  void *v7;
  void *v8;
  HMDApplicationDataModel *v9;

  v5 = -[HMDApplicationData isEmpty](self, "isEmpty");
  v6 = [HMDApplicationDataModel alloc];
  -[HMDApplicationData uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDApplicationData parentUUID](self, "parentUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", 3, v7, v8);
  }
  else
  {
    v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", a3, v7, v8);

    -[HMDApplicationData appDataDictionary](self, "appDataDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[HMDApplicationDataModel setAppDataDictionary:](v9, "setAppDataDictionary:", v8);
  }

  return v9;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDApplicationData parentUUID](self, "parentUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (void)setParentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSMutableDictionary)appDataDictionary
{
  return self->_appDataDictionary;
}

- (void)setAppDataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_appDataDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDataDictionary, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_15393 != -1)
    dispatch_once(&logCategory__hmf_once_t6_15393, &__block_literal_global_15394);
  return (id)logCategory__hmf_once_v7_15395;
}

void __33__HMDApplicationData_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_15395;
  logCategory__hmf_once_v7_15395 = v0;

}

@end
