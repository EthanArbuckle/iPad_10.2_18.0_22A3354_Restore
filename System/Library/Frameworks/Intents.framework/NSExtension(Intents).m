@implementation NSExtension(Intents)

- (id)_intents_intentsRestrictedWhileProtectedDataUnavailable
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IntentsRestrictedWhileProtectedDataUnavailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_intents_extensionSupportsAtLeastOneSiriIntent
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CA58F0];
  objc_msgSend(a1, "_extensionBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pluginKitProxyForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _INSupportedIntentsByExtensions(1, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

+ (uint64_t)_intents_matchExtensionsForIntent:()Intents shouldIgnoreLaunchId:completion:
{
  return objc_msgSend(a1, "_matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLaunchId:requireTrustCheck:completion:", a3, CFSTR("com.apple.intents-service"), 0, a4, 1, a5);
}

+ (uint64_t)_intents_matchExtensionsForIntent:()Intents completion:
{
  return objc_msgSend(a1, "_matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:requireTrustCheck:completion:", a3, CFSTR("com.apple.intents-service"), 0, 1, a4);
}

+ (uint64_t)_intents_matchExtensionsForIntent:()Intents requireTrustCheck:completion:
{
  return objc_msgSend(a1, "_matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:requireTrustCheck:completion:", a3, CFSTR("com.apple.intents-service"), 0, a4, a5);
}

+ (void)_intents_matchUIExtensionsForIntent:()Intents completion:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__NSExtension_Intents___intents_matchUIExtensionsForIntent_completion___block_invoke;
  v8[3] = &unk_1E2291BE8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:requireTrustCheck:completion:", a3, CFSTR("com.apple.intents-ui-service"), 0, 1, v8);

}

+ (uint64_t)_intents_matchSiriExtensionsForIntent:()Intents completion:
{
  return objc_msgSend(a1, "_matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:requireTrustCheck:completion:", a3, CFSTR("com.apple.intents-service"), 1, 1, a4);
}

+ (void)_intents_matchSiriUIExtensionsForIntent:()Intents completion:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__NSExtension_Intents___intents_matchSiriUIExtensionsForIntent_completion___block_invoke;
  v8[3] = &unk_1E2291BE8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:requireTrustCheck:completion:", a3, CFSTR("com.apple.intents-ui-service"), 1, 1, v8);

}

+ (void)_intents_matchSiriUISnippetExtensionsWithCompletion:()Intents
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__NSExtension_Intents___intents_matchSiriUISnippetExtensionsWithCompletion___block_invoke;
  v6[3] = &unk_1E2291BE8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_matchSnippetExtensionsWithExtensionPointName:completion:", CFSTR("com.apple.intents-ui-service"), v6);

}

+ (uint64_t)_matchExtensionsForIntent:()Intents extensionPointName:shouldCheckForSiriEnabled:requireTrustCheck:completion:
{
  return objc_msgSend(a1, "_matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLaunchId:requireTrustCheck:completion:", a3, a4, a5, 0, a6, a7);
}

+ (void)_matchExtensionsForIntent:()Intents extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLaunchId:requireTrustCheck:completion:
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  void (**v39)(id, _QWORD, void *);
  void *v40;
  char v41;
  _QWORD v42[4];
  id v43;
  id v44;
  void (**v45)(id, _QWORD, void *);
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (!v16)
    goto LABEL_26;
  if (!v14)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = 3003;
