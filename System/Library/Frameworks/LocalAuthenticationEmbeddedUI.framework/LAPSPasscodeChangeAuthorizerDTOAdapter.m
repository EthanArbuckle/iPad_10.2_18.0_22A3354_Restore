@implementation LAPSPasscodeChangeAuthorizerDTOAdapter

- (LAPSPasscodeChangeAuthorizerDTOAdapter)initWithOptions:(id)a3
{
  id v5;
  LAPSPasscodeChangeAuthorizerDTOAdapter *v6;
  LAPSPasscodeChangeAuthorizerDTOAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeChangeAuthorizerDTOAdapter;
  v6 = -[LAPSPasscodeChangeAuthorizerDTOAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (void)authorizeWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  switch(-[LAPSPasscodeChangeAuthorizationOptions useCase](self->_options, "useCase"))
  {
    case 0:
      -[LAPSPasscodeChangeAuthorizerDTOAdapter _authorizePasscodeChangeWithCompletion:](self, "_authorizePasscodeChangeWithCompletion:", v4);
      break;
    case 1:
      -[LAPSPasscodeChangeAuthorizerDTOAdapter _authorizePasscodeRemovalWithCompletion:](self, "_authorizePasscodeRemovalWithCompletion:", v4);
      break;
    case 2:
      -[LAPSPasscodeChangeAuthorizerDTOAdapter _authorizePasscodeRecoveryWithCompletion:](self, "_authorizePasscodeRecoveryWithCompletion:", v4);
      break;
    case 3:
      -[LAPSPasscodeChangeAuthorizerDTOAdapter _authorizePasscodeVerificationWithCompletion:](self, "_authorizePasscodeVerificationWithCompletion:", v4);
      break;
    default:
      break;
  }

}

- (void)_authorizePasscodeChangeWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v13[0] = &unk_24FDDD8B0;
    +[LALocalizedString passcodeChangeLocalizedReason](LALocalizedString, "passcodeChangeLocalizedReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v13[1] = &unk_24FDDD8C8;
    +[LALocalizedString passcodeChangeRatchetBeginTitle](LALocalizedString, "passcodeChangeRatchetBeginTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    v13[2] = &unk_24FDDD8E0;
    +[LALocalizedString passcodeChangeRatchetCountdownText](LALocalizedString, "passcodeChangeRatchetCountdownText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v7;
    v13[3] = &unk_24FDDD8F8;
    -[LAPSPasscodeChangeAuthorizationOptions calloutReason](self->_options, "calloutReason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      +[LALocalizedString passcodeChangeRatchetCalloutReason](LALocalizedString, "passcodeChangeRatchetCalloutReason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[3] = v9;
    v13[4] = &unk_24FDDD910;
    -[LAPSPasscodeChangeAuthorizationOptions calloutURL](self->_options, "calloutURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=PASSCODE&path=12"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13[5] = &unk_24FDDD928;
    v14[4] = v11;
    v14[5] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSPasscodeChangeAuthorizerDTOAdapter _authorizeOperationWithIdentifier:options:completion:](self, "_authorizeOperationWithIdentifier:options:completion:", CFSTR("com.apple.LocalAuthentication.passcode.change"), v12, v4);

    if (!v10)
    if (!v8)

  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)_authorizePasscodeRemovalWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v13[0] = &unk_24FDDD8B0;
  v4 = a3;
  +[LALocalizedString passcodeRemovalLocalizedReason](LALocalizedString, "passcodeRemovalLocalizedReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = &unk_24FDDD8C8;
  +[LALocalizedString passcodeRemovalRatchetBeginTitle](LALocalizedString, "passcodeRemovalRatchetBeginTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = &unk_24FDDD8E0;
  +[LALocalizedString passcodeRemovalRatchetCountdownText](LALocalizedString, "passcodeRemovalRatchetCountdownText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = &unk_24FDDD8F8;
  -[LAPSPasscodeChangeAuthorizationOptions calloutReason](self->_options, "calloutReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    +[LALocalizedString passcodeRemovalRatchetCalloutReason](LALocalizedString, "passcodeRemovalRatchetCalloutReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v9;
  v13[4] = &unk_24FDDD910;
  -[LAPSPasscodeChangeAuthorizationOptions calloutURL](self->_options, "calloutURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=PASSCODE&path=8"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[5] = &unk_24FDDD928;
  v14[4] = v11;
  v14[5] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeAuthorizerDTOAdapter _authorizeOperationWithIdentifier:options:completion:](self, "_authorizeOperationWithIdentifier:options:completion:", CFSTR("com.apple.LocalAuthentication.passcode.removal"), v12, v4);

  if (!v10)
  if (!v8)

}

- (void)_authorizePasscodeRecoveryWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)_authorizePasscodeVerificationWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)_authorizeOperationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x24BDDA948];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithIdentifier:", v10);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __95__LAPSPasscodeChangeAuthorizerDTOAdapter__authorizeOperationWithIdentifier_options_completion___block_invoke;
  v14[3] = &unk_24FDCD3E8;
  v15 = v11;
  v16 = v7;
  v12 = v11;
  v13 = v7;
  objc_msgSend(v12, "armWithOptions:completion:", v9, v14);

}

uint64_t __95__LAPSPasscodeChangeAuthorizerDTOAdapter__authorizeOperationWithIdentifier_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
