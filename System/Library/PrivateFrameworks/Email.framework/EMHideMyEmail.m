@implementation EMHideMyEmail

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__EMHideMyEmail_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_15 != -1)
    dispatch_once(&log_onceToken_15, block);
  return (OS_os_log *)(id)log_log_15;
}

void __20__EMHideMyEmail_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_15;
  log_log_15 = (uint64_t)v1;

}

+ (EMHideMyEmail)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_16);
  return (EMHideMyEmail *)(id)sharedInstance_instance;
}

void __31__EMHideMyEmail_sharedInstance__block_invoke()
{
  EMHideMyEmail *v0;
  void *v1;

  v0 = objc_alloc_init(EMHideMyEmail);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (EMHideMyEmail)init
{
  EMHideMyEmail *v2;
  AKPrivateEmailController *v3;
  AKPrivateEmailController *controller;
  uint64_t v5;
  EFAssertableScheduler *scheduler;
  id v7;
  void *v8;
  uint64_t v9;
  EFLocked *isAvailableLocked;
  EMCoreAnalyticsCollector *v11;
  EMCoreAnalyticsCollector *analyticsCollector;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EMHideMyEmail;
  v2 = -[EMHideMyEmail init](&v14, sel_init);
  if (v2)
  {
    v3 = (AKPrivateEmailController *)objc_alloc_init(MEMORY[0x1E0D00258]);
    controller = v2->_controller;
    v2->_controller = v3;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.email.EMHideMyEmail"));
    v5 = objc_claimAutoreleasedReturnValue();
    scheduler = v2->_scheduler;
    v2->_scheduler = (EFAssertableScheduler *)v5;

    v7 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithObject:", v8);
    isAvailableLocked = v2->_isAvailableLocked;
    v2->_isAvailableLocked = (EFLocked *)v9;

    v11 = objc_alloc_init(EMCoreAnalyticsCollector);
    analyticsCollector = v2->_analyticsCollector;
    v2->_analyticsCollector = v11;

  }
  return v2;
}

- (NSNumber)isAvailable
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  -[EMHideMyEmail isAvailableLocked](self, "isAvailableLocked");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D1ED90] + 16))())
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (void)isAvailable:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EMHideMyEmail isAvailable](self, "isAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v5, "BOOLValue");
      v8 = CFSTR("not ");
      if (v7)
        v8 = &stru_1E70F6E90;
      *(_DWORD *)buf = 138543362;
      v22 = v8;
      _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "Hide My Email subscription is %{public}@available.", buf, 0xCu);
    }

    if (v4)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __29__EMHideMyEmail_isAvailable___block_invoke_54;
      v14[3] = &unk_1E70F2F18;
      v16 = v4;
      v15 = v5;
      v9 = v14;
      objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performBlock:", v9);

    }
  }
  else
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "Hide My Email feature not available for account. Checking current subscription status.", buf, 2u);
    }

    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __29__EMHideMyEmail_isAvailable___block_invoke;
    v19[3] = &unk_1E70F2EA0;
    v19[4] = self;
    v20 = v4;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __29__EMHideMyEmail_isAvailable___block_invoke_44;
    v17[3] = &unk_1E70F2EF0;
    v18 = (id)MEMORY[0x1BCCC8C10](v19);
    v13 = v18;
    -[EMHideMyEmail _hasCloudPlusSubscription:](self, v17);

  }
}

void __29__EMHideMyEmail_isAvailable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "isAvailableLocked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:", v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__EMHideMyEmail_isAvailable___block_invoke_2;
  v10[3] = &unk_1E70F2E78;
  v13 = a2;
  v12 = *(id *)(a1 + 40);
  v8 = v5;
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v10);

}

