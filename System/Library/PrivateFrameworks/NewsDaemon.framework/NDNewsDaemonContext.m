@implementation NDNewsDaemonContext

- (NDNewsDaemonContext)init
{
  NDNewsDaemonContext *v2;
  NDNewsServiceConnection *v3;
  NDNewsService *daemon;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NDNewsDaemonContext;
  v2 = -[NDNewsDaemonContext init](&v6, sel_init);
  if (v2)
  {
    v3 = -[NDNewsServiceConnection initWithClient:]([NDNewsServiceConnection alloc], "initWithClient:", v2);
    daemon = v2->_daemon;
    v2->_daemon = (NDNewsService *)v3;

  }
  return v2;
}

- (void)serviceHasNewTodayResults
{
  NSObject *v3;
  _QWORD block[5];

  -[NDNewsDaemonContext _queue](self, "_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NDNewsDaemonContext_serviceHasNewTodayResults__block_invoke;
  block[3] = &unk_1E9BD9D30;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__NDNewsDaemonContext_serviceHasNewTodayResults__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "updateResultsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateResultsHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsDaemonContext fetchModuleDescriptorsWithCompletion:].cold.1();
  -[NDNewsDaemonContext daemon](self, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchModuleDescriptorsWithCompletion:", v4);

}

- (void)fetchLatestResultsWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsDaemonContext fetchLatestResultsWithParameters:completion:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsDaemonContext fetchLatestResultsWithParameters:completion:].cold.1();
LABEL_6:
  -[NDNewsDaemonContext daemon](self, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchLatestResultsWithParameters:completion:", v6, v7);

}

- (void)fetchPlaceholderResultsWithOperationInfo:(id)a3 syncCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsDaemonContext fetchPlaceholderResultsWithOperationInfo:syncCompletion:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsDaemonContext fetchPlaceholderResultsWithOperationInfo:syncCompletion:].cold.1();
LABEL_6:
  -[NDNewsDaemonContext daemon](self, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchPlaceholderResultsWithOperationInfo:syncCompletion:", v6, v7);

}

- (void)setUpdateResultsHandler:(id)a3
{
  void *v4;
  id updateResultsHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  updateResultsHandler = self->_updateResultsHandler;
  self->_updateResultsHandler = v4;

}

- (id)updateResultsHandler
{
  return _Block_copy(self->_updateResultsHandler);
}

- (void)markAnalyticsElements:(id)a3 asSeenAtDate:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsDaemonContext markAnalyticsElements:asSeenAtDate:withCompletion:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsDaemonContext markAnalyticsElements:asSeenAtDate:withCompletion:].cold.1();
LABEL_6:
  -[NDNewsDaemonContext daemon](self, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markAnalyticsElements:asSeenAtDate:withCompletion:", v8, v9, v10);

}

- (void)markAnalyticsElement:(id)a3 asReadAtDate:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsDaemonContext markAnalyticsElement:asReadAtDate:withCompletion:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NDNewsDaemonContext markAnalyticsElement:asReadAtDate:withCompletion:].cold.1();
LABEL_6:
  -[NDNewsDaemonContext daemon](self, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markAnalyticsElement:asReadAtDate:withCompletion:", v8, v9, v10);

}

- (id)_queue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  return v2;
}

- (NDNewsService)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong(&self->_updateResultsHandler, 0);
}

- (void)fetchModuleDescriptorsWithCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchLatestResultsWithParameters:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchLatestResultsWithParameters:completion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"parameters", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPlaceholderResultsWithOperationInfo:syncCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"syncCompletion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchPlaceholderResultsWithOperationInfo:syncCompletion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)markAnalyticsElements:asSeenAtDate:withCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)markAnalyticsElements:asSeenAtDate:withCompletion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElements", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)markAnalyticsElement:asReadAtDate:withCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)markAnalyticsElement:asReadAtDate:withCompletion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7105000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElement", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
