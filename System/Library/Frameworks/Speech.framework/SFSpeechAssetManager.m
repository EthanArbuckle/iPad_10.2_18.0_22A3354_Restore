@implementation SFSpeechAssetManager

+ (id)systemClientId
{
  return CFSTR("com.apple.siri.embeddedspeech");
}

+ (id)languageCode:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C99DC8];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithLocaleIdentifier:", v4);

    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (BOOL)isLanguageDetectorInstalled
{
  SFEntitledAssetConfig *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = -[SFEntitledAssetConfig initWithLanguage:assetType:]([SFEntitledAssetConfig alloc], "initWithLanguage:assetType:", CFSTR("none"), 6);
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSpeechAssetManager pathToAssetWithConfig:clientIdentifier:](SFSpeechAssetManager, "pathToAssetWithConfig:clientIdentifier:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

+ (void)supportedLanguagesForTaskHint:(int64_t)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  SFLocalSpeechRecognitionClient *v11;
  SFLocalSpeechRecognitionClient *v12;
  id v13;
  _QWORD v14[4];
  SFLocalSpeechRecognitionClient *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = SFEntitledAssetTypeForTaskHint(a3);
  v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)(v6 - 1) > 6)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E6485350[v6 - 1];
    v10 = v9;
    *(_DWORD *)buf = 136315394;
    v18 = "+[SFSpeechAssetManager supportedLanguagesForTaskHint:completion:]";
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B2494000, v8, OS_LOG_TYPE_INFO, "%s Fetching languages of supported %@ assets.", buf, 0x16u);

  }
  v11 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__SFSpeechAssetManager_supportedLanguagesForTaskHint_completion___block_invoke;
  v14[3] = &unk_1E6486430;
  v15 = v11;
  v16 = v5;
  v12 = v11;
  v13 = v5;
  -[SFLocalSpeechRecognitionClient supportedLanguagesForAssetType:completion:](v12, "supportedLanguagesForAssetType:completion:", v6, v14);

}

+ (id)installedLanguagesForTaskHint:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  SFLocalSpeechRecognitionClient *v8;
  id v9;
  _QWORD v11[5];
  _BYTE buf[24];
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = SFEntitledAssetTypeForTaskHint(a3);
  v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    if ((unint64_t)(v3 - 1) > 6)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E6485350[v3 - 1];
    v7 = v6;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[SFSpeechAssetManager installedLanguagesForTaskHint:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1B2494000, v5, OS_LOG_TYPE_INFO, "%s Fetching languages of installed %@ assets.", buf, 0x16u);

  }
  v8 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v13 = __Block_byref_object_copy__2470;
  v14 = __Block_byref_object_dispose__2471;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SFSpeechAssetManager_installedLanguagesForTaskHint___block_invoke;
  v11[3] = &unk_1E6486458;
  v11[4] = buf;
  -[SFLocalSpeechRecognitionClient installedLanguagesForAssetType:synchronous:completion:](v8, "installedLanguagesForAssetType:synchronous:completion:", v3, 1, v11);
  -[SFLocalSpeechRecognitionClient invalidate](v8, "invalidate");
  v9 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v9;
}

+ (void)installedLanguagesForTaskHint:(int64_t)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  SFLocalSpeechRecognitionClient *v11;
  SFLocalSpeechRecognitionClient *v12;
  id v13;
  _QWORD v14[4];
  SFLocalSpeechRecognitionClient *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = SFEntitledAssetTypeForTaskHint(a3);
  v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)(v6 - 1) > 6)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E6485350[v6 - 1];
    v10 = v9;
    *(_DWORD *)buf = 136315394;
    v18 = "+[SFSpeechAssetManager installedLanguagesForTaskHint:completion:]";
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B2494000, v8, OS_LOG_TYPE_INFO, "%s Fetching languages of installed %@ assets.", buf, 0x16u);

  }
  v11 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__SFSpeechAssetManager_installedLanguagesForTaskHint_completion___block_invoke;
  v14[3] = &unk_1E6486480;
  v15 = v11;
  v16 = v5;
  v12 = v11;
  v13 = v5;
  -[SFLocalSpeechRecognitionClient installedLanguagesForAssetType:synchronous:completion:](v12, "installedLanguagesForAssetType:synchronous:completion:", v6, 0, v14);

}

