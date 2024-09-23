@implementation CARAppearanceManager

- (CARAppearanceManager)initWithScreens:(id)a3 initialSystemNightMode:(BOOL)a4 initialLocationBasedNightMode:(BOOL)a5 delegate:(id)a6
{
  id v10;
  id v11;
  CARAppearanceManager *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *appearanceModeDictionary;
  NSMutableDictionary *v15;
  NSMutableDictionary *appearanceModeSettingDictionary;
  NSMutableDictionary *v17;
  NSMutableDictionary *currentEffectiveMapStyle;
  NSMutableDictionary *v19;
  NSMutableDictionary *currentEffectiveUIStyle;
  NSMutableDictionary *v21;
  NSMutableDictionary *mapAppearanceModeDictionary;
  NSMutableDictionary *v23;
  NSMutableDictionary *mapAppearanceModeSettingDictionary;
  NSMutableDictionary *v25;
  NSMutableDictionary *nightModeDictionary;
  uint64_t v27;
  NSArray *screens;
  CARAppearanceManager *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  CARAppearanceManager *v35;
  BOOL v36;
  objc_super v37;

  v10 = a3;
  v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)CARAppearanceManager;
  v12 = -[CARAppearanceManager init](&v37, sel_init);
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    appearanceModeDictionary = v12->_appearanceModeDictionary;
    v12->_appearanceModeDictionary = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    appearanceModeSettingDictionary = v12->_appearanceModeSettingDictionary;
    v12->_appearanceModeSettingDictionary = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    currentEffectiveMapStyle = v12->_currentEffectiveMapStyle;
    v12->_currentEffectiveMapStyle = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    currentEffectiveUIStyle = v12->_currentEffectiveUIStyle;
    v12->_currentEffectiveUIStyle = v19;

    objc_storeWeak((id *)&v12->_delegate, v11);
    v12->_locationBasedNightMode = a5;
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mapAppearanceModeDictionary = v12->_mapAppearanceModeDictionary;
    v12->_mapAppearanceModeDictionary = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mapAppearanceModeSettingDictionary = v12->_mapAppearanceModeSettingDictionary;
    v12->_mapAppearanceModeSettingDictionary = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nightModeDictionary = v12->_nightModeDictionary;
    v12->_nightModeDictionary = v25;

    v27 = objc_msgSend(v10, "copy");
    screens = v12->_screens;
    v12->_screens = (NSArray *)v27;

    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __102__CARAppearanceManager_initWithScreens_initialSystemNightMode_initialLocationBasedNightMode_delegate___block_invoke;
    v34 = &unk_1E54297E0;
    v29 = v12;
    v35 = v29;
    v36 = a4;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v31);
    -[CARAppearanceManager _resolveUIStylesAndNotify:](v29, "_resolveUIStylesAndNotify:", 0, v31, v32, v33, v34);
    -[CARAppearanceManager _resolveMapsStylesAndNotify:](v29, "_resolveMapsStylesAndNotify:", 0);

  }
  return v12;
}

void __102__CARAppearanceManager_initWithScreens_initialSystemNightMode_initialLocationBasedNightMode_delegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nightModeDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v5);

  if (objc_msgSend(v6, "supportsAppearanceMode"))
    objc_msgSend(*(id *)(a1 + 32), "_setInitialUIAppearanceNumberForScreen:", v6);
  if (objc_msgSend(v6, "supportsPerDisplayNightMode") && objc_msgSend(v6, "screenType"))
    objc_msgSend(*(id *)(a1 + 32), "_setInitialDisplayNightModeForScreen:", v6);
  if (objc_msgSend(v6, "supportsMapAppearanceMode"))
    objc_msgSend(*(id *)(a1 + 32), "_setInitialMapAppearanceNumberForScreen:", v6);

}

