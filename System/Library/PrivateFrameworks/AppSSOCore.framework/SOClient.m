@implementation SOClient

void __18__SOClient__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AppSSO.client-queue", 0);
  v1 = (void *)_queue_queue;
  _queue_queue = (uint64_t)v0;

}

void __40__SOClient_configurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("YES");
    if (!v5)
      v8 = CFSTR("NO");
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "configurationWithCompletion: success = %{public}@, error = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)configurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SOServiceConnection *serviceConnection;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClient configurationWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__SOClient_configurationWithCompletion___block_invoke;
  v8[3] = &unk_1E8C5C530;
  v9 = v4;
  v7 = v4;
  -[SOServiceConnection configurationWithCompletion:](serviceConnection, "configurationWithCompletion:", v8);

}

- (SOClient)init
{
  SOClient *v2;
  SOServiceConnection *v3;
  void *v4;
  uint64_t v5;
  SOServiceConnection *serviceConnection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SOClient;
  v2 = -[SOClient init](&v8, sel_init);
  if (v2)
  {
    v3 = [SOServiceConnection alloc];
    +[SOClient _queue](SOClient, "_queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SOServiceConnection initWithQueue:](v3, "initWithQueue:", v4);
    serviceConnection = v2->_serviceConnection;
    v2->_serviceConnection = (SOServiceConnection *)v5;

  }
  return v2;
}

+ (id)_queue
{
  if (_queue_onceToken != -1)
    dispatch_once(&_queue_onceToken, &__block_literal_global_3);
  return (id)_queue_queue;
}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SOServiceConnection *serviceConnection;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  SOClient *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  SO_LOG_SOClient();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316163;
    v16 = "-[SOClient getAuthorizationHintsWithURL:responseCode:completion:]";
    v17 = 2160;
    v18 = 1752392040;
    v19 = 2117;
    v20 = v8;
    v21 = 1024;
    v22 = a4;
    v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1CF39B000, v10, OS_LOG_TYPE_DEFAULT, "%s url: %{sensitive, mask.hash}@, responseCode: %d on %@", buf, 0x30u);
  }

  serviceConnection = self->_serviceConnection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__SOClient_getAuthorizationHintsWithURL_responseCode_completion___block_invoke;
  v13[3] = &unk_1E8C5C490;
  v14 = v9;
  v12 = v9;
  -[SOServiceConnection getAuthorizationHintsWithURL:responseCode:completion:](serviceConnection, "getAuthorizationHintsWithURL:responseCode:completion:", v8, a4, v13);

}

void __65__SOClient_getAuthorizationHintsWithURL_responseCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "SOClient authorization hints: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOServiceConnection *serviceConnection;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  SOClient *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOClient();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SOClient performAuthorizationWithRequestParameters:completion:]";
    v15 = 2114;
    v16 = v6;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SOClient_performAuthorizationWithRequestParameters_completion___block_invoke;
  v11[3] = &unk_1E8C5C4B8;
  v12 = v7;
  v10 = v7;
  -[SOServiceConnection performAuthorizationWithRequestParameters:completion:](serviceConnection, "performAuthorizationWithRequestParameters:completion:", v6, v11);

}

void __65__SOClient_performAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138478083;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "SOClient credential: %{private}@, error: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOServiceConnection *serviceConnection;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  SOClient *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOClient();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SOClient beginAuthorizationWithRequestParameters:completion:]";
    v15 = 2114;
    v16 = v6;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SOClient_beginAuthorizationWithRequestParameters_completion___block_invoke;
  v11[3] = &unk_1E8C5C4E0;
  v12 = v7;
  v10 = v7;
  -[SOServiceConnection beginAuthorizationWithRequestParameters:completion:](serviceConnection, "beginAuthorizationWithRequestParameters:completion:", v6, v11);

}

void __63__SOClient_beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  SO_LOG_SOClient();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1CF39B000, v10, OS_LOG_TYPE_DEFAULT, "SOClient extension id: %{public}@, endpoint: %{public}@, error: %{public}@", (uint8_t *)&v12, 0x20u);
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v7, v8, v9);

}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOServiceConnection *serviceConnection;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SOClient *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  SO_LOG_SOClient();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SOClient cancelAuthorization:completion:]";
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__SOClient_cancelAuthorization_completion___block_invoke;
  v11[3] = &unk_1E8C5C508;
  v12 = v6;
  v10 = v6;
  -[SOServiceConnection cancelAuthorization:completion:](serviceConnection, "cancelAuthorization:completion:", v7, v11);

}

void __43__SOClient_cancelAuthorization_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SO_LOG_SOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_DEFAULT, "cancelAuthorizationWithCompletion: success = %{public}@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)realmsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SOServiceConnection *serviceConnection;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClient realmsWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__SOClient_realmsWithCompletion___block_invoke;
  v8[3] = &unk_1E8C5C558;
  v9 = v4;
  v7 = v4;
  -[SOServiceConnection realmsWithCompletion:](serviceConnection, "realmsWithCompletion:", v8);

}

void __33__SOClient_realmsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "realmsWithCompletion: realms = %{public}@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)debugHintsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SOServiceConnection *serviceConnection;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClient debugHintsWithCompletion:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SOClient_debugHintsWithCompletion___block_invoke;
  v8[3] = &unk_1E8C5C580;
  v9 = v4;
  v7 = v4;
  -[SOServiceConnection debugHintsWithCompletion:](serviceConnection, "debugHintsWithCompletion:", v8);

}

void __37__SOClient_debugHintsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "debugHintsWithCompletion: hints = %@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOServiceConnection *serviceConnection;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SOClient *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  SO_LOG_SOClient();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SOClient finishAuthorization:completion:]";
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__SOClient_finishAuthorization_completion___block_invoke;
  v11[3] = &unk_1E8C5C508;
  v12 = v6;
  v10 = v6;
  -[SOServiceConnection finishAuthorization:completion:](serviceConnection, "finishAuthorization:completion:", v7, v11);

}

void __43__SOClient_finishAuthorization_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SO_LOG_SOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_DEFAULT, "finishAuthorizationWithCompletion: success = %d, error = %{public}@", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  SOServiceConnection *serviceConnection;
  __int128 v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _BYTE buf[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SO_LOG_SOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOClient isExtensionProcessWithAuditToken:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SOClient_isExtensionProcessWithAuditToken_completion___block_invoke;
  v11[3] = &unk_1E8C5C508;
  v12 = v6;
  v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v9;
  v10 = v6;
  -[SOServiceConnection isExtensionProcessWithAuditToken:completion:](serviceConnection, "isExtensionProcessWithAuditToken:completion:", buf, v11);

}

uint64_t __56__SOClient_isExtensionProcessWithAuditToken_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)profilesWithExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOServiceConnection *serviceConnection;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  SOClient *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOClient();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SOClient profilesWithExtensionBundleIdentifier:completion:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__SOClient_profilesWithExtensionBundleIdentifier_completion___block_invoke;
  v12[3] = &unk_1E8C5C5A8;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SOServiceConnection profilesWithExtensionBundleIdentifier:completion:](serviceConnection, "profilesWithExtensionBundleIdentifier:completion:", v11, v12);

}

void __61__SOClient_profilesWithExtensionBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "profilesWithExtensionBundleIdentifier: extension = %{public}@, profiles = %{public}@, error = %{public}@", (uint8_t *)&v10, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (SOServiceConnection)serviceConnection
{
  return (SOServiceConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end
