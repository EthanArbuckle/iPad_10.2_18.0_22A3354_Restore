@implementation HMDCloudCache

- (HMDCloudCache)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDCloudCache)initWithBackingStore:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  HMDCloudCache *v8;
  HMDCloudCache *v9;
  uint64_t v10;
  NSMutableDictionary *homeZones;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCloudCache;
  v8 = -[HMDCloudCache init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workQueue, a4);
    objc_storeWeak((id *)&v9->_backingStore, v6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    homeZones = v9->_homeZones;
    v9->_homeZones = (NSMutableDictionary *)v10;

  }
  return v9;
}

- (void)setHomeDataInformation:(id)a3
{
  HMDCloudZone *v4;
  HMDCloudZone *homeDataInformation;

  v4 = (HMDCloudZone *)a3;
  os_unfair_lock_lock_with_options();
  homeDataInformation = self->_homeDataInformation;
  self->_homeDataInformation = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDCloudZone)homeDataInformation
{
  os_unfair_lock_s *p_lock;
  HMDCloudZone *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_homeDataInformation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLegacyZone:(id)a3
{
  HMDCloudLegacyZone *v4;
  HMDCloudLegacyZone *legacyZone;

  v4 = (HMDCloudLegacyZone *)a3;
  os_unfair_lock_lock_with_options();
  legacyZone = self->_legacyZone;
  self->_legacyZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDCloudLegacyZone)legacyZone
{
  os_unfair_lock_s *p_lock;
  HMDCloudLegacyZone *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_legacyZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMetadataZone:(id)a3
{
  HMDCloudMetadataZone *v4;
  HMDCloudMetadataZone *metadataZone;

  v4 = (HMDCloudMetadataZone *)a3;
  os_unfair_lock_lock_with_options();
  metadataZone = self->_metadataZone;
  self->_metadataZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDCloudMetadataZone)metadataZone
{
  os_unfair_lock_s *p_lock;
  HMDCloudMetadataZone *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_metadataZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHomeManagerZone:(id)a3
{
  HMDCloudHomeManagerZone *v4;
  HMDCloudHomeManagerZone *homeManagerZone;

  v4 = (HMDCloudHomeManagerZone *)a3;
  os_unfair_lock_lock_with_options();
  homeManagerZone = self->_homeManagerZone;
  self->_homeManagerZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDCloudHomeManagerZone)homeManagerZone
{
  os_unfair_lock_s *p_lock;
  HMDCloudHomeManagerZone *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_homeManagerZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_findStoreCacheZone:(id)a3 byName:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "zoneName", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v6, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_createZones:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  void *v24;
  id v25;
  _QWORD v26[5];
  void *v27;
  id v28;
  _QWORD v29[5];
  void *v30;
  id v31;
  _QWORD v32[5];
  void *v33;
  id v34;

  v6 = a3;
  v7 = a4;
  if (!self->_homeDataInformation)
  {
    -[HMDCloudCache _findStoreCacheZone:byName:](self, "_findStoreCacheZone:byName:", v6, CFSTR("HomeDataInfo"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v12);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __41__HMDCloudCache__createZones_completion___block_invoke;
    v32[3] = &unk_1E89BBFD8;
    v32[4] = self;
    v33 = v13;
    v34 = v7;
    v14 = v13;
    +[HMDCloudZone createZoneWithName:rootRecordName:subscriptionName:owner:cacheZone:cloudCache:completion:](HMDCloudZone, "createZoneWithName:rootRecordName:subscriptionName:owner:cacheZone:cloudCache:completion:", CFSTR("HomeDataInfo"), CFSTR("DONOTUPLOAD"), CFSTR("HomeDataInfo"), CFSTR("__HomeKit_Default_Owner__"), v12, self, v32);

    v15 = v33;
LABEL_11:

    goto LABEL_12;
  }
  if (!self->_legacyZone)
  {
    -[HMDCloudCache _findStoreCacheZone:byName:](self, "_findStoreCacheZone:byName:", v6, CFSTR("HomeDataBlobZone"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v12);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __41__HMDCloudCache__createZones_completion___block_invoke_2;
    v29[3] = &unk_1E89BBFD8;
    v29[4] = self;
    v30 = v16;
    v31 = v7;
    v14 = v16;
    +[HMDCloudLegacyZone createLegacyZoneWithName:owner:cacheZone:cloudCache:completion:](HMDCloudLegacyZone, "createLegacyZoneWithName:owner:cacheZone:cloudCache:completion:", CFSTR("HomeDataBlobZone"), CFSTR("__HomeKit_Default_Owner__"), v12, self, v29);

    v15 = v30;
    goto LABEL_11;
  }
  if (!self->_metadataZone)
  {
    -[HMDCloudCache _findStoreCacheZone:byName:](self, "_findStoreCacheZone:byName:", v6, CFSTR("CCF7D3D1-0C20-4207-97D0-9E565EB5E323"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObject:", v12);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __41__HMDCloudCache__createZones_completion___block_invoke_3;
    v26[3] = &unk_1E89BBFD8;
    v26[4] = self;
    v27 = v17;
    v28 = v7;
    v14 = v17;
    +[HMDCloudMetadataZone createMetadataZoneWithName:owner:cacheZone:cloudCache:completion:](HMDCloudMetadataZone, "createMetadataZoneWithName:owner:cacheZone:cloudCache:completion:", CFSTR("CCF7D3D1-0C20-4207-97D0-9E565EB5E323"), CFSTR("__HomeKit_Default_Owner__"), v12, self, v26);

    v15 = v27;
    goto LABEL_11;
  }
  if (!self->_homeManagerZone)
  {
    -[HMDCloudCache _findStoreCacheZone:byName:](self, "_findStoreCacheZone:byName:", v6, CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObject:", v12);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41__HMDCloudCache__createZones_completion___block_invoke_4;
    v23[3] = &unk_1E89BBFD8;
    v23[4] = self;
    v24 = v18;
    v25 = v7;
    v14 = v18;
    +[HMDCloudHomeManagerZone createHomeManagerZoneWithName:owner:cacheZone:cloudCache:completion:](HMDCloudHomeManagerZone, "createHomeManagerZoneWithName:owner:cacheZone:cloudCache:completion:", CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5"), CFSTR("__HomeKit_Default_Owner__"), v12, self, v23);

    v15 = v24;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v8);
    objc_msgSend(v8, "zoneName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__HMDCloudCache__createZones_completion___block_invoke_5;
    v19[3] = &unk_1E89BC000;
    v19[4] = self;
    v20 = v8;
    v21 = v9;
    v22 = v7;
    v11 = v9;
    v12 = v8;
    +[HMDCloudHomeZone createHomeZoneWithName:owner:cacheZone:cloudCache:completion:](HMDCloudHomeZone, "createHomeZoneWithName:owner:cacheZone:cloudCache:completion:", v10, CFSTR("__HomeKit_Default_Owner__"), v12, self, v19);

LABEL_12:
    goto LABEL_13;
  }
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_13:

}

- (void)createAndFetchZonesFromBackingStore:(id)a3
{
  id v4;
  HMDBackingStoreCacheFetchZonesOperation *v5;
  id v6;
  HMDBackingStoreCacheFetchZonesOperation *v7;
  void *v8;
  HMDCloudCache *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [HMDBackingStoreCacheFetchZonesOperation alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__HMDCloudCache_createAndFetchZonesFromBackingStore___block_invoke;
  v13[3] = &unk_1E89BC028;
  objc_copyWeak(&v15, &location);
  v6 = v4;
  v14 = v6;
  v7 = -[HMDBackingStoreCacheFetchZonesOperation initWithFetchResult:](v5, "initWithFetchResult:", v13);
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud zones from disk", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCloudCache backingStore](v9, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submit:", v7);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (id)allHomeZones
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudCache homeZones](self, "homeZones");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)homeZoneExists:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudCache homeZones](self, "homeZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7 != 0;
}

- (id)homeZoneWithName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudCache homeZones](self, "homeZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)homeZoneWithName:(id)a3 owner:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  os_unfair_lock_lock_with_options();
  -[HMDCloudCache homeZones](self, "homeZones");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    if (v10)
      v10[2](v10, v12, 0);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__HMDCloudCache_homeZoneWithName_owner_completion___block_invoke;
    v13[3] = &unk_1E89BBFD8;
    v13[4] = self;
    v14 = v8;
    v15 = v10;
    +[HMDCloudHomeZone createHomeZoneWithName:owner:cacheZone:cloudCache:completion:](HMDCloudHomeZone, "createHomeZoneWithName:owner:cacheZone:cloudCache:completion:", v14, v9, 0, self, v13);

  }
}

- (void)deleteAllZones
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDCloudCache homeDataInformation](self, "homeDataInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDCloudCache homeDataInformation](self, "homeDataInformation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteZone");

    -[HMDCloudCache setHomeDataInformation:](self, "setHomeDataInformation:", 0);
  }
  -[HMDCloudCache legacyZone](self, "legacyZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDCloudCache legacyZone](self, "legacyZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteZone");

    -[HMDCloudCache setLegacyZone:](self, "setLegacyZone:", 0);
  }
  -[HMDCloudCache metadataZone](self, "metadataZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDCloudCache metadataZone](self, "metadataZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteZone");

    -[HMDCloudCache setMetadataZone:](self, "setMetadataZone:", 0);
  }
  -[HMDCloudCache homeManagerZone](self, "homeManagerZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDCloudCache homeManagerZone](self, "homeManagerZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteZone");

    -[HMDCloudCache setHomeManagerZone:](self, "setHomeManagerZone:", 0);
  }
  os_unfair_lock_lock_with_options();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDCloudCache homeZones](self, "homeZones", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "deleteZone");
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudCache setHomeZones:](self, "setHomeZones:", v16);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)deleteHomeZoneWithName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCloudCache *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDCloudCache homeZones](self, "homeZones");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCloudCache homeZones](self, "homeZones");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

    objc_msgSend(v7, "deleteZone");
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Must specify zone name when deleting zone", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (CKServerChangeToken)databaseServerChangeToken
{
  void *v2;
  void *v3;

  -[HMDCloudCache homeDataInformation](self, "homeDataInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverChangeToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKServerChangeToken *)v3;
}

- (void)setDatabaseServerChangeToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudCache homeDataInformation](self, "homeDataInformation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServerChangeToken:", v4);

}

