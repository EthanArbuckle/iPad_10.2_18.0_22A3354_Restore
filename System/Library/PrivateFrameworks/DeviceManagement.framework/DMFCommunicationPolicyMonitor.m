@implementation DMFCommunicationPolicyMonitor

void __63__DMFCommunicationPolicyMonitor_communicationBundleIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.facetime");
  v4[1] = CFSTR("com.apple.FaceTime");
  v4[2] = CFSTR("com.apple.MobileSMS");
  v4[3] = CFSTR("com.apple.iChat");
  v4[4] = CFSTR("com.apple.mobilephone");
  v4[5] = CFSTR("com.apple.NanoPhone");
  v4[6] = CFSTR("com.apple.tincan");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)communicationBundleIdentifiers_bundleIdentifiers;
  communicationBundleIdentifiers_bundleIdentifiers = v2;

}

- (void)requestPoliciesByBundleIdentifierWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFCommunicationPolicyMonitor policyTypes](self, "policyTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__DMFCommunicationPolicyMonitor_requestPoliciesByBundleIdentifierWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6ED7E50;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "requestPoliciesForTypes:completionHandler:", v6, v8);

}

- (NSArray)policyTypes
{
  return self->_policyTypes;
}

- (DMFCommunicationPolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  id v4;
  DMFCommunicationPolicyMonitor *v5;
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
  DMFCommunicationPolicyMonitor *v17;
  objc_super v18;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMFCommunicationPolicyMonitor;
  v5 = -[DMFCommunicationPolicyMonitor init](&v18, sel_init);
  if (v5)
  {
    v19[0] = CFSTR("applications");
    v19[1] = CFSTR("applicationcategories");
    v19[2] = CFSTR("categories");
    v19[3] = CFSTR("downtime");
    v19[4] = CFSTR("shield");
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
      v12 = -[DMFPolicyRegistration initWithIdentifier:policyTypes:callback:](v10, "initWithIdentifier:policyTypes:callback:", CFSTR("dmf.policy.monitor.communication"), v11, v4);

      +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5->_identifier;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke;
      v16[3] = &unk_1E6ED7C28;
      v17 = v5;
      objc_msgSend(v13, "addRegistration:forPolicyMonitorIdentifier:completionHandler:", v12, v14, v16);

    }
  }

  return v5;
}

void __88__DMFCommunicationPolicyMonitor_requestPoliciesByBundleIdentifierWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "_transformEffectivePoliciesIntoCommunicationPolicies:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
    DMFPolicyLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __88__DMFCommunicationPolicyMonitor_requestPoliciesByBundleIdentifierWithCompletionHandler___block_invoke_cold_1(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (!a2)
  {
    DMFPolicyLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1();

  }
}

+ (id)_transformEffectivePoliciesIntoCommunicationPolicies:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "communicationBundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("applications"));
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("applicationcategories"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("categories"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v6)
    {
      v7 = v6;
      v31 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v37 != v31)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend((id)objc_opt_class(), "_equivalentCommunicationBundleIdentifiersForCommunicationBundleIdentifier:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_categoryForCommunicationBundleIdentifier:", v9);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
          {
            v44 = v11;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
          }
          objc_msgSend(v10, "allObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:](DMFPrioritizedPolicy, "prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:", v35, v34, v14, v33, v13, 0, 0, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:](DMFPrioritizedPolicy, "arbitratePolicyForPrioritizedPolicies:", v15);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v17, v9);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v7);
    }

    v18 = (void *)objc_opt_class();
    v19 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v18, "_calculateCommunicationPoliciesWithApplicationPoliciesByBundleIdentifier:categoryEffectivePolicy:applicationCategoryEffectivePolicy:", v19, v33, v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v28;
    v3 = v29;
    v21 = (void *)v35;
  }
  else
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v22 = v4;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E6EF2DD8, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v24);
    }

    v20 = (void *)objc_msgSend(v21, "copy");
  }

  return v20;
}

+ (NSSet)communicationBundleIdentifiers
{
  if (communicationBundleIdentifiers_onceToken != -1)
    dispatch_once(&communicationBundleIdentifiers_onceToken, &__block_literal_global_0);
  return (NSSet *)(id)objc_msgSend((id)communicationBundleIdentifiers_bundleIdentifiers, "copy");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidatePolicyMonitor:", self->_identifier);

  v4.receiver = self;
  v4.super_class = (Class)DMFCommunicationPolicyMonitor;
  -[DMFCommunicationPolicyMonitor dealloc](&v4, sel_dealloc);
}

