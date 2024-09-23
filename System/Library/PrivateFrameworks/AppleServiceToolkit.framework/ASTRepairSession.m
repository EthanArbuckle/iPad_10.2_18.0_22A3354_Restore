@implementation ASTRepairSession

- (ASTRepairSession)init
{
  ASTRepairSession *v2;
  ASTRepairSessionProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASTRepairSession;
  v2 = -[ASTRepairSession init](&v6, sel_init);
  if (v2)
  {
    v3 = -[ASTRepairSessionProvider initWithServiceName:]([ASTRepairSessionProvider alloc], "initWithServiceName:", CFSTR("com.apple.corerepair.diagnostics-controller"));
    v4 = (void *)provider;
    provider = (uint64_t)v3;

    objc_msgSend((id)provider, "setDelegate:", v2);
  }
  return v2;
}

- (ASTRepairSession)initWithDelegate:(id)a3
{
  id v4;
  ASTRepairSession *v5;
  ASTRepairSession *v6;

  v4 = a3;
  v5 = -[ASTRepairSession init](self, "init");
  v6 = v5;
  if (v5)
    -[ASTSession setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (BOOL)shouldShowResults
{
  return 0;
}

- (BOOL)sendTestResult:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  BOOL v11;
  _QWORD v13[4];
  dispatch_semaphore_t v14;
  id *v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ASTLogHandleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ASTRepairSession sendTestResult:error:]";
    _os_log_impl(&dword_22D91B000, v6, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", buf, 0xCu);
  }

  v7 = dispatch_semaphore_create(0);
  v8 = (void *)provider;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__ASTRepairSession_sendTestResult_error___block_invoke;
  v13[3] = &unk_24F96A280;
  v14 = v7;
  v15 = a4;
  v9 = v7;
  objc_msgSend(v8, "sendTestResult:withCompletion:", v5, v13);

  v10 = dispatch_time(0, 5000000000);
  v11 = dispatch_semaphore_wait(v9, v10) == 0;

  return v11;
}

intptr_t __41__ASTRepairSession_sendTestResult_error___block_invoke(uint64_t a1, id a2)
{
  if (a2)
    **(_QWORD **)(a1 + 40) = objc_retainAutorelease(a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)downloadAsset:(id)a3 fileHandle:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!provider)
  {
    ASTLogHandleForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ASTRepairSession downloadAsset:fileHandle:completionHandler:].cold.1(v12);

    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = -1007;
    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "isOpenForUpdating") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = -3000;
LABEL_11:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), v14, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v19 = 0;
  objc_msgSend(v8, "truncateAtOffset:error:", 0, &v19);
  v10 = v19;
  if (!v10)
  {
    v15 = (void *)provider;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke;
    v16[3] = &unk_24F96A2A8;
    v18 = v9;
    v17 = v8;
    objc_msgSend(v15, "requestAsset:withCompletion:", v7, v16);

    goto LABEL_13;
  }
  ASTLogHandleForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[ASTRepairSession downloadAsset:fileHandle:completionHandler:].cold.2(v10, v11);

LABEL_12:
  (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v10);
LABEL_13:

}

void __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, _QWORD);
  id v16;
  id v17;

  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    ASTLogHandleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke_cold_2((uint64_t)v6, v12, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v17 = 0;
    objc_msgSend(v7, "writeData:error:", a2, &v17);
    v8 = v17;
    if (v17)
    {
      v17;
      ASTLogHandleForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke_cold_1(v9, v10, v11);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void (**)(uint64_t, uint64_t, _QWORD))(v14 + 16);
      v16 = 0;
      v15(v14, 1, 0);
    }

  }
}

- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  ASTLogHandleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ASTRepairSession requestSuiteSummary:completionHandler:]";
    _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend((id)provider, "requestSuiteResult:withCompletion:", v6, v5);
}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  ASTLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ASTRepairSession requestSuitesAvailableWithCompletionHandler:]";
    _os_log_impl(&dword_22D91B000, v4, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend((id)provider, "requestSuitesAvailableWithCompletionHandler:", v3);
}

- (void)start
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] Starting...", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__ASTRepairSession_start__block_invoke;
  v4[3] = &unk_24F96A2D0;
  v4[4] = self;
  objc_msgSend((id)provider, "establishConnectionWithCompletionHandler:", v4);
}

void __25__ASTRepairSession_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    ASTLogHandleForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_22D91B000, v4, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] Unable to establish the connection: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "session:didEndWithError:", *(_QWORD *)(a1 + 32), v3);

  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __25__ASTRepairSession_start__block_invoke_14;
    v6[3] = &unk_24F96A2D0;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend((id)provider, "startWithCompletionHandler:", v6);
  }

}

