@implementation AIDAServiceOwnersManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOwners, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (id)accountForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AIDAServiceOwnersManager serviceOwners](self, "serviceOwners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountForService:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)serviceOwners
{
  NSDictionary *serviceOwners;
  NSDictionary *v4;
  NSDictionary *v5;

  serviceOwners = self->_serviceOwners;
  if (!serviceOwners)
  {
    os_unfair_lock_lock(&self->_serviceOwnersLock);
    if (!self->_serviceOwners)
    {
      -[AIDAServiceOwnersManager _buildServiceOwnerMapping](self, "_buildServiceOwnerMapping");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v5 = self->_serviceOwners;
      self->_serviceOwners = v4;

    }
    os_unfair_lock_unlock(&self->_serviceOwnersLock);
    serviceOwners = self->_serviceOwners;
  }
  return serviceOwners;
}

- (id)_buildServiceOwnerMapping
{
  ACAccountStore *accountStore;
  ACAccountStore *v3;
  ACAccountStore *v4;
  void *v5;
  ACAccountStore *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  ACAccountStore *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  accountStore = self->_accountStore;
  if (accountStore)
  {
    v3 = accountStore;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "_loadServiceOwnerBundlesIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke;
  v10[3] = &unk_1E985B738;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "aaf_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AIDALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1D4C1F000, v8, OS_LOG_TYPE_DEFAULT, "Finished building service owner mapping: %@", buf, 0xCu);
  }

  return v7;
}

+ (NSSet)serviceOwnerBundles
{
  if (serviceOwnerBundles_onceToken != -1)
    dispatch_once(&serviceOwnerBundles_onceToken, &__block_literal_global_1);
  return (NSSet *)(id)serviceOwnerBundles_serviceOwnerBundles;
}

NSObject *__53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AIDALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1D4C1F000, v5, OS_LOG_TYPE_DEFAULT, "Building service owner for bundle: %@", (uint8_t *)&v12, 0xCu);
  }

  if ((-[NSObject isLoaded](v4, "isLoaded") & 1) == 0)
  {
    _AIDALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_3();
    goto LABEL_13;
  }
  v6 = (void *)-[NSObject principalClass](v4, "principalClass");
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EFEC9138) & 1) == 0)
  {
    _AIDALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_2();
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v7 = objc_msgSend(objc_alloc((Class)v6), "initWithAccountStore:", *(_QWORD *)(a1 + 32));
  _AIDALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1D4C1F000, v9, OS_LOG_TYPE_DEFAULT, "Allocated and initialized service owner: %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = v7;
    v10 = v7;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_1();

    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (AIDAServiceOwnersManager)initWithAccountStore:(id)a3
{
  id v5;
  AIDAServiceOwnersManager *v6;
  AIDAServiceOwnersManager *v7;
  NSDictionary *serviceOwners;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AIDAServiceOwnersManager;
  v6 = -[AIDAServiceOwnersManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    serviceOwners = v6->_serviceOwners;
    v6->_serviceOwners = 0;

    v7->_serviceOwnersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_accountStore, a3);
  }

  return v7;
}

void __47__AIDAServiceOwnersManager_serviceOwnerBundles__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C8F2F0], "pluginBundlesAtSubpath:", CFSTR("ServiceOwners"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceOwnerBundles_serviceOwnerBundles;
  serviceOwnerBundles_serviceOwnerBundles = v0;

}

- (AIDAServiceOwnersManager)init
{
  -[AIDAServiceOwnersManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (void)_set_loadServiceOwnerBundlesIfNeeded_onceToken:(int64_t)a3
{
  _loadServiceOwnerBundlesIfNeededOnceToken = a3;
}

+ (id)_loadServiceOwnerBundlesIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AIDAServiceOwnersManager__loadServiceOwnerBundlesIfNeeded__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_loadServiceOwnerBundlesIfNeededOnceToken != -1)
    dispatch_once(&_loadServiceOwnerBundlesIfNeededOnceToken, block);
  return (id)_loadServiceOwnerBundlesIfNeeded_bundles;
}

void __60__AIDAServiceOwnersManager__loadServiceOwnerBundlesIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadServiceOwnerBundles");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_loadServiceOwnerBundlesIfNeeded_bundles;
  _loadServiceOwnerBundlesIfNeeded_bundles = v1;

}