- (int64_t)effectiveStyleForUIAppearanceForScreenUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[CARAppearanceManager currentEffectiveUIStyle](self, "currentEffectiveUIStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (int64_t)effectiveStyleForMapAppearanceForScreenUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[CARAppearanceManager currentEffectiveMapStyle](self, "currentEffectiveMapStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (BOOL)effectiveGlobalNightMode
{
  CARAppearanceManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = self;
  -[CARAppearanceManager _mainScreenInfo](self, "_mainScreenInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARAppearanceManager nightModeDictionary](v2, "nightModeDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  LOBYTE(v2) = -[CARAppearanceManager locationBasedNightMode](v2, "locationBasedNightMode") | v7;
  return (char)v2;
}

- (void)handleNightModeUpdateWithParameters:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  CARAppearanceManager *v13;

  v9 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("DisplayUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("uuid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("IsNightMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARAppearanceManager screens](self, "screens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__CARAppearanceManager_handleNightModeUpdateWithParameters___block_invoke;
  v10[3] = &unk_1E5429808;
  v11 = v4;
  v12 = v5;
  v13 = self;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  -[CARAppearanceManager _resolveUIStylesAndNotify:](self, "_resolveUIStylesAndNotify:", 1);
  -[CARAppearanceManager _resolveMapsStylesAndNotify:](self, "_resolveMapsStylesAndNotify:", 1);

}

void __60__CARAppearanceManager_handleNightModeUpdateWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {

  }
  else
  {
    v5 = objc_msgSend(v3, "supportsPerDisplayNightMode");

    if ((v5 & 1) != 0)
      goto LABEL_12;
  }
  CarAppearanceLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8 = objc_msgSend(v7, "BOOLValue");
      v9 = CFSTR("NO");
      if (v8)
        v9 = CFSTR("YES");
    }
    else
    {
      v9 = CFSTR("unset");
    }
    v13 = 138543618;
    v14 = v3;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_DEFAULT, "Updating night mode for screenInfo: %{public}@, night mode: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "nightModeDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, v12);

LABEL_12:
}

- (void)handleUIAppearanceUpdateWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARAppearanceManager _screenInfoForScreenUUID:](self, "_screenInfoForScreenUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "supportsAppearanceMode") & 1) == 0)
  {
    CarAppearanceLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[CARAppearanceManager handleUIAppearanceUpdateWithParameters:].cold.2();
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("appearanceMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("appearanceMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    v10 = objc_msgSend((id)objc_opt_class(), "_carUserInterfaceStyleForAppearanceMode:", v9);
    CarAppearanceLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v6;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_DEFAULT, "UI Appearance update for screen: %{public}@ has style: %{public}@", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    v10 = -1;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("appearanceSetting"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_15;
  objc_msgSend(v4, "objectForKey:", CFSTR("appearanceSetting"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  CarAppearanceLogging();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "_descriptionForAppearanceSetting:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_1A83A2000, v17, OS_LOG_TYPE_DEFAULT, "UI Appearance update for screen: %{public}@ has setting: %{public}@", (uint8_t *)&v23, 0x16u);

  }
  if ((unint64_t)(v10 - 1) > 1 || v16 > 2)
  {
LABEL_15:
    CarAppearanceLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[CARAppearanceManager handleUIAppearanceUpdateWithParameters:].cold.1();
LABEL_17:

    goto LABEL_18;
  }
  -[CARAppearanceManager appearanceModeDictionary](self, "appearanceModeDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, v5);

  -[CARAppearanceManager appearanceModeSettingDictionary](self, "appearanceModeSettingDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v22, v5);

  -[CARAppearanceManager _resolveUIStylesAndNotify:](self, "_resolveUIStylesAndNotify:", 1);
LABEL_18:

}

- (void)handleMapAppearanceUpdateWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARAppearanceManager _screenInfoForScreenUUID:](self, "_screenInfoForScreenUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "supportsMapAppearanceMode") & 1) == 0)
  {
    CarAppearanceLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[CARAppearanceManager handleMapAppearanceUpdateWithParameters:].cold.2();
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("appearanceMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("appearanceMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    v10 = objc_msgSend((id)objc_opt_class(), "_carUserInterfaceStyleForAppearanceMode:", v9);
    CarAppearanceLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v6;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_DEFAULT, "Map Appearance update for screen: %{public}@ has style: %{public}@", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    v10 = -1;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("appearanceSetting"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_15;
  objc_msgSend(v4, "objectForKey:", CFSTR("appearanceSetting"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  CarAppearanceLogging();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "_descriptionForAppearanceSetting:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_1A83A2000, v17, OS_LOG_TYPE_DEFAULT, "Map Appearance update for screen: %{public}@ has setting: %{public}@", (uint8_t *)&v23, 0x16u);

  }
  if ((unint64_t)(v10 - 1) > 1 || v16 > 2)
  {
LABEL_15:
    CarAppearanceLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[CARAppearanceManager handleMapAppearanceUpdateWithParameters:].cold.1();
LABEL_17:

    goto LABEL_18;
  }
  -[CARAppearanceManager mapAppearanceModeDictionary](self, "mapAppearanceModeDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, v5);

  -[CARAppearanceManager mapAppearanceModeSettingDictionary](self, "mapAppearanceModeSettingDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v22, v5);

  -[CARAppearanceManager _resolveMapsStylesAndNotify:](self, "_resolveMapsStylesAndNotify:", 1);
LABEL_18:

}

- (void)handleLocationBasedNightModeUpdate:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  CarAppearanceLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Location night mode update: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[CARAppearanceManager setLocationBasedNightMode:](self, "setLocationBasedNightMode:", v3);
  -[CARAppearanceManager _resolveUIStylesAndNotify:](self, "_resolveUIStylesAndNotify:", 1);
  -[CARAppearanceManager _resolveMapsStylesAndNotify:](self, "_resolveMapsStylesAndNotify:", 1);
}

- (void)setDisableLocationNightMode
{
  NSObject *v3;
  uint8_t v4[16];

  CarAppearanceLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "Disabling location night mode, further updates will be ignored", v4, 2u);
  }

  -[CARAppearanceManager setLocationNightModeDisabled:](self, "setLocationNightModeDisabled:", 1);
  -[CARAppearanceManager _resolveUIStylesAndNotify:](self, "_resolveUIStylesAndNotify:", 0);
  -[CARAppearanceManager _resolveMapsStylesAndNotify:](self, "_resolveMapsStylesAndNotify:", 0);
}

- (BOOL)locationBasedNightMode
{
  NSObject *v3;
  uint8_t v5[16];

  if (!-[CARAppearanceManager locationNightModeDisabled](self, "locationNightModeDisabled"))
    return self->_locationBasedNightMode;
  CarAppearanceLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "Location night mode is disabled, ignoring actual value", v5, 2u);
  }

  return 0;
}

+ (int64_t)_carUserInterfaceStyleForAppearanceMode:(unint64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 1)
    v3 = -1;
  if (a3)
    return v3;
  else
    return 1;
}

- (id)_screenInfoForScreenUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  -[CARAppearanceManager screens](self, "screens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__CARAppearanceManager__screenInfoForScreenUUID___block_invoke;
  v9[3] = &unk_1E5428EB0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__CARAppearanceManager__screenInfoForScreenUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_mainScreenInfo
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  -[CARAppearanceManager screens](self, "screens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CARAppearanceManager__mainScreenInfo__block_invoke;
  v5[3] = &unk_1E5429830;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__CARAppearanceManager__mainScreenInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (!objc_msgSend(v7, "screenType"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_setInitialDisplayNightModeForScreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "screenInfoResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("nightMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("nightMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    CarAppearanceLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1A83A2000, v9, OS_LOG_TYPE_DEFAULT, "Screen has nightMode key with value: %{public}@ for screenInfo: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    -[CARAppearanceManager nightModeDictionary](self, "nightModeDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v13);

  }
}

- (void)_setInitialUIAppearanceNumberForScreen:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "screenInfoResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("uiAppearanceMode"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "objectForKey:", CFSTR("uiAppearanceSetting")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    CarAppearanceLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = (uint64_t)v4;
      _os_log_impl(&dword_1A83A2000, v9, OS_LOG_TYPE_DEFAULT, "Screen has appearanceMode key: %{public}@", (uint8_t *)&v26, 0xCu);
    }

    v10 = (void *)objc_opt_class();
    objc_msgSend(v5, "objectForKey:", CFSTR("uiAppearanceMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_carUserInterfaceStyleForAppearanceMode:", objc_msgSend(v11, "unsignedIntegerValue"));

    objc_msgSend(v5, "objectForKey:", CFSTR("uiAppearanceSetting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    CarAppearanceLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((unint64_t)(v12 - 1) > 1 || v14 > 2)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v26 = 134349570;
        v27 = v12;
        v28 = 2050;
        v29 = v14;
        v30 = 2112;
        v31 = v4;
        _os_log_fault_impl(&dword_1A83A2000, v16, OS_LOG_TYPE_FAULT, "Invalid initial style (%{public}lu), setting (%{public}lu) for screenInfo: %@", (uint8_t *)&v26, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_descriptionForAppearanceSetting:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = (uint64_t)v19;
        v28 = 2114;
        v29 = (unint64_t)v20;
        v30 = 2114;
        v31 = v4;
        _os_log_impl(&dword_1A83A2000, v16, OS_LOG_TYPE_DEFAULT, "Initial ui appearance style is: %{public}@, setting: %{public}@, for screenInfo: %{public}@", (uint8_t *)&v26, 0x20u);

      }
      -[CARAppearanceManager appearanceModeDictionary](self, "appearanceModeDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v22, v23);

      -[CARAppearanceManager appearanceModeSettingDictionary](self, "appearanceModeSettingDictionary");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v16, "setObject:forKey:", v24, v25);

    }
  }
  else
  {
    CarAppearanceLogging();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = (uint64_t)v4;
      _os_log_impl(&dword_1A83A2000, v16, OS_LOG_TYPE_DEFAULT, "No initial appearance mode for screenInfo: %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }

}

- (void)_setInitialMapAppearanceNumberForScreen:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "screenInfoResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("mapAppearanceMode"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "objectForKey:", CFSTR("mapAppearanceSetting")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    CarAppearanceLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = (uint64_t)v4;
      _os_log_impl(&dword_1A83A2000, v9, OS_LOG_TYPE_DEFAULT, "Screen has mapAppearanceMode key: %{public}@", (uint8_t *)&v26, 0xCu);
    }

    v10 = (void *)objc_opt_class();
    objc_msgSend(v5, "objectForKey:", CFSTR("mapAppearanceMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_carUserInterfaceStyleForAppearanceMode:", objc_msgSend(v11, "unsignedIntegerValue"));

    objc_msgSend(v5, "objectForKey:", CFSTR("mapAppearanceSetting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    CarAppearanceLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((unint64_t)(v12 - 1) > 1 || v14 > 2)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v26 = 134349570;
        v27 = v12;
        v28 = 2050;
        v29 = v14;
        v30 = 2114;
        v31 = v4;
        _os_log_fault_impl(&dword_1A83A2000, v16, OS_LOG_TYPE_FAULT, "Invalid initial map appearance style (%{public}lu), setting (%{public}lu) for screenInfo: %{public}@", (uint8_t *)&v26, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_descriptionForAppearanceSetting:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = (uint64_t)v19;
        v28 = 2114;
        v29 = (unint64_t)v20;
        v30 = 2114;
        v31 = v4;
        _os_log_impl(&dword_1A83A2000, v16, OS_LOG_TYPE_DEFAULT, "Initial map appearance style is: %{public}@, setting: %{public}@, for screenInfo: %{public}@", (uint8_t *)&v26, 0x20u);

      }
      -[CARAppearanceManager mapAppearanceModeDictionary](self, "mapAppearanceModeDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v22, v23);

      -[CARAppearanceManager mapAppearanceModeSettingDictionary](self, "mapAppearanceModeSettingDictionary");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v16, "setObject:forKey:", v24, v25);

    }
  }
  else
  {
    CarAppearanceLogging();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = (uint64_t)v4;
      _os_log_impl(&dword_1A83A2000, v16, OS_LOG_TYPE_DEFAULT, "No initial map appearance mode for screenInfo: %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }

}

- (void)_resolveUIStylesAndNotify:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CARAppearanceManager screens](self, "screens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CARAppearanceManager__resolveUIStylesAndNotify___block_invoke;
  v6[3] = &unk_1E54297E0;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __50__CARAppearanceManager__resolveUIStylesAndNotify___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v38 = a2;
  objc_msgSend(v38, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentEffectiveUIStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = objc_msgSend(*(id *)(a1 + 32), "locationBasedNightMode");
  objc_msgSend(*(id *)(a1 + 32), "nightModeDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = v10 | v7;
  objc_msgSend(*(id *)(a1 + 32), "appearanceModeDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "appearanceModeSettingDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "integerValue");
  v39 = v13;
  if (v13 && v15)
  {
    v17 = objc_msgSend(v13, "integerValue");
    if (v16)
      v18 = 0;
    else
      v18 = v17 == 1;
    v19 = v18;
    v20 = 1;
    if (v7)
      v21 = 2;
    else
      v21 = 1;
    if (v11)
      v20 = 2;
    v22 = v15;
    if (v17 == -1)
      v17 = v20;
  }
  else
  {
    v22 = v15;
    v19 = 0;
    if (v7)
      v21 = 2;
    else
      v21 = 1;
    if (v11)
      v17 = 2;
    else
      v17 = 1;
  }
  v23 = v6;
  if (v19)
    v24 = v21;
  else
    v24 = v17;
  CarAppearanceLogging();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_descriptionForAppearanceSetting:", v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v42 = v26;
    v43 = 2114;
    v44 = v38;
    v45 = 2114;
    v46 = v39;
    v47 = 2114;
    v48 = v27;
    v49 = 2114;
    v50 = v28;
    v51 = 2114;
    v52 = v29;
    _os_log_impl(&dword_1A83A2000, v25, OS_LOG_TYPE_DEFAULT, "Resolved ui style: %{public}@ for screen: %{public}@ with ui appearance value: %{public}@, appearance setting: %{public}@, location night mode: %{public}@, display night mode: %{public}@", buf, 0x3Eu);

  }
  if (v24 != v23)
  {
    CarAppearanceLogging();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v31;
      v43 = 2114;
      v44 = v32;
      _os_log_impl(&dword_1A83A2000, v30, OS_LOG_TYPE_DEFAULT, "UI Style has been updated, setting effective style to %{public}@, will notify: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "currentEffectiveUIStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKey:", v34, v3);

    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(a1 + 32);
      v40 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "appearanceManager:didUpdateUIAppearanceStyle:forScreenUUIDs:", v36, v24, v37);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_resolveMapsStylesAndNotify:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_resolveMapsStylesAndNotify:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CARAppearanceManager screens](self, "screens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__CARAppearanceManager__resolveMapsStylesAndNotify___block_invoke;
  v6[3] = &unk_1E54297E0;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __52__CARAppearanceManager__resolveMapsStylesAndNotify___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentEffectiveMapStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v6, "integerValue");

  v7 = objc_msgSend(*(id *)(a1 + 32), "locationBasedNightMode");
  objc_msgSend(*(id *)(a1 + 32), "nightModeDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = v10 | v7;
  objc_msgSend(*(id *)(a1 + 32), "mapAppearanceModeDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "mapAppearanceModeSettingDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v15)
  {
    v16 = objc_msgSend(v13, "integerValue");
    v17 = v16;
    v18 = 1;
    if (v11)
      v18 = 2;
    if (v16 == -1)
      v17 = v18;
  }
  else if (v11)
  {
    v17 = 2;
  }
  else
  {
    v17 = 1;
  }
  if (v17 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentEffectiveUIStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    if (v21 == 1)
    {
      CarAppearanceLogging();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A83A2000, v22, OS_LOG_TYPE_DEFAULT, "Map Style is dark but ui appearance is light, setting effective map style light to match", buf, 2u);
      }

      v17 = 1;
    }
    else
    {
      v17 = 2;
    }
  }
  CarAppearanceLogging();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v38 = v24;
    v39 = 2114;
    v40 = v3;
    v41 = 2114;
    v42 = v13;
    v43 = 2114;
    v44 = v25;
    v45 = 2114;
    v46 = v26;
    _os_log_impl(&dword_1A83A2000, v23, OS_LOG_TYPE_DEFAULT, "Resolved map style: %{public}@ for screen: %{public}@ with ui appearance value: %{public}@, location night mode: %{public}@, display night mode: %{public}@", buf, 0x34u);

  }
  if (v17 != v35)
  {
    CarAppearanceLogging();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v28;
      v39 = 2114;
      v40 = v29;
      _os_log_impl(&dword_1A83A2000, v27, OS_LOG_TYPE_DEFAULT, "Map Style has been updated, setting effective style to %{public}@, will notify: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "currentEffectiveMapStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v31, v4);

    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 32);
      v36 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "appearanceManager:didUpdateMapAppearanceStyle:forScreenUUIDs:", v33, v17, v34);

    }
  }

}

+ (id)_descriptionForAppearanceSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E5429850[a3];
}

- (CARAppearanceManagerDelegate)delegate
{
  return (CARAppearanceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)screens
{
  return self->_screens;
}

- (void)setScreens:(id)a3
{
  objc_storeStrong((id *)&self->_screens, a3);
}

- (NSMutableDictionary)appearanceModeDictionary
{
  return self->_appearanceModeDictionary;
}

- (void)setAppearanceModeDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceModeDictionary, a3);
}

- (NSMutableDictionary)appearanceModeSettingDictionary
{
  return self->_appearanceModeSettingDictionary;
}

- (void)setAppearanceModeSettingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceModeSettingDictionary, a3);
}

- (NSMutableDictionary)mapAppearanceModeDictionary
{
  return self->_mapAppearanceModeDictionary;
}

- (void)setMapAppearanceModeDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mapAppearanceModeDictionary, a3);
}

