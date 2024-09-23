@implementation LAPSPasscodeChangeControllerProvider

- (id)passcodeRecoveryPreflightController
{
  LAPSPasscodeChangePreflightController *v2;
  void *v3;
  LAPSPasscodeChangePreflightController *v4;

  v2 = [LAPSPasscodeChangePreflightController alloc];
  +[LAPSPasscodeChangeSystemBuilder passcodeRecoverySystem](LAPSPasscodeChangeSystemBuilder, "passcodeRecoverySystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LAPSPasscodeChangePreflightController initWithSystem:](v2, "initWithSystem:", v3);

  return v4;
}

- (id)passcodeChangeControllerWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LAPSPasscodeChangeController *v11;
  id v12;
  id v13;
  void *v14;
  LAPSPasscodeChangeController *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke;
  v20[3] = &unk_24FDCDFE0;
  v6 = v4;
  v21 = v6;
  __76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke((uint64_t)v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAPSPasscodeChangeSystemBuilder passcodeChangeSystemWithOptions:](LAPSPasscodeChangeSystemBuilder, "passcodeChangeSystemWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[LAPSPasscodeChangeControllerProvider _authorizerWithUseCase:options:](self, "_authorizerWithUseCase:options:", 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProvider _uiWithOptions:](self, "_uiWithOptions:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [LAPSPasscodeChangeController alloc];
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke_2;
  v17[3] = &unk_24FDCE008;
  v18 = v6;
  v19 = v8;
  v12 = v8;
  v13 = v6;
  __76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke_2((uint64_t)v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[LAPSPasscodeChangeController initWithSystem:authorizer:ui:options:](v11, "initWithSystem:authorizer:ui:options:", v12, v9, v10, v14);

  return v15;
}

LAPSPasscodeChangeSystemOptions *__76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke(uint64_t a1)
{
  LAPSPasscodeChangeSystemOptions *v2;

  v2 = objc_alloc_init(LAPSPasscodeChangeSystemOptions);
  -[LAPSPasscodeChangeSystemOptions setSkipSuccessNotification:](v2, "setSkipSuccessNotification:", objc_msgSend(*(id *)(a1 + 32), "skipSuccessNotification"));
  return v2;
}

LAPSPasscodeChangeControllerOptions *__76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke_2(uint64_t a1)
{
  LAPSPasscodeChangeControllerOptions *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(LAPSPasscodeChangeControllerOptions);
  -[LAPSPasscodeChangeControllerOptions setDismissUIAfterCompletion:](v2, "setDismissUIAfterCompletion:", objc_msgSend(*(id *)(a1 + 32), "dismissUIAfterCompletion"));
  -[LAPSPasscodeChangeControllerOptions setSkipOldPasscode:](v2, "setSkipOldPasscode:", objc_msgSend(*(id *)(a1 + 40), "hasPasscode") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "oldPasscode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerOptions setOldPasscode:](v2, "setOldPasscode:", v3);

  objc_msgSend(*(id *)(a1 + 32), "newPasscode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerOptions setNewPasscode:](v2, "setNewPasscode:", v4);

  return v2;
}

- (id)passcodeRecoveryControllerWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LAPSPasscodeChangeController *v8;

  v4 = a3;
  +[LAPSPasscodeChangeSystemBuilder passcodeRecoverySystem](LAPSPasscodeChangeSystemBuilder, "passcodeRecoverySystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProvider _authorizerWithUseCase:options:](self, "_authorizerWithUseCase:options:", 2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProvider _uiWithOptions:](self, "_uiWithOptions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[LAPSPasscodeChangeController initWithSystem:authorizer:ui:]([LAPSPasscodeChangeController alloc], "initWithSystem:authorizer:ui:", v5, v6, v7);
  return v8;
}

- (id)passcodeRemovalControllerWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LAPSPasscodeChangeController *v8;
  id v9;
  id v10;
  void *v11;
  LAPSPasscodeChangeController *v12;
  uint64_t v14;
  uint64_t v15;
  LAPSPasscodeChangeControllerOptions *(*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  +[LAPSPasscodeChangeSystemBuilder passcodeRemovalSystem](LAPSPasscodeChangeSystemBuilder, "passcodeRemovalSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProvider _authorizerWithUseCase:options:](self, "_authorizerWithUseCase:options:", 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProvider _uiWithOptions:](self, "_uiWithOptions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [LAPSPasscodeChangeController alloc];
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __77__LAPSPasscodeChangeControllerProvider_passcodeRemovalControllerWithOptions___block_invoke;
  v17 = &unk_24FDCE008;
  v18 = v4;
  v19 = v5;
  v9 = v5;
  v10 = v4;
  __77__LAPSPasscodeChangeControllerProvider_passcodeRemovalControllerWithOptions___block_invoke((uint64_t)&v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LAPSPasscodeChangeController initWithSystem:authorizer:ui:options:](v8, "initWithSystem:authorizer:ui:options:", v9, v6, v7, v11, v14, v15, v16, v17);

  return v12;
}

LAPSPasscodeChangeControllerOptions *__77__LAPSPasscodeChangeControllerProvider_passcodeRemovalControllerWithOptions___block_invoke(uint64_t a1)
{
  LAPSPasscodeChangeControllerOptions *v2;

  v2 = objc_alloc_init(LAPSPasscodeChangeControllerOptions);
  -[LAPSPasscodeChangeControllerOptions setDismissUIAfterCompletion:](v2, "setDismissUIAfterCompletion:", objc_msgSend(*(id *)(a1 + 32), "dismissUIAfterCompletion"));
  -[LAPSPasscodeChangeControllerOptions setSkipOldPasscode:](v2, "setSkipOldPasscode:", objc_msgSend(*(id *)(a1 + 40), "hasPasscode") ^ 1);
  -[LAPSPasscodeChangeControllerOptions setSkipNewPasscode:](v2, "setSkipNewPasscode:", 1);
  return v2;
}

- (id)passcodeVerificationControllerWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LAPSPasscodeChangeController *v8;
  id v9;
  id v10;
  void *v11;
  LAPSPasscodeChangeController *v12;
  uint64_t v14;
  uint64_t v15;
  LAPSPasscodeChangeControllerOptions *(*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  +[LAPSPasscodeChangeSystemBuilder passcodeVerificationSystem](LAPSPasscodeChangeSystemBuilder, "passcodeVerificationSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProvider _authorizerWithUseCase:options:](self, "_authorizerWithUseCase:options:", 3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeControllerProvider _uiWithOptions:](self, "_uiWithOptions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [LAPSPasscodeChangeController alloc];
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __82__LAPSPasscodeChangeControllerProvider_passcodeVerificationControllerWithOptions___block_invoke;
  v17 = &unk_24FDCE008;
  v18 = v4;
  v19 = v5;
  v9 = v5;
  v10 = v4;
  __82__LAPSPasscodeChangeControllerProvider_passcodeVerificationControllerWithOptions___block_invoke((uint64_t)&v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LAPSPasscodeChangeController initWithSystem:authorizer:ui:options:](v8, "initWithSystem:authorizer:ui:options:", v9, v6, v7, v11, v14, v15, v16, v17);

  return v12;
}

LAPSPasscodeChangeControllerOptions *__82__LAPSPasscodeChangeControllerProvider_passcodeVerificationControllerWithOptions___block_invoke(uint64_t a1)
{
  LAPSPasscodeChangeControllerOptions *v2;

  v2 = objc_alloc_init(LAPSPasscodeChangeControllerOptions);
  -[LAPSPasscodeChangeControllerOptions setDismissUIAfterCompletion:](v2, "setDismissUIAfterCompletion:", objc_msgSend(*(id *)(a1 + 32), "dismissUIAfterCompletion"));
  -[LAPSPasscodeChangeControllerOptions setSkipOldPasscode:](v2, "setSkipOldPasscode:", objc_msgSend(*(id *)(a1 + 40), "hasPasscode") ^ 1);
  -[LAPSPasscodeChangeControllerOptions setSkipNewPasscode:](v2, "setSkipNewPasscode:", 1);
  return v2;
}

- (id)_uiWithOptions:(id)a3
{
  id v3;
  LAPSPasscodeChangeUIAdapter *v4;
  void *v5;
  id v6;
  void *v7;
  LAPSPasscodeChangeUIAdapter *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = [LAPSPasscodeChangeUIAdapter alloc];
  objc_msgSend(v3, "parentVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__LAPSPasscodeChangeControllerProvider__uiWithOptions___block_invoke;
  v10[3] = &unk_24FDCE030;
  v11 = v3;
  v6 = v3;
  __55__LAPSPasscodeChangeControllerProvider__uiWithOptions___block_invoke((uint64_t)v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LAPSPasscodeChangeUIAdapter initWithParentVC:options:](v4, "initWithParentVC:options:", v5, v7);

  return v8;
}

LAPSPasscodeChangeUIAdapterOptions *__55__LAPSPasscodeChangeControllerProvider__uiWithOptions___block_invoke(uint64_t a1)
{
  LAPSPasscodeChangeUIAdapterOptions *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(LAPSPasscodeChangeUIAdapterOptions);
  objc_msgSend(*(id *)(a1 + 32), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeUIAdapterOptions setTitle:](v2, "setTitle:", v3);

  objc_msgSend(*(id *)(a1 + 32), "passcodePrompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeUIAdapterOptions setPasscodePrompt:](v2, "setPasscodePrompt:", v4);

  objc_msgSend(*(id *)(a1 + 32), "oldPasscodePrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeUIAdapterOptions setOldPasscodePrompt:](v2, "setOldPasscodePrompt:", v5);

  -[LAPSPasscodeChangeUIAdapterOptions setIsPasscodeRecoveryMessageHidden:](v2, "setIsPasscodeRecoveryMessageHidden:", objc_msgSend(*(id *)(a1 + 32), "isPasscodeRecoveryMessageHidden"));
  return v2;
}

- (id)_authorizerWithUseCase:(int64_t)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  LAPSPasscodeChangeAuthorizationOptions *(*v12)(uint64_t);
  void *v13;
  id v14;
  int64_t v15;

  v5 = a4;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __71__LAPSPasscodeChangeControllerProvider__authorizerWithUseCase_options___block_invoke;
  v13 = &unk_24FDCE058;
  v14 = v5;
  v15 = a3;
  v6 = v5;
  __71__LAPSPasscodeChangeControllerProvider__authorizerWithUseCase_options___block_invoke((uint64_t)&v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAPSPasscodeChangeAuthorizerBuilder authorizerWithOptions:](LAPSPasscodeChangeAuthorizerBuilder, "authorizerWithOptions:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

LAPSPasscodeChangeAuthorizationOptions *__71__LAPSPasscodeChangeControllerProvider__authorizerWithUseCase_options___block_invoke(uint64_t a1)
{
  LAPSPasscodeChangeAuthorizationOptions *v2;
  void *v3;
  void *v4;

  v2 = -[LAPSPasscodeChangeAuthorizationOptions initWithUseCase:]([LAPSPasscodeChangeAuthorizationOptions alloc], "initWithUseCase:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "calloutReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeAuthorizationOptions setCalloutReason:](v2, "setCalloutReason:", v3);

  objc_msgSend(*(id *)(a1 + 32), "calloutURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeAuthorizationOptions setCalloutURL:](v2, "setCalloutURL:", v4);

  return v2;
}

@end
