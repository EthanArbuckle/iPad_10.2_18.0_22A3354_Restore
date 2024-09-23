@implementation LNInProcessConnection

- (LNInProcessConnection)initWithBundleIdentifier:(id)a3 bundleURL:(id)a4 bundleType:(id)a5 appBundleIdentifier:(id)a6 appIntentsEnabledOnly:(BOOL)a7 userIdentity:(id)a8 error:(id *)a9
{
  LNInProcessConnection *v9;
  void *v10;
  void *v11;
  LNInProcessConnection *v12;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)LNInProcessConnection;
  v9 = -[LNConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:](&v17, sel_initWithBundleIdentifier_bundleURL_bundleType_appBundleIdentifier_appIntentsEnabledOnly_userIdentity_error_, a3, a4, a5, a6, a7, a8, a9);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "if_auditToken");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }
    v14[0] = v15;
    v14[1] = v16;
    -[LNConnection setAuditToken:](v9, "setAuditToken:", v14);

    v12 = v9;
  }

  return v9;
}

- (void)connectWithOptions:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LNInProcessConnection;
  -[LNConnection connectWithOptions:](&v4, sel_connectWithOptions_, a3);
  -[LNConnection setConnected](self, "setConnected");
}

- (BOOL)refreshWithOptions:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNInProcessConnection;
  v4 = -[LNConnection refreshWithOptions:](&v6, sel_refreshWithOptions_, a3);
  if (v4)
    -[LNConnection setConnected](self, "setConnected");
  return v4;
}

- (id)connectionInterface
{
  LNConnectionHostInterface *connectionInterface;
  LNConnectionHostInterface *v3;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  LNConnectionHostInterface *v12;
  LNConnectionHostInterface *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  connectionInterface = self->_connectionInterface;
  if (connectionInterface)
  {
    v3 = connectionInterface;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v5 = (void *)getLNAppContextClass_softClass;
    v23 = getLNAppContextClass_softClass;
    if (!getLNAppContextClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getLNAppContextClass_block_invoke;
      v18 = &unk_1E45DDB30;
      v19 = &v20;
      __getLNAppContextClass_block_invoke((uint64_t)&v15);
      v5 = (void *)v21[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v20, 8);
    v7 = objc_alloc_init(v6);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v8 = (void *)getLNClientConnectionClass_softClass;
    v23 = getLNClientConnectionClass_softClass;
    if (!getLNClientConnectionClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getLNClientConnectionClass_block_invoke;
      v18 = &unk_1E45DDB30;
      v19 = &v20;
      __getLNClientConnectionClass_block_invoke((uint64_t)&v15);
      v8 = (void *)v21[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v20, 8);
    v10 = [v9 alloc];
    -[LNConnection queue](self, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (LNConnectionHostInterface *)objc_msgSend(v10, "initWithConnection:connectionListener:queue:appContext:", 0, 0, v11, v7);
    v13 = self->_connectionInterface;
    self->_connectionInterface = v12;

    v3 = self->_connectionInterface;
  }
  return v3;
}

- (void)acquireAssertionsForConnectionOperation:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[LNConnection queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "%{public}@ Assertion is not required for in-process connection", (uint8_t *)&v7, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInterface, 0);
}

@end
