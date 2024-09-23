@implementation MGClientService

- (MGClientService)initWithConnectionProvider:(id)a3
{
  MGClientConnectionProvider *v4;
  MGClientService *v5;
  MGClientService *v6;
  NSDictionary *queries;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  MGClientService *v12;
  __int16 v13;
  MGClientConnectionProvider *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (MGClientConnectionProvider *)a3;
  if (!v4)
    v4 = objc_alloc_init(MGClientConnectionProvider);
  v10.receiver = self;
  v10.super_class = (Class)MGClientService;
  v5 = -[MGClientService init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    queries = v5->_queries;
    v5->_queries = (NSDictionary *)MEMORY[0x24BDBD1B8];

    objc_storeStrong((id *)&v6->_provider, v4);
    -[MGClientConnectionProviderProtocol setDelegate:](v6->_provider, "setDelegate:", v6);
    v6->_shouldAttemptReconnect = 1;
    MGLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v12 = v6;
      v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_2172B2000, v8, OS_LOG_TYPE_DEFAULT, "%p service initializing with provider %p", buf, 0x16u);
    }

  }
  return v6;
}

- (MGClientService)init
{
  return -[MGClientService initWithConnectionProvider:](self, "initWithConnectionProvider:", 0);
}

- (NSXPCConnection)connection
{
  id v2;
  _QWORD v4[6];
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
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__MGClientService_connection__block_invoke;
  v4[3] = &unk_24D726B10;
  v4[4] = self;
  v4[5] = &v5;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSXPCConnection *)v2;
}

void __29__MGClientService_connection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3])
  {
    objc_msgSend(v2, "provider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceConnection");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

    objc_setAssociatedObject(*(id *)(*(_QWORD *)(a1 + 32) + 24), "com.apple.MediaGroups.ClientService", *(id *)(a1 + 32), 0);
    MGLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 134217984;
      v14 = v8;
      _os_log_impl(&dword_2172B2000, v7, OS_LOG_TYPE_DEFAULT, "%p setting up interface", (uint8_t *)&v13, 0xCu);
    }

    MGSetServiceXPCInterfacesOnConnection(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setExportedObject:");
    v9 = *(_QWORD **)(a1 + 32);
    v10 = (void *)v9[3];
    objc_msgSend(v9, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dispatchQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setQueue:", v12);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

void __33__MGClientService_connectionLost__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void)reconnect
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  os_unfair_lock_s *v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    v19 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __28__MGClientService_reconnect__block_invoke;
    v13[3] = &unk_24D726B88;
    v13[4] = a1;
    v13[5] = &v14;
    -[MGClientConnectionProvider _withLock:](a1, v13);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = (id)v15[5];
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v24, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v10 != v4)
            objc_enumerationMutation(v2);
          v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
          MGLogForCategory(2);
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v21 = a1;
            v22 = 2112;
            v23 = v6;
            _os_log_impl(&dword_2172B2000, v7, OS_LOG_TYPE_DEFAULT, "%p will retry query %@", buf, 0x16u);
          }

          objc_msgSend((id)v15[5], "objectForKey:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[MGClientService startQueryWithQueryData:](a1, v8);

        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v24, 16);
      }
      while (v3);
    }

    _Block_object_dispose(&v14, 8);
  }
}

void __28__MGClientService_reconnect__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "queries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(_QWORD **)(a1 + 32);
  if (v4[3])
  {
    MGLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v16 = 134217984;
      v17 = v6;
      v7 = "%p not reconnecting - already connected";
LABEL_13:
      _os_log_impl(&dword_2172B2000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(v4, "shouldAttemptReconnect") & 1) == 0)
  {
    MGLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v16 = 134217984;
      v17 = v14;
      v7 = "%p not reconnecting - already attempted";
      goto LABEL_13;
    }
