@implementation NSUserDefaults(SafariServicesExtras)

+ (uint64_t)_sf_safariSharedDefaults
{
  return objc_msgSend(MEMORY[0x1E0C99EA0], "sf_safariSharedDefaults");
}

- (uint64_t)_sf_javaScriptEnabled
{
  uint64_t v2;

  v2 = *MEMORY[0x1E0D4F530];
  if (restrictedValueForKey((void *)*MEMORY[0x1E0D4F530]) == 2)
    return 0;
  else
    return objc_msgSend(a1, "BOOLForKey:", v2);
}

+ (uint64_t)_sf_safariDefaults
{
  return objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
}

- (void)_sf_registerSafariDefaults
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];
  _QWORD v54[44];
  _QWORD v55[45];

  v55[44] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0D4F690];
  v54[0] = *MEMORY[0x1E0D4F530];
  v54[1] = v4;
  v55[0] = MEMORY[0x1E0C9AAB0];
  v55[1] = MEMORY[0x1E0C9AAB0];
  v5 = MEMORY[0x1E0C9AAA0];
  v6 = *MEMORY[0x1E0D4F688];
  v54[2] = *MEMORY[0x1E0D4F578];
  v54[3] = v6;
  v55[2] = MEMORY[0x1E0C9AAA0];
  v55[3] = MEMORY[0x1E0C9AAA0];
  v7 = *MEMORY[0x1E0D4F558];
  v54[4] = *MEMORY[0x1E0D4F3B0];
  v54[5] = v7;
  v55[4] = MEMORY[0x1E0C9AAB0];
  v55[5] = MEMORY[0x1E0C9AAA0];
  v8 = *MEMORY[0x1E0D4F570];
  v55[6] = MEMORY[0x1E0C9AAB0];
  v9 = *MEMORY[0x1E0D4F4F8];
  v54[6] = v8;
  v54[7] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", _SFDeviceIsPad() ^ 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D4F510];
  v55[7] = v10;
  v55[8] = v3;
  v12 = *MEMORY[0x1E0D4F398];
  v54[8] = v11;
  v54[9] = v12;
  v13 = *MEMORY[0x1E0D4F4C0];
  v55[9] = v3;
  v55[10] = v5;
  v14 = *MEMORY[0x1E0D4F390];
  v54[10] = v13;
  v54[11] = v14;
  v15 = *MEMORY[0x1E0D4F4B0];
  v55[11] = v5;
  v55[12] = v5;
  v16 = *MEMORY[0x1E0D4F498];
  v54[12] = v15;
  v54[13] = v16;
  v55[13] = v5;
  v55[14] = v5;
  v17 = *MEMORY[0x1E0D4F540];
  v54[14] = *MEMORY[0x1E0D4F660];
  v54[15] = v17;
  v18 = *MEMORY[0x1E0D4F6A0];
  v55[15] = v3;
  v55[16] = v3;
  v19 = *MEMORY[0x1E0D4F4A8];
  v54[16] = v18;
  v54[17] = v19;
  v20 = *MEMORY[0x1E0D4F4A0];
  v55[17] = v3;
  v55[18] = &unk_1E4B27580;
  v21 = *MEMORY[0x1E0D4F438];
  v54[18] = v20;
  v54[19] = v21;
  v22 = *MEMORY[0x1E0D4F448];
  v55[19] = v3;
  v55[20] = v3;
  v23 = *MEMORY[0x1E0D4F450];
  v54[20] = v22;
  v54[21] = v23;
  v55[21] = v3;
  v54[22] = *MEMORY[0x1E0D4F580];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _SFDeviceIsPad());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0D4F698];
  v55[22] = v24;
  v55[23] = v3;
  v26 = *MEMORY[0x1E0D8B478];
  v54[23] = v25;
  v54[24] = v26;
  v27 = *MEMORY[0x1E0D4F1C8];
  v55[24] = v3;
  v55[25] = &unk_1E4B25840;
  v28 = *MEMORY[0x1E0D4F120];
  v54[25] = v27;
  v54[26] = v28;
  v29 = *MEMORY[0x1E0D4F128];
  v55[26] = v3;
  v55[27] = v3;
  v30 = *MEMORY[0x1E0D4F358];
  v54[27] = v29;
  v54[28] = v30;
  v31 = *MEMORY[0x1E0D4F130];
  v55[28] = v3;
  v55[29] = v3;
  v32 = *MEMORY[0x1E0D4EFD8];
  v54[29] = v31;
  v54[30] = v32;
  v33 = *MEMORY[0x1E0D8B028];
  v55[30] = &unk_1E4B25858;
  v55[31] = v3;
  v34 = *MEMORY[0x1E0D4F0C8];
  v54[31] = v33;
  v54[32] = v34;
  v35 = *MEMORY[0x1E0D4F140];
  v55[32] = v3;
  v55[33] = v3;
  v36 = *MEMORY[0x1E0D8AED0];
  v54[33] = v35;
  v54[34] = v36;
  v55[34] = v3;
  v54[35] = *MEMORY[0x1E0D4F148];
  v37 = *MEMORY[0x1E0D4F020];
  v53[0] = *MEMORY[0x1E0D4F030];
  v53[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[35] = v38;
  v55[36] = v3;
  v54[36] = CFSTR("DebugStreamlinedCompletionList");
  v54[37] = CFSTR("DebugLabelPreviousSearchesInCompletionList");
  v39 = *MEMORY[0x1E0D4F190];
  v54[38] = CFSTR("DebugReflectUserIntentInSearch");
  v54[39] = v39;
  v40 = *MEMORY[0x1E0D4F268];
  v55[39] = &unk_1E4B25870;
  v55[40] = &unk_1E4B25888;
  v41 = *MEMORY[0x1E0D4F198];
  v54[40] = v40;
  v54[41] = v41;
  v55[37] = v3;
  v55[38] = v3;
  v42 = *MEMORY[0x1E0D4F270];
  v55[41] = &unk_1E4B25870;
  v55[42] = &unk_1E4B25870;
  v43 = *MEMORY[0x1E0D8AE68];
  v54[42] = v42;
  v54[43] = v43;
  v55[43] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 44);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  WBSTabOrderManagerDefaultPreferenceValues();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addEntriesFromDictionary:", v46);

  defaultTranslationPreferenceValues();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addEntriesFromDictionary:", v47);

  SFDefaultWebExtensionsPreferenceValues();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addEntriesFromDictionary:", v48);

  v49 = *MEMORY[0x1E0D4F1E8];
  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0D4F1E8]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(a1, "objectForKey:", v32);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v51)
    {
      if (objc_msgSend(a1, "BOOLForKey:", v49))
        v52 = 0;
      else
        v52 = 2;
      objc_msgSend(a1, "setInteger:forKey:", v52, v32);
    }
    objc_msgSend(a1, "removeObjectForKey:", v49);
  }
  objc_msgSend(a1, "registerDefaults:", v45);

}

