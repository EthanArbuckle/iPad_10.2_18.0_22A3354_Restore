@implementation MCAppWhitelistPayloadBase

+ (id)knownOptionsKeys
{
  if (knownOptionsKeys_onceToken != -1)
    dispatch_once(&knownOptionsKeys_onceToken, &__block_literal_global_43);
  return (id)knownOptionsKeys_keys;
}

void __45__MCAppWhitelistPayloadBase_knownOptionsKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[14];

  v4[13] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("DisableTouch");
  v4[1] = CFSTR("DisableDeviceRotation");
  v4[2] = CFSTR("DisableVolumeButtons");
  v4[3] = CFSTR("DisableRingerSwitch");
  v4[4] = CFSTR("DisableSleepWakeButton");
  v4[5] = CFSTR("DisableAutoLock");
  v4[6] = CFSTR("EnableVoiceOver");
  v4[7] = CFSTR("EnableZoom");
  v4[8] = CFSTR("EnableInvertColors");
  v4[9] = CFSTR("EnableAssistiveTouch");
  v4[10] = CFSTR("EnableSpeakSelection");
  v4[11] = CFSTR("EnableMonoAudio");
  v4[12] = CFSTR("EnableVoiceControl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 13);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)knownOptionsKeys_keys;
  knownOptionsKeys_keys = v2;

}

+ (id)knownUserEnabledOptionKeys
{
  if (knownUserEnabledOptionKeys_onceToken != -1)
    dispatch_once(&knownUserEnabledOptionKeys_onceToken, &__block_literal_global_7_1);
  return (id)knownUserEnabledOptionKeys_keys;
}

void __55__MCAppWhitelistPayloadBase_knownUserEnabledOptionKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("Zoom");
  v4[1] = CFSTR("InvertColors");
  v4[2] = CFSTR("AssistiveTouch");
  v4[3] = CFSTR("VoiceOver");
  v4[4] = CFSTR("VoiceControl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)knownUserEnabledOptionKeys_keys;
  knownUserEnabledOptionKeys_keys = v2;

}

- (MCAppWhitelistPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCAppWhitelistPayloadBase *v10;
  uint64_t v11;
  NSArray *whitelistedAppsAndOptions;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MCAppWhitelistPayloadBase;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v16, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10 && objc_msgSend(v9, "isStub"))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Apps"));
    v11 = objc_claimAutoreleasedReturnValue();
    whitelistedAppsAndOptions = v10->_whitelistedAppsAndOptions;
    v10->_whitelistedAppsAndOptions = (NSArray *)v11;

    objc_msgSend(v8, "objectForKey:", CFSTR("AllowAccessWithoutPasscode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_allowAccessWithoutPasscode = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v8, "objectForKey:", CFSTR("ForceAllowSupervisorAccess"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_forceAllowSupervisorAccess = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v8, "removeObjectForKey:", CFSTR("Apps"));
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("AllowAccessWithoutPasscode"));
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("ForceAllowSupervisorAccess"));
  }

  return v10;
}

