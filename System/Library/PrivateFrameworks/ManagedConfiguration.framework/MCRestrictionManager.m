@implementation MCRestrictionManager

- (void)setMemberQueueEffectiveUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueEffectiveUserSettings, a3);
}

void __45__MCRestrictionManager_effectiveUserSettings__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__MCRestrictionManager_sharedManager__block_invoke()
{
  objc_class *v0;
  id v1;
  void *v2;

  v0 = NSClassFromString(CFSTR("MCRestrictionManagerWriter"));
  if (!v0)
    v0 = (objc_class *)MCRestrictionManager;
  v1 = objc_alloc_init(v0);
  v2 = (void *)sharedManager_obj;
  sharedManager_obj = (uint64_t)v1;

}

- (MCRestrictionManager)init
{
  MCRestrictionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *memberQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCRestrictionManager;
  v2 = -[MCRestrictionManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MCRestrictionManagerWriter member queue", v3);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

void __42__MCRestrictionManager_systemUserSettings__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemUserSettings");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)memberQueueSystemUserSettings
{
  NSMutableDictionary *memberQueueSystemUserSettings;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  id v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memberQueueSystemUserSettings = self->_memberQueueSystemUserSettings;
  if (!memberQueueSystemUserSettings)
  {
    v4 = (void *)MEMORY[0x1E0C99D50];
    MCSystemUserSettingsFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MCDataFromFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v6, 1, 0, &v14);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      v9 = self->_memberQueueSystemUserSettings;
      self->_memberQueueSystemUserSettings = v7;

    }
    else
    {
      v8 = 0;
    }
    if (!self->_memberQueueSystemUserSettings)
    {
      v10 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v8;
        _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEFAULT, "Could not find system user settings. Creating new dictionary. serialization error:  %{public}@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v12 = self->_memberQueueSystemUserSettings;
      self->_memberQueueSystemUserSettings = v11;

    }
    memberQueueSystemUserSettings = self->_memberQueueSystemUserSettings;
  }
  return memberQueueSystemUserSettings;
}

uint64_t __42__MCRestrictionManager_invalidateSettings__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSystemUserSettings:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSystemNamespacedUserSettings:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueUserUserSettings:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueUserNamespacedUserSettings:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueEffectiveUserSettings:", 0);
}

- (void)setMemberQueueSystemNamespacedUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueSystemNamespacedUserSettings, a3);
}

- (void)setMemberQueueUserUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueUserUserSettings, a3);
}

- (void)setMemberQueueUserNamespacedUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueUserNamespacedUserSettings, a3);
}

- (void)setMemberQueueSystemUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueSystemUserSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueUserProfileRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemProfileRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_memberQueueOverridingRestrictionClientUUID, 0);
  objc_storeStrong((id *)&self->_memberQueueEffectiveWhitelistedAppsAndOptions, 0);
  objc_storeStrong((id *)&self->_memberQueueSettingsEvents, 0);
  objc_storeStrong((id *)&self->_memberQueueEffectiveUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueUserNamespacedUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueUserUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueUserClientRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemNamespacedUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemUserSettings, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemClientRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueueRestrictions, 0);
}

- (id)unionValuesForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)effectiveIntersectedValuesForSetting:(id)a3
{
  void *v3;
  void *v4;

  -[MCRestrictionManager effectiveParametersForIntersectedSetting:](self, "effectiveParametersForIntersectedSetting:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("values"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)effectiveParametersForIntersectedSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parametersForIntersectedSetting:withUserSettingDictionary:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)parametersForIntersectedSetting:(id)a3 withUserSettingDictionary:(id)a4
{
  return (id)objc_msgSend(a1, "parametersForSetting:ofType:withUserSettingDictionary:", a3, CFSTR("intersection"), a4);
}

- (id)effectiveBlockedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[MCRestrictionManager effectiveUnionValuesForSetting:](self, "effectiveUnionValuesForSetting:", CFSTR("blockedAppBundleIDs"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  if (!a3)
  {
    -[MCRestrictionManager effectiveUnionValuesForSetting:](self, "effectiveUnionValuesForSetting:", CFSTR("removedSystemAppBundleIDs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)effectiveUnionValuesForSetting:(id)a3
{
  void *v3;
  void *v4;

  -[MCRestrictionManager effectiveParametersForUnionSetting:](self, "effectiveParametersForUnionSetting:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("values"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)effectiveParametersForUnionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parametersForUnionSetting:withUserSettingDictionary:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)parametersForUnionSetting:(id)a3 withUserSettingDictionary:(id)a4
{
  return (id)objc_msgSend(a1, "parametersForSetting:ofType:withUserSettingDictionary:", a3, CFSTR("union"), a4);
}

- (id)effectiveParametersForValueSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parametersForValueSetting:withUserSettingDictionary:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)effectiveUserSettings
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MCRestrictionManager_effectiveUserSettings__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

+ (id)parametersForValueSetting:(id)a3 withUserSettingDictionary:(id)a4
{
  return (id)objc_msgSend(a1, "parametersForSetting:ofType:withUserSettingDictionary:", a3, CFSTR("restrictedValue"), a4);
}

- (BOOL)isBoolSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  int AppBooleanValue;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  Boolean keyExistsAndHasValidFormat;

  v4 = a3;
  if (!os_variant_has_internal_ui()
    || !objc_msgSend(v4, "isEqualToString:", CFSTR("allowDiagnosticSubmission"))
    || (keyExistsAndHasValidFormat = 0,
        AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MCInternalOverrideDiagnosticEnforcement"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat), v6 = 1, keyExistsAndHasValidFormat)&& AppBooleanValue)
  {
    -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("restrictedBool"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[MCRestrictionManager _isBoolSettingLockedDown:](self, "_isBoolSettingLockedDown:", v9);
  }

  return v6;
}

- (NSDictionary)currentRestrictions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MCRestrictionManager_currentRestrictions__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (BOOL)_isBoolSettingLockedDown:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int v9;
  int v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("preference"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      v9 = objc_msgSend(v5, "BOOLValue");
      v10 = v9 ^ objc_msgSend(v7, "BOOLValue") ^ 1;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (int)appWhitelistStateWithSettingsDictionary:(id)a3 restrictionsDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  +[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:](MCRestrictionManager, "intersectedValuesSettingForFeature:withUserSettingDectionary:", CFSTR("appLockBundleIDs"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (+[MCRestrictionManager isInSingleAppModeWithSettingsDictionary:](MCRestrictionManager, "isInSingleAppModeWithSettingsDictionary:", v5))
    {
      +[MCRestrictionManager isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:](MCRestrictionManager, "isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:", v5);
      LODWORD(v7) = 1;
    }
    else if (+[MCRestrictionManager isWhitelistedAppsRestrictionEnforcedWithRestrictionsDictionary:](MCRestrictionManager, "isWhitelistedAppsRestrictionEnforcedWithRestrictionsDictionary:", v6))
    {
      LODWORD(v7) = 6;
    }
    else
    {
      +[MCRestrictionManager mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:](MCRestrictionManager, "mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:", v5);
      LODWORD(v7) = 2;
    }
  }

  return (int)v7;
}

+ (id)intersectedValuesSettingForFeature:(id)a3 withUserSettingDectionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("intersection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __76__MCRestrictionManager_effectiveParametersForBoolSetting_configurationUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_6;
  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "memberQueueUserNamespacedUserSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parametersForBoolSetting:withUserSettingDictionary:", v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  if (!v6)
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "memberQueueSystemNamespacedUserSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parametersForBoolSetting:withUserSettingDictionary:", v8, v10);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_opt_class();
      goto LABEL_5;
    }
LABEL_6:
    v15 = (void *)objc_opt_class();
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "memberQueueEffectiveUserSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "parametersForBoolSetting:withUserSettingDictionary:", v16, v11);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_5:
  objc_msgSend(*(id *)(a1 + 40), "memberQueueRestrictions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyRestrictions:forFeature:toParametersForBoolSetting:", v11, *(_QWORD *)(a1 + 48), v6);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

LABEL_7:
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v6;

}

- (NSMutableDictionary)memberQueueEffectiveUserSettings
{
  NSMutableDictionary *memberQueueEffectiveUserSettings;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  memberQueueEffectiveUserSettings = self->_memberQueueEffectiveUserSettings;
  if (!memberQueueEffectiveUserSettings)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MCEffectiveUserSettingsFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isReadableFileAtPath:", v5);

    if (v6)
    {
      v7 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_INFO, "Reading from private effective user settings.", buf, 2u);
      }
      v8 = (void *)MEMORY[0x1E0C99D50];
      MCEffectiveUserSettingsFilePath();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "MCDataFromFile:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_9;
    }
    v11 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_INFO, "Reading from public effective user settings.", v21, 2u);
    }
    v12 = (void *)MEMORY[0x1E0C99D50];
    MCPublicEffectiveUserSettingsFilePath();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MCDataFromFile:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v10, 1, 0, 0);
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v15 = self->_memberQueueEffectiveUserSettings;
      self->_memberQueueEffectiveUserSettings = v14;

    }
    if (!self->_memberQueueEffectiveUserSettings)
    {
      v16 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_DEFAULT, "Could not find effective user settings. Creating new dictionary.", v20, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v18 = self->_memberQueueEffectiveUserSettings;
      self->_memberQueueEffectiveUserSettings = v17;

    }
    memberQueueEffectiveUserSettings = self->_memberQueueEffectiveUserSettings;
  }
  return memberQueueEffectiveUserSettings;
}

+ (id)parametersForSetting:(id)a3 ofType:(id)a4 withUserSettingDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[MCSignpostManager willGetFeature:](MCSignpostManager, "willGetFeature:", v9);
  objc_msgSend(v7, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)parametersForBoolSetting:(id)a3 withUserSettingDictionary:(id)a4
{
  return (id)objc_msgSend(a1, "parametersForSetting:ofType:withUserSettingDictionary:", a3, CFSTR("restrictedBool"), a4);
}

- (id)effectiveParametersForBoolSetting:(id)a3 configurationUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  MCRestrictionManager *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  v23 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__MCRestrictionManager_effectiveParametersForBoolSetting_configurationUUID___block_invoke;
  v13[3] = &unk_1E41E4538;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v17 = &v18;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

+ (id)sharedManager
{
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_2_3);
  return (id)sharedManager_obj;
}

+ (id)applyRestrictions:(id)a3 forFeature:(id)a4 toParametersForBoolSetting:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  void *v17;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("preference"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (!v14 && (v15 = objc_msgSend(v11, "BOOLValue"), (_DWORD)v15 == objc_msgSend(v13, "BOOLValue")))
  {
    v19 = CFSTR("value");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v7;
  }

  return v16;
}

- (void)invalidateSettings
{
  NSObject *v3;
  _QWORD block[5];

  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MCRestrictionManager_invalidateSettings__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_async(v3, block);

}

void __43__MCRestrictionManager_currentRestrictions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueRestrictions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)memberQueueRestrictions
{
  NSMutableDictionary *memberQueueRestrictions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;

  memberQueueRestrictions = self->_memberQueueRestrictions;
  if (!memberQueueRestrictions)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    v5 = (void *)MEMORY[0x1E0C99D50];
    MCRestrictionsFilePath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "MCDataFromFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MCSafePropertyListWithData:options:format:error:", v7, 1, 0, 0);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_memberQueueRestrictions;
    self->_memberQueueRestrictions = v8;

    memberQueueRestrictions = self->_memberQueueRestrictions;
    if (!memberQueueRestrictions)
    {
      -[MCRestrictionManager defaultRestrictions](self, "defaultRestrictions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      v12 = self->_memberQueueRestrictions;
      self->_memberQueueRestrictions = v11;

      memberQueueRestrictions = self->_memberQueueRestrictions;
    }
  }
  return memberQueueRestrictions;
}

