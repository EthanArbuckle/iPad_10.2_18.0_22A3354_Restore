@implementation FBApplicationDataStoreRepositoryServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_7);
  return (id)sharedInstance___shared;
}

void __56__FBApplicationDataStoreRepositoryServer_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  if (objc_msgSend(MEMORY[0x1E0D23068], "isServerProcess"))
  {
    v0 = -[FBApplicationDataStoreRepositoryServer _init]([FBApplicationDataStoreRepositoryServer alloc], "_init");
    v1 = (void *)sharedInstance___shared;
    sharedInstance___shared = (uint64_t)v0;

  }
}

- (id)_init
{
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  FBApplicationDataStoreRepositoryServer *v7;
  void *v8;
  uint64_t v9;
  FBApplicationDataStoreRepository *dataStore;
  uint64_t v11;
  FBServiceClientAuthenticator *connectionAuthenticator;
  objc_super v14;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("FBApplicationDataStoreRepositoryServer", v3);

  objc_msgSend(MEMORY[0x1E0D23258], "_queueWithSerialDispatchQueue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D22B80];
  v14.receiver = self;
  v14.super_class = (Class)FBApplicationDataStoreRepositoryServer;
  v7 = -[FBSServiceFacility initWithIdentifier:queue:](&v14, sel_initWithIdentifier_queue_, v6, v5);
  if (v7)
  {
    +[FBApplicationDataStoreRepositoryManager sharedInstance](FBApplicationDataStoreRepositoryManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataStore");
    v9 = objc_claimAutoreleasedReturnValue();
    dataStore = v7->_dataStore;
    v7->_dataStore = (FBApplicationDataStoreRepository *)v9;

    +[FBServiceClientAuthenticator sharedSystemClientAuthenticator](FBServiceClientAuthenticator, "sharedSystemClientAuthenticator");
    v11 = objc_claimAutoreleasedReturnValue();
    connectionAuthenticator = v7->_connectionAuthenticator;
    v7->_connectionAuthenticator = (FBServiceClientAuthenticator *)v11;

  }
  return v7;
}

- (id)_prerequisiteMilestones
{
  return 0;
}

- (BOOL)shouldAllowClientConnection:(id)a3 withMessage:(id)a4
{
  return -[FBServiceClientAuthenticator authenticateClient:](self->_connectionAuthenticator, "authenticateClient:", a3, a4);
}

- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4
{
  id v5;
  FBApplicationDataStoreRepositoryServerClientContext *v6;

  v5 = a3;
  v6 = -[FBApplicationDataStoreRepositoryServerClientContext initWithDataStore:]([FBApplicationDataStoreRepositoryServerClientContext alloc], "initWithDataStore:", self->_dataStore);
  -[FBApplicationDataStoreRepositoryServerClientContext setDelegate:](v6, "setDelegate:", self);
  objc_msgSend(v5, "setContext:", v6);

}

- (void)noteClientDidDisconnect:(id)a3
{
  id v3;

  objc_msgSend(a3, "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a5, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 0:
      -[FBApplicationDataStoreRepositoryServer _handleSynchronize:](self, "_handleSynchronize:", v9);
      break;
    case 1:
      -[FBApplicationDataStoreRepositoryServer _handleGetAvailableDataStores:](self, "_handleGetAvailableDataStores:", v9);
      break;
    case 2:
      -[FBApplicationDataStoreRepositoryServer _handleMigrateIdentifier:](self, "_handleMigrateIdentifier:", v9);
      break;
    case 3:
      -[FBApplicationDataStoreRepositoryServer _handleGetObjectForKey:](self, "_handleGetObjectForKey:", v9);
      break;
    case 4:
      -[FBApplicationDataStoreRepositoryServer _handleSetObjectForKey:context:](self, "_handleSetObjectForKey:context:", v9, v8);
      break;
    case 5:
      -[FBApplicationDataStoreRepositoryServer _handleRemoveObjectForKey:context:](self, "_handleRemoveObjectForKey:context:", v9, v8);
      break;
    case 6:
      -[FBApplicationDataStoreRepositoryServer _handleRemoveAllObjects:](self, "_handleRemoveAllObjects:", v9);
      break;
    case 7:
      -[FBApplicationDataStoreRepositoryServer _handleSetPrefetchedKeys:context:](self, "_handleSetPrefetchedKeys:context:", v9, v8);
      break;
    case 8:
      -[FBApplicationDataStoreRepositoryServer _handleSetChangesInterest:context:](self, "_handleSetChangesInterest:context:", v9, v8);
      break;
    default:
      break;
  }

}

- (void)_handleSetPrefetchedKeys:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v11 = a4;
  v6 = a3;
  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeCFValueFromXPCDictionaryWithKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v11, "setPrefetchedKeys:", v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__FBApplicationDataStoreRepositoryServer__handleSetPrefetchedKeys_context___block_invoke;
  v12[3] = &unk_1E4A12BF8;
  v12[4] = self;
  v13 = v9;
  v10 = v9;
  objc_msgSend(v6, "sendReplyMessageWithPacker:", v12);

}

void __75__FBApplicationDataStoreRepositoryServer__handleSetPrefetchedKeys_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjectsForKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    BSSerializeCFValueToXPCDictionaryWithKey();

}

- (void)_handleSetChangesInterest:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v5 = a4;
  v8 = a3;
  objc_msgSend(v8, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_dictionary_get_BOOL(v6, (const char *)*MEMORY[0x1E0D22BB8]);

  objc_msgSend(v5, "setInterestedInAllChanges:", v7);
  objc_msgSend(v8, "sendReplyMessageWithPacker:", &__block_literal_global_10);

}

