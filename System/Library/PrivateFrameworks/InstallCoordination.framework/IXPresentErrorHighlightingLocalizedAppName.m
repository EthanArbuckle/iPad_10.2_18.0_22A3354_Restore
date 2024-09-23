@implementation IXPresentErrorHighlightingLocalizedAppName

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  id v34;

  IXFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("DismissOnLock"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SBUserNotificationAllowMenuButtonDismissal"));
  IXLocalizedTitleForFirstAppName(*(void **)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C9B800]);

  v6 = *(_QWORD *)(a1 + 80);
  if (v6 == 16)
    IXLocalizedBodyForOSVersionError(*(void **)(a1 + 40), *(void **)(a1 + 32), *(_QWORD *)(a1 + 72));
  else
    IXLocalizedBodyForFirstAppName(*(void **)(a1 + 32), *(_QWORD *)(a1 + 72), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C9B810]);

  v8 = MEMORY[0x1E0C809B0];
  switch(*(_QWORD *)(a1 + 80))
  {
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xDLL:
    case 0xFLL:
    case 0x11:
    case 0x12:
      if (*(_QWORD *)(a1 + 72) != 1)
        goto LABEL_10;
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_DELETE"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9B838]);

      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4DD8310, CFSTR("SBUserNotificationDefaultButtonPresentationStyle"));
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_KEEP"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9B830]);

      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __IXPresentErrorHighlightingLocalizedAppName_block_invoke_68;
      v28[3] = &unk_1E4DC3E68;
      v29 = *(id *)(a1 + 64);
      v11 = (void *)MEMORY[0x1A85A58E8](v28);
      v12 = v29;
      goto LABEL_7;
    case 0xALL:
      if (*(_QWORD *)(a1 + 72) != 1)
        goto LABEL_10;
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_VIEW_IN_APP_STORE"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C9B838]);

      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_OK"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B830]);

      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2_71;
      v24[3] = &unk_1E4DC3EB8;
      v27 = *(_QWORD *)(a1 + 72);
      v25 = *(id *)(a1 + 48);
      v26 = *(id *)(a1 + 56);
      v11 = (void *)MEMORY[0x1A85A58E8](v24);

      v12 = v25;
LABEL_7:

      break;
    case 0xBLL:
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_SETTINGS"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0C9B838]);

      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_OK"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0C9B830]);

      v11 = &__block_literal_global_52;
      break;
    case 0x10:
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_SETTINGS"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0C9B838]);

      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_OK"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0C9B830]);

      v11 = &__block_literal_global_58;
      break;
    default:
LABEL_10:
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUTTON_TITLE_OK"), &stru_1E4DC66E0, CFSTR("IXUserPresentableErrors"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C9B838]);

      v11 = 0;
      break;
  }
  if (*(_QWORD *)(a1 + 72) == 1)
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", 0);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%lu bundleIDs>"), *(_QWORD *)(a1 + 72));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = ___ShowUserNotice_block_invoke;
  block[3] = &unk_1E4DC3F08;
  v31 = v3;
  v32 = v16;
  v33 = v11;
  v34 = 0;
  v17 = v11;
  v18 = v3;
  v19 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2()
{
  void *v0;
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=STORAGE_MGMT"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v2 = objc_msgSend(v1, "openSensitiveURL:withOptions:error:", v0, 0, &v5);
  v3 = v5;

  if ((v2 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2_cold_1();

  }
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_57()
{
  void *v0;
  void *v1;
  char v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

  if ((v2 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "IXPresentErrorHighlightingLocalizedAppName_block_invoke";
      _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to open software update Settings", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t __IXPresentErrorHighlightingLocalizedAppName_block_invoke_68(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2_71(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == 1
    && (v2 = *(void **)(a1 + 32)) != 0
    && (objc_msgSend(v2, "iTunesMetadata"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "storeItemIdentifier"),
        v3,
        v4))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("action"), CFSTR("lookup"));
    v7 = objc_alloc(MEMORY[0x1E0CB39D8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("ids"), v8);

    objc_msgSend(v5, "setScheme:", CFSTR("itms-apps"));
    objc_msgSend(v5, "setHost:", &stru_1E4DC66E0);
    v15[0] = v6;
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setQueryItems:", v10);

    objc_msgSend(v5, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __IXPresentErrorHighlightingLocalizedAppName_block_invoke_3;
    v13[3] = &unk_1E4DC3E90;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v12, "openURL:configuration:completionHandler:", v11, 0, v13);

  }
  else
  {
    _LaunchAppStore();
  }
}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315650;
      v8 = "IXPresentErrorHighlightingLocalizedAppName_block_invoke_3";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to open app with bundle ID %@ in the App Store. Error: %@", (uint8_t *)&v7, 0x20u);

    }
  }

}

void __IXPresentErrorHighlightingLocalizedAppName_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to open Settings : %@", v2, v3, v4, v5, 2u);
}

@end
