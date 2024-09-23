@implementation GMSpecifierProvider

- (GMSpecifierProvider)initWithPresenter:(id)a3
{
  id v4;
  void *v5;
  GMSpecifierProvider *v6;

  v4 = a3;
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GMSpecifierProvider initWithPresenter:eligibilityProvider:](self, "initWithPresenter:eligibilityProvider:", v4, v5);

  return v6;
}

- (GMSpecifierProvider)initWithPresenter:(id)a3 eligibilityProvider:(id)a4
{
  id v6;
  id v7;
  GMSpecifierProvider *v8;
  GMSpecifierProvider *v9;
  uint64_t v10;
  _TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_ *gmSpecifierController;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GMSpecifierProvider;
  v8 = -[GMSpecifierProvider init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    v9->_requestState = 0;
    objc_storeStrong((id *)&v9->_gmEligibilityProvider, a4);
    -[GMEligibilityProviderProtocol gmSpecifierController](v9->_gmEligibilityProvider, "gmSpecifierController");
    v10 = objc_claimAutoreleasedReturnValue();
    gmSpecifierController = v9->_gmSpecifierController;
    v9->_gmSpecifierController = (_TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_ *)v10;

    v9->_gmEligibilityContext = 0;
  }

  return v9;
}

- (id)_configuredGMSpecifier
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _TtP24AssistantSettingsSupport29GMEligibilityProviderProtocol_ *gmEligibilityProvider;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v3 = 0;
  v15 = *MEMORY[0x24BDAC8D0];
  switch(self->_gmEligibilityContext)
  {
    case 3:
    case 0xBLL:
    case 0x14:
      v4 = 1;
      goto LABEL_9;
    case 4:
    case 0xALL:
    case 0x15:
      v5 = 1;
      goto LABEL_7;
    case 5:
    case 0xCLL:
      -[GMSpecifierProvider _rampedSpecifier](self, "_rampedSpecifier");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 7:
      v5 = 0;
LABEL_7:
      -[GMSpecifierProvider _inWaitlistSpecifierWithEnablement:](self, "_inWaitlistSpecifierWithEnablement:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 8:
      v4 = 0;
LABEL_9:
      -[GMSpecifierProvider _joinWaitlistSpecifierWithEnablement:](self, "_joinWaitlistSpecifierWithEnablement:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 9:
      -[GMSpecifierProvider _rampedSpecifierWithEnablement:](self, "_rampedSpecifierWithEnablement:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 0x13:
    case 0x16:
      -[GMSpecifierProvider _downloadingSpecifier](self, "_downloadingSpecifier");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v3 = (void *)v6;
      break;
    default:
      break;
  }
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    gmEligibilityProvider = self->_gmEligibilityProvider;
    v9 = v7;
    v11 = 136315394;
    v12 = "-[GMSpecifierProvider _configuredGMSpecifier]";
    v13 = 2048;
    v14 = -[GMEligibilityProviderProtocol eligibility](gmEligibilityProvider, "eligibility");
    _os_log_impl(&dword_2153F2000, v9, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment returning specifier for context %ld", (uint8_t *)&v11, 0x16u);

  }
  return v3;
}

- (id)_rampedSpecifier
{
  void *v3;

  if ((-[GMSpecifierControllerProcotol hasEngagedCFU](self->_gmSpecifierController, "hasEngagedCFU") & 1) != 0
    || -[GMSpecifierControllerProcotol featureOptInStatus](self->_gmSpecifierController, "featureOptInStatus"))
  {
    -[GMSpecifierProvider _rampedSpecifierWithEnablement:](self, "_rampedSpecifierWithEnablement:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GMSpecifierProvider _rampedSpecifierWithButton:](self, "_rampedSpecifierWithButton:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_downloadingSpecifier
{
  if (-[GMSpecifierControllerProcotol hasEngagedCFU](self->_gmSpecifierController, "hasEngagedCFU"))
    -[GMSpecifierProvider _rampedSpecifierWithEnablement:](self, "_rampedSpecifierWithEnablement:", 1);
  else
    -[GMSpecifierProvider _rampedPreparingSpecifier](self, "_rampedPreparingSpecifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_joinWaitlistSpecifierWithEnablement:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D33E0B0, self, 0, 0, 0, -1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GM_WAITLIST_SPECIFIER_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  objc_msgSend(v4, "setProperty:forKey:", CFSTR("GM_RAMP_SPECIFIER"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v4, "setButtonAction:", sel_GMJoinWaitlistTapped_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);

  objc_msgSend(v4, "setCellType:", 13);
  return v4;
}

- (id)_inWaitlistSpecifierWithEnablement:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D33E0B0, self, 0, sel_valueForGMRampSpecifier_, 0, -1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GM_RAMP_SPECIFIER_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  objc_msgSend(v4, "setProperty:forKey:", CFSTR("GM_RAMP_SPECIFIER"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);

  objc_msgSend(v4, "setCellType:", -1);
  return v4;
}

- (id)_rampedPreparingSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D33E0B0, self, 0, 0, 0, -1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("GM_RAMP_SPECIFIER_STATUS_PREPARING_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(v2, "setProperty:forKey:", CFSTR("GM_RAMP_PREPARING_SPECIFIER"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v2, "setCellType:", -1);
  return v2;
}

- (id)_rampedSpecifierWithEnablement:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D33E0B0, self, sel_setgmUserOptInStatus_, sel_gmUserOptInStatus_, 0, -1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GM_RAMP_SPECIFIER_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  objc_msgSend(v4, "setProperty:forKey:", CFSTR("GM_RAMP_SPECIFIER"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);

  objc_msgSend(v4, "setCellType:", 6);
  return v4;
}

- (id)_rampedSpecifierWithButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D33E0B0, self, 0, 0, 0, -1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GM_TURN_ON_GM_BUTTON_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  objc_msgSend(v4, "setProperty:forKey:", CFSTR("GM_RAMP_SPECIFIER"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v4, "setButtonAction:", sel_turnOnGmTapped_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);

  objc_msgSend(v4, "setCellType:", 13);
  return v4;
}

- (id)fetchGMRampSpecifierWith:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _TtP24AssistantSettingsSupport29GMEligibilityProviderProtocol_ *gmEligibilityProvider;
  NSObject *v8;
  int v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[GMEligibilityProviderProtocol eligibility](self->_gmEligibilityProvider, "eligibility", a3) == 17
    || (-[GMSpecifierControllerProcotol gmFFEnabled](self->_gmSpecifierController, "gmFFEnabled") & 1) == 0)
  {
    v6 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      gmEligibilityProvider = self->_gmEligibilityProvider;
      v8 = v6;
      LODWORD(gmEligibilityProvider) = -[GMEligibilityProviderProtocol eligibility](gmEligibilityProvider, "eligibility") == 17;
      v9 = -[GMSpecifierControllerProcotol gmFFEnabled](self->_gmSpecifierController, "gmFFEnabled");
      v11 = 136315650;
      v12 = "-[GMSpecifierProvider fetchGMRampSpecifierWith:]";
      v13 = 1024;
      v14 = (int)gmEligibilityProvider;
      v15 = 1024;
      v16 = v9;
      _os_log_impl(&dword_2153F2000, v8, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment GMEligibilityContextDeviceNotCapable: %d and CSFAnyFFEnabled: %d", (uint8_t *)&v11, 0x18u);

    }
    return 0;
  }
  else
  {
    self->_gmEligibilityContext = -[GMEligibilityProviderProtocol eligibility](self->_gmEligibilityProvider, "eligibility");
    -[GMSpecifierProvider _configuredGMSpecifier](self, "_configuredGMSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && -[GMEligibilityProviderProtocol eligibility](self->_gmEligibilityProvider, "eligibility"))
    {
      -[GMEligibilityProviderProtocol setRequestState:](self->_gmEligibilityProvider, "setRequestState:", 0);
      v5 = v4;
    }
    else
    {
      v5 = 0;
    }

    return v5;
  }
}

- (void)fetchGMRampStatus
{
  NSObject *v3;
  void *v4;
  _TtP24AssistantSettingsSupport29GMEligibilityProviderProtocol_ *gmEligibilityProvider;
  NSObject *v6;
  int v7;
  void *gmEligibilityContext;
  _TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_ *gmSpecifierController;
  _QWORD v10[4];
  id v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[GMEligibilityProviderProtocol eligibility](self->_gmEligibilityProvider, "eligibility") == 17
    || (-[GMSpecifierControllerProcotol gmFFEnabled](self->_gmSpecifierController, "gmFFEnabled") & 1) == 0)
  {
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      gmEligibilityProvider = self->_gmEligibilityProvider;
      v6 = v4;
      LODWORD(gmEligibilityProvider) = -[GMEligibilityProviderProtocol eligibility](gmEligibilityProvider, "eligibility") == 17;
      v7 = -[GMSpecifierControllerProcotol gmFFEnabled](self->_gmSpecifierController, "gmFFEnabled");
      *(_DWORD *)buf = 136315650;
      v13 = "-[GMSpecifierProvider fetchGMRampStatus]";
      v14 = 1024;
      v15 = (int)gmEligibilityProvider;
      v16 = 1024;
      v17 = v7;
      _os_log_impl(&dword_2153F2000, v6, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment GMEligibilityContextDeviceNotCapable: %d and CSFAnyFFEnabled: %d", buf, 0x18u);

    }
  }
  else if (self->_requestState == 1)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[GMSpecifierProvider fetchGMRampStatus]";
      _os_log_impl(&dword_2153F2000, v3, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment request is already in progress. Bailing.", buf, 0xCu);
    }
  }
  else
  {
    gmEligibilityContext = (void *)self->_gmEligibilityContext;
    self->_requestState = 1;
    objc_initWeak((id *)buf, self);
    gmSpecifierController = self->_gmSpecifierController;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __40__GMSpecifierProvider_fetchGMRampStatus__block_invoke;
    v10[3] = &unk_24D33CE28;
    objc_copyWeak(v11, (id *)buf);
    v11[1] = gmEligibilityContext;
    -[GMSpecifierControllerProcotol fetchStatusWithCompletionHandler:](gmSpecifierController, "fetchStatusWithCompletionHandler:", v10);
    objc_destroyWeak(v11);
    objc_destroyWeak((id *)buf);
  }
}

void __40__GMSpecifierProvider_fetchGMRampStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    *((_QWORD *)WeakRetained + 5) = 2;
    if (*(_QWORD *)(a1 + 40) != a2)
    {
      *((_QWORD *)WeakRetained + 6) = a2;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __40__GMSpecifierProvider_fetchGMRampStatus__block_invoke_28;
      block[3] = &unk_24D33CBB8;
      objc_copyWeak(&v9, v4);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v9);
    }
  }
  else
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[GMSpecifierProvider fetchGMRampStatus]_block_invoke";
      _os_log_impl(&dword_2153F2000, v7, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment self is unavailable at fetchStatus completion. Bailing.", buf, 0xCu);
    }
  }

}