- (id)restrictions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  _BYTE v28[128];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MCAppWhitelistPayloadBase allowAccessWithoutPasscode](self, "allowAccessWithoutPasscode"))
  {
    v31[0] = CFSTR("value");
    v31[1] = CFSTR("preference");
    v32[0] = MEMORY[0x1E0C9AAA0];
    v32[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("allowAccessWithoutPasscodeInAppLock"));

  }
  if (-[MCAppWhitelistPayloadBase forceAllowSupervisorAccess](self, "forceAllowSupervisorAccess"))
  {
    v29[0] = CFSTR("value");
    v29[1] = CFSTR("preference");
    v30[0] = MEMORY[0x1E0C9AAB0];
    v30[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("forceGrantSupervisorAccessInAppLock"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("restrictedBool"));
  -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99DE8];
    -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "objectForKey:", CFSTR("Identifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);
    }

    v26 = CFSTR("appLockBundleIDs");
    v24 = CFSTR("values");
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("intersection"));

  }
  return v3;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSArray *whitelistedAppsAndOptions;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCAppWhitelistPayloadBase;
  -[MCPayload stubDictionary](&v9, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  whitelistedAppsAndOptions = self->_whitelistedAppsAndOptions;
  if (whitelistedAppsAndOptions)
    objc_msgSend(v3, "setObject:forKey:", whitelistedAppsAndOptions, CFSTR("Apps"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCAppWhitelistPayloadBase allowAccessWithoutPasscode](self, "allowAccessWithoutPasscode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("AllowAccessWithoutPasscode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCAppWhitelistPayloadBase forceAllowSupervisorAccess](self, "forceAllowSupervisorAccess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("ForceAllowSupervisorAccess"));

  return v4;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCAppWhitelistPayloadBase;
  -[MCPayload verboseDescription](&v7, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("App whitelist:\n"));
  -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("  Apps: %@\n"), v5);

  objc_msgSend(v4, "appendFormat:", CFSTR("  Allow access without passcode: %d\n"), -[MCAppWhitelistPayloadBase allowAccessWithoutPasscode](self, "allowAccessWithoutPasscode"));
  objc_msgSend(v4, "appendFormat:", CFSTR("  Allow supervisor access: %d\n"), -[MCAppWhitelistPayloadBase forceAllowSupervisorAccess](self, "forceAllowSupervisorAccess"));
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  MCKeyValue *v4;
  void *v5;
  void *v6;
  MCKeyValue *v7;
  MCKeyValue *v8;
  void *v9;
  void *v10;
  MCKeyValue *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  MCKeyValue *v23;
  void *v24;
  MCKeyValue *v25;
  void *v26;
  void *v28;
  MCKeyValue *v29;
  MCKeyValue *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = [MCKeyValue alloc];
  MCLocalizedStringForBool(-[MCAppWhitelistPayloadBase allowAccessWithoutPasscode](self, "allowAccessWithoutPasscode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(CFSTR("ALLOW_ACCESS_WITHOUT_PASSCODE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCKeyValue initWithLocalizedString:localizedKey:](v4, "initWithLocalizedString:localizedKey:", v5, v6);

  v8 = [MCKeyValue alloc];
  MCLocalizedStringForBool(-[MCAppWhitelistPayloadBase forceAllowSupervisorAccess](self, "forceAllowSupervisorAccess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(CFSTR("ALLOW_SUPERVISOR_ACCESS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCKeyValue initWithLocalizedString:localizedKey:](v8, "initWithLocalizedString:localizedKey:", v9, v10);

  v37[0] = v7;
  v37[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v3;
  objc_msgSend(v3, "addObject:", v13);
  -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v28 = v13;
    v29 = v11;
    v30 = v7;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[MCAppWhitelistPayloadBase whitelistedAppsAndOptions](self, "whitelistedAppsAndOptions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v19);
          v21 = (void *)objc_opt_new();
          objc_msgSend(v20, "objectForKey:", CFSTR("Identifier"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = [MCKeyValue alloc];
          MCLocalizedString(CFSTR("APP"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[MCKeyValue initWithLocalizedString:localizedKey:](v23, "initWithLocalizedString:localizedKey:", v22, v24);

          objc_msgSend(v21, "addObject:", v25);
          +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v26);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

    v11 = v29;
    v7 = v30;
    v13 = v28;
  }

  return v14;
}

- (NSArray)whitelistedAppsAndOptions
{
  return self->_whitelistedAppsAndOptions;
}

- (void)setWhitelistedAppsAndOptions:(id)a3
{
  objc_storeStrong((id *)&self->_whitelistedAppsAndOptions, a3);
}

- (BOOL)allowAccessWithoutPasscode
{
  return self->_allowAccessWithoutPasscode;
}

- (void)setAllowAccessWithoutPasscode:(BOOL)a3
{
  self->_allowAccessWithoutPasscode = a3;
}

- (BOOL)forceAllowSupervisorAccess
{
  return self->_forceAllowSupervisorAccess;
}

- (void)setForceAllowSupervisorAccess:(BOOL)a3
{
  self->_forceAllowSupervisorAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedAppsAndOptions, 0);
}

@end
