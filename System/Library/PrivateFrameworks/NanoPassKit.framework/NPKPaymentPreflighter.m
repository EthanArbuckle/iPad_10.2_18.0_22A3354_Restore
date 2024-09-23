@implementation NPKPaymentPreflighter

+ (BOOL)watchConnected
{
  int v2;
  id v3;
  const __CFString *v4;
  void *v5;
  char v6;

  v2 = NPKIsRunningInNPKCompanionAgent();
  v3 = objc_alloc(MEMORY[0x24BE4FCB8]);
  if (v2)
    v4 = CFSTR("com.apple.private.alloy.passbook.maintenance");
  else
    v4 = CFSTR("com.apple.private.alloy.passbook.provisioning");
  v5 = (void *)objc_msgSend(v3, "initWithService:", v4);
  v6 = NPKIsConnectedToPairedOrPairingDeviceFromService(v5);

  return v6;
}

- (NPKPaymentPreflighter)initWithWebService:(id)a3 targetDevice:(id)a4 companionAgentConnection:(id)a5
{
  id v9;
  id v10;
  id v11;
  NPKPaymentPreflighter *v12;
  NPKPaymentPreflighter *v13;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  objc_super v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPKPaymentPreflighter;
  v12 = -[NPKPaymentPreflighter init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_webService, a3);
    objc_storeWeak((id *)&v13->_targetDevice, v10);
    objc_storeStrong((id *)&v13->_companionAgentConnection, a5);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v14 = (void *)getPUConnectionClass_softClass;
    v25 = getPUConnectionClass_softClass;
    if (!getPUConnectionClass_softClass)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __getPUConnectionClass_block_invoke;
      v21[3] = &unk_24CFE81D0;
      v21[4] = &v22;
      __getPUConnectionClass_block_invoke((uint64_t)v21);
      v14 = (void *)v23[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v22, 8);
    v16 = objc_alloc_init(v15);
    -[NPKPaymentPreflighter setPasscodeConnection:](v13, "setPasscodeConnection:", v16);
    v17 = objc_alloc(MEMORY[0x24BE6B528]);
    v18 = (void *)objc_msgSend(v17, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    -[NPKPaymentPreflighter setSystemSettingsManager:](v13, "setSystemSettingsManager:", v18);
    v13->_needsSetAuthRandom = 1;

  }
  return v13;
}

- (void)addCardPreflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__NPKPaymentPreflighter_addCardPreflightWithCompletion___block_invoke;
  v6[3] = &unk_24CFE7E90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __56__NPKPaymentPreflighter_addCardPreflightWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setPreflighting:", 1);
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setPreflightCompletionHandler:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_checkSpaceAvailableOnSecureElement");
  objc_msgSend(*(id *)(a1 + 32), "_checkWatchConnected");
  objc_msgSend(*(id *)(a1 + 32), "_checkCompanioniCloudAccount");
  objc_msgSend(*(id *)(a1 + 32), "_checkWatchiCloudAccount");
  objc_msgSend(*(id *)(a1 + 32), "_checkPasscodeEnabledAndUnlockedState");
  objc_msgSend(*(id *)(a1 + 32), "_checkWristDetectEnabledState");
  return objc_msgSend(*(id *)(a1 + 32), "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
}

- (void)transferToCompanionPreflightWithCompletion:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id *v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "watchConnected");
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Transfer to companion preflight: watch is connected", buf, 2u);
      }

    }
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __68__NPKPaymentPreflighter_transferToCompanionPreflightWithCompletion___block_invoke;
    v17[3] = &unk_24CFE7B00;
    v9 = &v18;
    v18 = v4;
    v10 = v4;
    v11 = MEMORY[0x24BDAC9B8];
    v12 = v17;
  }
  else
  {
    if (v7)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Transfer to companion preflight: watch is not connected", buf, 2u);
      }

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__NPKPaymentPreflighter_transferToCompanionPreflightWithCompletion___block_invoke_37;
    block[3] = &unk_24CFE9188;
    v9 = &v16;
    block[4] = self;
    v16 = v4;
    v14 = v4;
    v11 = MEMORY[0x24BDAC9B8];
    v12 = block;
  }
  dispatch_async(v11, v12);

}

