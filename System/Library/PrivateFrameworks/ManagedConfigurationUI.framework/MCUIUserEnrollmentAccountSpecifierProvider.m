@implementation MCUIUserEnrollmentAccountSpecifierProvider

+ (id)titleForAccountSummaryGroup
{
  return MCUILocalizedString(CFSTR("ACCOUNT"));
}

+ (id)labelTextForAccountSummaryCell
{
  if (_os_feature_enabled_impl())
    return MCUILocalizedString(CFSTR("APPLE_ACCOUNT"));
  else
    return MCUILocalizedString(CFSTR("APPLE_ID"));
}

+ (id)warningTextForAccountDeletion
{
  return MCUILocalizedStringByDevice(CFSTR("ACCOUNT_DELETION_WARNING"));
}

+ (id)deleteAccountGroupFooterText
{
  return MCUILocalizedString(CFSTR("DELETE_ACCOUNT_WARNING"));
}

- (void)preflightsAccountDeletion:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (objc_msgSend(v12, "mc_isUserEnrollmentAccount")
    && objc_msgSend(v12, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE0])
    && (objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isPasscodeSet"),
        v10,
        (v11 & 1) != 0))
  {
    -[MCUIUserEnrollmentAccountSpecifierProvider _verifyDevicePasscodeWithPresentingViewController:completionHandler:](self, "_verifyDevicePasscodeWithPresentingViewController:completionHandler:", v8, v9);
  }
  else if (v9)
  {
    v9[2](v9, 1);
  }

}

- (void)_verifyDevicePasscodeWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke;
  block[3] = &unk_1EA2B6440;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v2);
  objc_msgSend(v3, "setModalInPresentation:", 1);
  if (MCUIIsiPad())
    objc_msgSend(v3, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v3, 1, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_2;
  v6[3] = &unk_1EA2B65C0;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "setDevicePasscodeVerificationCompletionHandler:", v6);

}

void __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_3;
  block[3] = &unk_1EA2B6598;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_4;
  v3[3] = &unk_1EA2B6570;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[MCUIUserEnrollmentAccountSpecifierProvider devicePasscodeVerificationCompletionHandler](self, "devicePasscodeVerificationCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCUIUserEnrollmentAccountSpecifierProvider devicePasscodeVerificationCompletionHandler](self, "devicePasscodeVerificationCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1);

    -[MCUIUserEnrollmentAccountSpecifierProvider setDevicePasscodeVerificationCompletionHandler:](self, "setDevicePasscodeVerificationCompletionHandler:", 0);
  }
}

- (void)didCancelEnteringPIN
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  -[MCUIUserEnrollmentAccountSpecifierProvider devicePasscodeVerificationCompletionHandler](self, "devicePasscodeVerificationCompletionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCUIUserEnrollmentAccountSpecifierProvider devicePasscodeVerificationCompletionHandler](self, "devicePasscodeVerificationCompletionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

    -[MCUIUserEnrollmentAccountSpecifierProvider setDevicePasscodeVerificationCompletionHandler:](self, "setDevicePasscodeVerificationCompletionHandler:", 0);
  }
}

- (id)devicePasscodeVerificationCompletionHandler
{
  return self->_devicePasscodeVerificationCompletionHandler;
}

- (void)setDevicePasscodeVerificationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_devicePasscodeVerificationCompletionHandler, 0);
}

@end
