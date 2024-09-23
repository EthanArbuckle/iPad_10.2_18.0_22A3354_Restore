@implementation MCHacks

+ (id)sharedHacks
{
  if (sharedHacks_onceToken != -1)
    dispatch_once(&sharedHacks_onceToken, &__block_literal_global_37);
  return (id)sharedHacks_hacks;
}

- (void)_applyMandatorySettingsToEffectiveUserSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;

  v32 = a3;
  -[MCHacks _applyInternalDiagnosticEnforcementToSettings:](self, "_applyInternalDiagnosticEnforcementToSettings:");
  if (objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad"))
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("union"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "MCMutableDeepCopy");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blockedAppBundleIDs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("values"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MCAlwaysRestrictedAppsInEDUMode();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unionSet:", v12);

    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blockedAppBundleIDs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("values"));

    v16 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blacklistedAppBundleIDs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("values"));

    objc_msgSend(v32, "setObject:forKeyedSubscript:", v5, CFSTR("union"));
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "MCMutableDeepCopy");
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;

    objc_msgSend(v32, "setObject:forKeyedSubscript:", v22, CFSTR("restrictedBool"));
    MCFeatureSetBoolSetting(v22, CFSTR("allowProximitySetupToNewDevice"), 0);
    MCFeatureSetBoolSetting(v22, CFSTR("allowEnablingRestrictions"), 0);
    MCFeatureSetBoolSetting(v22, CFSTR("allowGameCenter"), 0);
    MCFeatureSetBoolSetting(v22, CFSTR("allowAppsToBeHidden"), 0);
    MCFeatureSetBoolSetting(v22, CFSTR("allowAppsToBeLocked"), 0);

  }
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "details");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D44798]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25 && (objc_msgSend(v25, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "MCMutableDeepCopy");
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    v31 = v30;

    objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("restrictedBool"));
    MCFeatureSetBoolSetting(v31, CFSTR("allowHostPairing"), 0);

  }
}

- (void)_applyInternalDiagnosticEnforcementToSettings:(id)a3
{
  id v3;
  int AppBooleanValue;
  void *v5;
  void *v6;
  Boolean keyExistsAndHasValidFormat;

  v3 = a3;
  if (os_variant_has_internal_ui())
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MCInternalOverrideDiagnosticEnforcement"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat || !AppBooleanValue)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "MCMutableDeepCopy");

      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("restrictedBool"));
      MCFeatureSetBoolSetting(v6, CFSTR("allowDiagnosticSubmission"), 1);

    }
  }

}

- (void)_applyImpliedSettingsToSettingsDictionary:(id)a3 currentSettings:(id)a4 restrictions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  int v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v27, "objectForKey:", CFSTR("restrictedBool"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v9, CFSTR("restrictedBool"));
  }
  v10 = +[MCRestrictionManager BOOLSettingForFeature:withNewUserSetting:currentSettings:](MCRestrictionManager, "BOOLSettingForFeature:withNewUserSetting:currentSettings:", CFSTR("allowCamera"), v27, v7);
  if (v10 == 2)
  {
    v11 = CFSTR("allowVideoConferencing");
    v12 = v9;
    v13 = 0;
  }
  else
  {
    v14 = v10;
    v15 = (void *)MGCopyAnswer();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      if (+[MCRestrictionManager BOOLSettingForFeature:withNewUserSetting:currentSettings:](MCRestrictionManager, "BOOLSettingForFeature:withNewUserSetting:currentSettings:", CFSTR("allowVideoConferencing"), v27, v7) != 1)goto LABEL_12;
      v12 = v9;
      v11 = CFSTR("allowCamera");
    }
    else
    {
      if (v14 != 1)
        goto LABEL_12;
      v11 = CFSTR("allowVideoConferencing");
      v12 = v9;
    }
    v13 = 1;
  }
  MCFeatureSetBoolSetting(v12, v11, v13);
