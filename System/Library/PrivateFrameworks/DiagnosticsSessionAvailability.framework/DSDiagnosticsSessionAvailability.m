@implementation DSDiagnosticsSessionAvailability

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8);
  return (id)sharedInstance_sharedInstance;
}

void __50__DSDiagnosticsSessionAvailability_sharedInstance__block_invoke()
{
  DSDiagnosticsSessionAvailability *v0;
  void *v1;

  v0 = objc_alloc_init(DSDiagnosticsSessionAvailability);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)getSessionStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  DSLogSessionAvailability();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DSDiagnosticsSessionAvailability getSessionStatusWithCompletionHandler:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[DSDiagnosticsSessionAvailability _getSessionStatusWithTicketNumber:timeout:completionHandler:](self, "_getSessionStatusWithTicketNumber:timeout:completionHandler:", 0, 0, v4);
}

- (void)getSessionStatusWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  DSLogSessionAvailability();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DSDiagnosticsSessionAvailability getSessionStatusWithTimeout:completionHandler:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSDiagnosticsSessionAvailability _getSessionStatusWithTicketNumber:timeout:completionHandler:](self, "_getSessionStatusWithTicketNumber:timeout:completionHandler:", 0, v15, v6);

}

- (void)getSessionStatusWithTicketNumber:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a4;
  v7 = a3;
  DSLogSessionAvailability();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DSDiagnosticsSessionAvailability getSessionStatusWithTicketNumber:completionHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  -[DSDiagnosticsSessionAvailability _getSessionStatusWithTicketNumber:timeout:completionHandler:](self, "_getSessionStatusWithTicketNumber:timeout:completionHandler:", v7, 0, v6);
}

- (void)getSessionStatusWithTicketNumber:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  DSLogSessionAvailability();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DSDiagnosticsSessionAvailability getSessionStatusWithTicketNumber:timeout:completionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSDiagnosticsSessionAvailability _getSessionStatusWithTicketNumber:timeout:completionHandler:](self, "_getSessionStatusWithTicketNumber:timeout:completionHandler:", v9, v18, v8);

}

- (void)_getSessionStatusWithTicketNumber:(id)a3 timeout:(id)a4 completionHandler:(id)a5
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
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  DSLogSessionAvailability();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[DSDiagnosticsSessionAvailability _getSessionStatusWithTicketNumber:timeout:completionHandler:]";
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_23A4DC000, v11, OS_LOG_TYPE_DEFAULT, "%s ticketNumber: %@ timeout: %@", buf, 0x20u);
  }

  -[DSDiagnosticsSessionAvailability _setUpXPCConnectionIfNeeded](self, "_setUpXPCConnectionIfNeeded");
  -[DSDiagnosticsSessionAvailability connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke;
  v19[3] = &unk_250B644D0;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_13;
  v17[3] = &unk_250B644F8;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "getSessionStatusWithTicketNumber:timeout:completionHandler:", v8, v9, v17);

}

void __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DSLogSessionAvailability();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  v12 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD1398];
  v16[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsSessionAvailability"), 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v14);

}

void __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  DSLogSessionAvailability();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_23A4DC000, v7, OS_LOG_TYPE_DEFAULT, "Service returned status: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "integerValue"), v6);
}

- (void)openApplicationForSessionStatus:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;

  v6 = (void (**)(id, _QWORD))a4;
  DSLogSessionAvailability();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DSDiagnosticsSessionAvailability openApplicationForSessionStatus:completionHandler:].cold.1(a3, v7);

  if ((unint64_t)(a3 - 1) < 2 || a3 == 4)
  {
    -[DSDiagnosticsSessionAvailability _openDiagnosticsAppWithCompletionHandler:](self, "_openDiagnosticsAppWithCompletionHandler:", v6);
  }
  else if (!a3 && v6)
  {
    v6[2](v6, 0);
  }

}

- (void)_openDiagnosticsAppWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  DSLogSessionAvailability();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[DSDiagnosticsSessionAvailability _openDiagnosticsAppWithCompletionHandler:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE382D8];
  v22[0] = &unk_250B648A0;
  v14 = *MEMORY[0x24BE382F8];
  v21[0] = v13;
  v21[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("diagnostics://"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = *MEMORY[0x24BE38310];
  v22[1] = v15;
  v22[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__DSDiagnosticsSessionAvailability__openDiagnosticsAppWithCompletionHandler___block_invoke;
  v19[3] = &unk_250B64520;
  v20 = v3;
  v18 = v3;
  objc_msgSend(v12, "openApplication:withOptions:completion:", CFSTR("com.apple.Diagnostics"), v17, v19);

}

void __77__DSDiagnosticsSessionAvailability__openDiagnosticsAppWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    DSLogSessionAvailability();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __77__DSDiagnosticsSessionAvailability__openDiagnosticsAppWithCompletionHandler___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD1398];
      v20[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsSessionAvailability"), 2, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v17);

    }
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);
  }

}

- (int64_t)enhancedLoggingStatus
{
  void *v3;
  void *v4;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[DSDiagnosticsSessionAvailability _setUpXPCConnectionIfNeeded](self, "_setUpXPCConnectionIfNeeded");
  -[DSDiagnosticsSessionAvailability connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__DSDiagnosticsSessionAvailability_enhancedLoggingStatus__block_invoke_23;
  v7[3] = &unk_250B64588;
  v7[4] = &v8;
  objc_msgSend(v4, "getEnhancedLoggingStatusWithCompletionHandler:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __57__DSDiagnosticsSessionAvailability_enhancedLoggingStatus__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    DSLogSessionAvailability();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

uint64_t __57__DSDiagnosticsSessionAvailability_enhancedLoggingStatus__block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_setUpXPCConnectionIfNeeded
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23A4DC000, log, OS_LOG_TYPE_DEBUG, "Setting up XPC connection", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DSLogSessionAvailability();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_32()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  DSLogSessionAvailability();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_32_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)getSessionStatusWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A4DC000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getSessionStatusWithTimeout:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A4DC000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getSessionStatusWithTicketNumber:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A4DC000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getSessionStatusWithTicketNumber:(uint64_t)a3 timeout:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A4DC000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __96__DSDiagnosticsSessionAvailability__getSessionStatusWithTicketNumber_timeout_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_23A4DC000, a2, a3, "XPC error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openApplicationForSessionStatus:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[DSDiagnosticsSessionAvailability openApplicationForSessionStatus:completionHandler:]";
  v4 = 2048;
  v5 = a1;
  _os_log_debug_impl(&dword_23A4DC000, a2, OS_LOG_TYPE_DEBUG, "%s sessionStatus: %ld", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_openDiagnosticsAppWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A4DC000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __77__DSDiagnosticsSessionAvailability__openDiagnosticsAppWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_23A4DC000, a2, a3, "Failed to open Diagnostics app: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23A4DC000, a1, a3, "XPC connection interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __63__DSDiagnosticsSessionAvailability__setUpXPCConnectionIfNeeded__block_invoke_32_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23A4DC000, a1, a3, "XPC connection invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
