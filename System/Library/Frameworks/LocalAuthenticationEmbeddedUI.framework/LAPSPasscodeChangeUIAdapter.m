@implementation LAPSPasscodeChangeUIAdapter

- (LAPSPasscodeChangeUIAdapter)initWithParentVC:(id)a3
{
  id v4;
  LAPSPasscodeChangeUIAdapterOptions *v5;
  LAPSPasscodeChangeUIAdapter *v6;

  v4 = a3;
  v5 = objc_alloc_init(LAPSPasscodeChangeUIAdapterOptions);
  v6 = -[LAPSPasscodeChangeUIAdapter initWithParentVC:options:](self, "initWithParentVC:options:", v4, v5);

  return v6;
}

- (LAPSPasscodeChangeUIAdapter)initWithParentVC:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeChangeUIAdapter *v8;
  LAPSPasscodeChangeUIAdapter *v9;
  LAPSPasscodeChangeUIPresentationController *v10;
  objc_class *v11;
  LAPSPasscodeChangeUIAdapter *v12;
  id v13;
  uint64_t v14;
  LAPSPasscodeChangeUIPresentationController *presentationController;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v17.receiver = self;
  v17.super_class = (Class)LAPSPasscodeChangeUIAdapter;
  v8 = -[LAPSPasscodeChangeUIAdapter init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_options, a4);
    v10 = [LAPSPasscodeChangeUIPresentationController alloc];
    v11 = (objc_class *)MEMORY[0x24BE60828];
    v12 = v9;
    v13 = objc_alloc_init(v11);
    objc_msgSend(v13, "setDelegate:", v12);
    v14 = -[LAPSPasscodeChangeUIPresentationController initWithParentVC:containerVC:](v10, "initWithParentVC:containerVC:", v6, v13);
    presentationController = v12->_presentationController;
    v12->_presentationController = (LAPSPasscodeChangeUIPresentationController *)v14;

  }
  return v9;
}

- (void)fetchOldPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeChangeUIPresentationController *presentationController;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  presentationController = self->_presentationController;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke;
  v12[3] = &unk_24FDCDE20;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v11 = v6;
  __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke((uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeUIPresentationController presentVC:animated:](presentationController, "presentVC:animated:", v10, 0);

}

