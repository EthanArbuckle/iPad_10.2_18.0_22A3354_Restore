@implementation CSSearchConnection

void __34__CSSearchConnection_handleReply___block_invoke()
{
  id v0;
  id v1;
  id v2;
  NSObject *v3;

  v0 = (id)objc_opt_self();
  v1 = (id)objc_opt_self();
  v2 = (id)objc_opt_self();
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __34__CSSearchConnection_handleReply___block_invoke_cold_1();

}

- (void)startQuery:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "queryString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "queryID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchConnection setQuery:forID:](self, "setQuery:forID:", v6, v10);

  objc_msgSend(v7, "setQos:", qos_class_self());
  -[CSSearchConnection createXPCDictionaryForQuery:queryID:queryContext:needsInitialization:](self, "createXPCDictionaryForQuery:queryID:queryContext:needsInitialization:", v8, v9, v7, -[CSXPCConnection previouslyInitialized](self, "previouslyInitialized") ^ 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryQuery();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "debugDescriptionWithQueryString:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v19 = v9;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_18C42F000, v12, OS_LOG_TYPE_DEFAULT, "qid=%ld - Starting %@", buf, 0x16u);

  }
  logForCSLogCategoryQuery();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "debugDescriptionWithQueryString:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v19 = v9;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_18C42F000, v14, OS_LOG_TYPE_INFO, "qid=%ld - %@", buf, 0x16u);

  }
  logForCSLogCategoryQuery();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[CSSearchConnection startQuery:context:].cold.1(v6, v9, v16);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__CSSearchConnection_startQuery_context___block_invoke;
  v17[3] = &unk_1E2404B90;
  v17[4] = self;
  v17[5] = v9;
  -[CSSearchConnection sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v11, v17);

}

- (void)setQuery:(id)a3 forID:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self->_queries;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queries, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);

}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __50__CSSearchConnection_sendMessageAsync_completion___block_invoke;
  v8[3] = &unk_1E2401FB8;
  v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)CSSearchConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v6 = v9;
  -[CSXPCConnection sendMessageAsync:completion:](&v7, sel_sendMessageAsync_completion_, a3, v8);

}

- (id)createXPCDictionaryForQuery:(id)a3 queryID:(int64_t)a4 queryContext:(id)a5 needsInitialization:(BOOL)a6
{
  id v8;
  id v9;
  xpc_object_t v10;
  id v11;
  const char *v12;
  void *v13;

  v8 = a5;
  v9 = a3;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "command-type", "search-type");
  xpc_dictionary_set_string(v10, "command", "startQuery");
  v11 = objc_retainAutorelease(v9);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  if (v12)
    xpc_dictionary_set_string(v10, "query", v12);
  xpc_dictionary_set_uint64(v10, "qid", a4);
  objc_msgSend(v8, "xpc_dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_value(v10, "context", v13);
  return v10;
}

+ (id)sharedSearchConnection
{
  if (onceTokenShared != -1)
    dispatch_once(&onceTokenShared, &__block_literal_global_1175);
  return (id)sCSSearchConnection;
}

- (void)handleReply:(id)a3
{
  id v4;
  uint64_t uint64;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *string;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _xpc_connection_s *v21;
  xpc_object_t reply;
  void *v23;
  int64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "qid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", uint64);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchConnection queryForID:](self, "queryForID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryQuery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CSSearchConnection handleReply:].cold.2();

  if (v7)
  {
    v9 = xpc_dictionary_get_uint64(v4, "t");
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "rd", "rdl", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "od", "odl", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    string = xpc_dictionary_get_string(v4, "pc");
    v13 = (uint64_t)string;
    if (string && !strncmp(string, "Priority", 9uLL) && (hasInternalCSEntitlement() & 1) == 0)
      v13 = objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "UTF8String");
    if (v9 == 2)
    {
      logForCSLogCategoryQuery();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[CSSearchConnection handleReply:].cold.1();
    }
    else
    {
      if (v9 != 1 || (objc_msgSend(v7, "live") & 1) != 0)
      {
LABEL_15:
        objc_msgSend(v10, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "data");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __34__CSSearchConnection_handleReply___block_invoke;
        v25[3] = &unk_1E2404948;
        v26 = v10;
        v27 = v11;
        v28 = v4;
        v29 = uint64;
        v19 = v11;
        v20 = v10;
        objc_msgSend(v7, "didReturnResults:resultsData:oidData:protectionClass:completionHandler:", v9, v16, v17, v18, v25);
        if (v13)

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", uint64);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = -[CSSearchConnection removeQueryForID:](self, "removeQueryForID:", v14);
    }

    goto LABEL_15;
  }
LABEL_21:
  xpc_dictionary_get_remote_connection(v4);
  v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v23 = reply;
  if (v21 && reply)
  {
    if (v7)
      v24 = 0;
    else
      v24 = -1;
    xpc_dictionary_set_int64(reply, "status", v24);
    xpc_connection_send_message(v21, v23);
  }

}

- (id)queryForID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_queries;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queries, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)removeQueryForID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_queries;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queries, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableDictionary removeObjectForKey:](self->_queries, "removeObjectForKey:", v4);
  objc_sync_exit(v5);

  return v6;
}

