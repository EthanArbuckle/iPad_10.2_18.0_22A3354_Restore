@implementation LACSharedModeDataSourceMSAdapter

- (LACSharedModeDataSourceMSAdapter)initWithReplyQueue:(id)a3
{
  id v5;
  LACSharedModeDataSourceMSAdapter *v6;
  LACSharedModeDataSourceMSAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACSharedModeDataSourceMSAdapter;
  v6 = -[LACSharedModeDataSourceMSAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_replyQueue, a3);

  return v7;
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  BOOL v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;

  v5 = (void (**)(id, void *))a4;
  v6 = -[LACSharedModeDataSourceMSAdapter _isManagedSettingsFrameworkAvailable](self, "_isManagedSettingsFrameworkAvailable");
  +[LACSharedMode defaultSharedMode](LACSharedMode, "defaultSharedMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogSharedMode();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v9)
      goto LABEL_5;
  }
  else if (v9)
  {
LABEL_5:
    -[LACSharedModeDataSourceMSAdapter fetchSharedModeWithOptions:completion:].cold.1();
  }

  v5[2](v5, v7);
}

- (BOOL)_isManagedSettingsFrameworkAvailable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

- (void)fetchSharedModeWithOptions:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2409DC000, v0, v1, "%{public}@ Unable to determine shared mode status due to missing dependencies %{public}@");
}

@end