- (id)restrictedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  -[MCRestrictionManager effectiveUnionValuesForSetting:](self, "effectiveUnionValuesForSetting:", CFSTR("blockedAppBundleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObjectsFromArray:", v6);
  if (!a3)
  {
    -[MCRestrictionManager effectiveUnionValuesForSetting:](self, "effectiveUnionValuesForSetting:", CFSTR("removedSystemAppBundleIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  +[MCRestrictionManager explicitlyRestrictedAppsBySetting](MCRestrictionManager, "explicitlyRestrictedAppsBySetting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[MCRestrictionManager effectiveRestrictedBoolForSetting:](self, "effectiveRestrictedBoolForSetting:", v13) == 2)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  if (-[MCRestrictionManager effectiveRestrictedBoolForSetting:](self, "effectiveRestrictedBoolForSetting:", CFSTR("allowFindMyDevice")) == 2&& -[MCRestrictionManager effectiveRestrictedBoolForSetting:](self, "effectiveRestrictedBoolForSetting:", CFSTR("allowFindMyFriends")) == 2)
  {
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.findmy"));
  }
  if (objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad"))
  {
    +[MCRestrictionManager explicitlyRestrictedEphemeralMultiUserApps](MCRestrictionManager, "explicitlyRestrictedEphemeralMultiUserApps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v15);

  }
  return v5;
}

- (int)effectiveRestrictedBoolForSetting:(id)a3 configurationUUID:(id)a4
{
  void *v4;
  void *v5;
  int v6;

  -[MCRestrictionManager effectiveParametersForBoolSetting:configurationUUID:](self, "effectiveParametersForBoolSetting:configurationUUID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "BOOLValue"))
      v6 = 1;
    else
      v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)effectiveRestrictedBoolForSetting:(id)a3
{
  return -[MCRestrictionManager effectiveRestrictedBoolForSetting:configurationUUID:](self, "effectiveRestrictedBoolForSetting:configurationUUID:", a3, 0);
}

+ (id)explicitlyRestrictedAppsBySetting
{
  if (explicitlyRestrictedAppsBySetting_onceToken != -1)
    dispatch_once(&explicitlyRestrictedAppsBySetting_onceToken, &__block_literal_global_8);
  return (id)explicitlyRestrictedAppsBySetting_apps;
}

+ (id)newEffectiveSettingsByApplyingRestrictions:(id)a3 toSettings:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  BOOL v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  BOOL v45;
  id v46;
  BOOL v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t k;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t n;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t ii;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  id obj;
  id obja;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint8_t buf[16];
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v107 = v6;
  v103 = v9;
  if (v11)
  {
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v147;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v147 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "applyRestrictions:forFeature:toParametersForBoolSetting:", v6, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);

          v6 = v107;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
      }
      while (v14);
    }

    objc_msgSend(v103, "setObject:forKey:", v11, CFSTR("restrictedBool"));
    v8 = 0x1E0C99000;
  }
  else
  {
    v20 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_ERROR, "settings dictionary missing BOOLean restrictions (restrictedBool)", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("restrictedBool"));

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("restrictedValue"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "objectForKey:", CFSTR("restrictedValue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v8 + 3592), "dictionary");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  obj = v22;
  v113 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v154, 16);
  if (v113)
  {
    v108 = *(_QWORD *)v142;
    do
    {
      for (j = 0; j != v113; ++j)
      {
        if (*(_QWORD *)v142 != v108)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * j);
        objc_msgSend(obj, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v24;
        objc_msgSend(v110, "objectForKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("value"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("rangeMinimum"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("rangeMaximum"));
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = v28;
        v31 = v27;
        v32 = v31;
        v33 = v30;
        v34 = v29;
        if (v26)
        {
          objc_msgSend(v26, "objectForKey:", CFSTR("value"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", CFSTR("preferSmallerValues"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            v37 = v36 == 0;
          else
            v37 = 1;
          v32 = v31;
          v33 = v30;
          v34 = v29;
          if (v37)
            goto LABEL_43;
          v106 = v36;
          v38 = objc_msgSend(v36, "BOOLValue");
          v34 = v35;
          if (v38)
          {

            if (!v29 || objc_msgSend(v29, "compare:", v34) != -1)
            {
              if (v30)
                goto LABEL_27;
LABEL_41:
              v33 = 0;
              v32 = v31;
LABEL_42:
              v36 = v106;
LABEL_43:

              goto LABEL_44;
            }
            v44 = v29;

            v34 = v44;
            if (!v30)
              goto LABEL_41;
LABEL_27:
            v105 = v35;
            v39 = objc_msgSend(v30, "compare:", v34);
            v40 = v30;
            v33 = v30;
            v41 = v34;
            if (v39 == 1)
            {
LABEL_28:
              v33 = v40;

              v41 = v33;
            }
          }
          else
          {

            if (v30 && objc_msgSend(v30, "compare:", v34) == 1)
            {
              v42 = v30;

              v34 = v42;
            }
            if (!v29)
            {
              v32 = v31;
              v33 = v34;
              v34 = 0;
              goto LABEL_42;
            }
            v105 = v35;
            v43 = objc_msgSend(v29, "compare:", v34);
            v40 = v29;
            v33 = v34;
            v41 = v29;
            if (v43 == -1)
              goto LABEL_28;
          }
          if (objc_msgSend(v41, "compare:", v33) == 1)
          {
            v32 = v31;
            v34 = v41;
          }
          else
          {
            v32 = v41;

            v34 = v32;
          }
          v35 = v105;
          goto LABEL_42;
        }
LABEL_44:
        if (v34)
          v45 = v32 == 0;
        else
          v45 = 1;
        if (!v45 && objc_msgSend(v34, "compare:", v32) == -1)
        {
          v46 = v34;

          v32 = v46;
        }
        if (v33)
          v47 = v32 == 0;
        else
          v47 = 1;
        if (!v47 && objc_msgSend(v33, "compare:", v32) == 1)
        {
          v48 = v33;

          v32 = v48;
        }
        v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v49, "MCSetObjectIfNotNil:forKey:", v34, CFSTR("rangeMaximum"));
        objc_msgSend(v49, "MCSetObjectIfNotNil:forKey:", v33, CFSTR("rangeMinimum"));
        objc_msgSend(v49, "MCSetObjectIfNotNil:forKey:", v32, CFSTR("value"));
        objc_msgSend(v109, "setObject:forKey:", v49, v117);

      }
      v113 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v154, 16);
    }
    while (v113);
  }

  objc_msgSend(v103, "setObject:forKey:", v109, CFSTR("restrictedValue"));
  objc_msgSend(v107, "objectForKey:", CFSTR("intersection"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "objectForKey:", CFSTR("intersection"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v50;
  objc_msgSend(v50, "allKeys");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = (void *)objc_msgSend(v52, "mutableCopy");

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v53 = v51;
  v111 = v53;
  v119 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
  if (v119)
  {
    obja = *(id *)v138;
    do
    {
      for (k = 0; k != v119; ++k)
      {
        if (*(id *)v138 != obja)
          objc_enumerationMutation(v53);
        v55 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * k);
        objc_msgSend(v53, "objectForKey:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v56, "mutableCopy");

        objc_msgSend(v57, "objectForKey:", CFSTR("values"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "objectForKey:", v55);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKey:", CFSTR("values"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          objc_msgSend(v59, "objectForKey:", CFSTR("overrideUserSettings"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "BOOLValue");

          if (v62)
          {
            objc_msgSend(v57, "setObject:forKey:", v60, CFSTR("values"));
          }
          else
          {
            if (v58)
            {
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v60);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v58);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "intersectSet:", v63);
              objc_msgSend(v64, "allObjects");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setObject:forKey:", v65, CFSTR("values"));

            }
            else
            {
              v66 = (void *)objc_msgSend(v60, "copy");
              objc_msgSend(v57, "setObject:forKey:", v66, CFSTR("values"));

            }
            v53 = v111;
          }
        }
        objc_msgSend(v121, "setObject:forKey:", v57, v55);
        objc_msgSend(v118, "removeObject:", v55);

      }
      v119 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
    }
    while (v119);
  }

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v67 = v118;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v134;
    do
    {
      for (m = 0; m != v69; ++m)
      {
        if (*(_QWORD *)v134 != v70)
          objc_enumerationMutation(v67);
        v72 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * m);
        objc_msgSend(v123, "objectForKey:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "setObject:forKey:", v73, v72);

      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
    }
    while (v69);
  }

  objc_msgSend(v103, "setObject:forKey:", v121, CFSTR("intersection"));
  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("union"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("union"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v74;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "allKeys");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v77, "mutableCopy");

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v79 = v75;
  v114 = v79;
  v122 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v129, v151, 16);
  if (v122)
  {
    v80 = *(_QWORD *)v130;
    v120 = v76;
    v112 = *(_QWORD *)v130;
    do
    {
      for (n = 0; n != v122; ++n)
      {
        if (*(_QWORD *)v130 != v80)
          objc_enumerationMutation(v79);
        v82 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * n);
        objc_msgSend(v79, "objectForKeyedSubscript:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)objc_msgSend(v83, "mutableCopy");

        objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("values"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectForKeyedSubscript:", v82);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("values"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v87;
        if (v87)
        {
          if (v85)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v87);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v85);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "unionSet:", v89);
            objc_msgSend(v90, "allObjects");
            v91 = v78;
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setObject:forKeyedSubscript:", v92, CFSTR("values"));

            v78 = v91;
            v80 = v112;

            v79 = v114;
          }
          else
          {
            v89 = (void *)objc_msgSend(v87, "copy");
            objc_msgSend(v84, "setObject:forKeyedSubscript:", v89, CFSTR("values"));
          }

        }
        objc_msgSend(v124, "setObject:forKeyedSubscript:", v84, v82);
        objc_msgSend(v78, "removeObject:", v82);

        v76 = v120;
      }
      v122 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v129, v151, 16);
    }
    while (v122);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v93 = v78;
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v126;
    do
    {
      for (ii = 0; ii != v95; ++ii)
      {
        if (*(_QWORD *)v126 != v96)
          objc_enumerationMutation(v93);
        v98 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * ii);
        objc_msgSend(v76, "objectForKeyedSubscript:", v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "setObject:forKeyedSubscript:", v99, v98);

      }
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
    }
    while (v95);
  }

  objc_msgSend(v103, "setObject:forKeyedSubscript:", v124, CFSTR("union"));
  +[MCHacks sharedHacks](MCHacks, "sharedHacks");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "_applyHeuristicsToEffectiveUserSettings:", v103);

  +[MCHacks sharedHacks](MCHacks, "sharedHacks");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "_applyMandatorySettingsToEffectiveUserSettings:", v103);

  return v103;
}

+ (int)BOOLSettingForFeature:(id)a3 withNewUserSetting:(id)a4 currentSettings:(id)a5
{
  id v8;
  id v9;
  int v10;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a1, "BOOLSettingForFeature:outAsk:withUserSettingDictionary:", v8, 0, a4);
  if (!v10)
    v10 = objc_msgSend(a1, "BOOLSettingForFeature:outAsk:withUserSettingDictionary:", v8, 0, v9);

  return v10;
}

- (int)BOOLSettingForFeature:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[MCRestrictionManager userSettings](self, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v4, v5);

  return v6;
}

+ (int)BOOLSettingForFeature:(id)a3 outAsk:(BOOL *)a4 withUserSettingDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("restrictedBool"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "BOOLValue"))
    {
      if (a4)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ask"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = objc_msgSend(v14, "BOOLValue");

      }
      v15 = 1;
    }
    else
    {
      v15 = 2;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (int)BOOLSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4
{
  return objc_msgSend(a1, "BOOLSettingForFeature:outAsk:withUserSettingDictionary:", a3, 0, a4);
}

- (NSDictionary)systemUserSettings
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MCRestrictionManager_systemUserSettings__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

+ (id)valueSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("restrictedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)unionValuesForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("union"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setMemberQueueUserClientRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueUserClientRestrictions, a3);
}

uint64_t __46__MCRestrictionManager_invalidateRestrictions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueRestrictions:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSystemProfileRestrictions:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueUserProfileRestrictions:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSystemClientRestrictions:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueUserClientRestrictions:", 0);
}

- (void)setMemberQueueUserProfileRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueUserProfileRestrictions, a3);
}

- (void)setMemberQueueSystemProfileRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueSystemProfileRestrictions, a3);
}

- (void)setMemberQueueSystemClientRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueSystemClientRestrictions, a3);
}

- (void)setMemberQueueRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueRestrictions, a3);
}

