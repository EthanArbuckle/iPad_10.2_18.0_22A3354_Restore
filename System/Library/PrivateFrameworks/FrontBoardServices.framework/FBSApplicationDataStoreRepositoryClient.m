@implementation FBSApplicationDataStoreRepositoryClient

- (FBSApplicationDataStoreRepositoryClient)init
{
  FBSApplicationDataStoreRepositoryClient *v2;
  FBSApplicationDataStoreRepositoryClient *v3;
  NSCountedSet *v4;
  NSCountedSet *prefetchedKeys;
  NSMutableDictionary *v6;
  NSMutableDictionary *prefetchedKeyValues;
  NSMutableDictionary *v8;
  NSMutableDictionary *pendingChangesToPrefetchedKeys;
  uint64_t v10;
  NSHashTable *observers;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FBSApplicationDataStoreRepositoryClient;
  v2 = -[FBSServiceFacilityClient initWithConfigurator:](&v13, sel_initWithConfigurator_, &__block_literal_global_3);
  v3 = v2;
  if (v2)
  {
    v2->_prefetchedDataLock._os_unfair_lock_opaque = 0;
    v4 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    prefetchedKeys = v3->_prefetchedKeys;
    v3->_prefetchedKeys = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    prefetchedKeyValues = v3->_prefetchedKeyValues;
    v3->_prefetchedKeyValues = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingChangesToPrefetchedKeys = v3->_pendingChangesToPrefetchedKeys;
    v3->_pendingChangesToPrefetchedKeys = v8;

    v3->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v10;

  }
  return v3;
}

void __47__FBSApplicationDataStoreRepositoryClient_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  +[FBSServiceFacilityClient defaultShellEndpoint](FBSServiceFacilityClient, "defaultShellEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEndpoint:", v3);

  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.frontboardservices.applicationdatastore"));
  objc_msgSend(off_1E38E9E80, "userInitiated");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setServiceQuality:", v4);

}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBSApplicationDataStoreRepositoryClient;
  -[FBSServiceFacilityClient invalidate](&v2, sel_invalidate);
}

- (void)addPrefetchedKeys:(id)a3
{
  os_unfair_lock_s *p_prefetchedDataLock;
  id v5;
  id v6;

  p_prefetchedDataLock = &self->_prefetchedDataLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_prefetchedDataLock);
  os_unfair_lock_lock(p_prefetchedDataLock);
  -[NSCountedSet addObjectsFromArray:](self->_prefetchedKeys, "addObjectsFromArray:", v5);

  -[NSCountedSet allObjects](self->_prefetchedKeys, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_prefetchedDataLock);
  -[FBSApplicationDataStoreRepositoryClient _sendPrefetchedKeys:withCompletion:](self, "_sendPrefetchedKeys:withCompletion:", v6, 0);

}

- (void)removePrefetchedKeys:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[NSCountedSet removeObject:](self->_prefetchedKeys, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[NSCountedSet allObjects](self->_prefetchedKeys, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_prefetchedDataLock);
  -[FBSApplicationDataStoreRepositoryClient _sendPrefetchedKeys:withCompletion:](self, "_sendPrefetchedKeys:withCompletion:", v13, v7);

}

- (void)_sendPrefetchedKeys:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke;
  v13[3] = &unk_1E38EB670;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke_2;
  v11[3] = &unk_1E38EB6C0;
  v8 = v7 == 0;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  v10 = v6;
  -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 7, v13, v11, v8);

}

uint64_t __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke()
{
  return BSSerializeCFValueToXPCDictionaryWithKey();
}

void __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  v2 = (id)BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 80));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke_3;
    v3[3] = &unk_1E38EB698;
    v3[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(a1 + 32), "fireCompletion:error:", *(_QWORD *)(a1 + 40), 0);

}

void __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v6, "setObject:forKey:", v7, v8);

    }
  }

}

