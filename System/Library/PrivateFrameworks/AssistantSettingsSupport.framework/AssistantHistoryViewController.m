@implementation AssistantHistoryViewController

- (AssistantHistoryViewController)init
{
  AssistantHistoryViewController *v2;
  AFSettingsConnection *v3;
  AFSettingsConnection *settingsConnection;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AssistantHistoryViewController;
  v2 = -[AssistantHistoryViewController init](&v8, sel_init);
  if (v2)
  {
    v3 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v3;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_HISTORY_LABEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantHistoryViewController setTitle:](v2, "setTitle:", v6);

  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)AssistantHistoryViewController;
  -[AssistantHistoryViewController viewDidAppear:](&v23, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Siri/HISTORY"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithKey:table:locale:bundleURL:", CFSTR("Siri & Dictation History"), 0, v5, v7);

  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "deviceSupported");

  if ((_DWORD)v6)
    v10 = CFSTR("Apple Intelligence & Siri");
  else
    v10 = CFSTR("Siri");
  v11 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithKey:table:locale:bundleURL:", v10, 0, v12, v14);

  v16 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithKey:table:locale:bundleURL:", CFSTR("Siri & Dictation History"), 0, v17, v19);

  v24[0] = v15;
  v24[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantHistoryViewController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.siri"), v8, v21, v22);

}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  int64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  char **v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  NSRange v39;

  v2 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
    return v3;
  v6 = -[AssistantHistoryViewController _getDataSharingOptInStatus](self, "_getDataSharingOptInStatus");
  v37 = v2;
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (+[AssistantUtilities isRpiOnDeviceDeletionEnabled](AssistantUtilities, "isRpiOnDeviceDeletionEnabled"))
  {
    if (+[AssistantUtilities deviceIsiPhone](AssistantUtilities, "deviceIsiPhone"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPHONE_RPI_ON");
    }
    else if (+[AssistantUtilities deviceIsiPad](AssistantUtilities, "deviceIsiPad"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPAD_RPI_ON");
    }
    else
    {
      v13 = +[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v13)
        v9 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_VISION_RPI_ON");
      else
        v9 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_RPI_ON");
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_ABOUT_LINK_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = &selRef__presentAboutAssistantSheet;
    goto LABEL_33;
  }
  if ((unint64_t)(v6 - 2) < 2 || !v6)
  {
    if (+[AssistantUtilities deviceIsiPhone](AssistantUtilities, "deviceIsiPhone"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPHONE_OPTEDOUT");
      goto LABEL_31;
    }
    if (+[AssistantUtilities deviceIsiPod](AssistantUtilities, "deviceIsiPod"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPOD_OPTEDOUT");
      goto LABEL_31;
    }
    v15 = +[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v12 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_VISION_OPTEDOUT");
    else
      v12 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPAD_OPTEDOUT");
LABEL_30:
    v10 = v11;
    goto LABEL_31;
  }
  if (v6 == 1)
  {
    if (+[AssistantUtilities deviceIsiPhone](AssistantUtilities, "deviceIsiPhone"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPHONE_OPTEDIN");
LABEL_31:
      objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_32;
    }
    if (+[AssistantUtilities deviceIsiPod](AssistantUtilities, "deviceIsiPod"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPOD_OPTEDIN");
      goto LABEL_31;
    }
    v19 = +[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v12 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_VISION_OPTEDIN");
    else
      v12 = CFSTR("DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPAD_OPTEDIN");
    goto LABEL_30;
  }
  v14 = 0;
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_FOOTER_LINK"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = &selRef__presentPrivacySheet;
LABEL_33:
  v36 = v14;

  NSStringFromSelector(*v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DELETE_SIRI_HISTORY"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProperty:forKey:", v24, *MEMORY[0x24BE75A68]);

  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProperty:forKey:", v26, *MEMORY[0x24BE75A30]);

  objc_msgSend(v22, "setProperty:forKey:", v21, *MEMORY[0x24BE75A58]);
  v39.location = objc_msgSend(v21, "rangeOfString:", v17);
  NSStringFromRange(v39);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProperty:forKey:", v27, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProperty:forKey:", v28, *MEMORY[0x24BE75A50]);

  objc_msgSend(v22, "setProperty:forKey:", v20, *MEMORY[0x24BE75A38]);
  objc_msgSend(v38, "addObject:", v22);
  v29 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "deleteButtonSpecifierWithName:target:action:", v31, self, sel__handleDeleteSiriHistoryButtonPress);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "addObject:", v32);
  v33 = *(Class *)((char *)&self->super.super.super.super.super.isa + v37);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v37) = (Class)v38;
  v34 = v38;

  v35 = *(id *)((char *)&self->super.super.super.super.super.isa + v37);
  return v35;
}

- (int64_t)_getDataSharingOptInStatus
{
  dispatch_semaphore_t v3;
  AFSettingsConnection *settingsConnection;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  intptr_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  settingsConnection = self->_settingsConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__AssistantHistoryViewController__getDataSharingOptInStatus__block_invoke;
  v12[3] = &unk_24D33CB40;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  -[AFSettingsConnection getSiriDataSharingOptInStatusWithCompletion:](settingsConnection, "getSiriDataSharingOptInStatusWithCompletion:", v12);
  v6 = dispatch_time(0, 50000000);
  v7 = dispatch_semaphore_wait(v5, v6);
  v8 = (id)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    AFSiriDataSharingOptInStatusGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[AssistantHistoryViewController _getDataSharingOptInStatus]";
    v21 = 2048;
    v22 = v7;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_2153F2000, v8, OS_LOG_TYPE_DEFAULT, "%s #siriDataSharingOptInStatus dataSharingOptInFechCompletedIn:%lu optInStatus:%@", buf, 0x20u);

  }
  v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __60__AssistantHistoryViewController__getDataSharingOptInStatus__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (v5 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __60__AssistantHistoryViewController__getDataSharingOptInStatus__block_invoke_cold_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_handleDeleteSiriHistoryButtonPress
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _BOOL4 v9;
  _BOOL4 v10;
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
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isiPad");

  LODWORD(v3) = +[AssistantUtilities isRpiOnDeviceDeletionEnabled](AssistantUtilities, "isRpiOnDeviceDeletionEnabled");
  v5 = +[AssistantUtilities deviceIsiPhone](AssistantUtilities, "deviceIsiPhone");
  if (!(_DWORD)v3)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPHONE");
      goto LABEL_17;
    }
    if (+[AssistantUtilities deviceIsiPod](AssistantUtilities, "deviceIsiPod"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPOD");
      goto LABEL_17;
    }
    v10 = +[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v8 = CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_VISION");
    else
      v8 = CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPAD");
LABEL_16:
    v6 = v7;
    goto LABEL_17;
  }
  if (!v5)
  {
    if (+[AssistantUtilities deviceIsiPad](AssistantUtilities, "deviceIsiPad"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPAD_RPI_ON");
      goto LABEL_17;
    }
    v9 = +[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_VISION_RPI_ON");
    else
      v8 = CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_RPI_ON");
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPHONE_RPI_ON");
LABEL_17:
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v14, v11, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_ACTION"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __69__AssistantHistoryViewController__handleDeleteSiriHistoryButtonPress__block_invoke;
  v27 = &unk_24D33CB68;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 2, &v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v19, v24, v25, v26, v27);
  v20 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_ALERT_SHEET_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v23);
  -[AssistantHistoryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __69__AssistantHistoryViewController__handleDeleteSiriHistoryButtonPress__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deleteSiriHistory");

}

- (void)_deleteSiriHistory
{
  AFSettingsConnection *settingsConnection;
  _QWORD v4[4];
  id v5;
  id location;

  -[AssistantHistoryViewController _startIndicatorViewSpinning](self, "_startIndicatorViewSpinning");
  objc_initWeak(&location, self);
  settingsConnection = self->_settingsConnection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke;
  v4[3] = &unk_24D33CB90;
  objc_copyWeak(&v5, &location);
  -[AFSettingsConnection deleteSiriHistoryWithCompletion:](settingsConnection, "deleteSiriHistoryWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_endIndicatorViewSpinning");
    if (v3)
    {
      v6 = +[AssistantUtilities isRpiOnDeviceDeletionEnabled](AssistantUtilities, "isRpiOnDeviceDeletionEnabled");
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR);
      if (v6)
      {
        if (v7)
          __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_2();
      }
      else
      {
        if (v7)
          __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_3();
        objc_msgSend(v5, "_presentErrorAlert");
      }
    }
    else
    {
      v9 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315138;
        v12 = "-[AssistantHistoryViewController _deleteSiriHistory]_block_invoke";
        _os_log_impl(&dword_2153F2000, v9, OS_LOG_TYPE_DEFAULT, "%s #siriDataSharingOptIn: Siri History Deletion Request successful", (uint8_t *)&v11, 0xCu);
      }
      objc_msgSend(v5, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteHistorySuccessfulFromViewController:", v5);

    }
  }
  else
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_1(v8);
  }

}

- (void)_startIndicatorViewSpinning
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  PSDeleteButtonCell *v7;
  PSDeleteButtonCell *deleteButtonCell;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *indicatorView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PSDeleteButtonCell *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756D0]), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_deleteButtonCell)
  {
    -[AssistantHistoryViewController _animateSpinnerIn](self, "_animateSpinnerIn");
  }
  else if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v7 = (PSDeleteButtonCell *)objc_claimAutoreleasedReturnValue();
      deleteButtonCell = self->_deleteButtonCell;
      self->_deleteButtonCell = v7;

      v9 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x24BEBD398]);
      indicatorView = self->_indicatorView;
      self->_indicatorView = v9;

      -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_indicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIActivityIndicatorView setHidesWhenStopped:](self->_indicatorView, "setHidesWhenStopped:", 0);
      -[UIActivityIndicatorView setAlpha:](self->_indicatorView, "setAlpha:", 0.0);
      -[PSDeleteButtonCell addSubview:](self->_deleteButtonCell, "addSubview:", self->_indicatorView);
      -[UIActivityIndicatorView centerXAnchor](self->_indicatorView, "centerXAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSDeleteButtonCell centerXAnchor](self->_deleteButtonCell, "centerXAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIActivityIndicatorView centerYAnchor](self->_indicatorView, "centerYAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSDeleteButtonCell centerYAnchor](self->_deleteButtonCell, "centerYAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = self->_deleteButtonCell;
      v19[0] = v13;
      v19[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSDeleteButtonCell addConstraints:](v17, "addConstraints:", v18);

      -[AssistantHistoryViewController _animateSpinnerIn](self, "_animateSpinnerIn");
    }
  }

}