- (id)effectiveWhitelistedAppBundleIDs
{
  void *v2;
  void *v3;

  -[MCRestrictionManager effectiveIntersectedValuesForSetting:](self, "effectiveIntersectedValuesForSetting:", CFSTR("appLockBundleIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __71__MCRestrictionManager_AppWhitelist__explicitlyRestrictedAppsBySetting__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char HasSMSCapability;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[3];
  _QWORD v29[13];
  _QWORD v30[15];

  v30[13] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("allowCamera");
  v28[0] = CFSTR("com.apple.camera");
  v28[1] = CFSTR("com.apple.Photo-Booth");
  v28[2] = CFSTR("com.apple.Capture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v15;
  v29[1] = CFSTR("allowSafari");
  v27 = CFSTR("com.apple.mobilesafari");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  v29[2] = CFSTR("allowiTunes");
  v26 = CFSTR("com.apple.MobileStore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v13;
  v29[3] = CFSTR("allowAppInstallation");
  v25 = CFSTR("com.apple.AppStore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v12;
  v29[4] = CFSTR("allowUIAppInstallation");
  v24 = CFSTR("com.apple.AppStore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v0;
  v29[5] = CFSTR("allowVideoConferencing");
  v23 = CFSTR("com.apple.facetime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v1;
  v29[6] = CFSTR("allowGameCenter");
  v22 = CFSTR("com.apple.gamecenter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v2;
  v29[7] = CFSTR("allowPodcasts");
  v21 = CFSTR("com.apple.podcasts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v3;
  v29[8] = CFSTR("allowHome");
  v20 = CFSTR("allowHome");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v4;
  v29[9] = CFSTR("allowPairedWatch");
  v19 = CFSTR("com.apple.Bridge");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v5;
  v29[10] = CFSTR("allowChat");
  HasSMSCapability = MCGestaltHasSMSCapability();
  if ((HasSMSCapability & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v18 = CFSTR("com.apple.MobileSMS");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[10] = v7;
  v29[11] = CFSTR("allowNews");
  v17 = CFSTR("com.apple.news");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v8;
  v29[12] = CFSTR("allowCloudDocumentSync");
  v16 = CFSTR("com.apple.iCloudDriveApp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[12] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)explicitlyRestrictedAppsBySetting_apps;
  explicitlyRestrictedAppsBySetting_apps = v10;

  if ((HasSMSCapability & 1) == 0)
}

- (void)invalidateRestrictions
{
  NSObject *v3;
  _QWORD block[5];

  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MCRestrictionManager_invalidateRestrictions__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_async(v3, block);

}

- (NSMutableDictionary)memberQueueUserUserSettings
{
  NSMutableDictionary *memberQueueUserUserSettings;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint8_t v13[16];

  memberQueueUserUserSettings = self->_memberQueueUserUserSettings;
  if (!memberQueueUserUserSettings)
  {
    v4 = (void *)MEMORY[0x1E0C99D50];
    MCUserUserSettingsFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MCDataFromFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v6, 1, 0, 0);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_memberQueueUserUserSettings;
      self->_memberQueueUserUserSettings = v7;

    }
    if (!self->_memberQueueUserUserSettings)
    {
      v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEFAULT, "Could not find user user settings. Creating new dictionary.", v13, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_memberQueueUserUserSettings;
      self->_memberQueueUserUserSettings = v10;

    }
    memberQueueUserUserSettings = self->_memberQueueUserUserSettings;
  }
  return memberQueueUserUserSettings;
}

- (int)restrictedBoolForFeature:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", v4, v5);

  return v6;
}

+ (int)restrictedBoolForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("restrictedBool"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10
        && (objc_msgSend(v10, "objectForKey:", CFSTR("value")),
            (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v13 = v12;
        if (objc_msgSend(v12, "BOOLValue"))
          v14 = 1;
        else
          v14 = 2;

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)valueForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("restrictedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableDictionary)memberQueueUserNamespacedUserSettings
{
  NSMutableDictionary *memberQueueUserNamespacedUserSettings;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint8_t v13[16];

  memberQueueUserNamespacedUserSettings = self->_memberQueueUserNamespacedUserSettings;
  if (!memberQueueUserNamespacedUserSettings)
  {
    v4 = (void *)MEMORY[0x1E0C99D50];
    MCUserNamespacedUserSettingsFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MCDataFromFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v6, 1, 0, 0);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_memberQueueUserNamespacedUserSettings;
      self->_memberQueueUserNamespacedUserSettings = v7;

    }
    if (!self->_memberQueueUserNamespacedUserSettings)
    {
      v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEFAULT, "Could not find user user settings. Creating new dictionary.", v13, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_memberQueueUserNamespacedUserSettings;
      self->_memberQueueUserNamespacedUserSettings = v10;

    }
    memberQueueUserNamespacedUserSettings = self->_memberQueueUserNamespacedUserSettings;
  }
  return memberQueueUserNamespacedUserSettings;
}

- (NSMutableDictionary)memberQueueSystemNamespacedUserSettings
{
  NSMutableDictionary *memberQueueSystemNamespacedUserSettings;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint8_t v13[16];

  memberQueueSystemNamespacedUserSettings = self->_memberQueueSystemNamespacedUserSettings;
  if (!memberQueueSystemNamespacedUserSettings)
  {
    v4 = (void *)MEMORY[0x1E0C99D50];
    MCSystemNamespacedUserSettingsFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MCDataFromFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v6, 1, 0, 0);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_memberQueueSystemNamespacedUserSettings;
      self->_memberQueueSystemNamespacedUserSettings = v7;

    }
    if (!self->_memberQueueSystemNamespacedUserSettings)
    {
      v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEFAULT, "Could not find system name spaced user settings. Creating new dictionary.", v13, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_memberQueueSystemNamespacedUserSettings;
      self->_memberQueueSystemNamespacedUserSettings = v10;

    }
    memberQueueSystemNamespacedUserSettings = self->_memberQueueSystemNamespacedUserSettings;
  }
  return memberQueueSystemNamespacedUserSettings;
}

- (NSMutableDictionary)memberQueueSettingsEvents
{
  NSMutableDictionary *memberQueueSettingsEvents;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint8_t v13[16];

  memberQueueSettingsEvents = self->_memberQueueSettingsEvents;
  if (!memberQueueSettingsEvents)
  {
    v4 = (void *)MEMORY[0x1E0C99D50];
    MCSettingsEventsFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MCDataFromFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v6, 1, 0, 0);
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_memberQueueSettingsEvents;
      self->_memberQueueSettingsEvents = v7;

    }
    if (!self->_memberQueueSettingsEvents)
    {
      v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEFAULT, "Could not find settings events. Creating new dictionary.", v13, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_memberQueueSettingsEvents;
      self->_memberQueueSettingsEvents = v10;

    }
    memberQueueSettingsEvents = self->_memberQueueSettingsEvents;
  }
  return memberQueueSettingsEvents;
}

- (BOOL)applyConfiguration:(id)a3 toDomain:(unint64_t)a4 inNamespace:(id)a5 fromSender:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *memberQueueSystemUserSettings;
  const __CFString *v16;
  NSMutableDictionary *memberQueueSystemNamespacedUserSettings;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *memberQueueUserNamespacedUserSettings;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *v26;
  BOOL v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  switch(a4)
  {
    case 0uLL:
      if ((-[NSMutableDictionary isEqualToDictionary:](self->_memberQueueSystemUserSettings, "isEqualToDictionary:", v10) & 1) != 0)goto LABEL_22;
      v13 = self->_memberQueueSystemUserSettings;
      v14 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      memberQueueSystemUserSettings = self->_memberQueueSystemUserSettings;
      self->_memberQueueSystemUserSettings = v14;
      v16 = CFSTR("SystemSettings");
      goto LABEL_36;
    case 1uLL:
      memberQueueSystemNamespacedUserSettings = self->_memberQueueSystemNamespacedUserSettings;
      if (v11)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](memberQueueSystemNamespacedUserSettings, "objectForKeyedSubscript:", v11);
        v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = memberQueueSystemNamespacedUserSettings;
      }
      v13 = v18;
      if ((-[NSMutableDictionary isEqualToDictionary:](v18, "isEqualToDictionary:", v10) & 1) != 0)
        goto LABEL_30;
      memberQueueSystemUserSettings = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      v29 = self->_memberQueueSystemNamespacedUserSettings;
      if (v11)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", memberQueueSystemUserSettings, v11);
        v16 = CFSTR("SystemNamespacedSettings");
        goto LABEL_36;
      }
      self->_memberQueueSystemNamespacedUserSettings = memberQueueSystemUserSettings;
      v16 = CFSTR("SystemNamespacedSettings");
      goto LABEL_35;
    case 2uLL:
      if ((-[NSMutableDictionary isEqualToDictionary:](self->_memberQueueUserUserSettings, "isEqualToDictionary:", v10) & 1) != 0)
        goto LABEL_22;
      v13 = self->_memberQueueUserUserSettings;
      v19 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      memberQueueSystemUserSettings = self->_memberQueueUserUserSettings;
      self->_memberQueueUserUserSettings = v19;
      v16 = CFSTR("UserSettings");
      goto LABEL_36;
    case 3uLL:
      memberQueueUserNamespacedUserSettings = self->_memberQueueUserNamespacedUserSettings;
      if (v11)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](memberQueueUserNamespacedUserSettings, "objectForKeyedSubscript:", v11);
        v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = memberQueueUserNamespacedUserSettings;
      }
      v13 = v21;
      if ((-[NSMutableDictionary isEqualToDictionary:](v21, "isEqualToDictionary:", v10) & 1) != 0)
      {
LABEL_30:
        v27 = 0;
        goto LABEL_38;
      }
      memberQueueSystemUserSettings = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      v29 = self->_memberQueueUserNamespacedUserSettings;
      if (v11)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", memberQueueSystemUserSettings, v11);
        v16 = CFSTR("UserNamespacedSettings");
      }
      else
      {
        self->_memberQueueUserNamespacedUserSettings = memberQueueSystemUserSettings;
        v16 = CFSTR("UserNamespacedSettings");
LABEL_35:
        memberQueueSystemUserSettings = v29;
      }
      goto LABEL_36;
    case 4uLL:
      if ((-[NSMutableDictionary isEqualToDictionary:](self->_memberQueueEffectiveUserSettings, "isEqualToDictionary:", v10) & 1) != 0)goto LABEL_22;
      v13 = self->_memberQueueEffectiveUserSettings;
      v22 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      memberQueueSystemUserSettings = self->_memberQueueEffectiveUserSettings;
      self->_memberQueueEffectiveUserSettings = v22;
      v16 = CFSTR("EffectiveSettings");
      goto LABEL_36;
    case 5uLL:
      if ((-[NSMutableDictionary isEqualToDictionary:](self->_memberQueueRestrictions, "isEqualToDictionary:", v10) & 1) != 0)
        goto LABEL_22;
      v13 = self->_memberQueueRestrictions;
      v23 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      memberQueueSystemUserSettings = self->_memberQueueRestrictions;
      self->_memberQueueRestrictions = v23;
      v16 = CFSTR("Restrictions");
      goto LABEL_36;
    case 6uLL:
      if ((-[NSMutableDictionary isEqualToDictionary:](self->_memberQueueSystemProfileRestrictions, "isEqualToDictionary:", v10) & 1) != 0)goto LABEL_22;
      v13 = self->_memberQueueSystemProfileRestrictions;
      v24 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      memberQueueSystemUserSettings = self->_memberQueueSystemProfileRestrictions;
      self->_memberQueueSystemProfileRestrictions = v24;
      v16 = CFSTR("SystemProfileRestrictions");
      goto LABEL_36;
    case 7uLL:
      if ((-[NSMutableDictionary isEqualToDictionary:](self->_memberQueueUserProfileRestrictions, "isEqualToDictionary:", v10) & 1) != 0)goto LABEL_22;
      v13 = self->_memberQueueUserProfileRestrictions;
      v25 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      memberQueueSystemUserSettings = self->_memberQueueUserProfileRestrictions;
      self->_memberQueueUserProfileRestrictions = v25;
      v16 = CFSTR("UserProfileRestrictions");
      goto LABEL_36;
    case 8uLL:
      if ((-[NSMutableDictionary isEqualToDictionary:](self->_memberQueueSystemClientRestrictions, "isEqualToDictionary:", v10) & 1) != 0)goto LABEL_22;
      v13 = self->_memberQueueSystemClientRestrictions;
      v26 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
      memberQueueSystemUserSettings = self->_memberQueueSystemClientRestrictions;
      self->_memberQueueSystemClientRestrictions = v26;
      v16 = CFSTR("SystemClientRestrictions");
      goto LABEL_36;
    case 9uLL:
      if ((-[NSMutableDictionary isEqualToDictionary:](self->_memberQueueUserClientRestrictions, "isEqualToDictionary:", v10) & 1) != 0)
      {
LABEL_22:
        v27 = 0;
        v13 = 0;
      }
      else
      {
        v13 = self->_memberQueueUserClientRestrictions;
        v28 = (NSMutableDictionary *)objc_msgSend(v10, "MCMutableDeepCopy");
        memberQueueSystemUserSettings = self->_memberQueueUserClientRestrictions;
        self->_memberQueueUserClientRestrictions = v28;
        v16 = CFSTR("UserClientRestrictions");
LABEL_36:

LABEL_37:
        -[NSMutableDictionary objectForKeyedSubscript:](self->_memberQueueSettingsEvents, "objectForKeyedSubscript:", v16);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCRestrictionManager _updatedDomainSettingsEvents:fromPreviousSettings:toNewSettings:sender:](self, "_updatedDomainSettingsEvents:fromPreviousSettings:toNewSettings:sender:", v30, v13, v10, v12);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_memberQueueSettingsEvents, "setObject:forKeyedSubscript:", v31, v16);

        v27 = 1;
      }
LABEL_38:

      return v27;
    default:
      v13 = 0;
      v16 = 0;
      goto LABEL_37;
  }
}

- (id)restrictedAppBundleIDs
{
  return -[MCRestrictionManager restrictedAppBundleIDsExcludingRemovedSystemApps:](self, "restrictedAppBundleIDsExcludingRemovedSystemApps:", 0);
}

+ (id)explicitlyRestrictedEphemeralMultiUserApps
{
  if (explicitlyRestrictedEphemeralMultiUserApps_onceToken != -1)
    dispatch_once(&explicitlyRestrictedEphemeralMultiUserApps_onceToken, &__block_literal_global_2);
  return (id)explicitlyRestrictedEphemeralMultiUserApps_apps;
}