void __40__GMSpecifierProvider_fetchGMRampStatus__block_invoke_28(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadGMSpecifier");
    WeakRetained = v2;
  }

}

- (id)valueForGMRampSpecifier:(id)a3
{
  void *v3;
  void *v4;

  +[AssistantController bundle](AssistantController, "bundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("GM_RAMP_SPECIFIER_STATUS_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)gmUserOptInStatus:(id)a3
{
  void *v4;

  if (-[GMEligibilityProviderProtocol eligibility](self->_gmEligibilityProvider, "eligibility", a3) == 9)
  {
    v4 = (void *)MEMORY[0x24BDBD1C0];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[GMSpecifierControllerProcotol featureOptInStatus](self->_gmSpecifierController, "featureOptInStatus"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setgmUserOptInStatus:(id)a3
{
  -[GMSpecifierControllerProcotol setFeatureOptInStatusWithEnabled:](self->_gmSpecifierController, "setFeatureOptInStatusWithEnabled:", objc_msgSend(a3, "BOOLValue"));
  -[GMSpecifierProvider reloadGMSpecifier](self, "reloadGMSpecifier");
}

- (void)reloadGMSpecifier
{
  PSListController **p_listController;
  id WeakRetained;
  id v4;

  p_listController = &self->_listController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v4, "reloadSpecifiers");

  }
}

- (int64_t)status
{
  return -[GMEligibilityProviderProtocol eligibility](self->_gmEligibilityProvider, "eligibility");
}

- (void)GMJoinWaitlistTapped:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  VTUIGMEnrollmentViewController *v7;
  VTUIGMEnrollmentViewController *gmEnrollmentViewController;
  id WeakRetained;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getVTUIGMEnrollmentViewControllerClass_softClass;
  v14 = getVTUIGMEnrollmentViewControllerClass_softClass;
  if (!getVTUIGMEnrollmentViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getVTUIGMEnrollmentViewControllerClass_block_invoke;
    v10[3] = &unk_24D33CD10;
    v10[4] = &v11;
    __getVTUIGMEnrollmentViewControllerClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v7 = (VTUIGMEnrollmentViewController *)objc_msgSend([v6 alloc], "initWithDelegate:", self);
  gmEnrollmentViewController = self->_gmEnrollmentViewController;
  self->_gmEnrollmentViewController = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", self->_gmEnrollmentViewController, 1, &__block_literal_global_1);

}

void __44__GMSpecifierProvider_GMJoinWaitlistTapped___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[GMSpecifierProvider GMJoinWaitlistTapped:]_block_invoke";
    _os_log_impl(&dword_2153F2000, v0, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment View Controller Presented", (uint8_t *)&v1, 0xCu);
  }
}

- (void)turnOnGmTapped:(id)a3
{
  PSListController **p_listController;
  id WeakRetained;
  char isKindOfClass;
  id v6;

  p_listController = &self->_listController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v6, "performSelector:", sel_handleGmCFU);

  }
}

