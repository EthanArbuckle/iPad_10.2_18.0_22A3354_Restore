@implementation DSSafetyCheck

+ (id)safetyCheckViewController
{
  return objc_alloc_init(DSNavigationController);
}

+ (void)startSafetyCheckWithPresentingViewController:(id)a3 safetyCheckController:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (v5)
  {
    if (+[DSSafetyCheck isManagedAccount](DSSafetyCheck, "isManagedAccount"))
    {
      +[DSSafetyCheck showManagedAccountAlertWithPresentingViewController:](DSSafetyCheck, "showManagedAccountAlertWithPresentingViewController:", v6);
    }
    else if (+[DSSafetyCheck shouldShowHSA2Upgrade](DSSafetyCheck, "shouldShowHSA2Upgrade"))
    {
      +[DSSafetyCheck showHSA2UpgradeWithPresentingViewController:safetyCheckController:](DSSafetyCheck, "showHSA2UpgradeWithPresentingViewController:safetyCheckController:", v6, v5);
    }
    else if (+[DSSafetyCheck shouldSkipAuthenticationForController:](DSSafetyCheck, "shouldSkipAuthenticationForController:", v5))
    {
      +[DSSafetyCheck presentSafetyCheckWithViewController:navigationController:](DSSafetyCheck, "presentSafetyCheckWithViewController:navigationController:", v6, v5);
    }
    else
    {
      +[DSSafetyCheck authForSafetyCheckWithPresentingViewController:safetyCheckController:](DSSafetyCheck, "authForSafetyCheckWithPresentingViewController:safetyCheckController:", v6, v5);
    }
  }

}

+ (void)startEmergencyResetWithPresentingViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[DSNavigationController initStartingWithEmergencyReset]([DSNavigationController alloc], "initStartingWithEmergencyReset");
  objc_msgSend(a1, "startSafetyCheckWithPresentingViewController:safetyCheckController:", v4, v5);

}

+ (void)startManageSharingWithPresentingViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[DSNavigationController initStartingWithMangeSharing]([DSNavigationController alloc], "initStartingWithMangeSharing");
  objc_msgSend(a1, "startSafetyCheckWithPresentingViewController:safetyCheckController:", v4, v5);

}

+ (void)startWithPresentingViewController:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[DSNavigationController initStartingWithURL:]([DSNavigationController alloc], "initStartingWithURL:", v6);

  objc_msgSend(a1, "startSafetyCheckWithPresentingViewController:safetyCheckController:", v7, v8);
}

+ (void)authForSafetyCheckWithPresentingViewController:(id)a3 safetyCheckController:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[8];
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.DigitalSeparation", "DSSafetyCheck");
  v9 = (void *)DSLog_3;
  DSLog_3 = (uint64_t)v8;

  v10 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v30 = 0;
  v11 = objc_msgSend(v10, "canEvaluatePolicy:error:", 2, &v30);
  v12 = v30;
  v13 = v12;
  if (v11)
  {
    DSUILocStringForKey(CFSTR("SAFETY_CHECK_AUTH_REASON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke;
    v25[3] = &unk_24EFF3CA8;
    v26 = v7;
    v27 = v10;
    v29 = a1;
    v28 = v6;
    objc_msgSend(v27, "evaluatePolicy:localizedReason:reply:", 2, v14, v25);

    v15 = v26;
LABEL_3:

    goto LABEL_12;
  }
  objc_msgSend(v12, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDDA908]))
  {
    v17 = objc_msgSend(v13, "code");

    if (v17 == -5)
    {
      v18 = DSLog_3;
      if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2278DF000, v18, OS_LOG_TYPE_INFO, "Cannot evaluate authentication policy for Safety Check, no passcode set, allowing access.", buf, 2u);
      }
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_214;
      v19[3] = &unk_24EFF3BE0;
      v20 = v7;
      v21 = v10;
      v23 = a1;
      v22 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v19);

      v15 = v20;
      goto LABEL_3;
    }
  }
  else
  {

  }
  if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR))
    +[DSSafetyCheck authForSafetyCheckWithPresentingViewController:safetyCheckController:].cold.1();
LABEL_12:

}

void __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = DSLog_3;
  if (!os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_INFO))
  {
    if (!a2)
      goto LABEL_3;
LABEL_6:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_211;
    block[3] = &unk_24EFF3BE0;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v8 = *(_OWORD *)(a1 + 48);
    v7 = (id)v8;
    v12 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    if (!v5)
      goto LABEL_9;
    goto LABEL_7;
  }
  *(_DWORD *)buf = 67109120;
  v14 = a2;
  _os_log_impl(&dword_2278DF000, v6, OS_LOG_TYPE_INFO, "Asked user to auth for Safety Check on entry with success: %d", buf, 8u);
  if (a2)
    goto LABEL_6;
LABEL_3:
  if (!v5)
    goto LABEL_9;
LABEL_7:
  if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR))
    __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_cold_1();
LABEL_9:

}

uint64_t __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_211(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAuthContext:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "presentSafetyCheckWithViewController:navigationController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_214(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAuthContext:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "presentSafetyCheckWithViewController:navigationController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (void)presentSafetyCheckWithViewController:(id)a3 navigationController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "presentViewController:animated:completion:", v5, 1, &__block_literal_global_9);
  +[DSDTOManager isRatchetActiveWithCompletion:](DSDTOManager, "isRatchetActiveWithCompletion:", &__block_literal_global_218);
  v6 = v5;
  AnalyticsSendEventLazy();

}

void __75__DSSafetyCheck_presentSafetyCheckWithViewController_navigationController___block_invoke()
{
  id v0;

  +[DSDeviceManager sharedInstance](DSDeviceManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appDidLaunch");

}

uint64_t __75__DSSafetyCheck_presentSafetyCheckWithViewController_navigationController___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    return +[DSDTOManager protectUserLocationOnWebDuringDTO](DSDTOManager, "protectUserLocationOnWebDuringDTO");
  return result;
}

