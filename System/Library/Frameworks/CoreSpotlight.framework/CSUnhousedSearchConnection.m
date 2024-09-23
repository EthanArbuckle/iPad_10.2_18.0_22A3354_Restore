@implementation CSUnhousedSearchConnection

+ (id)connectionWithToken:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __50__CSUnhousedSearchConnection_connectionWithToken___block_invoke;
  v15 = &unk_1E24019B8;
  v6 = v5;
  v16 = v6;
  v17 = a1;
  if (connectionWithToken__onceToken != -1)
    dispatch_once(&connectionWithToken__onceToken, &v12);
  v7 = (id)connectionWithToken__currentToken;
  objc_sync_enter(v7);
  if ((objc_msgSend(v6, "isEqualToString:", connectionWithToken__currentToken, v12, v13, v14, v15) & 1) == 0)
  {
    objc_storeStrong((id *)&connectionWithToken__currentToken, a3);
    v8 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithToken:", v6);
    v9 = (void *)connectionWithToken__connection;
    connectionWithToken__connection = v8;

  }
  objc_sync_exit(v7);

  v10 = (id)connectionWithToken__connection;
  return v10;
}

void __50__CSUnhousedSearchConnection_connectionWithToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)&connectionWithToken__currentToken, *(id *)(a1 + 32));
  v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithToken:", *(_QWORD *)(a1 + 32));
  v3 = (void *)connectionWithToken__connection;
  connectionWithToken__connection = v2;

}

- (id)uuidForToken:(id)a3
{
  return 0;
}

- (id)defaultIndexPath:(id)a3
{
  return 0;
}

- (id)serviceName
{
  return 0;
}

- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5
{
  return a3;
}

- (CSUnhousedSearchConnection)initWithToken:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  CSUnhousedSearchConnection *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSUnhousedSearchConnection uuidForToken:](self, "uuidForToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEFAULT, "CSUnhousedSearchConnection uuid: %@", buf, 0xCu);
  }

  -[CSUnhousedSearchConnection serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CSUnhousedSearchConnection;
  v8 = -[CSXPCConnection initWithServiceName:machService:uuid:](&v11, sel_initWithServiceName_machService_uuid_, v7, 1, v5);

  if (v8)
  {
    v9 = (void *)objc_opt_new();
    -[CSSearchConnection setQueries:](v8, "setQueries:", v9);

    -[CSUnhousedSearchConnection setToken:](v8, "setToken:", v4);
  }

  return v8;
}

- (id)createXPCDictionaryForQuery:(id)a3 queryID:(int64_t)a4 queryContext:(id)a5 needsInitialization:(BOOL)a6
{
  _BOOL4 v6;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  CSUnhousedSearchConnection *v23;
  id v24;
  objc_super v25;

  v6 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CSUnhousedSearchConnection;
  -[CSSearchConnection createXPCDictionaryForQuery:queryID:queryContext:needsInitialization:](&v25, sel_createXPCDictionaryForQuery_queryID_queryContext_needsInitialization_, a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __99__CSUnhousedSearchConnection_createXPCDictionaryForQuery_queryID_queryContext_needsInitialization___block_invoke;
  v22 = &unk_1E24013B8;
  v23 = self;
  v9 = v8;
  v24 = v9;
  if (createXPCDictionaryForQuery_queryID_queryContext_needsInitialization__onceToken == -1)
  {
    if (!v6)
      goto LABEL_6;
  }
  else
  {
    dispatch_once(&createXPCDictionaryForQuery_queryID_queryContext_needsInitialization__onceToken, &v19);
    if (!v6)
      goto LABEL_6;
  }
  -[CSUnhousedSearchConnection token](self, "token", v19, v20, v21, v22, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSUnhousedSearchConnection defaultIndexPath:](self, "defaultIndexPath:", v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "UTF8String");
  if (v12)
  {
    v13 = v12;
    -[CSXPCConnection connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSUnhousedSearchConnection addExtensionToken:indexPath:connection:](self, "addExtensionToken:indexPath:connection:", v9, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v15;
  }

LABEL_6:
  v16 = v24;
  v17 = v9;

  return v17;
}

void __99__CSUnhousedSearchConnection_createXPCDictionaryForQuery_queryID_queryContext_needsInitialization___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (hasInternalCSEntitlement())
  {
    objc_msgSend(*(id *)(a1 + 32), "token");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "token");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v3, "private-bundle-override", (const char *)objc_msgSend(v4, "UTF8String"));

    }
  }
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  objc_super v8;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (xpc_dictionary_get_int64(v6, "ee"))
  {
    v7[2](v7, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSUnhousedSearchConnection;
    -[CSSearchConnection sendMessageAsync:completion:](&v8, sel_sendMessageAsync_completion_, v6, v7);
  }

}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