+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  SFLocalSpeechRecognitionClient *v19;
  SFLocalSpeechRecognitionClient *v20;
  id v21;
  _QWORD v22[4];
  SFLocalSpeechRecognitionClient *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = objc_msgSend(v9, "assetType");
    if ((unint64_t)(v15 - 1) > 6)
      v16 = CFSTR("Unknown");
    else
      v16 = off_1E6485350[v15 - 1];
    v17 = v16;
    objc_msgSend(v9, "language");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v26 = "+[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:]";
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_1B2494000, v14, OS_LOG_TYPE_INFO, "%s Client (%@) fetching the %@ asset for: %@", buf, 0x2Au);

  }
  v19 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_progress_completion___block_invoke;
  v22[3] = &unk_1E64864A8;
  v23 = v19;
  v24 = v12;
  v20 = v19;
  v21 = v12;
  -[SFLocalSpeechRecognitionClient downloadAssetsForConfig:clientID:progress:completionHandler:](v20, "downloadAssetsForConfig:clientID:progress:completionHandler:", v9, v10, v11, v22);

}

+ (void)fetchAssetWithConfig:(id)a3 clientIdentifier:(id)a4 detailedProgress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  SFLocalSpeechRecognitionClient *v19;
  SFLocalSpeechRecognitionClient *v20;
  id v21;
  _QWORD v22[4];
  SFLocalSpeechRecognitionClient *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = objc_msgSend(v9, "assetType");
    if ((unint64_t)(v15 - 1) > 6)
      v16 = CFSTR("Unknown");
    else
      v16 = off_1E6485350[v15 - 1];
    v17 = v16;
    objc_msgSend(v9, "language");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v26 = "+[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:]";
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_1B2494000, v14, OS_LOG_TYPE_INFO, "%s Client (%@) fetching the %@ asset for: %@", buf, 0x2Au);

  }
  v19 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_detailedProgress_completion___block_invoke;
  v22[3] = &unk_1E64864A8;
  v23 = v19;
  v24 = v12;
  v20 = v19;
  v21 = v12;
  -[SFLocalSpeechRecognitionClient downloadAssetsForConfig:clientID:detailedProgress:completionHandler:](v20, "downloadAssetsForConfig:clientID:detailedProgress:completionHandler:", v9, v10, v11, v22);

}

+ (id)pathToAssetWithConfig:(id)a3 clientIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  SFLocalSpeechRecognitionClient *v13;
  id v14;
  _QWORD v16[5];
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = objc_msgSend(v5, "assetType");
    if ((unint64_t)(v9 - 1) > 6)
      v10 = CFSTR("Unknown");
    else
      v10 = off_1E6485350[v9 - 1];
    v11 = v10;
    objc_msgSend(v5, "language");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "+[SFSpeechAssetManager pathToAssetWithConfig:clientIdentifier:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v18 = (uint64_t (*)(uint64_t, uint64_t))v11;
    LOWORD(v19) = 2112;
    *(_QWORD *)((char *)&v19 + 2) = v12;
    _os_log_impl(&dword_1B2494000, v8, OS_LOG_TYPE_INFO, "%s Client (%@) fetching the path to the %@ asset for: %@", buf, 0x2Au);

  }
  v13 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = __Block_byref_object_copy__2470;
  *(_QWORD *)&v19 = __Block_byref_object_dispose__2471;
  *((_QWORD *)&v19 + 1) = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__SFSpeechAssetManager_pathToAssetWithConfig_clientIdentifier___block_invoke;
  v16[3] = &unk_1E64864D0;
  v16[4] = buf;
  -[SFLocalSpeechRecognitionClient pathToAssetWithConfig:clientID:completion:](v13, "pathToAssetWithConfig:clientID:completion:", v5, v6, v16);
  -[SFLocalSpeechRecognitionClient invalidate](v13, "invalidate");
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v14;
}