- (void)persistDatabaseServerChangeToken
{
  id v2;

  -[HMDCloudCache homeDataInformation](self, "homeDataInformation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCurrentServerChangeToken");

}

- (NSMutableDictionary)homeZones
{
  return self->_homeZones;
}

- (void)setHomeZones:(id)a3
{
  objc_storeStrong((id *)&self->_homeZones, a3);
}

- (HMDBackingStore)backingStore
{
  return (HMDBackingStore *)objc_loadWeakRetained((id *)&self->_backingStore);
}

- (void)setBackingStore:(id)a3
{
  objc_storeWeak((id *)&self->_backingStore, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_backingStore);
  objc_storeStrong((id *)&self->_homeZones, 0);
  objc_storeStrong((id *)&self->_homeManagerZone, 0);
  objc_storeStrong((id *)&self->_metadataZone, 0);
  objc_storeStrong((id *)&self->_legacyZone, 0);
  objc_storeStrong((id *)&self->_homeDataInformation, 0);
}

void __51__HMDCloudCache_homeZoneWithName_owner_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  os_unfair_lock_s *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (!v14 || v5)
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v5);
  }
  else
  {
    v6 = v14;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    if ((isKindOfClass & 1) != 0)
    {
      v10 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
      os_unfair_lock_lock_with_options();
      objc_msgSend(*(id *)(a1 + 32), "homeZones");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

      os_unfair_lock_unlock(v10);
    }
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, id, _QWORD))(v12 + 16))(v12, v9, 0);

  }
}