LABEL_12:
  if (+[MCRestrictionManager BOOLSettingForFeature:withNewUserSetting:currentSettings:](MCRestrictionManager, "BOOLSettingForFeature:withNewUserSetting:currentSettings:", CFSTR("allowiTunes"), v27, v7) == 2)
  {
    v17 = CFSTR("allowiTunesSocialPages");
    v18 = v9;
    v19 = 0;
  }
  else
  {
    if (+[MCRestrictionManager BOOLSettingForFeature:withNewUserSetting:currentSettings:](MCRestrictionManager, "BOOLSettingForFeature:withNewUserSetting:currentSettings:", CFSTR("allowiTunesSocialPages"), v27, v7) != 1)goto LABEL_17;
    v18 = v9;
    v17 = CFSTR("allowiTunes");
    v19 = 1;
  }
  MCFeatureSetBoolSetting(v18, v17, v19);
LABEL_17:
  if (+[MCRestrictionManager BOOLSettingForFeature:withNewUserSetting:currentSettings:](MCRestrictionManager, "BOOLSettingForFeature:withNewUserSetting:currentSettings:", CFSTR("allowGameCenter"), v27, v7) == 2)
  {
    v20 = CFSTR("allowMultiplayerGaming");
    v21 = v9;
    v22 = 0;
  }
  else
  {
    if (+[MCRestrictionManager BOOLSettingForFeature:withNewUserSetting:currentSettings:](MCRestrictionManager, "BOOLSettingForFeature:withNewUserSetting:currentSettings:", CFSTR("allowMultiplayerGaming"), v27, v7) != 1)goto LABEL_22;
    v21 = v9;
    v20 = CFSTR("allowGameCenter");
    v22 = 1;
  }
  MCFeatureSetBoolSetting(v21, v20, v22);
LABEL_22:
  if (+[MCRestrictionManager BOOLSettingForFeature:withNewUserSetting:currentSettings:](MCRestrictionManager, "BOOLSettingForFeature:withNewUserSetting:currentSettings:", CFSTR("allowDiagnosticSubmission"), v27, v7) == 2)
  {
    MCFeatureSetBoolSetting(v9, CFSTR("allowAppAnalytics"), 0);
    MCFeatureSetBoolSetting(v9, CFSTR("allowHealthDataSubmission"), 0);
    MCFeatureSetBoolSetting(v9, CFSTR("allowHealthDataSubmission2"), 0);
    MCFeatureSetBoolSetting(v9, CFSTR("allowWheelchairDataSubmission"), 0);
    MCFeatureSetBoolSetting(v9, CFSTR("allowHandWashingDataSubmission"), 0);
    MCFeatureSetBoolSetting(v9, CFSTR("allowSafetyDataSubmission"), 0);
  }
  v23 = +[MCRestrictionManager BOOLSettingForFeature:withNewUserSetting:currentSettings:](MCRestrictionManager, "BOOLSettingForFeature:withNewUserSetting:currentSettings:", CFSTR("allowNews"), v27, v7);
  if (v23 == 2)
  {
    v24 = 0;
    goto LABEL_28;
  }
  if (v23 == 1)
  {
    v24 = 1;
LABEL_28:
    MCFeatureSetBoolSetting(v9, CFSTR("allowNewsToday"), v24);
  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("ratingApps"), v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25 || (int)objc_msgSend(v25, "intValue") >= 1000)
    MCFeatureSetBoolSetting(v9, CFSTR("forceITunesStorePasswordEntry"), 0);

}

- (void)_applyHeuristicsToEffectiveUserSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  +[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", CFSTR("maxGracePeriod"), v29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MCHacks quantizedGracePeriodInSeconds:](self, "quantizedGracePeriodInSeconds:", v4);
    self = (MCHacks *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxGracePeriod"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", self, CFSTR("value"));
    }

  }
  v7 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowNews"), v29);
  if (v7 != 2)
  {
    +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", CFSTR("blockedAppBundleIDs"), v29);
    self = (MCHacks *)objc_claimAutoreleasedReturnValue();
    if (!-[MCHacks containsObject:](self, "containsObject:", CFSTR("com.apple.news")))
      goto LABEL_14;
  }
  v8 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowSpotlightNews"), v29);
  if (v7 != 2)

  if (v8 == 2)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = (MCHacks *)objc_msgSend(v9, "MCMutableDeepCopy");

    if (!self)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      self = (MCHacks *)objc_claimAutoreleasedReturnValue();
    }
    MCFeatureSetBoolSetting(self, CFSTR("allowNewsToday"), 0);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", self, CFSTR("restrictedBool"));