+ (unint64_t)communicationPolicyForApplicationPolicy:(id)a3 downtimeEnforced:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (objc_msgSend(a3, "integerValue"))
    return 2;
  else
    return v4;
}

- (id)requestPoliciesByBundleIdentifierWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;

  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFCommunicationPolicyMonitor policyTypes](self, "policyTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "requestPoliciesForTypes:withError:", v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "_transformEffectivePoliciesIntoCommunicationPolicies:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DMFPolicyLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DMFCommunicationPolicyMonitor requestPoliciesByBundleIdentifierWithError:].cold.1(self);

    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v9;
}

+ (id)_calculateCommunicationPoliciesWithApplicationPoliciesByBundleIdentifier:(id)a3 categoryEffectivePolicy:(id)a4 applicationCategoryEffectivePolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  char v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = objc_msgSend(v9, "downtimeEnforced");
    if (v11)
    {
LABEL_3:
      v13 = objc_msgSend(v11, "downtimeEnforced");
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
LABEL_6:
  if (v12)
    v14 = 1;
  else
    v14 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __165__DMFCommunicationPolicyMonitor__calculateCommunicationPoliciesWithApplicationPoliciesByBundleIdentifier_categoryEffectivePolicy_applicationCategoryEffectivePolicy___block_invoke;
  v19[3] = &unk_1E6ED7E78;
  v22 = v14;
  v20 = v15;
  v21 = a1;
  v16 = v15;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v19);
  v17 = (void *)objc_msgSend(v16, "copy");

  return v17;
}

void __165__DMFCommunicationPolicyMonitor__calculateCommunicationPoliciesWithApplicationPoliciesByBundleIdentifier_categoryEffectivePolicy_applicationCategoryEffectivePolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend((id)objc_opt_class(), "communicationPolicyForApplicationPolicy:downtimeEnforced:", v5, *(unsigned __int8 *)(a1 + 48));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);

}

