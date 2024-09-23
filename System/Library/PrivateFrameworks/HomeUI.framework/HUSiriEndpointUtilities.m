@implementation HUSiriEndpointUtilities

+ (id)presentShareSiriAndDictationAlertForMultipleAccessories:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriEndpointSetup_ShareSiriDictation_AlertTitle_Multiple"), CFSTR("HUSiriEndpointSetup_ShareSiriDictation_AlertTitle_Multiple"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriEndpointSetup_ShareSiriDictation_AlertMessage_Multiple"), CFSTR("HUSiriEndpointSetup_ShareSiriDictation_AlertMessage_Multiple"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUSiriEndpointUtilities presentShareSiriAndDictationAlert:alertTitle:alertMessage:](HUSiriEndpointUtilities, "presentShareSiriAndDictationAlert:alertTitle:alertMessage:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)presentShareSiriAndDictationAlertForSingleAccessory:(id)a3 accessoryName:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  HULocalizedStringWithFormat(CFSTR("HUSiriEndpointSetup_ShareSiriDictation_AlertTitle_Single"), CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriEndpointSetup_ShareSiriDictation_AlertMessage_Single"), CFSTR("HUSiriEndpointSetup_ShareSiriDictation_AlertMessage_Single"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUSiriEndpointUtilities presentShareSiriAndDictationAlert:alertTitle:alertMessage:](HUSiriEndpointUtilities, "presentShareSiriAndDictationAlert:alertTitle:alertMessage:", v5, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)presentShareSiriAndDictationAlert:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SEL v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    NSLog(CFSTR("No VC found, cannot present alert"));
  v11 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__HUSiriEndpointUtilities_presentShareSiriAndDictationAlert_alertTitle_alertMessage___block_invoke;
  v17[3] = &unk_1E6F57AE0;
  v18 = v9;
  v19 = v10;
  v20 = v8;
  v21 = a2;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v11, "futureWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __85__HUSiriEndpointUtilities_presentShareSiriAndDictationAlert_alertTitle_alertMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ Showing Share Siri & Dictation alert", buf, 0xCu);

  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUAlertDismiss"), CFSTR("HUAlertDismiss"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA2E0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __85__HUSiriEndpointUtilities_presentShareSiriAndDictationAlert_alertTitle_alertMessage___block_invoke_16;
  v15 = &unk_1E6F59FC0;
  v9 = *(_QWORD *)(a1 + 56);
  v16 = v3;
  v17 = v9;
  v10 = v3;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v6, 0, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11, v12, v13, v14, v15);

  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __85__HUSiriEndpointUtilities_presentShareSiriAndDictationAlert_alertTitle_alertMessage___block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@ Dismissing Share Siri & Dictation alert.", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

@end