LABEL_14:

  }
  if (objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad"))
  {
    MCLKLogoutSupportClass();
    v10 = (void *)objc_opt_new();
    v11 = objc_msgSend(v10, "isCurrentUserAnonymous");

    if (v11)
    {
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "MCMutableDeepCopy");

      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      MCFeatureSetBoolSetting(v13, CFSTR("allowAccountModification"), 0);
      v14 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v14, CFSTR("restrictedBool"));

    }
  }
  if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("forceWiFiWhitelisting"), v29) == 1|| +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("forceWiFiToAllowedNetworksOnly"), v29) == 1)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "MCMutableDeepCopy");

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    MCFeatureSetBoolSetting(v16, CFSTR("forceWiFiWhitelisting"), 1);
    MCFeatureSetBoolSetting(v16, CFSTR("forceWiFiToAllowedNetworksOnly"), 1);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v16, CFSTR("restrictedBool"));

  }
  if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowLockdownMode"), v29) == 1)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "MCMutableDeepCopy");

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    MCFeatureSetBoolSetting(v18, CFSTR("allowUSBRestrictedMode"), 1);
    MCFeatureSetBoolSetting(v18, CFSTR("allowUIConfigurationProfileInstallation"), 0);
    if (_os_feature_enabled_impl())
      MCFeatureSetBoolSetting(v18, CFSTR("allowPasscodeRecovery"), 0);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v18, CFSTR("restrictedBool"));

  }
  v19 = _os_feature_enabled_impl();
  v20 = v29;
  if (v19)
  {
    v21 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowPasscodeModification"), v29);
    v20 = v29;
    if (v21 == 2)
    {
      v22 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowPasscodeRecovery"), v29);
      v20 = v29;
      if (v22 != 2)
      {
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "MCMutableDeepCopy");

        if (!v24)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        MCFeatureSetBoolSetting(v24, CFSTR("allowPasscodeRecovery"), 0);
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, CFSTR("restrictedBool"));

        v20 = v29;
      }
    }
  }
  if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowControlCenter"), v20) == 2)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "MCMutableDeepCopy");

    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    MCFeatureSetBoolSetting(v26, CFSTR("allowControlCenterInApps"), 0);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v26, CFSTR("restrictedBool"));

  }
  if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("allowSpotlight"), v29) == 2)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "MCMutableDeepCopy");

    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    MCFeatureSetBoolSetting(v28, CFSTR("allowSpotlightNews"), 0);
    MCFeatureSetBoolSetting(v28, CFSTR("allowSpotlightInternetResults"), 0);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("restrictedBool"));

  }
}

- (id)quantizedGracePeriodInSeconds:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCHacks _permittedGracePeriodNumbers](self, "_permittedGracePeriodNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCHacks _selectLargestNumberFromSortedArray:equalToOrLessThanNumber:](self, "_selectLargestNumberFromSortedArray:equalToOrLessThanNumber:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_selectLargestNumberFromSortedArray:(id)a3 equalToOrLessThanNumber:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "compare:", v6, (_QWORD)v16) != 1)
          {
            v14 = v13;

            v7 = v14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  return v7;
}

- (id)_permittedGracePeriodNumbers
{
  if (_permittedGracePeriodNumbers_once != -1)
    dispatch_once(&_permittedGracePeriodNumbers_once, &__block_literal_global_2_2);
  return (id)_permittedGracePeriodNumbers_numbers;
}

void __22__MCHacks_sharedHacks__block_invoke()
{
  objc_class *v0;
  id v1;
  void *v2;

  v0 = NSClassFromString(CFSTR("MCServerSideHacks"));
  if (!v0)
    v0 = (objc_class *)MCHacks;
  v1 = objc_alloc_init(v0);
  v2 = (void *)sharedHacks_hacks;
  sharedHacks_hacks = (uint64_t)v1;

}

void __39__MCHacks__permittedGracePeriodNumbers__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 60);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 300);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 900);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3600);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 14400);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_permittedGracePeriodNumbers_numbers;
  _permittedGracePeriodNumbers_numbers = v6;

}

- (id)permittedAutoLockNumbers
{
  if (permittedAutoLockNumbers_once != -1)
    dispatch_once(&permittedAutoLockNumbers_once, &__block_literal_global_5_1);
  return (id)permittedAutoLockNumbers_numbers;
}