+ (id)_loadServiceOwnerBundles
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "serviceOwnerBundles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AIDALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_1D4C1F000, v4, OS_LOG_TYPE_DEFAULT, "Building AIDA service owner bundle mapping for bundles: %@", buf, 0xCu);
  }

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "_rejectionlistedBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke;
  v15 = &unk_1E985B780;
  v16 = v6;
  v7 = v5;
  v17 = v7;
  v8 = v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v12);
  _AIDALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_1D4C1F000, v9, OS_LOG_TYPE_DEFAULT, "Completed building AIDA service owner mapping with result: %@", buf, 0xCu);
  }

  v10 = (void *)objc_msgSend(v7, "copy", v12, v13, v14, v15);
  return v10;
}

void __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  _AIDALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_impl(&dword_1D4C1F000, v7, OS_LOG_TYPE_DEFAULT, "Skipping rejectionlisted AIDA bundle: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_impl(&dword_1D4C1F000, v7, OS_LOG_TYPE_DEFAULT, "Loading AIDA service owner bundle: %@", buf, 0xCu);
    }

    v24 = 0;
    v9 = objc_msgSend(v3, "loadAndReturnError:", &v24);
    v7 = v24;
    _AIDALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v3;
        _os_log_impl(&dword_1D4C1F000, v11, OS_LOG_TYPE_DEFAULT, "Loaded bundle: %@", buf, 0xCu);
      }

      v12 = (void *)objc_msgSend(v3, "principalClass");
      if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1EFEC9138) & 1) != 0)
      {
        objc_msgSend(v12, "supportedServices");
        v11 = objc_claimAutoreleasedReturnValue();
        v13 = -[NSObject count](v11, "count");
        _AIDALogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v27 = v3;
            v28 = 2112;
            v29 = v12;
            v30 = 2112;
            v31 = v11;
            _os_log_impl(&dword_1D4C1F000, v15, OS_LOG_TYPE_DEFAULT, "Loaded AIDA service owner bundle (%@) with principal class (%@) for services: %@", buf, 0x20u);
          }

          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v15 = v11;
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v21 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
              }
              v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
            }
            while (v17);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke_cold_1();
        }

      }
      else
      {
        _AIDALogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_2();
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke_cold_3();
    }

  }
}

+ (void)configureProcessSpecificServiceOwnerRejectionlist:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AIDALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D4C1F000, v4, OS_LOG_TYPE_DEFAULT, "Configuring process-specific rejectionlist: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = objc_msgSend(v3, "copy");
  v6 = (void *)_AIDAServiceOwnersManagerRejectionlist;
  _AIDAServiceOwnersManagerRejectionlist = v5;

}

+ (id)_rejectionlistedBundleIDs
{
  return (id)objc_msgSend((id)_AIDAServiceOwnersManagerRejectionlist, "copy");
}

+ (void)configureProcessSpecificSupplementalServiceTypes:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AIDALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D4C1F000, v4, OS_LOG_TYPE_DEFAULT, "Configuring process-specific supplemental services: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = objc_msgSend(v3, "copy");
  v6 = (void *)_AIDAServiceOwnersManagerSupplementalServiceTypes;
  _AIDAServiceOwnersManagerSupplementalServiceTypes = v5;

}

+ (id)_supplementalServiceTypes
{
  return (id)objc_msgSend((id)_AIDAServiceOwnersManagerSupplementalServiceTypes, "copy");
}

