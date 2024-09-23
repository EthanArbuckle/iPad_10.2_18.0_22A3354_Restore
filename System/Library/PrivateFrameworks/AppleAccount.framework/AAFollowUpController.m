@implementation AAFollowUpController

- (id)_followUpController
{
  void *v2;
  objc_class *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)getFLFollowUpControllerClass_softClass;
  v10 = getFLFollowUpControllerClass_softClass;
  if (!getFLFollowUpControllerClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getFLFollowUpControllerClass_block_invoke;
    v6[3] = &unk_1E416F0A0;
    v6[4] = &v7;
    __getFLFollowUpControllerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  v4 = [v3 alloc];
  return (id)objc_msgSend(v4, "initWithClientIdentifier:", AAFollowUpClientIdentifier[0]);
}

- (id)_followUpItemForStartUsing:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v4, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_START_USING_BUTTON_PRIMARY"), &stru_1E41752F8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v6);

  v7 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v7, "setIdentifier:", AAFollowUpActionDismiss[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_START_USING_BUTTON_DISMISS"), &stru_1E41752F8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabel:", v9);

  v10 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v18[0] = v4;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActions:", v11);

  objc_msgSend(v10, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  getFLGroupIdentifierAccount();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGroupIdentifier:", v12);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_START_USING_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInformativeText:", v14);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_START_USING_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v16);

  objc_msgSend(v10, "setUniqueIdentifier:", AAFollowUpIdentifierStartUsing[0]);
  objc_msgSend(v10, "setUserInfo:", v3);

  return v10;
}

- (id)_followUpItemForVerifyTerms:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v45;
  uint8_t buf[16];
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v4, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_VERIFY_TERMS_BUTTON_PRIMARY"), &stru_1E41752F8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v6);

  v7 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v7, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_VERIFY_TERMS_NOTIFICATION_BUTTON_PRIMARY"), &stru_1E41752F8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabel:", v9);

  v10 = BYSetupAssistantNeedsToRun();
  v11 = v10;
  if (v10)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Surpressing VerifyTerms notification while Setup Assistant is running...", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, CFSTR("com.apple.AppleAccount.FollowUp.SetupAssistantExited"), (CFNotificationCallback)_AAFollowUpControllerHandleSetupAssistantExited, (CFStringRef)*MEMORY[0x1E0D8D6D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpUserInfoTermsNotificationTitle[0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_VERIFY_TERMS_NOTIFICATION_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpUserInfoTermsNotificationBody[0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    AADeviceLocStringForKey(CFSTR("FOLLOWUP_VERIFY_TERMS_NOTIFICATION_MESSAGE"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpUserInfoTermsCFUTitle[0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_VERIFY_TERMS_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpUserInfoTermsCFUBody[0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    v28 = v26;
  }
  else
  {
    AADeviceLocStringForKey(CFSTR("FOLLOWUP_VERIFY_TERMS_MESSAGE"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;

  if ((v11 & 1) != 0)
  {
    v30 = 0;
  }
  else
  {
    v30 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
    objc_msgSend(v30, "setActivateAction:", v7);
    objc_msgSend(v30, "setFirstNotificationDelay:", 0.0);
    objc_msgSend(v30, "setFrequency:", 86400.0);
    objc_msgSend(v30, "setInformativeText:", v21);
    objc_msgSend(v30, "setTitle:", v16);
    v31 = (void *)MEMORY[0x1E0C99E60];
    getFLNotificationOptionForce();
    v45 = v29;
    v32 = v3;
    v33 = v24;
    v34 = v7;
    v35 = v4;
    v36 = v21;
    v37 = v16;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    getFLNotificationOptionSpringboardAlert();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithObjects:", v38, v39, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setOptions:", v40);

    v16 = v37;
    v21 = v36;
    v4 = v35;
    v7 = v34;
    v24 = v33;
    v3 = v32;
    v29 = v45;
  }
  v41 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v47[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActions:", v42);

  objc_msgSend(v41, "setDisplayStyle:", 1);
  objc_msgSend(v41, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  getFLGroupIdentifierAccount();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setGroupIdentifier:", v43);

  objc_msgSend(v41, "setInformativeText:", v29);
  objc_msgSend(v41, "setNotification:", v30);
  objc_msgSend(v41, "setTitle:", v24);
  objc_msgSend(v41, "setUniqueIdentifier:", AAFollowUpIdentifierVerifyTerms[0]);
  objc_msgSend(v41, "setUserInfo:", v3);

  return v41;
}

- (id)_followUpItemForRenewCredentials:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  int v19;
  void *v20;
  __CFString *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AAFollowUpController _shouldPostRenewFollowup:](self, "_shouldPostRenewFollowup:", v4))
  {
    v5 = objc_alloc_init((Class)getFLFollowUpActionClass());
    objc_msgSend(v5, "setIdentifier:", AAFollowUpActionPrimary[0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RENEW_CREDENTIALS_PRIMARY"), &stru_1E41752F8, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLabel:", v7);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RENEW_CREDENTIALS_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoClientName[0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RENEW_CREDENTIALS_MESSAGE_BLAME"), &stru_1E41752F8, CFSTR("Localizable"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingFormat:", v12, v10);
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v13;
      }

    }
    v14 = objc_alloc_init((Class)getFLFollowUpItemClass());
    objc_msgSend(v14, "setDisplayStyle:", 0);
    v24[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActions:", v15);

    objc_msgSend(v14, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
    getFLGroupIdentifierAccount();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGroupIdentifier:", v16);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("FOLLOWUP_RENEW_CREDENTIALS_TITLE");
    if ((objc_msgSend(CFSTR("FOLLOWUP_RENEW_CREDENTIALS_TITLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("FOLLOWUP_RENEW_CREDENTIALS_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = 1;
    }
    objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_1E41752F8, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v20);

    if (v19)
    objc_msgSend(v14, "setInformativeText:", v9);
    objc_msgSend(v14, "setTypeIdentifier:", AAFollowUpIdentifierRenewCredentials[0]);
    objc_msgSend(v14, "setUserInfo:", v4);
    v21 = AAFollowUpIdentifierRenewCredentials[0];
    objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoAccountIdentifier[0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v14, "setAccountIdentifier:", v22);
    objc_msgSend(v14, "setUniqueIdentifier:", v21);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_followUpItemForCustodianReview:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AAFollowUpController _showAccountRecoveryPane](self, "_showAccountRecoveryPane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActions:", v7);

  objc_msgSend(v6, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REVIEW_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInformativeText:", v9);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REVIEW_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v11);

  objc_msgSend(v6, "setUniqueIdentifier:", AAFollowUpIdentifierCustodianReview[0]);
  objc_msgSend(v6, "setUserInfo:", v4);

  objc_msgSend(v6, "setDisplayStyle:", 2);
  -[AAFollowUpController _custodianReviewNotification:](self, "_custodianReviewNotification:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNotification:", v12);

  getFLGroupIdentifierAccount();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGroupIdentifier:", v13);

  return v6;
}

- (id)_custodianReviewNotification:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  objc_msgSend(v4, "setActivateAction:", v3);

  objc_msgSend(v4, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(v4, "setFrequency:", 86400.0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REVIEW_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REVIEW_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v8);

  v9 = (void *)MEMORY[0x1E0C99E60];
  getFLNotificationOptionForce();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionLockscreen();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObjects:", v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v12);

  return v4;
}

- (id)_showAccountRecoveryPane
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v2, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REVIEW_BUTTON_PRIMARY"), &stru_1E41752F8, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v4);

  return v2;
}

- (id)_followUpItemForCustodianInvitationReminder:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
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
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v4, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_INVITATION_REMINDER_BUTTON_PRIMARY"), &stru_1E41752F8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpTrustedContactName[0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpTrustedContactID[0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AAFollowUpController _followUpItemForCustodianInvitationReminder:].cold.1(v4, v7);

  v8 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v23[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActions:", v9);

  objc_msgSend(v8, "setDisplayStyle:", 1);
  objc_msgSend(v8, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  getFLGroupIdentifierAccount();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGroupIdentifier:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_INVITATION_REMINDER_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInformativeText:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_INVITATION_REMINDER_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v17, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v18);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), AAFollowUpIdentifierCustodianInvitationReminder[0], v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUniqueIdentifier:", v19);

  objc_msgSend(v8, "setUserInfo:", v3);
  return v8;
}

- (id)_followUpItemForCustodianWalrusRemoved:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[2];
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v3, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_PRIMARY"), 0, CFSTR("Localizable-Walrus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v5);

  v6 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v6, "setIdentifier:", AAFollowUpActionDismiss[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_DISMISS"), 0, CFSTR("Localizable-Walrus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v6;
  objc_msgSend(v6, "setLabel:", v8);

  objc_msgSend(v43, "objectForKeyedSubscript:", AAFollowUpTrustedContactName[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  v45 = v3;
  objc_msgSend(v10, "setActivateAction:", v3);
  objc_msgSend(v10, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(v10, "setFrequency:", 86400.0);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_MESSAGE"), 0, CFSTR("Localizable-Walrus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInformativeText:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_TITLE_IOS"), 0, CFSTR("Localizable-Walrus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v18);

  v19 = (void *)MEMORY[0x1E0C99E60];
  getFLNotificationOptionForce();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionSpringboardAlert();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithObjects:", v20, v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOptions:", v22);

  v23 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v23, "setIdentifier:", AAFollowUpActionPrimary[0]);
  v49 = CFSTR("type");
  v50[0] = CFSTR("addRecoveryContact");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUserInfo:", v24);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_ADD_RECOVERY_CONTACT"), 0, CFSTR("Localizable-Walrus"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLabel:", v26);

  v27 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v27, "setIdentifier:", AAFollowUpActionPrimary[0]);
  v47 = CFSTR("type");
  v48 = CFSTR("addRecoveryKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUserInfo:", v28);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_SETUP_RECOVERY_KEY"), 0, CFSTR("Localizable-Walrus"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLabel:", v30);

  v31 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v46[0] = v23;
  v46[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActions:", v32);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_TITLE_IOS"), 0, CFSTR("Localizable-Walrus"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTitle:", v34);

  objc_msgSend(v31, "setDisplayStyle:", 1);
  objc_msgSend(v31, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  getFLGroupIdentifierAccount();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setGroupIdentifier:", v35);

  v36 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_MESSAGE"), 0, CFSTR("Localizable-Walrus"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", v38, v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setInformativeText:", v39);

  objc_msgSend(v31, "setNotification:", v10);
  v40 = (void *)objc_msgSend(v43, "mutableCopy");

  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "setUniqueIdentifier:", AAFollowUpIdentifierCustodianWalrusRemoved[0]);
  v41 = (void *)objc_msgSend(v40, "copy");
  objc_msgSend(v31, "setUserInfo:", v41);

  return v31;
}

