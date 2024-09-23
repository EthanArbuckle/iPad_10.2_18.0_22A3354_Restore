@implementation NSExtension

void __96__NSExtension_Intents___findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v20 = a3;
  if (v4)
  {
    v5 = objc_msgSend(v4, "count");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v5);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  }
  else
  {
    v6 = 0;
    v21 = 0;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "_plugIn");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "containingUrl");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && (objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForBundleURL:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v6, "addObject:", v14);
            objc_msgSend(v15, "bundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(_QWORD *)(a1 + 40);
            if (v17 > 1)
            {
              if (v17 != 2)
              {
                if (v17 != 10)
                  goto LABEL_27;
                goto LABEL_26;
              }
              if (objc_msgSend(v12, "_intents_extensionSupportsAtLeastOneSiriIntent"))
              {
                objc_msgSend(v15, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.siri"), objc_opt_class());
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "BOOLValue");

                if ((v19 & 1) != 0)
                  goto LABEL_26;
              }
            }
            else
            {
              if (v17)
              {
                if (v17 != 1 || (objc_msgSend(v12, "_intents_extensionSupportsAtLeastOneSiriIntent") & 1) == 0)
                  goto LABEL_27;
LABEL_26:
                objc_msgSend(v21, "addObject:", v15);
                goto LABEL_27;
              }
              if (objc_msgSend(v12, "_intents_extensionSupportsAtLeastOneSiriIntent")
                && ((objc_msgSend(*(id *)(a1 + 48), "appAllowedToTalkToSiri:", v16) & 1) != 0
                 || !+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:](_INSiriAuthorizationManager, "_siriAuthorizationStatusForAppID:", v16)))
              {
                goto LABEL_26;
              }
            }
LABEL_27:

          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__NSExtension_Intents___intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v22 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  v23 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)MEMORY[0x1E0C9AA60];
  v24 = (void *)objc_msgSend(v5, "initWithArray:", v6, a1);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v8)
    goto LABEL_15;
  v9 = v8;
  v10 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v12, "supportedIntents");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v12, "entitlements");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:ofClass:", CFSTR("com.apple.developer.siri"), objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        if (!v16)
          continue;
        objc_msgSend(v12, "compatibilityObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v13);
      }

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v9);
LABEL_15:

  v17 = *(_QWORD *)(v21 + 32);
  objc_msgSend(v24, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
    v19 = 0;
  else
    v19 = v22;
  (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v19);

}

void __71__NSExtension_Intents___intents_findAppsWithAnIntentsServiceExtension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C99E20]);
  if (v4)
    v7 = v4;
  else
    v7 = (id)MEMORY[0x1E0C9AA60];
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "supportedIntents");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          objc_msgSend(v14, "compatibilityObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  v18 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    v20 = 0;
  else
    v20 = v5;
  (*(void (**)(uint64_t, void *, id))(v18 + 16))(v18, v19, v20);

}

void __103__NSExtension_Intents___matchExtensionsWithAttributes_extensionPointName_requireTrustCheck_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (!v6 && v7 && *(_BYTE *)(a1 + 48))
  {
    +[INAppTrust extensionsTrustedForLaunch:](INAppTrust, "extensionsTrustedForLaunch:", v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  v9 = objc_msgSend(v5, "count");
  if (!v6 && !v9)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("ExtensionPointName");
    v14[1] = v12;
    v15[0] = v11;
    v15[1] = CFSTR("Unable to find an extension to run this intent. Is your intent listed in IntentsSupported in the extension Info.plist?");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("INExtensionMatchingErrorDomain"), 3001, v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __145__NSExtension_Intents___matchExtensionsForIntent_extensionPointName_shouldCheckForSiriEnabled_shouldIgnoreLaunchId_requireTrustCheck_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_msgSend(*(id *)(a1 + 32), "count");
  v9 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLaun"
          "chId:requireTrustCheck:completion:]_block_invoke";
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s Attempting to retrieve specified extension with identifier: %@", buf, 0x16u);
  }
  v10 = a3 + 1;
  v26 = *MEMORY[0x1E0CB2A08];
  v27 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v11, &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v24;
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v15 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLa"
            "unchId:requireTrustCheck:completion:]_block_invoke";
      v30 = 2112;
      v31 = v13;
      _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, "%s Could not retrieve specified extension: %@", buf, 0x16u);
    }
  }
  else
  {
    if (v14)
    {
      v18 = *(_QWORD *)(a1 + 48);
      v25 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v18 + 16))(v18, v19, 0);

      *a4 = 1;
      goto LABEL_10;
    }
    v20 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v21 = *(void **)(a1 + 40);
      v22 = v20;
      objc_msgSend(v21, "extensionBundleId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLa"
            "unchId:requireTrustCheck:completion:]_block_invoke";
      v30 = 2112;
      v31 = v23;
      _os_log_error_impl(&dword_18BEBC000, v22, OS_LOG_TYPE_ERROR, "%s extensionWithIdentifier returned nil for identifier: %@", buf, 0x16u);

    }
  }
  if (v10 == v8)
  {
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INExtensionMatchingErrorDomain"), 3001, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

  }
LABEL_10:

}

void __145__NSExtension_Intents___matchExtensionsForIntent_extensionPointName_shouldCheckForSiriEnabled_shouldIgnoreLaunchId_requireTrustCheck_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count") && *(_BYTE *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v7 = *(void **)(a1 + 32);
    v11 = 0;
    INExtractAppInfoFromSiriLaunchId(v7, &v11, 0);
    v8 = v11;
    if ((objc_msgSend(*(id *)(a1 + 48), "appAllowedToTalkToSiri:", v8) & 1) == 0)
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INExtensionMatchingErrorDomain"), 3005, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

      goto LABEL_7;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_7:

}

void __76__NSExtension_Intents___intents_matchSiriUISnippetExtensionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__NSExtension_Intents___intents_matchSiriUISnippetExtensionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E2292238;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __76__NSExtension_Intents___intents_matchSiriUISnippetExtensionsWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __75__NSExtension_Intents___intents_matchSiriUIExtensionsForIntent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__NSExtension_Intents___intents_matchSiriUIExtensionsForIntent_completion___block_invoke_2;
  block[3] = &unk_1E2292238;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __75__NSExtension_Intents___intents_matchSiriUIExtensionsForIntent_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __71__NSExtension_Intents___intents_matchUIExtensionsForIntent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NSExtension_Intents___intents_matchUIExtensionsForIntent_completion___block_invoke_2;
  block[3] = &unk_1E2292238;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __71__NSExtension_Intents___intents_matchUIExtensionsForIntent_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

@end