LAPSFetchOldPasscodeViewController *__59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke(uint64_t a1)
{
  LAPSFetchOldPasscodeViewController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  LAPSFetchOldPasscodeViewController *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = [LAPSFetchOldPasscodeViewController alloc];
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_2;
  v10[3] = &unk_24FDCDDD0;
  v4 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v4;
  __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_3;
  v8[3] = &unk_24FDCDDF8;
  v9 = *(id *)(a1 + 48);
  v6 = -[LAPSFetchOldPasscodeViewController initWithInput:completion:](v2, "initWithInput:completion:", v5, v8);

  -[LAPSFetchOldPasscodeViewController setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  return v6;
}

LAPSFetchOldPasscodeViewControllerInput *__59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_2(uint64_t a1)
{
  LAPSFetchOldPasscodeViewControllerInput *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(LAPSFetchOldPasscodeViewControllerInput);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[LAPSFetchOldPasscodeViewControllerInput setTitle:](v2, "setTitle:", v3);
  }
  else
  {
    +[LALocalizedString passcodeChangeTitle](LALocalizedString, "passcodeChangeTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSFetchOldPasscodeViewControllerInput setTitle:](v2, "setTitle:", v4);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "oldPasscodePrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[LAPSFetchOldPasscodeViewControllerInput setPrompt:](v2, "setPrompt:", v5);
  }
  else
  {
    +[LALocalizedString passcodeChangeOldPasscode](LALocalizedString, "passcodeChangeOldPasscode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSFetchOldPasscodeViewControllerInput setPrompt:](v2, "setPrompt:", v6);

  }
  +[LALocalizedString passcodeChangeNext](LALocalizedString, "passcodeChangeNext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeViewControllerInput setNextButton:](v2, "setNextButton:", v7);

  -[LAPSFetchOldPasscodeViewControllerInput setBackoffTimeout:](v2, "setBackoffTimeout:", objc_msgSend(*(id *)(a1 + 40), "backoffTimeout"));
  if (objc_msgSend(*(id *)(a1 + 40), "failedAttempts") >= 1)
  {
    +[LALocalizedString passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:](LALocalizedString, "passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:", objc_msgSend(*(id *)(a1 + 40), "failedAttempts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSFetchOldPasscodeViewControllerInput setErrorMessage:](v2, "setErrorMessage:", v8);

  }
  objc_msgSend(*(id *)(a1 + 40), "passcodeType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeViewControllerInput setPasscodeType:](v2, "setPasscodeType:", v9);

  return v2;
}

void __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  LAPSFetchOldPasscodeResult *v7;
  void *v8;
  LAPSFetchOldPasscodeResult *v9;
  unint64_t v10;

  v10 = a2;
  v5 = a3;
  if (!(v10 | v5))
    __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_3_cold_1();
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD, unint64_t))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    v7 = [LAPSFetchOldPasscodeResult alloc];
    objc_msgSend((id)v10, "passcode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LAPSFetchOldPasscodeResult initWithPasscode:](v7, "initWithPasscode:", v8);
    (*(void (**)(uint64_t, LAPSFetchOldPasscodeResult *, _QWORD))(v6 + 16))(v6, v9, 0);

  }
}

- (void)fetchNewPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeChangeUIPresentationController *presentationController;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  presentationController = self->_presentationController;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke;
  v12[3] = &unk_24FDCDE98;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v11 = v6;
  __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke((uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeUIPresentationController presentVC:animated:](presentationController, "presentVC:animated:", v10, 1);

}

LAPSFetchNewPasscodeViewController *__59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke(uint64_t a1)
{
  LAPSFetchNewPasscodeViewController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  LAPSFetchNewPasscodeViewController *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = [LAPSFetchNewPasscodeViewController alloc];
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_2;
  v10[3] = &unk_24FDCDE48;
  v4 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v4;
  __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_2((uint64_t)v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_3;
  v8[3] = &unk_24FDCDE70;
  v9 = *(id *)(a1 + 48);
  v6 = -[LAPSFetchNewPasscodeViewController initWithInput:completion:](v2, "initWithInput:completion:", v5, v8);

  -[LAPSFetchNewPasscodeViewController setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  return v6;
}

LAPSFetchNewPasscodeViewControllerInput *__59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_2(uint64_t a1)
{
  LAPSFetchNewPasscodeViewControllerInput *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v2 = objc_alloc_init(LAPSFetchNewPasscodeViewControllerInput);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[LAPSFetchNewPasscodeViewControllerInput setTitle:](v2, "setTitle:", v3);
  }
  else
  {
    +[LALocalizedString passcodeChangeTitle](LALocalizedString, "passcodeChangeTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSFetchNewPasscodeViewControllerInput setTitle:](v2, "setTitle:", v4);

  }
  +[LALocalizedString cancel](LALocalizedString, "cancel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setPasscodeOptionsCancelTitle:](v2, "setPasscodeOptionsCancelTitle:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "passcodePrompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[LAPSFetchNewPasscodeViewControllerInput setPrompt:](v2, "setPrompt:", v6);
  }
  else
  {
    +[LALocalizedString passcodeChangeNewPasscode](LALocalizedString, "passcodeChangeNewPasscode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSFetchNewPasscodeViewControllerInput setPrompt:](v2, "setPrompt:", v7);

  }
  +[LALocalizedString passcodeRecoveryRecoveryEnabled](LALocalizedString, "passcodeRecoveryRecoveryEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setFooterRecoveryEnabled:](v2, "setFooterRecoveryEnabled:", v8);

  +[LALocalizedString passcodeRecoveryRecoveryDisabled](LALocalizedString, "passcodeRecoveryRecoveryDisabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setFooterRecoveryDisabled:](v2, "setFooterRecoveryDisabled:", v9);

  +[LALocalizedString passcodeChangeNext](LALocalizedString, "passcodeChangeNext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setNextButton:](v2, "setNextButton:", v10);

  objc_msgSend(*(id *)(a1 + 40), "passcodeType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setPasscodeType:](v2, "setPasscodeType:", v11);

  +[LALocalizedString passcodeChangeOptions](LALocalizedString, "passcodeChangeOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setPasscodeOptionsTitle:](v2, "setPasscodeOptionsTitle:", v12);

  +[LALocalizedString passcodeRecoveryTitle](LALocalizedString, "passcodeRecoveryTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setPasscodeRecoveryTitle:](v2, "setPasscodeRecoveryTitle:", v13);

  +[LALocalizedString passcodeRecoveryEnabledTitle](LALocalizedString, "passcodeRecoveryEnabledTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setPasscodeRecoveryEnabledTitle:](v2, "setPasscodeRecoveryEnabledTitle:", v14);

  +[LALocalizedString passcodeRecoveryDisabledTitle](LALocalizedString, "passcodeRecoveryDisabledTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setPasscodeRecoveryDisabledTitle:](v2, "setPasscodeRecoveryDisabledTitle:", v15);

  objc_msgSend(*(id *)(a1 + 40), "allowedPasscodeTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setAllowedPasscodeTypes:](v2, "setAllowedPasscodeTypes:", v16);

  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoveryOptionVisible:](v2, "setIsPasscodeRecoveryOptionVisible:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isPasscodeRecoveryOptionVisible"));
  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoveryMessageHidden:](v2, "setIsPasscodeRecoveryMessageHidden:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isPasscodeRecoveryMessageHidden"));
  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoverySupported:](v2, "setIsPasscodeRecoverySupported:", objc_msgSend(*(id *)(a1 + 40), "isPasscodeRecoverySupported"));
  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoveryRestricted:](v2, "setIsPasscodeRecoveryRestricted:", objc_msgSend(*(id *)(a1 + 40), "isPasscodeRecoveryRestricted"));
  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoveryEnabled:](v2, "setIsPasscodeRecoveryEnabled:", objc_msgSend(*(id *)(a1 + 40), "isPasscodeRecoveryEnabled"));
  +[LALocalizedString passcodeChangeNewPasscodeVerify](LALocalizedString, "passcodeChangeNewPasscodeVerify");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setVerifyPrompt:](v2, "setVerifyPrompt:", v17);

  +[LALocalizedString passcodeChangeDone](LALocalizedString, "passcodeChangeDone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewControllerInput setVerifyNextButton:](v2, "setVerifyNextButton:", v18);

  return v2;
}

void __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  LAPSFetchNewPasscodeResult *v7;
  void *v8;
  LAPSFetchNewPasscodeResult *v9;
  unint64_t v10;

  v10 = a2;
  v5 = a3;
  if (!(v10 | v5))
    __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_3_cold_1();
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD, unint64_t))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    v7 = [LAPSFetchNewPasscodeResult alloc];
    objc_msgSend((id)v10, "passcode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LAPSFetchNewPasscodeResult initWithPasscode:isPasscodeRecoveryEnabled:](v7, "initWithPasscode:isPasscodeRecoveryEnabled:", v8, objc_msgSend((id)v10, "isPasscodeRecoveryEnabled"));
    (*(void (**)(uint64_t, LAPSFetchNewPasscodeResult *, _QWORD))(v6 + 16))(v6, v9, 0);

  }
}

- (void)deactivateWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[LAPSPasscodeChangeUIPresentationController dismissWithCompletion:](self->_presentationController, "dismissWithCompletion:", v4);

}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v13, v12, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD3A8];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __79__LAPSPasscodeChangeUIAdapter_presentAlertWithTitle_message_button_completion___block_invoke;
  v18[3] = &unk_24FDCDEC0;
  v19 = v10;
  v16 = v10;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v11, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAction:", v17);
  -[LAPSPasscodeChangeUIPresentationController presentAlertVC:](self->_presentationController, "presentAlertVC:", v14);

}

uint64_t __79__LAPSPasscodeChangeUIAdapter_presentAlertWithTitle_message_button_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchOldPasscodeViewController:(id)a3 verifyPasscode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[LAPSPasscodeChangeUIAdapter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__LAPSPasscodeChangeUIAdapter_fetchOldPasscodeViewController_verifyPasscode___block_invoke;
  v11[3] = &unk_24FDCDF10;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "passcodeChangeUI:verifyPasscode:completion:", self, v9, v11);

}

void __77__LAPSPasscodeChangeUIAdapter_fetchOldPasscodeViewController_verifyPasscode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithPasscode:", *(_QWORD *)(a1 + 40));
    goto LABEL_16;
  }
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain")))
  {

    goto LABEL_13;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 4)
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
    goto LABEL_16;
  }
  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LAPSFailedAttemptsErrorKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &unk_24FDDD9D0;
  v9 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v3, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LAPSBackOffTimeoutErrorKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_24FDDD9D0;
  v14 = v13;

  if (v9 < 1)
  {
    v15 = &stru_24FDCE800;
  }
  else
  {
    +[LALocalizedString passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:](LALocalizedString, "passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:", v9);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__LAPSPasscodeChangeUIAdapter_fetchOldPasscodeViewController_verifyPasscode___block_invoke_23;
  v18[3] = &unk_24FDCDEE8;
  v19 = v14;
  v20 = v16;
  v17 = v14;
  objc_msgSend(v16, "showPasscodeValidationError:completion:", v15, v18);

LABEL_16:
}