void __35__MCHacks_permittedAutoLockNumbers__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  if (MCGestaltIsiPad())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 120);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 300);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 600);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 900);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x7FFFFFFFLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)permittedAutoLockNumbers_numbers;
    permittedAutoLockNumbers_numbers = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 60);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 120);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 180);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 240);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[4] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 300);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[5] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0x7FFFFFFFLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[6] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)permittedAutoLockNumbers_numbers;
    permittedAutoLockNumbers_numbers = v8;

  }
}

- (id)quantizedAutoLockInSeconds:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCHacks permittedAutoLockNumbers](self, "permittedAutoLockNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCHacks _selectLargestNumberFromSortedArray:equalToOrLessThanNumber:](self, "_selectLargestNumberFromSortedArray:equalToOrLessThanNumber:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_applyHeuristicsToRestrictions:(id)a3 forProfile:(id)a4 ignoresUnrestrictableApps:(BOOL)a5
{
  id v8;
  void *v9;
  MCHacks *v10;
  id v11;
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
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  id v42;

  v42 = a3;
  v8 = a4;
  +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", CFSTR("blacklistedAppBundleIDs"), v42);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", CFSTR("blockedAppBundleIDs"), v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") || objc_msgSend(v41, "count"))
  {
    v10 = self;
    v11 = v8;
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v41);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v13);
    if (!a5)
    {
      MCUnrestrictableApps();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "minusSet:", v15);

    }
    objc_msgSend(v14, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v42, "MCSetUnionRestriction:values:", CFSTR("blockedAppBundleIDs"), v17);

    v18 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v42, "MCSetUnionRestriction:values:", CFSTR("blacklistedAppBundleIDs"), v18);

    v8 = v11;
    v9 = v12;
    self = v10;
  }
  +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("appLockBundleIDs"), v42);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") && !a5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    MCUnrestrictableApps();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unionSet:", v21);

    objc_msgSend(v20, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "MCSetIntersectionRestriction:values:", CFSTR("appLockBundleIDs"), v22);

  }
  v23 = objc_msgSend(v8, "isEncrypted");
  v24 = v42;
  if (v23)
  {
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("forceEncryptedBackup"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("value"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v42;
    if (!v27)
    {
      objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("forceEncryptedBackup"), 1);
      v24 = v42;
    }
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowCamera"), v24) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowVideoConferencing"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forceEncryptedBackup"), v42) == 1)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("cloudBackupPasswordRequired"), 1);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowGameCenter"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowMultiplayerGaming"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowMultiplayerGaming"), v42) == 2)objc_msgSend(v42, "MCSetValueRestriction:value:", CFSTR("allowedGameCenterOtherPlayerTypes"), &unk_1E4212AA8);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowiTunes"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowiTunesSocialPages"), 0);
  v28 = +[MCPasscodeManager unlockScreenTypeForRestrictions:](MCPasscodeManager, "unlockScreenTypeForRestrictions:", v42);
  v29 = v42;
  if ((_DWORD)v28)
  {
    v30 = v28;
    +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("passcodeKeyboardComplexity"), v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "unsignedIntValue") < v30)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "MCSetValueRestriction:value:", CFSTR("passcodeKeyboardComplexity"), v32);

    }
    v29 = v42;
  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxGracePeriod"), v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[MCHacks quantizedGracePeriodInSeconds:](self, "quantizedGracePeriodInSeconds:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "MCSetValueRestriction:value:", CFSTR("maxGracePeriod"), v34);

  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxInactivity"), v42);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[MCHacks quantizedAutoLockInSeconds:](self, "quantizedAutoLockInSeconds:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "MCSetValueRestriction:value:", CFSTR("maxInactivity"), v36);

  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("ratingApps"), v42);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37 && (int)objc_msgSend(v37, "intValue") <= 999)
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("forceITunesStorePasswordEntry"), 1);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowCloudDocumentSync"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowManagedAppsCloudSync"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowDiagnosticSubmission"), v42) == 2)
  {
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowAppAnalytics"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowHealthDataSubmission"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowHealthDataSubmission2"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowWheelchairDataSubmission"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowHandWashingDataSubmission"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowSafetyDataSubmission"), 0);
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowPasscodeModification"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowFingerprintModification"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowAppInstallation"), v42) == 2)
  {
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowUIAppInstallation"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowMarketplaceAppInstallation"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowWebDistributionAppInstallation"), 0);
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowScreenShot"), v42) == 2)
  {
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowScreenRecording"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowRemoteScreenObservation"), 0);
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowRemoteScreenObservation"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowClassroomScreenObservation"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowNews"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowNewsToday"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowAutoCorrection"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowSmartPunctuation"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowAppRemoval"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowSystemAppRemoval"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forceClassroomUnpromptedScreenObservation"), v42) == 1|| +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forceUnpromptedManagedClassroomScreenObservation"), v42) == 1)
  {
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("forceClassroomUnpromptedScreenObservation"), 1);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("forceUnpromptedManagedClassroomScreenObservation"), 1);
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowPasswordSharing"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowWiFiPasswordSharing"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forceWiFiWhitelisting"), v42) == 1|| +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forceWiFiToAllowedNetworksOnly"), v42) == 1)
  {
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("forceWiFiWhitelisting"), 1);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("forceWiFiToAllowedNetworksOnly"), 1);
  }
  if (_os_feature_enabled_impl())
  {
    if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowPasscodeModification"), v42) == 2|| (+[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("pinHistory"), v42), v39 = (void *)objc_claimAutoreleasedReturnValue(), v40 = objc_msgSend(v39, "unsignedIntValue"), v39, v40))
    {
      objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowPasscodeRecovery"), 0);
    }
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowControlCenter"), v42) == 2)objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowControlCenterInApps"), 0);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowSpotlight"), v42) == 2)
  {
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowSpotlightNews"), 0);
    objc_msgSend(v42, "MCSetBoolRestriction:value:", CFSTR("allowSpotlightInternetResults"), 0);
  }

}