+ (NSArray)supportedServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;

  objc_msgSend(a1, "_loadServiceOwnerBundlesIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_supplementalServiceTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "unionSet:", v7);
  if (objc_msgSend(v6, "containsObject:", CFSTR("com.apple.AppleID.Service.Cloud")))
  {
    objc_msgSend(v6, "removeObject:", CFSTR("com.apple.AppleID.Service.Cloud"));
    objc_msgSend(v6, "insertObject:atIndex:", CFSTR("com.apple.AppleID.Service.Cloud"), 0);
  }
  _AIDALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[AIDAServiceOwnersManager supportedServices].cold.1();

  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (id)altDSIDForAccount:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[AIDAServiceOwnersManager serviceOwners](self, "serviceOwners");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "altDSIDForAccount:service:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)DSIDForAccount:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[AIDAServiceOwnersManager serviceOwners](self, "serviceOwners");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "DSIDForAccount:service:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)nameComponentsForAccount:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[AIDAServiceOwnersManager serviceOwners](self, "serviceOwners");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nameComponentsForAccount:service:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)signInService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AIDAServiceOwnersManager serviceOwners](self, "serviceOwners");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = _os_activity_create(&dword_1D4C1F000, "AIDA/signInService", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v13, &state);
    _AIDASignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = _AIDASignpostCreate(v14);
    v17 = v16;

    _AIDASignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138543362;
      v32 = (os_signpost_id_t)v8;
      _os_signpost_emit_with_name_impl(&dword_1D4C1F000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SignInService", " ServiceType=%{public,signpost.telemetry:string1,name=ServiceType}@  enableTelemetry=YES ", buf, 0xCu);
    }

    _AIDASignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v32 = v15;
      v33 = 2114;
      v34 = v8;
      _os_log_impl(&dword_1D4C1F000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInService  ServiceType=%{public,signpost.telemetry:string1,name=ServiceType}@  enableTelemetry=YES ", buf, 0x16u);
    }

    v21 = (void *)objc_msgSend(v9, "copy");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__AIDAServiceOwnersManager_signInService_withContext_completion___block_invoke;
    v24[3] = &unk_1E985B7A8;
    v24[4] = self;
    v28 = v15;
    v29 = v17;
    v25 = v8;
    v22 = v21;
    v26 = v22;
    v27 = v10;
    objc_msgSend(v12, "signInService:withContext:completion:", v25, v22, v24);

    os_activity_scope_leave(&state);
  }
  else
  {
    _AIDALogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[AIDAServiceOwnersManager signInService:withContext:completion:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "aida_errorWithCode:", -1001);
    v13 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, NSObject *))v10 + 2))(v10, 0, v13);
  }

}

void __65__AIDAServiceOwnersManager_signInService_withContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[8];
  v9 = a1[9];
  v10 = a3;
  objc_msgSend(v5, "_completeSignInSignpost:forService:context:success:error:", v8, v9, v6, v7, a2, v10);
  (*(void (**)(void))(a1[7] + 16))();

}

- (void)signInToAllServicesInBackgroundUsingContext:(id)a3 completion:(id)a4
{
  -[AIDAServiceOwnersManager signInToAllServicesInBackground:usingContext:completion:](self, "signInToAllServicesInBackground:usingContext:completion:", 1, a3, a4);
}

- (id)_postCloudSupportedServicesForAltDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[AIDAServiceOwnersManager accountForService:](self, "accountForService:", CFSTR("com.apple.AppleID.Service.Cloud"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[AIDAServiceOwnersManager altDSIDForAccount:service:](self, "altDSIDForAccount:service:", v5, CFSTR("com.apple.AppleID.Service.Cloud"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && objc_msgSend(v4, "isEqualToString:", v6))
      {
        +[AIDAServiceOwnersManager supportedServices](AIDAServiceOwnersManager, "supportedServices");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "mutableCopy");

        objc_msgSend(v8, "removeObject:", CFSTR("com.apple.AppleID.Service.Cloud"));
        v9 = (void *)objc_msgSend(v8, "copy");

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)signInToAllServicesInBackground:(BOOL)a3 usingContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  _AIDALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AIDAServiceOwnersManager signInToAllServicesInBackground:usingContext:completion:].cold.2(v8, v10);

  _AIDALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AIDAServiceOwnersManager signInToAllServicesInBackground:usingContext:completion:].cold.1(v8, v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke;
  v14[3] = &unk_1E985B848;
  v15 = v8;
  v16 = v9;
  v14[4] = self;
  v17 = a3;
  v12 = v8;
  v13 = v9;
  -[AIDAServiceOwnersManager signInService:withContext:completion:](self, "signInService:withContext:completion:", CFSTR("com.apple.AppleID.Service.Cloud"), v12, v14);

}