void __25__ASTRepairSession_start__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    ASTLogHandleForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_22D91B000, v4, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] Unable to start the connection: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "session:didEndWithError:", *(_QWORD *)(a1 + 32), v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionDidStart:", *(_QWORD *)(a1 + 32));
  }

}

- (void)end
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[ASTRepairSession end]";
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __23__ASTRepairSession_end__block_invoke;
  v4[3] = &unk_24F96A2D0;
  v4[4] = self;
  objc_msgSend((id)provider, "endWithCompletionHandler:", v4);
}

void __23__ASTRepairSession_end__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session:didEndWithError:", *(_QWORD *)(a1 + 32), v4);

}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  ASTLogHandleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ASTRepairSession requestSuiteStart:completionHandler:]";
    _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend((id)provider, "requestSuiteStart:withCompletionHandler:", v6, v5);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[ASTRepairSession connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASTRepairSession connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[ASTRepairSession connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[ASTRepairSession setConnection:](self, "setConnection:", 0);
  }
  -[ASTSession setDelegate:](self, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)ASTRepairSession;
  -[ASTSession dealloc](&v6, sel_dealloc);
}

- (void)cancelSuite
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ASTRepairSession cancelSuite]";
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v7, 0xCu);
  }

  -[ASTSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionDidCancelSuite:", self);

  }
}

- (void)startTest:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[ASTRepairSession startTest:parameters:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, testId: %@, parameters: %@", (uint8_t *)&v13, 0x20u);
  }

  -[ASTSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    +[ASTTestResult resultWithTestId:parameters:](ASTTestResult, "resultWithTestId:parameters:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTSession delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "session:startTest:parameters:testResult:", self, v6, v7, v11);

  }
}

- (void)progressForTest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[ASTRepairSession progressForTest:completion:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, testId: %@", (uint8_t *)&v13, 0x16u);
  }

  -[ASTSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "session:progressForTest:", self, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
  v7[2](v7, 0);

}

- (void)estimatedTimeRemainingForTest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[ASTRepairSession estimatedTimeRemainingForTest:completion:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, testId: %@", (uint8_t *)&v13, 0x16u);
  }

  -[ASTSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "session:estimatedTimeRemainingForTest:", self, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
  v7[2](v7, 0);

}

- (void)updateTestSuiteProgress:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ASTRepairSession updateTestSuiteProgress:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, progress: %@", (uint8_t *)&v9, 0x16u);
  }

  -[ASTSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session:didUpdateTestSuiteProgress:", self, v4);

  }
}

- (void)completeTestSuite:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[ASTRepairSession completeTestSuite:description:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s, suiteName: %@", (uint8_t *)&v12, 0x16u);
  }

  -[ASTSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "session:didCompleteTestSuite:description:", self, v6, v7);

  }
}

- (void)updateTestSuiteImage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[ASTRepairSession updateTestSuiteImage:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v9, 0xCu);
  }

  -[ASTSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session:didUpdateTestSuiteImage:", self, v4);

  }
}

- (void)showInstructionalPrompt:(id)a3 withConfirmation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[ASTRepairSession showInstructionalPrompt:withConfirmation:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTRepairSession] %s", (uint8_t *)&v12, 0xCu);
  }

  -[ASTSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "session:didRequestInstructionalPrompt:withConfirmation:", self, v6, v7);

  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)repairAliveCheckQueue
{
  return self->_repairAliveCheckQueue;
}

- (void)setRepairAliveCheckQueue:(id)a3
{
  objc_storeStrong((id *)&self->_repairAliveCheckQueue, a3);
}

- (ASTRepairProtocol)remoteRepairServer
{
  return (ASTRepairProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRemoteRepairServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSSet)suitesAvailable
{
  return self->_suitesAvailable;
}

- (void)setSuitesAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_suitesAvailable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suitesAvailable, 0);
  objc_storeStrong((id *)&self->_remoteRepairServer, 0);
  objc_storeStrong((id *)&self->_repairAliveCheckQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)downloadAsset:(os_log_t)log fileHandle:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D91B000, log, OS_LOG_TYPE_ERROR, "Provider is nil, make sure to establish a session.", v1, 2u);
}

+ (void)downloadAsset:(void *)a1 fileHandle:(NSObject *)a2 completionHandler:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_22D91B000, a2, v4, "Error occurred trying to truncate file: %@", (uint8_t *)&v5);

}

void __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_0_0(&dword_22D91B000, a1, a3, "[ASTRepairSession] Unable to write data: %@", (uint8_t *)&v3);
}

void __63__ASTRepairSession_downloadAsset_fileHandle_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22D91B000, a2, a3, "[ASTRepairSession] Unable to retrieve the asset: %@", (uint8_t *)&v3);
}

@end