void __80__MCRestrictionManager_AppWhitelist__explicitlyRestrictedEphemeralMultiUserApps__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.findmy");
  v2[1] = CFSTR("com.apple.Home");
  v2[2] = CFSTR("com.apple.Fitness");
  v2[3] = CFSTR("com.apple.Health");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)explicitlyRestrictedEphemeralMultiUserApps_apps;
  explicitlyRestrictedEphemeralMultiUserApps_apps = v0;

}

- (id)restrictionEnforcedBlockedAppBundleIDsExcludingRemovedSystemApps:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[MCRestrictionManager unionValuesForFeature:](self, "unionValuesForFeature:", CFSTR("blockedAppBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    -[MCRestrictionManager unionValuesForFeature:](self, "unionValuesForFeature:", CFSTR("removedSystemAppBundleIDs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parentalControlsBlockedAppBundleIDs
{
  void *v2;
  void *v3;

  -[MCRestrictionManager unionValuesSettingForFeature:](self, "unionValuesSettingForFeature:", CFSTR("blockedAppBundleIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)restrictionEnforcedWhitelistedAppBundleIDs
{
  void *v2;
  void *v3;

  -[MCRestrictionManager intersectedValuesForFeature:](self, "intersectedValuesForFeature:", CFSTR("appLockBundleIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)parentalControlsWhitelistedAppBundleIDs
{
  void *v2;
  void *v3;

  -[MCRestrictionManager intersectedValuesSettingForFeature:](self, "intersectedValuesSettingForFeature:", CFSTR("appLockBundleIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)effectiveWhitelistedAppsAndOptions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__MCRestrictionManager_AppWhitelist__effectiveWhitelistedAppsAndOptions__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__MCRestrictionManager_AppWhitelist__effectiveWhitelistedAppsAndOptions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveWhitelistedAppsAndOptions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)clearEffectiveWhitelistedAppsAndOptionsCache
{
  NSObject *v3;
  _QWORD block[5];

  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MCRestrictionManager_AppWhitelist__clearEffectiveWhitelistedAppsAndOptionsCache__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __82__MCRestrictionManager_AppWhitelist__clearEffectiveWhitelistedAppsAndOptionsCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueEffectiveWhitelistedAppsAndOptions:", 0);
}

- (BOOL)isInSingleAppMode
{
  void *v2;
  BOOL v3;

  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[MCRestrictionManager isInSingleAppModeWithSettingsDictionary:](MCRestrictionManager, "isInSingleAppModeWithSettingsDictionary:", v2);

  return v3;
}

- (id)singleAppModeBundleID
{
  void *v3;
  void *v4;
  void *v5;

  if (-[MCRestrictionManager isInSingleAppMode](self, "isInSingleAppMode"))
  {
    -[MCRestrictionManager effectiveWhitelistedAppsAndOptions](self, "effectiveWhitelistedAppsAndOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isSingleAppModeLogoutAllowed
{
  void *v2;
  BOOL v3;

  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[MCRestrictionManager isSingleAppModeLogoutAllowedWithSettingsDictionary:](MCRestrictionManager, "isSingleAppModeLogoutAllowedWithSettingsDictionary:", v2);

  return v3;
}

- (BOOL)allowedToRunAppWithBundleID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MCRestrictionManager restrictedAppBundleIDs](self, "restrictedAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[MCRestrictionManager effectiveWhitelistedAppBundleIDs](self, "effectiveWhitelistedAppBundleIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v6 = !v7 || objc_msgSend(v7, "containsObject:", v4);

  }
  return v6;
}

+ (id)defaultRestrictionFilePath
{
  if (defaultRestrictionFilePath_onceToken != -1)
    dispatch_once(&defaultRestrictionFilePath_onceToken, &__block_literal_global_44);
  return (id)defaultRestrictionFilePath_path;
}

void __50__MCRestrictionManager_defaultRestrictionFilePath__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  MCGetBaseResourcePath();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("defaultRestrictions.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultRestrictionFilePath_path;
  defaultRestrictionFilePath_path = v0;

}

- (NSDictionary)defaultRestrictions
{
  if (defaultRestrictions_onceToken != -1)
    dispatch_once(&defaultRestrictions_onceToken, &__block_literal_global_6_0);
  return (NSDictionary *)(id)defaultRestrictions_dict;
}

void __43__MCRestrictionManager_defaultRestrictions__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB38B0];
  v1 = (void *)MEMORY[0x1E0C99D50];
  +[MCRestrictionManager defaultRestrictionFilePath](MCRestrictionManager, "defaultRestrictionFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "MCDataFromFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v0, "MCSafePropertyListWithData:options:format:error:", v3, 0, 0, &v10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = (void *)defaultRestrictions_dict;
  defaultRestrictions_dict = v4;

  if (!defaultRestrictions_dict)
  {
    v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Cannot load default restrictions file. Substituting empty dictionary. Error: %{public}@", buf, 0xCu);
    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v9 = (void *)defaultRestrictions_dict;
    defaultRestrictions_dict = (uint64_t)v8;

  }
}

- (NSDictionary)defaultSettings
{
  return (NSDictionary *)+[MCRestrictionManager defaultSettings](MCRestrictionManager, "defaultSettings");
}

- (NSMutableDictionary)memberQueueSystemProfileRestrictions
{
  NSMutableDictionary *memberQueueSystemProfileRestrictions;
  NSMutableDictionary *v3;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;

  memberQueueSystemProfileRestrictions = self->_memberQueueSystemProfileRestrictions;
  if (memberQueueSystemProfileRestrictions)
  {
    v3 = memberQueueSystemProfileRestrictions;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99D50];
    MCSystemProfileRestrictionsFilePath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "MCDataFromFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v7, 1, 0, 0);
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->_memberQueueSystemProfileRestrictions;
      self->_memberQueueSystemProfileRestrictions = v8;

    }
    if (!self->_memberQueueSystemProfileRestrictions || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_memberQueueSystemProfileRestrictions;
      self->_memberQueueSystemProfileRestrictions = v10;

    }
    v3 = self->_memberQueueSystemProfileRestrictions;

  }
  return v3;
}

- (NSMutableDictionary)memberQueueUserProfileRestrictions
{
  NSMutableDictionary *memberQueueUserProfileRestrictions;
  NSMutableDictionary *v3;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;

  memberQueueUserProfileRestrictions = self->_memberQueueUserProfileRestrictions;
  if (memberQueueUserProfileRestrictions)
  {
    v3 = memberQueueUserProfileRestrictions;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99D50];
    MCUserProfileRestrictionsFilePath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "MCDataFromFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v7, 1, 0, 0);
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->_memberQueueUserProfileRestrictions;
      self->_memberQueueUserProfileRestrictions = v8;

    }
    if (!self->_memberQueueUserProfileRestrictions || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_memberQueueUserProfileRestrictions;
      self->_memberQueueUserProfileRestrictions = v10;

    }
    v3 = self->_memberQueueUserProfileRestrictions;

  }
  return v3;
}

- (NSDictionary)systemProfileRestrictions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MCRestrictionManager_systemProfileRestrictions__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __49__MCRestrictionManager_systemProfileRestrictions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemProfileRestrictions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)userProfileRestrictions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MCRestrictionManager_userProfileRestrictions__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __47__MCRestrictionManager_userProfileRestrictions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueUserProfileRestrictions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)memberQueueCombinedSystemProfileRestrictions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MCRestrictionManager memberQueueSystemProfileRestrictions](self, "memberQueueSystemProfileRestrictions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[MCRestrictionManager memberQueueSystemProfileRestrictions](self, "memberQueueSystemProfileRestrictions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1A1AF0250]();
        +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v12, v9, 0, 0);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v13);
        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)memberQueueCombinedProfileRestrictions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[MCRestrictionManager memberQueueSystemProfileRestrictions](self, "memberQueueSystemProfileRestrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8);
        -[MCRestrictionManager memberQueueSystemProfileRestrictions](self, "memberQueueSystemProfileRestrictions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1A1AF0250]();
        +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v12, v9, 0, 0);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v13);
        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MCRestrictionManager memberQueueUserProfileRestrictions](self, "memberQueueUserProfileRestrictions", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      v19 = v3;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18);
        -[MCRestrictionManager memberQueueUserProfileRestrictions](self, "memberQueueUserProfileRestrictions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1A1AF0250]();
        +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v22, v19, 0, 0);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v23);
        ++v18;
        v19 = v3;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }

  return (NSMutableDictionary *)v3;
}

- (NSDictionary)combinedProfileRestrictions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MCRestrictionManager_combinedProfileRestrictions__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __51__MCRestrictionManager_combinedProfileRestrictions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCombinedProfileRestrictions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MCRestrictionManager;
  -[MCRestrictionManager description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: Restrictions:%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)potentialRestrictionsAfterApplyingRestrictionsDictionary:(id)a3 outChangeDetected:(BOOL *)a4 outError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v8, v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)restrictionsAfterApplyingRestrictionsDictionary:(id)a3 toRestrictionsDictionary:(id)a4 outChangeDetected:(BOOL *)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char v37;
  char v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  BOOL v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t m;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  id *v110;
  id *v111;
  id v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  char v126;
  void *v127;
  char v128;
  void *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "MCMutableDeepCopy");
  objc_msgSend(v8, "objectForKey:", CFSTR("restrictedBool"));
  v10 = objc_claimAutoreleasedReturnValue();
  v113 = v8;
  v114 = v9;
  if (!v10)
  {
    v38 = 0;
    goto LABEL_36;
  }
  v11 = (void *)v10;
  objc_msgSend(v9, "objectForKey:", CFSTR("restrictedBool"));
  v115 = objc_claimAutoreleasedReturnValue();
  if (!v115)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v115 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:");
  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v12 = v11;
  v124 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v146, v154, 16);
  if (!v124)
  {
    v37 = 0;
    v27 = 0;
    v13 = (void *)v115;
    goto LABEL_34;
  }
  v110 = a6;
  v118 = 0;
  v122 = *(_QWORD *)v147;
  v13 = (void *)v115;
  while (2)
  {
    for (i = 0; i != v124; ++i)
    {
      if (*(_QWORD *)v147 != v122)
        objc_enumerationMutation(v12);
      v15 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
      objc_msgSend(v12, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v16, "objectForKey:", CFSTR("preference"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("preference"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v18)
          v21 = v19 == 0;
        else
          v21 = 1;
        if (v21 || (v22 = objc_msgSend(v18, "BOOLValue"), v22 != objc_msgSend(v20, "BOOLValue")))
        {

          v28 = (void *)MEMORY[0x1E0CB35C8];
          MCErrorArray(CFSTR("RESTRICTION_ERROR_INCONSISTENT_SENSE_P_KEY"), v29, v30, v31, v32, v33, v34, v35, v15);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCRestrictionsErrorDomain"), 3000, v36, CFSTR("MCFatalError"));
          v27 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
        objc_msgSend(v16, "objectForKey:", CFSTR("value"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "objectForKey:", CFSTR("value"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v24
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || (objc_msgSend(v23, "isEqualToNumber:", v24) & 1) == 0)
            {
              v25 = objc_msgSend(v23, "BOOLValue");
              if (v22 == (_DWORD)v25)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setValue:forKey:", v26, CFSTR("value"));

                v118 = 1;
              }
            }

            v13 = (void *)v115;
          }
        }

      }
      else
      {
        if (!v16)
          goto LABEL_27;
        v18 = (void *)objc_msgSend(v16, "mutableCopy");
        objc_msgSend(v13, "setValue:forKey:", v18, v15);
        v118 = 1;
      }

LABEL_27:
    }
    v124 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v146, v154, 16);
    if (v124)
      continue;
    break;
  }
  v27 = 0;
LABEL_31:
  v8 = v113;
  a6 = v110;
  v37 = v118;
LABEL_34:

  v9 = v114;
  if (v27)
    goto LABEL_69;
  v38 = v37 & 1;
LABEL_36:
  objc_msgSend(v8, "objectForKey:", CFSTR("restrictedValue"));
  v39 = objc_claimAutoreleasedReturnValue();
  if (!v39)
    goto LABEL_71;
  v40 = (void *)v39;
  objc_msgSend(v9, "objectForKey:", CFSTR("restrictedValue"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v41, CFSTR("restrictedValue"));
  }
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v42 = v40;
  v123 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v142, v153, 16);
  if (!v123)
  {
    v27 = 0;
    goto LABEL_68;
  }
  v111 = a6;
  v125 = v38;
  v121 = *(_QWORD *)v143;
  while (2)
  {
    v43 = 0;
    while (2)
    {
      if (*(_QWORD *)v143 != v121)
        objc_enumerationMutation(v42);
      v44 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v43);
      objc_msgSend(v42, "objectForKey:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKey:", v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        objc_msgSend(v45, "objectForKey:", CFSTR("preferSmallerValues"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKey:", CFSTR("preferSmallerValues"));
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = (void *)v48;
        if (v47)
          v50 = v48 == 0;
        else
          v50 = 1;
        if (v50 || (v51 = objc_msgSend(v47, "BOOLValue"), v51 != objc_msgSend(v49, "BOOLValue")))
        {

          v57 = (void *)MEMORY[0x1E0CB35C8];
          MCErrorArray(CFSTR("RESTRICTION_ERROR_INCONSISTENT_SENSE_P_KEY"), v58, v59, v60, v61, v62, v63, v64, v44);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCRestrictionsErrorDomain"), 3001, v65, CFSTR("MCFatalError"));
          v27 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_66;
        }
        objc_msgSend(v45, "objectForKey:", CFSTR("value"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKey:", CFSTR("value"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v53)
              goto LABEL_57;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_57;
            v54 = objc_msgSend(v52, "compare:", v53);
            v55 = -1;
            if (!v51)
              v55 = 1;
            if (v54 == v55)
            {
LABEL_57:
              v56 = (void *)objc_msgSend(v52, "copy");
              objc_msgSend(v46, "setValue:forKey:", v56, CFSTR("value"));

              v125 = 1;
            }
          }
        }

LABEL_61:
      }
      else if (v45)
      {
        v47 = (void *)objc_msgSend(v45, "mutableCopy");
        objc_msgSend(v41, "setValue:forKey:", v47, v44);
        v125 = 1;
        goto LABEL_61;
      }

      if (v123 != ++v43)
        continue;
      break;
    }
    v123 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v142, v153, 16);
    if (v123)
      continue;
    break;
  }
  v27 = 0;