uint64_t __77__LAPSPasscodeChangeUIAdapter_fetchOldPasscodeViewController_verifyPasscode___block_invoke_23(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  if (result >= 1)
    return objc_msgSend(*(id *)(a1 + 40), "startBackoffWithTimeout:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  return result;
}

- (id)fetchOldPasscodeViewController:(id)a3 backoffMessageForTimeout:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", vcvtpd_s64_f64((double)a4 / 60.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 <= 1)
    v6 = 1;
  else
    v6 = v5;
  return +[LALocalizedString passcodeChangeBackoffMessage:](LALocalizedString, "passcodeChangeBackoffMessage:", v6);
}

- (void)fetchNewPasscodeViewController:(id)a3 verifyPasscode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[LAPSPasscodeChangeUIAdapter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke;
  v11[3] = &unk_24FDCDF60;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "passcodeChangeUI:verifyNewPasscode:completion:", self, v10, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (!v3)
    {
      objc_msgSend(a1[4], "continueWithPasscode:", a1[5]);
      goto LABEL_15;
    }
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain")))
    {
      v6 = objc_msgSend(v3, "code");

      if (v6 == 9)
        goto LABEL_14;
      objc_msgSend(v3, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain")))
      {
        v8 = objc_msgSend(v3, "code");

        if (v8 == 6)
        {
          v14[0] = MEMORY[0x24BDAC760];
          v14[1] = 3221225472;
          v14[2] = __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke_2;
          v14[3] = &unk_24FDCD5F0;
          v15 = a1[4];
          objc_msgSend(WeakRetained, "_presentPasscodeDoesNotMeetRequirementsError:completion:", v3, v14);

          goto LABEL_15;
        }
      }
      else
      {

      }
      objc_msgSend(v3, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain")))
      {
        v9 = objc_msgSend(v3, "code");

        if (v9 == 5)
        {
          v10[0] = MEMORY[0x24BDAC760];
          v10[1] = 3221225472;
          v10[2] = __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke_3;
          v10[3] = &unk_24FDCDF38;
          objc_copyWeak(&v13, a1 + 6);
          v11 = a1[4];
          v12 = a1[5];
          objc_msgSend(WeakRetained, "_presentPasscodeIsTooSimpleErrorWithCompletion:", v10);

          objc_destroyWeak(&v13);
          goto LABEL_15;
        }
LABEL_14:
        objc_msgSend(a1[4], "finishWithError:", v3);
        goto LABEL_15;
      }
    }

    goto LABEL_14;
  }
LABEL_15:

}

uint64_t __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clear");
}

