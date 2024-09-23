@implementation BMDistributedContextSubscriptionManager

- (BMDistributedContextSubscriptionManager)initWithStorage:(id)a3
{
  id v5;
  BMDistributedContextSubscriptionManager *v6;
  BMDistributedContextSubscriptionManager *v7;
  uint64_t v8;
  NSMutableArray *subscriptions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMDistributedContextSubscriptionManager;
  v6 = -[BMDistributedContextSubscriptionManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    v8 = objc_opt_new();
    subscriptions = v7->_subscriptions;
    v7->_subscriptions = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)saveToStorage
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BMDistributedContextSubscriptionStorage *storage;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_subscriptions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "dictionaryRepresentation", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "count");
  storage = self->_storage;
  if (v10)
    -[BMDistributedContextSubscriptionStorage setObject:forKey:](storage, "setObject:forKey:", v3, CFSTR("subscriptions"));
  else
    -[BMDistributedContextSubscriptionStorage removeObjectForKey:](storage, "removeObjectForKey:", CFSTR("subscriptions"));
  -[BMDistributedContextSubscriptionStorage setObject:forKey:](self->_storage, "setObject:forKey:", &unk_24D27BA70, CFSTR("storageVersion"), (_QWORD)v12);

}

+ (id)loadFromStorage:(id)a3 withLocalDeviceID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BMDistributedContextSubscription *v16;
  id v17;
  NSObject *v18;
  BMDistributedContextSubscriptionManager *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  NSObject *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "storageVersion:", v6))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("subscriptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[BMDistributedContextSubscriptionManager loadFromStorage:withLocalDeviceID:].cold.1(v9, v20, v21, v22, v23, v24, v25, v26);
      v19 = 0;
    }
    else
    {
      v9 = objc_opt_new();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14);
            v16 = [BMDistributedContextSubscription alloc];
            v17 = -[BMDistributedContextSubscription initFromDictionary:](v16, "initFromDictionary:", v15, (_QWORD)v28);
            -[NSObject addObject:](v9, "addObject:", v17);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v12);
      }

      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v9;
        _os_log_impl(&dword_214A1F000, v18, OS_LOG_TYPE_DEFAULT, "Loaded subscriptions from default %@", buf, 0xCu);
      }

      v19 = -[BMDistributedContextSubscriptionManager initWithStorage:]([BMDistributedContextSubscriptionManager alloc], "initWithStorage:", v6);
      -[BMDistributedContextSubscriptionManager addSubscriptions:](v19, "addSubscriptions:", v9);
    }

  }
  else
  {
    objc_msgSend(a1, "loadAndMigrateStorageFromLegacyToV1:withLocalDeviceID:", v6, v7);
    v19 = (BMDistributedContextSubscriptionManager *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

+ (unint64_t)storageVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("storageVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("storageVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "integerValue");

  }
  return (unint64_t)v4;
}

