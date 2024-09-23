@implementation VSAllSubscriptionFetchOptions

void __VSAllSubscriptionFetchOptions_block_invoke(uint64_t a1)
{
  void (**v2)(void *, uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __VSAllSubscriptionFetchOptions_block_invoke_2;
  v8[3] = &unk_1E939FE20;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v2 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v8);
  v2[2](v2, v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)VSAllSubscriptionFetchOptions___vs_lazy_init_variable;
  VSAllSubscriptionFetchOptions___vs_lazy_init_variable = v6;

}

id __VSAllSubscriptionFetchOptions_block_invoke_2(uint64_t a1)
{
  id v2;
  VSSubscriptionFetchOptionDescription *v3;
  void *v4;
  VSSubscriptionFetchOptionDescription *v5;
  VSSubscriptionFetchOptionDescription *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  VSSubscriptionFetchOptionDescription *v11;
  VSSubscriptionFetchOptionDescription *v12;
  VSSubscriptionFetchOptionDescription *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  VSSubscriptionFetchOptionDescription *v24;
  VSSubscriptionFetchOptionDescription *v25;
  VSSubscriptionFetchOptionDescription *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  -[VSSubscriptionFetchOptionDescription setKey:](v3, "setKey:", CFSTR("VSSubscriptionFetchOptionExcludeUninstalledApps"));
  -[VSSubscriptionFetchOptionDescription setAllowedClass:](v3, "setAllowedClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSubscriptionFetchOptionDescription setAllowedValuePredicate:](v3, "setAllowedValuePredicate:", v4);

  -[VSSubscriptionFetchOptionDescription setDefaultValue:](v3, "setDefaultValue:", *(_QWORD *)(a1 + 40));
  v26 = v3;
  objc_msgSend(v2, "addObject:", v3);
  v5 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  -[VSSubscriptionFetchOptionDescription setKey:](v5, "setKey:", CFSTR("VSSubscriptionFetchOptionEarliestExpirationDate"));
  -[VSSubscriptionFetchOptionDescription setAllowedClass:](v5, "setAllowedClass:", objc_opt_class());
  v25 = v5;
  objc_msgSend(v2, "addObject:", v5);
  v6 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  -[VSSubscriptionFetchOptionDescription setKey:](v6, "setKey:", CFSTR("VSSubscriptionFetchOptionCreationDateInterval"));
  -[VSSubscriptionFetchOptionDescription setAllowedClass:](v6, "setAllowedClass:", objc_opt_class());
  v7 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:", v8, v9);
  -[VSSubscriptionFetchOptionDescription setDefaultValue:](v6, "setDefaultValue:", v10);

  v24 = v6;
  objc_msgSend(v2, "addObject:", v6);
  v11 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  -[VSSubscriptionFetchOptionDescription setKey:](v11, "setKey:", CFSTR("VSSubscriptionFetchOptionSources"));
  -[VSSubscriptionFetchOptionDescription setContainer:](v11, "setContainer:", 1);
  -[VSSubscriptionFetchOptionDescription setAllowedClass:](v11, "setAllowedClass:", objc_opt_class());
  objc_msgSend(v2, "addObject:", v11);
  v12 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  -[VSSubscriptionFetchOptionDescription setKey:](v12, "setKey:", CFSTR("VSSubscriptionFetchOptionSourceKind"));
  -[VSSubscriptionFetchOptionDescription setAllowedClass:](v12, "setAllowedClass:", objc_opt_class());
  objc_msgSend(v2, "addObject:", v12);
  v13 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  -[VSSubscriptionFetchOptionDescription setKey:](v13, "setKey:", CFSTR("VSSubscriptionFetchOptionSubscriptionInfo"));
  -[VSSubscriptionFetchOptionDescription setAllowedClass:](v13, "setAllowedClass:", objc_opt_class());
  objc_msgSend(v2, "addObject:", v13);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v2;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v20, "key");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v20, v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }

  v22 = (void *)objc_msgSend(v14, "copy");
  return v22;
}

@end