- (id)_sf_dateForKey:()SafariServicesExtras
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)_sf_javaScriptCanOpenWindowsAutomatically
{
  uint64_t v2;

  v2 = *MEMORY[0x1E0D4F528];
  if (restrictedValueForKey((void *)*MEMORY[0x1E0D4F528]) == 2)
    return 0;
  else
    return objc_msgSend(a1, "BOOLForKey:", v2);
}

- (uint64_t)_sf_warnAboutFraudulentWebsites
{
  uint64_t v2;
  uint64_t result;

  v2 = *MEMORY[0x1E0D4F690];
  result = restrictedValueForKey((void *)*MEMORY[0x1E0D4F690]);
  if ((_DWORD)result == 2)
    return 0;
  if ((_DWORD)result != 1)
    return objc_msgSend(a1, "BOOLForKey:", v2);
  return result;
}

+ (uint64_t)_pm_defaults
{
  return objc_msgSend(MEMORY[0x1E0C99EA0], "pm_defaults");
}

+ (id)_sf_sfAppDefaults
{
  if (_sf_sfAppDefaults_onceToken != -1)
    dispatch_once(&_sf_sfAppDefaults_onceToken, &__block_literal_global_8);
  return (id)_sf_sfAppDefaults_sfAppDefaults;
}

- (id)_sf_stringForKey:()SafariServicesExtras defaultValue:
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a1, "stringForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = v6;
  v9 = v8;

  return v9;
}

- (uint64_t)_sf_shouldAutomaticallyDownloadReadingListItems
{
  if ((objc_msgSend(a1, "BOOLForKey:", *MEMORY[0x1E0D4F3B8]) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "BOOLForKey:", *MEMORY[0x1E0D4F5D8]);
}

- (uint64_t)_sf_setShouldAutomaticallyDownloadReadingListItems:()SafariServicesExtras
{
  return objc_msgSend(a1, "setBool:forKey:", a3, *MEMORY[0x1E0D4F3B8]);
}

- (uint64_t)_sf_passwordManagerIsInDemoMode
{
  return objc_msgSend(a1, "BOOLForKey:", *MEMORY[0x1E0D8B030]);
}

@end