- (id)_walrusUserRecoveryFactorsMissingNotification
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v2, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RECOVERY_FACTORS_MISSING_BUTTON_PRIMARY"), 0, CFSTR("Localizable-Walrus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v4);

  v5 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v5, "setIdentifier:", AAFollowUpActionDismiss[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RECOVERY_FACTORS_MISSING_BUTTON_DISMISS"), 0, CFSTR("Localizable-Walrus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabel:", v7);

  v8 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  objc_msgSend(v8, "setActivateAction:", v2);
  objc_msgSend(v8, "setClearAction:", v5);
  objc_msgSend(v8, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(v8, "setFrequency:", 86400.0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RECOVERY_FACTORS_MISSING_NOTIFICATION_MESSAGE"), 0, CFSTR("Localizable-Walrus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInformativeText:", v10);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RECOVERY_FACTORS_MISSING_NOTIFICATION_TITLE_IOS"), 0, CFSTR("Localizable-Walrus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v12);

  v13 = (void *)MEMORY[0x1E0C99E60];
  getFLNotificationOptionForce();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionSpringboardAlert();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObjects:", v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOptions:", v16);

  return v8;
}

- (id)_addRecoveryContactAction
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v2, "setIdentifier:", AAFollowUpActionPrimary[0]);
  v7 = CFSTR("type");
  v8[0] = CFSTR("addRecoveryContact");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInfo:", v3);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RECOVERY_FACTORS_MISSING_ADD_RECOVERY_CONTACT"), 0, CFSTR("Localizable-Walrus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v5);

  return v2;
}

- (id)_addRecoveryKeyActionForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v3, "setIdentifier:", AAFollowUpActionPrimary[0]);
  v8 = CFSTR("type");
  v9[0] = CFSTR("addRecoveryKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RECOVERY_FACTORS_MISSING_SETUP_RECOVERY_KEY"), 0, CFSTR("Localizable-Walrus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v6);

  return v3;
}

- (id)_verifyRecoveryKeyAction
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v2, "setIdentifier:", AAFollowUpActionPrimary[0]);
  v7 = CFSTR("type");
  v8[0] = CFSTR("verifyRecoveryKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInfo:", v3);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_PRIMARY_ACTION"), &stru_1E41752F8, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v5);

  return v2;
}

