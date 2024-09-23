@implementation NSBundle(GKAdditions)

- (uint64_t)_gkIsFirstParty
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NSBundle_GKAdditions___gkIsFirstParty__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = a1;
  if (_gkIsFirstParty_onceToken != -1)
    dispatch_once(&_gkIsFirstParty_onceToken, block);
  return _gkIsFirstParty_isFirstParty;
}

- (uint64_t)_gkIsPreferences
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.preferences.internetaccounts.remoteservice")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Game-Center-Settings.extension")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.GameCenterUI.GameCenterHostingContainer")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.TVSettings")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.gamecenterctl"));
  }

  return v2;
}

- (uint64_t)_gkIsGameCenter
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.gamecenter"));

  return v2;
}

- (uint64_t)_gkIsGameCenterExtension
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = CFSTR("com.apple.GameCenterUI.GameCenterDashboardExtension");
  v8[1] = CFSTR("com.apple.GameCenterUI.GameCenterMatchmakerExtension");
  v8[2] = CFSTR("com.apple.GameCenterUI.GameCenterTurnBasedMatchmakerExtension");
  v8[3] = CFSTR("com.apple.GameCenterUI.GameCenterChallengeIssueExtension");
  v8[4] = CFSTR("com.apple.GameCenterUI.GameCenterFriendRequestExtension");
  v8[5] = CFSTR("com.apple.GameCenterUI.GameCenterAuthenticateExtension");
  v8[6] = CFSTR("com.apple.gamecenter.GameCenterUIService");
  v8[7] = CFSTR("com.apple.gamecenter.GameCenterUIService.GameCenterMessageExtension");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (uint64_t)_gkIsContacts
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "_gkBundleIdentifierIsRelatedToContactsUI:", v2);

  return v3;
}

+ (uint64_t)_gkBundleIdentifierIsRelatedToContactsUI:()GKAdditions
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = _gkBundleIdentifierIsRelatedToContactsUI__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_gkBundleIdentifierIsRelatedToContactsUI__onceToken, &__block_literal_global_37_0);
  v5 = objc_msgSend((id)_gkBundleIdentifierIsRelatedToContactsUI__contactsUIBundleIdentifiers, "containsObject:", v4);

  return v5;
}

- (uint64_t)_gkIsDaemon
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.gamed"));

  return v2;
}

+ (uint64_t)_gkMainBundleIsGameCenterSystemProcess
{
  if (_gkMainBundleIsGameCenterSystemProcess_onceToken != -1)
    dispatch_once(&_gkMainBundleIsGameCenterSystemProcess_onceToken, &__block_literal_global_38);
  return _gkMainBundleIsGameCenterSystemProcess_isGameCenterSystemProcess;
}

+ (id)_gkPreferredSystemLanguage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  GKGameCenterUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v0, "localizations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredLocalizationsFromArray:forPreferences:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_gkPathForSoundWithName:()GKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pathForResource:ofType:", v4, CFSTR("caf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "pathForResource:ofType:", v4, CFSTR("aif"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1, "pathForResource:ofType:", v4, CFSTR("wav"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (uint64_t)_gkPathForImageWithName:()GKAdditions
{
  return objc_msgSend(a1, "pathForResource:ofType:", a3, CFSTR("png"));
}

- (uint64_t)_gkPathForMessageImage
{
  return objc_msgSend(a1, "_gkPathForImageWithName:", CFSTR("GKMessageImage"));
}

- (uint64_t)_gkPathForInviteSound
{
  return objc_msgSend(a1, "_gkPathForSoundWithName:", CFSTR("GKInvite"));
}

- (uint64_t)_gkPathForChallengeSound
{
  return objc_msgSend(a1, "_gkPathForSoundWithName:", CFSTR("GKChallenge"));
}

- (id)_gkBundleVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_gkBundleShortVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_gkLocalizedName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9AE88]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  GKGetLocalizedStringFromTableInBundle((uint64_t)v3, (uint64_t)CFSTR("InfoPlist"), a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_gkPreferredUserLanguage
{
  void *v1;
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_gkPreferredSystemLanguage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0x1E0C99000uLL;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v1);
  objc_msgSend(v3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v18 = v1;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(obj);
          v10 = (void *)objc_msgSend(objc_alloc(*(Class *)(v2 + 3528)), "initWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9));
          objc_msgSend(v10, "countryCode");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v3, "languageCode");
            v13 = v2;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "languageCode");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            v2 = v13;
            if ((v16 & 1) != 0)
            {
              objc_msgSend(v10, "localeIdentifier");
              v5 = (id)objc_claimAutoreleasedReturnValue();

              v1 = v18;
              goto LABEL_14;
            }
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          continue;
        break;
      }
    }

    v1 = v18;
  }
  v5 = v1;
