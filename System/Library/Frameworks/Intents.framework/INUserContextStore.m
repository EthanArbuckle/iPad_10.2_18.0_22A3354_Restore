@implementation INUserContextStore

- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "_type");
  objc_msgSend((id)objc_opt_class(), "keyForBundleIdentifier:andType:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "-[INUserContextStore storeUserContext:forBundleIdentifier:]";
    v18 = 2048;
    v19 = v8;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_INFO, "%s Setting UserContext of type:%ld for bundle:%@ at key:%@, with value: %@...", buf, 0x34u);
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (v12)
  {
    v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[INUserContextStore storeUserContext:forBundleIdentifier:]";
      v18 = 2112;
      v19 = (uint64_t)v12;
      _os_log_error_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_ERROR, "%s Error archiving UserContext: %@", buf, 0x16u);
    }
  }
  else
  {
    -[CKKnowledgeStore setValue:forKey:](self->_knowledgeStore, "setValue:forKey:", v11, v9);
    v14 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[INUserContextStore storeUserContext:forBundleIdentifier:]";
      _os_log_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_INFO, "%s UserContext saved.", buf, 0xCu);
    }
  }

}

- (void)removeUserContextOfClass:(Class)a3 forBundleIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  CKKnowledgeStore *knowledgeStore;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[objc_class _type](a3, "_type");
  objc_msgSend((id)objc_opt_class(), "keyForBundleIdentifier:andType:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v15 = "-[INUserContextStore removeUserContextOfClass:forBundleIdentifier:]";
    v16 = 2048;
    v17 = v7;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s Removing UserContext of type:%ld for bundle:%@ at key:%@...", buf, 0x2Au);
  }
  knowledgeStore = self->_knowledgeStore;
  v13 = 0;
  -[CKKnowledgeStore removeValueForKey:error:](knowledgeStore, "removeValueForKey:error:", v8, &v13);
  v11 = v13;
  if (v11)
  {
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[INUserContextStore removeUserContextOfClass:forBundleIdentifier:]";
      v16 = 2112;
      v17 = (uint64_t)v8;
      v18 = 2112;
      v19 = v11;
      _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Error removing value for key:%@ -- %@", buf, 0x20u);
    }
  }

}

- (void)storeUserContextViaHelper:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[INImageServiceConnection sharedConnection](INImageServiceConnection, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeUserContext:forBundleIdentifier:", v6, v5);

}

- (void)userContextOfClass:(Class)a3 forBundleIdentifiers:(id)a4 withCompletion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CKKnowledgeStore *knowledgeStore;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  INUserContextStore *v27;
  id v28;
  Class v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v22 = a5;
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend((id)objc_opt_class(), "keyForBundleIdentifier:andType:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15), -[objc_class _type](a3, "_type"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

  knowledgeStore = self->_knowledgeStore;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__INUserContextStore_userContextOfClass_forBundleIdentifiers_withCompletion___block_invoke;
  v23[3] = &unk_1E228DCD0;
  v24 = v8;
  v25 = v11;
  v26 = v10;
  v27 = self;
  v28 = v22;
  v29 = a3;
  v18 = v22;
  v19 = v10;
  v20 = v11;
  v21 = v8;
  -[CKKnowledgeStore valuesForKeys:completionHandler:](knowledgeStore, "valuesForKeys:completionHandler:", v19, v23);

}

- (void)userContextOfClass:(Class)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  CKKnowledgeStore *knowledgeStore;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  INUserContextStore *v18;
  id v19;
  uint64_t v20;
  Class v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "keyPrefixForType:", -[objc_class _type](a3, "_type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v9 = (void *)getCKGenericConditionClass_softClass;
  v26 = getCKGenericConditionClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!getCKGenericConditionClass_softClass)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __getCKGenericConditionClass_block_invoke;
    v22[3] = &unk_1E22953C0;
    v22[4] = &v23;
    __getCKGenericConditionClass_block_invoke((uint64_t)v22);
    v9 = (void *)v24[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v23, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "initWithMatchType:value:negated:", 0, v7, 0);
  knowledgeStore = self->_knowledgeStore;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __56__INUserContextStore_userContextOfClass_withCompletion___block_invoke;
  v16[3] = &unk_1E228DD20;
  v19 = v6;
  v20 = v8;
  v17 = v7;
  v18 = self;
  v21 = a3;
  v14 = v6;
  v15 = v7;
  -[CKKnowledgeStore dictionaryRepresentationForKeysMatching:completionHandler:](knowledgeStore, "dictionaryRepresentationForKeysMatching:completionHandler:", v12, v16);

}