uint64_t __68__NPKPaymentPreflighter_transferToCompanionPreflightWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__NPKPaymentPreflighter_transferToCompanionPreflightWithCompletion___block_invoke_37(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_errorForConnectionIssue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)addSecureElementPassPreflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__NPKPaymentPreflighter_addSecureElementPassPreflightWithCompletion___block_invoke;
  v6[3] = &unk_24CFE7E90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __69__NPKPaymentPreflighter_addSecureElementPassPreflightWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setPreflighting:", 1);
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setPreflightCompletionHandler:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_checkSpaceAvailableOnSecureElement");
  objc_msgSend(*(id *)(a1 + 32), "_checkWatchConnected");
  objc_msgSend(*(id *)(a1 + 32), "_checkCompanioniCloudAccount");
  objc_msgSend(*(id *)(a1 + 32), "_checkWatchiCloudAccount");
  objc_msgSend(*(id *)(a1 + 32), "_checkPasscodeEnabledState");
  objc_msgSend(*(id *)(a1 + 32), "_checkWristDetectEnabledState");
  return objc_msgSend(*(id *)(a1 + 32), "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
}

- (void)addBiometricPassPreflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__NPKPaymentPreflighter_addBiometricPassPreflightWithCompletion___block_invoke;
  v6[3] = &unk_24CFE7E90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __65__NPKPaymentPreflighter_addBiometricPassPreflightWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setPreflighting:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsSetAuthRandom:", 0);
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setPreflightCompletionHandler:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_checkSpaceAvailableOnSecureElement");
  objc_msgSend(*(id *)(a1 + 32), "_checkWatchConnected");
  objc_msgSend(*(id *)(a1 + 32), "_checkCompanioniCloudAccount");
  objc_msgSend(*(id *)(a1 + 32), "_checkWatchiCloudAccount");
  objc_msgSend(*(id *)(a1 + 32), "_checkPasscodeEnabledAndUnlockedState");
  objc_msgSend(*(id *)(a1 + 32), "_checkWristDetectEnabledState");
  return objc_msgSend(*(id *)(a1 + 32), "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
}

- (void)_checkSpaceAvailableOnSecureElement
{
  void *v3;
  _QWORD v4[5];

  if (PKEnableDynamicSEAllocation())
  {
    -[NPKPaymentPreflighter setSpaceAvailableOnSecureElement:](self, "setSpaceAvailableOnSecureElement:", 1);
    -[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:](self, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
  }
  else
  {
    -[NPKPaymentPreflighter companionAgentConnection](self, "companionAgentConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __60__NPKPaymentPreflighter__checkSpaceAvailableOnSecureElement__block_invoke;
    v4[3] = &unk_24CFE9738;
    v4[4] = self;
    objc_msgSend(v3, "paymentPassUniqueIDsSynchronous:excludingDeactivated:reply:", 0, 1, v4);

  }
}

void __60__NPKPaymentPreflighter__checkSpaceAvailableOnSecureElement__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__NPKPaymentPreflighter__checkSpaceAvailableOnSecureElement__block_invoke_2;
  v6[3] = &unk_24CFE7E40;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __60__NPKPaymentPreflighter__checkSpaceAvailableOnSecureElement__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = NPKMaxPaymentCards();
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  v6 = v4 || v2 < v3;
  objc_msgSend(*(id *)(a1 + 40), "setSpaceAvailableOnSecureElement:", v6);
  if ((_DWORD)v6 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD16F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", NPKMaxPaymentCards());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringFromNumber:numberStyle:", v8, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    PKLocalizedPaymentString(CFSTR("DEVICE_PROVISIONING_EXCEEDED_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("DEVICE_PROVISIONING_EXCEEDED_MESSAGE"), CFSTR("%@"), v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 0, v11);

  }
}

- (void)_checkWatchConnected
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Checking watch connected state…", buf, 2u);
    }

  }
  v6 = objc_msgSend((id)objc_opt_class(), "watchConnected");
  -[NPKPaymentPreflighter setWatchConnected:](self, "setWatchConnected:", v6);
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v6)
  {
    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: gizmo connected", v13, 2u);
      }

    }
    -[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:](self, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
  }
  else
  {
    if (v8)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: gizmo not connected", v12, 2u);
      }

    }
    -[NPKPaymentPreflighter _errorForConnectionIssue](self, "_errorForConnectionIssue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:](self, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 0, v11);

  }
}