LABEL_20:
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("INExtensionMatchingErrorDomain"), v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v25);

    goto LABEL_26;
  }
  if (!v15)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = 3004;
    goto LABEL_20;
  }
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v14, "extensionBundleId");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v17, "addObject:", v18);
  v36 = (void *)v18;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SiriViewService"));
  if (objc_msgSend(v35, "BOOLForKey:", CFSTR("kEnableEnhancedSiriUI")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnore"
              "LaunchId:requireTrustCheck:completion:]";
        _os_log_impl(&dword_18BEBC000, v19, OS_LOG_TYPE_INFO, "%s Setting UIExtensionBundleID to MessagesAssistantUIExtension", buf, 0xCu);
      }
      objc_msgSend(v14, "_setUiExtensionBundleId:", CFSTR("com.apple.MobileSMS.MessagesAssistantUIExtension"));
    }
  }
  objc_msgSend(v14, "_uiExtensionBundleId");
  v20 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.intents-ui-service")) && v20)
    objc_msgSend(v17, "insertObject:atIndex:", v20, 0);
  v34 = (void *)v20;
  if (objc_msgSend(v17, "count"))
  {
    v21 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLa"
            "unchId:requireTrustCheck:completion:]";
      v49 = 2112;
      v50 = v17;
      _os_log_impl(&dword_18BEBC000, v21, OS_LOG_TYPE_INFO, "%s Considering possible extension bundle id candidates for direct lookup: %@", buf, 0x16u);
    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __145__NSExtension_Intents___matchExtensionsForIntent_extensionPointName_shouldCheckForSiriEnabled_shouldIgnoreLaunchId_requireTrustCheck_completion___block_invoke;
    v42[3] = &unk_1E2291C10;
    v43 = v17;
    v45 = v16;
    v44 = v14;
    objc_msgSend(v43, "enumerateObjectsUsingBlock:", v42);

    v22 = v43;
  }
  else
  {
    objc_msgSend(v14, "_intents_launchIdForCurrentPlatform");
    v33 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_className");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("com.apple.shortcuts")) | a6;
    v46 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      v29 = 0;
    else
      v29 = v26;
    objc_msgSend(a1, "_extensionMatchingDictionaryForIntentClassNames:extensionPointName:launchId:", v28, v15, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __145__NSExtension_Intents___matchExtensionsForIntent_extensionPointName_shouldCheckForSiriEnabled_shouldIgnoreLaunchId_requireTrustCheck_completion___block_invoke_32;
    v37[3] = &unk_1E2291C38;
    v41 = a5;
    v38 = v26;
    v40 = a1;
    v39 = v16;
    v31 = v26;
    v17 = v33;
    v32 = v31;
    objc_msgSend(a1, "_matchExtensionsWithAttributes:extensionPointName:requireTrustCheck:completion:", v30, v15, a7, v37);

  }
LABEL_26:

}

+ (void)_matchSnippetExtensionsWithExtensionPointName:()Intents completion:
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v8 = *MEMORY[0x1E0CB2A28];
      v13[1] = CFSTR("IntentsSupported");
      v14[0] = v6;
      v12 = CFSTR("SiriUISnippetExtensionIntent");
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_matchExtensionsWithAttributes:extensionPointName:requireTrustCheck:completion:", v10, v6, 1, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INExtensionMatchingErrorDomain"), 3004, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v11);

    }
  }

}

+ (void)_matchExtensionsWithAttributes:()Intents extensionPointName:requireTrustCheck:completion:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  char v17;

  v9 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0CB35D8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__NSExtension_Intents___matchExtensionsWithAttributes_extensionPointName_requireTrustCheck_completion___block_invoke;
  v14[3] = &unk_1E2291C60;
  v17 = a5;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "extensionsWithMatchingAttributes:completion:", a3, v14);

}

+ (uint64_t)_intents_extensionMatchingAttributesForIntents:()Intents
{
  return objc_msgSend(a1, "_extensionMatchingDictionaryForIntentClassNames:extensionPointName:launchId:", a3, CFSTR("com.apple.intents-service"), 0);
}

+ (uint64_t)_intents_uiExtensionMatchingAttributesForIntents:()Intents
{
  return objc_msgSend(a1, "_extensionMatchingDictionaryForIntentClassNames:extensionPointName:launchId:", a3, CFSTR("com.apple.intents-ui-service"), 0);
}

+ (id)_extensionMatchingDictionaryForIntentClassNames:()Intents extensionPointName:launchId:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v17[0] = *MEMORY[0x1E0CB2A28];
  v17[1] = CFSTR("IntentsSupported");
  v18[0] = v8;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v9)
  {
    v16 = 0;
    INExtractAppInfoFromSiriLaunchId(v9, 0, &v16);
    v12 = v16;
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D7D448]);

    }
  }
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

+ (void)_intents_findAppsWithAnIntentsServiceExtension:()Intents
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__NSExtension_Intents___intents_findAppsWithAnIntentsServiceExtension___block_invoke;
  v6[3] = &unk_1E2291BE8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:completion:", 10, v6);

}

+ (uint64_t)_intents_findPossibleSiriEnabledAppsWithAnIntentsServiceExtension:()Intents
{
  return objc_msgSend(a1, "_findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:completion:", 0, a3);
}

+ (void)_intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion:()Intents
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__NSExtension_Intents___intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion___block_invoke;
  v6[3] = &unk_1E2291BE8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:completion:", 1, v6);

}

+ (void)_findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:()Intents completion:
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v13 = *MEMORY[0x1E0CB2A28];
    v14[0] = CFSTR("com.apple.intents-service");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB35D8];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __96__NSExtension_Intents___findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter_completion___block_invoke;
    v9[3] = &unk_1E2291C90;
    v11 = a3;
    v12 = a1;
    v10 = v6;
    objc_msgSend(v8, "extensionsWithMatchingAttributes:completion:", v7, v9);

  }
}

+ (BOOL)appAllowedToTalkToSiri:()Intents
{
  return +[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:](_INSiriAuthorizationManager, "_siriAuthorizationStatusForAppID:") == 3;
}

@end
