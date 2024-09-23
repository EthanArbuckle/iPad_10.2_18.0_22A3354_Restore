@implementation FBSApplicationDataStore

- (id)safeArchivedObjectForKey:(id)a3 ofType:(Class)a4
{
  void *v5;
  void *v6;
  id v7;

  -[FBSApplicationDataStore archivedObjectForKey:](self, "archivedObjectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)archivedObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FBSApplicationDataStore safeObjectForKey:ofType:](self, "safeObjectForKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)_FBSCreateUnsafeObjectFromData(v5);
  return v6;
}

- (id)safeObjectForKey:(id)a3 ofType:(Class)a4
{
  void *v5;
  void *v6;
  id v7;

  -[FBSApplicationDataStore objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)objectForKey:(id)a3
{
  return -[FBSApplicationDataStoreRepositoryClient objectForKey:forApplication:](self->_client, "objectForKey:forApplication:", a3, self->_identifier);
}

- (void)removeObjectForKey:(id)a3
{
  -[FBSApplicationDataStoreRepositoryClient removeObjectForKey:forApplication:withCompletion:](self->_client, "removeObjectForKey:forApplication:withCompletion:", a3, self->_identifier, 0);
}

- (void)setArchivedObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x19AECA15C]();
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 0, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    if (v10)
    {
      FBLogAppDataStore();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FBSApplicationDataStore setArchivedObject:forKey:].cold.1();

      v12 = &unk_1EE3AF7F8;
      if ((objc_msgSend(v6, "conformsToProtocol:", v12) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FBSApplicationDataStore setArchivedObject:forKey:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_class();
        NSStringFromProtocol((Protocol *)v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("FBSApplicationDataStore.m"), 385, CFSTR("%@ does not conform to %@"), v14, v15);

      }
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v9 = 0;
  }
  -[FBSApplicationDataStore setObject:forKey:](self, "setObject:forKey:", v9, v7);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSObject *v6;
  void *v7;
  NSObject *DeepCopy;
  NSObject *v9;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  if (v7)
  {
    if (v6)
    {
      DeepCopy = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, 0);

      if (!DeepCopy)
      {
        FBLogAppDataStore();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[FBSApplicationDataStore setObject:forKey:].cold.2();
        goto LABEL_11;
      }
    }
    else
    {
      DeepCopy = 0;
    }
    -[FBSApplicationDataStoreRepositoryClient setObject:forKey:forApplication:withCompletion:](self->_client, "setObject:forKey:forApplication:withCompletion:", DeepCopy, v7, self->_identifier, 0);
    v6 = DeepCopy;
    goto LABEL_11;
  }
  FBLogAppDataStore();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[FBSApplicationDataStore setObject:forKey:].cold.1((uint64_t)v6, v9);

LABEL_11:
}

+ (void)synchronize
{
  objc_msgSend(a1, "synchronizeWithCompletion:", 0);
}

+ (void)synchronizeWithCompletion:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__FBSApplicationDataStore_synchronizeWithCompletion___block_invoke;
  v5[3] = &unk_1E38EC588;
  v6 = v3;
  v4 = v3;
  +[FBSApplicationDataStore _doWithClassClient:](FBSApplicationDataStore, "_doWithClassClient:", v5);

}

+ (void)_doWithClassClient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  v3 = (id)__classClient;
  v4 = v3;
  if (!v3)
  {
    +[FBSApplicationDataStoreClientFactory sharedInstance](FBSApplicationDataStoreClientFactory, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
    v7[2](v7, v4);
  if (!v3)
  {
    +[FBSApplicationDataStoreClientFactory sharedInstance](FBSApplicationDataStoreClientFactory, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkin");

  }
}

void __53__FBSApplicationDataStore_synchronizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__FBSApplicationDataStore_synchronizeWithCompletion___block_invoke_2;
    v4[3] = &unk_1E38EBC60;
    v5 = v3;
    objc_msgSend(a2, "synchronizeWithCompletion:", v4);

  }
  else
  {
    objc_msgSend(a2, "synchronizeWithCompletion:", 0);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_clientNeedsCheckin)
  {
    +[FBSApplicationDataStoreClientFactory sharedInstance](FBSApplicationDataStoreClientFactory, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "checkin");

  }
  v4.receiver = self;
  v4.super_class = (Class)FBSApplicationDataStore;
  -[FBSApplicationDataStore dealloc](&v4, sel_dealloc);
}

