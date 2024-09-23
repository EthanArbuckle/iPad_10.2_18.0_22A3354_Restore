@implementation MCProfileStateHandler

+ (void)addProfileSettingsStateHandler
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__MCProfileStateHandler_addProfileSettingsStateHandler__block_invoke;
  v2[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "addStateHandlerWithName:stateBlock:", "Profile Settings", v2);
}

uint64_t __55__MCProfileStateHandler_addProfileSettingsStateHandler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "settingsStateDictionaryWithDetailsIncluded:", 1);
}

+ (void)addProfileRestrictionsStateHandler
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__MCProfileStateHandler_addProfileRestrictionsStateHandler__block_invoke;
  v2[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "addStateHandlerWithName:stateBlock:", "Profile Restrictions", v2);
}

uint64_t __59__MCProfileStateHandler_addProfileRestrictionsStateHandler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restrictionsStateDictionaryWithDetailsIncluded:", 1);
}

+ (id)settingsStateDictionaryWithDetailsIncluded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
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
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "userSettingsForSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("System user settings"));

    objc_msgSend(v6, "userSettingsForCurrentUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("User's user settings");
  }
  else
  {
    objc_msgSend(v5, "userSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("User settings");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v9);

  objc_msgSend(v6, "effectiveUserSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("Effective user settings"));
  objc_msgSend(v10, "objectForKey:", CFSTR("restrictedBool"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v6, "isBoolSettingLockedDownByRestrictions:", v18))
            objc_msgSend(v12, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("UI disabled for BOOL settings"));
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("restrictedValue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v28 = v11;
    v20 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          if (objc_msgSend(v6, "isValueSettingLockedDownByRestrictions:", v26))
            objc_msgSend(v20, "addObject:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("UI disabled for value settings"));
    v11 = v28;
  }

  return v4;
}

+ (id)restrictionsStateDictionaryWithDetailsIncluded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    MCSystemProfileRestrictionsFilePath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithContentsOfFile:", v6);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("Restrictions per system profile"));

    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    MCUserProfileRestrictionsFilePath();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithContentsOfFile:", v9);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("Restrictions per user profile"));

    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    MCSystemClientRestrictionsFilePath();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithContentsOfFile:", v12);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("Restrictions per system client"));

    v14 = objc_alloc(MEMORY[0x1E0C99D80]);
    MCUserClientRestrictionsFilePath();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithContentsOfFile:", v15);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("Restrictions per user client"));

  }
  +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "effectiveRestrictions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("Restrictions summary"));

  return v4;
}

@end