- (void)synchronizeWithCompletion:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__FBSApplicationDataStoreRepositoryClient_synchronizeWithCompletion___block_invoke_2;
  v7[3] = &unk_1E38EB6C0;
  v7[4] = self;
  v8 = v4;
  v5 = v4 == 0;
  v6 = v4;
  -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 0, &__block_literal_global_11, v7, v5);

}

uint64_t __69__FBSApplicationDataStoreRepositoryClient_synchronizeWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fireCompletion:error:", *(_QWORD *)(a1 + 40), 0);
}

- (id)availableDataStores
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
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__FBSApplicationDataStoreRepositoryClient_availableDataStores__block_invoke_2;
  v4[3] = &unk_1E38EB728;
  v4[4] = &v5;
  -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 1, &__block_literal_global_12, v4, 1);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __62__FBSApplicationDataStoreRepositoryClient_availableDataStores__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    BSDeserializeCFValueFromXPCDictionaryWithKey();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("NSString"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A709C7CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:].cold.4();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A709CE0);
  }

  v9 = v7;
  NSClassFromString(CFSTR("NSString"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A709D44);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:].cold.3();
    goto LABEL_17;
  }

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__FBSApplicationDataStoreRepositoryClient_migrateIdentifier_toIdentifier___block_invoke;
  v19[3] = &unk_1E38EB750;
  v11 = v8;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __74__FBSApplicationDataStoreRepositoryClient_migrateIdentifier_toIdentifier___block_invoke_2;
  v18[3] = &unk_1E38EB728;
  v18[4] = &v22;
  -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 2, v19, v18, 1);
  v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __74__FBSApplicationDataStoreRepositoryClient_migrateIdentifier_toIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  xpc_object_t xdict;

  v4 = objc_retainAutorelease(*(id *)(a1 + 32));
  xdict = a2;
  xpc_dictionary_set_string(xdict, "appID", (const char *)objc_msgSend(v4, "UTF8String"));
  xpc_dictionary_set_string(xdict, "appID2", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));

}

void __74__FBSApplicationDataStoreRepositoryClient_migrateIdentifier_toIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_opt_class();
    v3 = BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4101, 0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)objectForKey:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    v26 = 0;
    obj = 0;
    v10 = -[FBSApplicationDataStoreRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:](self, "prefetchedObjectIfAvailableForKey:application:outObject:", v6, v7, &obj);
    objc_storeStrong(&v26, obj);
    if (!v10)
    {
      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __71__FBSApplicationDataStoreRepositoryClient_objectForKey_forApplication___block_invoke;
      v17[3] = &unk_1E38EB750;
      v18 = v6;
      v19 = v8;
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __71__FBSApplicationDataStoreRepositoryClient_objectForKey_forApplication___block_invoke_2;
      v13[3] = &unk_1E38EB778;
      v16 = &v21;
      v13[4] = self;
      v14 = v18;
      v15 = v19;
      -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 3, v17, v13, 1);

    }
    v9 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

  }
  return v9;
}

void __71__FBSApplicationDataStoreRepositoryClient_objectForKey_forApplication___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  xpc_object_t xdict;

  v4 = objc_retainAutorelease(*(id *)(a1 + 32));
  xdict = a2;
  xpc_dictionary_set_string(xdict, "key", (const char *)objc_msgSend(v4, "UTF8String"));
  xpc_dictionary_set_string(xdict, "appID", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));

}