- (void)siriGMIntroViewControllerContinuePressed:(id)a3
{
  id v4;
  _TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_ *gmSpecifierController;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  if (-[GMEligibilityProviderProtocol eligibility](self->_gmEligibilityProvider, "eligibility") == 5)
  {
    -[GMSpecifierControllerProcotol setFeatureOptInStatusWithEnabled:](self->_gmSpecifierController, "setFeatureOptInStatusWithEnabled:", 1);
    -[GMSpecifierProvider dismissGMIntroViewController](self, "dismissGMIntroViewController");
    -[GMSpecifierProvider reloadGMSpecifier](self, "reloadGMSpecifier");
  }
  else
  {
    objc_initWeak(&location, self);
    gmSpecifierController = self->_gmSpecifierController;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __64__GMSpecifierProvider_siriGMIntroViewControllerContinuePressed___block_invoke;
    v6[3] = &unk_24D33CE70;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    -[GMSpecifierControllerProcotol enrollWithCompletionHandler:](gmSpecifierController, "enrollWithCompletionHandler:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __64__GMSpecifierProvider_siriGMIntroViewControllerContinuePressed___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD block[4];
  id v8;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    *((_QWORD *)WeakRetained + 6) = a2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setEligibility:", a2);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__GMSpecifierProvider_siriGMIntroViewControllerContinuePressed___block_invoke_2;
    block[3] = &unk_24D33CBB8;
    objc_copyWeak(&v8, v4);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v8);
  }

}

