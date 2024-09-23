@implementation LAPasscodeChangeService

- (LAPasscodeChangeService)init
{
  LAPSPasscodeChangeControllerProvider *v3;
  LAPasscodeChangeService *v4;

  v3 = objc_alloc_init(LAPSPasscodeChangeControllerProvider);
  v4 = -[LAPasscodeChangeService initWithControllerBuilder:](self, "initWithControllerBuilder:", v3);

  return v4;
}

- (LAPasscodeChangeService)initWithControllerBuilder:(id)a3
{
  id v5;
  LAPasscodeChangeService *v6;
  LAPasscodeChangeService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPasscodeChangeService;
  v6 = -[LAPasscodeChangeService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_builder, a3);

  return v7;
}

- (void)startInParentVC:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LAPasscodeChangeServiceOptions *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(LAPasscodeChangeServiceOptions);
  -[LAPasscodeChangeService startInParentVC:options:completion:](self, "startInParentVC:options:completion:", v7, v8, v6);

}

- (void)startInParentVC:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  LAPSPasscodeChangeControllerProviding *builder;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  LAPasscodeChangeService *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LACLogPasscodeService();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v26 = self;
    v27 = 2114;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_22FE91000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will start on parentVC: %{public}@ with options: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  builder = self->_builder;
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __62__LAPasscodeChangeService_startInParentVC_options_completion___block_invoke;
  v22[3] = &unk_24FDCD8C0;
  v14 = v8;
  v23 = v14;
  v15 = v9;
  v24 = v15;
  __62__LAPasscodeChangeService_startInParentVC_options_completion___block_invoke((uint64_t)v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviding passcodeChangeControllerWithOptions:](builder, "passcodeChangeControllerWithOptions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __62__LAPasscodeChangeService_startInParentVC_options_completion___block_invoke_2;
  v19[3] = &unk_24FDCD8E8;
  objc_copyWeak(&v21, (id *)buf);
  v18 = v10;
  v20 = v18;
  -[LAPasscodeChangeService _startOperation:completion:](self, "_startOperation:completion:", v17, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

LAPSPasscodeChangeControllerProviderOptions *__62__LAPasscodeChangeService_startInParentVC_options_completion___block_invoke(uint64_t a1)
{
  LAPSPasscodeChangeControllerProviderOptions *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = -[LAPSPasscodeChangeControllerProviderOptions initWithParentVC:]([LAPSPasscodeChangeControllerProviderOptions alloc], "initWithParentVC:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[LAPSPasscodeChangeControllerProviderOptions setTitle:](v2, "setTitle:", v3);
  }
  else
  {
    +[LALocalizedString passcodeChangeTitle](LALocalizedString, "passcodeChangeTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSPasscodeChangeControllerProviderOptions setTitle:](v2, "setTitle:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "passcodePrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviderOptions setPasscodePrompt:](v2, "setPasscodePrompt:", v5);

  +[LALocalizedString passcodeChangeOldPasscode](LALocalizedString, "passcodeChangeOldPasscode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviderOptions setOldPasscodePrompt:](v2, "setOldPasscodePrompt:", v6);

  objc_msgSend(*(id *)(a1 + 40), "currentPasscode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviderOptions setOldPasscode:](v2, "setOldPasscode:", v7);

  objc_msgSend(*(id *)(a1 + 40), "newPasscode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviderOptions setNewPasscode:](v2, "setNewPasscode:", v8);

  objc_msgSend(*(id *)(a1 + 40), "calloutURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviderOptions setCalloutURL:](v2, "setCalloutURL:", v9);

  objc_msgSend(*(id *)(a1 + 40), "calloutReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviderOptions setCalloutReason:](v2, "setCalloutReason:", v10);

  -[LAPSPasscodeChangeControllerProviderOptions setSkipSuccessNotification:](v2, "setSkipSuccessNotification:", objc_msgSend(*(id *)(a1 + 40), "skipSuccessNotification"));
  -[LAPSPasscodeChangeControllerProviderOptions setIsPasscodeRecoveryMessageHidden:](v2, "setIsPasscodeRecoveryMessageHidden:", objc_msgSend(*(id *)(a1 + 40), "hidePasscodeRecoveryMessage"));
  return v2;
}

void __62__LAPasscodeChangeService_startInParentVC_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  LACLogPasscodeService();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 16 * (v5 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = 138543618;
    v13 = WeakRetained;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_22FE91000, v7, v8, "%{public}@ did finish (error=%{public}@)", (uint8_t *)&v12, 0x16u);

  }
  v10 = *(_QWORD *)(a1 + 32);
  +[LAPasscodeServiceErrorBuilder redactError:](LAPasscodeServiceErrorBuilder, "redactError:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v6, v11);

}

- (void)cancel
{
  NSObject *v3;
  id WeakRetained;

  LACLogPasscodeService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[LAPasscodeVerificationService cancel].cold.1((uint64_t)self, v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  objc_msgSend(WeakRetained, "cancel");

}

- (void)_startOperation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_storeWeak((id *)&self->_operation, v6);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__LAPasscodeChangeService__startOperation_completion___block_invoke;
  v10[3] = &unk_24FDCD910;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v12 = v8;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v9, "startWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __54__LAPasscodeChangeService__startOperation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!(v10 | v5))
      __54__LAPasscodeChangeService__startOperation_completion___block_invoke_cold_1();
    if (v10)
    {
      objc_msgSend((id)v10, "externalizePasscode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      if (v7)
      {
        (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v7, 0);
      }
      else
      {
        +[LAPasscodeServiceErrorBuilder genericErrorWithDebugDescription:](LAPasscodeServiceErrorBuilder, "genericErrorWithDebugDescription:", CFSTR("Could not externalize passcode"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_builder, 0);
}

void __54__LAPasscodeChangeService__startOperation_completion___block_invoke_cold_1()
{
  __assert_rtn("-[LAPasscodeChangeService _startOperation:completion:]_block_invoke", "LAPasscodeChangeService.m", 77, "result != nil || error != nil");
}

@end