+ (id)_equivalentCommunicationBundleIdentifiersForCommunicationBundleIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _equivalentCommunicationBundleIdentifiersForCommunicationBundleIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_equivalentCommunicationBundleIdentifiersForCommunicationBundleIdentifier__onceToken, &__block_literal_global_28);
  objc_msgSend((id)_equivalentCommunicationBundleIdentifiersForCommunicationBundleIdentifier__equivalentBundleIdentifiersByBundleIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __107__DMFCommunicationPolicyMonitor__equivalentCommunicationBundleIdentifiersForCommunicationBundleIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[7];
  _QWORD v31[9];

  v31[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v29[0] = CFSTR("com.apple.facetime");
  v29[1] = CFSTR("com.apple.FaceTime");
  v30[0] = CFSTR("com.apple.facetime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v21;
  v30[1] = CFSTR("com.apple.FaceTime");
  v1 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = CFSTR("com.apple.facetime");
  v28[1] = CFSTR("com.apple.FaceTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v19;
  v30[2] = CFSTR("com.apple.MobileSMS");
  v2 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = CFSTR("com.apple.MobileSMS");
  v27[1] = CFSTR("com.apple.iChat");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v17;
  v30[3] = CFSTR("com.apple.iChat");
  v3 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = CFSTR("com.apple.MobileSMS");
  v26[1] = CFSTR("com.apple.iChat");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v5;
  v30[4] = CFSTR("com.apple.mobilephone");
  v6 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = CFSTR("com.apple.mobilephone");
  v25[1] = CFSTR("com.apple.NanoPhone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v8;
  v30[5] = CFSTR("com.apple.NanoPhone");
  v9 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = CFSTR("com.apple.mobilephone");
  v24[1] = CFSTR("com.apple.NanoPhone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v11;
  v30[6] = CFSTR("com.apple.tincan");
  v12 = (void *)MEMORY[0x1E0C99E60];
  v23 = CFSTR("com.apple.tincan");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_equivalentCommunicationBundleIdentifiersForCommunicationBundleIdentifier__equivalentBundleIdentifiersByBundleIdentifier;
  _equivalentCommunicationBundleIdentifiersForCommunicationBundleIdentifier__equivalentBundleIdentifiersByBundleIdentifier = v15;

}

+ (id)_categoryForCommunicationBundleIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _categoryForCommunicationBundleIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_categoryForCommunicationBundleIdentifier__onceToken, &__block_literal_global_30);
  objc_msgSend((id)_categoryForCommunicationBundleIdentifier__categoryByBundleIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __75__DMFCommunicationPolicyMonitor__categoryForCommunicationBundleIdentifier___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0D4B0];
  v4[0] = CFSTR("com.apple.facetime");
  v4[1] = CFSTR("com.apple.FaceTime");
  v5[0] = v0;
  v5[1] = v0;
  v4[2] = CFSTR("com.apple.MobileSMS");
  v4[3] = CFSTR("com.apple.iChat");
  v5[2] = v0;
  v5[3] = v0;
  v1 = *MEMORY[0x1E0D0D4E0];
  v4[4] = CFSTR("com.apple.mobilephone");
  v4[5] = CFSTR("com.apple.NanoPhone");
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = CFSTR("com.apple.tincan");
  v5[6] = *MEMORY[0x1E0D0D488];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_categoryForCommunicationBundleIdentifier__categoryByBundleIdentifier;
  _categoryForCommunicationBundleIdentifier__categoryByBundleIdentifier = v2;

}

- (DMFCommunicationPolicyMonitor)init
{
  DMFCommunicationPolicyMonitor *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSDictionary *policiesByBundleIdentifier;
  uint64_t v12;
  DMFCommunicationPolicyMonitor *v13;
  void *v14;
  DMFApplicationPolicyMonitor *v15;
  DMFApplicationPolicyMonitor *applicationPolicyMonitor;
  DMFPolicyRegistration *v17;
  void *v18;
  void *v19;
  void *v20;
  DMFPolicyRegistration *v21;
  uint64_t v22;
  NSUUID *identifier;
  void *v24;
  NSUUID *v25;
  DMFCommunicationPolicyMonitor *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, void *);
  void *v31;
  DMFCommunicationPolicyMonitor *v32;
  _QWORD v33[4];
  DMFCommunicationPolicyMonitor *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  const __CFString *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)DMFCommunicationPolicyMonitor;
  v2 = -[DMFCommunicationPolicyMonitor init](&v39, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "communicationBundleIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6EF2DD8, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v7);
    }

    v10 = objc_msgSend(v4, "copy");
    policiesByBundleIdentifier = v2->_policiesByBundleIdentifier;
    v2->_policiesByBundleIdentifier = (NSDictionary *)v10;

    v12 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __37__DMFCommunicationPolicyMonitor_init__block_invoke;
    v33[3] = &unk_1E6ED7D40;
    v13 = v2;
    v34 = v13;
    v14 = (void *)MEMORY[0x1BCCB7F34](v33);
    v15 = -[DMFApplicationPolicyMonitor initWithPolicyChangeHandler:]([DMFApplicationPolicyMonitor alloc], "initWithPolicyChangeHandler:", v14);
    applicationPolicyMonitor = v13->_applicationPolicyMonitor;
    v13->_applicationPolicyMonitor = v15;

    v17 = [DMFPolicyRegistration alloc];
    v18 = (void *)MEMORY[0x1E0C99E60];
    v40 = CFSTR("categories");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[DMFPolicyRegistration initWithIdentifier:policyTypes:callback:](v17, "initWithIdentifier:policyTypes:callback:", CFSTR("dmf.policy.monitor.communication"), v20, v14);

    v22 = objc_opt_new();
    identifier = v13->_identifier;
    v13->_identifier = (NSUUID *)v22;

    +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13->_identifier;
    v28 = v12;
    v29 = 3221225472;
    v30 = __37__DMFCommunicationPolicyMonitor_init__block_invoke_2;
    v31 = &unk_1E6ED7C28;
    v26 = v13;
    v32 = v26;
    objc_msgSend(v24, "addRegistration:forPolicyMonitorIdentifier:completionHandler:", v21, v25, &v28);

    v26->_didFetchInitialPolicies = 0;
    -[DMFCommunicationPolicyMonitor _updatePoliciesByBundleIdentifier](v26, "_updatePoliciesByBundleIdentifier", v28, v29, v30, v31);

  }
  return v2;
}

uint64_t __37__DMFCommunicationPolicyMonitor_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePoliciesByBundleIdentifier");
}

void __37__DMFCommunicationPolicyMonitor_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (!a2)
  {
    DMFPolicyLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1();

  }
}

