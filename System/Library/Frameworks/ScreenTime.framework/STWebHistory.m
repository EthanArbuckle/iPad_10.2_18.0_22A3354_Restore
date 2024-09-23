@implementation STWebHistory

- (STWebHistory)initWithBundleIdentifier:(id)a3
{
  id v3;
  STWebHistory *v4;
  uint64_t v5;
  NSString *bundleIdentifier;
  NSXPCConnection *v7;
  NSXPCConnection *xpcConnection;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STWebHistory;
  v3 = a3;
  v4 = -[STWebHistory init](&v10, sel_init);
  v5 = objc_msgSend(v3, "copy", v10.receiver, v10.super_class);

  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = (NSString *)v5;

  v7 = +[STScreenTimeAgentConnection newConnection](STScreenTimeAgentConnection, "newConnection");
  xpcConnection = v4->_xpcConnection;
  v4->_xpcConnection = v7;

  -[NSXPCConnection resume](v4->_xpcConnection, "resume");
  return v4;
}

- (STWebHistory)initWithBundleIdentifier:(NSString *)bundleIdentifier error:(NSError *)error
{
  NSString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = bundleIdentifier;
  +[STWebService clientBundleIdentifier](STWebService, "clientBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](v6, "isEqualToString:", v7)
    || (objc_msgSend(MEMORY[0x24BE15820], "supportedWebBrowserBundleIdentifiersForDeviceFamily:", 102),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", v7),
        v8,
        v9))
  {
    error = -[STWebHistory initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v6);
  }
  else
  {

    if (error)
    {
      +[STScreenTimeBundle bundle](STScreenTimeBundle, "bundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UnsupportedWebBrowserError"), &stru_24D996F80, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BE84710];
      v16 = *MEMORY[0x24BDD0FC8];
      v17[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 100, v15);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

      error = 0;
    }
  }

  return (STWebHistory *)error;
}

- (STWebHistory)init
{
  void *v3;
  STWebHistory *v4;

  +[STWebService clientBundleIdentifier](STWebService, "clientBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STWebHistory initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v3);

  return v4;
}

- (void)deleteHistoryForURL:(NSURL *)url
{
  NSURL *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  NSURL *v18;
  STWebHistory *v19;
  _QWORD v20[4];
  NSURL *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = url;
  if (_os_feature_enabled_impl())
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    v28 = 0;
    -[STWebHistory xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __36__STWebHistory_deleteHistoryForURL___block_invoke;
    v22[3] = &unk_24D996C60;
    v22[4] = &v23;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[STWebHistory bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STWebService clientBundleURL](STWebService, "clientBundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:", v9, 1);
    }
    else
    {
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        +[STWebService clientBundleIdentifier](STWebService, "clientBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[STWebHistory deleteHistoryForURL:].cold.2(v15, (uint64_t)v29, v16);
      }

      v10 = 0;
    }

    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __36__STWebHistory_deleteHistoryForURL___block_invoke_2;
    v20[3] = &unk_24D996CE0;
    v21 = v4;
    objc_msgSend(v7, "deleteWebHistoryForURL:webApplication:clientBundleURLWrapper:replyHandler:", v21, v8, v10, v20);

    if (v24[5] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[STWebHistory deleteHistoryForURL:].cold.1();

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BE84698];
    -[STWebHistory xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __36__STWebHistory_deleteHistoryForURL___block_invoke_12;
    v17[3] = &unk_24D996D30;
    v18 = v4;
    v19 = self;
    objc_msgSend(v11, "proxyFromConnection:proxyHandler:", v12, v17);

  }
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __36__STWebHistory_deleteHistoryForURL___block_invoke_2_cold_1();

}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int8x16_t v12;
  _QWORD v13[4];
  int8x16_t v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STWebService clientBundleURL](STWebService, "clientBundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:", v9, 1);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __36__STWebHistory_deleteHistoryForURL___block_invoke_12_cold_2();
      v10 = 0;
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __36__STWebHistory_deleteHistoryForURL___block_invoke_2_13;
    v13[3] = &unk_24D996D08;
    v12 = *(int8x16_t *)(a1 + 32);
    v11 = (id)v12.i64[0];
    v14 = vextq_s8(v12, v12, 8uLL);
    objc_msgSend(v5, "deleteWebHistoryForURL:webApplication:clientBundleURLWrapper:replyHandler:", v7, v8, v10, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __36__STWebHistory_deleteHistoryForURL___block_invoke_12_cold_1();
  }

}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_2_13(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __36__STWebHistory_deleteHistoryForURL___block_invoke_2_13_cold_1();

}