void __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = *(void **)(a1 + 32);
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "continueWithPasscode:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v5, "clear");
    WeakRetained = v6;
  }

}

- (void)fetchNewPasscodeViewController:(id)a3 verifyPasscode:(id)a4 matchesPasscode:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isEqual:", a5) & 1) != 0)
  {
    objc_msgSend(v8, "finishWithPasscode:", v9);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __93__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode_matchesPasscode___block_invoke;
    v10[3] = &unk_24FDCD5F0;
    v11 = v8;
    -[LAPSPasscodeChangeUIAdapter _presentPasscodesDidNotMatchErrorWithCompletion:](self, "_presentPasscodesDidNotMatchErrorWithCompletion:", v10);

  }
}

uint64_t __93__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode_matchesPasscode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restart");
}

- (void)containerViewControllerViewDidDisappear:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogPasscodeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_22FE91000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did disappear", (uint8_t *)&v7, 0xCu);
  }

  -[LAPSPasscodeChangeUIAdapter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passcodeChangeUIDidDisappear:", self);

}

- (void)_presentPasscodeIsTooSimpleErrorWithCompletion:(id)a3
{
  id v4;
  LAPSPasscodeChangeUIPresentationController *presentationController;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  presentationController = self->_presentationController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke;
  v8[3] = &unk_24FDCDF88;
  v9 = v4;
  v7 = v4;
  __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke((uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeUIPresentationController presentAlertVC:](presentationController, "presentAlertVC:", v6);

}

id __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v2 = (void *)MEMORY[0x24BEBD3B0];
  +[LALocalizedString passcodeChangeErrorPasscodeIsTooEasyTitle](LALocalizedString, "passcodeChangeErrorPasscodeIsTooEasyTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LALocalizedString passcodeChangeErrorPasscodeIsTooEasyText](LALocalizedString, "passcodeChangeErrorPasscodeIsTooEasyText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3A8];
  +[LALocalizedString passcodeChangeUseAnyway](LALocalizedString, "passcodeChangeUseAnyway");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke_2;
  v19[3] = &unk_24FDCDEC0;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  v10 = (void *)MEMORY[0x24BEBD3A8];
  +[LALocalizedString passcodeChangeUseDifferentPasscode](LALocalizedString, "passcodeChangeUseDifferentPasscode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15 = 3221225472;
  v16 = __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke_3;
  v17 = &unk_24FDCDEC0;
  v18 = *(id *)(a1 + 32);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v12, v14, v15, v16, v17);

  return v5;
}