- (id)_recoveryKeyMismatchOtherOptionsActionWithUserInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v3, "setIdentifier:", AAFollowUpActionPrimary[0]);
  v8 = CFSTR("type");
  v9[0] = CFSTR("recoveryKeyMismatchOtherOption");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_SECONDARY_ACTION"), &stru_1E41752F8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v6);

  return v3;
}

- (id)_followUpItemForWalrusUserRecoveryFactorsMissing:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AAFollowUpController _walrusUserRecoveryFactorsMissingNotification](self, "_walrusUserRecoveryFactorsMissingNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init((Class)getFLFollowUpItemClass());
  -[AAFollowUpController _addRecoveryContactAction](self, "_addRecoveryContactAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  -[AAFollowUpController _addRecoveryKeyActionForIdentifier:](self, "_addRecoveryKeyActionForIdentifier:", AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActions:", v9);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RECOVERY_FACTORS_MISSING_NOTIFICATION_TITLE_IOS"), 0, CFSTR("Localizable-Walrus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v11);

  objc_msgSend(v6, "setDisplayStyle:", 0);
  objc_msgSend(v6, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  getFLGroupIdentifierAccount();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGroupIdentifier:", v12);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RECOVERY_FACTORS_MISSING_MESSAGE"), 0, CFSTR("Localizable-Walrus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInformativeText:", v14);

  objc_msgSend(v6, "setNotification:", v5);
  objc_msgSend(v6, "setUniqueIdentifier:", AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing[0]);
  objc_msgSend(v6, "setUserInfo:", v4);

  return v6;
}

- (id)_followUpItemForCustodianRemoved:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
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
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v3, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_PRIMARY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  objc_msgSend(v3, "setLabel:", v5);

  objc_msgSend(v38, "objectForKeyedSubscript:", AAFollowUpTrustedContactName[0]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  objc_msgSend(v7, "setActivateAction:", v3);
  objc_msgSend(v7, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(v7, "setFrequency:", 86400.0);
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v6;
  objc_msgSend(v8, "stringWithFormat:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInformativeText:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v15);

  v16 = (void *)MEMORY[0x1E0C99E60];
  getFLNotificationOptionForce();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionSpringboardAlert();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithObjects:", v17, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOptions:", v19);

  v20 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v20, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_PRIMARY"), &stru_1E41752F8, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLabel:", v22);

  v23 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v23, "setIdentifier:", AAFollowUpActionDismiss[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_DISMISS"), &stru_1E41752F8, CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLabel:", v25);

  v26 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v39[0] = v20;
  v39[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActions:", v27);

  objc_msgSend(v26, "setDisplayStyle:", 1);
  objc_msgSend(v26, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  getFLGroupIdentifierAccount();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setGroupIdentifier:", v28);

  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", v31, v36);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setInformativeText:", v32);

  objc_msgSend(v26, "setNotification:", v7);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_CUSTODIAN_REMOVED_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTitle:", v34);

  objc_msgSend(v26, "setUniqueIdentifier:", AAFollowUpIdentifierCustodianRemoved[0]);
  objc_msgSend(v26, "setUserInfo:", v38);

  return v26;
}

- (id)_followUpItemForCustodianWalrusNoLiveness:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v3, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_BUTTON_PRIMARY"), 0, CFSTR("Localizable-Walrus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v5);

  v6 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v6, "setIdentifier:", AAFollowUpActionDismiss[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_BUTTON_SECONDARY"), 0, CFSTR("Localizable-Walrus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v6;
  objc_msgSend(v6, "setLabel:", v8);

  objc_msgSend(v41, "objectForKeyedSubscript:", AAFollowUpTrustedContactName[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  v43 = v3;
  objc_msgSend(v10, "setActivateAction:", v3);
  objc_msgSend(v10, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(v10, "setFrequency:", 86400.0);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_BUTTON_NOTIFICATION_MESSAGE"), 0, CFSTR("Localizable-Walrus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInformativeText:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_BUTTON_NOTIFICATION_TITLE"), 0, CFSTR("Localizable-Walrus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v18);

  v19 = (void *)MEMORY[0x1E0C99E60];
  getFLNotificationOptionForce();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionSpringboardAlert();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithObjects:", v20, v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOptions:", v22);

  v23 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v23, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_UPDATE_RECOVERY_CONTACT"), 0, CFSTR("Localizable-Walrus"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLabel:", v25);

  v26 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v26, "setIdentifier:", AAFollowUpActionDismiss[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_NOT_NOW"), 0, CFSTR("Localizable-Walrus"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLabel:", v28);

  v29 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v44[0] = v23;
  v44[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActions:", v30);

  objc_msgSend(v29, "setDisplayStyle:", 1);
  objc_msgSend(v29, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  getFLGroupIdentifierAccount();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setGroupIdentifier:", v31);

  v32 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_MESSAGE"), 0, CFSTR("Localizable-Walrus"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", v34, v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setInformativeText:", v35);

  objc_msgSend(v29, "setNotification:", v10);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_TITLE"), 0, CFSTR("Localizable-Walrus"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTitle:", v37);

  v38 = (void *)objc_msgSend(v41, "mutableCopy");
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v29, "setUniqueIdentifier:", AAFollowUpIdentifierCustodianWalrusNoLiveness[0]);
  v39 = (void *)objc_msgSend(v38, "copy");
  objc_msgSend(v29, "setUserInfo:", v39);

  return v29;
}