+ (id)configParametersForVoicemailWithLanguage:(id)a3 clientIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  SFLocalSpeechRecognitionClient *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = CFSTR("Assistant");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "+[SFSpeechAssetManager configParametersForVoicemailWithLanguage:clientIdentifier:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v16 = (uint64_t (*)(uint64_t, uint64_t))CFSTR("Assistant");
    LOWORD(v17) = 2112;
    *(_QWORD *)((char *)&v17 + 2) = v5;
    _os_log_impl(&dword_1B2494000, v8, OS_LOG_TYPE_INFO, "%s Client (%@) fetching the voicemail configuration for the %@ asset for: %@", buf, 0x2Au);

  }
  v10 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v16 = __Block_byref_object_copy__2470;
  *(_QWORD *)&v17 = __Block_byref_object_dispose__2471;
  *((_QWORD *)&v17 + 1) = 0;
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__SFSpeechAssetManager_configParametersForVoicemailWithLanguage_clientIdentifier___block_invoke;
  v14[3] = &unk_1E64864F8;
  v14[4] = buf;
  -[SFLocalSpeechRecognitionClient configParametersForVoicemailWithLanguage:clientID:completion:](v10, "configParametersForVoicemailWithLanguage:clientID:completion:", v11, v6, v14);

  -[SFLocalSpeechRecognitionClient invalidate](v10, "invalidate");
  v12 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

+ (void)unsubscribeFromAssetWithConfig:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  SFLocalSpeechRecognitionClient *v15;
  _QWORD v16[5];
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = objc_msgSend(v7, "assetType");
    if ((unint64_t)(v11 - 1) > 6)
      v12 = CFSTR("Unknown");
    else
      v12 = off_1E6485350[v11 - 1];
    v13 = v12;
    objc_msgSend(v7, "language");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "+[SFSpeechAssetManager unsubscribeFromAssetWithConfig:clientIdentifier:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v18 = (uint64_t (*)(uint64_t, uint64_t))v13;
    LOWORD(v19) = 2112;
    *(_QWORD *)((char *)&v19 + 2) = v14;
    _os_log_impl(&dword_1B2494000, v10, OS_LOG_TYPE_INFO, "%s Client (%@) unsubscribing from the %@ asset for: %@", buf, 0x2Au);

  }
  v15 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = __Block_byref_object_copy__2470;
  *(_QWORD *)&v19 = __Block_byref_object_dispose__2471;
  *((_QWORD *)&v19 + 1) = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__SFSpeechAssetManager_unsubscribeFromAssetWithConfig_clientIdentifier_error___block_invoke;
  v16[3] = &unk_1E6486520;
  v16[4] = buf;
  -[SFLocalSpeechRecognitionClient unsubscribeFromAssetWithConfig:clientID:completion:](v15, "unsubscribeFromAssetWithConfig:clientID:completion:", v7, v8, v16);
  -[SFLocalSpeechRecognitionClient invalidate](v15, "invalidate");
  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  _Block_object_dispose(buf, 8);

}

+ (id)subscriptionsForClientIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  SFLocalSpeechRecognitionClient *v5;
  id v6;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[SFSpeechAssetManager subscriptionsForClientIdentifier:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "%s Client (%@) fetching all of their subscriptions.", buf, 0x16u);
  }
  v5 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__2470;
  v11 = __Block_byref_object_dispose__2471;
  v12 = (id)MEMORY[0x1E0C9AA60];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__SFSpeechAssetManager_subscriptionsForClientIdentifier___block_invoke;
  v8[3] = &unk_1E6486548;
  v8[4] = buf;
  -[SFLocalSpeechRecognitionClient subscriptionsForClientId:completion:](v5, "subscriptionsForClientId:completion:", v3, v8);
  -[SFLocalSpeechRecognitionClient invalidate](v5, "invalidate");
  v6 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v6;
}