LABEL_66:
  v8 = v113;
  v38 = v125;
  a6 = v111;
LABEL_68:

  v9 = v114;
  if (v27)
  {
LABEL_69:
    if (a6)
    {
      v27 = objc_retainAutorelease(v27);
      v66 = 0;
      *a6 = v27;
    }
    else
    {
      v66 = 0;
    }
    goto LABEL_143;
  }
LABEL_71:
  objc_msgSend(v8, "objectForKey:", CFSTR("intersection"));
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    v126 = v38;
    objc_msgSend(v9, "objectForKey:", CFSTR("intersection"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v69)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v69, CFSTR("intersection"));
    }
    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    v70 = v68;
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v138, v152, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v139;
      v116 = *(_QWORD *)v139;
      do
      {
        for (j = 0; j != v72; ++j)
        {
          if (*(_QWORD *)v139 != v73)
            objc_enumerationMutation(v70);
          v75 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j);
          objc_msgSend(v70, "objectForKey:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "objectForKey:", v75);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
          {
            if (!v76)
              goto LABEL_94;
            objc_msgSend(v76, "objectForKey:", CFSTR("values"));
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "objectForKey:", CFSTR("values"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if (v78)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (v79 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v78);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v79);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  v119 = (void *)objc_msgSend(v81, "copy");
                  objc_msgSend(v81, "intersectSet:", v80);
                  if ((objc_msgSend(v81, "isEqualToSet:", v119) & 1) == 0)
                  {
                    objc_msgSend(v81, "allObjects");
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "setObject:forKey:", v127, CFSTR("values"));

                    v126 = 1;
                  }

                  v73 = v116;
                }
                else
                {
                  v80 = (void *)objc_msgSend(v78, "mutableCopy");
                  objc_msgSend(v77, "setObject:forKey:", v80, CFSTR("values"));
                  v126 = 1;
                }

              }
            }

          }
          else
          {
            if (!v76)
              goto LABEL_94;
            v78 = (void *)objc_msgSend(v76, "mutableCopy");
            objc_msgSend(v69, "setValue:forKey:", v78, v75);
            v126 = 1;
          }

LABEL_94:
        }
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v138, v152, 16);
      }
      while (v72);
    }

    v8 = v113;
    v9 = v114;
    v38 = v126;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("union"));
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    v128 = v38;
    objc_msgSend(v9, "objectForKey:", CFSTR("union"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v84)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v84, CFSTR("union"));
    }
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v85 = v83;
    v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v134, v151, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v135;
      v117 = *(_QWORD *)v135;
      do
      {
        for (k = 0; k != v87; ++k)
        {
          if (*(_QWORD *)v135 != v88)
            objc_enumerationMutation(v85);
          v90 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * k);
          objc_msgSend(v85, "objectForKey:", v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKey:", v90);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (v92)
          {
            if (!v91)
              goto LABEL_120;
            objc_msgSend(v91, "objectForKey:", CFSTR("values"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "objectForKey:", CFSTR("values"));
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            if (v93)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (v94 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v93);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v94);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  v120 = (void *)objc_msgSend(v96, "copy");
                  objc_msgSend(v96, "unionSet:", v95);
                  if ((objc_msgSend(v96, "isEqual:", v120) & 1) == 0)
                  {
                    objc_msgSend(v96, "allObjects");
                    v129 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v92, "setObject:forKey:", v129, CFSTR("values"));

                    v128 = 1;
                  }

                  v88 = v117;
                }
                else
                {
                  v95 = (void *)objc_msgSend(v93, "mutableCopy");
                  objc_msgSend(v92, "setObject:forKey:", v95, CFSTR("values"));
                  v128 = 1;
                }

              }
            }

          }
          else
          {
            if (!v91)
              goto LABEL_120;
            v93 = (void *)objc_msgSend(v91, "mutableCopy");
            objc_msgSend(v84, "setValue:forKey:", v93, v90);
            v128 = 1;
          }

LABEL_120:
        }
        v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v134, v151, 16);
      }
      while (v87);
    }

    v8 = v113;
    v9 = v114;
    v38 = v128;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("assignedObject"));
  v97 = objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    v98 = (void *)v97;
    objc_msgSend(v9, "objectForKey:", CFSTR("assignedObject"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v99)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v99, CFSTR("assignedObject"));
    }
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v100 = v98;
    v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v130, v150, 16);
    if (v101)
    {
      v102 = v101;
      v103 = *(_QWORD *)v131;
      do
      {
        for (m = 0; m != v102; ++m)
        {
          if (*(_QWORD *)v131 != v103)
            objc_enumerationMutation(v100);
          v105 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * m);
          objc_msgSend(v100, "objectForKey:", v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "objectForKey:", v105);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v107)
            goto LABEL_135;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v99, "removeObjectForKey:", v105);
            goto LABEL_136;
          }
          if ((objc_msgSend(v107, "isEqual:", v106) & 1) == 0)
          {
LABEL_135:
            v108 = (void *)objc_msgSend(v106, "copy");
            objc_msgSend(v99, "setValue:forKey:", v108, v105);

            v38 = 1;
          }
LABEL_136:

        }
        v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v130, v150, 16);
      }
      while (v102);
    }

    v8 = v113;
    v9 = v114;
  }
  if (a5)
    *a5 = v38 & 1;
  v66 = v9;
  v27 = 0;
LABEL_143:

  return v66;
}

+ (id)restrictionsWithCurrentRestrictions:(id)a3 defaultRestrictions:(id)a4 systemProfileRestrictions:(id)a5 userProfileRestrictions:(id)a6 systemClientRestrictions:(id)a7 userClientRestrictions:(id)a8 outRestrictionsChanged:(BOOL *)a9 outError:(id *)a10
{
  BOOL *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  BOOL *v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v15 = a9;
  v101 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v65 = a5;
  v64 = a6;
  v16 = a7;
  v66 = a8;
  v17 = (id)objc_msgSend(a4, "MCMutableDeepCopy");
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v92;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v92 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("overrideRestrictions"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "BOOLValue") & 1) != 0)
        {
          v25 = v18;
          goto LABEL_51;
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
      if (v20)
        continue;
      break;
    }
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v25 = v66;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v88;
LABEL_11:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v88 != v28)
        objc_enumerationMutation(v25);
      objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v29));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("overrideRestrictions"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "BOOLValue") & 1) != 0)
        break;

      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
        if (v27)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_51:
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("clientRestrictions"));
    v58 = objc_claimAutoreleasedReturnValue();

    v30 = v25;
    v17 = (id)v58;
    v57 = v63;
    goto LABEL_52;
  }
LABEL_17:
  v61 = a9;

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v30 = v65;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v84;
LABEL_19:
    v34 = 0;
    v35 = v17;
    while (1)
    {
      if (*(_QWORD *)v84 != v33)
        objc_enumerationMutation(v30);
      objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v34), v61);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v36, v35, 0, &v82);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v37 = v82;

      if (v37)
        goto LABEL_56;
      ++v34;
      v35 = v17;
      if (v32 == v34)
      {
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
        if (v32)
          goto LABEL_19;
        break;
      }
    }
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v30 = v18;
  v38 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
  if (v38)
  {
    v39 = v38;
    v62 = *(_QWORD *)v79;
LABEL_27:
    v40 = 0;
    v41 = v17;
    while (1)
    {
      if (*(_QWORD *)v79 != v62)
        objc_enumerationMutation(v30);
      objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v40), v61);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("clientRestrictions"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = 0;
      +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v43, v41, 0, &v77);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v37 = v77;

      if (v37)
        goto LABEL_56;
      ++v40;
      v41 = v17;
      if (v39 == v40)
      {
        v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
        if (v39)
          goto LABEL_27;
        break;
      }
    }
  }

  v76 = 0u;
  v74 = 0u;
  v75 = 0u;
  v73 = 0u;
  v30 = v64;
  v44 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v74;
LABEL_35:
    v47 = 0;
    v48 = v17;
    while (1)
    {
      if (*(_QWORD *)v74 != v46)
        objc_enumerationMutation(v30);
      objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v47), v61);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v49, v48, 0, &v72);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v37 = v72;

      if (v37)
        goto LABEL_56;
      ++v47;
      v48 = v17;
      if (v45 == v47)
      {
        v45 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
        if (v45)
          goto LABEL_35;
        break;
      }
    }
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v30 = v25;
  v50 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v95, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v69;
LABEL_43:
    v53 = 0;
    v54 = v17;
    while (1)
    {
      if (*(_QWORD *)v69 != v52)
        objc_enumerationMutation(v30);
      objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v53), v61);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("clientRestrictions"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = 0;
      +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v56, v54, 0, &v67);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v37 = v67;

      if (v37)
        break;
      ++v53;
      v54 = v17;
      if (v51 == v53)
      {
        v51 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v95, 16);
        if (v51)
          goto LABEL_43;
        goto LABEL_49;
      }
    }
LABEL_56:

    v57 = v63;
    if (a10)
    {
      v37 = objc_retainAutorelease(v37);
      v59 = 0;
      *a10 = v37;
    }
    else
    {
      v59 = 0;
    }
    goto LABEL_55;
  }
LABEL_49:
  v57 = v63;
  v15 = v61;
LABEL_52:

  if (v15)
    *v15 = MCEqualDictionaries(v17, v57) ^ 1;
  v17 = v17;
  v37 = 0;
  v59 = v17;
LABEL_55:

  return v59;
}

+ (id)filterRestrictionDictionaryForPublicUse:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = filterRestrictionDictionaryForPublicUse__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&filterRestrictionDictionaryForPublicUse__onceToken, &__block_literal_global_24_0);
  objc_msgSend(a1, "filterRestrictionDictionary:acceptedKeysDict:", v5, filterRestrictionDictionaryForPublicUse__keysDict);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __64__MCRestrictionManager_filterRestrictionDictionaryForPublicUse___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99D80];
  MCGetBaseResourcePath();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("publicRestrictionKeys.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "MCDictionaryFromFile:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)filterRestrictionDictionaryForPublicUse__keysDict;
  filterRestrictionDictionaryForPublicUse__keysDict = v2;

}

+ (id)filterRestrictionDictionary:(id)a3 acceptedKeysDict:(id)a4
{
  id v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  const __CFString *v84;
  void *v85;
  _BYTE v86[128];
  const __CFString *v87;
  void *v88;
  _BYTE v89[128];
  const __CFString *v90;
  void *v91;
  _BYTE v92[128];
  const __CFString *v93;
  void *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v56 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v63 = objc_claimAutoreleasedReturnValue();

  v58 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v81 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
        if (objc_msgSend(v66, "containsObject:", v20))
        {
          objc_msgSend(obj, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("value"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v93 = CFSTR("value");
            v94 = v22;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setObject:forKeyedSubscript:", v23, v20);

          }
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v62, "count"))
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v62, CFSTR("restrictedBool"));
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v77 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
        if (objc_msgSend(v65, "containsObject:", v30))
        {
          objc_msgSend(v25, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("value"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            v90 = CFSTR("value");
            v91 = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v33, v30);

          }
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    }
    while (v27);
  }

  if (objc_msgSend(v61, "count"))
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v61, CFSTR("restrictedValue"));
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("intersection"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v35 = v34;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v73;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v73 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k);
        if (objc_msgSend(v64, "containsObject:", v40))
        {
          objc_msgSend(v35, "objectForKeyedSubscript:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("values"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            v87 = CFSTR("values");
            v88 = v42;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setObject:forKeyedSubscript:", v43, v40);

          }
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
    }
    while (v37);
  }

  if (objc_msgSend(v60, "count"))
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v60, CFSTR("intersection"));
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("union"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v45 = v44;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
  v47 = (void *)v63;
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v69;
    do
    {
      for (m = 0; m != v48; ++m)
      {
        if (*(_QWORD *)v69 != v49)
          objc_enumerationMutation(v45);
        v51 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m);
        if (objc_msgSend(v47, "containsObject:", v51))
        {
          objc_msgSend(v45, "objectForKeyedSubscript:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("values"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            v84 = CFSTR("values");
            v85 = v53;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKeyedSubscript:", v54, v51);

          }
          v47 = (void *)v63;
        }
      }
      v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    }
    while (v48);
  }

  if (objc_msgSend(v59, "count"))
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v59, CFSTR("union"));

  return v57;
}