- (id)_followUpItemForBeneficiaryRemoved:(id)a3
{
  id v3;
  void *v4;
  void *v5;
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
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v34;
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v3, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_BENEFICIARY_REMOVED_BUTTON_PRIMARY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v5);

  objc_msgSend(v35, "objectForKeyedSubscript:", AAFollowUpTrustedContactName[0]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  objc_msgSend(v6, "setActivateAction:", v3);
  objc_msgSend(v6, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(v6, "setFrequency:", 86400.0);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_BENEFICIARY_REMOVED_NOTIFICATION_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInformativeText:", v10);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_BENEFICIARY_REMOVED_NOTIFICATION_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v12);

  v13 = (void *)MEMORY[0x1E0C99E60];
  getFLNotificationOptionForce();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionSpringboardAlert();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObjects:", v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOptions:", v16);

  v17 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v17, "setIdentifier:", AAFollowUpActionPrimary[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_BENEFICIARY_REMOVED_BUTTON_PRIMARY"), &stru_1E41752F8, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLabel:", v19);

  v20 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(v20, "setIdentifier:", AAFollowUpActionDismiss[0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_BENEFICIARY_REMOVED_BUTTON_DISMISS"), &stru_1E41752F8, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLabel:", v22);

  v23 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v36[0] = v17;
  v36[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActions:", v24);

  objc_msgSend(v23, "setDisplayStyle:", 1);
  objc_msgSend(v23, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  getFLGroupIdentifierAccount();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setGroupIdentifier:", v25);

  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_BENEFICIARY_REMOVED_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", v28, v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setInformativeText:", v29);

  objc_msgSend(v23, "setNotification:", v6);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_BENEFICIARY_REMOVED_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:", v31);

  objc_msgSend(v23, "setUniqueIdentifier:", AAFollowUpIdentifierBeneficiaryRemoved[0]);
  objc_msgSend(v23, "setUserInfo:", v35);

  _AALogSystem();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    -[AAFollowUpController _followUpItemForBeneficiaryRemoved:].cold.1(v23, v32);

  return v23;
}

- (id)_followUpItemForCustodianEmbargo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAFollowUpController _followUpItemForCustodianEmbargo:].cold.2();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoNotificationInfo[0]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", AAFollowUpUserInfoNotificationButtonTitle[0]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init((Class)getFLFollowUpActionClass());
    objc_msgSend(v9, "setIdentifier:", AAFollowUpActionPrimary[0]);
    objc_msgSend(v9, "setLabel:", v8);
    objc_msgSend(v7, "addObject:", v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoNotificationAltButtonTitle[0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "length") >= 2)
    {
      v11 = objc_alloc_init((Class)getFLFollowUpActionClass());
      objc_msgSend(v11, "setLabel:", v10);
      objc_msgSend(v11, "setIdentifier:", AAFollowUpActionDismiss[0]);
      objc_msgSend(v7, "addObject:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoCFUType[0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAFollowUpController _recoveryNotificationWithInfo:type:](self, "_recoveryNotificationWithInfo:type:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActivateAction:", v9);
    v13 = objc_alloc_init((Class)getFLFollowUpItemClass());
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("FOLLOWUP_CUSTODIAN_EMBARGO_TITLE");
    v22 = v10;
    v23 = (void *)v8;
    if ((objc_msgSend(CFSTR("FOLLOWUP_CUSTODIAN_EMBARGO_TITLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v16 = v7;
      v17 = 0;
    }
    else
    {
      v16 = v7;
      objc_msgSend(CFSTR("FOLLOWUP_CUSTODIAN_EMBARGO_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 1;
    }
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1E41752F8, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v18);

    if (v17)
    objc_msgSend(v13, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
    getFLGroupIdentifierAccount();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGroupIdentifier:", v19);

    objc_msgSend(v13, "setNotification:", v12);
    objc_msgSend(v13, "setActions:", v16);
    objc_msgSend(v13, "setUniqueIdentifier:", AAFollowUpIdentifierCustodianEmbargo[0]);
    objc_msgSend(v13, "setUserInfo:", v4);
    objc_msgSend(v13, "setDisplayStyle:", 2);

  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController _followUpItemForCustodianEmbargo:].cold.1();
    v13 = 0;
  }

  return v13;
}

- (id)_followUpForRecoveryKeyHealingWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoHasWalrusEnabled[0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLValue"))
      -[AAFollowUpController _followUpForWalrusRecoveryKeyMismatchWithContext:](self, "_followUpForWalrusRecoveryKeyMismatchWithContext:", v5);
    else
      -[AAFollowUpController _followUpForRecoveryKeyMismatchWithContext:](self, "_followUpForRecoveryKeyMismatchWithContext:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController _followUpForRecoveryKeyHealingWithContext:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (id)_followUpForRecoveryKeyMismatchWithContext:(id)a3
{
  id v4;
  id v5;
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
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoHasRecoveryContact[0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init((Class)getFLFollowUpItemClass());
  objc_msgSend(v5, "setUniqueIdentifier:", AAFollowUpIdentifierRecoveryKeyMismatch[0]);
  objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoAccountIdentifier[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setAccountIdentifier:", v6);
  objc_msgSend(v5, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  objc_msgSend(v5, "setTypeIdentifier:", AAFollowUpIdentifierRecoveryKeyMismatch[0]);
  objc_msgSend(v5, "setUserInfo:", v4);
  objc_msgSend(v5, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_NOTIFICATION_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_FOLLOWUP_NOTIFICATION_INFORMATIVE"), &stru_1E41752F8, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInformativeText:", v11);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v13);

  LODWORD(v12) = objc_msgSend(v22, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)v12)
    v16 = CFSTR("RECOVERY_KEY_REPAIR_INFORMATIVE_HAS_RC");
  else
    v16 = CFSTR("RECOVERY_KEY_REPAIR_INFORMATIVE_NO_RC");
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E41752F8, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInformativeText:", v17);

  -[AAFollowUpController _verifyRecoveryKeyAction](self, "_verifyRecoveryKeyAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFollowUpController _recoveryKeyMismatchOtherOptionsActionWithUserInfo:](self, "_recoveryKeyMismatchOtherOptionsActionWithUserInfo:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v23[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActions:", v20);

  return v5;
}

- (id)_followUpForWalrusRecoveryKeyMismatchWithContext:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)getFLFollowUpItemClass());
  objc_msgSend(v5, "setUniqueIdentifier:", AAFollowUpIdentifierRecoveryKeyMismatch[0]);
  objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoAccountIdentifier[0]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setAccountIdentifier:", v6);
  v44 = (void *)v6;
  objc_msgSend(v5, "setExtensionIdentifier:", AAFollowUpExtensionIdentifier[0]);
  objc_msgSend(v5, "setTypeIdentifier:", AAFollowUpIdentifierRecoveryKeyMismatch[0]);
  objc_msgSend(v5, "setUserInfo:", v4);
  objc_msgSend(v5, "setDisplayStyle:", 4);
  -[AAFollowUpController _verifyRecoveryKeyAction](self, "_verifyRecoveryKeyAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_VERIFY_RK_ACTION"), 0, CFSTR("Localizable-Walrus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v7;
  objc_msgSend(v7, "setLabel:", v9);

  -[AAFollowUpController _recoveryKeyMismatchOtherOptionsActionWithUserInfo:](self, "_recoveryKeyMismatchOtherOptionsActionWithUserInfo:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", AAFollowUpUserInfoHasRecoveryContact[0]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v42, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_HAS_RC_TITLE"), 0, CFSTR("Localizable-Walrus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v14);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_INFORMATIVE_HAS_RC"), 0, CFSTR("Localizable-Walrus"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInformativeText:", v16);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("RECOVERY_KEY_REPAIR_ADP_OTHER_OPTIONS_ACTION");
  }
  else
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_NO_RC_TITLE"), 0, CFSTR("Localizable-Walrus"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v20);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_INFORMATIVE_NO_RC"), 0, CFSTR("Localizable-Walrus"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInformativeText:", v22);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("RECOVERY_KEY_REPAIR_ADP_ADD_NEW_RECOVER_METHOD_ACTION");
  }
  objc_msgSend(v17, "localizedStringForKey:value:table:", v19, 0, CFSTR("Localizable-Walrus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabel:", v23);

  v45[0] = v43;
  v45[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActions:", v24);

  objc_msgSend(v5, "notification");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_NOTIFICATION_TITLE"), 0, CFSTR("Localizable-Walrus"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTitle:", v27);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_FOLLOWUP_NOTIFICATION_INFORMATIVE"), 0, CFSTR("Localizable-Walrus"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInformativeText:", v29);

  -[AAFollowUpController _verifyRecoveryKeyAction](self, "_verifyRecoveryKeyAction");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_FOLLOWUP_NOTIFICATION_PRIMARY_ACTIVATE_LABEL"), 0, CFSTR("Localizable-Walrus"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLabel:", v32);

  objc_msgSend(v25, "setActivateAction:", v30);
  v33 = objc_alloc_init((Class)getFLFollowUpActionClass());
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("RECOVERY_KEY_REPAIR_ADP_FOLLOWUP_NOTIFICATION_SECONDARY_ACTIVATE_LABEL"), 0, CFSTR("Localizable-Walrus"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLabel:", v35);

  objc_msgSend(v25, "setClearAction:", v33);
  v36 = (void *)MEMORY[0x1E0C99E60];
  getFLNotificationOptionForce();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionSpringboardAlert();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionLockscreen();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithObjects:", v37, v38, v39, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setOptions:", v40);

  objc_msgSend(v25, "setFirstNotificationDelay:", 0.0);
  return v5;
}

- (id)_recoveryNotificationWithInfo:(id)a3 type:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", AAFollowUpUserInfoNotificationTitle[0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", AAFollowUpUserInfoNotificationBody[0]);
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v8, "length"))
    {
      v9 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
      objc_msgSend(v9, "setTitle:", v7);
      objc_msgSend(v9, "setInformativeText:", v8);
      objc_msgSend(v5, "objectForKeyedSubscript:", AAFollowUpUserInfoNotificationDelay[0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        objc_msgSend(v10, "doubleValue");
      else
        v12 = 0.0;
      objc_msgSend(v9, "setFirstNotificationDelay:", v12);
      objc_msgSend(v5, "objectForKeyedSubscript:", AAFollowUpUserInfoNotificationFrequency[0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        objc_msgSend(v14, "doubleValue");
      else
        v16 = 86400.0;
      objc_msgSend(v9, "setFrequency:", v16);
      if (v6 && objc_msgSend(v6, "intValue") != 1)
      {
        if (objc_msgSend(v6, "intValue") != 2)
          goto LABEL_19;
        v17 = (void *)MEMORY[0x1E0C99E60];
        getFLNotificationOptionForce();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        getFLNotificationOptionSpringboardAlert();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0C99E60];
        getFLNotificationOptionForce();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        getFLNotificationOptionBannerAlert();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v20 = (void *)v19;
      objc_msgSend(v17, "setWithObjects:", v18, v19, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOptions:", v21);

LABEL_19:
      goto LABEL_20;
    }
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController _recoveryNotificationWithInfo:type:].cold.2();

  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController _recoveryNotificationWithInfo:type:].cold.1();
  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (id)_followupActionUserInfo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
}

- (BOOL)_shouldPostRenewFollowup:(id)a3
{
  void *v3;
  NSObject *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", AAFollowUpUserInfoAccountIdentifier[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController _shouldPostRenewFollowup:].cold.1();

  }
  return v3 != 0;
}

- (void)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD, _QWORD, _QWORD);
  __int128 *p_buf;
  _QWORD v26[4];
  id v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 955, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

  }
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke;
  v26[3] = &unk_1E416EED0;
  v13 = v11;
  v27 = v13;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AED7A0](v26);
  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to post follow up item with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  -[AAFollowUpController followUpItemForIdentifier:userInfo:](self, "followUpItemForIdentifier:userInfo:", v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", AAFollowUpIdentifierRenewCredentials[0])
    && !+[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:](AAFollowUpUtilities, "hasValidIDMSAccountForUserInfo:", v10))
  {
    _AALogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -14, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v21);

  }
  else if (v16)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__4;
    v31 = __Block_byref_object_dispose__4;
    -[AAFollowUpController _followUpController](self, "_followUpController");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke_196;
    v23[3] = &unk_1E416EEF8;
    p_buf = &buf;
    v24 = v14;
    objc_msgSend(v17, "postFollowUpItem:completion:", v16, v23);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    _AALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -3, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v19);

  }
}

