@implementation AAUITwoFactorCodeHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("code:generate"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("code:generate"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUITwoFactorCodeHook _generateLoginCode:](self, "_generateLoginCode:", a6, a4, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  -[AAUITwoFactorCodeHook _generateLoginCode:](self, "_generateLoginCode:", a4);
}

- (void)_generateLoginCode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AAUITwoFactorCodeHook delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationContextForHook:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUITwoFactorCodeHook generateLoginCodeWithPresenter:completion:](self, "generateLoginCodeWithPresenter:completion:", v5, v4);

}

- (void)generateLoginCodeWithPresenter:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Starting to generate verification code...", buf, 2u);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke;
  v12[3] = &unk_1EA2DCA00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "generateLoginCodeWithCompletion:", v12);

}

void __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_2;
  block[3] = &unk_1EA2DC9D8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v9 = *(id *)(a1 + 48);
  v16 = v5;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _AAUILogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v29 = v3;
      _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Failed to generate login code. Error: %@", buf, 0xCu);
    }

    v4 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HSA2_CODE_GENERATOR_FAILED_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertWithTitle:message:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 48);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_32;
    v25[3] = &unk_1EA2DB110;
    v27 = *(id *)(a1 + 64);
    v26 = *(id *)(a1 + 32);
    objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, v25);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D00230];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("HSA2_CODE_GENERATOR_TITLE");
    if ((objc_msgSend(CFSTR("HSA2_CODE_GENERATOR_TITLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("HSA2_CODE_GENERATOR_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v21 = 1;
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1EA2E2A18, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("HSA2_CODE_GENERATOR_BODY"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("HSA2_CODE_GENERATOR_FOOTER"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "buildLoginCodeNotificationWithTitle:body:footer:loginCode:", v12, v14, v16, *(_QWORD *)(a1 + 56));

    if (v21)
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CFAD70];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_2_48;
      v22[3] = &unk_1EA2DC9B0;
      v24 = v17;
      v23 = *(id *)(a1 + 64);
      objc_msgSend(v18, "waitForResponseToNotification:completion:", v17, v22);

    }
    else
    {
      _AAUILogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v19, OS_LOG_TYPE_DEFAULT, "Unable to create CFUserNotificationRef!", buf, 2u);
      }

      v20 = *(_QWORD *)(a1 + 64);
      if (v20)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v20 + 16))(v20, 0, 0);
    }
  }
}

uint64_t __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_2_48(uint64_t a1)
{
  uint64_t result;

  CFRelease(*(CFTypeRef *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