- (id)_initWithBundleId:(id)a3 identity:(id)a4 client:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FBSApplicationDataStore *v16;
  FBSApplicationDataStore *v17;
  NSObject *v18;
  NSString *identifier;
  void *v20;
  uint64_t v21;
  FBSApplicationDataStoreRepositoryClient *client;
  FBSApplicationDataStore *v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && v9)
  {
    v11 = (void *)MEMORY[0x1E0CA5850];
    objc_msgSend(v9, "identityString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifierForIdentityString:error:", v12, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "fbs_mediumDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("no bundleID found for identity %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationDataStore _initWithBundleId:identity:client:].cold.1();
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6FB8BCLL);
    }
    goto LABEL_8;
  }
  if (v8)
  {
LABEL_8:
    v25.receiver = self;
    v25.super_class = (Class)FBSApplicationDataStore;
    v16 = -[FBSApplicationDataStore init](&v25, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_bundleId, v8);
      objc_storeStrong((id *)&v17->_identity, a4);
      if (v9)
      {
        objc_msgSend(v9, "identityString");
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = v8;
      }
      identifier = v17->_identifier;
      v17->_identifier = (NSString *)&v18->isa;

      if (v10)
      {
        objc_storeStrong((id *)&v17->_client, a5);
      }
      else
      {
        +[FBSApplicationDataStoreClientFactory sharedInstance](FBSApplicationDataStoreClientFactory, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "checkout");
        v21 = objc_claimAutoreleasedReturnValue();
        client = v17->_client;
        v17->_client = (FBSApplicationDataStoreRepositoryClient *)v21;

        v17->_clientNeedsCheckin = 1;
      }
    }
    self = v17;
    v23 = self;
    goto LABEL_16;
  }
  FBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[FBSApplicationDataStore _initWithBundleId:identity:client:].cold.2(v8);
  v23 = 0;
LABEL_16:

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)storeForApplication:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[FBSApplicationDataStore _initWithBundleId:identity:client:]([FBSApplicationDataStore alloc], "_initWithBundleId:identity:client:", v3, 0, 0);

  return v4;
}

- (FBSApplicationDataStore)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("FBSApplicationDataStoreException"), CFSTR("FBSApplicationDataStore cannot be initialized - use 'storeForApplication:' instead."));

  return 0;
}

+ (id)storeForApplicationIdentity:(id)a3
{
  id v3;
  id v4;
  void *v6;

  v3 = a3;
  NSClassFromString(CFSTR("LSApplicationIdentity"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSApplicationDataStore storeForApplicationIdentity:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71AA24);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:LSApplicationIdentityClass]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSApplicationDataStore storeForApplicationIdentity:].cold.1();
    goto LABEL_9;
  }

  v4 = -[FBSApplicationDataStore _initWithBundleId:identity:client:]([FBSApplicationDataStore alloc], "_initWithBundleId:identity:client:", 0, v3, 0);
  return v4;
}

+ (id)storeForApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSApplicationDataStore storeForApplicationIdentifier:].cold.1();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71ABA8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSApplicationDataStore storeForApplicationIdentifier:].cold.1();
    goto LABEL_12;
  }

  if (objc_msgSend(v4, "fbs_looksLikeAnIdentityString"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5850]), "initWithIdentityString:", v4);
    objc_msgSend(a1, "storeForApplicationIdentity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "storeForApplication:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)applicationsWithAvailableStores
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "applicationIdentifiersWithAvailableStores", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "fbs_looksLikeAnIdentityString") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)applicationIdentitiesWithAvailableStores
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "applicationIdentifiersWithAvailableStores", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "fbs_looksLikeAnIdentityString"))
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5850]), "initWithIdentityString:", v9);
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)applicationIdentifiersWithAvailableStores
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__FBSApplicationDataStore_applicationIdentifiersWithAvailableStores__block_invoke;
  v4[3] = &unk_1E38EC458;
  v4[4] = &v5;
  +[FBSApplicationDataStore _doWithClassClient:](FBSApplicationDataStore, "_doWithClassClient:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __68__FBSApplicationDataStore_applicationIdentifiersWithAvailableStores__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "availableDataStores");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)applicationIdentifiersWithAvailableStoresForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "applicationIdentifiersWithAvailableStores", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isEqualToString:", v4) & 1) == 0)
        {
          if (!objc_msgSend(v11, "fbs_looksLikeAnIdentityString"))
            continue;
          objc_msgSend(MEMORY[0x1E0CA5850], "bundleIdentifierForIdentityString:error:", v11, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (!v13)
            continue;
        }
        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)needsMigration
{
  LSApplicationIdentity *identity;

  identity = self->_identity;
  if (identity)
    return -[LSApplicationIdentity needsMigration](identity, "needsMigration");
  else
    return 1;
}

