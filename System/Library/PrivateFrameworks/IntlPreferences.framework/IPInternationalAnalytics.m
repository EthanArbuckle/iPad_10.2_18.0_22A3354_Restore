@implementation IPInternationalAnalytics

+ (void)reportStatistics
{
  objc_msgSend(a1, "reportGeneralStatistics");
  objc_msgSend(a1, "reportPerAppLanguageStatistics");
}

+ (void)reportGeneralStatistics
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  _QWORD v35[10];
  _QWORD v36[12];

  v36[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "_globalPreferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v34 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)objc_msgSend(v2, "count") < 3)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  +[IntlUtility perAppLanguageSelectionBundleIdentifiers](IntlUtility, "perAppLanguageSelectionBundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B68], "_currentGlobalUserInflection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v2;
  v30 = v5;
  if (v5)
    v6 = objc_msgSend(v5, "isIdentity") ^ 1;
  else
    v6 = 0;
  v35[0] = CFSTR("deviceLanguage");
  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v29;
  v35[1] = CFSTR("deviceRegion");
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "countryCode");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("Not Specified");
  v36[1] = v9;
  v35[2] = CFSTR("perAppLanguageUsageCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v10 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v10;
  if (v31)
    v11 = v31;
  else
    v11 = CFSTR("Not Specified");
  v36[2] = v10;
  v36[3] = v11;
  v35[3] = CFSTR("preferredLanguage1");
  v35[4] = CFSTR("preferredLanguage2");
  v12 = v34;
  if (!v34)
    v12 = CFSTR("Not Specified");
  v13 = (void *)v3;
  if (v3)
    v14 = (const __CFString *)v3;
  else
    v14 = CFSTR("Not Specified");
  v36[4] = v12;
  v36[5] = v14;
  v35[5] = CFSTR("preferredLanguage3");
  v35[6] = CFSTR("hasInflectionSet");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v15;
  v35[7] = 0x1E706AE58;
  objc_msgSend(MEMORY[0x1E0C99DC8], "_preferredTemperatureUnit");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("Not Specified");
  v36[7] = v18;
  v35[8] = 0x1E7069718;
  objc_msgSend(v32, "objectForKey:inDomain:");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("Not Specified");
  v36[8] = v21;
  v35[9] = 0x1E7069738;
  objc_msgSend(v32, "objectForKey:inDomain:");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("Not Specified");
  v36[9] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  AnalyticsSendEvent();
}

+ (void)reportPerAppLanguageStatistics
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  _QWORD v21[4];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[IntlUtility perAppLanguageSelectionBundleIdentifiers](IntlUtility, "perAppLanguageSelectionBundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        +[IntlUtility preferredLanguageForBundleID:](IntlUtility, "preferredLanguageForBundleID:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
        {
          v20[0] = CFSTR("bundleIdentifier");
          v20[1] = CFSTR("languageIdentifier");
          v21[0] = v7;
          v21[1] = v8;
          v20[2] = CFSTR("deviceLanguage");
          objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v21[2] = v10;
          v20[3] = CFSTR("deviceRegion");
          objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "countryCode");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          v14 = CFSTR("Not Specified");
          if (v12)
            v14 = (const __CFString *)v12;
          v21[3] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v4);
  }

}

@end