void __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  NSObject *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  char v17;
  char v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  id obj;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t *v28;
  char v29;
  char v30;
  _QWORD block[5];
  id v32;
  NSObject *v33;
  uint8_t *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  if (v22)
  {
    _AIDALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4C1F000, v5, OS_LOG_TYPE_DEFAULT, "Failed global signin with authentication results for cloud service.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v21 = a1;
    v7 = *(void **)(a1 + 32);
    v6 = (id *)(a1 + 32);
    objc_msgSend(v6[1], "authenticationResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AKAltDSID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_postCloudSupportedServicesForAltDSID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(v6[1], "mutableCopy");
    objc_msgSend(v24, "setOperationUIPermissions:", 0);
    v11 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    v40 = buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    v44 = *v6;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          dispatch_group_enter(v11);
          dispatch_get_global_queue(33, 0);
          v16 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_89;
          block[3] = &unk_1E985B7F8;
          block[4] = v15;
          v34 = buf;
          v32 = v24;
          v33 = v11;
          dispatch_async(v16, block);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v12);
    }

    if (*(_BYTE *)(v21 + 56))
    {
      v17 = a2;
      (*(void (**)(void))(*(_QWORD *)(v21 + 48) + 16))();
      v18 = *(_BYTE *)(v21 + 56);
    }
    else
    {
      v18 = 0;
      v17 = a2;
    }
    dispatch_get_global_queue(33, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_93;
    v25[3] = &unk_1E985B820;
    v29 = v18;
    v20 = *(id *)(v21 + 48);
    v30 = v17;
    v26 = 0;
    v27 = v20;
    v28 = buf;
    dispatch_group_notify(v11, v19, v25);

    _Block_object_dispose(buf, 8);
  }

}

void __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_89(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _AIDALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1D4C1F000, v2, OS_LOG_TYPE_DEFAULT, "Logging into service %{public}@", buf, 0xCu);
  }

  v4 = (void *)a1[6];
  v5 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  v7 = a1[4];
  v6 = a1[5];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_90;
  v8[3] = &unk_1E985B7D0;
  v8[4] = v7;
  v9 = v4;
  objc_msgSend(v5, "signInService:withContext:completion:", v7, v6, v8);

}

void __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_90(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AIDALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138412802;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D4C1F000, v6, OS_LOG_TYPE_DEFAULT, "Log in to service %@ completed with result: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_93(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(a1 + 56))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)signInToServices:(id)a3 usingContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  _QWORD v21[4];
  __CFString *v22;
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD);
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = MEMORY[0x1E0C809B0];
  v32 = v11;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke;
  v27[3] = &unk_1E985B8E8;
  v27[4] = self;
  v13 = v9;
  v28 = v13;
  v30 = v31;
  v14 = v10;
  v29 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D826560C](v27);
  v16 = (void *)objc_msgSend(v8, "mutableCopy");
  if (!objc_msgSend(v16, "containsObject:", CFSTR("com.apple.AppleID.Service.Cloud")))
  {
    v18 = v8;
    goto LABEL_7;
  }
  v17 = CFSTR("com.apple.AppleID.Service.Cloud");
  objc_msgSend(v16, "removeObject:", v17);
  v18 = (void *)objc_msgSend(v16, "copy");

  if (!v17)
  {
LABEL_7:
    ((void (**)(_QWORD, void *))v15)[2](v15, v16);
    goto LABEL_8;
  }
  _AIDALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v17;
    _os_log_impl(&dword_1D4C1F000, v19, OS_LOG_TYPE_DEFAULT, "signInToServices - Logging into service %{public}@", buf, 0xCu);
  }

  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_98;
  v21[3] = &unk_1E985B910;
  v26 = v31;
  v20 = v17;
  v22 = v20;
  v24 = v14;
  v25 = v15;
  v23 = v16;
  -[AIDAServiceOwnersManager signInService:withContext:completion:](self, "signInService:withContext:completion:", v20, v13, v21);

