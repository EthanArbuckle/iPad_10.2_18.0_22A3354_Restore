@implementation HUAnnounceSettingsItemModule

- (HUAnnounceSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 settingsContext:(unint64_t)a5
{
  id v9;
  id v10;
  HUAnnounceSettingsItemModule *v11;
  HUAnnounceSettingsItemModule *v12;
  void *v14;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAnnounceSettingsItemModule.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  v15.receiver = self;
  v15.super_class = (Class)HUAnnounceSettingsItemModule;
  v11 = -[HFItemModule initWithItemUpdater:](&v15, sel_initWithItemUpdater_, v9);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    v12->_settingsContext = a5;
    -[HUAnnounceSettingsItemModule _buildItemProviders](v12, "_buildItemProviders");
  }

  return v12;
}

- (HUAnnounceSettingsItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAnnounceSettingsItemModule.m"), 51, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAnnounceSettingsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUAnnounceSettingsItemModule notificationSettingsItemProvider](self, "notificationSettingsItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceSettingsItemModule announceDeviceItemProvider](self, "announceDeviceItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceSettingsItemModule announceOtherDeviceItemProvider](self, "announceOtherDeviceItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnounceSettingsItemModule userItemProvider](self, "userItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  id v76;
  void *v77;
  id obj;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (-[HUAnnounceSettingsItemModule settingsContext](self, "settingsContext") != 3)
  {
    -[HUAnnounceSettingsItemModule home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hf_shouldShowAnnounceFeatureForThisHome");

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAnnounceSettingsNotificationSettingsItemSectionIdentifier"));
      if (-[HUAnnounceSettingsItemModule settingsContext](self, "settingsContext") != 2)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsNotificationsSection_Header"), CFSTR("HUAnnounceSettingsNotificationsSection_Header"), 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHeaderTitle:", v9);

      }
      -[HUAnnounceSettingsItemModule notificationSettingsItemProvider](self, "notificationSettingsItemProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_182);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_3;
      v87[3] = &unk_1E6F4DAD8;
      v88 = v4;
      objc_msgSend(v13, "na_filter:", v87);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setItems:", v14);

      objc_msgSend(v5, "addObject:", v8);
      objc_msgSend(v8, "setFooterTitle:", 0);
      objc_msgSend(v8, "items");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 == 1)
      {
        objc_opt_class();
        objc_msgSend(v8, "items");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        if (v20 && objc_msgSend(v20, "notificationMode") == 1)
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsNotificationsSection_Footer"), CFSTR("HUAnnounceSettingsNotificationsSection_Footer"), 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setFooterTitle:", v21);

        }
      }

    }
  }
  if (-[HUAnnounceSettingsItemModule settingsContext](self, "settingsContext"))
  {
    if (-[HUAnnounceSettingsItemModule settingsContext](self, "settingsContext") != 2)
    {
      -[HUAnnounceSettingsItemModule home](self, "home");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "hf_shouldShowAnnounceFeatureForThisHome");

      if (v23)
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAnnounceSettingsUserItemSectionIdentifier"));
        if (-[HUAnnounceSettingsItemModule settingsContext](self, "settingsContext") != 3)
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsUserSection_Header"), CFSTR("HUAnnounceSettingsUserSection_Header"), 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setHeaderTitle:", v25);

          _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsUserSection_Footer"), CFSTR("HUAnnounceSettingsUserSection_Footer"), 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setFooterTitle:", v26);

        }
        -[HUAnnounceSettingsItemModule userItemProvider](self, "userItemProvider");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "items");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "allObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_userItemComparator");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sortedArrayUsingComparator:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_4;
        v85[3] = &unk_1E6F4DAD8;
        v86 = v4;
        objc_msgSend(v31, "na_filter:", v85);
        v32 = v4;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setItems:", v33);

        v4 = v32;
        objc_msgSend(v5, "addObject:", v24);

      }
    }
  }
  if (-[HUAnnounceSettingsItemModule settingsContext](self, "settingsContext") != 2
    && -[HUAnnounceSettingsItemModule settingsContext](self, "settingsContext") != 3)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAnnounceSettingsAnnounceDeviceItemSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsHomePodSection_Header"), CFSTR("HUAnnounceSettingsHomePodSection_Header"), 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setHeaderTitle:", v35);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsHomePodSection_Footer"), CFSTR("HUAnnounceSettingsHomePodSection_Footer"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFooterTitle:", v36);

    v37 = (void *)objc_opt_new();
    -[HUAnnounceSettingsItemModule announceDeviceItemProvider](self, "announceDeviceItemProvider");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "items");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allObjects");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "na_safeAddObjectsFromArray:", v40);

    -[HUAnnounceSettingsItemModule announceOtherDeviceItemProvider](self, "announceOtherDeviceItemProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "items");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "allObjects");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "na_safeAddObjectsFromArray:", v43);

    -[HUAnnounceSettingsItemModule announceOtherDeviceItemProvider](self, "announceOtherDeviceItemProvider");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "items");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    if (v46)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsAccessoriesSection_Header"), CFSTR("HUAnnounceSettingsAccessoriesSection_Header"), 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setHeaderTitle:", v47);

      _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsAccessoriesSection_Footer"), CFSTR("HUAnnounceSettingsAccessoriesSection_Footer"), 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFooterTitle:", v48);

    }
    else
    {
      v75 = v37;
      v76 = v4;
      v77 = v5;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      -[HUAnnounceSettingsItemModule announceDeviceItemProvider](self, "announceDeviceItemProvider");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "items");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v50;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v82;
        while (2)
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v82 != v53)
              objc_enumerationMutation(obj);
            v55 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            objc_opt_class();
            v56 = v55;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v57 = v56;
            else
              v57 = 0;
            v58 = v57;

            objc_opt_class();
            objc_msgSend(v58, "sourceItem");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v60 = v59;
            else
              v60 = 0;
            v61 = v60;

            objc_opt_class();
            objc_msgSend(v58, "sourceItem");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v63 = v62;
            else
              v63 = 0;
            v64 = v63;

            if (v61)
              v65 = v61;
            else
              v65 = v64;
            objc_msgSend(v65, "accessories");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "anyObject");
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v67, "hf_isSiriEndpoint"))
            {
              _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsAccessoriesSection_Header"), CFSTR("HUAnnounceSettingsAccessoriesSection_Header"), 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setHeaderTitle:", v68);

              _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSettingsAccessoriesSection_Footer"), CFSTR("HUAnnounceSettingsAccessoriesSection_Footer"), 1);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setFooterTitle:", v69);

              goto LABEL_46;
            }

          }
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
          if (v52)
            continue;
          break;
        }
      }
