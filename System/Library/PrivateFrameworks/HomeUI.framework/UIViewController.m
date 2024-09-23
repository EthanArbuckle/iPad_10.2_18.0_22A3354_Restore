@implementation UIViewController

id __63__UIViewController_HUPresentation__hu_performDismissalRequest___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "popToViewController:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

BOOL __63__UIViewController_HUPresentation__hu_performDismissalRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

id __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2EAC88))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
    objc_msgSend(v4, "hu_prepareForDismissalAnimated:", *(unsigned __int8 *)(a1 + 40));
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", &unk_1E7040510);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke_68(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0D519C0];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v6 == 1)
  {
    objc_msgSend(v5, "finishWithNoResult");
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(unsigned __int8 *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke_2;
    v10[3] = &unk_1E6F4D988;
    v11 = v5;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v8, v10);

  }
  return v5;
}

uint64_t __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

id __96__UIViewController_HUPreloadingModalPresentation__hu_presentPreloadableViewController_animated___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__UIViewController_HUPreloadingModalPresentation__hu_presentPreloadableViewController_animated___block_invoke_2;
  v8[3] = &unk_1E6F4D988;
  v6 = v2;
  v9 = v6;
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, v5, v8);

  return v6;
}

void __96__UIViewController_HUPreloadingModalPresentation__hu_presentPreloadableViewController_animated___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  NAEmptyResult();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:", v2);

}

void __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id obj;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "title");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[UIViewController(HUCommonAlertController) hu_presentNotificationAlertForNotificationCapableObjects:notificat"
          "ionsEnabled:mainActionBlock:notNowActionBlock:]_block_invoke";
    v35 = 2114;
    v36 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@'.", buf, 0x16u);

  }
  v23 = v2;

  v24 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = a1;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "hf_userNotificationSettings", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        if (v12
          && (v13 = objc_msgSend(v12, "areNotificationsEnabled"), v14 = *(unsigned __int8 *)(v5 + 48), v14 != v13))
        {
          objc_msgSend(v12, "setNotificationsEnabled:", v14 != 0);
          objc_msgSend(v10, "hf_updateUserNotificationSettings:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "na_safeAddObject:", v16);

          v15 = 1;
        }
        else
        {
          v15 = 0;
        }
        HFLogForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          if (v15)
            v18 = CFSTR("NOT updating");
          else
            v18 = CFSTR("Updating");
          NSStringFromBOOL();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "areNotificationsEnabled");
          NSStringFromBOOL();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316418;
          v34 = "-[UIViewController(HUCommonAlertController) hu_presentNotificationAlertForNotificationCapableObjects:not"
                "ificationsEnabled:mainActionBlock:notNowActionBlock:]_block_invoke";
          v35 = 2112;
          v36 = v18;
          v37 = 2112;
          v38 = v19;
          v39 = 2112;
          v40 = v10;
          v41 = 2112;
          v42 = v12;
          v43 = 2112;
          v44 = v20;
          _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "(%s) %@ notificationsEnabled to %@ for %@. newSettings = %@. current notificationsEnabled = %@", buf, 0x3Eu);

          v5 = a1;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_17;
  v27[3] = &unk_1E6F55020;
  v28 = *(id *)(v5 + 40);
  v22 = (id)objc_msgSend(v21, "addCompletionBlock:", v27);

}

void __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[UIViewController(HUCommonAlertController) hu_presentNotificationAlertForNotificationCapableObjects:notificat"
          "ionsEnabled:mainActionBlock:notNowActionBlock:]_block_invoke";
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%s) Completed notification settings update. result %@. Error = %@", buf, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D309B8];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_19;
    v11[3] = &unk_1E6F4D9B0;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v8, "handleError:operationType:options:retryBlock:cancelBlock:", v6, v9, 0, 0, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }

}

uint64_t __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[UIViewController(HUCommonAlertController) hu_presentNotificationAlertForNotificationCapableObjects:notificati"
         "onsEnabled:mainActionBlock:notNowActionBlock:]_block_invoke_2";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@'.", (uint8_t *)&v7, 0x16u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

uint64_t __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:acc"
         "essory:include:continueActionBlock:cancelActionBlock:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'Continue' button about the limit for wallet key and pin code. Allowing RG access to %@", (uint8_t *)&v5, 0x16u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_minimumDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:acc"
         "essory:include:continueActionBlock:cancelActionBlock:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'cancel' button about the limit. NOT updating access for %@", (uint8_t *)&v5, 0x16u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke_35(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    objc_msgSend(a1[5], "hf_minimumDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136316162;
    v8 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:acc"
         "essory:include:continueActionBlock:cancelActionBlock:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Displayed alert about wallet key and pin code limits when updating schedule from %@ | home %@ | accessory %@ | user %@", (uint8_t *)&v7, 0x34u);

  }
}

@end
