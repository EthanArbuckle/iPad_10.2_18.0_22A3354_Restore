@implementation LACSharedModeDataSourceNullAdapter

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  LACSharedModeDataSourceNullAdapter *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *))a4;
  LACLogSharedMode();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", (uint8_t *)&v9, 0xCu);
  }

  +[LACSharedMode defaultSharedMode](LACSharedMode, "defaultSharedMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogSharedMode();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ feature not supported in this platform %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v5[2](v5, v7);
}

@end