void __64__GMSpecifierProvider_siriGMIntroViewControllerContinuePressed___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissGMIntroViewController");
    v2 = objc_loadWeakRetained(v3 + 3);
    objc_msgSend(v2, "reloadSpecifiers");

    WeakRetained = v3;
  }

}

- (void)dismissGMIntroViewController
{
  VTUIGMEnrollmentViewController *gmEnrollmentViewController;

  gmEnrollmentViewController = self->_gmEnrollmentViewController;
  if (gmEnrollmentViewController)
    -[VTUIGMEnrollmentViewController dismissViewControllerAnimated:completion:](gmEnrollmentViewController, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_35);
}

void __51__GMSpecifierProvider_dismissGMIntroViewController__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[GMSpecifierProvider dismissGMIntroViewController]_block_invoke";
    _os_log_impl(&dword_2153F2000, v0, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment View Controller Dismissed", (uint8_t *)&v1, 0xCu);
  }
}

- (void)clearCFU
{
  -[GMSpecifierControllerProcotol clearCFUWithCompletionHandler:](self->_gmSpecifierController, "clearCFUWithCompletionHandler:", &__block_literal_global_37);
}

void __31__GMSpecifierProvider_clearCFU__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[GMSpecifierProvider clearCFU]_block_invoke";
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_2153F2000, v4, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment GM Enrollment CFU could not be cleared %@", (uint8_t *)&v6, 0x16u);

    }
  }

}

- (void)updateWithContext:(int64_t)a3
{
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  self->_gmEligibilityContext = a3;
  -[GMEligibilityProviderProtocol setEligibility:](self->_gmEligibilityProvider, "setEligibility:", a3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__GMSpecifierProvider_updateWithContext___block_invoke;
  v5[3] = &unk_24D33CBB8;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __41__GMSpecifierProvider_updateWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadGMSpecifier");
    WeakRetained = v2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmEnrollmentViewController, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_gmEligibilityProvider, 0);
  objc_storeStrong((id *)&self->_gmSpecifierController, 0);
}

@end