uint64_t __29__EMHideMyEmail_isAvailable___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[EMHideMyEmail log](EMHideMyEmail, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "Hide My Email subscription availablity check returned: %@.", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __29__EMHideMyEmail_isAvailable___block_invoke_44(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2
    && !+[EMHMERecipientCreationRequest canCreateHMEReplyToAddress:](EMHMERecipientCreationRequest, "canCreateHMEReplyToAddress:", v7))
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "AppleAccount<%@> missing PremimumMailSettings Dataclass. Renewing Credentials...", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __29__EMHideMyEmail_isAvailable___block_invoke_47;
    v11[3] = &unk_1E70F2EC8;
    v12 = v7;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v10, "renewCredentialsForAccount:completion:", v12, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __29__EMHideMyEmail_isAvailable___block_invoke_47(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __29__EMHideMyEmail_isAvailable___block_invoke_47_cold_1(v7, (uint64_t)v5, (uint64_t)&v12);
    }
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "reload");
  if (+[EMHMERecipientCreationRequest canCreateHMEReplyToAddress:](EMHMERecipientCreationRequest, "canCreateHMEReplyToAddress:", *(_QWORD *)(a1 + 32)))
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "AppleAccount<%@> renewed credentials and updated Premium Mail Settings.", (uint8_t *)&v12, 0xCu);

    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMHideMyEmailErrorDomain"), 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMHideMyEmail log](EMHideMyEmail, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __29__EMHideMyEmail_isAvailable___block_invoke_47_cold_1(v11, (uint64_t)v9, (uint64_t)&v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_9:

}

- (void)_hasCloudPlusSubscription:(void *)a1
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke;
    v5[3] = &unk_1E70F2F90;
    v6 = v3;
    objc_msgSend(v4, "performBlock:", v5);

  }
}

uint64_t __29__EMHideMyEmail_isAvailable___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "BOOLValue"), 0);
}

- (void)resetIsAvailable
{
  void *v2;
  id v3;

  -[EMHideMyEmail isAvailableLocked](self, "isAvailableLocked");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:", v2);

}

- (BOOL)isConfigured:(id *)a3
{
  void *v5;

  -[EMHideMyEmail primaryAccount](self, "primaryAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[EMHideMyEmail _isConfiguredForAccount:error:]((_BOOL8)self, v5, (uint64_t *)a3);

  return (char)a3;
}

- (BOOL)_isConfiguredForAccount:(uint64_t *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1)
    goto LABEL_18;
  if (v5)
  {
    objc_msgSend((id)a1, "forwardingEmailForAccount:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = v7 != 0;

    if (a3 && !v7)
    {
      v8 = CFSTR("Forwarding email address is not configured");
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", v8);
      a1 = 0;
      *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      +[EMHideMyEmail log](EMHideMyEmail, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[EMHideMyEmail _isConfiguredForAccount:error:].cold.1(a3, v9, v10);

      goto LABEL_13;
    }
    if (a3)
      goto LABEL_10;
  }
  else
  {
    if (a3)
    {
      v8 = CFSTR("Requires account to check for forwarding email");
      goto LABEL_8;
    }
    a1 = 0;
  }
LABEL_13:
  +[EMHideMyEmail log](EMHideMyEmail, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("NO");
    if (a1)
      v12 = CFSTR("YES");
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "Hide My Email configured for account:%@.", (uint8_t *)&v14, 0xCu);
  }

LABEL_18:
  return a1;
}

- (BOOL)isConfiguredForAccountWithAltDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authKitAccountWithAltDSID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[EMHideMyEmail _isConfiguredForAccount:error:]((_BOOL8)self, v8, (uint64_t *)a4);
  return (char)a4;
}

- (id)addLocalizedDisplayNameForAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIL_HIDE_MY_EMAIL_FRIENDLY_NAME"), &stru_1E70F6E90, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v3);
    objc_msgSend(v6, "setDisplayName:", v5);
    objc_msgSend(v6, "stringValue");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (NSString)forwardingEmailForPrimaryAccount
{
  void *v3;
  void *v4;

  -[EMHideMyEmail primaryAccount](self, "primaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[EMHideMyEmail forwardingEmailForAccount:](self, "forwardingEmailForAccount:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (id)forwardingEmailForAccount:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  EMCoreAnalyticsEvent *v19;
  void *v20;
  EMCoreAnalyticsEvent *v21;
  void *v22;
  void *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMHideMyEmail.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forwardingEmailForAccount:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMHideMyEmail primaryAccountAltDSID](self, "primaryAccountAltDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authKitAccountWithAltDSID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "username");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      v26 = 0;
      v27 = 1024;
      v28 = v13 != 0;
      _os_log_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_DEFAULT, "Attempt to fetch forwardingEmail address from AKAccountManager.sharedInstance forwardingEmailForAccount is %{BOOL}d whereas with altDSID address is %{BOOL}d", buf, 0xEu);

    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E711F338, CFSTR("forwardingEmailForHideMyEmail"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("forwardingEmailForAccountIsNil"));

    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "username");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithInt:", v17 == 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("forwardingEmailWithAltDSIDIsNil"));

    v19 = [EMCoreAnalyticsEvent alloc];
    v20 = (void *)objc_msgSend(v14, "copy");
    v21 = -[EMCoreAnalyticsEvent initWithEventName:collectionData:](v19, "initWithEventName:collectionData:", CFSTR("com.apple.mail.forwardingEmailForHideMyEmail"), v20);

    -[EMHideMyEmail analyticsCollector](self, "analyticsCollector");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logOneTimeEvent:", v21);

    objc_msgSend(v11, "username");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)hideMyEmailAddressForRecipientAddress:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EMHideMyEmail primaryAccountAltDSID](self, "primaryAccountAltDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMHideMyEmail hideMyEmailAddressForRecipientAddress:altDSID:completion:](self, "hideMyEmailAddressForRecipientAddress:altDSID:completion:", v8, v7, v6);

}

- (void)hideMyEmailAddressForRecipientAddress:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v8 = a4;
  v9 = a5;
  -[EMHideMyEmail _emailAddressFromAddress:]((uint64_t)self, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[EMHideMyEmail controller](self, "controller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke;
    v16[3] = &unk_1E70F2F68;
    v17 = v9;
    objc_msgSend(v11, "lookupPrivateEmailForAltDSID:withKey:completion:", v8, v10, v16);
    v12 = &v17;
  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v14, 3221225472, __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_85, &unk_1E70F2F90, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performBlock:", &v14);
    v12 = (id *)&v15;
  }

}

- (id)_emailAddressFromAddress:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v3);
    objc_msgSend(v4, "simpleAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_2;
  v10[3] = &unk_1E70F2F40;
  v7 = v5;
  v11 = v7;
  v13 = *(id *)(a1 + 32);
  v8 = v6;
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v10);

}

void __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "privateEmailAddress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    if (*(_QWORD *)(a1 + 40))
    {
      +[EMHideMyEmail log](EMHideMyEmail, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_2_cold_1();
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_85(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("DSID required to check is address is HME"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

- (void)hideMyEmailAddresses:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EMHideMyEmail primaryAccountAltDSID](self, "primaryAccountAltDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMHideMyEmail hideMyEmailAddressesInAccountWithAltDSID:completion:](self, "hideMyEmailAddressesInAccountWithAltDSID:completion:", v4, v5);

}

- (void)hideMyEmailAddressesInAccountWithAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id *v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2_96;
    v14[3] = &unk_1E70F2F90;
    v14[4] = v7;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performBlock:", v14);
    v13 = v14;
LABEL_6:
    v12 = (id *)(v13 + 4);
    goto LABEL_7;
  }
  -[EMHideMyEmail controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_93;
    v15[3] = &unk_1E70F2F90;
    v15[4] = v8;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performBlock:", v15);
    v13 = v15;
    goto LABEL_6;
  }
  -[EMHideMyEmail controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke;
  v16[3] = &unk_1E70F2790;
  v17 = v8;
  objc_msgSend(v11, "listAllPrivateEmailsForAltDSID:completion:", v6, v16);
  v12 = &v17;
LABEL_7:

}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2;
  v10[3] = &unk_1E70F2F40;
  v7 = v5;
  v11 = v7;
  v13 = *(id *)(a1 + 32);
  v8 = v6;
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v10);

}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "ef_mapSelector:", sel_privateEmailAddress);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_93(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Missing SPI"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2_96(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("DSID required to fetch all HME addresses"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

- (void)isHideMyEmailAddressValid:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[2];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a5;
  -[EMHideMyEmail controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke_2;
    v13[3] = &unk_1E70F2FB8;
    v14[0] = v7;
    v14[1] = self;
    v15 = v8;
    -[EMHideMyEmail hideMyEmailAddresses:](self, "hideMyEmailAddresses:", v13);
    v11 = (id *)v14;

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke;
    v16[3] = &unk_1E70F2F90;
    v17 = v8;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performBlock:", v16);
    v11 = &v17;

  }
}