- (void)_animateSpinnerIn
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__AssistantHistoryViewController__animateSpinnerIn__block_invoke;
  v2[3] = &unk_24D33CBB8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __51__AssistantHistoryViewController__animateSpinnerIn__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__AssistantHistoryViewController__animateSpinnerIn__block_invoke_2;
  v2[3] = &unk_24D33CBB8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_msgSend(v1, "animateWithDuration:animations:", v2, 0.3);
  objc_destroyWeak(&v3);
}

void __51__AssistantHistoryViewController__animateSpinnerIn__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[173], "titleLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

    objc_msgSend(v3[174], "setAlpha:", 1.0);
    objc_msgSend(v3[174], "startAnimating");
    WeakRetained = v3;
  }

}

- (void)_endIndicatorViewSpinning
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__AssistantHistoryViewController__endIndicatorViewSpinning__block_invoke;
  v2[3] = &unk_24D33CBB8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __59__AssistantHistoryViewController__endIndicatorViewSpinning__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__AssistantHistoryViewController__endIndicatorViewSpinning__block_invoke_2;
  v2[3] = &unk_24D33CBB8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_msgSend(v1, "animateWithDuration:animations:", v2, 0.3);
  objc_destroyWeak(&v3);
}

void __59__AssistantHistoryViewController__endIndicatorViewSpinning__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[174], "stopAnimating");
    objc_msgSend(v3[174], "setAlpha:", 0.0);
    objc_msgSend(v3[173], "titleLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

    WeakRetained = v3;
  }

}