void __53__HMDCloudCache_createAndFetchZonesFromBackingStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v12;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to load zones from disk with error %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(WeakRetained, "_createZones:completion:", v5, *(_QWORD *)(a1 + 32)));
      v15 = v8;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v17;
        v20 = 2112;
        v21 = 0;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Completed fetching cloud zones from disk with error %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
  }

}

void __41__HMDCloudCache__createZones_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v7 || v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setHomeDataInformation:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_createZones:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __41__HMDCloudCache__createZones_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10
    && !v5
    && ((objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0) ? (v7 = 0) : (v7 = v10),
        v8 = v7,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLegacyZone:", v10);
    objc_msgSend(*(id *)(a1 + 32), "_createZones:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }

}

void __41__HMDCloudCache__createZones_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10
    && !v5
    && ((objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0) ? (v7 = 0) : (v7 = v10),
        v8 = v7,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setMetadataZone:", v10);
    objc_msgSend(*(id *)(a1 + 32), "_createZones:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }

}

void __41__HMDCloudCache__createZones_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10
    && !v5
    && ((objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0) ? (v7 = 0) : (v7 = v10),
        v8 = v7,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setHomeManagerZone:", v10);
    objc_msgSend(*(id *)(a1 + 32), "_createZones:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }

}

void __41__HMDCloudCache__createZones_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  os_unfair_lock_s *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (v14
    && !v5
    && ((v6 = v14, objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0)
      ? (v8 = 0)
      : (v8 = v6),
        v9 = v8,
        v6,
        (isKindOfClass & 1) != 0))
  {
    v10 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 32), "homeZones");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "zoneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v12);

    os_unfair_lock_unlock(v10);
    objc_msgSend(*(id *)(a1 + 32), "_createZones:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v5);
  }

}

@end
