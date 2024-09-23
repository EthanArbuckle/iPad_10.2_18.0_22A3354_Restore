@implementation CDPToolFakeUIProvider

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  void *v5;
  void (**v6)(id, CDPLocalSecret *, _QWORD);
  void *v7;
  uint64_t v8;
  CDPLocalSecret *v9;
  int v10;

  v10 = 0;
  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = (void (**)(id, CDPLocalSecret *, _QWORD))a4;
  objc_msgSend(v5, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlockScreenTypeWithOutSimplePasscodeType:", &v10);

  if (v10 == -1)
    v8 = 3;
  else
    v8 = 2;
  v9 = -[CDPLocalSecret initWithValidatedSecret:secretType:]([CDPLocalSecret alloc], "initWithValidatedSecret:secretType:", self->_localSecret, v8);
  v6[2](v6, v9, 0);

}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSString *remoteSecret;
  id v14;
  NSString *recoveryKey;
  _QWORD v16[4];
  id v17;
  CDPToolFakeUIProvider *v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  remoteSecret = self->_remoteSecret;
  if (remoteSecret)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke;
    v24[3] = &unk_24C7C1948;
    v25 = v11;
    objc_msgSend(v25, "validateSecret:devices:type:withCompletion:", remoteSecret, v10, 2, v24);
    v14 = v25;
  }
  else
  {
    recoveryKey = self->_recoveryKey;
    if (!recoveryKey)
    {
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_3;
      v16[3] = &unk_24C7C1970;
      objc_copyWeak(&v20, &location);
      v17 = v12;
      v18 = self;
      v19 = v9;
      objc_msgSend(v17, "supportedEscapeOfferMaskCompletion:", v16);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_2;
    v22[3] = &unk_24C7C1948;
    v23 = v11;
    objc_msgSend(v23, "validateRecoveryKey:withCompletion:", recoveryKey, v22);
    v14 = v23;
  }

LABEL_6:
}

uint64_t __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke(uint64_t result, char a2)
{
  uint64_t v2;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    puts("Remote secret is invalid... cancelling prompt/validation");
    return objc_msgSend(*(id *)(v2 + 32), "cancelValidationWithError:", 0);
  }
  return result;
}

uint64_t __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    puts("Recovery key is invalid... cancelling prompt/validation");
    return objc_msgSend(*(id *)(v2 + 32), "cancelValidationWithError:", 0);
  }
  return result;
}

void __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ((a2 & 0x40) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "showRecoveryContactStartingScreen:validator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    }
    puts("A remote secret or recovery key is required to attempt backup recovery (use -remote <secret> OR -mk <recoveryKey>)");
  }
  objc_msgSend(*(id *)(a1 + 32), "cancelValidationWithError:", 0);
LABEL_6:

}

- (void)showCustodianOSInstructionScreen:(id)a3 validator:(id)a4
{
  id v6;
  id v7;
  CDPCustodianRecoveryController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CDPCustodianRecoveryController initWithContext:]([CDPCustodianRecoveryController alloc], "initWithContext:", v7);
  -[CDPCustodianRecoveryController startRecoverySessionWithCompletion:](v8, "startRecoverySessionWithCompletion:", &__block_literal_global_10);
  -[CDPToolFakeUIProvider showCustodianProvidedCodeEntryScreen:controller:validator:](self, "showCustodianProvidedCodeEntryScreen:controller:validator:", v7, v8, v6);

}

void __68__CDPToolFakeUIProvider_showCustodianOSInstructionScreen_validator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Custodian recovery session started sessionID: %@, error: %@\", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)showCustodianProvidedCodeEntryScreen:(id)a3 controller:(id)a4 validator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _BYTE v13[100];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  printf("Enter the recovery code provided by your custodian: ");
  scanf("%s", v13);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke;
  v11[3] = &unk_24C7C19E0;
  v12 = v7;
  v10 = v7;
  -[CDPToolFakeUIProvider validateCode:controller:completion:](self, "validateCode:controller:completion:", v9, v8, v11);

}