- (BOOL)migrateWithError:(id *)a3
{
  LSApplicationIdentity *identity;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  NSString *bundleId;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v25;
  id v26;
  id *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!-[FBSApplicationDataStore needsMigration](self, "needsMigration"))
  {
    v8 = 0;
    v18 = 1;
    if (!a3)
      goto LABEL_32;
    goto LABEL_31;
  }
  identity = self->_identity;
  if (identity)
  {
    v38 = 0;
    -[LSApplicationIdentity findApplicationRecordFetchingPlaceholder:error:](identity, "findApplicationRecordFetchingPlaceholder:error:", 1, &v38);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v38;
    v8 = v7;
    if (v6)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v6, "identities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v10)
      {
        v11 = v10;
        v27 = a3;
        v12 = 0;
        v13 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v16 = -[LSApplicationIdentity personaType](self->_identity, "personaType");
            if (v16 == objc_msgSend(v15, "personaType"))
            {
              if (v12)
              {

                objc_msgSend(MEMORY[0x1E0CB35C8], "bs_errorWithDomain:code:configuration:", CFSTR("FBSApplicationDataStore"), 1, &__block_literal_global_8);
                v17 = objc_claimAutoreleasedReturnValue();

                v12 = 0;
                v8 = (id)v17;
              }
              else
              {
                v12 = v15;
              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v11);
        a3 = v27;
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __44__FBSApplicationDataStore_migrateWithError___block_invoke_2;
      v32[3] = &unk_1E38EC4A0;
      v33 = v7;
      v22 = v7;
      objc_msgSend(v21, "bs_errorWithDomain:code:configuration:", CFSTR("FBSApplicationDataStore"), 1, v32);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v9 = v33;
    }
    goto LABEL_22;
  }
  bundleId = self->_bundleId;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CA5850], "identityStringsForApplicationWithBundleIdentifier:error:", bundleId, &v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  if (objc_msgSend(v6, "count"))
  {
    v20 = objc_alloc(MEMORY[0x1E0CA5850]);
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v20, "initWithIdentityString:", v9);
LABEL_22:

    goto LABEL_23;
  }
  v25 = (void *)MEMORY[0x1E0CB35C8];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __44__FBSApplicationDataStore_migrateWithError___block_invoke_3;
  v29[3] = &unk_1E38EC4C8;
  v29[4] = self;
  v30 = v8;
  v26 = v8;
  objc_msgSend(v25, "bs_errorWithDomain:code:configuration:", CFSTR("FBSApplicationDataStore"), 1, v29);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v12 = 0;
LABEL_23:

  if (v8)
  {
    v18 = 0;
  }
  else
  {
    v28 = 0;
    v18 = -[FBSApplicationDataStore migrateToIdentity:error:](self, "migrateToIdentity:error:", v12, &v28);
    v8 = v28;
  }

  if (a3)
  {
    if (v8)
    {
      FBLogAppDataStore();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[FBSApplicationDataStore migrateWithError:].cold.1((uint64_t)self, v8);

    }
LABEL_31:
    v8 = objc_retainAutorelease(v8);
    *a3 = v8;
  }
LABEL_32:

  return v18;
}

void __44__FBSApplicationDataStore_migrateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFailureDescription:", CFSTR("Migration failed"));
  objc_msgSend(v2, "setFailureReason:", CFSTR("Target identity is ambiguous"));

}

void __44__FBSApplicationDataStore_migrateWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFailureDescription:", CFSTR("Migration failed"));
  objc_msgSend(v3, "setFailureReason:", CFSTR("No application record found"));
  objc_msgSend(v3, "setUnderlyingError:", *(_QWORD *)(a1 + 32));

}

