@implementation INRelevantShortcutStore

- (void)setRelevantShortcuts:(NSArray *)shortcuts completionHandler:(void *)completionHandler
{
  -[INRelevantShortcutStore setRelevantShortcuts:forBundleIdentifier:completionHandler:](self, "setRelevantShortcuts:forBundleIdentifier:completionHandler:", shortcuts, 0, completionHandler);
}

- (CSSearchableIndex)index
{
  return self->_index;
}

void __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  if ((objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("\"%@\" is not the expected INRelevantShortcut"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E228A198;
  v6 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = *(id *)(a1 + 56);
  v16 = a3;
  v15 = *(id *)(a1 + 32);
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler(v5, 0x15u, 0, 1, 0, v12, 180.0, 180.0);

}

+ (INRelevantShortcutStore)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__INRelevantShortcutStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken != -1)
    dispatch_once(&defaultStore_onceToken, block);
  return (INRelevantShortcutStore *)(id)defaultStore_defaultStore;
}

void __39__INRelevantShortcutStore_defaultStore__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  INRelevantShortcutStore *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v2 = (void *)getCSSearchableIndexClass_softClass_5409;
  v13 = getCSSearchableIndexClass_softClass_5409;
  if (!getCSSearchableIndexClass_softClass_5409)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getCSSearchableIndexClass_block_invoke_5410;
    v9[3] = &unk_1E22953C0;
    v9[4] = &v10;
    __getCSSearchableIndexClass_block_invoke_5410((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v10, 8);
  v4 = [v3 alloc];
  NSStringFromClass(*(Class *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:protectionClass:", v5, *MEMORY[0x1E0CB2AC0]);

  v7 = -[INRelevantShortcutStore initWithSearchableIndex:]([INRelevantShortcutStore alloc], "initWithSearchableIndex:", v6);
  v8 = (void *)defaultStore_defaultStore;
  defaultStore_defaultStore = (uint64_t)v7;

}

- (INRelevantShortcutStore)initWithSearchableIndex:(id)a3
{
  id v5;
  INRelevantShortcutStore *v6;
  INRelevantShortcutStore *v7;
  INRelevantShortcutStore *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INRelevantShortcutStore;
  v6 = -[INRelevantShortcutStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_index, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setRelevantShortcuts:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  dispatch_group_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  INRelevantShortcutStore *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  dispatch_group_t v30;
  INRelevantShortcutStore *v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") > 0x64)
  {
    NSLog((NSString *)CFSTR("WARNING: Too many INRelevantShortcuts; only using the first %lu"), 100);
    objc_msgSend(v8, "subarrayWithRange:", 0, 100);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v8;
  }
  v12 = v11;
  v13 = dispatch_group_create();
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCount:", objc_msgSend(v12, "count"));
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke;
  v29[3] = &unk_1E228A1C0;
  v30 = v13;
  v31 = self;
  v32 = v14;
  v17 = v15;
  v33 = v17;
  v18 = v14;
  v19 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v29);
  dispatch_get_global_queue(17, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_11;
  block[3] = &unk_1E2291FA8;
  v25 = v17;
  v26 = self;
  v27 = v9;
  v28 = v10;
  v21 = v10;
  v22 = v9;
  v23 = v17;
  dispatch_group_notify(v19, v20, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
}

void __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "compact");
  objc_msgSend(*(id *)(a1 + 40), "index");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_2_12;
  v5[3] = &unk_1E228A1E8;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "donateRelevantShortcuts:bundleID:completionHandler:", v3, v4, v5);

}

void __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_2_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = INSiriLogContextIntents;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[INRelevantShortcutStore setRelevantShortcuts:forBundleIdentifier:completionHandler:]_block_invoke_2";
      v11 = 2114;
      v12 = (uint64_t)v3;
      _os_log_error_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_ERROR, "%s Error when trying to set new relevant shortcuts: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[INRelevantShortcutStore setRelevantShortcuts:forBundleIdentifier:completionHandler:]_block_invoke";
    v11 = 2050;
    v12 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Updated relevant shortcuts with %{public}lu shortcuts", (uint8_t *)&v9, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void __86__INRelevantShortcutStore_setRelevantShortcuts_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 136315650;
      v10 = "-[INRelevantShortcutStore setRelevantShortcuts:forBundleIdentifier:completionHandler:]_block_invoke_2";
      v11 = 2114;
      v12 = v8;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "lock");
  objc_msgSend(*(id *)(a1 + 48), "replacePointerAtIndex:withPointer:", *(_QWORD *)(a1 + 64), v5);
  objc_msgSend(*(id *)(a1 + 40), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

@end