+ (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  SFLocalSpeechRecognitionClient *v17;
  SFLocalSpeechRecognitionClient *v18;
  id v19;
  _QWORD v20[4];
  SFLocalSpeechRecognitionClient *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    if (v6)
      v11 = CFSTR("enabling");
    else
      v11 = CFSTR("disabling");
    v12 = v10;
    v13 = objc_msgSend(v7, "assetType");
    if ((unint64_t)(v13 - 1) > 6)
      v14 = CFSTR("Unknown");
    else
      v14 = off_1E6485350[v13 - 1];
    v15 = v14;
    objc_msgSend(v7, "language");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v24 = "+[SFSpeechAssetManager setPurgeabilityForAssetWithConfig:purgeable:completion:]";
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_1B2494000, v12, OS_LOG_TYPE_INFO, "%s Client (%@) %@ purgeability for the %@ asset for: %@", buf, 0x34u);

  }
  v17 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__SFSpeechAssetManager_setPurgeabilityForAssetWithConfig_purgeable_completion___block_invoke;
  v20[3] = &unk_1E6486570;
  v21 = v17;
  v22 = v8;
  v18 = v17;
  v19 = v8;
  -[SFLocalSpeechRecognitionClient setPurgeabilityForAssetWithConfig:purgeable:clientID:completion:](v18, "setPurgeabilityForAssetWithConfig:purgeable:clientID:completion:", v7, v6, v9, v20);

}

+ (void)setAssetsPurgeability:(BOOL)a3 forLanguages:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SFEntitledAssetConfig *v14;
  __CFString *v15;
  SFEntitledAssetConfig *v16;
  NSObject *v17;
  __CFString *v18;
  id v19;
  id v20;
  id obj;
  _QWORD block[4];
  __CFString *v23;
  id v24;
  _QWORD *v25;
  BOOL v26;
  _QWORD v27[4];
  __CFString *v28;
  SFEntitledAssetConfig *v29;
  NSObject *v30;
  _QWORD *v31;
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[3];
  char v38;
  _BYTE v39[128];
  uint64_t v40;

  v6 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20 = a5;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 1;
  v8 = CFSTR("Assistant");
  v9 = dispatch_group_create();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v12);
        dispatch_group_enter(v9);
        v14 = -[SFEntitledAssetConfig initWithAssetType:language:regionId:]([SFEntitledAssetConfig alloc], "initWithAssetType:language:regionId:", 3, v13, 0);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __70__SFSpeechAssetManager_setAssetsPurgeability_forLanguages_completion___block_invoke;
        v27[3] = &unk_1E6486598;
        v31 = v37;
        v32 = v6;
        v15 = CFSTR("Assistant");
        v28 = CFSTR("Assistant");
        v16 = v14;
        v29 = v16;
        v30 = v9;
        +[SFSpeechAssetManager setPurgeabilityForAssetWithConfig:purgeable:completion:](SFSpeechAssetManager, "setPurgeabilityForAssetWithConfig:purgeable:completion:", v16, v6, v27);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v10);
  }

  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SFSpeechAssetManager_setAssetsPurgeability_forLanguages_completion___block_invoke_24;
  block[3] = &unk_1E64865C8;
  v26 = v6;
  v24 = v20;
  v25 = v37;
  v23 = CFSTR("Assistant");
  v18 = CFSTR("Assistant");
  v19 = v20;
  dispatch_group_notify(v9, v17, block);

  _Block_object_dispose(v37, 8);
}

+ (void)setAssetsPurgeability:(BOOL)a3 forLanguages:(id)a4 error:(id *)a5
{
  +[SFSpeechAssetManager setAssetsPurgeability:forLanguages:completion:](SFSpeechAssetManager, "setAssetsPurgeability:forLanguages:completion:", a3, a4, 0);
}

+ (id)installedLanguages
{
  return +[SFSpeechAssetManager installedLanguagesForTaskHint:](SFSpeechAssetManager, "installedLanguagesForTaskHint:", 0);
}