- (void)_applyHeuristicsToGranfatheredRestrictionPayloadKeys:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MCHacks isJapanSKU](self, "isJapanSKU"))
  {
    v5 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("allowSafari");
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEFAULT, "Japan SKU device: Add %@ to grandfathered restrictions", buf, 0xCu);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", CFSTR("allowSafari"));
      objc_msgSend(v8, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = CFSTR("allowSafari");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("restrictedBool"));

  }
}

- (void)_setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:(id)a3
{
  BOOL v3;
  NSObject *v4;
  _QWORD block[4];
  BOOL v6;

  v3 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("forceEncryptedBackup"), a3) == 1;
  MCLockdownOperationQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MCHacks__setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __74__MCHacks__setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings___block_invoke(uint64_t a1)
{
  uint64_t result;
  CFNumberRef v3;
  CFNumberRef v4;
  int v5;
  int v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = lockdown_connect();
  if (result)
  {
    v3 = CFNumberCreate(0, kCFNumberCharType, (const void *)(a1 + 32));
    if (v3)
    {
      v4 = v3;
      v5 = lockdown_set_value();
      if (v5)
      {
        v6 = v5;
        v7 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v8[0] = 67109120;
          v8[1] = v6;
          _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Could not set encrypted backup required key in lockdown: %d", (uint8_t *)v8, 8u);
        }
      }
      CFRelease(v4);
    }
    return lockdown_disconnect();
  }
  return result;
}

- (id)_deviceSpecificDefaultSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MCHacks__deviceSpecificDefaultSettings__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  if (_deviceSpecificDefaultSettings_once != -1)
    dispatch_once(&_deviceSpecificDefaultSettings_once, block);
  return (id)_deviceSpecificDefaultSettings_dict;
}

void __41__MCHacks__deviceSpecificDefaultSettings__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x1E0C99D50];
  MCGetBaseResourcePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("defaultSettings.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v5, 2, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (MCGestaltIsiPad())
  {
    v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_DEFAULT, "Applying iPad defaults", buf, 2u);
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("restrictedValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("maxInactivity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 120);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("value"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 120);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("rangeMinimum"));

    }