uint64_t __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  EMCoreAnalyticsEvent *v12;
  void *v13;
  EMCoreAnalyticsEvent *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke_2_cold_1();
    }

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("isHideMyEmailAddressValid"));

  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("errorDomain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

  v12 = [EMCoreAnalyticsEvent alloc];
  v13 = (void *)objc_msgSend(v8, "copy");
  v14 = -[EMCoreAnalyticsEvent initWithEventName:collectionData:](v12, "initWithEventName:collectionData:", CFSTR("com.apple.mail.hideMyEmailAddressValid"), v13);

  objc_msgSend(*(id *)(a1 + 40), "analyticsCollector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logOneTimeEvent:", v14);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)generateHideMyEmailAddressForEmailAddress:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[EMHideMyEmail _emailAddressFromAddress:]((uint64_t)self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMHideMyEmail primaryAccountAltDSID](self, "primaryAccountAltDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMHideMyEmail generateHideMyEmailAddressForEmailAddress:altDSID:completion:](self, "generateHideMyEmailAddressForEmailAddress:altDSID:completion:", v6, v7, v8);

}

- (void)generateHideMyEmailAddressForEmailAddress:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id *v13;
  id v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EMHideMyEmail controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
    v17 = MEMORY[0x1E0C809B0];
    v14 = v10;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v17, 3221225472, __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_4, &unk_1E70F2F90, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performBlock:", &v17);
    v16 = &v17;
LABEL_6:
    v13 = (id *)(v16 + 4);

    goto LABEL_7;
  }
  if (!v9)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_3;
    v18[3] = &unk_1E70F2F90;
    v18[4] = v10;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performBlock:", v18);
    v16 = v18;
    goto LABEL_6;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke;
  v19[3] = &unk_1E70F3008;
  v22 = v10;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  -[EMHideMyEmail _lookUpHideMyEmailAddress:altDSID:completion:](self, v20, v21, v19);
  v13 = &v22;

LABEL_7:
}

void __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_2;
  v9[3] = &unk_1E70F2FE0;
  v4 = v3;
  v10 = v4;
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v14 = v5;
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performBlock:", v9);

}

void __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  else
    -[EMHideMyEmail _registerHideMyEmailAddress:altDSID:completion:](*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
}

- (void)_registerHideMyEmailAddress:(void *)a3 altDSID:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(a1, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke;
    v11[3] = &unk_1E70F2F68;
    v12 = v9;
    objc_msgSend(v10, "registerPrivateEmailForAltDSID:withKey:completion:", v8, v7, v11);

  }
}

- (void)_lookUpHideMyEmailAddress:(void *)a3 altDSID:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(a1, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke;
    v11[3] = &unk_1E70F2F68;
    v12 = v9;
    objc_msgSend(v10, "lookupPrivateEmailForAltDSID:withKey:completion:", v8, v7, v11);

  }
}

void __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("DSID required to generate new HME address"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

void __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("SPI is missing"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

void __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke_2;
  v10[3] = &unk_1E70F2F40;
  v7 = v5;
  v11 = v7;
  v13 = *(id *)(a1 + 32);
  v8 = v6;
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v10);

}

void __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "privateEmailAddress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    if (*(_QWORD *)(a1 + 40))
    {
      +[EMHideMyEmail log](EMHideMyEmail, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke_2_cold_1();
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke_2;
  v10[3] = &unk_1E70F2F40;
  v7 = v5;
  v11 = v7;
  v13 = *(id *)(a1 + 32);
  v8 = v6;
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v10);

}

