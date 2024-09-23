@implementation BPSApplePayLocallyStoredValueManager

+ (id)remoteLocallyStoredValuePassNames
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v3 = (void *)getPKPassLibraryClass_softClass;
  v30 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = (uint64_t)__getPKPassLibraryClass_block_invoke;
    v25 = &unk_24CBE4A00;
    v26 = &v27;
    __getPKPassLibraryClass_block_invoke((uint64_t)&v22);
    v3 = (void *)v28[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v27, 8);
  if (-[objc_class isPassLibraryAvailable](v4, "isPassLibraryAvailable"))
  {
    v5 = [v4 alloc];
    v22 = 0;
    v23 = (uint64_t)&v22;
    v24 = 0x2020000000;
    v6 = (id *)getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr;
    v25 = (void *)getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr;
    if (!getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr)
    {
      v7 = (void *)PassKitCoreLibrary();
      v6 = (id *)dlsym(v7, "PKCompanionWatchPassLibraryMachServiceName");
      *(_QWORD *)(v23 + 24) = v6;
      getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr = (uint64_t)v6;
    }
    _Block_object_dispose(&v22, 8);
    if (!v6)
      __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
    v8 = *v6;
    v22 = 0;
    v23 = (uint64_t)&v22;
    v24 = 0x2020000000;
    v9 = (_QWORD *)getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr;
    v25 = (void *)getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr;
    if (!getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr)
    {
      v10 = (void *)PassKitCoreLibrary();
      v9 = dlsym(v10, "PKCompanionAgentServiceListenerResumedNotification");
      *(_QWORD *)(v23 + 24) = v9;
      getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v22, 8);
    if (!v9)
      __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
    v11 = (void *)objc_msgSend(v5, "initWithMachServiceName:resumeNotificationName:interfaceType:", v8, *v9, 0);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v11, "paymentPassesWithLocallyStoredValue", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "localizedDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v2, "addObject:", v16);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
      }
      while (v13);
    }

  }
  return v2;
}

+ (void)presentApplePayLocallyStoredValueOfflineWarningIfNeededInController:(id)a3 forPairedDevice:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (!v11)
    NSLog(CFSTR("presentingController is required!"));
  objc_msgSend(a1, "remoteLocallyStoredValuePassNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    NRWatchOSVersionForRemoteDevice();
    objc_msgSend(a1, "_presentApplePayLocallyStoredValueWarningInController:unableToConnect:legacyDevice:withCompletion:", v11, 0, NRVersionIsGreaterThanOrEqual() ^ 1, v9);
  }
  else if (v9)
  {
    v9[2](v9, 1);
  }

}

+ (void)_presentApplePayLocallyStoredValueWarningInController:(id)a3 unableToConnect:(BOOL)a4 legacyDevice:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  BOOL v57;

  v7 = a5;
  v8 = a4;
  v48 = a3;
  v45 = a6;
  objc_msgSend(a1, "remoteLocallyStoredValuePassNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = 0x24BDD1000uLL;
  v47 = v10;
  if (v11 == 1)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("REMAINING_BALANCE_TITLE_%@"), &stru_24CBE59D0, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    v12 = 0x24BDD1000;
    objc_msgSend(v17, "stringWithFormat:", v15, v16);
    v18 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("REMAINING_BALANCE_TITLE_MULTIPLE"), &stru_24CBE59D0, CFSTR("Localizable"));
    v18 = objc_claimAutoreleasedReturnValue();
  }

  if (v8)
  {
    objc_msgSend(*(id *)(v12 + 1160), "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REMAINING_BALANCE_MESSAGE_ERROR"), &stru_24CBE59D0, CFSTR("Localizable"));
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = CFSTR("REMAINING_BALANCE_MESSAGE_MULTIPLE");
    if (v11 == 1)
      v21 = CFSTR("REMAINING_BALANCE_MESSAGE");
    v22 = v21;
    v19 = v22;
    if (v7)
    {
      -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", CFSTR("_LEGACY"));
      v23 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v23;
    }
    objc_msgSend(*(id *)(v12 + 1160), "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", v19, &stru_24CBE59D0, CFSTR("Localizable"));
    v20 = objc_claimAutoreleasedReturnValue();

  }
  v44 = (void *)v20;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v18, v20, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v46 = (void *)v18;
  if (v7)
  {
    v27 = 0;
    v28 = v45;
  }
  else
  {
    v29 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(*(id *)(v12 + 1160), "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_APPLE_PAY"), &stru_24CBE59D0, CFSTR("Localizable"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v26;
    v53[1] = 3221225472;
    v53[2] = __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke;
    v53[3] = &unk_24CBE4AA8;
    v54 = v48;
    v56 = a1;
    v28 = v45;
    v55 = v45;
    v57 = v7;
    objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 0, v53);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "addAction:", v32);
    objc_msgSend(v25, "setPreferredAction:", v32);

    v27 = 2;
  }
  v33 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(*(id *)(v12 + 1160), "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("RESET"), &stru_24CBE59D0, CFSTR("Localizable"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v26;
  v51[0] = v26;
  v51[1] = 3221225472;
  v51[2] = __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_3;
  v51[3] = &unk_24CBE4AD0;
  v37 = v28;
  v52 = v37;
  objc_msgSend(v33, "actionWithTitle:style:handler:", v35, v27, v51);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "addAction:", v38);
  if (v7)
    objc_msgSend(v25, "setPreferredAction:", v38);
  v39 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24CBE59D0, CFSTR("Localizable"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v36;
  v49[1] = 3221225472;
  v49[2] = __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_4;
  v49[3] = &unk_24CBE4AD0;
  v50 = v37;
  v42 = v37;
  objc_msgSend(v39, "actionWithTitle:style:handler:", v41, 1, v49);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAction:", v43);

  objc_msgSend(v48, "presentViewController:animated:completion:", v25, 1, 0);
}

