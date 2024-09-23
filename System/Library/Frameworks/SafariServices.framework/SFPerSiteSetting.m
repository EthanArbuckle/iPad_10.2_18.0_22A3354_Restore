@implementation SFPerSiteSetting

- (SFPerSiteSetting)initWithPreference:(id)a3 manager:(id)a4 domain:(id)a5
{
  id v9;
  id v10;
  id v11;
  SFPerSiteSetting *v12;
  SFPerSiteSetting *v13;
  WBSPerSitePreference *preference;
  NSString *domain;
  SFPerSiteSetting *v16;
  _QWORD v18[4];
  id v19;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[SFPerSiteSetting init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_domain, a5);
    objc_storeStrong((id *)&v13->_manager, a4);
    objc_storeStrong((id *)&v13->_preference, a3);
    objc_initWeak(&location, v13);
    preference = v13->_preference;
    domain = v13->_domain;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__SFPerSiteSetting_initWithPreference_manager_domain___block_invoke;
    v18[3] = &unk_1E4AC7318;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v10, "getValueOfPreference:forDomain:withTimeout:usingBlock:", preference, domain, 0, v18);
    v16 = v13;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __54__SFPerSiteSetting_initWithPreference_manager_domain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SFPerSiteSetting_initWithPreference_manager_domain___block_invoke_2;
  v5[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __54__SFPerSiteSetting_initWithPreference_manager_domain___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained + 1;
    if (!v3[1])
    {
      v6 = v3;
      objc_storeStrong(v4, *(id *)(a1 + 32));
      v5 = objc_loadWeakRetained(v6 + 5);
      objc_msgSend(v5, "perSiteSettingDidUpdate:", v6);

      v3 = v6;
    }
  }

}

- (void)setObserver:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_observer, obj);
    objc_msgSend(obj, "perSiteSettingDidUpdate:", self);
  }

}

- (id)_displayInformation
{
  return +[_SFPerSitePreferencePopoverDisplayInformation popoverDisplayInformationForPerSitePreference:](_SFPerSitePreferencePopoverDisplayInformation, "popoverDisplayInformationForPerSitePreference:", self->_preference);
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[SFPerSiteSetting _displayInformation](self, "_displayInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)identifier
{
  return (NSString *)-[WBSPerSitePreference identifier](self->_preference, "identifier");
}

- (unint64_t)displayOption
{
  void *v2;
  uint64_t v3;

  -[SFPerSiteSetting _displayInformation](self, "_displayInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayOption");

  return v3 != 1;
}

- (NSArray)actions
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[WBSPerSitePreferenceManager valuesForPreference:](self->_manager, "valuesForPreference:", self->_preference);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__SFPerSiteSetting_actions__block_invoke;
  v6[3] = &unk_1E4AC7340;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (NSArray *)v4;
}

id __27__SFPerSiteSetting_actions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "localizedStringForValue:inPreference:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3428];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __27__SFPerSiteSetting_actions__block_invoke_2;
  v12 = &unk_1E4ABFAA8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v6 = v3;
  v13 = v6;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v4, 0, 0, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v9, v10, v11, v12))
    objc_msgSend(v7, "setState:", 1);

  objc_destroyWeak(&v14);
  return v7;
}

void __27__SFPerSiteSetting_actions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setPreferenceValue:", *(_QWORD *)(a1 + 32));

}

- (void)_setPreferenceValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id cachedValue;
  id v8;
  BOOL v9;
  WBSPerSitePreferenceManager *manager;
  WBSPerSitePreference *preference;
  NSString *domain;
  _QWORD v13[4];
  BOOL v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPerSitePreference identifier](self->_preference, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", v6, 1, 0, 1);

  cachedValue = self->_cachedValue;
  self->_cachedValue = v4;
  v8 = v4;

  objc_opt_class();
  v9 = (objc_opt_isKindOfClass() & 1) == 0;
  manager = self->_manager;
  preference = self->_preference;
  domain = self->_domain;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__SFPerSiteSetting__setPreferenceValue___block_invoke;
  v13[3] = &__block_descriptor_33_e8_v12__0B8l;
  v14 = v9;
  -[WBSPerSitePreferenceManager setValue:ofPreference:forDomain:completionHandler:](manager, "setValue:ofPreference:forDomain:completionHandler:", v8, preference, domain, v13);

}

void __40__SFPerSiteSetting__setPreferenceValue___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(_BYTE *)(a1 + 32))
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_62);
  }
}

uint64_t __40__SFPerSiteSetting__setPreferenceValue___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0CB35B0], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
}

- (id)confirmationAlertForSwitchCell:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  -[WBSPerSitePreference identifier](self->_preference, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!WBSIsEqual())
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v4, "isOn");

  if ((v6 & 1) != 0)
  {
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x1E0DC3450];
  v8 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, self->_domain);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __51__SFPerSiteSetting_confirmationAlertForSwitchCell___block_invoke;
  v24[3] = &unk_1E4AC0010;
  v25 = v4;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v16);

  objc_initWeak(&location, self);
  v17 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __51__SFPerSiteSetting_confirmationAlertForSwitchCell___block_invoke_2;
  v21[3] = &unk_1E4AC0A90;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 2, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

LABEL_6:
  return v12;
}

uint64_t __51__SFPerSiteSetting_confirmationAlertForSwitchCell___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", 1);
}

void __51__SFPerSiteSetting_confirmationAlertForSwitchCell___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setBoolValue:", 0);

}

- (BOOL)BOOLValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(self->_cachedValue, "BOOLValue");
  else
    return 0;
}

- (void)setBoolValue:(BOOL)a3
{
  id v4;

  +[_SFPerSitePreferencesUtilities preferenceValueForBoolValue:preference:preferenceManager:](_SFPerSitePreferencesUtilities, "preferenceValueForBoolValue:preference:preferenceManager:", a3, self->_preference, self->_manager);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFPerSiteSetting _setPreferenceValue:](self, "_setPreferenceValue:", v4);

}

- (SFBrowsingAssistantPerSiteSettingObserving)observer
{
  return (SFBrowsingAssistantPerSiteSettingObserving *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_preference, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong(&self->_cachedValue, 0);
}

@end