LABEL_14:

  return v5;
}

- (id)_gkSystemLocalizedStringForKey:()GKAdditions value:table:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id obj;
  id obja;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _QWORD v63[4];

  v63[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47 = a4;
  v8 = a5;
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v9;
  GKGameCenterFoundationBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_gkSystemLocalizedStringForKey_value_table____localizationLookup)
  {
    obj = v7;
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v57 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v20, obj, v47);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v14, "setObject:forKey:", v20, v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v17);
    }

    v22 = (void *)_gkSystemLocalizedStringForKey_value_table____localizationLookup;
    _gkSystemLocalizedStringForKey_value_table____localizationLookup = (uint64_t)v14;

    v7 = obj;
  }
  v23 = v7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "_gkPreferredSystemLanguage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v25 = v11;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  v27 = v23;
  obja = v25;
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v53;
    v27 = v23;
    while (2)
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v53 != v29)
          objc_enumerationMutation(obja);
        v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v30);
        __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2(v26, v31, v23, v47, v8, v24);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v32, "isEqualToString:", v23))
        {
          objc_msgSend((id)_gkSystemLocalizedStringForKey_value_table____localizationLookup, "objectForKey:", v24);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2((uint64_t)v33, v31, v23, v47, v8, v33);
            v35 = objc_claimAutoreleasedReturnValue();

            v32 = (void *)v35;
          }

        }
        if (objc_msgSend(v32, "isEqualToString:", v23, obja)
          && (v36 = objc_msgSend(v24, "rangeOfString:options:", CFSTR("-"), 4), v36 != 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(v24, "substringToIndex:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2((uint64_t)v37, v31, v23, v47, v8, v37);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v27 = v32;
        }
        v26 = objc_msgSend(v27, "isEqualToString:", v23);
        if (!(_DWORD)v26)
        {
          v25 = obja;
          goto LABEL_30;
        }
        ++v30;
      }
      while (v28 != v30);
      v25 = obja;
      v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      v28 = v26;
      if (v26)
        continue;
      break;
    }
  }
LABEL_30:

  if (objc_msgSend(v27, "isEqualToString:", v23))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v38 = v25;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v49;
LABEL_33:
      v42 = 0;
      v43 = v27;
      while (1)
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(v38);
        __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2(v39, *(void **)(*((_QWORD *)&v48 + 1) + 8 * v42), v23, v47, v8, CFSTR("en"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = objc_msgSend(v27, "isEqualToString:", v23);
        if (!(_DWORD)v39)
          break;
        ++v42;
        v43 = v27;
        if (v40 == v42)
        {
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          v40 = v39;
          if (v39)
            goto LABEL_33;
          break;
        }
      }
    }

    v25 = obja;
  }

  return v27;
}

- (id)_gkLocalizedStringForKey:()GKAdditions defaultValue:arguments:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v10 = 0;
  }
  objc_msgSend(a1, "_gkSystemLocalizedStringForKey:value:table:", v8, v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "length"))
  {
    GKFormatNetworkStringWithArguments(v12, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v9 && objc_msgSend(v9, "length"))
  {
    v13 = v9;
  }
  else
  {
    if (!v8 || !objc_msgSend(v8, "length"))
    {
      v14 = 0;
      goto LABEL_18;
    }
    v13 = v8;
  }
  v14 = v13;
LABEL_18:

  return v14;
}

- (uint64_t)_gkIsPurpleBuddy
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  return v2;
}

- (uint64_t)_gkIsEligibleForOnboardingUI
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NSBundle_GKAdditions___gkIsEligibleForOnboardingUI__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = a1;
  if (_gkIsEligibleForOnboardingUI_onceToken != -1)
    dispatch_once(&_gkIsEligibleForOnboardingUI_onceToken, block);
  return _gkIsEligibleForOnboardingUI_isEligible;
}

@end