uint64_t __71__FBSApplicationDataStoreRepositoryClient_objectForKey_forApplication___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  return objc_msgSend(*(id *)(a1 + 32), "_setPrefetchedObjectIfNecessary:forKey:application:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11 && v12)
  {
    if (v10)
    {
      -[FBSApplicationDataStoreRepositoryClient _setPrefetchedObjectIfNecessary:forKey:application:](self, "_setPrefetchedObjectIfNecessary:forKey:application:", v10, v11, v12);
      -[FBSApplicationDataStoreRepositoryClient _setChangeInFlight:forPrefetchedKey:application:](self, "_setChangeInFlight:forPrefetchedKey:application:", 1, v11, v12);
      v14 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __90__FBSApplicationDataStoreRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke;
      v19[3] = &unk_1E38EB7A0;
      v20 = v11;
      v21 = v10;
      v22 = v12;
      v15[0] = v14;
      v15[1] = 3221225472;
      v15[2] = __90__FBSApplicationDataStoreRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke_2;
      v15[3] = &unk_1E38EB7C8;
      v15[4] = self;
      v16 = v20;
      v17 = v22;
      v18 = v13;
      -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 4, v19, v15, 0);

    }
    else
    {
      -[FBSApplicationDataStoreRepositoryClient removeObjectForKey:forApplication:withCompletion:](self, "removeObjectForKey:forApplication:withCompletion:", v11, v12, v13);
    }
  }
  else
  {
    -[FBSApplicationDataStoreRepositoryClient fireCompletion:error:](self, "fireCompletion:error:", v13, 0);
  }

}

void __90__FBSApplicationDataStoreRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  xpc_object_t xdict;

  v4 = objc_retainAutorelease(*(id *)(a1 + 32));
  xdict = a2;
  xpc_dictionary_set_string(xdict, "key", (const char *)objc_msgSend(v4, "UTF8String"));
  BSSerializeCFValueToXPCDictionaryWithKey();
  xpc_dictionary_set_string(xdict, "appID", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));

}

uint64_t __90__FBSApplicationDataStoreRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setChangeInFlight:forPrefetchedKey:application:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "fireCompletion:error:", *(_QWORD *)(a1 + 56), 0);
}

- (void)removeObjectForKey:(id)a3 forApplication:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9)
  {
    -[FBSApplicationDataStoreRepositoryClient _setPrefetchedObjectIfNecessary:forKey:application:](self, "_setPrefetchedObjectIfNecessary:forKey:application:", 0, v8, v9);
    -[FBSApplicationDataStoreRepositoryClient _setChangeInFlight:forPrefetchedKey:application:](self, "_setChangeInFlight:forPrefetchedKey:application:", 1, v8, v9);
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__FBSApplicationDataStoreRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke;
    v16[3] = &unk_1E38EB750;
    v17 = v8;
    v18 = v9;
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __92__FBSApplicationDataStoreRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke_2;
    v12[3] = &unk_1E38EB7C8;
    v12[4] = self;
    v13 = v17;
    v14 = v18;
    v15 = v10;
    -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 5, v16, v12, 0);

  }
  else
  {
    -[FBSApplicationDataStoreRepositoryClient fireCompletion:error:](self, "fireCompletion:error:", v10, 0);
  }

}

void __92__FBSApplicationDataStoreRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  xpc_object_t xdict;

  v4 = objc_retainAutorelease(*(id *)(a1 + 32));
  xdict = a2;
  xpc_dictionary_set_string(xdict, "key", (const char *)objc_msgSend(v4, "UTF8String"));
  xpc_dictionary_set_string(xdict, "appID", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));

}

uint64_t __92__FBSApplicationDataStoreRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setChangeInFlight:forPrefetchedKey:application:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "fireCompletion:error:", *(_QWORD *)(a1 + 56), 0);
}

- (void)removeAllObjectsForApplication:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__FBSApplicationDataStoreRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke;
    v11[3] = &unk_1E38EB670;
    v12 = v6;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __89__FBSApplicationDataStoreRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke_2;
    v9[3] = &unk_1E38EB6C0;
    v9[4] = self;
    v10 = v7;
    -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 6, v11, v9, 0);

  }
  else
  {
    -[FBSApplicationDataStoreRepositoryClient fireCompletion:error:](self, "fireCompletion:error:", v7, 0);
  }

}

void __89__FBSApplicationDataStoreRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t xdict;

  v3 = objc_retainAutorelease(*(id *)(a1 + 32));
  xdict = a2;
  xpc_dictionary_set_string(xdict, "appID", (const char *)objc_msgSend(v3, "UTF8String"));

}

uint64_t __89__FBSApplicationDataStoreRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fireCompletion:error:", *(_QWORD *)(a1 + 40), 0);
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(&self->_observersLock);
  if (!-[NSHashTable count](self->_observers, "count"))
    -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 8, &__block_literal_global_23, 0, 0);
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  os_unfair_lock_unlock(&self->_observersLock);

}

void __55__FBSApplicationDataStoreRepositoryClient_addObserver___block_invoke(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "allChangesInterest", 1);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_observersLock);
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  if (!-[NSHashTable count](self->_observers, "count"))
    -[FBSApplicationDataStoreRepositoryClient _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 8, &__block_literal_global_24, 0, 0);
  os_unfair_lock_unlock(p_observersLock);
}

void __58__FBSApplicationDataStoreRepositoryClient_removeObserver___block_invoke(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "allChangesInterest", 0);
}

- (void)handleMessage:(id)a3 withType:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 == 10)
  {
    v7 = v6;
    -[FBSApplicationDataStoreRepositoryClient _calloutQueue_handleStoreInvalidated:](self, "_calloutQueue_handleStoreInvalidated:", v6);
    goto LABEL_5;
  }
  if (a4 == 9)
  {
    v7 = v6;
    -[FBSApplicationDataStoreRepositoryClient _calloutQueue_handleValueChanged:](self, "_calloutQueue_handleValueChanged:", v6);
LABEL_5:
    v6 = v7;
  }

}

- (void)_calloutQueue_handleValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
  v14 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "appID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[FBSApplicationDataStoreRepositoryClient _isChangeInFlightForPrefetchedKey:application:](self, "_isChangeInFlightForPrefetchedKey:application:", v5, v7))-[FBSApplicationDataStoreRepositoryClient _setPrefetchedObjectIfNecessary:forKey:application:](self, "_setPrefetchedObjectIfNecessary:forKey:application:", v6, v5, v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBSApplicationDataStoreRepositoryClient _observers](self, "_observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "applicationDataStoreRepositoryClient:application:changedObject:forKey:", self, v7, v6, v5);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_setChangeInFlight:(BOOL)a3 forPrefetchedKey:(id)a4 application:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  -[NSMutableDictionary objectForKey:](self->_pendingChangesToPrefetchedKeys, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v6 && !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_pendingChangesToPrefetchedKeys, "setObject:forKey:", v10, v8);
  }
  if (v6)
  {
    objc_msgSend(v10, "addObject:", v11);
  }
  else
  {
    objc_msgSend(v10, "removeObject:", v11);
    if (v10 && !objc_msgSend(v10, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_pendingChangesToPrefetchedKeys, "removeObjectForKey:", v8);
  }
  os_unfair_lock_unlock(&self->_prefetchedDataLock);

}

- (BOOL)_isChangeInFlightForPrefetchedKey:(id)a3 application:(id)a4
{
  os_unfair_lock_s *p_prefetchedDataLock;
  id v7;
  id v8;
  void *v9;

  p_prefetchedDataLock = &self->_prefetchedDataLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_not_owner(p_prefetchedDataLock);
  os_unfair_lock_lock(p_prefetchedDataLock);
  -[NSMutableDictionary objectForKey:](self->_pendingChangesToPrefetchedKeys, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v9, "containsObject:", v8);
  os_unfair_lock_unlock(p_prefetchedDataLock);
  return (char)v7;
}

- (id)_allPrefetchedChangesInFlightForApplication:(id)a3
{
  os_unfair_lock_s *p_prefetchedDataLock;
  id v5;
  void *v6;

  p_prefetchedDataLock = &self->_prefetchedDataLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_prefetchedDataLock);
  os_unfair_lock_lock(p_prefetchedDataLock);
  -[NSMutableDictionary objectForKey:](self->_pendingChangesToPrefetchedKeys, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_prefetchedDataLock);
  return v6;
}

