@implementation MOEventBundleLabelLocalizer

+ (id)_MomentsBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

+ (id)_MomentsDefaultLanguageBundle
{
  void *v2;
  void *v3;
  void *v4;

  +[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("en"), CFSTR("lproj"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)preferredLocalization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[MOEventBundleLabelLocalizer _MomentsDefaultLanguageBundle](MOEventBundleLabelLocalizer, "_MomentsDefaultLanguageBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "preferredLocalizations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v5;
  }

  return v4;
}

+ (BOOL)isPreferredLanguageNounCap
{
  void *v2;
  void *v3;
  void *v4;

  +[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("de"));
  return (char)v3;
}

+ (BOOL)isPreferredLanguageTitlecaseCapable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E855DFD8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v2, "containsObject:", v5);
  return (char)v4;
}

+ (BOOL)isPreferredLanguageMidSentenceCaseCapable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E855DFF0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v2, "containsObject:", v5) ^ 1;
  return (char)v4;
}

+ (id)_Moments_LocalizedNounForKey:(id)a3
{
  void *v3;
  uint64_t v4;

  +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MOEventBundleLabelLocalizer isPreferredLanguageNounCap](MOEventBundleLabelLocalizer, "isPreferredLanguageNounCap"))
  {
    +[MOEventBundleLabelLocalizer __Moments_TitleCapitalizedStringForKey:](MOEventBundleLabelLocalizer, "__Moments_TitleCapitalizedStringForKey:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)_Moments_LocalizedStringForKey:(id)a3 withTable:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (objc_msgSend(v7, "length"))
    {
      +[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", v7, CFSTR("_Key_Not_Found_"), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(CFSTR("_Key_Not_Found_"), "isEqualToString:", v10))
      {
        +[MOEventBundleLabelLocalizer _MomentsDefaultLanguageBundle](MOEventBundleLabelLocalizer, "_MomentsDefaultLanguageBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", v7, CFSTR("_Key_Not_Found_"), v8);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        _mo_log_facility_get_os_log(MOLogFacilityFramework);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v27 = 138412802;
          v28 = v7;
          v29 = 2112;
          v30 = v11;
          v31 = 2112;
          v32 = v12;
          _os_log_error_impl(&dword_1CAE42000, v13, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer key is not found, key, %@, default language bundle, %@, default localized string, %@", (uint8_t *)&v27, 0x20u);
        }

        _mo_log_facility_get_os_log(MOLogFacilityFramework);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:].cold.2((uint64_t)v7, v9, v14);

        if (objc_msgSend(CFSTR("_Key_Not_Found_"), "isEqualToString:", v10))
        {
          v15 = v7;

          v12 = v15;
        }
        else if (!v12)
        {
          v12 = v7;
        }

      }
      else
      {
        _mo_log_facility_get_os_log(MOLogFacilityFramework);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:].cold.3((uint64_t)v7, v10);

        v12 = v10;
      }

    }
    else
    {
      v12 = v7;
    }
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MOEventBundleLabelLocalizer.m"), 93, CFSTR("Invalid parameter not satisfying: key"));

    v12 = 0;
  }

  return v12;
}

+ (id)_Moments_LocalizedStringForKey:(id)a3
{
  return +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:withTable:", a3, 0);
}

+ (id)_Moments_LocalizedStringWithFormat:(id)a3 arguments:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MOEventBundleLabelLocalizer.m"), 138, CFSTR("Invalid parameter not satisfying: format"));
    goto LABEL_26;
  }
  +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityFramework);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.7((uint64_t)v9, v8);

  _mo_log_facility_get_os_log(MOLogFacilityFramework);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.6((uint64_t)v9, v8);

  if (!v9)
  {
    _mo_log_facility_get_os_log(MOLogFacilityFramework);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.2((uint64_t)v7, v33);

LABEL_26:
    v23 = 0;
    goto LABEL_31;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v36 = v8;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v16);
        _mo_log_facility_get_os_log(MOLogFacilityFramework);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.5(v41, v17, &v42, v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v12, "count"))
  {
    v19 = objc_msgSend(v12, "count");
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * objc_msgSend(v12, "count"));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "getObjects:range:", objc_msgSend(v20, "mutableBytes"), 0, v19);
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v22 = objc_retainAutorelease(v20);
    v23 = (void *)objc_msgSend(v21, "initWithFormat:arguments:", v9, objc_msgSend(v22, "mutableBytes"));
    _mo_log_facility_get_os_log(MOLogFacilityFramework);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.4(v23, v24);

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityFramework);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.3((uint64_t)v9, v34);

    v9 = v9;
    v23 = v9;
  }
  v8 = v36;
