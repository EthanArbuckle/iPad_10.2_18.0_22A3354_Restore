@implementation AXLTLanguageAssetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)sharedInstance_languageAssetManager;
}

void __42__AXLTLanguageAssetManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_languageAssetManager;
  sharedInstance_languageAssetManager = v0;

}

- (void)languageAssetAvaliableForTaskHint:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a4;
  AXLogLiveTranscription();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AXLTLanguageAssetManager languageAssetAvaliableForTaskHint:completion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  v15 = (void *)MEMORY[0x24BDE9E10];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__AXLTLanguageAssetManager_languageAssetAvaliableForTaskHint_completion___block_invoke;
  v17[3] = &unk_24F874EC0;
  v17[4] = self;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "installedLanguagesForTaskHint:completion:", a3, v17);

}

void __73__AXLTLanguageAssetManager_languageAssetAvaliableForTaskHint_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "locale");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v6);
  }
}

- (void)downloadSpeechAssetForTaskHint:(int64_t)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke;
  v12[3] = &unk_24F874F38;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  -[AXLTLanguageAssetManager languageAssetAvaliableForTaskHint:completion:](self, "languageAssetAvaliableForTaskHint:completion:", a3, v12);

}

void __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  if ((a2 & 1) == 0)
  {
    AXLogLiveTranscription();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = objc_alloc(MEMORY[0x24BDE9E00]);
    objc_msgSend(*(id *)(a1 + 32), "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithLanguage:taskHint:", v13, *(_QWORD *)(a1 + 56));

    v15 = MEMORY[0x24BDAC760];
    v16 = (void *)MEMORY[0x24BDE9E10];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_183;
    v19[3] = &unk_24F874EE8;
    v20 = *(id *)(a1 + 40);
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_2;
    v17[3] = &unk_24F874F10;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v16, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v14, CFSTR("AccessibilityLiveCaptions"), v19, v17);

  }
}

uint64_t __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_183(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)deleteSpeechAssetForTaskHint:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__AXLTLanguageAssetManager_deleteSpeechAssetForTaskHint___block_invoke;
  v3[3] = &unk_24F874F60;
  v3[4] = self;
  v3[5] = a3;
  -[AXLTLanguageAssetManager languageAssetAvaliableForTaskHint:completion:](self, "languageAssetAvaliableForTaskHint:completion:", a3, v3);
}

void __57__AXLTLanguageAssetManager_deleteSpeechAssetForTaskHint___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  if (a2)
  {
    AXLogLiveTranscription();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __57__AXLTLanguageAssetManager_deleteSpeechAssetForTaskHint___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = objc_alloc(MEMORY[0x24BDE9E00]);
    objc_msgSend(*(id *)(a1 + 32), "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithLanguage:taskHint:", v13, *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x24BDE9E10], "unsubscribeFromAssetWithConfig:clientIdentifier:error:", v14, CFSTR("AccessibilityLiveCaptions"), 0);
  }
}

- (NSLocale)locale
{
  return (NSLocale *)objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en-US"));
}

- (void)languageAssetAvaliableForTaskHint:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D27A000, a1, a3, "AssetManager: Requesting supported languages", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D27A000, a1, a3, "AssetManager: Downloading speech assets", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __57__AXLTLanguageAssetManager_deleteSpeechAssetForTaskHint___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D27A000, a1, a3, "AssetManager: Unsubscribing from speech asset", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