uint64_t __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke_196(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Successfully posted follow up item!", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke_196_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 999, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

  }
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v9;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to post follow up item with identifier: %{public}@", buf, 0xCu);
  }

  -[AAFollowUpController followUpItemForIdentifier:userInfo:](self, "followUpItemForIdentifier:userInfo:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", AAFollowUpIdentifierRenewCredentials[0])
    && !+[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:](AAFollowUpUtilities, "hasValidIDMSAccountForUserInfo:", v10))
  {
    _AALogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:].cold.2();

    if (!a5)
      goto LABEL_25;
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = -14;
    goto LABEL_21;
  }
  if (!v12)
  {
    _AALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:].cold.1();

    if (!a5)
      goto LABEL_25;
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = -3;
LABEL_21:
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), v20, 0);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  -[AAFollowUpController _followUpController](self, "_followUpController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "postFollowUpItem:error:", v12, a5);

  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5 || !v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:error:].cold.2();

LABEL_25:
    v17 = 0;
    goto LABEL_26;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Successfully posted follow up item!", buf, 2u);
  }

  v17 = 1;
LABEL_26:

  return v17;
}

- (void)pendingFollowUpWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1040, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1041, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to fetch follow up item with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  -[AAFollowUpController _followUpController](self, "_followUpController");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E416EF48;
  p_buf = &buf;
  v12 = v9;
  v18 = v12;
  v13 = v7;
  v17 = v13;
  objc_msgSend(v11, "pendingFollowUpItemsWithCompletion:", v16);

  _Block_object_dispose(&buf, 8);
}