uint64_t __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentPasscodeDoesNotMeetRequirementsError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeChangeUIPresentationController *presentationController;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  presentationController = self->_presentationController;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke;
  v12[3] = &unk_24FDCDFB0;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v11 = v6;
  __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke((uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeUIPresentationController presentAlertVC:](presentationController, "presentAlertVC:", v10);

}

id __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v2 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_2;
  v17[3] = &unk_24FDCD438;
  v18 = *(id *)(a1 + 32);
  __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_2((uint64_t)v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD3B0];
  +[LALocalizedString passcodeChangeErrorPasscodeDoesNotMeetRequirementsTitle](LALocalizedString, "passcodeChangeErrorPasscodeDoesNotMeetRequirementsTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v3, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[LALocalizedString passcodeChangeErrorPasscodeDoesNotMeetRequirementsText](LALocalizedString, "passcodeChangeErrorPasscodeDoesNotMeetRequirementsText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = (void *)MEMORY[0x24BEBD3A8];
  +[LALocalizedString passcodeChangeUseDifferentPasscode](LALocalizedString, "passcodeChangeUseDifferentPasscode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v2;
  v13 = 3221225472;
  v14 = __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_3;
  v15 = &unk_24FDCDEC0;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10, v12, v13, v14, v15);

  return v6;
}

id __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    if (objc_msgSend(v3, "length"))
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }

  return v5;
}

uint64_t __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentPasscodesDidNotMatchErrorWithCompletion:(id)a3
{
  id v4;
  LAPSPasscodeChangeUIPresentationController *presentationController;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  presentationController = self->_presentationController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke;
  v8[3] = &unk_24FDCDF88;
  v9 = v4;
  v7 = v4;
  __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke((uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeUIPresentationController presentAlertVC:](presentationController, "presentAlertVC:", v6);

}

id __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v2 = (void *)MEMORY[0x24BEBD3B0];
  +[LALocalizedString passcodeChangeErrorNewPasscodeMismatchTitle](LALocalizedString, "passcodeChangeErrorNewPasscodeMismatchTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LALocalizedString passcodeChangeErrorNewPasscodeMismatchText](LALocalizedString, "passcodeChangeErrorNewPasscodeMismatchText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3A8];
  +[LALocalizedString tryAgain](LALocalizedString, "tryAgain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke_2;
  v10[3] = &unk_24FDCDEC0;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  return v5;
}

uint64_t __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (LAPSPasscodeChangeUIDelegate)delegate
{
  return (LAPSPasscodeChangeUIDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
}

void __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_3_cold_1()
{
  __assert_rtn("-[LAPSPasscodeChangeUIAdapter fetchOldPasscode:completion:]_block_invoke_3", "LAPSPasscodeChangeUIAdapter.m", 67, "output != nil || error != nil");
}

void __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_3_cold_1()
{
  __assert_rtn("-[LAPSPasscodeChangeUIAdapter fetchNewPasscode:completion:]_block_invoke_3", "LAPSPasscodeChangeUIAdapter.m", 110, "output != nil || error != nil");
}

@end