+ (id)filterRestrictionDictionary:(id)a3 toIncludeOnlyRestrictionsThatDifferFromRestrictions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  void *v22;
  id v23;
  const __CFString *v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  const __CFString *v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  const __CFString *v54;
  uint64_t m;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  id v65;
  void *v66;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  char v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v68 = (id)objc_claimAutoreleasedReturnValue();
  v70 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v8 = v7;
  v87 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
  if (v87)
  {
    v79 = *(_QWORD *)v104;
    v72 = v8;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v104 != v79)
          objc_enumerationMutation(v8);
        v10 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1A1AF0250]();
        objc_msgSend(v8, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLValue");
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("preference"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v11;
          v20 = objc_msgSend(v18, "BOOLValue");

          v21 = v17 == v20;
          v11 = v19;
          v8 = v72;
          if (v21)
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v12, v10);
        }

        objc_autoreleasePoolPop(v11);
      }
      v87 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
    }
    while (v87);
  }

  if (objc_msgSend(v71, "count"))
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v71, CFSTR("restrictedBool"));

  objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v23 = v22;
  v84 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
  if (v84)
  {
    v76 = *(_QWORD *)v100;
    v24 = CFSTR("value");
    do
    {
      for (j = 0; j != v84; ++j)
      {
        if (*(_QWORD *)v100 != v76)
          objc_enumerationMutation(v23);
        v26 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j);
        v27 = (void *)MEMORY[0x1A1AF0250]();
        objc_msgSend(v23, "objectForKeyedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectForKeyedSubscript:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v24);
        v30 = objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v31 = (void *)v30;
          objc_msgSend(v28, "objectForKeyedSubscript:", v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("default"));
          v33 = v27;
          v34 = v24;
          v35 = v23;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v32, "isEqual:", v36);

          v23 = v35;
          v24 = v34;
          v27 = v33;

          if ((v88 & 1) == 0)
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v28, v26);
        }

        objc_autoreleasePoolPop(v27);
      }
      v84 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    }
    while (v84);
  }

  if (objc_msgSend(v73, "count"))
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v73, CFSTR("restrictedValue"));

  objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("intersection"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("intersection"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v38 = v37;
  v85 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  if (v85)
  {
    v77 = *(_QWORD *)v96;
    v39 = CFSTR("values");
    do
    {
      for (k = 0; k != v85; ++k)
      {
        if (*(_QWORD *)v96 != v77)
          objc_enumerationMutation(v38);
        v41 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * k);
        v42 = (void *)MEMORY[0x1A1AF0250]();
        objc_msgSend(v38, "objectForKeyedSubscript:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "objectForKeyedSubscript:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v39);
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          v46 = (void *)v45;
          objc_msgSend(v43, "objectForKeyedSubscript:", v39);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("default"));
          v48 = v42;
          v49 = v39;
          v50 = v38;
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v47, "isEqual:", v51);

          v38 = v50;
          v39 = v49;
          v42 = v48;

          if ((v89 & 1) == 0)
            objc_msgSend(v74, "setObject:forKeyedSubscript:", v43, v41);
        }

        objc_autoreleasePoolPop(v42);
      }
      v85 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    }
    while (v85);
  }

  if (objc_msgSend(v74, "count"))
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v74, CFSTR("intersection"));

  objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("union"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("union"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v52, "count"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v53 = v52;
  v86 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  if (v86)
  {
    v78 = *(_QWORD *)v92;
    v54 = CFSTR("values");
    do
    {
      for (m = 0; m != v86; ++m)
      {
        if (*(_QWORD *)v92 != v78)
          objc_enumerationMutation(v53);
        v56 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * m);
        v57 = (void *)MEMORY[0x1A1AF0250]();
        objc_msgSend(v53, "objectForKeyedSubscript:", v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "objectForKeyedSubscript:", v56);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", v54);
        v60 = objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v61 = (void *)v60;
          objc_msgSend(v58, "objectForKeyedSubscript:", v54);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("default"));
          v63 = v57;
          v64 = v54;
          v65 = v53;
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v62, "isEqual:", v66);

          v53 = v65;
          v54 = v64;
          v57 = v63;

          if ((v90 & 1) == 0)
            objc_msgSend(v75, "setObject:forKeyedSubscript:", v58, v56);
        }

        objc_autoreleasePoolPop(v57);
      }
      v86 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
    }
    while (v86);
  }

  if (objc_msgSend(v75, "count"))
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v75, CFSTR("union"));

  return v68;
}

+ (id)filterUserSettingsForPublicUse:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "MCSetUnionSetting:values:", CFSTR("blacklistedAppBundleIDs"), 0);
  objc_msgSend(v3, "MCSetUnionSetting:values:", CFSTR("blockedAppBundleIDs"), 0);
  objc_msgSend(v3, "MCSetUnionSetting:values:", CFSTR("trustedCodeSigningIdentities"), 0);
  objc_msgSend(v3, "MCSetIntersectionSetting:values:", CFSTR("appLockBundleIDs"), 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)restrictionKeys
{
  if (restrictionKeys_onceToken != -1)
    dispatch_once(&restrictionKeys_onceToken, &__block_literal_global_27_1);
  return (id)restrictionKeys_restrictionKeys;
}

void __39__MCRestrictionManager_restrictionKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("restrictedBool");
  v2[1] = CFSTR("restrictedValue");
  v2[2] = CFSTR("intersection");
  v2[3] = CFSTR("union");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)restrictionKeys_restrictionKeys;
  restrictionKeys_restrictionKeys = v0;

}

+ (id)systemMetadataValueForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D50];
  MCSystemMetadataFilePath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MCDataFromFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v6, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_5:
      v7 = 0;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)filterGrandfatheredRestrictionsIfNeededFromRestrictions:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "systemMetadataValueForKey:", CFSTR("StopFilteringGrandfatheredRestrictions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
    goto LABEL_12;
  +[MCRestrictionManager allowedGrandfatheredRestrictionPayloadKeysDictionary](MCRestrictionManager, "allowedGrandfatheredRestrictionPayloadKeysDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager grandfatheredRestrictionPayloadKeysDictionary](MCRestrictionManager, "grandfatheredRestrictionPayloadKeysDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  v10 = _MCLogObjects;
  v11 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEFAULT, "Honor only allowed grandfathered restrictions", (uint8_t *)&v17, 2u);
    }
    +[MCRestrictionManager filterRestrictionPayloadKeysDictionary:removingPayloadKeysInRestrictionPayloadKeysDictionary:](MCRestrictionManager, "filterRestrictionPayloadKeysDictionary:removingPayloadKeysInRestrictionPayloadKeysDictionary:", v8, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
    {
      v13 = v10;
      v17 = 138412546;
      v18 = CFSTR("NO");
      v19 = 2048;
      v20 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_DEFAULT, "Don't honor deprecated unsupervised restrictions, stopFilteringGrandfatheredRestrictions: %@, allowedGrandfatheredRestrictionPayloadKeys count: %lu", (uint8_t *)&v17, 0x16u);

    }
    v12 = v8;
  }
  v14 = v12;
  if (!v12)
  {

LABEL_12:
    v15 = v4;
    goto LABEL_13;
  }
  +[MCRestrictionManager filterRestrictionDictionary:removingPayloadKeysInRestrictionPayloadKeysDictionary:](MCRestrictionManager, "filterRestrictionDictionary:removingPayloadKeysInRestrictionPayloadKeysDictionary:", v4, v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v15;
}

+ (id)allowedGrandfatheredRestrictionPayloadKeysDictionary
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(a1, "systemMetadataValueForKey:", CFSTR("AllowedGrandfatheredRestrictions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    v3 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEFAULT, "No flagged grandfathered restrictions set on the device.", v5, 2u);
    }
  }
  return v2;
}

+ (id)effectiveGrandfatheredRestrictionPayloadKeysDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "restrictionKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        +[MCRestrictionManager grandfatheredRestrictionPayloadKeysDictionary](MCRestrictionManager, "grandfatheredRestrictionPayloadKeysDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_lockedDownRestrictionPayloadKeysWithPayloadKeysDictionary:forRestrictionKey:", v10, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v12 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v3, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_DEFAULT, "Locked down deprecated unsupervised restrictions: %@\n", buf, 0xCu);

    }
    v15 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_lockedDownRestrictionPayloadKeysWithPayloadKeysDictionary:(id)a3 forRestrictionKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v21 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        objc_msgSend(a1, "sharedManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isSettingLockedDownByRestrictions:", v14);

        if (v16)
        {
          objc_msgSend(a1, "_payloadKeysDictionaryAfterAddingFeature:toRestrictionPayloadKeysDictionary:forRestrictionKey:", v14, v8, v7);
          v17 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v17;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)_payloadKeysDictionaryAfterAddingFeature:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

    }
    else
    {
      v14 = (void *)objc_opt_new();
    }
    if ((objc_msgSend(v14, "containsObject:", v7) & 1) == 0)
      objc_msgSend(v14, "addObject:", v7);
    v17 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v9);

    v16 = (void *)objc_msgSend(v11, "copy");
  }
  else
  {
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v9);

    v16 = (void *)objc_msgSend(v10, "copy");
    v11 = v10;
  }

  return v16;
}

+ (id)grandfatheredRestrictionPayloadKeysDictionary
{
  if (grandfatheredRestrictionPayloadKeysDictionary_onceToken != -1)
    dispatch_once(&grandfatheredRestrictionPayloadKeysDictionary_onceToken, &__block_literal_global_33_0);
  return (id)grandfatheredRestrictionPayloadKeysDictionary_grandfatheredRestrictionPayloadKeysDictionary;
}

void __69__MCRestrictionManager_grandfatheredRestrictionPayloadKeysDictionary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0C99D80];
  MCGetBaseResourcePath();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("deprecatedUnsupervisedRestrictionPayloadKeys.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "MCDictionaryFromFile:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = (void *)grandfatheredRestrictionPayloadKeysDictionary_grandfatheredRestrictionPayloadKeysDictionary;
  grandfatheredRestrictionPayloadKeysDictionary_grandfatheredRestrictionPayloadKeysDictionary = v3;

}

+ (id)_filterRestrictionDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23 = (void *)objc_msgSend(v7, "mutableCopy");
  v26 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v9;
  v25 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "containsObject:", v18) & 1) != 0)
        {
          v20 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v18;
            _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_DEFAULT, "Filter out the following restriction: %@", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v15);
  }

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, v24);
  v21 = (void *)objc_msgSend(v23, "copy");

  return v21;
}

+ (id)filterRestrictionDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "restrictionKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend((id)objc_opt_class(), "_filterRestrictionDictionary:removingPayloadKeysInRestrictionPayloadKeysDictionary:forRestrictionKey:", v13, v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

+ (id)_filterRestrictionPayloadKeysDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v13, "removeObjectsInArray:", v14);
    v16 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v9);

    v17 = (id)objc_msgSend(v15, "copy");
  }
  else
  {
    v17 = v7;
  }

  return v17;
}

+ (id)filterRestrictionPayloadKeysDictionary:(id)a3 removingPayloadKeysInRestrictionPayloadKeysDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "restrictionKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_filterRestrictionPayloadKeysDictionary:removingPayloadKeysInRestrictionPayloadKeysDictionary:forRestrictionKey:", v13, v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

+ (id)_addRestrictionPayloadKeysDictionary:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4 forRestrictionKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_msgSend(v8, "mutableCopy");

    v10 = (void *)v11;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v25 = v7;
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v13;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v15, "containsObject:", v21, v24) & 1) == 0)
            objc_msgSend(v15, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v9);
    v13 = v24;
    v7 = v25;
  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v9);
  }
  v22 = (void *)objc_msgSend(v10, "copy", v24);

  return v22;
}

+ (id)addRestrictionPayloadKeysDictionary:(id)a3 toRestrictionPayloadKeysDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "MCDeepCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "restrictionKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_addRestrictionPayloadKeysDictionary:toRestrictionPayloadKeysDictionary:forRestrictionKey:", v6, v13, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }

  v14 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v7, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v16;
    _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEFAULT, "Union Dictionary in the abstract: %@\n", buf, 0xCu);

  }
  v17 = (void *)objc_msgSend(v7, "copy");

  return v17;
}

