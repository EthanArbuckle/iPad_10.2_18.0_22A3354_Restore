@implementation UIViewController(HUCommonAlertController)

- (void)hu_presentNotificationAlertForNotificationCapableObjects:()HUCommonAlertController notificationsEnabled:mainActionBlock:notNowActionBlock:
{
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  char v35;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4)
    v12 = CFSTR("On");
  else
    v12 = CFSTR("Off");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUNotificationAlert_Title_%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v13, v13, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUNotificationAlert_Message_%@"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v14, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v28, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUNotificationAlert_Option_Turn%@"), v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v17, v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CEA2E0];
  v20 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke;
  v32[3] = &unk_1E6F55048;
  v35 = a4;
  v33 = v9;
  v34 = v10;
  v21 = v10;
  v22 = v9;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v18, 0, v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v23);
  v24 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUNotNowTitle"), CFSTR("HUNotNowTitle"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_2;
  v30[3] = &unk_1E6F55070;
  v31 = v11;
  v26 = v11;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 0, v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v27);
  objc_msgSend(a1, "presentViewController:animated:completion:", v16, 1, 0);

}

+ (void)hu_presentingLockLimitAlertIfNeededFromViewController:()HUCommonAlertController home:user:accessory:include:continueActionBlock:cancelActionBlock:
{
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD);
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  void (**v74)(_QWORD);
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  _BYTE v78[10];
  _QWORD v79[5];

  v79[2] = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v63 = a9;
  objc_msgSend(v14, "homeAccessControlForUser:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "restrictedGuestAccessSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(v20, "accessAllowedToAccessories");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  v61 = v14;
  if (a7)
  {
    objc_msgSend(v22, "na_safeAddObject:", v16);
  }
  else if (objc_msgSend(v22, "na_safeContainsObject:", v16))
  {
    objc_msgSend(v22, "removeObject:", v16);
  }
  v23 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v20, "setAccessAllowedToAccessories:", v23);

  objc_msgSend(v20, "locksWithReducedFunctionalityDueToSchedule");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "na_safeContainsObject:", v16) & a7;

  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "hf_prettyDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v76 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:ac"
          "cessory:include:continueActionBlock:cancelActionBlock:]";
    v77 = 1024;
    *(_DWORD *)v78 = v25;
    *(_WORD *)&v78[4] = 1024;
    *(_DWORD *)&v78[6] = a7;
    LOWORD(v79[0]) = 2112;
    *(_QWORD *)((char *)v79 + 2) = v27;
    _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "(%s) displayLimitAlert = %{BOOL}d | isOn = %{BOOL}d | user %@", buf, 0x22u);

  }
  v60 = v22;

  HFLogForCategory();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v58 = v25;
    v29 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(v20, "locksWithReducedFunctionalityDueToSchedule");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "allObjects");
    v30 = v20;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hf_minimumDescriptionsOfAccessories:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(v30, "accessAllowedToAccessories");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allObjects");
    v35 = v17;
    v36 = v16;
    v37 = v15;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hf_minimumDescriptionsOfAccessories:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v76 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:ac"
          "cessory:include:continueActionBlock:cancelActionBlock:]";
    v77 = 2112;
    *(_QWORD *)v78 = v32;
    *(_WORD *)&v78[8] = 2112;
    v79[0] = v39;
    _os_log_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEFAULT, "(%s) ... locksWithReducedFunct = %@ | allowedAccessories = %@", buf, 0x20u);

    v15 = v37;
    v16 = v36;
    v17 = v35;

    v20 = v30;
    v25 = v58;

  }
  if (v25)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HURestrictedGuest_LocksWithReducedFunctionalityDueToSchedule_Alert_SingleGuest_SingleLock"), CFSTR("HURestrictedGuest_LocksWithReducedFunctionalityDueToSchedule_Alert_SingleGuest_SingleLock"), 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", &stru_1E6F60E80, v57, 1);
    v59 = v20;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = MEMORY[0x1E0C809B0];
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke;
    v72[3] = &unk_1E6F52350;
    v44 = v16;
    v45 = v16;
    v46 = v15;
    v47 = v44;
    v73 = v44;
    v74 = v17;
    objc_msgSend(v41, "actionWithTitle:style:handler:", v42, 0, v72);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "addAction:", v48);
    v49 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v43;
    v69[1] = 3221225472;
    v69[2] = __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke_34;
    v69[3] = &unk_1E6F52350;
    v51 = v47;
    v70 = v51;
    v71 = v63;
    objc_msgSend(v49, "actionWithTitle:style:handler:", v50, 0, v69);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "addAction:", v52);
    v64[0] = v43;
    v64[1] = 3221225472;
    v64[2] = __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke_35;
    v64[3] = &unk_1E6F4DFD0;
    v53 = v62;
    v65 = v62;
    v54 = v61;
    v66 = v61;
    v55 = v51;
    v15 = v46;
    v16 = v45;
    v67 = v55;
    v68 = v15;
    objc_msgSend(v65, "presentViewController:animated:completion:", v40, 1, v64);

    v20 = v59;
  }
  else
  {
    v54 = v61;
    v53 = v62;
    if (v17)
      v17[2](v17);
  }

}

@end