LABEL_11:

    goto LABEL_12;
  }
  if (MCGestaltHasPearlIDCapability())
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("restrictedValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("maxInactivity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v13 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_DEFAULT, "Applying FaceID defaults", v31, 2u);
      }
      objc_msgSend(v9, "setObject:forKey:", &unk_1E4212AC0, CFSTR("value"));
    }
    goto LABEL_11;
  }
  v28 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_DEFAULT, "Applying iPhone defaults", v30, 2u);
  }
LABEL_12:
  if (MCGestaltHasBiometricCapability())
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("restrictedValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("minLength"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("value"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntValue");

      if (v17 <= 5)
      {
        v18 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_DEFAULT, "Applying TouchID defaults", v29, 2u);
        }
        objc_msgSend(v15, "setObject:forKey:", &unk_1E4212AD8, CFSTR("value"));
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_applyInternalDiagnosticEnforcementToSettings:", v6);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MDMFilePath();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v20, 0);

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isSupervised");

    if (v23)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("restrictedBool"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", CFSTR("allowUSBRestrictedMode"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("value"));

    }
  }
  v27 = (void *)_deviceSpecificDefaultSettings_dict;
  _deviceSpecificDefaultSettings_dict = (uint64_t)v6;

}

- (void)_sendChangeNotificationsBasedOnDefaultsAdditionByDomain:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("com.apple.powerlogd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FullMode"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6 == v4)
    {

      v5 = 0;
    }
    v7 = v5;
    MCPowerlogControlSwitchMode(v5);

  }
}

- (void)_sendChangeNotificationsBasedOnDefaultsRemovalByDomain:(id)a3
{
  void *v3;
  int v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("com.apple.powerlogd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("FullMode"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    MCPowerlogControlSwitchMode(v5);

  }
}

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToInstallUnsupportedPayload:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_INFO, "Evaluating whether the certificate signer is entitled to install unsupported payloads.", (uint8_t *)v9, 2u);
  }
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v5, "sanitizedProfileSignerCertificateChainIsAllowedToInstallUnsupportedPayload:", v3);
  v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_INFO, "Unsupported evaluation result: %d", (uint8_t *)v9, 8u);
  }

  return v6;
}

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_INFO, "Evaluating whether the certificate signer is entitled to write defaults.", (uint8_t *)v9, 2u);
  }
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v5, "sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:", v3);
  v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_INFO, "Evaluation result: %d", (uint8_t *)v9, 8u);
  }

  return v6;
}

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_INFO, "Evaluating whether the certificate signer is entitled to install supervised only restrictions on an unsupervised device.", (uint8_t *)v9, 2u);
  }
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v5, "sanitizedProfileSignerCertificateChainIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:", v3);
  v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_INFO, "Evaluation result: %d", (uint8_t *)v9, 8u);
  }

  return v6;
}

- (BOOL)isGreenTea
{
  if (isGreenTea_once != -1)
    dispatch_once(&isGreenTea_once, &__block_literal_global_38);
  return isGreenTea_isGreenTea;
}

uint64_t __21__MCHacks_isGreenTea__block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  mach_port_name_t MatchingService;
  unsigned int v3;
  uint64_t result;
  char v5;

  v0 = *MEMORY[0x1E0CBBAB8];
  v1 = IOServiceMatching("AppleBaseband");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  v3 = MatchingService - 1;
  if (MatchingService - 1 <= 0xFFFFFFFD)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], MatchingService);
  result = objc_msgSend((id)CPGetDeviceRegionCode(), "isEqualToString:", CFSTR("CH"));
  if (v3 < 0xFFFFFFFE)
    v5 = result;
  else
    v5 = 0;
  isGreenTea_isGreenTea = v5;
  return result;
}

- (BOOL)isJapanSKU
{
  if (isJapanSKU_once != -1)
    dispatch_once(&isJapanSKU_once, &__block_literal_global_42_1);
  return isJapanSKU_isJapanSKU;
}

void __21__MCHacks_isJapanSKU__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CPGetDeviceRegionCode();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v1 = objc_msgSend(&unk_1E4212D30, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v6;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v6 != v3)
          objc_enumerationMutation(&unk_1E4212D30);
        if (objc_msgSend(v0, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v5 + 1) + 8 * i)))
        {
          isJapanSKU_isJapanSKU = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(&unk_1E4212D30, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)isSetupBuddyDone
{
  return MCBYSetupAssistantNeedsToRun() ^ 1;
}

@end