- (void)_updatePoliciesByBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend((id)objc_opt_class(), "communicationBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFCommunicationPolicyMonitor applicationPolicyMonitor](self, "applicationPolicyMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__DMFCommunicationPolicyMonitor__updatePoliciesByBundleIdentifier__block_invoke;
  v6[3] = &unk_1E6ED7C28;
  v6[4] = self;
  objc_msgSend(v4, "requestPoliciesForBundleIdentifiers:completionHandler:", v5, v6);

}

void __66__DMFCommunicationPolicyMonitor__updatePoliciesByBundleIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("categories");
    v15[1] = CFSTR("applicationcategories");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v7, "requestPoliciesForTypes:withError:", v8, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (v9)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("categories"));
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("applicationcategories"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_updateWithPoliciesByBundleIdentifier:categoryEffectivePolicy:applicationCategoryEffectivePolicy:", v5, v12, v13);

    }
    else
    {
      DMFPolicyLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __88__DMFCommunicationPolicyMonitor_requestPoliciesByBundleIdentifierWithCompletionHandler___block_invoke_cold_1(a1);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __66__DMFCommunicationPolicyMonitor__updatePoliciesByBundleIdentifier__block_invoke_cold_1((uint64_t)v6);
  }

}

- (void)_updateWithPoliciesByBundleIdentifier:(id)a3 categoryEffectivePolicy:(id)a4 applicationCategoryEffectivePolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  DMFCommunicationPolicyMonitor *v22;
  id v23;
  uint64_t *v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  if (v9)
  {
    v12 = objc_msgSend(v9, "downtimeEnforced");
    if (v11)
    {
LABEL_3:
      v13 = objc_msgSend(v11, "downtimeEnforced");
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
LABEL_6:
  -[DMFCommunicationPolicyMonitor policiesByBundleIdentifier](self, "policiesByBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __130__DMFCommunicationPolicyMonitor__updateWithPoliciesByBundleIdentifier_categoryEffectivePolicy_applicationCategoryEffectivePolicy___block_invoke;
  v21 = &unk_1E6ED7EE0;
  v22 = self;
  v25 = v12 | v13;
  v16 = v15;
  v23 = v16;
  v24 = &v26;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v18);
  if (*((_BYTE *)v27 + 24))
  {
    v17 = (void *)objc_msgSend(v16, "copy", v18, v19, v20, v21, v22);
    -[DMFCommunicationPolicyMonitor setPoliciesByBundleIdentifier:](self, "setPoliciesByBundleIdentifier:", v17);

  }
  if (!-[DMFCommunicationPolicyMonitor didFetchInitialPolicies](self, "didFetchInitialPolicies", v18, v19, v20, v21, v22))-[DMFCommunicationPolicyMonitor setDidFetchInitialPolicies:](self, "setDidFetchInitialPolicies:", 1);

  _Block_object_dispose(&v26, 8);
}

void __130__DMFCommunicationPolicyMonitor__updateWithPoliciesByBundleIdentifier_categoryEffectivePolicy_applicationCategoryEffectivePolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "communicationPolicyForApplicationPolicy:downtimeEnforced:", v5, *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v6 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (NSDictionary)policiesByBundleIdentifier
{
  return self->_policiesByBundleIdentifier;
}

- (void)setPoliciesByBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)didFetchInitialPolicies
{
  return self->_didFetchInitialPolicies;
}

- (void)setDidFetchInitialPolicies:(BOOL)a3
{
  self->_didFetchInitialPolicies = a3;
}

- (DMFApplicationPolicyMonitor)applicationPolicyMonitor
{
  return self->_applicationPolicyMonitor;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_policyTypes, 0);
  objc_storeStrong((id *)&self->_applicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_policiesByBundleIdentifier, 0);
}

void __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1B8C0C000, v0, v1, "Failed to register communication policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@");
}

- (void)requestPoliciesByBundleIdentifierWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "policyTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1B8C0C000, v2, v3, "Failed to request policies for types %{public}@ with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __88__DMFCommunicationPolicyMonitor_requestPoliciesByBundleIdentifierWithCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "policyTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1B8C0C000, v2, v3, "Failed to request policies for types %{public}@ with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __66__DMFCommunicationPolicyMonitor__updatePoliciesByBundleIdentifier__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_1B8C0C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to request application policies: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