LABEL_8:
  _Block_object_dispose(v31, 8);

}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  id obj;
  _QWORD v17[4];
  __int128 v18;
  _QWORD *v19;
  _QWORD block[6];
  id v21;
  NSObject *v22;
  _QWORD *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[3];
  char v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 1;
  v4 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7);
        dispatch_group_enter(v4);
        dispatch_get_global_queue(33, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_2;
        block[3] = &unk_1E985B898;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v8;
        block[5] = v10;
        v21 = v11;
        v12 = *(_QWORD *)(a1 + 56);
        v23 = v29;
        v24 = v12;
        v22 = v4;
        dispatch_async(v9, block);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v5);
  }

  dispatch_get_global_queue(33, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_2_96;
  v17[3] = &unk_1E985B8C0;
  v19 = v29;
  v15 = *(_OWORD *)(a1 + 48);
  v14 = (id)v15;
  v18 = v15;
  dispatch_group_notify(v4, v13, v17);

  _Block_object_dispose(v29, 8);
}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AIDALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1D4C1F000, v2, OS_LOG_TYPE_DEFAULT, "signInToServices - Logging into service %{public}@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_94;
  v9[3] = &unk_1E985B870;
  v8 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  v9[4] = v5;
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v4, "signInService:withContext:completion:", v5, v6, v9);

}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_94(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  AIDAServiceOperationResult *v6;

  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  v5 = a3;
  v6 = -[AIDAServiceOperationResult initWithSuccess:error:type:]([AIDAServiceOperationResult alloc], "initWithSuccess:error:type:", a2, v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_2_96(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "copy");
  _AIDALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = 138412546;
    v6 = v4;
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1D4C1F000, v3, OS_LOG_TYPE_DEFAULT, "signInToServices completed with success %@ and results: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_98(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  AIDAServiceOperationResult *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[AIDAServiceOperationResult initWithSuccess:error:type:]([AIDAServiceOperationResult alloc], "initWithSuccess:error:type:", a2, v5, a1[4]);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "setObject:forKeyedSubscript:", v6, a1[4]);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[5]);
  }
  else
  {
    _AIDALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D4C1F000, v7, OS_LOG_TYPE_DEFAULT, "signInToServices failed sign in for primary account with results: %@", (uint8_t *)&v11, 0xCu);
    }

    v9 = a1[6];
    v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "copy");
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

- (void)signOutService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  _BYTE buf[22];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AIDASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AIDASignpostCreate(v11);
  v14 = v13;

  _AIDASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v8;
    _os_signpost_emit_with_name_impl(&dword_1D4C1F000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SignOutService", " ServiceType=%{public,signpost.telemetry:string1,name=ServiceType}@  enableTelemetry=YES ", buf, 0xCu);
  }

  _AIDASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1D4C1F000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutService  ServiceType=%{public,signpost.telemetry:string1,name=ServiceType}@  enableTelemetry=YES ", buf, 0x16u);
  }

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__AIDAServiceOwnersManager_signOutService_withContext_completion___block_invoke;
  v24[3] = &unk_1E985B938;
  v26 = v12;
  v27 = v14;
  v18 = v10;
  v25 = v18;
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D826560C](v24);
  -[AIDAServiceOwnersManager serviceOwners](self, "serviceOwners");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = _os_activity_create(&dword_1D4C1F000, "AIDA/signOutService", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v22, (os_activity_scope_state_t)buf);
    v23 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v21, "signOutService:withContext:completion:", v8, v23, v19);

    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "aida_errorWithCode:", -1001);
    v22 = objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSObject *))v19)[2](v19, 0, v22);
  }

}

void __66__AIDAServiceOwnersManager_signOutService_withContext_completion___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  int v14;
  _BYTE v15[10];
  double v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _AIDASignpostGetNanoseconds(a1[5], a1[6]);
  _AIDASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v14 = 67240448;
    *(_DWORD *)v15 = a2;
    *(_WORD *)&v15[4] = 1026;
    *(_DWORD *)&v15[6] = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_1D4C1F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignOutService", " Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0xEu);
  }

  _AIDASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v14 = 134218752;
    *(_QWORD *)v15 = v12;
    *(_WORD *)&v15[8] = 2048;
    v16 = v11;
    v17 = 1026;
    v18 = a2;
    v19 = 1026;
    v20 = v13;
    _os_log_impl(&dword_1D4C1F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignOutService  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0x22u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)signOutOfAllServicesUsingContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  +[AIDAServiceOwnersManager supportedServices](AIDAServiceOwnersManager, "supportedServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__AIDAServiceOwnersManager_signOutOfAllServicesUsingContext_completion___block_invoke;
  v10[3] = &unk_1E985B960;
  v11 = v6;
  v9 = v6;
  -[AIDAServiceOwnersManager signOutOfServices:usingContext:completion:](self, "signOutOfServices:usingContext:completion:", v8, v7, v10);

}

void __72__AIDAServiceOwnersManager_signOutOfAllServicesUsingContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("com.apple.AppleID.Service.Cloud"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "success");
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
  }

}