void __44__FBSApplicationDataStore_migrateWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFailureDescription:", CFSTR("Migration failed"));
  objc_msgSend(v3, "setFailureReason:", CFSTR("No identities found for bundleID \"%@\"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v3, "setUnderlyingError:", *(_QWORD *)(a1 + 40));

}

- (BOOL)migrateToIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  FBSApplicationDataStoreRepositoryClient *client;
  NSString *identifier;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  FBSApplicationDataStore *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  NSClassFromString(CFSTR("LSApplicationIdentity"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore migrateToIdentity:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71B824);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:LSApplicationIdentityClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore migrateToIdentity:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71B888);
  }

  if (objc_msgSend(v6, "needsMigration"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provided identity itself requires migration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore migrateToIdentity:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71B8E0);
  }
  v7 = (void *)MEMORY[0x1E0CA5850];
  objc_msgSend(v6, "identityString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifierForIdentityString:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSString isEqualToString:](self->_bundleId, "isEqualToString:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identity does not match bundleID: %@ vs %@"), self->_bundleId, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore migrateToIdentity:error:].cold.4();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71B940);
  }
  FBLogAppDataStore();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = self;
    _os_log_impl(&dword_19A6D4000, v10, OS_LOG_TYPE_DEFAULT, "Migrating %{public}@ to latest identity...", buf, 0xCu);
  }

  identifier = self->_identifier;
  client = self->_client;
  objc_msgSend(v6, "identityString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:](client, "migrateIdentifier:toIdentifier:", identifier, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    FBLogAppDataStore();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore migrateToIdentity:error:].cold.3((uint64_t)self, v14);

  }
  if (a4)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __51__FBSApplicationDataStore_migrateToIdentity_error___block_invoke;
    v22[3] = &unk_1E38EC4A0;
    v23 = v14;
    objc_msgSend(v16, "bs_errorWithDomain:code:configuration:", CFSTR("FBSApplicationDataStore"), 1, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14 == 0;
}

void __51__FBSApplicationDataStore_migrateToIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFailureDescription:", CFSTR("Migration failed"));
  objc_msgSend(v3, "setUnderlyingError:", *(_QWORD *)(a1 + 32));

}

- (void)objectForKey:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (objectForKey_withResult__onceToken != -1)
      dispatch_once(&objectForKey_withResult__onceToken, &__block_literal_global_50);
    v8 = objectForKey_withResult__queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__FBSApplicationDataStore_objectForKey_withResult___block_invoke_2;
    block[3] = &unk_1E38EB5D8;
    v11 = v7;
    block[4] = self;
    v10 = v6;
    dispatch_async(v8, block);

  }
}

void __51__FBSApplicationDataStore_objectForKey_withResult___block_invoke()
{
  uint64_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)objectForKey_withResult__queue;
  objectForKey_withResult__queue = Serial;

}

void __51__FBSApplicationDataStore_objectForKey_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)safeObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5
{
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  Class v12;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__FBSApplicationDataStore_safeObjectForKey_ofType_withResult___block_invoke;
    v10[3] = &unk_1E38EC510;
    v11 = v8;
    v12 = a4;
    -[FBSApplicationDataStore objectForKey:withResult:](self, "objectForKey:withResult:", a3, v10);

  }
}

void __62__FBSApplicationDataStore_safeObjectForKey_ofType_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

- (id)deserializeObjectForKey:(id)a3 ofType:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71BD38);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71BD9CLL);
  }

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:].cold.2();
    goto LABEL_19;
  }
  v7 = (void *)MEMORY[0x19AECA15C]();
  -[FBSApplicationDataStore safeObjectForKey:ofType:](self, "safeObjectForKey:ofType:", v6, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureObjectFromData:ofClass:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v7);
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (void)deserializeObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  Class v18;

  v8 = a3;
  v9 = a5;
  v10 = v8;
  NSClassFromString(CFSTR("NSString"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:withResult:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71BF54);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:withResult:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71BFB8);
  }

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:withResult:].cold.2();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71C01CLL);
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("resultBlock"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore deserializeObjectForKey:ofType:withResult:].cold.3();
    goto LABEL_17;
  }
  v11 = objc_opt_class();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__FBSApplicationDataStore_deserializeObjectForKey_ofType_withResult___block_invoke;
  v16[3] = &unk_1E38EC538;
  v17 = v9;
  v18 = a4;
  v12 = v9;
  -[FBSApplicationDataStore safeObjectForKey:ofType:withResult:](self, "safeObjectForKey:ofType:withResult:", v10, v11, v16);

}

void __69__FBSApplicationDataStore_deserializeObjectForKey_ofType_withResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v3 = (void *)MEMORY[0x19AECA15C]();
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureObjectFromData:ofClass:", v10, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v9);
}

- (void)serializeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("object"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore serializeObject:forKey:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71C240);
  }
  v7 = v6;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore serializeObject:forKey:].cold.2();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71C2A4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStore serializeObject:forKey:].cold.2();
    goto LABEL_13;
  }

  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSApplicationDataStore setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)archivedObjectForKey:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__FBSApplicationDataStore_archivedObjectForKey_withResult___block_invoke;
    v9[3] = &unk_1E38EC560;
    v10 = v6;
    -[FBSApplicationDataStore safeObjectForKey:ofType:withResult:](self, "safeObjectForKey:ofType:withResult:", v7, v8, v9);

    v7 = v10;
  }
  else
  {
    -[FBSApplicationDataStore safeObjectForKey:ofType:withResult:](self, "safeObjectForKey:ofType:withResult:", v7, v8, 0);
  }

}

