@implementation LAPasscodeRecoveryService

- (LAPasscodeRecoveryService)init
{
  LAPSPasscodeChangeControllerProvider *v3;
  LAPasscodeRecoveryService *v4;

  v3 = objc_alloc_init(LAPSPasscodeChangeControllerProvider);
  v4 = -[LAPasscodeRecoveryService initWithControllerBuilder:](self, "initWithControllerBuilder:", v3);

  return v4;
}

- (LAPasscodeRecoveryService)initWithControllerBuilder:(id)a3
{
  id v5;
  LAPasscodeRecoveryService *v6;
  LAPasscodeRecoveryService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPasscodeRecoveryService;
  v6 = -[LAPasscodeRecoveryService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_builder, a3);

  return v7;
}

- (id)lastPasscodeChange
{
  void *v2;
  void *v3;

  -[LAPSPasscodeChangeControllerProviding passcodeRecoveryPreflightController](self->_builder, "passcodeRecoveryPreflightController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPasscodeChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isRecoveryAvailableWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  LACLogPasscodeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FE91000, v5, OS_LOG_TYPE_DEFAULT, "LAPasscodeRecoveryService preflight will start", buf, 2u);
  }

  -[LAPSPasscodeChangeControllerProviding passcodeRecoveryPreflightController](self->_builder, "passcodeRecoveryPreflightController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v6, "canChangePasscodeWithError:", &v12);
  v8 = v12;

  if (a3 && (v7 & 1) == 0)
  {
    +[LAPasscodeServiceErrorBuilder redactError:](LAPasscodeServiceErrorBuilder, "redactError:", v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  LACLogPasscodeService();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = 16 * (v8 != 0);
  if (os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_22FE91000, v9, v10, "LAPasscodeRecoveryService preflight did finish (error=%{public}@)", buf, 0xCu);
  }

  return v7;
}

- (void)startRecoveryInParentVC:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  LAPSPasscodeChangeControllerProviding *builder;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  LAPasscodeRecoveryService *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LACLogPasscodeService();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_22FE91000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start on parentVC: %{public}@", buf, 0x16u);
  }

  builder = self->_builder;
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke;
  v20[3] = &unk_24FDCE0E8;
  v11 = v6;
  v21 = v11;
  __64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke((uint64_t)v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviding passcodeRecoveryControllerWithOptions:](builder, "passcodeRecoveryControllerWithOptions:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke_2;
  v16[3] = &unk_24FDCD910;
  objc_copyWeak(&v19, (id *)buf);
  v14 = v7;
  v18 = v14;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v15, "startWithCompletion:", v16);
  objc_storeWeak((id *)&self->_recoveryController, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

LAPSPasscodeChangeControllerProviderOptions *__64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke(uint64_t a1)
{
  LAPSPasscodeChangeControllerProviderOptions *v1;
  void *v2;
  void *v3;

  v1 = -[LAPSPasscodeChangeControllerProviderOptions initWithParentVC:]([LAPSPasscodeChangeControllerProviderOptions alloc], "initWithParentVC:", *(_QWORD *)(a1 + 32));
  +[LALocalizedString passcodeRecoveryTitle](LALocalizedString, "passcodeRecoveryTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviderOptions setTitle:](v1, "setTitle:", v2);

  +[LALocalizedString passcodeRecoveryOldPasscode](LALocalizedString, "passcodeRecoveryOldPasscode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProviderOptions setOldPasscodePrompt:](v1, "setOldPasscodePrompt:", v3);

  return v1;
}

void __64__LAPasscodeRecoveryService_startRecoveryInParentVC_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogPasscodeService();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 16 * (v4 != 0);
  if (os_log_type_enabled(v5, v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = 138543618;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_22FE91000, v5, v6, "%{public}@ did finish (error=%{public}@)", (uint8_t *)&v10, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 40);
  +[LAPasscodeServiceErrorBuilder redactError:](LAPasscodeServiceErrorBuilder, "redactError:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

- (void)cancelRecovery
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  LACLogPasscodeService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FE91000, v3, OS_LOG_TYPE_DEFAULT, "LAPasscodeRecoveryService will cancel", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_recoveryController);
  objc_msgSend(WeakRetained, "cancel");

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recoveryController);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
