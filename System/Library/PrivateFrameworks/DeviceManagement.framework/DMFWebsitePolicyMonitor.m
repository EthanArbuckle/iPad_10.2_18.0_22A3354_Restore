@implementation DMFWebsitePolicyMonitor

- (DMFWebsitePolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  id v4;
  DMFWebsitePolicyMonitor *v5;
  uint64_t v6;
  NSArray *policyTypes;
  uint64_t v8;
  NSUUID *identifier;
  DMFPolicyRegistration *v10;
  void *v11;
  DMFPolicyRegistration *v12;
  void *v13;
  NSUUID *v14;
  _QWORD v16[4];
  DMFWebsitePolicyMonitor *v17;
  objc_super v18;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMFWebsitePolicyMonitor;
  v5 = -[DMFWebsitePolicyMonitor init](&v18, sel_init);
  if (v5)
  {
    v19[0] = CFSTR("applications");
    v19[1] = CFSTR("categories");
    v19[2] = CFSTR("shield");
    v19[3] = CFSTR("websites");
    v19[4] = CFSTR("websitecategories");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
    v6 = objc_claimAutoreleasedReturnValue();
    policyTypes = v5->_policyTypes;
    v5->_policyTypes = (NSArray *)v6;

    v8 = objc_opt_new();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    if (v4)
    {
      v10 = [DMFPolicyRegistration alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5->_policyTypes);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[DMFPolicyRegistration initWithIdentifier:policyTypes:callback:](v10, "initWithIdentifier:policyTypes:callback:", CFSTR("dmf.policy.monitor.web"), v11, v4);

      +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5->_identifier;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __55__DMFWebsitePolicyMonitor_initWithPolicyChangeHandler___block_invoke;
      v16[3] = &unk_1E6ED7C28;
      v17 = v5;
      objc_msgSend(v13, "addRegistration:forPolicyMonitorIdentifier:completionHandler:", v12, v14, v16);

    }
  }

  return v5;
}

void __55__DMFWebsitePolicyMonitor_initWithPolicyChangeHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (!a2)
  {
    DMFPolicyLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__DMFWebsitePolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(a1, (uint64_t)v5, v6);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidatePolicyMonitor:", self->_identifier);

  v4.receiver = self;
  v4.super_class = (Class)DMFWebsitePolicyMonitor;
  -[DMFWebsitePolicyMonitor dealloc](&v4, sel_dealloc);
}

- (void)requestPoliciesForWebsites:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  DMFWebsitePolicyMonitor *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__DMFWebsitePolicyMonitor_requestPoliciesForWebsites_completionHandler___block_invoke;
  v13[3] = &unk_1E6ED8B10;
  v15 = self;
  v16 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x1BCCB7F34](v13);
  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFWebsitePolicyMonitor policyTypes](self, "policyTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestPoliciesForTypes:completionHandler:", v12, v10);

}

