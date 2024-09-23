@implementation AKAuthorizationClientImpl

- (void)presentAuthorizationUIForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[8];
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self->_uiProvider)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AKAuthorizationClientImpl_presentAuthorizationUIForContext_completion___block_invoke;
    block[3] = &unk_1E2E60190;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    _AKLogSiwa();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "UI provider is nil", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7061);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

  }
}

uint64_t __73__AKAuthorizationClientImpl_presentAuthorizationUIForContext_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AKLogSiwa();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19202F000, v2, OS_LOG_TYPE_DEFAULT, "Present Authorization call forwarded to UI provider", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1[4] + 8), "presentAuthorizationUIForContext:completion:", a1[5], a1[6]);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "Authorization Client that has UI provider deallocated", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationClientImpl;
  -[AKAuthorizationClientImpl dealloc](&v4, sel_dealloc);
}

- (AKAuthorizationUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProvider, 0);
}

@end
