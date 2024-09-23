@implementation HUSafetyAndSecuritySettingsNotificationsItemModule

- (HUSafetyAndSecuritySettingsNotificationsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUSafetyAndSecuritySettingsNotificationsItemModule *v9;
  HUSafetyAndSecuritySettingsNotificationsItemModule *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSafetyAndSecuritySettingsNotificationsItemModule.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HUSafetyAndSecuritySettingsNotificationsItemModule;
  v9 = -[HFItemModule initWithItemUpdater:](&v13, sel_initWithItemUpdater_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    -[HUSafetyAndSecuritySettingsNotificationsItemModule _buildItemProviders](v10, "_buildItemProviders");
  }

  return v10;
}

- (HUSafetyAndSecuritySettingsNotificationsItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSafetyAndSecuritySettingsNotificationsItemModule.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSafetyAndSecuritySettingsNotificationsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

+ (id)_safetyAndSecurityDeviceItemComparator
{
  return &__block_literal_global_178;
}

uint64_t __92__HUSafetyAndSecuritySettingsNotificationsItemModule__safetyAndSecurityDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0D314B0];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "defaultItemComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, id, id))v7)[2](v7, v6, v5);

  return v8;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUSafetyAndSecuritySettingsNotificationsItemModule safetyAndSecurityDeviceItemProvider](self, "safetyAndSecurityDeviceItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("notificationsSection"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecuritySettingsNotificationsSection_Header"), CFSTR("HUSafetyAndSecuritySettingsNotificationsSection_Header"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v7);

  v8 = (void *)objc_opt_new();
  -[HUSafetyAndSecuritySettingsNotificationsItemModule safetyAndSecurityDeviceItemProvider](self, "safetyAndSecurityDeviceItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v11);

  v12 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend((id)objc_opt_class(), "_safetyAndSecurityDeviceItemComparator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingComparator:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__HUSafetyAndSecuritySettingsNotificationsItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v18[3] = &unk_1E6F4DAD8;
  v19 = v4;
  v15 = v4;
  objc_msgSend(v14, "na_filter:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v16);

  objc_msgSend(v5, "addObject:", v6);
  return v5;
}

uint64_t __86__HUSafetyAndSecuritySettingsNotificationsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0D31510]);
  -[HUSafetyAndSecuritySettingsNotificationsItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithHome:", v4);

  objc_msgSend(v6, "setFilter:", &__block_literal_global_21_2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v6, &__block_literal_global_274);
  -[HUSafetyAndSecuritySettingsNotificationsItemModule setSafetyAndSecurityDeviceItemProvider:](self, "setSafetyAndSecurityDeviceItemProvider:", v5);

}

uint64_t __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF347468))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_270);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v2, "supportsAudioAnalysis");
    else
      v7 = 0;
  }

  return v7;
}

uint64_t __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isMediaAccessory"))
    v3 = objc_msgSend(v2, "supportsAudioAnalysis");
  else
    v3 = 0;

  return v3;
}

id __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D31920]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke_4;
  v7[3] = &unk_1E6F59560;
  v8 = v2;
  v4 = v2;
  v5 = (void *)objc_msgSend(v3, "initWithSourceItem:transformationBlock:", v4, v7);

  return v5;
}

id __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF347C70))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "hf_userNotificationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = objc_msgSend(v11, "areNotificationsEnabled");
  if ((_DWORD)v10)
    v12 = CFSTR("HUSafetyAndSecuritySettingsNotifications_On");
  else
    v12 = CFSTR("HUSafetyAndSecuritySettingsNotifications_Off");
  _HULocalizedStringWithDefaultValue(v12, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFItemProvider)safetyAndSecurityDeviceItemProvider
{
  return self->_safetyAndSecurityDeviceItemProvider;
}

- (void)setSafetyAndSecurityDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_safetyAndSecurityDeviceItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyAndSecurityDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