id __75__DSSafetyCheck_presentSafetyCheckWithViewController_navigationController___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("entrypoint");
  objc_msgSend(*(id *)(a1 + 32), "entryMethod");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)isChildOrTeenAccountWithCompletion:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE30A88]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__DSSafetyCheck_isChildOrTeenAccountWithCompletion___block_invoke;
  v6[3] = &unk_24EFF3D30;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "startRequestWithCompletionHandler:", v6);

}

void __52__DSSafetyCheck_isChildOrTeenAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.DigitalSeparation", "DSSafetyCheck");
    v8 = (void *)DSLog_3;
    DSLog_3 = (uint64_t)v7;

    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR))
      __52__DSSafetyCheck_isChildOrTeenAccountWithCompletion___block_invoke_cold_1();
  }
  objc_msgSend(v5, "members");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "isMe", (_QWORD)v15) && objc_msgSend(v14, "memberType"))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_15:

}

+ (BOOL)isManagedAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "authKitAccountWithAltDSID:error:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7 && os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR))
    +[DSSafetyCheck isManagedAccount].cold.1();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "securityLevelForAccount:", v6) == 5;

  return v9;
}

+ (void)showManagedAccountAlertWithPresentingViewController:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x24BEBD3B0];
  v4 = a3;
  DSUILocStringForKey(CFSTR("MANAGED_ACCOUNT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("MANAGED_ACCOUNT_DETAIL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, &__block_literal_global_238);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v9);

  objc_msgSend(v4, "presentViewController:animated:completion:", v10, 1, 0);
  AnalyticsSendEventLazy();

}

void *__69__DSSafetyCheck_showManagedAccountAlertWithPresentingViewController___block_invoke_2()
{
  return &unk_24F00B140;
}

+ (BOOL)shouldShowHSA2Upgrade
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "authKitAccountWithAltDSID:error:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7 && os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR))
    +[DSSafetyCheck isManagedAccount].cold.1();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "securityLevelForAccount:", v6) != 4;

  return v9;
}

+ (void)showHSA2UpgradeWithPresentingViewController:(id)a3 safetyCheckController:(id)a4
{
  id v5;
  id v6;
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
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "aa_altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA20]), "initWithAltDSID:", v10);
    objc_msgSend(v11, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 0);
    objc_msgSend(v11, "setDeviceToDeviceEncryptionUpgradeType:", 1);
    DSUILocStringForKey(CFSTR("SAFETY_CHECK"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFeatureName:", v12);

    objc_msgSend(v11, "setPresentingViewController:", v5);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA28]), "initWithContext:", v11);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_3;
    v20[3] = &unk_24EFF3E38;
    v21 = v5;
    v22 = v6;
    objc_msgSend(v13, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v20);

  }
  else
  {
    v14 = (void *)MEMORY[0x24BEBD3B0];
    DSUILocStringForKey(CFSTR("HSA2_NOT_REPAIRED_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("HSA2_NOT_REPAIRED_DETAIL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BEBD3A8];
    DSUILocStringForKey(CFSTR("OK"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, &__block_literal_global_253);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v19);

    objc_msgSend(v5, "presentViewController:animated:completion:", v10, 1, 0);
    AnalyticsSendEventLazy();
  }

}

void *__83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_2()
{
  return &unk_24F00B168;
}

void __83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  os_log_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    AnalyticsSendEventLazy();
    +[DSSafetyCheck authForSafetyCheckWithPresentingViewController:safetyCheckController:](DSSafetyCheck, "authForSafetyCheckWithPresentingViewController:safetyCheckController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      v7 = os_log_create("com.apple.DigitalSeparation", "DSSafetyCheck");
      v8 = (void *)DSLog_3;
      DSLog_3 = (uint64_t)v7;

      if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR))
        __83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_3_cold_1();
      v9 = (void *)MEMORY[0x24BEBD3B0];
      DSUILocStringForKey(CFSTR("HSA2_NOT_REPAIRED_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, 0, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BEBD3A8];
      DSUILocStringForKey(CFSTR("OK"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, &__block_literal_global_269);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v14);

      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0);
    }
    AnalyticsSendEventLazy();
  }

}

void *__83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_4()
{
  return &unk_24F00B190;
}

void *__83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_2_270()
{
  return &unk_24F00B1B8;
}

+ (void)showlearnMoreForPresentingViewController:(id)a3 withURL:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x24BDE81B0];
  v6 = a4;
  v7 = a3;
  v11 = objc_alloc_init(v5);
  objc_msgSend(v11, "_setEphemeral:", 1);
  v8 = objc_alloc(MEMORY[0x24BDE81A8]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithURL:configuration:", v9, v11);
  objc_msgSend(v7, "presentViewController:animated:completion:", v10, 1, 0);

}

+ (BOOL)shouldSkipAuthenticationForController:(id)a3
{
  return objc_msgSend(a3, "requiresAuthForEntry") ^ 1;
}

+ (void)authForSafetyCheckWithPresentingViewController:safetyCheckController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Cannot evaluate authentication policy for Safety Check, error %@, returning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __86__DSSafetyCheck_authForSafetyCheckWithPresentingViewController_safetyCheckController___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Error while evaluating authentication policy for Safety Check, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __52__DSSafetyCheck_isChildOrTeenAccountWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Failed to fetch family members, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

+ (void)isManagedAccount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Failed to fetch AK Account, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __83__DSSafetyCheck_showHSA2UpgradeWithPresentingViewController_safetyCheckController___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Failed to complete HSA2 repair with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

@end