- (void)_checkCompanioniCloudAccount
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Checking companion iCloud account state…", buf, 2u);
    }

  }
  v6 = PKHasVerifiedPrimaryAppleAccount();
  -[NPKPaymentPreflighter setNeedsCompanioniCloudAccount:](self, "setNeedsCompanioniCloudAccount:", v6 == 0);
  -[NPKPaymentPreflighter setCheckedCompanioniCloudStatus:](self, "setCheckedCompanioniCloudStatus:", 1);
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: has companion account", v13, 2u);
      }

    }
    -[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:](self, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
  }
  else
  {
    if (v8)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: does not have companion account", v12, 2u);
      }

    }
    -[NPKPaymentPreflighter _errorForCompanionAccountNeeded](self, "_errorForCompanionAccountNeeded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:](self, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 0, v11);

  }
}

- (void)_checkWatchiCloudAccount
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id buf[2];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Checking watch iCloud account state…", (uint8_t *)buf, 2u);
    }

  }
  if (NPKIsCurrentlyPairing())
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Device is pairing", (uint8_t *)buf, 2u);
      }

    }
    -[NPKPaymentPreflighter setCheckedWatchiCloudStatus:](self, "setCheckedWatchiCloudStatus:", 1);
    -[NPKPaymentPreflighter setNeedsWatchiCloudAccount:](self, "setNeedsWatchiCloudAccount:", 0);
LABEL_17:
    -[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:](self, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
    return;
  }
  if (NPKPairedOrPairingDeviceIsTinker())
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Tinker devices are always signed in to iCloud.", (uint8_t *)buf, 2u);
      }

    }
    -[NPKPaymentPreflighter setNeedsWatchiCloudAccount:](self, "setNeedsWatchiCloudAccount:", 0);
    -[NPKPaymentPreflighter setCheckedWatchiCloudStatus:](self, "setCheckedWatchiCloudStatus:", 1);
    goto LABEL_17;
  }
  objc_initWeak(buf, self);
  -[NPKPaymentPreflighter systemSettingsManager](self, "systemSettingsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__NPKPaymentPreflighter__checkWatchiCloudAccount__block_invoke;
  v13[3] = &unk_24CFE9760;
  objc_copyWeak(&v14, buf);
  v13[4] = self;
  objc_msgSend(v12, "getiCloudInfo:", v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

void __49__NPKPaymentPreflighter__checkWatchiCloudAccount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  char v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v5;
      v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Got iCloud info: %@ %@", buf, 0x16u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (!v6)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDB4398]);
    objc_msgSend(v12, "aa_primaryAppleAccount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "aa_personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE6B538]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v26 = v12;
      v27 = v5;
      v17 = *(_QWORD *)v30;
      v18 = *MEMORY[0x24BE6B530];
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          pk_Payment_log();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

          if (v22)
          {
            pk_Payment_log();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v35 = v20;
              v36 = 2112;
              v37 = v28;
              _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Person ID: %@ Local account: %@", buf, 0x16u);
            }

          }
          v24 = objc_msgSend(v20, "isEqualToString:", v13);

          if ((v24 & 1) != 0)
          {
            v25 = 0;
            goto LABEL_22;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v16)
          continue;
        break;
      }
      v25 = 1;
LABEL_22:
      v6 = 0;
      v5 = v27;
      v12 = v26;
    }
    else
    {
      v25 = 1;
    }

    objc_msgSend(v11, "setNeedsWatchiCloudAccount:", v25);
    objc_msgSend(v11, "setCheckedWatchiCloudStatus:", 1);
    objc_msgSend(v11, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);

    goto LABEL_25;
  }
  if ((objc_msgSend(WeakRetained, "checkedWatchiCloudStatus") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorForConnectionIssue");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 0, v12);
LABEL_25:

  }
}

- (void)_checkPasscodeEnabledAndUnlockedState
{
  -[NPKPaymentPreflighter _checkPasscodeEnabledAndUnlockedStateRequiringPasscode:requiringUnlock:](self, "_checkPasscodeEnabledAndUnlockedStateRequiringPasscode:requiringUnlock:", 1, 1);
}

- (void)_checkPasscodeEnabledState
{
  -[NPKPaymentPreflighter _checkPasscodeEnabledAndUnlockedStateRequiringPasscode:requiringUnlock:](self, "_checkPasscodeEnabledAndUnlockedStateRequiringPasscode:requiringUnlock:", 1, 0);
}