+ (id)loadAndMigrateStorageFromLegacyToV1:(id)a3 withLocalDeviceID:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  BMDistributedContextSubscriptionConfiguration *v42;
  const __CFString *v43;
  id v44;
  void *v45;
  BMDistributedContextSubscriptionConfiguration *v46;
  BMDistributedContextSubscriptionConfiguration *v47;
  BMDistributedContextSubscription *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  BMDistributedContextSubscriptionManager *v58;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id obj;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  uint64_t v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  v5 = a4;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214A1F000, v6, OS_LOG_TYPE_DEFAULT, "Subscription storage needs migration from legacy format, migrating", buf, 2u);
  }

  v71 = (void *)objc_opt_new();
  objc_msgSend(v60, "objectForKey:", CFSTR("localDSLIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v96 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSData bmdsl_deserialize](v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
    }
    while (v9);
  }
  v15 = (void *)objc_opt_new();
  objc_msgSend(v60, "objectForKey:", CFSTR("remoteDSLIdentifiers"));
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v92 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j);
        objc_msgSend(obj, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSData bmdsl_deserialize](v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v20);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
    }
    while (v17);
  }
  v72 = (void *)objc_opt_new();
  objc_msgSend(v60, "objectForKey:", CFSTR("subscriptions"));
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
  if (v64)
  {
    v63 = *(_QWORD *)v88;
    v24 = CFSTR("wake");
    v61 = v23;
    v62 = v7;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v88 != v63)
          objc_enumerationMutation(v23);
        v26 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v25);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __biome_log_for_category();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            +[BMDistributedContextSubscriptionManager loadAndMigrateStorageFromLegacyToV1:withLocalDeviceID:].cold.1(v49, v50, v51, v52, v53, v54, v55, v56);

          goto LABEL_57;
        }
        v65 = v25;
        v74 = v26;
        objc_msgSend(v23, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v69 = v27;
        v68 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v83, v104, 16);
        if (!v68)
          goto LABEL_51;
        v67 = *(_QWORD *)v84;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v84 != v67)
              objc_enumerationMutation(v69);
            v70 = v28;
            v75 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v28);
            objc_msgSend(v69, "objectForKeyedSubscript:");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = 0u;
            v80 = 0u;
            v81 = 0u;
            v82 = 0u;
            v78 = v29;
            v77 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
            if (v77)
            {
              v76 = *(_QWORD *)v80;
              do
              {
                for (k = 0; k != v77; ++k)
                {
                  if (*(_QWORD *)v80 != v76)
                    objc_enumerationMutation(v78);
                  v31 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k);
                  objc_msgSend(v78, "objectForKeyedSubscript:", v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && (objc_msgSend(v32, "objectForKeyedSubscript:", v24),
                        v33 = (void *)objc_claimAutoreleasedReturnValue(),
                        v33,
                        v33))
                  {
                    objc_msgSend(v32, "objectForKeyedSubscript:", v24);
                    v34 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_43;
                    v34 = v32;
                  }
                  v35 = v34;
                  if (!v34)
                  {
LABEL_43:
                    __biome_log_for_category();
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v100 = v72;
                      v101 = 2112;
                      v102 = v31;
                      _os_log_error_impl(&dword_214A1F000, v40, OS_LOG_TYPE_ERROR, "Load from default error! Defaults: %@, Identifier: %@", buf, 0x16u);
                    }
                    v35 = 0;
                    goto LABEL_46;
                  }
                  v36 = objc_msgSend(v75, "isEqual:", v5);
                  v37 = v15;
                  if ((v36 & 1) != 0 || (v38 = objc_msgSend(v74, "isEqual:", v5), v37 = v71, v38))
                  {
                    objc_msgSend(v37, "objectForKeyedSubscript:", v31);
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (v39)
                    {
                      v40 = v39;
                      v73 = objc_msgSend(v35, "BOOLValue");
                      v41 = v15;
                      v42 = [BMDistributedContextSubscriptionConfiguration alloc];
                      objc_msgSend(MEMORY[0x24BDBCE60], "now");
                      v43 = v24;
                      v44 = v5;
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      v46 = v42;
                      v15 = v41;
                      v47 = -[BMDistributedContextSubscriptionConfiguration initWithOptions:lastChangedDate:](v46, "initWithOptions:lastChangedDate:", v73, v45);

                      v5 = v44;
                      v24 = v43;
                      v48 = -[BMDistributedContextSubscription initWithIdentifier:dsl:subscribingDevice:subscribedDevice:configuration:]([BMDistributedContextSubscription alloc], "initWithIdentifier:dsl:subscribingDevice:subscribedDevice:configuration:", v31, v40, v74, v75, v47);
                      objc_msgSend(v72, "addObject:", v48);

LABEL_46:
                    }
                  }

                }
                v77 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
              }
              while (v77);
            }

            v28 = v70 + 1;
          }
          while (v70 + 1 != v68);
          v68 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v83, v104, 16);
        }
        while (v68);
LABEL_51:

        v25 = v65 + 1;
        v23 = v61;
        v7 = v62;
      }
      while (v65 + 1 != v64);
      v64 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
    }
    while (v64);
  }
LABEL_57:

  __biome_log_for_category();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v100 = v72;
    _os_log_impl(&dword_214A1F000, v57, OS_LOG_TYPE_DEFAULT, "Migrated subscriptions from legacy storage, subscriptions are %@", buf, 0xCu);
  }

  v58 = -[BMDistributedContextSubscriptionManager initWithStorage:]([BMDistributedContextSubscriptionManager alloc], "initWithStorage:", v60);
  -[BMDistributedContextSubscriptionManager addSubscriptions:](v58, "addSubscriptions:", v72);
  -[BMDistributedContextSubscriptionManager saveToStorage](v58, "saveToStorage");
  objc_msgSend(v60, "removeObjectForKey:", CFSTR("localDSLIdentifiers"));
  objc_msgSend(v60, "removeObjectForKey:", CFSTR("remoteDSLIdentifiers"));

  return v58;
}

- (id)allSubscriptionIdentifiers
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_subscriptions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "identifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)allSubscriptions
{
  return self->_subscriptions;
}