LABEL_14:

    return;
  }
  MGLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v8)
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 134217984;
      v17 = v15;
      v7 = "%p not reconnecting - no outstanding queries";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v16 = 134218240;
    v17 = v9;
    v18 = 2048;
    v19 = v3;
    _os_log_impl(&dword_2172B2000, v5, OS_LOG_TYPE_DEFAULT, "%p attempting reconnect (%lu queries)", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setShouldAttemptReconnect:", 0);
  objc_msgSend(*(id *)(a1 + 32), "queries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 32), "setQueries:", MEMORY[0x24BDBD1B8]);
}

- (void)startQueryWithQueryData:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    MGLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = a1;
      _os_log_impl(&dword_2172B2000, v4, OS_LOG_TYPE_DEFAULT, "%p initiating query with service...", buf, 0xCu);
    }

    objc_msgSend(v3, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, a1);
    objc_msgSend(a1, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __43__MGClientService_startQueryWithQueryData___block_invoke;
    v16[3] = &unk_24D726BD8;
    v9 = v6;
    v17 = v9;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __43__MGClientService_startQueryWithQueryData___block_invoke_2;
    v12[3] = &unk_24D726C28;
    objc_copyWeak(&v15, (id *)buf);
    v13 = v3;
    v11 = v9;
    v14 = v11;
    objc_msgSend(v10, "startQueryWithPredicate:completion:", v5, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);

  }
}

void __41__MGClientService_updateHandlerForQuery___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queries");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__MGClientService_setQueryData_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "queries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setQueries:", v3);

}

void __43__MGClientService_removeQueryDataForQuery___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "queries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setQueries:", v3);

}

+ (MGClientService)clientServiceWithConnectionProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v5, "com.apple.MediaGroups.ClientService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConnectionProvider:", v4);

  return (MGClientService *)v6;
}

- (void)createGroupWithType:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  MGClientService *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  MGLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = self;
    _os_log_impl(&dword_2172B2000, v14, OS_LOG_TYPE_DEFAULT, "%p creating group...", buf, 0xCu);
  }

  -[MGClientService connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __63__MGClientService_createGroupWithType_name_members_completion___block_invoke;
  v22[3] = &unk_24D726BD8;
  v17 = v10;
  v23 = v17;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __63__MGClientService_createGroupWithType_name_members_completion___block_invoke_2;
  v20[3] = &unk_24D726C00;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "createGroupWithType:name:members:completion:", v13, v12, v11, v20);

}

uint64_t __63__MGClientService_createGroupWithType_name_members_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MGClientService_createGroupWithType_name_members_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "forceSetClientService:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)deleteGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  MGClientService *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  MGLogForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_2172B2000, v8, OS_LOG_TYPE_DEFAULT, "%p deleting group...", buf, 0xCu);
  }

  -[MGClientService connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__MGClientService_deleteGroup_completion___block_invoke;
  v12[3] = &unk_24D726BD8;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteGroup:completion:", v7, v10);

}

uint64_t __42__MGClientService_deleteGroup_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)HomeKitAccessoryOfType:(id)a3 accessoryIdentifier:(id)a4 homeIdentifier:(id)a5 categoryType:(id)a6 name:(id)a7 properties:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  MGClientService *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v16 = a9;
  v28 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  MGLogForCategory(2);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = self;
    _os_log_impl(&dword_2172B2000, v22, OS_LOG_TYPE_DEFAULT, "%p requesting HomeKit alias...", buf, 0xCu);
  }

  -[MGClientService connection](self, "connection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __117__MGClientService_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke;
  v31[3] = &unk_24D726BD8;
  v25 = v16;
  v32 = v25;
  objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  v29[1] = 3221225472;
  v29[2] = __117__MGClientService_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke_2;
  v29[3] = &unk_24D726C00;
  v29[4] = self;
  v30 = v25;
  v27 = v25;
  objc_msgSend(v26, "HomeKitAccessoryOfType:accessoryIdentifier:homeIdentifier:categoryType:name:properties:completion:", v21, v20, v19, v18, v17, v28, v29);

}