void __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "privateEmailAddress");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke_2_cold_1(a1, v4, v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)generateReplyToEmailForRecipient:(id)a3 hmeAddress:(id)a4 account:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EMHMERecipientCreationRequest *v14;
  void *v15;
  EMHMERecipientCreationRequest *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = [EMHMERecipientCreationRequest alloc];
  -[EMHideMyEmail _emailAddressFromAddress:]((uint64_t)self, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[EMHMERecipientCreationRequest initWithAccount:recipient:hmeAddress:](v14, "initWithAccount:recipient:hmeAddress:", v12, v10, v15);

  +[EMHideMyEmail log](EMHideMyEmail, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    -[EMHMERecipientCreationRequest debugDescription](v16, "debugDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v19;
    v26 = 2112;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    _os_log_debug_impl(&dword_1B99BB000, v17, OS_LOG_TYPE_DEBUG, "ReplyTo address Request %@ for recipient:%@ hmeAddress:%@", buf, 0x20u);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke;
  v22[3] = &unk_1E70F3058;
  v18 = v13;
  v23 = v18;
  -[AARequest performRequestWithHandler:](v16, "performRequestWithHandler:", v22);

}

void __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke_2;
  v11[3] = &unk_1E70F3030;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performBlock:", v11);

}

void __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "replyToAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || *(_QWORD *)(a1 + 40))
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke_2_cold_1(v5, v6, (uint64_t)v7);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (ACAccount)primaryAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (NSString)primaryAccountAltDSID
{
  void *v2;
  void *v3;

  -[EMHideMyEmail primaryAccount](self, "primaryAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", CFSTR("altDSID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

void __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x1E0D116A0];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke_2;
  v2[3] = &unk_1E70F3080;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "requestFeatureWithId:completion:", CFSTR("mail.hide-my-email.create"), v2);

}

void __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v5, "status");
    v9 = 0;
    v10 = v8 == 0;
  }
  else
  {
    +[EMHideMyEmail log](EMHideMyEmail, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke_2_cold_1();
    }

    v10 = 0;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v6;
  }
  (*(void (**)(uint64_t, _BOOL8, id))(v7 + 16))(v7, v10, v9);

}

- (BOOL)hasCheckedIfFeatureIsAvailable
{
  return self->_hasCheckedIfFeatureIsAvailable;
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (AKPrivateEmailController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (EFAssertableScheduler)scheduler
{
  return (EFAssertableScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (EFLocked)isAvailableLocked
{
  return self->_isAvailableLocked;
}

- (void)setIsAvailableLocked:(id)a3
{
  objc_storeStrong((id *)&self->_isAvailableLocked, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isAvailableLocked, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
}

void __29__EMHideMyEmail_isAvailable___block_invoke_47_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B99BB000, "AppleAccount %@ missing PremimumMailSettings Dataclass. Renewing Credentials Failed %@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_isConfiguredForAccount:(uint64_t)a3 error:.cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a2, a3, "Hide My Email configuration error for account:%@", (uint8_t *)&v4);
}

void __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1B99BB000, v3, v4, "Is HME address failed with error: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1B99BB000, v3, v4, "Fetching HME addresses failed with error: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1B99BB000, v3, v4, "The checking for HME address is valid failed:%{public}@, adding telemetry for isHideMyEmailAddressValid session", v5);

  OUTLINED_FUNCTION_3_0();
}

void __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1B99BB000, v3, v4, "The _lookUpHideMyEmailAddress for HME address failed with error: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a2, a3, "Failed to generate new HME address. %{public}@", (uint8_t *)&v4);
}

void __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke_2_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B99BB000, "Invalid replyToAddress. Response dictionary:%@ error:%@", v5, v6);

  OUTLINED_FUNCTION_3_0();
}

void __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_4(&dword_1B99BB000, v3, v4, "Failed to check for HME feature. %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

@end