void __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;

  NSLog(CFSTR("User selected Connect to Apple Pay"));
  v2 = objc_alloc_init(MEMORY[0x24BDF6CF0]);
  objc_msgSend(v2, "setAutoresizingMask:", 45);
  objc_msgSend(v2, "setFontSize:", 16);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BridgePreferences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONNECTING_TO_APPLE_PAY"), &stru_24CBE59D0, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v4);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showInView:", v8);

  objc_msgSend(v6, "setUserInteractionEnabled:", 0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_2;
  v14[3] = &unk_24CBE4A80;
  v15 = v2;
  v16 = v6;
  v9 = *(void **)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v18 = v10;
  v19 = v11;
  v17 = *(id *)(a1 + 32);
  v20 = *(_BYTE *)(a1 + 56);
  v12 = v6;
  v13 = v2;
  objc_msgSend(v9, "_attemptToMarkAllAppletsForDeletionWithCompletion:", v14);

}

uint64_t __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  NSLog(CFSTR("Mark applets for delete result: success %d error %@"), a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "hide");
  objc_msgSend(*(id *)(a1 + 40), "setUserInteractionEnabled:", 1);
  if (!a2)
    return objc_msgSend(*(id *)(a1 + 64), "_presentApplePayLocallyStoredValueWarningInController:unableToConnect:legacyDevice:withCompletion:", *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  NSLog(CFSTR("User continued from Apple Pay Balance Warning"));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  NSLog(CFSTR("User cancelled from Apple Pay Balance Warning"));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (void)_attemptToMarkAllAppletsForDeletionWithCompletion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getNPKCompanionAgentConnectionClass_softClass;
  v15 = getNPKCompanionAgentConnectionClass_softClass;
  v5 = MEMORY[0x24BDAC760];
  if (!getNPKCompanionAgentConnectionClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getNPKCompanionAgentConnectionClass_block_invoke;
    v11[3] = &unk_24CBE4A00;
    v11[4] = &v12;
    __getNPKCompanionAgentConnectionClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  v7 = objc_alloc_init(v6);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __90__BPSApplePayLocallyStoredValueManager__attemptToMarkAllAppletsForDeletionWithCompletion___block_invoke;
  v9[3] = &unk_24CBE4B20;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "markAllAppletsForDeletionWithCompletion:", v9);

}

void __90__BPSApplePayLocallyStoredValueManager__attemptToMarkAllAppletsForDeletionWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__BPSApplePayLocallyStoredValueManager__attemptToMarkAllAppletsForDeletionWithCompletion___block_invoke_2;
  block[3] = &unk_24CBE4AF8;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __90__BPSApplePayLocallyStoredValueManager__attemptToMarkAllAppletsForDeletionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

@end