- (id)_init
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getCKKnowledgeStoreClass_softClass;
  v12 = getCKKnowledgeStoreClass_softClass;
  if (!getCKKnowledgeStoreClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getCKKnowledgeStoreClass_block_invoke;
    v8[3] = &unk_1E22953C0;
    v8[4] = &v9;
    __getCKKnowledgeStoreClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v4, "defaultKnowledgeStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[INUserContextStore _initWithKnowledgeStore:](self, "_initWithKnowledgeStore:", v5);

  return v6;
}

- (id)_initWithKnowledgeStore:(id)a3
{
  id v5;
  INUserContextStore *v6;
  INUserContextStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INUserContextStore;
  v6 = -[INUserContextStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

void __56__INUserContextStore_userContextOfClass_withCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  if (a2)
  {
    v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)a1[4];
      *(_DWORD *)buf = 136315394;
      v22 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
      v23 = 2112;
      v24 = v16;
      _os_log_error_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_ERROR, "%s Error loading UserContext for prefix:%@", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[2] = __56__INUserContextStore_userContextOfClass_withCompletion___block_invoke_10;
    v17[3] = &unk_1E228DCF8;
    v9 = a1[5];
    v10 = a1[8];
    v19 = a1[7];
    v20 = v10;
    v17[4] = v9;
    v17[1] = 3221225472;
    v11 = v6;
    v18 = v11;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v17);
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_INFO, "%s Retrieved UserContexts: %@", buf, 0x16u);
    }
    (*(void (**)(_QWORD, id, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], v11, v13, v14, v15);

  }
}

void __56__INUserContextStore_userContextOfClass_withCompletion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "substringFromIndex:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "findDataInValue:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 56);
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", v9, v8, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      if (v11)
      {
        v12 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          v15 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 136315906;
          v18 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
          v19 = 2112;
          v20 = v15;
          v21 = 2112;
          v22 = v7;
          v23 = 2112;
          v24 = v11;
          _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Error unarchiving UserContext from class:%@ for bundle:%@  - %@", buf, 0x2Au);
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v7);

    }
    else
    {
      v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
        v19 = 2112;
        v20 = v7;
        _os_log_debug_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_DEBUG, "%s No UserContext for bundle:%@", buf, 0x16u);
      }
    }

  }
  else
  {
    v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
      v19 = 2112;
      v20 = v5;
      _os_log_debug_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_DEBUG, "%s Received invalid key for UserContext:%@", buf, 0x16u);
    }
  }

}

void __77__INUserContextStore_userContextOfClass_forBundleIdentifiers_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  if (a2)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v23 = "-[INUserContextStore userContextOfClass:forBundleIdentifiers:withCompletion:]_block_invoke";
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Error loading UserContext for bundleIdentifiers:%@ as keys:%@", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__INUserContextStore_userContextOfClass_forBundleIdentifiers_withCompletion___block_invoke_4;
    v17[3] = &unk_1E228DCA8;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 56);
    v18 = v8;
    v19 = v9;
    v21 = *(_QWORD *)(a1 + 72);
    v10 = v6;
    v20 = v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v23 = "-[INUserContextStore userContextOfClass:forBundleIdentifiers:withCompletion:]_block_invoke";
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Retrieved UserContexts for bundleIdentifiers:%@ -- %@", buf, 0x20u);
    }
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v10, v12, v13);

  }
}

void __77__INUserContextStore_userContextOfClass_forBundleIdentifiers_withCompletion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "findDataInValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 56);
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", v9, v8, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v11)
    {
      v12 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v14 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        v17 = "-[INUserContextStore userContextOfClass:forBundleIdentifiers:withCompletion:]_block_invoke";
        v18 = 2112;
        v19 = v14;
        v20 = 2112;
        v21 = v7;
        v22 = 2112;
        v23 = v11;
        _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Error unarchiving UserContext from class:%@ for bundle:%@  - %@", buf, 0x2Au);
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v10, v7);

  }
  else
  {
    v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[INUserContextStore userContextOfClass:forBundleIdentifiers:withCompletion:]_block_invoke";
      v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_DEBUG, "%s No UserContext for bundle:%@", buf, 0x16u);
    }
  }

}

+ (id)sharedStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__INUserContextStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, block);
  return (id)sharedStore_sharedStore;
}

+ (id)findDataInValue:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v3, "reverseObjectEnumerator", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        while (2)
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v6 = v12;

              goto LABEL_15;
            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
    goto LABEL_14;
  }
  v6 = v3;
LABEL_15:

  return v6;
}

+ (id)keyPrefixForType:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("usercontext.%ld."), a3);
}

+ (id)keyForBundleIdentifier:(id)a3 andType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "keyPrefixForType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __33__INUserContextStore_sharedStore__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedStore_sharedStore;
  sharedStore_sharedStore = v1;

}

@end