void __72__DMFWebsitePolicyMonitor_requestPoliciesForWebsites_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    if (objc_msgSend(v3, "count"))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __72__DMFWebsitePolicyMonitor_requestPoliciesForWebsites_completionHandler___block_invoke_10;
      v12[3] = &unk_1E6ED7CC8;
      v16 = *(id *)(a1 + 48);
      v13 = v3;
      v14 = *(id *)(a1 + 32);
      v15 = v4;
      objc_msgSend(v5, "_fetchCategoriesIfNeededForWebsiteURLs:response:", v6, v12);

    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = *(id *)(a1 + 32);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6EF4098, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __72__DMFWebsitePolicyMonitor_requestPoliciesForWebsites_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  uint8_t v61[4];
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_42;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("applications"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("categories"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("websites"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("websitecategories"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMFEffectivePolicy unblockableBundleIdentifiers](DMFEffectivePolicy, "unblockableBundleIdentifiers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMFEffectivePolicy unblockableCategoryIdentifiers](DMFEffectivePolicy, "unblockableCategoryIdentifiers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = *(id *)(a1 + 40);
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (!v47)
    goto LABEL_36;
  v46 = *(_QWORD *)v55;
  v4 = 0x1E0C99000uLL;
  v36 = v3;
  v45 = a1;
  do
  {
    for (i = 0; i != v47; ++i)
    {
      if (*(_QWORD *)v55 != v46)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      objc_msgSend(v3, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "webDomains");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "equivalentBundleIdentifiers");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v9;
      if (v10)
      {
        v11 = v3;
        v12 = a1;
        objc_msgSend(*(id *)(v4 + 3616), "setWithObject:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
          objc_msgSend(v13, "addObjectsFromArray:", v9);
        v48 = v13;
        v14 = (void *)objc_opt_new();
        v15 = v14;
        if (v8)
          objc_msgSend(v14, "addObject:", v8);
        a1 = v12;
        if (objc_msgSend(v51, "count"))
          objc_msgSend(v15, "addObjectsFromArray:", v51);
        v3 = v11;
        if (v8 && objc_msgSend(v42, "containsObject:", v8))
        {
          DMFPolicyLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v60 = v8;
            v17 = v16;
            v18 = "Requested website with associated bundle identifier %{public}@ is unblockable";
            goto LABEL_22;
          }
          goto LABEL_23;
        }
        if (v50)
        {
          if (objc_msgSend(v35, "containsObject:", v50))
          {
            DMFPolicyLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v50;
              v17 = v16;
              v18 = "Requested website with associated category %{public}@ is unblockable";
LABEL_22:
              _os_log_impl(&dword_1B8C0C000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
            }
LABEL_23:

            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", &unk_1E6EF4098, v6);
            v4 = 0x1E0C99000;
LABEL_33:

            goto LABEL_34;
          }
          v58 = v50;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v15, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)v20;
        +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:](DMFPrioritizedPolicy, "prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:", v40, 0, v21, v39, v20, v38, v37, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:](DMFPrioritizedPolicy, "arbitratePolicyForPrioritizedPolicies:", v23));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v45 + 48), "setObject:forKeyedSubscript:", v24, v6);
        objc_msgSend(v41, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v41, "objectForKeyedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v28, v24);

        }
        else
        {
          objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_1E6EF40B0, v24);
        }
        v3 = v36;
        v4 = 0x1E0C99000;

        a1 = v45;
        goto LABEL_33;
      }
      DMFPolicyLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __72__DMFWebsitePolicyMonitor_requestPoliciesForWebsites_completionHandler___block_invoke_10_cold_1(v61, &v62, v19);

      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", &unk_1E6EF4098, v6);
LABEL_34:

    }
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  }
  while (v47);
LABEL_36:

  DMFPolicyLog();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v41, "count"));
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __72__DMFWebsitePolicyMonitor_requestPoliciesForWebsites_completionHandler___block_invoke_18;
    v52[3] = &unk_1E6ED8AE8;
    v32 = v31;
    v53 = v32;
    objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v52);
    DMFPolicyLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v34;
      _os_log_impl(&dword_1B8C0C000, v33, OS_LOG_TYPE_DEFAULT, "Requested websites policy counts: %{public}@", buf, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_42:
}

void __72__DMFWebsitePolicyMonitor_requestPoliciesForWebsites_completionHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  DMFPolicyUnlocalizedDisplayName(objc_msgSend(a2, "integerValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: %@"), v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v7);
}

- (void)_fetchCategoriesIfNeededForWebsiteURLs:(id)a3 response:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D0D508], "sharedCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__DMFWebsitePolicyMonitor__fetchCategoriesIfNeededForWebsiteURLs_response___block_invoke;
    v8[3] = &unk_1E6ED7D18;
    v9 = v6;
    objc_msgSend(v7, "categoriesForDomainURLs:completionHandler:", v5, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA70], 0);
  }

}

void __75__DMFWebsitePolicyMonitor__fetchCategoriesIfNeededForWebsiteURLs_response___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    DMFPolicyLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __75__DMFWebsitePolicyMonitor__fetchCategoriesIfNeededForWebsiteURLs_response___block_invoke_cold_1((uint64_t)v4, v5);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (NSArray)policyTypes
{
  return self->_policyTypes;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_policyTypes, 0);
}

void __55__DMFWebsitePolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = 138543874;
  v6 = v4;
  v7 = 2114;
  v8 = v3;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1B8C0C000, log, OS_LOG_TYPE_ERROR, "Failed to register website policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void __72__DMFWebsitePolicyMonitor_requestPoliciesForWebsites_completionHandler___block_invoke_10_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  void *v6;

  DMFPolicyUnlocalizedDisplayName(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a2 = v6;
  _os_log_error_impl(&dword_1B8C0C000, a3, OS_LOG_TYPE_ERROR, "Requested website URL does not have a host, marking policy %{public}@", a1, 0xCu);

}

void __75__DMFWebsitePolicyMonitor__fetchCategoriesIfNeededForWebsiteURLs_response___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B8C0C000, a2, OS_LOG_TYPE_ERROR, "Failed fetching categories for domain URLs with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
