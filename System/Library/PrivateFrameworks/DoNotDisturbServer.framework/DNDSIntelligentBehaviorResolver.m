@implementation DNDSIntelligentBehaviorResolver

- (int64_t)intelligentInterruptionBehaviorForClientEventDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "forwardingBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "forwardingBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intelligentBehavior");

  }
  else if (+[DNDSPlatformEligibility isIntelligenceAvailable](DNDSPlatformEligibility, "isIntelligenceAvailable"))
  {
    v7 = -[DNDSIntelligentBehaviorResolver llmIntelligentBehavior:](self, "llmIntelligentBehavior:", v4);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (int64_t)llmIntelligentBehavior:(id)a3
{
  id v3;
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  int64_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v4 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v4, "setLive:", 0);
  objc_msgSend(v4, "setFetchAttributes:", &unk_1E86DEF70);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", &stru_1E86A90B0, v4);
  if (v5)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__6;
    v24[4] = __Block_byref_object_dispose__6;
    v25 = (id)objc_opt_new();
    v6 = dispatch_semaphore_create(0);
    objc_msgSend(v5, "setBundleIDs:", &unk_1E86DEF88);
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __58__DNDSIntelligentBehaviorResolver_llmIntelligentBehavior___block_invoke;
    v21[3] = &unk_1E86A6BD0;
    v8 = v3;
    v22 = v8;
    v23 = v24;
    objc_msgSend(v5, "setFoundItemsHandler:", v21);
    v13 = v7;
    v14 = 3221225472;
    v15 = __58__DNDSIntelligentBehaviorResolver_llmIntelligentBehavior___block_invoke_2;
    v16 = &unk_1E86A6BF8;
    v19 = v24;
    v17 = v8;
    v20 = &v26;
    v9 = v6;
    v18 = v9;
    objc_msgSend(v5, "setCompletionHandler:", &v13);
    objc_msgSend(v5, "start", v13, v14, v15, v16);
    v10 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v9, v10);

    _Block_object_dispose(v24, 8);
  }
  v11 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v11;
}

void __58__DNDSIntelligentBehaviorResolver_llmIntelligentBehavior___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a2;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v22)
  {
    v4 = *(_QWORD *)v25;
    v5 = 0x1E0CB3000uLL;
    v19 = *(_QWORD *)v25;
    v20 = a1;
    do
    {
      v6 = 0;
      do
      {
        v23 = v2;
        if (*(_QWORD *)v25 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        v8 = *(void **)(v5 + 2368);
        objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "domainIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.usernotifications"));
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v7, "domainIdentifier");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.usernotifications.groups")) & 1) == 0)
            goto LABEL_19;
          v23 = v2;
        }
        objc_msgSend(v7, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v11))
        {
          objc_msgSend(v7, "attributeSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "creator");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v13 & 1) != 0)
          {

            v4 = v19;
            v2 = v23;
            if (!v18)
              goto LABEL_12;
LABEL_16:
            a1 = v20;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v20 + 40) + 8) + 40), "addObject:", v7);
          }
          else
          {
            v2 = v23;

            v4 = v19;
            if ((v18 & 1) != 0)
              goto LABEL_16;
LABEL_12:
            a1 = v20;
          }
          v5 = 0x1E0CB3000;
          goto LABEL_20;
        }

        if (v13)
        {

          v2 = v23;
          goto LABEL_20;
        }
        v2 = v23;
LABEL_19:

LABEL_20:
        ++v6;
      }
      while (v22 != v6);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v22);
  }

}

void __58__DNDSIntelligentBehaviorResolver_llmIntelligentBehavior___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    {
      if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") < 2)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
        v7 = v13;
        if (!v13
          || (-[NSObject attributeSet](v13, "attributeSet"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v14, "isUrgent"),
              v8 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              !v8))
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          goto LABEL_18;
        }
        v15 = objc_msgSend(v8, "BOOLValue");
        v16 = 2;
        if (!v15)
          v16 = 3;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v16;
LABEL_16:

LABEL_18:
        goto LABEL_19;
      }
      v5 = (void *)DNDSLogResolver;
      if (!os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v10 = "Intelligent interruption spotlight query found more than one match for %@, %@";
    }
    else
    {
      v11 = (void *)DNDSLogResolver;
      if (!os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v12 = *(void **)(a1 + 32);
      v7 = v11;
      objc_msgSend(v12, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v10 = "Intelligent interruption spotlight query found no matches for %@, %@";
    }
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0x16u);

    goto LABEL_16;
  }
  v4 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v3;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Intelligent interruption spotlight query | Error: %@", (uint8_t *)&v17, 0xCu);
  }
LABEL_19:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

@end