LABEL_31:

  return v23;
}

+ (id)_Moments_CapitalizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = v4;
    if ((unint64_t)objc_msgSend(v5, "length") > 1)
    {
      objc_msgSend(v5, "substringToIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uppercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "substringFromIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v7;
    }
    else
    {
      objc_msgSend(v5, "localizedCapitalizedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_Moments_TitleCapitalizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(a1, "isPreferredLanguageTitlecaseCapable"))
    {
      +[MOEventBundleLabelLocalizer __Moments_TitleCapitalizedStringForKey:](MOEventBundleLabelLocalizer, "__Moments_TitleCapitalizedStringForKey:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v5;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)__Moments_TitleCapitalizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = objc_msgSend(v6, "length");
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __70__MOEventBundleLabelLocalizer___Moments_TitleCapitalizedStringForKey___block_invoke;
    v15 = &unk_1E8542BB0;
    v16 = v6;
    v17 = v5;
    v8 = v5;
    v9 = v6;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 1027, &v12);
    v10 = (void *)objc_msgSend(v9, "copy", v12, v13, v14, v15);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __70__MOEventBundleLabelLocalizer___Moments_TitleCapitalizedStringForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v15 = v7;
    v9 = objc_msgSend(v7, "length");
    v8 = v15;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v15, "characterAtIndex:", 0));

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        if ((objc_msgSend(v12, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a3 - 1)) & v11 & 1) == 0)
        {
LABEL_6:

          v8 = v15;
          goto LABEL_7;
        }
      }
      else if (!v11)
      {
        goto LABEL_6;
      }
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v15, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "replaceCharactersInRange:withString:", a3, a4, v14);

      goto LABEL_6;
    }
  }
LABEL_7:

}

+ (id)_Moments_AllCapitalizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v4, "localizedUppercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_Moments_LowercaseNounForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (+[MOEventBundleLabelLocalizer isPreferredLanguageNounCap](MOEventBundleLabelLocalizer, "isPreferredLanguageNounCap"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (BOOL)internalInstall
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

+ (void)_Moments_LocalizedStringForKey:(uint64_t)a3 withTable:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, a1, a3, "Invalid parameter not satisfying: key", a5, a6, a7, a8, 0);
}

+ (void)_Moments_LocalizedStringForKey:(NSObject *)a3 withTable:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "preferredLocalizations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138413058;
  v13 = a1;
  v14 = 2112;
  v15 = v7;
  v16 = 2112;
  v17 = v9;
  v18 = 2112;
  v19 = v11;
  _os_log_error_impl(&dword_1CAE42000, a3, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer key is not found, key, %@, locale preferredLanguage, %@, locale, %@, framework preferredLocalization, %@", (uint8_t *)&v12, 0x2Au);

}

+ (void)_Moments_LocalizedStringForKey:(uint64_t)a1 withTable:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "mask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1CAE42000, v2, v3, "MOEventBundleLabelLocalizer localizedString, key, %@, value, %@", v4, v5, v6, v7, 2u);

}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a3 arguments:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, a1, a3, "Invalid parameter not satisfying: format", a5, a6, a7, a8, 0);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_error_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer return nil for format, %@, localizedFormat, %@", (uint8_t *)&v2, 0x16u);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  OUTLINED_FUNCTION_4_0(&dword_1CAE42000, a2, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer output string, %@", (uint8_t *)&v2);
}

+ (void)_Moments_LocalizedStringWithFormat:(void *)a1 arguments:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4_0(&dword_1CAE42000, a2, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer output string, %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_4();
}

+ (void)_Moments_LocalizedStringWithFormat:(_QWORD *)a3 arguments:(NSObject *)a4 .cold.5(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "mask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  OUTLINED_FUNCTION_4_0(&dword_1CAE42000, a4, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer arg, %@", a1);

}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1CAE42000, v2, v3, "MOEventBundleLabelLocalizer format, %@, args.count, %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(void *)a2 .cold.7(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1CAE42000, v2, v3, "format, %@, args.count, %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

@end