- (id)deviceIdentifiersWithActiveSubscriptions
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_subscriptions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "subscribedDevice", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        objc_msgSend(v9, "subscribingDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)addSubscriptions:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_subscriptions, "addObjectsFromArray:", a3);
  -[BMDistributedContextSubscriptionManager saveToStorage](self, "saveToStorage");
  return 1;
}

- (id)subscriptionForIdentifier:(id)a3 fromSubscribingDevice:(id)a4 onSubscribedDevice:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  void *v22;
  id v23;
  id v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v25 = a4;
  v9 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_subscriptions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v11)
    goto LABEL_14;
  v12 = v11;
  v13 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v28 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v15, "identifier", v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isEqualToString:", v8))
        goto LABEL_11;
      objc_msgSend(v15, "subscribedDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", v9) & 1) == 0)
      {

LABEL_11:
        continue;
      }
      objc_msgSend(v15, "subscribingDevice");
      v18 = v13;
      v19 = v8;
      v20 = v10;
      v21 = v9;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v22, "isEqualToString:", v25);

      v9 = v21;
      v10 = v20;
      v8 = v19;
      v13 = v18;

      if ((v26 & 1) != 0)
      {
        v23 = v15;
        goto LABEL_15;
      }
    }
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v12);
LABEL_14:
  v23 = 0;
LABEL_15:

  return v23;
}

- (BOOL)removeSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribingDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[BMDistributedContextSubscriptionManager removeSubscriptionWithIdentifier:fromSubscribingDevice:onSubscribedDevice:](self, "removeSubscriptionWithIdentifier:fromSubscribingDevice:onSubscribedDevice:", v5, v6, v7);
  return (char)self;
}

- (BOOL)removeSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4 onSubscribedDevice:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BMDistributedContextSubscriptionManager *v21;
  void *v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v24 = a4;
  v9 = a5;
  v21 = self;
  v22 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_subscriptions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v23 = 0;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "identifier", v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", v8) & 1) == 0)
          goto LABEL_11;
        objc_msgSend(v15, "subscribedDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqualToString:", v9) & 1) == 0)
        {

LABEL_11:
          continue;
        }
        objc_msgSend(v15, "subscribingDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v24);

        if (v19)
          objc_msgSend(v22, "addIndex:", v23 + i);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v23 += i;
    }
    while (v12);
  }

  -[NSMutableArray removeObjectsAtIndexes:](v21->_subscriptions, "removeObjectsAtIndexes:", v22);
  -[BMDistributedContextSubscriptionManager saveToStorage](v21, "saveToStorage");

  return 1;
}

- (BOOL)removeAllSubscriptionsMadeBySubscribingDevice:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_subscriptions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "subscribingDevice", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addIndex:", v9 + v11);
        ++v11;
      }
      while (v8 != v11);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 += v11;
    }
    while (v8);
  }

  -[NSMutableArray removeObjectsAtIndexes:](self->_subscriptions, "removeObjectsAtIndexes:", v5);
  -[BMDistributedContextSubscriptionManager saveToStorage](self, "saveToStorage");

  return 1;
}

- (id)subscribingDevicesForIdentifier:(id)a3 subscribedToDevice:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_subscriptions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v6))
        {
          objc_msgSend(v13, "subscribedDevice");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v7);

          if (!v16)
            continue;
          objc_msgSend(v13, "subscribedDevice");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v14);
        }

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(v19, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)subscriptionsWithIdentifier:(id)a3 subscribedToDevice:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18 = (id)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_subscriptions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", v6) & 1) != 0)
        {
          objc_msgSend(v13, "subscribedDevice");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v7);

          if (v16)
            objc_msgSend(v18, "addObject:", v13);
        }
        else
        {

        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v18;
}

- (id)subscriptionsWithSubscribingDevice:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_subscriptions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "subscribingDevice", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)subscriptionsWithSubscribedDevice:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_subscriptions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "subscribedDevice", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (BMDistributedContextSubscriptionStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

+ (void)loadFromStorage:(uint64_t)a3 withLocalDeviceID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_214A1F000, a1, a3, "Attempting to load subscriptions but they are not stored in current format", a5, a6, a7, a8, 0);
}

+ (void)loadAndMigrateStorageFromLegacyToV1:(uint64_t)a3 withLocalDeviceID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_214A1F000, a1, a3, "Attempting migration from legacy format but subscriptions are not in legacy format", a5, a6, a7, a8, 0);
}

@end