uint64_t __117__MGClientService_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __117__MGClientService_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "forceSetClientService:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setName:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  MGClientService *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  MGLogForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = self;
    _os_log_impl(&dword_2172B2000, v11, OS_LOG_TYPE_DEFAULT, "%p performing name change...", buf, 0xCu);
  }

  -[MGClientService connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __44__MGClientService_setName_group_completion___block_invoke;
  v19[3] = &unk_24D726BD8;
  v14 = v8;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __44__MGClientService_setName_group_completion___block_invoke_2;
  v17[3] = &unk_24D726C00;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "setName:group:completion:", v10, v9, v17);

}

uint64_t __44__MGClientService_setName_group_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__MGClientService_setName_group_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "forceSetClientService:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)addMember:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  MGClientService *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MGLogForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v22 = self;
    v23 = 2048;
    v24 = v8;
    v25 = 2048;
    v26 = v9;
    _os_log_impl(&dword_2172B2000, v11, OS_LOG_TYPE_DEFAULT, "%p adding %p to %p...", buf, 0x20u);
  }

  -[MGClientService connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __46__MGClientService_addMember_group_completion___block_invoke;
  v19[3] = &unk_24D726BD8;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __46__MGClientService_addMember_group_completion___block_invoke_2;
  v17[3] = &unk_24D726C00;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "addMember:group:completion:", v8, v9, v17);

}

uint64_t __46__MGClientService_addMember_group_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__MGClientService_addMember_group_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "forceSetClientService:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)removeMember:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  MGClientService *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MGLogForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v22 = self;
    v23 = 2048;
    v24 = v8;
    v25 = 2048;
    v26 = v9;
    _os_log_impl(&dword_2172B2000, v11, OS_LOG_TYPE_DEFAULT, "%p removing %p from %p...", buf, 0x20u);
  }

  -[MGClientService connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__MGClientService_removeMember_group_completion___block_invoke;
  v19[3] = &unk_24D726BD8;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __49__MGClientService_removeMember_group_completion___block_invoke_2;
  v17[3] = &unk_24D726C00;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "removeMember:group:completion:", v8, v9, v17);

}

uint64_t __49__MGClientService_removeMember_group_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__MGClientService_removeMember_group_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "forceSetClientService:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __43__MGClientService_startQueryWithQueryData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__MGClientService_startQueryWithQueryData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  os_unfair_lock_s *WeakRetained;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v12 = a2;
  v6 = a4;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v6)
    {
      v8 = *(id *)(a1 + 32);
      v9 = v12;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __41__MGClientService_setQueryData_forQuery___block_invoke;
      v13[3] = &unk_24D726BB0;
      v13[4] = WeakRetained;
      v10 = v8;
      v14 = v10;
      v11 = v9;
      v15 = v11;
      -[MGClientConnectionProvider _withLock:](WeakRetained, v13);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)startQueryWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MGClientServiceQueryData *v9;
  int v10;
  MGClientService *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  MGLogForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = self;
    _os_log_impl(&dword_2172B2000, v8, OS_LOG_TYPE_DEFAULT, "%p starting query...", (uint8_t *)&v10, 0xCu);
  }

  v9 = -[MGClientServiceQueryData initWithPredicate:updateHandler:]([MGClientServiceQueryData alloc], "initWithPredicate:updateHandler:", v7, v6);
  -[MGClientService startQueryWithQueryData:](self, v9);

}

