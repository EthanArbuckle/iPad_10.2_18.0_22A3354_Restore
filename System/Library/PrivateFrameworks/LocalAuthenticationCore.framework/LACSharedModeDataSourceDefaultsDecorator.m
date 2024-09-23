@implementation LACSharedModeDataSourceDefaultsDecorator

- (LACSharedModeDataSourceDefaultsDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4
{
  id v7;
  id v8;
  LACSharedModeDataSourceDefaultsDecorator *v9;
  LACSharedModeDataSourceDefaultsDecorator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACSharedModeDataSourceDefaultsDecorator;
  v9 = -[LACSharedModeDataSourceDefaultsDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_replyQueue, a4);
  }

  return v10;
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  LACSharedMode *v11;
  void *v12;
  double v13;
  double v14;
  dispatch_time_t v15;
  NSObject *replyQueue;
  LACSharedMode *v17;
  _QWORD block[5];
  LACSharedMode *v19;
  id v20;
  uint8_t buf[4];
  LACSharedModeDataSourceDefaultsDecorator *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[LACSharedModeDataSourceDefaultsDecorator _shouldUseMockedResponse](self, "_shouldUseMockedResponse"))
  {
    LACLogSharedMode();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
    }

    +[LACGlobalDomain isSharedModeActive](LACGlobalDomain, "isSharedModeActive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = -[LACSharedMode initWithActive:confirmed:]([LACSharedMode alloc], "initWithActive:confirmed:", v10, 0);
    +[LACGlobalDomain sharedModeLatency](LACGlobalDomain, "sharedModeLatency");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__LACSharedModeDataSourceDefaultsDecorator_fetchSharedModeWithOptions_completion___block_invoke;
    block[3] = &unk_2510C0AC0;
    block[4] = self;
    v19 = v11;
    v20 = v7;
    v17 = v11;
    dispatch_after(v15, replyQueue, block);

  }
  else
  {
    -[LACSharedModeDataSource fetchSharedModeWithOptions:completion:](self->_dataSource, "fetchSharedModeWithOptions:completion:", v6, v7);
  }

}

uint64_t __82__LACSharedModeDataSourceDefaultsDecorator_fetchSharedModeWithOptions_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  LACLogSharedMode();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_2409DC000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (BOOL)_shouldUseMockedResponse
{
  void *v2;
  BOOL v3;

  if (!+[LACGlobalDomain osVariantAllowsDomainOverrides](LACGlobalDomain, "osVariantAllowsDomainOverrides"))return 0;
  +[LACGlobalDomain isSharedModeActive](LACGlobalDomain, "isSharedModeActive");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