LABEL_46:

      v4 = v76;
      v5 = v77;
      v37 = v75;
    }
    v70 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend((id)objc_opt_class(), "_announceDeviceItemComparator");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "sortedArrayUsingComparator:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_5;
    v79[3] = &unk_1E6F4DAD8;
    v80 = v4;
    objc_msgSend(v72, "na_filter:", v79);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setItems:", v73);

    objc_msgSend(v5, "addObject:", v34);
  }

  return v5;
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30DA8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30DA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = -1;
  else
    v10 = v9 != 0;
  if (v7)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
    v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __64__HUAnnounceSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)updateNotificationSettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7
    && (-[HUAnnounceSettingsItemModule notificationSettingsItemProvider](self, "notificationSettingsItemProvider"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "items"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "containsObject:", v5),
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA350]), "initWithDeviceNotificationMode:", objc_msgSend(v7, "notificationMode"));
    -[HUAnnounceSettingsItemModule _updateNotificationSettings:](self, "_updateNotificationSettings:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)enablePermissionSetting:(BOOL)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  HUAnnounceSettingsItemModule *v18;
  BOOL v19;

  v6 = a4;
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9
    && (-[HUAnnounceSettingsItemModule userItemProvider](self, "userItemProvider"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "items"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsObject:", v7),
        v11,
        v10,
        v12))
  {
    v13 = (void *)MEMORY[0x1E0D519C0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke;
    v16[3] = &unk_1E6F4DF30;
    v19 = a3;
    v17 = v9;
    v18 = self;
    objc_msgSend(v13, "futureWithBlock:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setEnableAnnounce:", *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E6F589A8;
  objc_copyWeak(&v10, &location);
  v5 = v3;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v6)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Failed to update enable announce setting : %@", buf, 0xCu);
    }

    objc_msgSend(a1[4], "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke_45;
    v13 = &unk_1E6F4F418;
    v14 = WeakRetained;
    v15 = a1[5];
    objc_msgSend(v9, "dispatchHomeObserverMessage:sender:", &v10, 0);

    objc_msgSend(a1[4], "finishWithResult:error:", v5, 0, v10, v11, v12, v13, v14);
  }

}

void __64__HUAnnounceSettingsItemModule_enablePermissionSetting_forItem___block_invoke_45(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "user");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didUpdateAccessControlForUser:", v3, v4);

  }
}

