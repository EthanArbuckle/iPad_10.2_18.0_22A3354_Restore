@implementation CKSettingsMessagesForBusinessViewController

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSettingsMessagesForBusinessViewController;
  -[CKSettingsMessagesForBusinessViewController viewDidLoad](&v6, sel_viewDidLoad);
  MessagesSettingsLocalizedString(CFSTR("BUSINESS_CHAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsMessagesForBusinessViewController setTitle:](self, "setTitle:", v3);
  v4 = objc_alloc(MEMORY[0x24BE4FC28]);
  v5 = (void *)objc_msgSend(v4, "initWithService:queue:", *MEMORY[0x24BE4FB78], MEMORY[0x24BDAC9B8]);
  -[CKSettingsMessagesForBusinessViewController setFeatureToggler:](self, "setFeatureToggler:", v5);

  -[CKSettingsMessagesForBusinessViewController _fetchFeatureState](self, "_fetchFeatureState");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  NSRange v29;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BE75590];
    MessagesSettingsLocalizedString(CFSTR("MESSAGES_FOR_BUSINESS_GROUP_NAME"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupSpecifierWithID:name:", CFSTR("messagesForBusinessGroup"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v8);
    v9 = -[CKSettingsMessagesForBusinessViewController erroredOut](self, "erroredOut");
    v10 = (void *)MEMORY[0x24BE75590];
    MessagesSettingsLocalizedString(CFSTR("PERSONALIZED_ALERTS_TOGGLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel_unavailableString, 0, 4, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setPersonalizedAlertsEnabled_specifier_, sel_personalizedAlertsEnabled_, 0, 6, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[CKSettingsMessagesForBusinessViewController requestInFlight](self, "requestInFlight"))
        objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
      if (!-[CKSettingsMessagesForBusinessViewController featureState](self, "featureState"))
        objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75998]);
      if (objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown"))
      {
        v13 = MEMORY[0x24BDBD1C0];
        objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
        objc_msgSend(v12, "setProperty:forKey:", v13, *MEMORY[0x24BE75998]);
      }
    }
    objc_msgSend(v5, "addObject:", v12);
    MessagesSettingsLocalizedString(CFSTR("PERSONALIZED_ALERTS_GROUP_DESCRIPTION"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("BUSINESS_CHAT_PRIVACY_BUTTON"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\r%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "rangeOfString:", v15);
    v20 = v19;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v22, *MEMORY[0x24BE75A30]);

    v29.location = v18;
    v29.length = v20;
    NSStringFromRange(v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v23, *MEMORY[0x24BE75A40]);

    objc_msgSend(v8, "setProperty:forKey:", v17, *MEMORY[0x24BE75A58]);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v24, *MEMORY[0x24BE75A50]);

    NSStringFromSelector(sel__showPrivacySheetForBusinessChat);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v25, *MEMORY[0x24BE75A38]);

    v26 = (objc_class *)objc_msgSend(v5, "copy");
    v27 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v26;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)unavailableString
{
  return MessagesSettingsLocalizedString(CFSTR("PERSONALIZED_ALERTS_UNAVAILABLE"));
}

- (void)setPersonalizedAlertsEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v5 = a3;
  v6 = objc_msgSend(v5, "BOOLValue");
  -[CKSettingsMessagesForBusinessViewController setRequestInFlight:](self, "setRequestInFlight:", 1);
  v7 = -[CKSettingsMessagesForBusinessViewController featureState](self, "featureState");
  if (v6)
    v8 = 1;
  else
    v8 = 2;
  -[CKSettingsMessagesForBusinessViewController setFeatureState:](self, "setFeatureState:", v8);
  -[CKSettingsMessagesForBusinessViewController reloadSpecifiers](self, "reloadSpecifiers");
  objc_msgSend(MEMORY[0x24BE4FC20], "optionsWithFeatureID:state:", CFSTR("bia-opt-out"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsMessagesForBusinessViewController featureToggler](self, "featureToggler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__CKSettingsMessagesForBusinessViewController_setPersonalizedAlertsEnabled_specifier___block_invoke;
  v12[3] = &unk_24D0761D0;
  v13 = v5;
  v14 = v7;
  v12[4] = self;
  v11 = v5;
  objc_msgSend(v10, "updateFeatureToggleStateWithOptions:completion:", v9, v12);

}

void __86__CKSettingsMessagesForBusinessViewController_setPersonalizedAlertsEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setRequestInFlight:", 0);
  if (objc_msgSend(v3, "error"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFeatureState:", *(_QWORD *)(a1 + 48));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = 138412546;
        v7 = v5;
        v8 = 2048;
        v9 = objc_msgSend(v3, "error");
        _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_INFO, "Error setting Personalized Alerts toggle. Setting to value: %@. Error: %lu", (uint8_t *)&v6, 0x16u);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");

}

- (id)personalizedAlertsEnabled:(id)a3
{
  void *v4;

  if ((objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown", a3) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDBD1C0];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[CKSettingsMessagesForBusinessViewController featureState](self, "featureState") == 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_showPrivacySheetForBusinessChat
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.businesschat"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)_showOnboarding
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if ((objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown") & 1) == 0)
  {
    v3 = CUTWeakLinkClass();
    if (v3)
    {
      v4 = (objc_class *)v3;
      objc_initWeak(&location, self);
      v8 = MEMORY[0x24BDAC760];
      v9 = 3221225472;
      v10 = __62__CKSettingsMessagesForBusinessViewController__showOnboarding__block_invoke;
      v11 = &unk_24D0761F8;
      objc_copyWeak(&v12, &location);
      v5 = (void *)MEMORY[0x2199B8E98](&v8);
      v6 = [v4 alloc];
      v7 = (void *)objc_msgSend(v6, "initWithCompletionHandler:", v5, v8, v9, v10, v11);
      objc_msgSend(v7, "setupNotNowWithActionHandler:", v5);
      -[CKSettingsMessagesForBusinessViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __62__CKSettingsMessagesForBusinessViewController__showOnboarding__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchFeatureState");

}

- (void)_fetchFeatureState
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if ((objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE4FC18], "optionsWithFeatureID:", CFSTR("bia-opt-out"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[CKSettingsMessagesForBusinessViewController featureToggler](self, "featureToggler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __65__CKSettingsMessagesForBusinessViewController__fetchFeatureState__block_invoke;
    v5[3] = &unk_24D076220;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "retrieveFeatureToggleStateForOptions:completion:", v3, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);

  }
}

void __65__CKSettingsMessagesForBusinessViewController__fetchFeatureState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  if (!objc_msgSend(v7, "success"))
    goto LABEL_6;
  v3 = objc_msgSend(v7, "state");
  if ((unint64_t)(v3 - 1) < 2)
  {
    v5 = objc_msgSend(v7, "state");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setFeatureState:", v5);
    goto LABEL_8;
  }
  if (v3 == 3 || !v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_showOnboarding");
  }
  else
  {
LABEL_6:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setErroredOut:", 1);
  }
LABEL_8:

  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "reloadSpecifiers");

}

- (CKLazuliEnablementManager)lazuliEnablementManager
{
  return self->_lazuliEnablementManager;
}

- (void)setLazuliEnablementManager:(id)a3
{
  objc_storeStrong((id *)&self->_lazuliEnablementManager, a3);
}

- (IDSFeatureToggler)featureToggler
{
  return self->_featureToggler;
}

- (void)setFeatureToggler:(id)a3
{
  objc_storeStrong((id *)&self->_featureToggler, a3);
}

- (unint64_t)featureState
{
  return self->_featureState;
}

- (void)setFeatureState:(unint64_t)a3
{
  self->_featureState = a3;
}

- (BOOL)requestInFlight
{
  return self->_requestInFlight;
}

- (void)setRequestInFlight:(BOOL)a3
{
  self->_requestInFlight = a3;
}

- (BOOL)erroredOut
{
  return self->_erroredOut;
}

- (void)setErroredOut:(BOOL)a3
{
  self->_erroredOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureToggler, 0);
  objc_storeStrong((id *)&self->_lazuliEnablementManager, 0);
}

@end