void __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  if (!v5 || v6)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_199;
    v15[3] = &unk_1E416EF20;
    v16 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v5, "indexOfObjectPassingTest:", v15);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _AALogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v18 = v11;
        _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "No follow ups found with identifier: %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _AALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v18 = v13;
        _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Successfully fetched follow up: %{private}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_199(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)dismissFollowUpWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  __int128 *p_buf;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1077, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

  }
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke;
  v20[3] = &unk_1E416EED0;
  v10 = v8;
  v21 = v10;
  v11 = (void *)MEMORY[0x1A1AED7A0](v20);
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to clear follow up item with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  -[AAFollowUpController _followUpController](self, "_followUpController");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v22 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_202;
  v17[3] = &unk_1E416EEF8;
  p_buf = &buf;
  v15 = v11;
  v18 = v15;
  objc_msgSend(v13, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v14, v17);

  _Block_object_dispose(&buf, 8);
}

uint64_t __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_202(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Successfully cleared follow up item!", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_202_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)dismissFollowUpWithIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

  }
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to clear follow up item with identifier: %{public}@", buf, 0xCu);
  }

  -[AAFollowUpController _followUpController](self, "_followUpController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v10, a4);

  if (a4)
    v12 = 0;
  else
    v12 = v11;
  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Successfully cleared follow up item!", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[AAFollowUpController dismissFollowUpWithIdentifier:error:].cold.1();
  }

  return v12;
}

- (id)followUpItemForIdentifier:(id)a3
{
  return -[AAFollowUpController followUpItemForIdentifier:userInfo:](self, "followUpItemForIdentifier:userInfo:", a3, 0);
}