- (id)valueForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager objectForFeature:withRestrictionsDictionary:](MCRestrictionManager, "objectForFeature:withRestrictionsDictionary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)intersectedValuesForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)objectForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("assignedObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)intersectedValuesForFeature:(id)a3 withRestrictionsDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("intersection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)restrictedBool:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("restrictedBool"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("value"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("restrictedBool"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("value"));
  v14 = objc_claimAutoreleasedReturnValue();

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0))
      LOBYTE(v15) = 1;
    else
      v15 = objc_msgSend((id)v11, "isEqualToNumber:", v14) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)restrictedValue:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("restrictedValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("value"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("restrictedValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("value"));
  v14 = objc_claimAutoreleasedReturnValue();

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0))
      LOBYTE(v15) = 1;
    else
      v15 = objc_msgSend((id)v11, "isEqualToNumber:", v14) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)intersectedValuesForFeature:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("intersection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("values"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("intersection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("values"));
  v14 = objc_claimAutoreleasedReturnValue();

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0))
      LOBYTE(v15) = 1;
    else
      v15 = objc_msgSend((id)v11, "isEqualToArray:", v14) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)unionValuesForFeature:(id)a3 changedBetweenOldRestrictions:(id)a4 andNewRestrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("union"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("values"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("union"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("values"));
  v14 = objc_claimAutoreleasedReturnValue();

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0))
      LOBYTE(v15) = 1;
    else
      v15 = objc_msgSend((id)v11, "isEqualToArray:", v14) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (id)systemClientRestrictions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__MCRestrictionManager_systemClientRestrictions__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__MCRestrictionManager_systemClientRestrictions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemClientRestrictions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)userClientRestrictions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__MCRestrictionManager_userClientRestrictions__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__MCRestrictionManager_userClientRestrictions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueUserClientRestrictions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)memberQueueSystemClientRestrictions
{
  NSMutableDictionary *memberQueueSystemClientRestrictions;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  uint8_t v14[16];

  memberQueueSystemClientRestrictions = self->_memberQueueSystemClientRestrictions;
  if (memberQueueSystemClientRestrictions)
    return memberQueueSystemClientRestrictions;
  v5 = (void *)MEMORY[0x1E0C99D50];
  MCSystemClientRestrictionsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MCDataFromFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v7, 2, 0, 0);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_memberQueueSystemClientRestrictions;
    self->_memberQueueSystemClientRestrictions = v8;

  }
  if (!self->_memberQueueSystemClientRestrictions || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEFAULT, "Could not find system client restrictions. Creating new dictionary.", v14, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = self->_memberQueueSystemClientRestrictions;
    self->_memberQueueSystemClientRestrictions = v11;

  }
  v13 = self->_memberQueueSystemClientRestrictions;

  return v13;
}

- (NSMutableDictionary)memberQueueUserClientRestrictions
{
  NSMutableDictionary *memberQueueUserClientRestrictions;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  uint8_t v14[16];

  memberQueueUserClientRestrictions = self->_memberQueueUserClientRestrictions;
  if (memberQueueUserClientRestrictions)
    return memberQueueUserClientRestrictions;
  v5 = (void *)MEMORY[0x1E0C99D50];
  MCUserClientRestrictionsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MCDataFromFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v7, 2, 0, 0);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_memberQueueUserClientRestrictions;
    self->_memberQueueUserClientRestrictions = v8;

  }
  if (!self->_memberQueueUserClientRestrictions || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEFAULT, "Could not find user client restrictions. Creating new dictionary.", v14, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = self->_memberQueueUserClientRestrictions;
    self->_memberQueueUserClientRestrictions = v11;

  }
  v13 = self->_memberQueueUserClientRestrictions;

  return v13;
}

- (id)memberQueueClientRestrictionsDictionaryForClientUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MCRestrictionManager memberQueueUserClientRestrictions](self, "memberQueueUserClientRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[MCRestrictionManager memberQueueSystemClientRestrictions](self, "memberQueueSystemClientRestrictions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)memberQueueClientRestrictionsForClientUUID:(id)a3
{
  void *v3;
  void *v4;

  -[MCRestrictionManager memberQueueClientRestrictionsDictionaryForClientUUID:](self, "memberQueueClientRestrictionsDictionaryForClientUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("clientRestrictions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)memberQueueClientTypeForClientUUID:(id)a3
{
  void *v3;
  void *v4;

  -[MCRestrictionManager memberQueueClientRestrictionsDictionaryForClientUUID:](self, "memberQueueClientRestrictionsDictionaryForClientUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("clientType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)clientRestrictionsForClientUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MCRestrictionManager_clientRestrictionsForClientUUID___block_invoke;
  block[3] = &unk_1E41E2CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__MCRestrictionManager_clientRestrictionsForClientUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueClientRestrictionsForClientUUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)memberQueueUserInfoForClientUUID:(id)a3
{
  void *v3;
  void *v4;

  -[MCRestrictionManager memberQueueClientRestrictionsDictionaryForClientUUID:](self, "memberQueueClientRestrictionsDictionaryForClientUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userInfoForClientUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MCRestrictionManager_userInfoForClientUUID___block_invoke;
  block[3] = &unk_1E41E2CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__MCRestrictionManager_userInfoForClientUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueUserInfoForClientUUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)memberQueueAppsAndOptionsForClientUUID:(id)a3
{
  void *v3;
  void *v4;

  -[MCRestrictionManager memberQueueClientRestrictionsDictionaryForClientUUID:](self, "memberQueueClientRestrictionsDictionaryForClientUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("appsAndOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appsAndOptionsForClientUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MCRestrictionManager_appsAndOptionsForClientUUID___block_invoke;
  block[3] = &unk_1E41E2CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__MCRestrictionManager_appsAndOptionsForClientUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueAppsAndOptionsForClientUUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allClientUUIDsForClientType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MCRestrictionManager_allClientUUIDsForClientType___block_invoke;
  block[3] = &unk_1E41E2DE8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__MCRestrictionManager_allClientUUIDsForClientType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemClientRestrictions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("clientType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v10)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }
  v20 = v2;
  objc_msgSend(*(id *)(a1 + 32), "memberQueueUserClientRestrictions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
        objc_msgSend(v11, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("clientType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v19)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

}

- (id)exchangeUUIDsRestrictingSettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *, void *, void *);
  void *v18;
  id v19;
  MCRestrictionManager *v20;
  id v21;
  id v22;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __57__MCRestrictionManager_exchangeUUIDsRestrictingSettings___block_invoke;
  v18 = &unk_1E41E4510;
  v19 = v4;
  v20 = self;
  v21 = v6;
  v7 = v5;
  v22 = v7;
  v8 = v6;
  v9 = v4;
  v10 = (void *)MEMORY[0x1A1AF040C](&v15);
  -[MCRestrictionManager systemClientRestrictions](self, "systemClientRestrictions", v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCRestrictionManager userClientRestrictions](self, "userClientRestrictions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v10);
  v13 = v7;

  return v13;
}

void __57__MCRestrictionManager_exchangeUUIDsRestrictingSettings___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "objectForKey:", CFSTR("clientRestrictions"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    v28 = v5;
    v27 = v6;
    v24 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        obj = a1[4];
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v31;
          v25 = i;
          v26 = v8;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v31 != v14)
                objc_enumerationMutation(obj);
              v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v11, "objectForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                if ((objc_msgSend(a1[5], "_isBoolSettingLockedDown:", v17) & 1) != 0)
                  goto LABEL_23;
                v18 = a1[5];
                objc_msgSend(a1[6], "objectForKey:", CFSTR("restrictedValue"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKey:", v16);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v18, "_isValueSettingLockedDown:effectiveSetting:", v17, v20) & 1) != 0)
                  goto LABEL_22;
                objc_msgSend(a1[5], "_effectiveIntersectedValuesForSetting:effectiveUserSettings:", v16, a1[6]);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                {

LABEL_22:
LABEL_23:
                  v23 = _MCLogObjects;
                  v5 = v28;
                  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    v39 = v28;
                    v40 = 2114;
                    v41 = v16;
                    _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_DEBUG, "Exchange UUID %{public}@ matched for %{public}@", buf, 0x16u);
                  }
                  objc_msgSend(a1[7], "addObject:", v28);

                  v6 = v27;
                  goto LABEL_26;
                }
                objc_msgSend(a1[5], "_effectiveUnionValuesForSetting:effectiveUserSettings:", v16, a1[6]);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                  goto LABEL_23;
              }

            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
            v6 = v27;
            v5 = v28;
            v9 = v24;
            i = v25;
            v8 = v26;
            if (v13)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v8);
  }
LABEL_26:

}

- (id)_updatedDomainSettingsEvents:(id)a3 fromPreviousSettings:(id)a4 toNewSettings:(id)a5 sender:(id)a6
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v11 = (void *)MEMORY[0x1E0C9AA70];
  if (a4)
    v12 = a4;
  else
    v12 = (id)MEMORY[0x1E0C9AA70];
  v13 = v12;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v13, "MCDictionaryAdditiveDeltaToCreateDictionary:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "MCDictionarySubtractiveDeltaToCreateDictionary:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v20 = v17;
  else
    v20 = v11;
  v21 = v20;
  -[MCRestrictionManager _settingsEventFromProcess:withTag:](self, "_settingsEventFromProcess:withTag:", v14, CFSTR("set"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "MCInsertedKeysFromDictionary:withNewLeafValue:", v18, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCRestrictionManager _settingsEventFromProcess:withTag:](self, "_settingsEventFromProcess:withTag:", v14, CFSTR("remove"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "MCInsertedKeysFromDictionary:withNewLeafValue:", v19, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_settingsEventFromProcess:(id)a3 withTag:(id)a4
{
  const __CFString *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("unknown");
  if (a3)
    v5 = (const __CFString *)a3;
  v13[0] = v5;
  v12[0] = CFSTR("process");
  v12[1] = CFSTR("timestamp");
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = CFSTR("event");
  v13[1] = v9;
  v13[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDictionary)userUserSettings
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__MCRestrictionManager_userUserSettings__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __40__MCRestrictionManager_userUserSettings__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueUserUserSettings");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)effectiveParametersForBoolSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parametersForBoolSetting:withUserSettingDictionary:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)valueSettingForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCRestrictionManager userSettings](self, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)intersectedValuesSettingForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCRestrictionManager userSettings](self, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager intersectedValuesSettingForFeature:withUserSettingDectionary:](MCRestrictionManager, "intersectedValuesSettingForFeature:withUserSettingDectionary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)unionValuesSettingForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCRestrictionManager userSettings](self, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager unionValuesSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "unionValuesSettingForFeature:withUserSettingDictionary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)effectiveValueForSetting:(id)a3
{
  void *v3;
  void *v4;

  -[MCRestrictionManager effectiveParametersForValueSetting:](self, "effectiveParametersForValueSetting:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_effectiveIntersectedValuesForSetting:(id)a3 effectiveUserSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("intersection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_effectiveUnionValuesForSetting:(id)a3 effectiveUserSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("union"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)profileIdentifiersRestrictingSettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  MCRestrictionManager *v20;
  id v21;
  id v22;
  id v23;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = (void *)objc_opt_new();
  -[MCRestrictionManager systemProfileRestrictions](self, "systemProfileRestrictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  -[MCRestrictionManager userProfileRestrictions](self, "userProfileRestrictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v8);

  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCManifest sharedManifest](MCManifest, "sharedManifest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifiersOfProfilesWithFilterFlags:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__MCRestrictionManager_profileIdentifiersRestrictingSettings___block_invoke;
  v18[3] = &unk_1E41E4560;
  v19 = v4;
  v20 = self;
  v21 = v9;
  v22 = v11;
  v23 = v5;
  v12 = v5;
  v13 = v11;
  v14 = v9;
  v15 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);
  v16 = (void *)objc_msgSend(v12, "copy");

  return v16;
}

void __62__MCRestrictionManager_profileIdentifiersRestrictingSettings___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    v34 = v7;
    v33 = v8;
    v30 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        obj = a1[4];
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v37;
          v31 = i;
          v32 = v10;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v37 != v16)
                objc_enumerationMutation(obj);
              v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(v13, "objectForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                if ((objc_msgSend(a1[5], "_isBoolSettingLockedDown:", v19) & 1) != 0)
                  goto LABEL_23;
                v20 = a1[5];
                objc_msgSend(a1[6], "objectForKey:", CFSTR("restrictedValue"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKey:", v18);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v20, "_isValueSettingLockedDown:effectiveSetting:", v19, v22) & 1) != 0)
                  goto LABEL_22;
                objc_msgSend(a1[5], "_effectiveIntersectedValuesForSetting:effectiveUserSettings:", v18, a1[6]);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {

LABEL_22:
LABEL_23:
                  v25 = _MCLogObjects;
                  v7 = v34;
                  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    v45 = v34;
                    v46 = 2114;
                    v47 = v18;
                    _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_DEBUG, "Profile %{public}@ matched for %{public}@", buf, 0x16u);
                  }
                  +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "dependentsOfParent:inDomain:", v34, CFSTR("ManagedProfileToManagingProfile"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(a1[7], "containsObject:", v34) & 1) == 0)
                  {
                    if (v27 && objc_msgSend(v27, "count"))
                    {
                      v28 = a1[8];
                      objc_msgSend(v27, "firstObject");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "addObject:", v29);

                    }
                    else
                    {
                      objc_msgSend(a1[8], "addObject:", v34);
                    }
                  }

                  v8 = v33;
                  goto LABEL_31;
                }
                objc_msgSend(a1[5], "_effectiveUnionValuesForSetting:effectiveUserSettings:", v18, a1[6]);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                  goto LABEL_23;
              }

            }
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
            v8 = v33;
            v7 = v34;
            v11 = v30;
            i = v31;
            v10 = v32;
            if (v15)
              continue;
            break;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v10);
  }