- (void)deleteHistoryDuringInterval:(NSDateInterval *)interval
{
  NSDateInterval *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  NSDateInterval *v18;
  STWebHistory *v19;
  _QWORD v20[4];
  NSDateInterval *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = interval;
  if (_os_feature_enabled_impl())
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    v28 = 0;
    -[STWebHistory xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __44__STWebHistory_deleteHistoryDuringInterval___block_invoke;
    v22[3] = &unk_24D996C60;
    v22[4] = &v23;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[STWebHistory bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STWebService clientBundleURL](STWebService, "clientBundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:", v9, 1);
    }
    else
    {
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        +[STWebService clientBundleIdentifier](STWebService, "clientBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[STWebHistory deleteHistoryForURL:].cold.2(v15, (uint64_t)v29, v16);
      }

      v10 = 0;
    }

    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2;
    v20[3] = &unk_24D996CE0;
    v21 = v4;
    objc_msgSend(v7, "deleteWebHistoryDuringInterval:webApplication:clientBundleURLWrapper:replyHandler:", v21, v8, v10, v20);

    if (v24[5] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[STWebHistory deleteHistoryForURL:].cold.1();

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BE84698];
    -[STWebHistory xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_15;
    v17[3] = &unk_24D996D30;
    v18 = v4;
    v19 = self;
    objc_msgSend(v11, "proxyFromConnection:proxyHandler:", v12, v17);

  }
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_cold_1();

}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int8x16_t v12;
  _QWORD v13[4];
  int8x16_t v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STWebService clientBundleURL](STWebService, "clientBundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:", v9, 1);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __36__STWebHistory_deleteHistoryForURL___block_invoke_12_cold_2();
      v10 = 0;
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_16;
    v13[3] = &unk_24D996D08;
    v12 = *(int8x16_t *)(a1 + 32);
    v11 = (id)v12.i64[0];
    v14 = vextq_s8(v12, v12, 8uLL);
    objc_msgSend(v5, "deleteWebHistoryDuringInterval:webApplication:clientBundleURLWrapper:replyHandler:", v7, v8, v10, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __36__STWebHistory_deleteHistoryForURL___block_invoke_12_cold_1();
  }

}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_16(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_16_cold_1();

}

- (void)deleteAllHistory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    v21 = 0;
    -[STWebHistory xpcConnection](self, "xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __32__STWebHistory_deleteAllHistory__block_invoke;
    v15[3] = &unk_24D996C60;
    v15[4] = &v16;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[STWebHistory bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[STWebService clientBundleURL](STWebService, "clientBundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:", v6, 1);
    }
    else
    {
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        +[STWebService clientBundleIdentifier](STWebService, "clientBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[STWebHistory deleteHistoryForURL:].cold.2(v12, (uint64_t)v22, v13);
      }

      v7 = 0;
    }

    objc_msgSend(v4, "deleteAllWebApplicationHistory:clientBundleURLWrapper:replyHandler:", v5, v7, &__block_literal_global);
    if (v17[5])
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[STWebHistory deleteHistoryForURL:].cold.1();
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BE84698];
    -[STWebHistory xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __32__STWebHistory_deleteAllHistory__block_invoke_17;
    v14[3] = &unk_24D996CB0;
    v14[4] = self;
    objc_msgSend(v8, "proxyFromConnection:proxyHandler:", v9, v14);

  }
}

void __32__STWebHistory_deleteAllHistory__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __32__STWebHistory_deleteAllHistory__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __32__STWebHistory_deleteAllHistory__block_invoke_2_cold_1();

}

void __32__STWebHistory_deleteAllHistory__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[STWebService clientBundleURL](STWebService, "clientBundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:", v8, 1);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __36__STWebHistory_deleteHistoryForURL___block_invoke_12_cold_2();
      v9 = 0;
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __32__STWebHistory_deleteAllHistory__block_invoke_2_18;
    v10[3] = &unk_24D996CE0;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "deleteAllWebApplicationHistory:clientBundleURLWrapper:replyHandler:", v7, v9, v10);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __36__STWebHistory_deleteHistoryForURL___block_invoke_12_cold_1();
  }

}

void __32__STWebHistory_deleteAllHistory__block_invoke_2_18(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __32__STWebHistory_deleteAllHistory__block_invoke_2_18_cold_1();

}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)deleteHistoryForURL:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to fetch ScreenTime Agent proxy: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)deleteHistoryForURL:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_0(&dword_218A7F000, MEMORY[0x24BDACB70], a3, "Could not find client bundle URL. Starting to delete web history without granting ScreenTimeAgent access to the client application. %{public}@ will only be able to delete untrusted web history.", (uint8_t *)a2);

  OUTLINED_FUNCTION_8();
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to delete history for %@ with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_12_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to create proxy: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_12_cold_2()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  +[STWebService clientBundleIdentifier](STWebService, "clientBundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_218A7F000, MEMORY[0x24BDACB70], v1, "Could not find client bundle URL. Starting to delete web history without granting ScreenTimeAgent access to the client application. %{public}@ will only be able to delete untrusted web history.", v2);

  OUTLINED_FUNCTION_6();
}

void __36__STWebHistory_deleteHistoryForURL___block_invoke_2_13_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to delete history for %@ with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to delete history during %@ with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __44__STWebHistory_deleteHistoryDuringInterval___block_invoke_2_16_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to delete history during %@ with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __32__STWebHistory_deleteAllHistory__block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to delete all web history with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __32__STWebHistory_deleteAllHistory__block_invoke_2_18_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to delete all web history: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
