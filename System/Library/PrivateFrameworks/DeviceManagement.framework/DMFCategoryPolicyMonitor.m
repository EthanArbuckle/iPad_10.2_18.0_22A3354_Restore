@implementation DMFCategoryPolicyMonitor

- (DMFCategoryPolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  id v4;
  DMFCategoryPolicyMonitor *v5;
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
  DMFCategoryPolicyMonitor *v17;
  objc_super v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMFCategoryPolicyMonitor;
  v5 = -[DMFCategoryPolicyMonitor init](&v18, sel_init);
  if (v5)
  {
    v19[0] = CFSTR("applicationcategories");
    v19[1] = CFSTR("categories");
    v19[2] = CFSTR("shield");
    v19[3] = CFSTR("websitecategories");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
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
      v12 = -[DMFPolicyRegistration initWithIdentifier:policyTypes:callback:](v10, "initWithIdentifier:policyTypes:callback:", CFSTR("dmf.policy.monitor.category"), v11, v4);

      +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5->_identifier;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __56__DMFCategoryPolicyMonitor_initWithPolicyChangeHandler___block_invoke;
      v16[3] = &unk_1E6ED7C28;
      v17 = v5;
      objc_msgSend(v13, "addRegistration:forPolicyMonitorIdentifier:completionHandler:", v12, v14, v16);

    }
  }

  return v5;
}

void __56__DMFCategoryPolicyMonitor_initWithPolicyChangeHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (!a2)
  {
    DMFPolicyLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__DMFCategoryPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(a1, (uint64_t)v5, v6);

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
  v4.super_class = (Class)DMFCategoryPolicyMonitor;
  -[DMFCategoryPolicyMonitor dealloc](&v4, sel_dealloc);
}

- (void)requestPoliciesForCategoryIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __84__DMFCategoryPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke;
  v16 = &unk_1E6ED7C50;
  v17 = v6;
  v18 = v7;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x1BCCB7F34](&v13);
  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFCategoryPolicyMonitor policyTypes](self, "policyTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestPoliciesForTypes:completionHandler:", v12, v10);

}

void __84__DMFCategoryPolicyMonitor_requestPoliciesForCategoryIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("applicationcategories"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("categories"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v3;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("websitecategories"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[DMFEffectivePolicy unblockableCategoryIdentifiers](DMFEffectivePolicy, "unblockableCategoryIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v24 = a1;
      v7 = *(id *)(a1 + 32);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11);
            if (objc_msgSend(v6, "containsObject:", v12, v24))
            {
              DMFPolicyLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v37 = v12;
                _os_log_impl(&dword_1B8C0C000, v13, OS_LOG_TYPE_DEFAULT, "Requested category %{public}@ is unblockable", buf, 0xCu);
              }

              objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6EF2D90, v12);
            }
            else
            {
              v14 = objc_msgSend(v5, "policyForIdentifier:excludableIdentifiers:", v12, 0);
              if (v14
                || (v14 = objc_msgSend(v27, "policyForIdentifier:excludableIdentifiers:", v12, 0)) != 0
                || (v14 = objc_msgSend(v26, "policyForIdentifier:excludableIdentifiers:", v12, 0)) != 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
                v15 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v12);
              }
              else
              {
                DMFPolicyLog();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  DMFPolicyUnlocalizedDisplayName(0);
                  v16 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v37 = v12;
                  v38 = 2114;
                  v39 = v16;
                  v17 = (void *)v16;
                  _os_log_impl(&dword_1B8C0C000, v15, OS_LOG_TYPE_DEFAULT, "Requested category %{public}@ has policy %{public}@", buf, 0x16u);

                }
              }

            }
            ++v11;
          }
          while (v9 != v11);
          v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          v9 = v18;
        }
        while (v18);
      }

      (*(void (**)(void))(*(_QWORD *)(v24 + 40) + 16))();
      v3 = v25;
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v19 = *(id *)(a1 + 32);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6EF2D90, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v21);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

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

void __56__DMFCategoryPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1B8C0C000, log, OS_LOG_TYPE_ERROR, "Failed to register category policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end