- (id)enableAnnounceSetting:(BOOL)a3 forItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  objc_msgSend(a4, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &unk_1EF2AC1D8;
  if (objc_msgSend(v5, "conformsToProtocol:", v6))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__HUAnnounceSettingsItemModule_enableAnnounceSetting_forItem___block_invoke;
    v12[3] = &unk_1E6F51990;
    v13 = v8;
    v14 = a3;
    objc_msgSend(v9, "futureWithBlock:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __62__HUAnnounceSettingsItemModule_enableAnnounceSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setEnableAnnounce:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HUAnnounceSettingsItemModule_enableAnnounceSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E6F4C610;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v7);

}

void __62__HUAnnounceSettingsItemModule_enableAnnounceSetting_forItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Failed to update enable announce setting : %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v5, v6);

}

+ (id)_announceDeviceItemComparator
{
  return &__block_literal_global_107_1;
}

uint64_t __61__HUAnnounceSettingsItemModule__announceDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (id)_userItemComparator
{
  return &__block_literal_global_109_4;
}

uint64_t __51__HUAnnounceSettingsItemModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30ED8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "type") || !objc_msgSend(v10, "type"))
  {
    if (objc_msgSend(v8, "type") && !objc_msgSend(v10, "type"))
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
      v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v4, v5);

    }
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (void)_buildItemProviders
{
  HUAnnounceNotificationSettingsItemProvider *v3;
  void *v4;
  HUAnnounceNotificationSettingsItemProvider *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];

  v3 = [HUAnnounceNotificationSettingsItemProvider alloc];
  -[HUAnnounceSettingsItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUAnnounceNotificationSettingsItemProvider initWithHome:](v3, "initWithHome:", v4);
  -[HUAnnounceSettingsItemModule setNotificationSettingsItemProvider:](self, "setNotificationSettingsItemProvider:", v5);

  v6 = objc_alloc(MEMORY[0x1E0D31510]);
  -[HUAnnounceSettingsItemModule home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithHome:", v7);

  objc_msgSend(v8, "setFilter:", &__block_literal_global_113_2);
  v9 = objc_alloc(MEMORY[0x1E0D31928]);
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_3;
  v24[3] = &unk_1E6F58CB0;
  v24[4] = self;
  v11 = (void *)objc_msgSend(v9, "initWithSourceProvider:transformationBlock:", v8, v24);
  -[HUAnnounceSettingsItemModule setAnnounceDeviceItemProvider:](self, "setAnnounceDeviceItemProvider:", v11);

  v12 = objc_alloc(MEMORY[0x1E0D310B0]);
  -[HUAnnounceSettingsItemModule home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithHome:", v13);

  objc_msgSend(v14, "setFilter:", &__block_literal_global_328);
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_6;
  v23[3] = &unk_1E6F4FB28;
  v23[4] = self;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v14, v23);
  -[HUAnnounceSettingsItemModule setAnnounceOtherDeviceItemProvider:](self, "setAnnounceOtherDeviceItemProvider:", v15);

  v16 = objc_alloc(MEMORY[0x1E0D31990]);
  -[HUAnnounceSettingsItemModule home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithHome:", v17);
  -[HUAnnounceSettingsItemModule setUserItemProvider:](self, "setUserItemProvider:", v18);

  -[HUAnnounceSettingsItemModule userItemProvider](self, "userItemProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIncludeCurrentUser:", 1);

  -[HUAnnounceSettingsItemModule home](self, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");
  -[HUAnnounceSettingsItemModule userItemProvider](self, "userItemProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setIncludeOtherUsers:", v21);

}

uint64_t __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
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
    v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_320);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v2, "supportsAnnounce");
    else
      v7 = 0;
  }

  return v7;
}