- (void)signOutOfServices:(id)a3 usingContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  _QWORD v21[4];
  __CFString *v22;
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD);
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = MEMORY[0x1E0C809B0];
  v32 = v11;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke;
  v27[3] = &unk_1E985B8E8;
  v27[4] = self;
  v13 = v9;
  v28 = v13;
  v30 = v31;
  v14 = v10;
  v29 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D826560C](v27);
  v16 = (void *)objc_msgSend(v8, "mutableCopy");
  if (!objc_msgSend(v16, "containsObject:", CFSTR("com.apple.AppleID.Service.Cloud")))
  {
    v18 = v8;
    goto LABEL_7;
  }
  v17 = CFSTR("com.apple.AppleID.Service.Cloud");
  objc_msgSend(v16, "removeObject:", v17);
  v18 = (void *)objc_msgSend(v16, "copy");

  if (!v17)
  {
LABEL_7:
    ((void (**)(_QWORD, void *))v15)[2](v15, v16);
    goto LABEL_8;
  }
  _AIDALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v17;
    _os_log_impl(&dword_1D4C1F000, v19, OS_LOG_TYPE_DEFAULT, "signOutOfServices - Logging out of primary service %{public}@", buf, 0xCu);
  }

  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_102;
  v21[3] = &unk_1E985B910;
  v26 = v31;
  v20 = v17;
  v22 = v20;
  v24 = v14;
  v25 = v15;
  v23 = v16;
  -[AIDAServiceOwnersManager signOutService:withContext:completion:](self, "signOutService:withContext:completion:", v20, v13, v21);

LABEL_8:
  _Block_object_dispose(v31, 8);

}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  id obj;
  _QWORD v17[4];
  __int128 v18;
  _QWORD *v19;
  _QWORD block[6];
  id v21;
  NSObject *v22;
  _QWORD *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[3];
  char v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 1;
  v4 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7);
        dispatch_group_enter(v4);
        dispatch_get_global_queue(33, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_2;
        block[3] = &unk_1E985B898;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v8;
        block[5] = v10;
        v21 = v11;
        v12 = *(_QWORD *)(a1 + 56);
        v23 = v29;
        v24 = v12;
        v22 = v4;
        dispatch_async(v9, block);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v5);
  }

  dispatch_get_global_queue(33, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_2_101;
  v17[3] = &unk_1E985B8C0;
  v19 = v29;
  v15 = *(_OWORD *)(a1 + 48);
  v14 = (id)v15;
  v18 = v15;
  dispatch_group_notify(v4, v13, v17);

  _Block_object_dispose(v29, 8);
}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AIDALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1D4C1F000, v2, OS_LOG_TYPE_DEFAULT, "signOutOfServices - Logging out of service %{public}@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_100;
  v9[3] = &unk_1E985B870;
  v8 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  v9[4] = v5;
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v4, "signOutService:withContext:completion:", v5, v6, v9);

}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_100(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  AIDAServiceOperationResult *v6;

  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  v5 = a3;
  v6 = -[AIDAServiceOperationResult initWithSuccess:error:type:]([AIDAServiceOperationResult alloc], "initWithSuccess:error:type:", a2, v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_2_101(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "copy");
  _AIDALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = 138412546;
    v6 = v4;
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1D4C1F000, v3, OS_LOG_TYPE_DEFAULT, "signOutOfServices completed with success %@ and results: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_102(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  AIDAServiceOperationResult *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[AIDAServiceOperationResult initWithSuccess:error:type:]([AIDAServiceOperationResult alloc], "initWithSuccess:error:type:", a2, v5, a1[4]);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "setObject:forKeyedSubscript:", v6, a1[4]);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[5]);
  }
  else
  {
    _AIDALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D4C1F000, v7, OS_LOG_TYPE_DEFAULT, "signOutOfServices failed sign out for primary account with results: %@", (uint8_t *)&v11, 0xCu);
    }

    v9 = a1[6];
    v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "copy");
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

+ (id)_sharedTelemetryReporter
{
  if (_sharedTelemetryReporter_once != -1)
    dispatch_once(&_sharedTelemetryReporter_once, &__block_literal_global_103);
  return (id)_sharedTelemetryReporter_reporter;
}