- (void)_checkPasscodeEnabledAndUnlockedStateRequiringPasscode:(BOOL)a3 requiringUnlock:(BOOL)a4
{
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int IsTinker;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  dispatch_time_t v26;
  _QWORD block[4];
  id v28;
  NPKPaymentPreflighter *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  BOOL v36;
  BOOL v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NPKIsCurrentlyPairing();
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Device is pairing", buf, 2u);
      }

    }
    -[NPKPaymentPreflighter setCheckedWatchPasscodeAndUnlockedStatus:](self, "setCheckedWatchPasscodeAndUnlockedStatus:", 1);
    -[NPKPaymentPreflighter setNeedsPasscode:](self, "setNeedsPasscode:", 0);
    -[NPKPaymentPreflighter setNeedsUnlock:](self, "setNeedsUnlock:", 0);
    -[NPKPaymentPreflighter setAuthRandomSetIfNecessary:](self, "setAuthRandomSetIfNecessary:", 1);
    -[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:](self, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
  }
  else
  {
    if (v10)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v7;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Checking passcode enabled and unlocked state with query date: %@", buf, 0xCu);
      }

    }
    -[NPKPaymentPreflighter setWatchPasscodeAndUnlockedQueryDate:](self, "setWatchPasscodeAndUnlockedQueryDate:", v7);
    v13 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke;
    v35[3] = &unk_24CFE97B0;
    v35[4] = self;
    v36 = a3;
    v37 = a4;
    v14 = (void *)MEMORY[0x2199B6780](v35);
    IsTinker = NPKPairedOrPairingDeviceIsTinker();
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (IsTinker)
    {
      if (v17)
      {
        pk_Payment_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Fetching passcode state for tinker device", buf, 2u);
        }

      }
      -[NPKPaymentPreflighter webService](self, "webService");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "targetDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = v20;
      }
      else
      {
        -[NPKPaymentPreflighter targetDevice](self, "targetDevice");
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v22;

      v33[0] = v13;
      v33[1] = 3221225472;
      v33[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_51;
      v33[3] = &unk_24CFE97D8;
      v34 = v14;
      objc_msgSend(v25, "fetchRemoteDevicePasscodeStateWithCompletion:", v33);

    }
    else
    {
      if (v17)
      {
        pk_Payment_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Fetching passcode state for classic device", buf, 2u);
        }

      }
      -[NPKPaymentPreflighter passcodeConnection](self, "passcodeConnection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v13;
      v31[1] = 3221225472;
      v31[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_52;
      v31[3] = &unk_24CFE9800;
      v32 = v14;
      objc_msgSend(v24, "getRemoteDeviceState:", v31);

      v25 = v32;
    }

    objc_initWeak((id *)buf, self);
    v26 = dispatch_time(0, 45000000000);
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_2_54;
    block[3] = &unk_24CFE8650;
    objc_copyWeak(&v30, (id *)buf);
    v28 = v7;
    v29 = self;
    dispatch_after(v26, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
}

void __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  char v13;
  char v14;
  __int16 v15;

  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_2;
  block[3] = &unk_24CFE9788;
  v13 = a2;
  v14 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v15 = *(_WORD *)(a1 + 40);
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  _BOOL8 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 48);
      v6 = *(unsigned __int8 *)(a1 + 49);
      v7 = *(_QWORD *)(a1 + 32);
      v15[0] = 67109634;
      v15[1] = v5;
      v16 = 1024;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: passcode enabled %d device passcode locked %d error %@", (uint8_t *)v15, 0x18u);
    }

  }
  if (*(_QWORD *)(a1 + 32))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "checkedWatchPasscodeAndUnlockedStatus") & 1) == 0)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v8, "_errorForConnectionIssue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 0, v9);

    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 50))
      v10 = *(_BYTE *)(a1 + 48) == 0;
    else
      v10 = 0;
    objc_msgSend(*(id *)(a1 + 40), "setNeedsPasscode:", v10);
    if (*(_BYTE *)(a1 + 51))
      v11 = *(_BYTE *)(a1 + 49) != 0;
    else
      v11 = 0;
    objc_msgSend(*(id *)(a1 + 40), "setNeedsUnlock:", v11);
    objc_msgSend(*(id *)(a1 + 40), "setCheckedWatchPasscodeAndUnlockedStatus:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
    if ((objc_msgSend(*(id *)(a1 + 40), "needsPasscode") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 40), "needsUnlock") & 1) == 0)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        pk_Payment_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Setting auth random if necessary…", (uint8_t *)v15, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "_setAuthRandomIfNecessary");
    }
  }
}