+ (void)installedLanguagesWithCompletion:(id)a3
{
  +[SFSpeechAssetManager installedLanguagesForTaskHint:completion:](SFSpeechAssetManager, "installedLanguagesForTaskHint:completion:", 0, a3);
}

+ (void)fetchLanguageDetectorAssetsForClientIdentifier:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  SFEntitledAssetConfig *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SFEntitledAssetConfig initWithLanguage:assetType:]([SFEntitledAssetConfig alloc], "initWithLanguage:assetType:", CFSTR("none"), 6);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v10, v9, v8, v7);

}

+ (void)fetchAssetsForLanguage:(id)a3 taskHint:(int64_t)a4 clientIdentifier:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  SFEntitledAssetConfig *v15;
  void *v16;
  SFEntitledAssetConfig *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SFEntitledAssetConfig initWithLanguage:assetType:](v15, "initWithLanguage:assetType:", v16, SFEntitledAssetTypeForTaskHint(a4));
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v17, v13, v12, v11);

}

+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SFEntitledAssetConfig *v13;
  void *v14;
  SFEntitledAssetConfig *v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v13, "initWithLanguage:taskHint:", v14, 0);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v15, v11, v10, v9);

}

+ (void)fetchAssetsForLanguage:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  SFEntitledAssetConfig *v10;
  void *v11;
  SFEntitledAssetConfig *v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v10 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v10, "initWithLanguage:taskHint:", v11, 0);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v12, v13, v8, v7);

}

+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 forceUpgrade:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  id v9;
  id v10;
  id v11;
  SFEntitledAssetConfig *v12;
  void *v13;
  SFEntitledAssetConfig *v14;
  id v15;

  v9 = a7;
  v10 = a6;
  v11 = a3;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v12, "initWithLanguage:taskHint:", v13, 0);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v14, v15, v10, v9);

}

+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 progress:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  SFEntitledAssetConfig *v11;
  void *v12;
  SFEntitledAssetConfig *v13;
  id v14;

  v8 = a6;
  v9 = a5;
  v10 = a3;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v11, "initWithLanguage:taskHint:", v12, 0);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v13, v14, v9, v8);

}

+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 urgent:(BOOL)a5 forceUpgrade:(BOOL)a6 progress:(id)a7 completion:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  SFEntitledAssetConfig *v15;
  void *v16;
  SFEntitledAssetConfig *v17;

  v11 = a8;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v15, "initWithLanguage:taskHint:", v16, 0);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v17, v13, v12, v11);

}

+ (void)fetchAssetsForLanguage:(id)a3 urgent:(BOOL)a4 forceUpgrade:(BOOL)a5 detailedProgress:(id)a6 completion:(id)a7
{
  id v9;
  id v10;
  id v11;
  SFEntitledAssetConfig *v12;
  void *v13;
  SFEntitledAssetConfig *v14;
  id v15;

  v9 = a7;
  v10 = a6;
  v11 = a3;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v12, "initWithLanguage:taskHint:", v13, 0);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:", v14, v15, v10, v9);

}

+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 detailedProgress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SFEntitledAssetConfig *v13;
  void *v14;
  SFEntitledAssetConfig *v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v13, "initWithLanguage:taskHint:", v14, 0);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:", v15, v11, v10, v9);

}

+ (void)fetchAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 urgent:(BOOL)a5 forceUpgrade:(BOOL)a6 detailedProgress:(id)a7 completion:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  SFEntitledAssetConfig *v15;
  void *v16;
  SFEntitledAssetConfig *v17;

  v11 = a8;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v15, "initWithLanguage:taskHint:", v16, 0);
  +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:detailedProgress:completion:", v17, v13, v12, v11);

}

+ (id)assetPathForConfig:(id)a3 clientIdentifier:(id)a4
{
  return +[SFSpeechAssetManager pathToAssetWithConfig:clientIdentifier:](SFSpeechAssetManager, "pathToAssetWithConfig:clientIdentifier:", a3, a4);
}