- (id)followUpItemForIdentifier:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierStartUsing[0]))
  {
    -[AAFollowUpController _followUpItemForStartUsing:](self, "_followUpItemForStartUsing:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierVerifyTerms[0]))
  {
    -[AAFollowUpController _followUpItemForVerifyTerms:](self, "_followUpItemForVerifyTerms:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierRenewCredentials[0]))
  {
    -[AAFollowUpController _followUpItemForRenewCredentials:](self, "_followUpItemForRenewCredentials:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierCustodianReview[0]))
  {
    -[AAFollowUpController _followUpItemForCustodianReview:](self, "_followUpItemForCustodianReview:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierCustodianInvitationReminder[0]))
  {
    -[AAFollowUpController _followUpItemForCustodianInvitationReminder:](self, "_followUpItemForCustodianInvitationReminder:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierCustodianRemoved[0]))
  {
    -[AAFollowUpController _followUpItemForCustodianRemoved:](self, "_followUpItemForCustodianRemoved:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierCustodianWalrusNoLiveness[0]))
  {
    -[AAFollowUpController _followUpItemForCustodianWalrusNoLiveness:](self, "_followUpItemForCustodianWalrusNoLiveness:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierCustodianWalrusRemoved[0]))
  {
    -[AAFollowUpController _followUpItemForCustodianWalrusRemoved:](self, "_followUpItemForCustodianWalrusRemoved:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing[0]))
  {
    -[AAFollowUpController _followUpItemForWalrusUserRecoveryFactorsMissing:](self, "_followUpItemForWalrusUserRecoveryFactorsMissing:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierBeneficiaryRemoved[0]))
  {
    -[AAFollowUpController _followUpItemForBeneficiaryRemoved:](self, "_followUpItemForBeneficiaryRemoved:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierCustodianEmbargo[0]))
  {
    -[AAFollowUpController _followUpItemForCustodianEmbargo:](self, "_followUpItemForCustodianEmbargo:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", AAFollowUpIdentifierRecoveryKeyMismatch[0]))
    {
      v9 = 0;
      goto LABEL_26;
    }
    -[AAFollowUpController _followUpForRecoveryKeyHealingWithContext:](self, "_followUpForRecoveryKeyHealingWithContext:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_26:

  return v9;
}

- (void)postFollowUpWithIdentifier:(id)a3 forAccount:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

LABEL_3:
  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __95__AAFollowUpController_Convenience__postFollowUpWithIdentifier_forAccount_userInfo_completion___block_invoke;
  v28[3] = &unk_1E416EED0;
  v29 = v14;
  v16 = v14;
  v17 = (void *)MEMORY[0x1A1AED7A0](v28);
  v18 = objc_alloc(MEMORY[0x1E0C99E08]);
  if (v13)
    v19 = v13;
  else
    v19 = (id)MEMORY[0x1E0C9AA70];
  v20 = (void *)objc_msgSend(v18, "initWithDictionary:", v19);
  objc_msgSend(v12, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, AAFollowUpUserInfoAccountIdentifier[0]);

  objc_msgSend(v12, "aa_altDSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, AAFollowUpUserInfoAltDSID[0]);

  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __95__AAFollowUpController_Convenience__postFollowUpWithIdentifier_forAccount_userInfo_completion___block_invoke_2;
  v26[3] = &unk_1E416EED0;
  v27 = v17;
  v23 = v17;
  -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:](self, "postFollowUpWithIdentifier:userInfo:completion:", v11, v20, v26);

}

uint64_t __95__AAFollowUpController_Convenience__postFollowUpWithIdentifier_forAccount_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __95__AAFollowUpController_Convenience__postFollowUpWithIdentifier_forAccount_userInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissFollowUpWithIdentifier:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  AAFollowUpController *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

LABEL_3:
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke;
  v26[3] = &unk_1E416EED0;
  v27 = v11;
  v13 = v11;
  v14 = (void *)MEMORY[0x1A1AED7A0](v26);
  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to teardown follow up with identifier: %@, account: %@", buf, 0x16u);
  }

  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_247;
  v21[3] = &unk_1E416EF70;
  v22 = v9;
  v23 = self;
  v24 = v10;
  v25 = v14;
  v16 = v10;
  v17 = v14;
  v18 = v9;
  -[AAFollowUpController pendingFollowUpWithIdentifier:completion:](self, "pendingFollowUpWithIdentifier:completion:", v18, v21);

}

uint64_t __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_247(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpUserInfoAccountIdentifier[0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "isEqualToString:", v5);

      _AALogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 & 1) == 0)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_247_cold_2();

        goto LABEL_16;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v14 = 138412290;
        v15 = v9;
        v10 = "Tearing down follow up with identifier %@";
        v11 = v8;
        v12 = 12;
LABEL_11:
        _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
      }
    }
    else
    {
      _AALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        v10 = "Found a followup without an account identifier, dismissing!";
        v11 = v8;
        v12 = 2;
        goto LABEL_11;
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "dismissFollowUpWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
LABEL_16:

    return;
  }
  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_247_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)dismissFollowUpsForAccount:(id)a3 identifiers:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__AAFollowUpController_Convenience__dismissFollowUpsForAccount_identifiers_completion___block_invoke;
  v20[3] = &unk_1E416EED0;
  v13 = v11;
  v21 = v13;
  v14 = (void *)MEMORY[0x1A1AED7A0](v20);
  if (objc_msgSend(v10, "count"))
  {
    -[AAFollowUpController _dismissFollowUpWithIdentifiers:completion:](self, "_dismissFollowUpWithIdentifiers:completion:", v10, v14);
  }
  else
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to teardown all followups for account: %@", buf, 0xCu);
    }

    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __87__AAFollowUpController_Convenience__dismissFollowUpsForAccount_identifiers_completion___block_invoke_249;
    v17[3] = &unk_1E416EF98;
    v17[4] = self;
    v19 = v14;
    v18 = v9;
    -[AAFollowUpController pendingFollowUpsForAccount:completion:](self, "pendingFollowUpsForAccount:completion:", v18, v17);

  }
}

uint64_t __87__AAFollowUpController_Convenience__dismissFollowUpsForAccount_identifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __87__AAFollowUpController_Convenience__dismissFollowUpsForAccount_identifiers_completion___block_invoke_249(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "uniqueIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dismissFollowUpWithIdentifiers:completion:", v4, *(_QWORD *)(a1 + 48));
  }
  else
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "No follow ups to delete for account: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)dismissFollowUpsStartingWithIdentifierPrefix:(id)a3 account:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  AAFollowUpController *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

LABEL_3:
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke;
  v26[3] = &unk_1E416EED0;
  v27 = v11;
  v13 = v11;
  v14 = (void *)MEMORY[0x1A1AED7A0](v26);
  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[AAFollowUpController(Convenience) dismissFollowUpsStartingWithIdentifierPrefix:account:completion:].cold.1();

  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke_250;
  v21[3] = &unk_1E416EFC0;
  v22 = v9;
  v23 = self;
  v24 = v10;
  v25 = v14;
  v16 = v10;
  v17 = v14;
  v18 = v9;
  -[AAFollowUpController pendingFollowUpsForAccount:completion:](self, "pendingFollowUpsForAccount:completion:", v16, v21);

}

uint64_t __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke_250(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "uniqueIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasPrefix:", *(_QWORD *)(a1 + 32));

        if (v12)
        {
          objc_msgSend(v10, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_dismissFollowUpWithIdentifiers:completion:", v4, *(_QWORD *)(a1 + 56));
  }
  else
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke_250_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)pendingFollowUpsForAccount:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to fetch follow up item for account : %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  -[AAFollowUpController _followUpController](self, "_followUpController");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke;
  v16[3] = &unk_1E416EF48;
  p_buf = &buf;
  v12 = v9;
  v18 = v12;
  v13 = v7;
  v17 = v13;
  objc_msgSend(v11, "pendingFollowUpItemsWithCompletion:", v16);

  _Block_object_dispose(&buf, 8);
}

void __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  if (!v5 || v6)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke_251;
    v14[3] = &unk_1E416EF20;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v5, "indexesOfObjectsPassingTest:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v5, "objectsAtIndexes:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _AALogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v17 = v10;
        _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Successfully fetched follow up: %{private}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      _AALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke_cold_2();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke_251(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpUserInfoAccountIdentifier[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_dismissFollowUpWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 *p_buf;
  _QWORD v19[4];
  id v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1359, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifiers"));

  }
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__AAFollowUpController_Convenience___dismissFollowUpWithIdentifiers_completion___block_invoke;
  v19[3] = &unk_1E416EED0;
  v10 = v8;
  v20 = v10;
  v11 = (void *)MEMORY[0x1A1AED7A0](v19);
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to clear follow up item with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  -[AAFollowUpController _followUpController](self, "_followUpController");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __80__AAFollowUpController_Convenience___dismissFollowUpWithIdentifiers_completion___block_invoke_254;
  v16[3] = &unk_1E416EEF8;
  p_buf = &buf;
  v14 = v11;
  v17 = v14;
  objc_msgSend(v13, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v7, v16);

  _Block_object_dispose(&buf, 8);
}

uint64_t __80__AAFollowUpController_Convenience___dismissFollowUpWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __80__AAFollowUpController_Convenience___dismissFollowUpWithIdentifiers_completion___block_invoke_254(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Successfully cleared follow up item!", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_202_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isRenewCredentialsCFUPosted
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *i;
  __CFString *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to fetch pending RenewCredentials CFU", buf, 2u);
  }

  -[AAFollowUpController _followUpController](self, "_followUpController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v4, "pendingFollowUpItems:", &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;

  if (!v5 || v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController(Convenience) isRenewCredentialsCFUPosted].cold.1();
    LOBYTE(v8) = 0;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = ((char *)i + 1))
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = AAFollowUpIdentifierRenewCredentials[0];
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "typeIdentifier", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v11) = -[__CFString isEqualToString:](v11, "isEqualToString:", v12);

          if ((_DWORD)v11)
          {
            _AALogSystem();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Found Renew Credentials CFU posted", buf, 2u);
            }

            LOBYTE(v8) = 1;
            goto LABEL_20;
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
  }
LABEL_20:

  return (char)v8;
}

- (double)ageOfOldestCustodianCFU
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v4 = (void *)objc_msgSend(v3, "initWithObjects:", AAFollowUpIdentifierCustodianRemoved[0], 0);
  v11[0] = AAFollowUpIdentifierCustodianWalrusNoLiveness[0];
  v11[1] = AAFollowUpIdentifierCustodianWalrusRemoved[0];
  v11[2] = AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  -[AAFollowUpController creationDateOfOldestFollowUpWithIdentifiers:](self, "creationDateOfOldestFollowUpWithIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v9 = v8;

  }
  else
  {
    v9 = -1.0;
  }

  return v9;
}

- (id)creationDateOfOldestFollowUpWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAFollowUpController(Convenience) creationDateOfOldestFollowUpWithIdentifiers:].cold.3();

  -[AAFollowUpController _followUpController](self, "_followUpController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v6, "pendingFollowUpItems:", &v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v36;
  v9 = v8;
  if (!v7 || v8)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController(Convenience) creationDateOfOldestFollowUpWithIdentifiers:].cold.1();
    v28 = 0;
  }
  else
  {
    v31 = v6;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v17, "uniqueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v4, "containsObject:", v18);

          if (v19)
          {
            -[NSObject addObject:](v10, "addObject:", v17);
            objc_msgSend(v17, "notification");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "creationDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_msgSend(v17, "notification");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "creationDate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v23);

            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v14);
    }

    v24 = objc_msgSend(v11, "count");
    _AALogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      v6 = v31;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[NSObject count](v10, "count");
        *(_DWORD *)buf = 134218499;
        v38 = v27;
        v39 = 2113;
        v40 = v10;
        v41 = 2112;
        v42 = v11;
        _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "Successfully found %lu CFUs: %{private}@ and dates: %@", buf, 0x20u);
      }

      objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
      v26 = objc_claimAutoreleasedReturnValue();
      -[NSObject firstObject](v26, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v31;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[AAFollowUpController(Convenience) creationDateOfOldestFollowUpWithIdentifiers:].cold.2();
      v28 = 0;
    }
    v9 = 0;
    v7 = v30;

  }
  return v28;
}

- (void)pendingFollowUpItemUserInfosWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to fetch user info of follow up item with identifier: %{public}@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E416F008;
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  -[AAFollowUpController _pendingFollowUpItemsWithIdentifier:forAccount:completion:](self, "_pendingFollowUpItemsWithIdentifier:forAccount:completion:", v12, 0, v15);

}

void __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "aaf_map:", &__block_literal_global_10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138477827;
      v13 = v7;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched user infos of pending follow ups: %{private}@", (uint8_t *)&v12, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);

  }
  else
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke_cold_1();

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }

}

uint64_t __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke_257(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInfo");
}

- (id)pendingFollowUpItemUserInfosWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("followUpIdentifier"));

  }
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to fetch user info of follow up item with identifier: %{public}@", buf, 0xCu);
  }

  -[AAFollowUpController _pendingFollowUpItemsWithIdentifier:forAccount:](self, "_pendingFollowUpItemsWithIdentifier:forAccount:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "aaf_map:", &__block_literal_global_259);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v14 = v9;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Successfully fetched user infos of pending follow ups: %{private}@", buf, 0xCu);
    }
  }
  else
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController(Convenience) pendingFollowUpItemUserInfosWithIdentifier:].cold.1();
    v9 = 0;
  }

  return v9;
}

uint64_t __80__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInfo");
}

- (id)_pendingFollowUpItemsWithIdentifier:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AAFollowUpController(Convenience) _pendingFollowUpItemsWithIdentifier:forAccount:].cold.2();

  -[AAFollowUpController _followUpController](self, "_followUpController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v9, "pendingFollowUpItems:", &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "count"))
  {
    -[AAFollowUpController _filterFollowUpItems:byIdentifier:byAccount:](self, "_filterFollowUpItems:byIdentifier:byAccount:", v10, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController(Convenience) _pendingFollowUpItemsWithIdentifier:forAccount:].cold.1();

    v11 = 0;
  }

  return v11;
}

- (void)_pendingFollowUpItemsWithIdentifier:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAFollowUpController.m"), 1546, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to fetch follow up items with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  -[AAFollowUpController _followUpController](self, "_followUpController");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__AAFollowUpController_Convenience___pendingFollowUpItemsWithIdentifier_forAccount_completion___block_invoke;
  v18[3] = &unk_1E416F050;
  p_buf = &buf;
  v14 = v11;
  v21 = v14;
  v18[4] = self;
  v15 = v9;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v13, "pendingFollowUpItemsWithCompletion:", v18);

  _Block_object_dispose(&buf, 8);
}

void __95__AAFollowUpController_Convenience___pendingFollowUpItemsWithIdentifier_forAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  if (v5 && !v6 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_filterFollowUpItems:byIdentifier:byAccount:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138477827;
      v13 = v9;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Successfully fetched follow ups: %{private}@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (id)_filterFollowUpItems:(id)a3 byIdentifier:(id)a4 byAccount:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AAFollowUpController(Convenience) _pendingFollowUpItemsWithIdentifier:forAccount:].cold.1();
    v11 = 0;
    goto LABEL_11;
  }
  v10 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __81__AAFollowUpController_Convenience___filterFollowUpItems_byIdentifier_byAccount___block_invoke;
    v17[3] = &unk_1E416F078;
    v18 = v8;
    objc_msgSend(v7, "aaf_filter:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_12;
    goto LABEL_10;
  }
  v11 = 0;
  if (v9)
  {
LABEL_10:
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __81__AAFollowUpController_Convenience___filterFollowUpItems_byIdentifier_byAccount___block_invoke_2;
    v15[3] = &unk_1E416F078;
    v16 = v9;
    objc_msgSend(v11, "aaf_filter:", v15);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = v16;
    v11 = (void *)v13;
LABEL_11:

  }
LABEL_12:

  return v11;
}

uint64_t __81__AAFollowUpController_Convenience___filterFollowUpItems_byIdentifier_byAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __81__AAFollowUpController_Convenience___filterFollowUpItems_byIdentifier_byAccount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpUserInfoAccountIdentifier[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_followUpItemForCustodianInvitationReminder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, a2, v4, "Primary action, userInfo: %@", v5);

  OUTLINED_FUNCTION_10();
}

- (void)_followUpItemForBeneficiaryRemoved:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, a2, v4, "Beneficiary FollowUp Item - %@", v5);

  OUTLINED_FUNCTION_10();
}

- (void)_followUpItemForCustodianEmbargo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Asked to create custodian FollowUp without userInfo, Aborting ...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_followUpItemForCustodianEmbargo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, v0, v1, "Creating FollowUp for custodian embargo with userInfo dictionary: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_followUpForRecoveryKeyHealingWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Asked to create Recovery Key Mismatch FollowUp without userInfo, Aborting ...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_recoveryNotificationWithInfo:type:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Custodian Followup userInfo did not contain title for notification, Aborting ...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_recoveryNotificationWithInfo:type:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Custodian Followup userInfo did not contain message for notification, Aborting ...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_shouldPostRenewFollowup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Follow up requested but Missing accountIdentifier in follow up user info!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)postFollowUpWithIdentifier:userInfo:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Unknown follow up identifier '%{public}@', bailing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)postFollowUpWithIdentifier:userInfo:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Couldn't find matching account for renewCredentials followup.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke_196_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to post follow up item with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)postFollowUpWithIdentifier:userInfo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to post follow up item with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to fetch pending follow up items, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_202_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to clear follow up item with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)dismissFollowUpWithIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to clear follow up item with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_247_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_19EACA000, v0, v1, "No pending follow ups with identifier %@, nothing to do...", v2);
  OUTLINED_FUNCTION_1_0();
}

void __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_247_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "Pending follow up is for alternate account, ignoring...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke_250_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_19EACA000, v0, v1, "No follow ups to delete for account: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "No follow ups found for account : %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to fetch pending follow ups with Identifieer: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
