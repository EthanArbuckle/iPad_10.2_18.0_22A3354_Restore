@implementation AFUICloudStorageViewController

- (void)viewDidLoad
{
  AFSettingsConnection *v3;
  AFSettingsConnection *settings;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUICloudStorageViewController;
  -[AFUICloudStorageViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
  settings = self->_settings;
  self->_settings = v3;

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AFUICloudStorageViewController;
  -[AFUICloudStorageViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v2 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
    return v3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v7 = (void *)getSTStorageAppHeaderCellClass_softClass;
  v22 = getSTStorageAppHeaderCellClass_softClass;
  if (!getSTStorageAppHeaderCellClass_softClass)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __getSTStorageAppHeaderCellClass_block_invoke;
    v18[3] = &unk_24D7A1A28;
    v18[4] = &v19;
    __getSTStorageAppHeaderCellClass_block_invoke((uint64_t)v18);
    v7 = (void *)v20[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v8, "specifierForAppIdentifier:", CFSTR("com.apple.siri"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVersionLabelEnabled:", 0);
  objc_msgSend(v6, "addObject:", v9);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DISABLE_AND_DELETE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _LocStr(CFSTR("DISABLE_AND_DELETE_FOOTER"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v11, *MEMORY[0x24BE75A68]);

  objc_msgSend(v6, "addObject:", v10);
  v12 = (void *)MEMORY[0x24BE75590];
  _LocStr(CFSTR("DISABLE_AND_DELETE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteButtonSpecifierWithName:target:action:", v13, self, sel_handleDisableAndDeleteButtonPress);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v14);

  v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v6;
  v16 = v6;

  v17 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  return v17;
}

- (void)handleDisableAndDeleteButtonPress
{
  AFSettingsConnection *settings;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  settings = self->_settings;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__AFUICloudStorageViewController_handleDisableAndDeleteButtonPress__block_invoke;
  v4[3] = &unk_24D7A1AE0;
  objc_copyWeak(&v5, &location);
  -[AFSettingsConnection fetchMultiUserVoiceIdentificationSetting:](settings, "fetchMultiUserVoiceIdentificationSetting:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__AFUICloudStorageViewController_handleDisableAndDeleteButtonPress__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __67__AFUICloudStorageViewController_handleDisableAndDeleteButtonPress__block_invoke_2;
  v2[3] = &unk_24D7A1C20;
  v4 = a2;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
}

void __67__AFUICloudStorageViewController_handleDisableAndDeleteButtonPress__block_invoke_2(uint64_t a1)
{
  int v1;
  id WeakRetained;
  id v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (v1)
    objc_msgSend(WeakRetained, "confirmDisableForMultiUserVoiceIdentification");
  else
    objc_msgSend(WeakRetained, "confirmDisable");

}

- (void)confirmDisableForMultiUserVoiceIdentification
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE754D0]);
  v8[0] = *MEMORY[0x24BE75990];
  _LocStr(CFSTR("DISABLE_AND_DELETE_PROMPT_TITLE_MULTI_USER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = *MEMORY[0x24BE75988];
  _LocStr(CFSTR("DISABLE_AND_DELETE_PROMPT_MULTI_USER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  v8[2] = *MEMORY[0x24BE75970];
  _LocStr(CFSTR("DISABLE_AND_DELETE_PROMPT_CANCEL_MULTI_USER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupWithDictionary:", v7);

  objc_msgSend(v3, "setTarget:", self);
  objc_msgSend(v3, "setConfirmationAction:", sel_confirmDisable);
  -[AFUICloudStorageViewController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v3);

}

- (void)confirmDisable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE754D0]);
  v9[0] = *MEMORY[0x24BE75990];
  _LocStr(CFSTR("DISABLE_AND_DELETE_PROMPT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BE75988];
  _LocStr(CFSTR("DISABLE_AND_DELETE_PROMPT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = *MEMORY[0x24BE75980];
  _LocStr(CFSTR("DISABLE_AND_DELETE_PROMPT_OK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  v9[3] = *MEMORY[0x24BE75970];
  _LocStr(CFSTR("DISABLE_AND_DELETE_PROMPT_CANCEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupWithDictionary:", v8);

  objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
  objc_msgSend(v3, "setTarget:", self);
  objc_msgSend(v3, "setConfirmationAction:", sel__disableAndDeleteCloudSync);
  -[AFUICloudStorageViewController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v3);

}

- (void)_disableAndDeleteCloudSync
{
  -[AFSettingsConnection disableAndDeleteCloudSyncWithCompletion:](self->_settings, "disableAndDeleteCloudSyncWithCompletion:", &__block_literal_global_1);
}

void __60__AFUICloudStorageViewController__disableAndDeleteCloudSync__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __60__AFUICloudStorageViewController__disableAndDeleteCloudSync__block_invoke_cold_1((uint64_t)v2, v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

void __60__AFUICloudStorageViewController__disableAndDeleteCloudSync__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[AFUICloudStorageViewController _disableAndDeleteCloudSync]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_217514000, a2, OS_LOG_TYPE_ERROR, "%s Error deleting & disabling Cloud sync: %@", (uint8_t *)&v2, 0x16u);
}

@end