- (void)_calloutQueue_handleStoreInvalidated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v16, "appID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  -[NSMutableDictionary objectForKey:](self->_prefetchedKeyValues, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_pendingChangesToPrefetchedKeys, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__FBSApplicationDataStoreRepositoryClient__calloutQueue_handleStoreInvalidated___block_invoke;
  v21[3] = &unk_1E38EB810;
  v15 = v5;
  v22 = v15;
  v8 = v6;
  v23 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v21);
  -[NSMutableDictionary setObject:forKey:](self->_prefetchedKeyValues, "setObject:forKey:", v8, v4);
  os_unfair_lock_unlock(&self->_prefetchedDataLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBSApplicationDataStoreRepositoryClient _observers](self, "_observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "applicationDataStoreRepositoryClient:storeInvalidatedForApplication:", self, v4);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v11);
  }

}

void __80__FBSApplicationDataStoreRepositoryClient__calloutQueue_handleStoreInvalidated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, v4);

}

- (void)_setPrefetchedObjectIfNecessary:(id)a3 forKey:(id)a4 application:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  if (-[NSCountedSet countForObject:](self->_prefetchedKeys, "countForObject:", v8))
  {
    -[NSMutableDictionary objectForKey:](self->_prefetchedKeyValues, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_prefetchedKeyValues, "setObject:forKey:", v10, v9);
    }
    if (v11)
      objc_msgSend(v10, "setObject:forKey:", v11, v8);
    else
      objc_msgSend(v10, "removeObjectForKey:", v8);

  }
  os_unfair_lock_unlock(&self->_prefetchedDataLock);

}

- (BOOL)prefetchedObjectIfAvailableForKey:(id)a3 application:(id)a4 outObject:(id *)a5
{
  id v8;
  os_unfair_lock_s *p_prefetchedDataLock;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v8 = a3;
  p_prefetchedDataLock = &self->_prefetchedDataLock;
  v10 = a4;
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  -[NSMutableDictionary objectForKey:](self->_prefetchedKeyValues, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  if (-[NSCountedSet countForObject:](self->_prefetchedKeys, "countForObject:", v8))
    v14 = 1;
  else
    v14 = v13;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqual:", v15))
    v16 = 0;
  else
    v16 = v12;
  v17 = v16;

  os_unfair_lock_unlock(p_prefetchedDataLock);
  if (a5)
  {
    if (v14)
      v18 = v17;
    else
      v18 = 0;
    *a5 = objc_retainAutorelease(v18);
  }

  return v14;
}

- (id)_observers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(p_observersLock);
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy");
  os_unfair_lock_unlock(p_observersLock);
  return v4;
}

- (void)_sendMessageType:(int)a3 withMessage:(id)a4 withReplyHandler:(id)a5 waitForReply:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__FBSApplicationDataStoreRepositoryClient__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke;
  v18[3] = &unk_1E38EB838;
  v19 = v10;
  v13 = v10;
  +[FBSXPCMessage messageWithPacker:](FBSXPCMessage, "messageWithPacker:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __102__FBSApplicationDataStoreRepositoryClient__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke_2;
  v16[3] = &unk_1E38EB860;
  v17 = v11;
  v15 = v11;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v14, a3, v16, v6, 0.0);

}

uint64_t __102__FBSApplicationDataStoreRepositoryClient__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__FBSApplicationDataStoreRepositoryClient__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "payload");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)fireCompletion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[FBSServiceFacilityClient calloutQueue](self, "calloutQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__FBSApplicationDataStoreRepositoryClient_fireCompletion_error___block_invoke;
    v9[3] = &unk_1E38EB888;
    v11 = v6;
    v10 = v7;
    dispatch_async(v8, v9);

  }
}

uint64_t __64__FBSApplicationDataStoreRepositoryClient_fireCompletion_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingChangesToPrefetchedKeys, 0);
  objc_storeStrong((id *)&self->_prefetchedKeyValues, 0);
  objc_storeStrong((id *)&self->_prefetchedKeys, 0);
}

- (void)migrateIdentifier:toIdentifier:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)migrateIdentifier:toIdentifier:.cold.2()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)migrateIdentifier:toIdentifier:.cold.3()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)migrateIdentifier:toIdentifier:.cold.4()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