LABEL_31:

}

- (BOOL)isSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[MCRestrictionManager isBoolSettingLockedDownByRestrictions:](self, "isBoolSettingLockedDownByRestrictions:", v4)|| -[MCRestrictionManager isValueSettingLockedDownByRestrictions:](self, "isValueSettingLockedDownByRestrictions:", v4)|| -[MCRestrictionManager isIntersectionSettingLockedDownByRestrictions:](self, "isIntersectionSettingLockedDownByRestrictions:", v4)|| -[MCRestrictionManager isUnionSettingLockedDownByRestrictions:](self, "isUnionSettingLockedDownByRestrictions:", v4);

  return v5;
}

- (BOOL)_isValueSettingLockedDown:(id)a3 effectiveSetting:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = a3;
    objc_msgSend(v8, "objectForKey:", CFSTR("value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("preferSmallerValues"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v11 = v10 == 0;
    else
      v11 = 1;
    if (v11)
    {
      v7 = 0;
LABEL_18:

      goto LABEL_19;
    }
    if (objc_msgSend(v10, "BOOLValue"))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("rangeMinimum"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12 || objc_msgSend(v12, "compare:", v9) == -1)
      {
LABEL_15:
        v7 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("rangeMaximum"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v14;
      if (!v14 || objc_msgSend(v14, "compare:", v9) == 1)
        goto LABEL_15;
    }
    v7 = 1;
    goto LABEL_17;
  }
LABEL_19:

  return v7;
}

- (BOOL)isValueSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  MCRestrictionManager *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__14;
  v26 = __Block_byref_object_dispose__14;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  v21 = 0;
  -[MCRestrictionManager memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __63__MCRestrictionManager_isValueSettingLockedDownByRestrictions___block_invoke;
  v11 = &unk_1E41E4588;
  v14 = &v22;
  v12 = self;
  v6 = v4;
  v13 = v6;
  v15 = &v16;
  dispatch_sync(v5, &v8);

  LOBYTE(self) = -[MCRestrictionManager _isValueSettingLockedDown:effectiveSetting:](self, "_isValueSettingLockedDown:effectiveSetting:", v23[5], v17[5], v8, v9, v10, v11, v12);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return (char)self;
}

void __63__MCRestrictionManager_isValueSettingLockedDownByRestrictions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueRestrictions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("restrictedValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueEffectiveUserSettings");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("restrictedValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (BOOL)isIntersectionSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("intersection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("overrideUserSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "BOOLValue");

  if ((_DWORD)v6)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("values"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isUnionSettingLockedDownByRestrictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("union"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("overrideUserSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "BOOLValue");

  if ((_DWORD)v6)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("values"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int)appWhitelistState
{
  void *v3;
  void *v4;
  int v5;

  -[MCRestrictionManager effectiveUserSettings](self, "effectiveUserSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCRestrictionManager currentRestrictions](self, "currentRestrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[MCRestrictionManager appWhitelistStateWithSettingsDictionary:restrictionsDictionary:](MCRestrictionManager, "appWhitelistStateWithSettingsDictionary:restrictionsDictionary:", v3, v4);

  return v5;
}

+ (id)defaultSettings
{
  void *v2;
  void *v3;

  +[MCHacks sharedHacks](MCHacks, "sharedHacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deviceSpecificDefaultSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultParametersForBoolSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("restrictedBool"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultParametersForValueSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("restrictedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultParametersForIntersectedValuesSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("intersection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultParametersForUnionValuesSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("union"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int)defaultBoolValueForSetting:(id)a3
{
  return objc_msgSend(a1, "defaultBoolValueForSetting:outAsk:", a3, 0);
}

+ (int)defaultBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "defaultSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(a1, "BOOLSettingForFeature:outAsk:withUserSettingDictionary:", v6, a4, v7);

  return (int)a4;
}

+ (id)defaultValueForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("restrictedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)maximumValueForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("restrictedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("rangeMaximum"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)minimumValueForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("restrictedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("rangeMinimum"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultIntersectedValuesForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("intersection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultUnionValuesForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("union"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)unionValuesSettingForFeature:(id)a3 withUserSettingDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("union"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)BOOLSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("restrictedBool"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("value"));
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("restrictedBool"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("value"));
  v15 = objc_claimAutoreleasedReturnValue();

  if (v12 | v15)
  {
    if ((v12 != 0) != (v15 != 0))
    {
      LOBYTE(v16) = 1;
    }
    else
    {
      if (v12)
        v17 = v15 == 0;
      else
        v17 = 1;
      if (!v17 && objc_msgSend((id)v12, "BOOLValue") && objc_msgSend((id)v15, "BOOLValue"))
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ask"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v20, "BOOLValue");

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ask"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "BOOLValue");

        LOBYTE(v16) = v25 ^ v23;
      }
      else
      {
        LODWORD(v16) = objc_msgSend((id)v12, "isEqualToNumber:", v15) ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return (char)v16;
}

+ (BOOL)valueSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("restrictedValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("value"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("restrictedValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("value"));
  v14 = objc_claimAutoreleasedReturnValue();

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0))
      LOBYTE(v15) = 1;
    else
      v15 = objc_msgSend((id)v11, "isEqualToNumber:", v14) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)intersectedValuesSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("intersection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("values"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("intersection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("values"));
  v14 = objc_claimAutoreleasedReturnValue();

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0))
      LOBYTE(v15) = 1;
    else
      v15 = objc_msgSend((id)v11, "isEqualToArray:", v14) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (BOOL)unionValuesSetting:(id)a3 valueChangedBetweenOldSettings:(id)a4 andNewSettings:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("union"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("values"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("union"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("values"));
  v14 = objc_claimAutoreleasedReturnValue();

  if (v11 | v14)
  {
    if ((v11 != 0) != (v14 != 0))
      LOBYTE(v15) = 1;
    else
      v15 = objc_msgSend((id)v11, "isEqualToArray:", v14) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (NSArray)memberQueueEffectiveWhitelistedAppsAndOptions
{
  NSArray *memberQueueEffectiveWhitelistedAppsAndOptions;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  id v8;
  NSArray *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memberQueueEffectiveWhitelistedAppsAndOptions = self->_memberQueueEffectiveWhitelistedAppsAndOptions;
  if (!memberQueueEffectiveWhitelistedAppsAndOptions)
  {
    v4 = (void *)MEMORY[0x1E0C99D50];
    MCSystemEffectiveAppWhitelistFilePath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v6, 0, 0, &v12);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      v9 = self->_memberQueueEffectiveWhitelistedAppsAndOptions;
      self->_memberQueueEffectiveWhitelistedAppsAndOptions = v7;

      if (!self->_memberQueueEffectiveWhitelistedAppsAndOptions)
      {
        v10 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v14 = v8;
          _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_ERROR, "Could not read effective whitelisted apps and options. Error: %{public}@", buf, 0xCu);
        }
      }

    }
    memberQueueEffectiveWhitelistedAppsAndOptions = self->_memberQueueEffectiveWhitelistedAppsAndOptions;
  }
  return memberQueueEffectiveWhitelistedAppsAndOptions;
}

- (void)setMemberQueueEffectiveWhitelistedAppsAndOptions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueEffectiveWhitelistedAppsAndOptions, a3);
}

+ (BOOL)isInSingleAppModeWithSettingsDictionary:(id)a3
{
  return +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowMultipleAppsInAppLock"), a3) == 2;
}

+ (BOOL)isSingleAppModeLogoutAllowedWithSettingsDictionary:(id)a3
{
  return +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowAppLockLogout"), a3) == 1;
}

+ (BOOL)isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:(id)a3
{
  return +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowAccessWithoutPasscodeInAppLock"), a3) == 2;
}

+ (BOOL)mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:(id)a3
{
  return +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("forceGrantSupervisorAccessInAppLock"), a3) == 1;
}

+ (BOOL)isWhitelistedAppsRestrictionEnforcedWithRestrictionsDictionary:(id)a3
{
  void *v3;
  BOOL v4;

  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("appLockBundleIDs"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 localAppBundleID:(id)a5 localAccountIsManaged:(BOOL)a6 mayOpenFromUnmanagedToManaged:(BOOL)a7 mayOpenFromManagedToUnmanaged:(BOOL)a8 isAppBundleIDExemptBlock:(id)a9 isAppBundleIDAccountBasedBlock:(id)a10
{
  _BOOL4 v11;
  id v14;
  id v15;
  uint64_t (**v16)(id, id);
  uint64_t (**v17)(id, id);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  int v25;
  int v26;
  void *v27;
  _BOOL4 v29;

  v11 = a7;
  v29 = a6;
  v14 = a4;
  v15 = a5;
  v16 = (uint64_t (**)(id, id))a9;
  v17 = (uint64_t (**)(id, id))a10;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "restrictedAppBundleIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
    objc_msgSend(v18, "minusSet:", v20);
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "effectiveWhitelistedAppBundleIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
    objc_msgSend(v18, "intersectSet:", v22);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!v11 || !a8) && (v16[2](v16, v15) & 1) == 0)
  {
    v24 = v17[2](v17, v15);
    v25 = v29;
    if ((v24 & 1) == 0)
      v25 = objc_msgSend(v23, "containsObject:", v15);
    if (v25 && !a8)
    {
      v26 = v25;
      objc_msgSend(v18, "intersectSet:", v23);
      v25 = v26;
    }
    if (((v25 | v11) & 1) == 0)
      objc_msgSend(v18, "minusSet:", v23);
  }
  objc_msgSend(v18, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 localAppBundleID:(id)a5 localAccountIsManaged:(BOOL)a6 mayOpenFromUnmanagedToManaged:(BOOL)a7 mayOpenFromManagedToUnmanaged:(BOOL)a8 isAppBundleIDExemptBlock:(id)a9 isAppBundleIDAccountBasedBlock:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  uint64_t (**v16)(id, id);
  uint64_t (**v17)(id, id);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  int v25;
  int v26;
  void *v27;
  _BOOL4 v29;

  v10 = a8;
  v11 = a7;
  v29 = a6;
  v14 = a4;
  v15 = a5;
  v16 = (uint64_t (**)(id, id))a9;
  v17 = (uint64_t (**)(id, id))a10;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "restrictedAppBundleIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
    objc_msgSend(v18, "minusSet:", v20);
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "effectiveWhitelistedAppBundleIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
    objc_msgSend(v18, "intersectSet:", v22);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!v11 || !v10) && (v16[2](v16, v15) & 1) == 0)
  {
    v24 = v17[2](v17, v15);
    v25 = v29;
    if ((v24 & 1) == 0)
      v25 = objc_msgSend(v23, "containsObject:", v15);
    if (v25 && !v11)
    {
      v26 = v25;
      objc_msgSend(v18, "intersectSet:", v23);
      v25 = v26;
    }
    if (((v25 | v10) & 1) == 0)
      objc_msgSend(v18, "minusSet:", v23);
  }
  objc_msgSend(v18, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 managedAppBundleIDs:(id)a4 hostAppIsManaged:(BOOL)a5 mayOpenFromUnmanagedToManaged:(BOOL)a6 mayOpenFromManagedToUnmanaged:(BOOL)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a6;
  v9 = a5;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "restrictedAppBundleIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
    objc_msgSend(v12, "minusSet:", v14);
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "effectiveWhitelistedAppBundleIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
    objc_msgSend(v12, "intersectSet:", v16);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || !a7)
  {
    if (v9 && !a7)
      objc_msgSend(v12, "intersectSet:", v17);
    if (!v9 && !v8)
      objc_msgSend(v12, "minusSet:", v17);
  }
  objc_msgSend(v12, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)isWebContentFilterUIActiveWithRestrictionDictionary:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forceWebContentFilterAuto"), v3) == 1)
  {
    v4 = 1;
  }
  else
  {
    +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("webContentFilterAutoPermittedURLs"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("webContentFilterWhitelistedURLs"), v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", CFSTR("webContentFilterBlacklistedURLs"), v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v7 != 0;

      }
    }

  }
  return !v4;
}

+ (BOOL)mayChangePasscode
{
  void *v2;
  BOOL v3;

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", CFSTR("allowPasscodeModification")) != 2;

  return v3;
}

- (void)setMemberQueueSettingsEvents:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueSettingsEvents, a3);
}

- (NSString)memberQueueOverridingRestrictionClientUUID
{
  return self->_memberQueueOverridingRestrictionClientUUID;
}

- (void)setMemberQueueOverridingRestrictionClientUUID:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueOverridingRestrictionClientUUID, a3);
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

@end