+ (id)assetPathForLanguage:(id)a3 clientIdentifier:(id)a4
{
  id v5;
  id v6;
  SFEntitledAssetConfig *v7;
  void *v8;
  SFEntitledAssetConfig *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v7, "initWithLanguage:taskHint:", v8, 0);
  +[SFSpeechAssetManager pathToAssetWithConfig:clientIdentifier:](SFSpeechAssetManager, "pathToAssetWithConfig:clientIdentifier:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)assetPathForLanguage:(id)a3
{
  id v3;
  void *v4;
  SFEntitledAssetConfig *v5;
  void *v6;
  SFEntitledAssetConfig *v7;
  void *v8;

  v3 = a3;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v5, "initWithLanguage:taskHint:", v6, 0);
  +[SFSpeechAssetManager pathToAssetWithConfig:clientIdentifier:](SFSpeechAssetManager, "pathToAssetWithConfig:clientIdentifier:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)purgeAssetsForLanguage:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  SFEntitledAssetConfig *v9;
  void *v10;
  SFEntitledAssetConfig *v11;

  v7 = a4;
  v8 = a3;
  v9 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v9, "initWithLanguage:taskHint:", v10, 0);
  +[SFSpeechAssetManager unsubscribeFromAssetWithConfig:clientIdentifier:error:](SFSpeechAssetManager, "unsubscribeFromAssetWithConfig:clientIdentifier:error:", v11, v7, a5);

}

+ (void)purgeAssetsForLanguage:(id)a3 error:(id *)a4
{
  id v5;
  SFEntitledAssetConfig *v6;
  void *v7;
  SFEntitledAssetConfig *v8;
  id v9;

  v5 = a3;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [SFEntitledAssetConfig alloc];
  +[SFSpeechAssetManager languageCode:](SFSpeechAssetManager, "languageCode:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SFEntitledAssetConfig initWithLanguage:taskHint:](v6, "initWithLanguage:taskHint:", v7, 0);
  +[SFSpeechAssetManager unsubscribeFromAssetWithConfig:clientIdentifier:error:](SFSpeechAssetManager, "unsubscribeFromAssetWithConfig:clientIdentifier:error:", v8, v9, a4);

}

+ (id)configParametersForVoicemailWithLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSpeechAssetManager configParametersForVoicemailWithLanguage:clientIdentifier:](SFSpeechAssetManager, "configParametersForVoicemailWithLanguage:clientIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __70__SFSpeechAssetManager_setAssetsPurgeability_forLanguages_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v4 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(a1 + 64))
        v5 = CFSTR("enable");
      else
        v5 = CFSTR("disable");
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(a1 + 40);
      v8 = v4;
      objc_msgSend(v6, "language");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136316162;
      v11 = "+[SFSpeechAssetManager setAssetsPurgeability:forLanguages:completion:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_error_impl(&dword_1B2494000, v8, OS_LOG_TYPE_ERROR, "%s Failed to %@ purgeability for %@ asset with language: %@, error: %@", (uint8_t *)&v10, 0x34u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __70__SFSpeechAssetManager_setAssetsPurgeability_forLanguages_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v3)
        v6 = CFSTR("Failed to enable purgeability for one or more %@ assets.");
      else
        v6 = CFSTR("Failed to disable purgeability for one or more %@ assets.");
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E6486C88, CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 1, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __79__SFSpeechAssetManager_setPurgeabilityForAssetWithConfig_purgeable_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __57__SFSpeechAssetManager_subscriptionsForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__SFSpeechAssetManager_unsubscribeFromAssetWithConfig_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __82__SFSpeechAssetManager_configParametersForVoicemailWithLanguage_clientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__SFSpeechAssetManager_pathToAssetWithConfig_clientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __90__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_detailedProgress_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __82__SFSpeechAssetManager_fetchAssetWithConfig_clientIdentifier_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __65__SFSpeechAssetManager_installedLanguagesForTaskHint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __54__SFSpeechAssetManager_installedLanguagesForTaskHint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __65__SFSpeechAssetManager_supportedLanguagesForTaskHint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
