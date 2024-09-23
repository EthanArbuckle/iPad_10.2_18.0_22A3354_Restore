@implementation LNFrameworkConnection

- (void)connectWithOptions:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)LNFrameworkConnection;
  -[LNConnection connectWithOptions:](&v6, sel_connectWithOptions_, a3);
  LNConnectionErrorWithCode(1001);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_ERROR, "Unable to get remoteObjectProxyWithErrorHandler, error: %{public}@", buf, 0xCu);
  }

  -[LNConnection setDisconnectedWithError:](self, "setDisconnectedWithError:", v4);
}

- (BOOL)refreshWithOptions:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)LNFrameworkConnection;
  if (-[LNConnection refreshWithOptions:](&v7, sel_refreshWithOptions_, a3))
  {
    LNConnectionErrorWithCode(1001);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getLNLogCategoryConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_ERROR, "Unable to get remoteObjectProxyWithErrorHandler, error: %{public}@", buf, 0xCu);
    }

    -[LNConnection setDisconnectedWithError:](self, "setDisconnectedWithError:", v4);
  }
  return 0;
}

@end