void __59__FBSApplicationDataStore_archivedObjectForKey_withResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)_FBSCreateUnsafeObjectFromData(a2);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)safeArchivedObjectForKey:(id)a3 ofType:(Class)a4 withResult:(id)a5
{
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  Class v12;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__FBSApplicationDataStore_safeArchivedObjectForKey_ofType_withResult___block_invoke;
    v10[3] = &unk_1E38EC510;
    v11 = v8;
    v12 = a4;
    -[FBSApplicationDataStore archivedObjectForKey:withResult:](self, "archivedObjectForKey:withResult:", a3, v10);

  }
}

void __70__FBSApplicationDataStore_safeArchivedObjectForKey_ofType_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

- (void)removeAllObjects
{
  -[FBSApplicationDataStoreRepositoryClient removeAllObjectsForApplication:withCompletion:](self->_client, "removeAllObjectsForApplication:withCompletion:", self->_identifier, 0);
}

uint64_t __53__FBSApplicationDataStore_synchronizeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)setPrefetchedKeys:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "copy");
  FBLogAppDataStore();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_DEFAULT, "Setting prefetched keys: %@", buf, 0xCu);
  }

  +[FBSApplicationDataStoreClientFactory sharedInstance](FBSApplicationDataStoreClientFactory, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrefetchedKeys:", v3);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__FBSApplicationDataStore_setPrefetchedKeys___block_invoke;
  v8[3] = &unk_1E38EC5B0;
  v9 = v3;
  v6 = v3;
  +[FBSApplicationDataStore _doWithClassClient:](FBSApplicationDataStore, "_doWithClassClient:", v8);
  FBLogAppDataStore();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A6D4000, v7, OS_LOG_TYPE_DEFAULT, "Finishing prefetching", buf, 2u);
  }

}

uint64_t __45__FBSApplicationDataStore_setPrefetchedKeys___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addPrefetchedKeys:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)isServerProcess
{
  return +[FBSApplicationDataStoreClientFactory isServerProcess](FBSApplicationDataStoreClientFactory, "isServerProcess");
}

+ (void)_setClassClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__classClient != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__classClient, a3);
    v4 = v5;
  }

}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = CFSTR("TBD");
  if (!self->_identity)
    v3 = CFSTR("legacy");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), self->_bundleId, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v7, self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)bundleID
{
  return self->_bundleId;
}

- (LSApplicationIdentity)identity
{
  return self->_identity;
}

- (FBSApplicationIdentifying)applicationIdentifier
{
  return (FBSApplicationIdentifying *)self->_identifier;
}

- (void)_initWithBundleId:identity:client:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithBundleId:(os_log_t)log identity:client:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A6D4000, log, OS_LOG_TYPE_FAULT, "Initialized FBSApplicationDataStore with nil bundleID", v1, 2u);
}

+ (void)storeForApplicationIdentity:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)storeForApplicationIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)migrateWithError:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v3, v4, "Unable to migrate %{public}@: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)migrateToIdentity:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)migrateToIdentity:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)migrateToIdentity:(uint64_t)a1 error:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "succinctDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v3, v4, "Error migrating %{public}@: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)migrateToIdentity:error:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)deserializeObjectForKey:ofType:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)deserializeObjectForKey:ofType:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)deserializeObjectForKey:ofType:withResult:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)deserializeObjectForKey:ofType:withResult:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)deserializeObjectForKey:ofType:withResult:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)serializeObject:forKey:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)serializeObject:forKey:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setObject:(uint64_t)a1 forKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8_2(&dword_19A6D4000, a2, v5, "ERROR: unable to store value of class \"%{public}@\" for nil key", v6);

  OUTLINED_FUNCTION_20();
}

- (void)setObject:forKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8_2(&dword_19A6D4000, v0, v1, "ERROR: value provided for key \"%{public}@\" is not a valid property list", v2);
  OUTLINED_FUNCTION_21();
}

- (void)setArchivedObject:forKey:.cold.1()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_opt_class();
  OUTLINED_FUNCTION_11_1();
  v1 = v0;
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v2, v3, "Error during encoding of %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

@end
