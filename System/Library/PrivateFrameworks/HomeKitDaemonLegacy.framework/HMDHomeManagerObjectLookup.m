@implementation HMDHomeManagerObjectLookup

- (HMDHomeManagerObjectLookup)initWithHomeManager:(id)a3
{
  id v4;
  void *v5;
  HMDHomeManagerObjectLookup *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HMDHomeManagerObjectLookup;
  v6 = -[HMDObjectLookup initWithWorkQueue:](&v8, sel_initWithWorkQueue_, v5);

  if (v6)
    objc_storeWeak((id *)&v6->_homeManager, v4);

  return v6;
}

- (void)scanObjects
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDHomeManagerObjectLookup;
  -[HMDObjectLookup scanObjects](&v6, sel_scanObjects);
  -[HMDHomeManagerObjectLookup _scanHomes](self, "_scanHomes");
  -[HMDHomeManagerObjectLookup _scanCloudZones](self, "_scanCloudZones");
  -[HMDHomeManagerObjectLookup _scanAccounts](self, "_scanAccounts");
  -[HMDHomeManagerObjectLookup homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, v5);

}

- (void)_scanHomes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDHomeManagerObjectLookup homeManager](self, "homeManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_scanCloudZones
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDHomeManagerObjectLookup homeManager](self, "homeManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudZones");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_scanAccounts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = v4;
  objc_msgSend(v4, "modelBackedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "modelIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v10, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v7);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    v27 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      v28 = v14;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
        if (objc_msgSend(v17, "isAuthenticated"))
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v17, "modelBackedObjects");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v31 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "modelIdentifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setObject:forKey:", v23, v25);

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
            }
            while (v20);
          }

          v15 = v27;
          v14 = v28;
        }
        ++v16;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v14);
  }

}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_46020 != -1)
    dispatch_once(&logCategory__hmf_once_t0_46020, &__block_literal_global_46021);
  return (id)logCategory__hmf_once_v1_46022;
}

void __41__HMDHomeManagerObjectLookup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_46022;
  logCategory__hmf_once_v1_46022 = v0;

}

@end