- (void)_handleSynchronize:(id)a3
{
  FBApplicationDataStoreRepository *dataStore;
  id v4;

  dataStore = self->_dataStore;
  v4 = a3;
  -[FBApplicationDataStoreRepository flushSynchronously](dataStore, "flushSynchronously");
  objc_msgSend(v4, "sendReplyMessageWithPacker:", &__block_literal_global_11_0);

}

- (void)_handleGetAvailableDataStores:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__FBApplicationDataStoreRepositoryServer__handleGetAvailableDataStores___block_invoke;
  v3[3] = &unk_1E4A11FF8;
  v3[4] = self;
  objc_msgSend(a3, "sendReplyMessageWithPacker:", v3);
}

void __72__FBApplicationDataStoreRepositoryServer__handleGetAvailableDataStores___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "applicationIdentifiersWithState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  BSSerializeCFValueToXPCDictionaryWithKey();

}

- (void)_handleMigrateIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v17[0] = CFSTR("Invalid parameters ");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("FBApplicationDataStore"), 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBApplicationDataStoreRepository migrateIdentifier:toIdentifier:](self->_dataStore, "migrateIdentifier:toIdentifier:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__FBApplicationDataStoreRepositoryServer__handleMigrateIdentifier___block_invoke;
  v14[3] = &unk_1E4A11FF8;
  v15 = v12;
  v13 = v12;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v14);

}

uint64_t __67__FBApplicationDataStoreRepositoryServer__handleMigrateIdentifier___block_invoke()
{
  return BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

- (void)_handleGetObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  FBApplicationDataStoreRepositoryServer *v13;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__FBApplicationDataStoreRepositoryServer__handleGetObjectForKey___block_invoke;
  v10[3] = &unk_1E4A12C20;
  v11 = v5;
  v12 = v6;
  v13 = self;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v10);

}

void __65__FBApplicationDataStoreRepositoryServer__handleGetObjectForKey___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1[4] && a1[5])
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1[6] + 56), "objectForKey:forApplication:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      BSSerializeCFValueToXPCDictionaryWithKey();

    v3 = v5;
  }

}

- (void)_handleSetObjectForKey:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FBApplicationDataStoreRepositoryServer *v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__FBApplicationDataStoreRepositoryServer__handleSetObjectForKey_context___block_invoke;
  v7[3] = &unk_1E4A12BF8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  objc_msgSend(v6, "sendReplyMessageWithPacker:", v7);

}

void __73__FBApplicationDataStoreRepositoryServer__handleSetObjectForKey_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)BSCreateDeserializedCFValueFromXPCDictionaryWithKey();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "payload");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeStringFromXPCDictionaryWithKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeStringFromXPCDictionaryWithKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKey:forApplication:", v6, v4, v5);

  }
}

- (void)_handleRemoveObjectForKey:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FBApplicationDataStoreRepositoryServer *v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__FBApplicationDataStoreRepositoryServer__handleRemoveObjectForKey_context___block_invoke;
  v7[3] = &unk_1E4A12BF8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  objc_msgSend(v6, "sendReplyMessageWithPacker:", v7);

}

void __76__FBApplicationDataStoreRepositoryServer__handleRemoveObjectForKey_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "payload");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObjectForKey:forApplication:", v2, v3);

}

- (void)_handleRemoveAllObjects:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  FBApplicationDataStoreRepositoryServer *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__FBApplicationDataStoreRepositoryServer__handleRemoveAllObjects___block_invoke;
  v6[3] = &unk_1E4A12BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "sendReplyMessageWithPacker:", v6);

}

void __66__FBApplicationDataStoreRepositoryServer__handleRemoveAllObjects___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeAllObjectsForApplication:", v3);
}

- (void)applicationDataStoreRepositoryClientContext:(id)a3 valueChangedForObject:(id)a4 key:(id)a5 appID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v16 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "clientHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0D232D0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __118__FBApplicationDataStoreRepositoryServer_applicationDataStoreRepositoryClientContext_valueChangedForObject_key_appID___block_invoke;
    v17[3] = &unk_1E4A12C20;
    v18 = v10;
    v19 = v11;
    v20 = v16;
    objc_msgSend(v13, "messageWithPacker:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSServiceFacility sendMessage:withType:toClients:](self, "sendMessage:withType:toClients:", v14, 9, v15);

  }
}

void __118__FBApplicationDataStoreRepositoryServer_applicationDataStoreRepositoryClientContext_valueChangedForObject_key_appID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0D22BD8], (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0D22BC0], (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  v3 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isEqual:", v4);

  if ((v3 & 1) == 0)
    BSSerializeCFValueToXPCDictionaryWithKey();

}

- (void)applicationDataStoreRepositoryClientContext:(id)a3 repositoryInvalidatedForAppID:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a4;
  objc_msgSend(a3, "clientHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D232D0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __116__FBApplicationDataStoreRepositoryServer_applicationDataStoreRepositoryClientContext_repositoryInvalidatedForAppID___block_invoke;
    v11[3] = &unk_1E4A11FF8;
    v12 = v10;
    objc_msgSend(v7, "messageWithPacker:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSServiceFacility sendMessage:withType:toClients:](self, "sendMessage:withType:toClients:", v8, 10, v9);

  }
}

void __116__FBApplicationDataStoreRepositoryServer_applicationDataStoreRepositoryClientContext_repositoryInvalidatedForAppID___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  xpc_object_t xdict;

  v3 = (const char *)*MEMORY[0x1E0D22BC0];
  v4 = objc_retainAutorelease(*(id *)(a1 + 32));
  xdict = a2;
  xpc_dictionary_set_string(xdict, v3, (const char *)objc_msgSend(v4, "UTF8String"));

}

- (FBApplicationDataStoreRepository)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthenticator, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