uint64_t __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isMediaAccessory"))
    v3 = objc_msgSend(v2, "supportsAnnounce");
  else
    v3 = 0;

  return v3;
}

id __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_4;
  v9[3] = &unk_1E6F554C8;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v6, v9);

  return v7;
}

id __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

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

  v7 = *(id *)(a1 + 32);
  v8 = &unk_1EF2AC1D8;
  if (objc_msgSend(v7, "conformsToProtocol:", v8))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (objc_msgSend(v10, "isSiriEndpointAccessory"))
  {
    objc_msgSend(v10, "commonSettingsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "commonSettingsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:", *(_QWORD *)(a1 + 40));

    }
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "isAnnounceEnabled");
  objc_msgSend(v13, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30E20]);

  return v6;
}

void *__51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
    goto LABEL_8;
  objc_msgSend(v5, "hf_siriEndpointProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "hf_primaryService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = (void *)objc_msgSend(v5, "supportsAnnounce");
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

id __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_7;
  v9[3] = &unk_1E6F554C8;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v6, v9);

  return v7;
}

id __51__HUAnnounceSettingsItemModule__buildItemProviders__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

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

  v7 = *(id *)(a1 + 32);
  v8 = &unk_1EF2AC1D8;
  if (objc_msgSend(v7, "conformsToProtocol:", v8))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (objc_msgSend(v10, "isSiriEndpointAccessory"))
  {
    objc_msgSend(v10, "commonSettingsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "commonSettingsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:", *(_QWORD *)(a1 + 40));

    }
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "isAnnounceEnabled");
  objc_msgSend(v13, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30E20]);

  return v6;
}

- (id)_updateNotificationSettings:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  id v18;

  v5 = a3;
  v6 = objc_msgSend(v5, "deviceNotificationMode");
  -[HUAnnounceSettingsItemModule home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "announceUserSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "deviceNotificationMode");

  v11 = (void *)MEMORY[0x1E0D519C0];
  if (v6 == v10)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke;
    v17[3] = &unk_1E6F4D600;
    v17[4] = self;
    v18 = v5;
    objc_msgSend(v11, "futureWithBlock:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke_332;
    v16[3] = &unk_1E6F4F960;
    v16[4] = self;
    v16[5] = a2;
    objc_msgSend(v14, "addCompletionBlock:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

void __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke_2;
  v9[3] = &unk_1E6F4D1B0;
  v10 = v3;
  v11 = *(id *)(a1 + 40);
  v8 = v3;
  objc_msgSend(v5, "updateAnnounceUserSettings:forHome:completionHandler:", v6, v7, v9);

}

void __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Error setting announce notification setting: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "deviceNotificationMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithResult:error:", v6, 0);

  }
}

void __60__HUAnnounceSettingsItemModule__updateNotificationSettings___block_invoke_332(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(*(id *)(a1 + 32), "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToReloadItemProviders:senderSelector:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v4);

}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v16, 0x16u);
  }

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D314C0];
  -[HUAnnounceSettingsItemModule itemProviders](self, "itemProviders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestToReloadItemProviders:senderSelector:", v13, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v11, "performItemUpdateRequest:", v14);

}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (HUAnnounceNotificationSettingsItemProvider)notificationSettingsItemProvider
{
  return self->_notificationSettingsItemProvider;
}

- (void)setNotificationSettingsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSettingsItemProvider, a3);
}

- (HFItemProvider)announceDeviceItemProvider
{
  return self->_announceDeviceItemProvider;
}

- (void)setAnnounceDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_announceDeviceItemProvider, a3);
}

- (HFItemProvider)announceOtherDeviceItemProvider
{
  return self->_announceOtherDeviceItemProvider;
}

- (void)setAnnounceOtherDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_announceOtherDeviceItemProvider, a3);
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_announceOtherDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_announceDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_notificationSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