uint64_t __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_2_54(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "watchPasscodeAndUnlockedQueryDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: query date %@ now %@", (uint8_t *)&v10, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "watchPasscodeAndUnlockedQueryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32)))
    goto LABEL_8;
  v9 = objc_msgSend(WeakRetained, "checkedWatchPasscodeAndUnlockedStatus");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_errorForConnectionIssue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 0, v8);
LABEL_8:

  }
}

- (void)_checkWristDetectEnabledState
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  NPKPairedOrPairingDevice();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B330]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Watch has SEP: %d", buf, 8u);
    }

  }
  if (v5)
  {
    -[NPKPaymentPreflighter setNeedsWristDetection:](self, "setNeedsWristDetection:", 0);
  }
  else
  {
    NPKDomainAccessorForDomain(CFSTR("com.apple.Carousel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentPreflighter setNeedsWristDetection:](self, "setNeedsWristDetection:", objc_msgSend(v9, "BOOLForKey:", CFSTR("DisableWristDetection")));

  }
  -[NPKPaymentPreflighter setCheckedWristDetectionStatus:](self, "setCheckedWristDetectionStatus:", 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NPKPaymentPreflighter__checkWristDetectEnabledState__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __54__NPKPaymentPreflighter__checkWristDetectEnabledState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
}

- (void)_setAuthRandomIfNecessary
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Setting auth random if necessary at the beginning of the provisioning flow", buf, 2u);
    }

  }
  if (-[NPKPaymentPreflighter needsSetAuthRandom](self, "needsSetAuthRandom"))
  {
    -[NPKPaymentPreflighter webService](self, "webService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[NPKPaymentPreflighter targetDevice](self, "targetDevice");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__NPKPaymentPreflighter__setAuthRandomIfNecessary__block_invoke;
    v11[3] = &unk_24CFE9828;
    v11[4] = self;
    objc_msgSend(v10, "setNewAuthRandomIfNecessaryAtBeginningOfProvisioningFlow:", v11);

  }
  else
  {
    -[NPKPaymentPreflighter setAuthRandomSetIfNecessary:](self, "setAuthRandomSetIfNecessary:", 1);
    -[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:](self, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
  }
}

void __50__NPKPaymentPreflighter__setAuthRandomIfNecessary__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v10 = a2;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Auth random set if necessary (success %d)", buf, 8u);
    }

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__NPKPaymentPreflighter__setAuthRandomIfNecessary__block_invoke_59;
  v7[3] = &unk_24CFE7D78;
  v8 = a2;
  v7[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v7);
}

void __50__NPKPaymentPreflighter__setAuthRandomIfNecessary__block_invoke_59(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAuthRandomSetIfNecessary:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 1, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorForGenericIssue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_finishPresentingSetupControllerIfReadyWithSuccess:error:", 0, v3);

  }
}