- (void)stopQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[MGClientService connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __40__MGClientService_stopQuery_completion___block_invoke;
  v16[3] = &unk_24D726BD8;
  v10 = v7;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __40__MGClientService_stopQuery_completion___block_invoke_2;
  v13[3] = &unk_24D726C50;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v14 = v12;
  objc_msgSend(v11, "stopQuery:completion:", v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

uint64_t __40__MGClientService_stopQuery_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__MGClientService_stopQuery_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  os_unfair_lock_s *WeakRetained;
  _QWORD v5[5];
  id v6;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = *(id *)(a1 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __43__MGClientService_removeQueryDataForQuery___block_invoke;
    v5[3] = &unk_24D726B38;
    v5[4] = WeakRetained;
    v3 = v2;
    v6 = v3;
    -[MGClientConnectionProvider _withLock:](WeakRetained, v5);

  }
}

- (void)query:(id)a3 didUpdate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v10[2](v10, 0);
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __46__MGClientService_query_didUpdate_completion___block_invoke;
  v15[3] = &unk_24D726C78;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);
  v12 = v8;
  v13 = v12;
  if (self)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    v26 = 0;
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __41__MGClientService_updateHandlerForQuery___block_invoke;
    v18[3] = &unk_24D726CC8;
    v20 = &v21;
    v18[4] = self;
    v14 = v12;
    v19 = v14;
    -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v18);
    objc_msgSend((id)v22[5], "handler");
    self = (MGClientService *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v21, 8);
    if (self)
      ((void (*)(MGClientService *, id, id, _QWORD))self->_provider)(self, v14, v9, 0);
  }
  else
  {

  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __46__MGClientService_query_didUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "forceSetClientService:", WeakRetained);

}

- (void)connectionProvider:(id)a3 serviceLost:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  MGClientService *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  __int128 buf;
  void (*v22)(uint64_t);
  void *v23;
  MGClientService *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__MGClientService_connectionProvider_serviceLost___block_invoke;
  v12[3] = &unk_24D726CA0;
  v9 = v6;
  v13 = v9;
  v14 = self;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v12);
  if (*((_BYTE *)v18 + 24) && self)
  {
    MGLogForCategory(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_error_impl(&dword_2172B2000, v11, OS_LOG_TYPE_ERROR, "%p lost connection to service", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = v8;
    *((_QWORD *)&buf + 1) = 3221225472;
    v22 = __33__MGClientService_connectionLost__block_invoke;
    v23 = &unk_24D726AE8;
    v24 = self;
    -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, &buf);
    -[MGClientService reconnect]((os_unfair_lock_s *)self);
  }

  _Block_object_dispose(&v17, 8);
}

_QWORD *__50__MGClientService_connectionProvider_serviceLost___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[5];
  if (result[4] == *(_QWORD *)(v1 + 16) && result[6] == *(_QWORD *)(v1 + 24))
    *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = 1;
  return result;
}

- (void)connectionProviderServiceAvailable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MGClientService *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__MGClientService_connectionProviderServiceAvailable___block_invoke;
  v6[3] = &unk_24D726CC8;
  v5 = v4;
  v7 = v5;
  v8 = self;
  v9 = &v10;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v6);
  if (*((_BYTE *)v11 + 24))
    -[MGClientService reconnect]((os_unfair_lock_s *)self);

  _Block_object_dispose(&v10, 8);
}

_QWORD *__54__MGClientService_connectionProviderServiceAvailable___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (result[4] == *(_QWORD *)(result[5] + 16))
  {
    v1 = result;
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;
    MGLogForCategory(2);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v1[5];
      v4 = 134217984;
      v5 = v3;
      _os_log_impl(&dword_2172B2000, v2, OS_LOG_TYPE_DEFAULT, "%p service should be available", (uint8_t *)&v4, 0xCu);
    }

    return (_QWORD *)objc_msgSend((id)v1[5], "setShouldAttemptReconnect:", 1);
  }
  return result;
}

- (MGClientConnectionProviderProtocol)provider
{
  return self->_provider;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)shouldAttemptReconnect
{
  return self->_shouldAttemptReconnect;
}

- (void)setShouldAttemptReconnect:(BOOL)a3
{
  self->_shouldAttemptReconnect = a3;
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