- (void)_presentErrorAlert
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __52__AssistantHistoryViewController__presentErrorAlert__block_invoke;
  v2[3] = &unk_24D33CBB8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __52__AssistantHistoryViewController__presentErrorAlert__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deletionResponseAlertForFailure");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)_deletionResponseAlertForFailure
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_ALERT_FAILURE_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_ALERT_FAILURE_MESSAGE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_ALERT_DISMISS"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  return v6;
}

- (void)_presentPrivacySheet
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improvesiridictation"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)_presentAboutAssistantSheet
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.siri"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (AssistantHistoryDelegate)delegate
{
  return (AssistantHistoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_deleteButtonCell, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

void __60__AssistantHistoryViewController__getDataSharingOptInStatus__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2153F2000, v0, v1, "%s #siriDataSharingOptInStatus: Status fetch failed with error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[AssistantHistoryViewController _deleteSiriHistory]_block_invoke";
  _os_log_error_impl(&dword_2153F2000, log, OS_LOG_TYPE_ERROR, "%s #siriDataSharingOptIn: weakSelf nil'd out while waiting for deletion completion", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2153F2000, v0, v1, "%s #RPI on-device Siri History Deletion Request failed. Skipping showing alert. error: %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2153F2000, v0, v1, "%s #siriDataSharingOptIn: Siri History Deletion Request failed with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