- (void)_finishPresentingSetupControllerIfReadyWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint8_t buf[4];
  _BYTE v19[14];
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v4 = a3;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[NPKPaymentPreflighter isPreflighting](self, "isPreflighting");
  if (!v7 || !v4)
  {
    if (!v7)
      goto LABEL_41;
    goto LABEL_30;
  }
  if (-[NPKPaymentPreflighter checkedWristDetectionStatus](self, "checkedWristDetectionStatus")
    && -[NPKPaymentPreflighter needsWristDetection](self, "needsWristDetection"))
  {
    -[NPKPaymentPreflighter _errorForWristDetectNeeded](self, "_errorForWristDetectNeeded");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_29:
    v9 = (void *)v8;

    v4 = 0;
    v6 = v9;
    goto LABEL_30;
  }
  if (-[NPKPaymentPreflighter checkedCompanioniCloudStatus](self, "checkedCompanioniCloudStatus")
    && -[NPKPaymentPreflighter needsCompanioniCloudAccount](self, "needsCompanioniCloudAccount"))
  {
    -[NPKPaymentPreflighter _errorForCompanionAccountNeeded](self, "_errorForCompanionAccountNeeded");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (-[NPKPaymentPreflighter checkedWatchiCloudStatus](self, "checkedWatchiCloudStatus")
    && -[NPKPaymentPreflighter needsWatchiCloudAccount](self, "needsWatchiCloudAccount"))
  {
    -[NPKPaymentPreflighter _errorForGizmoAccountNeeded](self, "_errorForGizmoAccountNeeded");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (-[NPKPaymentPreflighter checkedWatchPasscodeAndUnlockedStatus](self, "checkedWatchPasscodeAndUnlockedStatus")
    && (-[NPKPaymentPreflighter needsPasscode](self, "needsPasscode")
     || -[NPKPaymentPreflighter needsUnlock](self, "needsUnlock")))
  {
    if (-[NPKPaymentPreflighter needsPasscode](self, "needsPasscode"))
      -[NPKPaymentPreflighter _errorForPasscodeNeeded](self, "_errorForPasscodeNeeded");
    else
      -[NPKPaymentPreflighter _errorForUnlockNeeded](self, "_errorForUnlockNeeded");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (!-[NPKPaymentPreflighter checkedWatchPasscodeAndUnlockedStatus](self, "checkedWatchPasscodeAndUnlockedStatus")
    || !-[NPKPaymentPreflighter checkedCompanioniCloudStatus](self, "checkedCompanioniCloudStatus")
    || !-[NPKPaymentPreflighter checkedWatchiCloudStatus](self, "checkedWatchiCloudStatus")
    || !-[NPKPaymentPreflighter checkedWristDetectionStatus](self, "checkedWristDetectionStatus")
    || !-[NPKPaymentPreflighter watchConnected](self, "watchConnected")
    || !-[NPKPaymentPreflighter spaceAvailableOnSecureElement](self, "spaceAvailableOnSecureElement")
    || !-[NPKPaymentPreflighter authRandomSetIfNecessary](self, "authRandomSetIfNecessary"))
  {
    goto LABEL_41;
  }
  v4 = 1;
LABEL_30:
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67112450;
      *(_DWORD *)v19 = v4;
      *(_WORD *)&v19[4] = 2112;
      *(_QWORD *)&v19[6] = v6;
      v20 = 1024;
      v21 = -[NPKPaymentPreflighter isPreflighting](self, "isPreflighting");
      v22 = 1024;
      v23 = -[NPKPaymentPreflighter checkedWatchPasscodeAndUnlockedStatus](self, "checkedWatchPasscodeAndUnlockedStatus");
      v24 = 1024;
      v25 = -[NPKPaymentPreflighter checkedCompanioniCloudStatus](self, "checkedCompanioniCloudStatus");
      v26 = 1024;
      v27 = -[NPKPaymentPreflighter checkedWatchiCloudStatus](self, "checkedWatchiCloudStatus");
      v28 = 1024;
      v29 = -[NPKPaymentPreflighter checkedWristDetectionStatus](self, "checkedWristDetectionStatus");
      v30 = 1024;
      v31 = -[NPKPaymentPreflighter needsPasscode](self, "needsPasscode");
      v32 = 1024;
      v33 = -[NPKPaymentPreflighter needsUnlock](self, "needsUnlock");
      v34 = 1024;
      v35 = -[NPKPaymentPreflighter needsWatchiCloudAccount](self, "needsWatchiCloudAccount");
      v36 = 1024;
      v37 = -[NPKPaymentPreflighter needsWristDetection](self, "needsWristDetection");
      v38 = 1024;
      v39 = -[NPKPaymentPreflighter watchConnected](self, "watchConnected");
      v40 = 1024;
      v41 = -[NPKPaymentPreflighter spaceAvailableOnSecureElement](self, "spaceAvailableOnSecureElement");
      v42 = 1024;
      v43 = -[NPKPaymentPreflighter authRandomSetIfNecessary](self, "authRandomSetIfNecessary");
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Preflight complete!\n\tsuccess: %d\n\terror: %@\n\tpreflighting: %d\n\tchecked passcode/unlocked: %d\n\tchecked companion iCloud account: %d\n\tchecked watch iCloud account: %d\n\tchecked wrist detect: %d\n\tneedsPasscode: %d\n\tneedsUnlock: %d\n\tneedsGizmoiCloudAccount: %d\n\tneedsWristDetection: %d\n\tgizmo connected: %d\n\tspace available on SE: %d\n\tauth random set if necessary: %d", buf,
        0x5Au);
    }

  }
  -[NPKPaymentPreflighter preflightCompletionHandler](self, "preflightCompletionHandler");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(uint64_t, _BOOL8, id))(v13 + 16))(v13, v4, v6);
    -[NPKPaymentPreflighter setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
    -[NPKPaymentPreflighter setPreflighting:](self, "setPreflighting:", 0);
  }
  else
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v19 = "-[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:]";
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Warning: %s Unexpected. No completion handler available", buf, 0xCu);
      }

    }
  }