void __44__CSSearchConnection_sharedSearchConnection__block_invoke()
{
  CSSearchConnection *v0;
  void *v1;

  v0 = objc_alloc_init(CSSearchConnection);
  v1 = (void *)sCSSearchConnection;
  sCSSearchConnection = (uint64_t)v0;

}

- (CSSearchConnection)init
{
  return -[CSSearchConnection initWithMachServiceName:](self, "initWithMachServiceName:", sConnectionName_0);
}

- (CSSearchConnection)initWithMachServiceName:(id)a3
{
  CSSearchConnection *v3;
  uint64_t v4;
  NSMutableDictionary *queries;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSSearchConnection;
  v3 = -[CSXPCConnection initWithMachServiceName:](&v7, sel_initWithMachServiceName_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    queries = v3->_queries;
    v3->_queries = (NSMutableDictionary *)v4;

  }
  return v3;
}

uint64_t __50__CSSearchConnection_sendMessageAsync_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __41__CSSearchConnection_startQuery_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  csquery_xpc_dictionary_decode_status_with_error(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 134218498;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_18C42F000, v5, OS_LOG_TYPE_ERROR, "### qid=%ld error %@ reply:%@", (uint8_t *)&v11, 0x20u);
    }

    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeQueryForID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "didFinishWithError:", v4);
  }
  logForCSLogCategoryQuery();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __41__CSSearchConnection_startQuery_context___block_invoke_cold_1();

}

+ (id)sharedCSUserFSConnection
{
  if (sharedCSUserFSConnection_onceToken != -1)
    dispatch_once(&sharedCSUserFSConnection_onceToken, &__block_literal_global_1176);
  return (id)sCSUserFSConnection;
}

void __46__CSSearchConnection_sharedCSUserFSConnection__block_invoke()
{
  CSSearchConnection *v0;
  void *v1;

  v0 = -[CSSearchConnection initWithMachServiceName:]([CSSearchConnection alloc], "initWithMachServiceName:", CFSTR("com.apple.spotlight.userfs"));
  v1 = (void *)sCSUserFSConnection;
  sCSUserFSConnection = (uint64_t)v0;

}

- (void)handleError:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSSearchConnection;
  -[CSXPCConnection handleError:](&v16, sel_handleError_, v4);
  v5 = self->_queries;
  objc_sync_enter(v5);
  -[NSMutableDictionary allValues](self->_queries, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_queries, "removeAllObjects");
  objc_sync_exit(v5);

  if (objc_msgSend(v6, "count"))
  {
    if (v4 == (id)MEMORY[0x1E0C81258])
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
    else
      +[CSSearchQuery _makeQueryErrorWithErrorCode:description:underlyingError:](CSSearchQuery, "_makeQueryErrorWithErrorCode:description:underlyingError:", -2001, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "handleError:", v7, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)preheat:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command-type", "search-type");
  xpc_dictionary_set_string(v5, "command", "preheat");
  if (v4)
  {
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v5, v4, "pcs");
    logForCSLogCategoryQuery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      v7 = "issue preheat %@";
      v8 = v6;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    logForCSLogCategoryQuery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      v7 = "issue preheat";
      v8 = v6;
      v9 = 2;
      goto LABEL_6;
    }
  }

  -[CSXPCConnection sendMessageAsync:](self, "sendMessageAsync:", v5);
}

- (void)cancelQuery:(unint64_t)a3
{
  xpc_object_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command-type", "search-type");
  xpc_dictionary_set_string(v5, "command", "cancelQuery");
  xpc_dictionary_set_uint64(v5, "qid", a3);
  logForCSLogCategoryQuery();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEFAULT, "qid=%ld - Canceling", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CSSearchConnection_cancelQuery___block_invoke;
  v7[3] = &unk_1E2404B90;
  v7[4] = self;
  v7[5] = a3;
  -[CSSearchConnection sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v5, v7);

}

void __34__CSSearchConnection_cancelQuery___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;

  csquery_xpc_dictionary_decode_status_with_error(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __34__CSSearchConnection_cancelQuery___block_invoke_cold_1();

  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "removeQueryForID:", v6);

}

- (NSMutableDictionary)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
  objc_storeStrong((id *)&self->_queries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
}

- (void)handleReply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_2_2(&dword_18C42F000, v0, v1, "[QoS] %u qid=%ld - gather ended", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleReply:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_2_2(&dword_18C42F000, v0, v1, "[QoS] %u qid=%ld - handleReply", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __34__CSSearchConnection_handleReply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_2_2(&dword_18C42F000, v0, v1, "[QoS] %u qid=%ld didReturnResults", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)startQuery:(NSObject *)a3 context:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  qos_class_t v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = qos_class_self();
  objc_msgSend(a1, "debugDescriptionWithQueryString:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109634;
  v8[1] = v6;
  v9 = 2048;
  v10 = a2;
  v11 = 2112;
  v12 = v7;
  _os_log_debug_impl(&dword_18C42F000, a3, OS_LOG_TYPE_DEBUG, "[QoS] %u qid=%ld - Starting %@", (uint8_t *)v8, 0x1Cu);

}

void __41__CSSearchConnection_startQuery_context___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_2_2(&dword_18C42F000, v0, v1, "[QoS] %u qid=%ld sendMessageAsync response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __34__CSSearchConnection_cancelQuery___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_8_0(&dword_18C42F000, v0, v1, "### cancel qid=%ld error %@");
  OUTLINED_FUNCTION_1();
}

@end