- (NSMutableDictionary)mapAppearanceModeSettingDictionary
{
  return self->_mapAppearanceModeSettingDictionary;
}

- (void)setMapAppearanceModeSettingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mapAppearanceModeSettingDictionary, a3);
}

- (NSMutableDictionary)nightModeDictionary
{
  return self->_nightModeDictionary;
}

- (void)setNightModeDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_nightModeDictionary, a3);
}

- (NSMutableDictionary)currentEffectiveUIStyle
{
  return self->_currentEffectiveUIStyle;
}

- (void)setCurrentEffectiveUIStyle:(id)a3
{
  objc_storeStrong((id *)&self->_currentEffectiveUIStyle, a3);
}

- (NSMutableDictionary)currentEffectiveMapStyle
{
  return self->_currentEffectiveMapStyle;
}

- (void)setCurrentEffectiveMapStyle:(id)a3
{
  objc_storeStrong((id *)&self->_currentEffectiveMapStyle, a3);
}

- (void)setLocationBasedNightMode:(BOOL)a3
{
  self->_locationBasedNightMode = a3;
}

- (BOOL)locationNightModeDisabled
{
  return self->_locationNightModeDisabled;
}

- (void)setLocationNightModeDisabled:(BOOL)a3
{
  self->_locationNightModeDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEffectiveMapStyle, 0);
  objc_storeStrong((id *)&self->_currentEffectiveUIStyle, 0);
  objc_storeStrong((id *)&self->_nightModeDictionary, 0);
  objc_storeStrong((id *)&self->_mapAppearanceModeSettingDictionary, 0);
  objc_storeStrong((id *)&self->_mapAppearanceModeDictionary, 0);
  objc_storeStrong((id *)&self->_appearanceModeSettingDictionary, 0);
  objc_storeStrong((id *)&self->_appearanceModeDictionary, 0);
  objc_storeStrong((id *)&self->_screens, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)handleUIAppearanceUpdateWithParameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1A83A2000, v0, v1, "UI Appearance update has invalid style for screen: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleUIAppearanceUpdateWithParameters:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1A83A2000, v0, v1, "Screen does not support ui appearance, ignoring update: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMapAppearanceUpdateWithParameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1A83A2000, v0, v1, "Map Appearance update has invalid style for screen: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMapAppearanceUpdateWithParameters:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1A83A2000, v0, v1, "Screen does not support map appearance, ignoring update: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