LABEL_41:
}

- (id)_errorForWristDetectNeeded
{
  int IsTinker;
  void *v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  IsTinker = NPKPairedOrPairingDeviceIsTinker();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE6F2A8];
  if (IsTinker)
  {
    v20[0] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WRIST_DETECT_REQUIRED_ALERT_TITLE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    v20[1] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WRIST_DETECT_REQUIRED_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18[0] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v3;
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WRIST_DETECT_REQUIRED_ALERT_TITLE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v18[1] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WRIST_DETECT_REQUIRED_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v8;
    v18[2] = *MEMORY[0x24BDD0FE8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WRIST_DETECT_REQUIRED_ALERT_BUTTON"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    v18[3] = *MEMORY[0x24BE6F328];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:root=PASSCODE_ID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v4, 0, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_errorForGizmoAccountNeeded
{
  int IsTinker;
  void *v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  IsTinker = NPKPairedOrPairingDeviceIsTinker();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE6F2A8];
  if (IsTinker)
  {
    v20[0] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GIZMO_ACCOUNT_REQUIRED_ALERT_TITLE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    v20[1] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GIZMO_ACCOUNT_REQUIRED_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18[0] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v3;
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GIZMO_ACCOUNT_REQUIRED_ALERT_TITLE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v18[1] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GIZMO_ACCOUNT_REQUIRED_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v8;
    v18[2] = *MEMORY[0x24BDD0FE8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("GIZMO_ACCOUNT_REQUIRED_ALERT_BUTTON"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    v18[3] = *MEMORY[0x24BE6F328];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:root=GENERAL_LINK&path=LINK_WITH_ICLOUD_LINK"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v4, 0, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_errorForPasscodeNeeded
{
  int IsTinker;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  IsTinker = NPKPairedOrPairingDeviceIsTinker();
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE6F2A8];
  if (IsTinker)
  {
    v20[0] = *MEMORY[0x24BDD0FD8];
    PKLocalizedPaymentString(CFSTR("PASSCODE_REQUIRED_ALERT_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v20[1] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSCODE_REQUIRED_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18[0] = *MEMORY[0x24BDD0FD8];
    PKLocalizedPaymentString(CFSTR("PASSCODE_REQUIRED_ALERT_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v18[1] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSCODE_REQUIRED_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v7;
    v18[2] = *MEMORY[0x24BDD0FE8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PASSCODE_REQUIRED_ALERT_BUTTON"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE6F2B8];
    v19[2] = v11;
    v19[3] = MEMORY[0x24BDBD1C8];
    v13 = *MEMORY[0x24BE6F328];
    v18[3] = v12;
    v18[4] = v13;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:root=PASSCODE_ID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 0, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_errorForUnlockNeeded
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE6F2A8];
  v11[0] = *MEMORY[0x24BDD0FD8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNLOCK_REQUIRED_ALERT_TITLE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = *MEMORY[0x24BDD0FF0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNLOCK_REQUIRED_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_errorForCompanionAccountNeeded
{
  return (id)PKDisplayableErrorForCommonType();
}

- (id)_errorForGenericIssue
{
  return (id)PKDisplayableErrorForCommonType();
}

- (id)_errorForConnectionIssue
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE6F2A8];
  v11[0] = *MEMORY[0x24BDD0FD8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GIZMO_UNREACHABLE_ALERT_TITLE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = *MEMORY[0x24BDD0FF0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GIZMO_UNREACHABLE_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PUConnection)passcodeConnection
{
  return self->_passcodeConnection;
}

- (void)setPasscodeConnection:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeConnection, a3);
}

- (NSSManager)systemSettingsManager
{
  return self->_systemSettingsManager;
}

- (void)setSystemSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemSettingsManager, a3);
}

- (BOOL)checkedWatchPasscodeAndUnlockedStatus
{
  return self->_checkedWatchPasscodeAndUnlockedStatus;
}

- (void)setCheckedWatchPasscodeAndUnlockedStatus:(BOOL)a3
{
  self->_checkedWatchPasscodeAndUnlockedStatus = a3;
}

- (BOOL)checkedCompanioniCloudStatus
{
  return self->_checkedCompanioniCloudStatus;
}

- (void)setCheckedCompanioniCloudStatus:(BOOL)a3
{
  self->_checkedCompanioniCloudStatus = a3;
}

- (BOOL)checkedWatchiCloudStatus
{
  return self->_checkedWatchiCloudStatus;
}

- (void)setCheckedWatchiCloudStatus:(BOOL)a3
{
  self->_checkedWatchiCloudStatus = a3;
}

- (BOOL)checkedWristDetectionStatus
{
  return self->_checkedWristDetectionStatus;
}

- (void)setCheckedWristDetectionStatus:(BOOL)a3
{
  self->_checkedWristDetectionStatus = a3;
}

- (BOOL)authRandomSetIfNecessary
{
  return self->_authRandomSetIfNecessary;
}

- (void)setAuthRandomSetIfNecessary:(BOOL)a3
{
  self->_authRandomSetIfNecessary = a3;
}

- (BOOL)watchConnected
{
  return self->_watchConnected;
}

- (void)setWatchConnected:(BOOL)a3
{
  self->_watchConnected = a3;
}

- (BOOL)spaceAvailableOnSecureElement
{
  return self->_spaceAvailableOnSecureElement;
}

- (void)setSpaceAvailableOnSecureElement:(BOOL)a3
{
  self->_spaceAvailableOnSecureElement = a3;
}

- (BOOL)needsPasscode
{
  return self->_needsPasscode;
}

- (void)setNeedsPasscode:(BOOL)a3
{
  self->_needsPasscode = a3;
}

- (BOOL)needsUnlock
{
  return self->_needsUnlock;
}

- (void)setNeedsUnlock:(BOOL)a3
{
  self->_needsUnlock = a3;
}

- (BOOL)needsCompanioniCloudAccount
{
  return self->_needsCompanioniCloudAccount;
}

- (void)setNeedsCompanioniCloudAccount:(BOOL)a3
{
  self->_needsCompanioniCloudAccount = a3;
}

- (BOOL)needsWatchiCloudAccount
{
  return self->_needsWatchiCloudAccount;
}

- (void)setNeedsWatchiCloudAccount:(BOOL)a3
{
  self->_needsWatchiCloudAccount = a3;
}

- (BOOL)needsWristDetection
{
  return self->_needsWristDetection;
}

- (void)setNeedsWristDetection:(BOOL)a3
{
  self->_needsWristDetection = a3;
}

- (BOOL)needsSetAuthRandom
{
  return self->_needsSetAuthRandom;
}

- (void)setNeedsSetAuthRandom:(BOOL)a3
{
  self->_needsSetAuthRandom = a3;
}

- (id)preflightCompletionHandler
{
  return self->_preflightCompletionHandler;
}

- (void)setPreflightCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
  objc_storeStrong((id *)&self->_webService, a3);
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return (PKPaymentWebServiceTargetDeviceProtocol *)objc_loadWeakRetained((id *)&self->_targetDevice);
}

- (void)setTargetDevice:(id)a3
{
  objc_storeWeak((id *)&self->_targetDevice, a3);
}

- (NPKCompanionAgentConnection)companionAgentConnection
{
  return self->_companionAgentConnection;
}

- (void)setCompanionAgentConnection:(id)a3
{
  objc_storeStrong((id *)&self->_companionAgentConnection, a3);
}

- (BOOL)isPreflighting
{
  return self->_preflighting;
}

- (void)setPreflighting:(BOOL)a3
{
  self->_preflighting = a3;
}

- (NSDate)watchPasscodeAndUnlockedQueryDate
{
  return self->_watchPasscodeAndUnlockedQueryDate;
}

- (void)setWatchPasscodeAndUnlockedQueryDate:(id)a3
{
  objc_storeStrong((id *)&self->_watchPasscodeAndUnlockedQueryDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchPasscodeAndUnlockedQueryDate, 0);
  objc_storeStrong((id *)&self->_companionAgentConnection, 0);
  objc_destroyWeak((id *)&self->_targetDevice);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong(&self->_preflightCompletionHandler, 0);
  objc_storeStrong((id *)&self->_systemSettingsManager, 0);
  objc_storeStrong((id *)&self->_passcodeConnection, 0);
}

@end