void __52__AIDAServiceOwnersManager__sharedTelemetryReporter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF0E70], "analyticsReporterWithTransport:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sharedTelemetryReporter_reporter;
  _sharedTelemetryReporter_reporter = v0;

}

- (void)_completeSignInSignpost:(id)a3 forService:(id)a4 context:(id)a5 success:(BOOL)a6 error:(id)a7
{
  unint64_t var1;
  unint64_t var0;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  double v24;
  NSObject *v25;
  int v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  _BYTE v35[10];
  id v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v29 = a6;
  var1 = a3.var1;
  var0 = a3.var0;
  v41 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a7;
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%@"), "SignInService", v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_errorCode"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_errorDomain"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v12, "_telemetryTimeSeries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v15);

  if (v13)
  objc_msgSend(v13, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_telemetryTimeSeries");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v16);

  Nanoseconds = (double)_AIDASignpostGetNanoseconds(var0, var1);
  _AIDASignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (var0 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138543874;
    v33 = (unint64_t)v11;
    v34 = 1026;
    *(_DWORD *)v35 = v29;
    *(_WORD *)&v35[4] = 1026;
    *(_DWORD *)&v35[6] = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_1D4C1F000, v23, OS_SIGNPOST_INTERVAL_END, var0, "SignInService", " ServiceType=%{public,signpost.telemetry:string2,name=ServiceType}@  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x18u);
  }
  v24 = Nanoseconds / 1000000000.0;

  _AIDASignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_msgSend(v13, "code");
    *(_DWORD *)buf = 134219010;
    v33 = var0;
    v34 = 2048;
    *(double *)v35 = v24;
    *(_WORD *)&v35[8] = 2114;
    v36 = v11;
    v37 = 1026;
    v38 = v29;
    v39 = 1026;
    v40 = v26;
    _os_log_impl(&dword_1D4C1F000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInService  ServiceType=%{public,signpost.telemetry:string2,name=ServiceType}@  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x2Cu);
  }

  objc_msgSend(v12, "_telemetryTimeSeries");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, v14);

  -[AIDAServiceOwnersManager _publishSignInTelemetryEventForContext:](self, "_publishSignInTelemetryEventForContext:", v12);
}

- (void)_publishSignInTelemetryEventForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_telemetryTimeSeries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  _AIDALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D4C1F000, v6, OS_LOG_TYPE_DEFAULT, "Publishing AIDA sign in telemetry event for context (%@) with time series: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF0E68], "analyticsEventWithName:eventCategory:initData:", CFSTR("com.apple.com.apple.appleidauthentication.sign-in-service"), 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AIDAServiceOwnersManager _sharedTelemetryReporter](AIDAServiceOwnersManager, "_sharedTelemetryReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", v7);

  _AIDALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1D4C1F000, v9, OS_LOG_TYPE_DEFAULT, "Published AIDA sign in telemetry event for context (%@)", (uint8_t *)&v10, 0xCu);
  }

}

- (void)setServiceOwners:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

void __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D4C1F000, v0, v1, "Failed to allocate service owner for bundle: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D4C1F000, v0, v1, "Non-conformant principal class for bundle: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1D4C1F000, v0, OS_LOG_TYPE_FAULT, "Bundle already expected to be loaded: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D4C1F000, v0, v1, "Missing supported services for bundle: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1D4C1F000, v1, OS_LOG_TYPE_ERROR, "Failed to load bundle (%{public}@), error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)supportedServices
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D4C1F000, v0, v1, "AIDA returning supported services: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)signInService:withContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D4C1F000, v0, v1, "Sign in service attempted with an unsupported service type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)signInToAllServicesInBackground:(void *)a1 usingContext:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "aaSignInFlowControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("YES");
  if (!v4)
    v5 = 0;
  v6 = 138412290;
  v7 = v5;
  OUTLINED_FUNCTION_3(&dword_1D4C1F000, a2, v3, "AAFlowControllerDelegate set on context: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_4();
}

- (void)signInToAllServicesInBackground:(void *)a1 usingContext:(NSObject *)a2 completion:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "cdpUiProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("YES");
  if (!v4)
    v5 = 0;
  v6 = 138412290;
  v7 = v5;
  OUTLINED_FUNCTION_3(&dword_1D4C1F000, a2, v3, "CDP provider set on context: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_4();
}

@end