void __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(a3, "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Error: %s\n", (const char *)objc_msgSend(v6, "UTF8String"));

  }
  else
  {
    puts("Recovery code validated.");
    puts("Validating recovery info...");
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_2;
    v8[3] = &unk_24C7C19B8;
    v9 = 0;
    objc_msgSend(v7, "validateCustodianRecoveryInfo:withCompletion:", v5, v8);

  }
}

void __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "@\"Custodian recovery info validated, safe to dismiss the view\", buf, 2u);
    }

    puts("Recovery completed");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_2_cold_1(a1, v7);

    objc_msgSend(v5, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Recovery failed with error: %s", (const char *)objc_msgSend(v8, "UTF8String"));

  }
}

- (void)validateCode:(id)a3 controller:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  puts("Validating the recovery code...");
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__CDPToolFakeUIProvider_validateCode_controller_completion___block_invoke;
  v13[3] = &unk_24C7C1A08;
  objc_copyWeak(&v16, &location);
  v11 = v10;
  v15 = v11;
  v12 = v9;
  v14 = v12;
  objc_msgSend(v12, "validateRecoveryCode:withCompletion:", v8, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __60__CDPToolFakeUIProvider_validateCode_controller_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[16];

  v11[15] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v6, "code") == -9002)
    {
      puts("The recovery code is not valid");
      printf("Reenter the recovery code provided by your custodian: ");
      scanf("%s", v11);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "validateCode:controller:completion:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "context");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPeersForRemoteApproval");

  -[CDPToolFakeUIProvider cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:](self, "cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", v12, v9, v11, v8);
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  id v8;
  void *v9;
  NSString *icsc;
  _QWORD v11[4];
  id v12;

  v8 = a7;
  v9 = v8;
  icsc = self->_icsc;
  if (icsc)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __96__CDPToolFakeUIProvider_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke;
    v11[3] = &unk_24C7C1948;
    v12 = v8;
    objc_msgSend(v12, "validateSecret:devices:type:withCompletion:", icsc, 0, 0, v11);

  }
  else
  {
    puts("An iCSC is required to attempt backup recovery (use -icsc <iCSC>)");
    objc_msgSend(v9, "cancelValidationWithError:", 0);
  }

}

uint64_t __96__CDPToolFakeUIProvider_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke(uint64_t result, char a2)
{
  uint64_t v2;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    puts("ICSC is invalid... cancelling prompt/validation");
    return objc_msgSend(*(id *)(v2 + 32), "cancelValidationWithError:", 0);
  }
  return result;
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[CDPToolFakeUIProvider recoveryKey](self, "recoveryKey");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "confirmRecoveryKey:completion:", v9, v7);

}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  if (a4)
    (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4
{
  id v6;
  id v7;

  if (a4)
  {
    v6 = a4;
    -[CDPToolFakeUIProvider accessKey](self, "accessKey");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a4 + 2))(v6, v7, 0);

  }
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  CDPRecoveryKeySecretValidatorProxyImpl *v9;
  NSString *recoveryKey;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = -[CDPRecoveryKeySecretValidatorProxyImpl initWithRemoteObject:]([CDPRecoveryKeySecretValidatorProxyImpl alloc], "initWithRemoteObject:", v7);
  recoveryKey = self->_recoveryKey;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__CDPToolFakeUIProvider_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke;
  v13[3] = &unk_24C7C1700;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  -[CDPRecoveryKeySecretValidatorProxyImpl validateRecoveryKey:withCompletion:](v9, "validateRecoveryKey:withCompletion:", recoveryKey, v13);

}

void __87__CDPToolFakeUIProvider_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v5, "cancelValidationWithError:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)localSecret
{
  return self->_localSecret;
}

- (void)setLocalSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)remoteSecret
{
  return self->_remoteSecret;
}

- (void)setRemoteSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)icsc
{
  return self->_icsc;
}

- (void)setIcsc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AKInheritanceAccessKey)accessKey
{
  return self->_accessKey;
}

- (void)setAccessKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_icsc, 0);
  objc_storeStrong((id *)&self->_remoteSecret, 0);
  objc_storeStrong((id *)&self->_localSecret, 0);
}

void __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "@\"Custodian recovery info failed validation with error: %@\", (uint8_t *)&v3, 0xCu);
}

@end
