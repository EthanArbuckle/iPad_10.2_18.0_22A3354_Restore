@implementation DMFPrioritizedPolicy

- (DMFPrioritizedPolicy)initWithEffectivePolicy:(id)a3 identifier:(id)a4 excludableIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  DMFPrioritizedPolicy *v11;
  void *v12;
  int v13;
  uint64_t v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMFPrioritizedPolicy;
  v11 = -[DMFPrioritizedPolicy init](&v16, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("websites"));

    if (v13)
    {
      v11->_policy = objc_msgSend(v8, "policyForHostName:", v9);
      v14 = objc_msgSend(v8, "priorityForHostName:", v9);
    }
    else
    {
      v11->_policy = objc_msgSend(v8, "policyForIdentifier:excludableIdentifiers:", v9, v10);
      v14 = objc_msgSend(v8, "priorityForIdentifier:", v9);
    }
    v11->_priority = v14;
  }

  return v11;
}

+ (int64_t)arbitratePolicyForPrioritizedPolicies:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "policy");

  return v5;
}

+ (id)prioritizedPoliciesForAppPolicy:(id)a3 appCategoryPolicy:(id)a4 bundleIdentifiers:(id)a5 categoryPolicy:(id)a6 categoryIdentifiers:(id)a7 webPolicy:(id)a8 webCategoryPolicy:(id)a9 webDomains:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  v20 = a3;
  v21 = a6;
  v22 = a8;
  v23 = (void *)objc_opt_new();
  __166__DMFPrioritizedPolicy_prioritizedPoliciesForAppPolicy_appCategoryPolicy_bundleIdentifiers_categoryPolicy_categoryIdentifiers_webPolicy_webCategoryPolicy_webDomains___block_invoke((uint64_t)v23, v23, v20, v16, 0);

  __166__DMFPrioritizedPolicy_prioritizedPoliciesForAppPolicy_appCategoryPolicy_bundleIdentifiers_categoryPolicy_categoryIdentifiers_webPolicy_webCategoryPolicy_webDomains___block_invoke(v24, v23, v21, v17, 0);
  __166__DMFPrioritizedPolicy_prioritizedPoliciesForAppPolicy_appCategoryPolicy_bundleIdentifiers_categoryPolicy_categoryIdentifiers_webPolicy_webCategoryPolicy_webDomains___block_invoke(v25, v23, v22, v19, 0);

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
  }
  else
  {
    v27 = 0;
  }
  __166__DMFPrioritizedPolicy_prioritizedPoliciesForAppPolicy_appCategoryPolicy_bundleIdentifiers_categoryPolicy_categoryIdentifiers_webPolicy_webCategoryPolicy_webDomains___block_invoke(v26, v23, v15, v17, v27);
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
  }
  else
  {
    v29 = 0;
  }
  __166__DMFPrioritizedPolicy_prioritizedPoliciesForAppPolicy_appCategoryPolicy_bundleIdentifiers_categoryPolicy_categoryIdentifiers_webPolicy_webCategoryPolicy_webDomains___block_invoke(v28, v23, v18, v17, v29);
  v30 = (void *)objc_msgSend(v23, "copy");

  return v30;
}

void __166__DMFPrioritizedPolicy_prioritizedPoliciesForAppPolicy_appCategoryPolicy_bundleIdentifiers_categoryPolicy_categoryIdentifiers_webPolicy_webCategoryPolicy_webDomains___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  DMFPrioritizedPolicy *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v10);
          v16 = -[DMFPrioritizedPolicy initWithEffectivePolicy:identifier:excludableIdentifiers:]([DMFPrioritizedPolicy alloc], "initWithEffectivePolicy:identifier:excludableIdentifiers:", v9, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), v11);
          objc_msgSend(v8, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }
  }

}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[DMFPrioritizedPolicy policy](self, "policy");
  return -[DMFPrioritizedPolicy priority](self, "priority") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  DMFPrioritizedPolicy *v4;
  BOOL v5;

  v4 = (DMFPrioritizedPolicy *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[DMFPrioritizedPolicy isEqualToPrioritizedPolicy:](self, "isEqualToPrioritizedPolicy:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPrioritizedPolicy:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return self == a3 || -[DMFPrioritizedPolicy compare:](self, "compare:", v3, v4) == 0;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = a3;
  v5 = -[DMFPrioritizedPolicy priority](self, "priority");
  if (v5 < objc_msgSend(v4, "priority"))
  {
LABEL_5:
    v7 = -1;
    goto LABEL_6;
  }
  v6 = -[DMFPrioritizedPolicy priority](self, "priority");
  if (v6 <= objc_msgSend(v4, "priority"))
  {
    v8 = -[DMFPrioritizedPolicy policy](self, "policy");
    if (v8 <= objc_msgSend(v4, "policy"))
    {
      v10 = -[DMFPrioritizedPolicy policy](self, "policy");
      v7 = v10 < objc_msgSend(v4, "policy");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v7 = 1;
LABEL_6:

  return v7;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

@end
