@implementation AXSpeechSettingsModelController

- (AXSpeechSettingsModelController)init
{
  AXSpeechSettingsModelController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSpeechSettingsModelController;
  v2 = -[AXSpeechSettingsModelController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpeechSettingsModelController setDownloadProgessByVoiceID:](v2, "setDownloadProgessByVoiceID:", v3);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpeechSettingsModelController setStoppedVoiceIds:](v2, "setStoppedVoiceIds:", v4);

    objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXSpeechSettingsModelController;
  -[AXSpeechSettingsModelController dealloc](&v4, sel_dealloc);
}

- (AXAssetsService)assetsService
{
  AXAssetsService *assetsService;
  AXAssetsService *v4;
  AXAssetsService *v5;

  assetsService = self->_assetsService;
  if (!assetsService)
  {
    v4 = (AXAssetsService *)objc_alloc_init(MEMORY[0x1E0CF2D80]);
    v5 = self->_assetsService;
    self->_assetsService = v4;

    assetsService = self->_assetsService;
  }
  return assetsService;
}

- (void)refreshAssetCatalog:(BOOL)a3 downloadSamplesIfNeeded:(BOOL)a4 restartMigrationIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a5;
  v6 = a4;
  if ((_checkedForCatalogUpdate & 1) == 0)
  {
    AXLogSpeechAssetDownload();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD892000, v7, OS_LOG_TYPE_INFO, "TTSAXResourceManager resource catalog may have an update. Attempting to force refresh catalog now", buf, 2u);
    }

    if (_AXCheckForCatalogUpdate_onceToken == -1)
    {
      if (v6)
        goto LABEL_9;
    }
    else
    {
      dispatch_once(&_AXCheckForCatalogUpdate_onceToken, &__block_literal_global_255);
      if (v6)
        goto LABEL_9;
    }
LABEL_3:
    if (!v5)
      return;
    goto LABEL_12;
  }
  if (!a4)
    goto LABEL_3;
LABEL_9:
  AXLogSpeechAssetDownload();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1BD892000, v8, OS_LOG_TYPE_INFO, "TTSAXResourceManager. Will download samples if needed", v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "downloadSamplesIfNecessary");

  if (v5)
  {
LABEL_12:
    AXLogSpeechAssetDownload();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1BD892000, v10, OS_LOG_TYPE_INFO, "TTSAXResourceMigrationUtilities. Resources may not have completed migration, attmpting to restart if needed", v12, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DBEF10], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "restartMigrationIfNeeded");

  }
}

- (void)addVoiceFootprintsToArray:(id)a3 dialect:(id)a4 selectedVoiceId:(id)a5 showSiriNeuralVoices:(BOOL)a6 showNeuralAXVoices:(BOOL)a7
{
  AXAddVoiceFootprintsToArrayForDialect(a3, a4, a5, a6, a7);
}

- (id)resourceWithVoiceId:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DBEF08];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceWithVoiceId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getAllResources
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcesWithType:subType:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resetResourcesCache
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetResourcesCache");

}

- (id)voiceIdentifierForLiveSpeechKeyboardID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveSpeechVoiceIdentifierForKeyboardID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[AXSpeechSettingsModelController selectedVoiceIdentifierForSpeechSourceKey:languageCode:](self, "selectedVoiceIdentifierForSpeechSourceKey:languageCode:", *MEMORY[0x1E0CF37D0], v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3
{
  return -[AXSpeechSettingsModelController selectedVoiceIdentifierForSpeechSourceKey:languageCode:](self, "selectedVoiceIdentifierForSpeechSourceKey:languageCode:", a3, 0);
}

- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3 languageCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dialectForSystemLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "langMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10 = v6;
  }
  else
  {
    objc_msgSend(v9, "generalLanguageID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXCLanguageCanonicalFormToGeneralLanguage();
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v10, v5, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24 && objc_msgSend(v10, "hasPrefix:", CFSTR("zh")))
  {
    objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "languageIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "hasPrefix:", CFSTR("zh")))
    {
      objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v16, v5, 0);
      v18 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v18;
    }

  }
  objc_msgSend(MEMORY[0x1E0DBEF10], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertIdentifierIfNeeded:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v19, "isMigrationComplete") & 1) != 0)
  {
    v21 = v20;
  }
  else
  {
    objc_msgSend(v19, "updatedIdentifierForLegacyIdentifier:withLanguageCode:", v20, v10);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  return v22;
}

- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4
{
  -[AXSpeechSettingsModelController updateSelectedVoiceIdentifier:forSpeechSourceKey:languageCode:](self, "updateSelectedVoiceIdentifier:forSpeechSourceKey:languageCode:", a3, a4, 0);
}

- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4 languageCode:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceWithVoiceId:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dialectForSystemLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "langMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15 = v9;
  }
  else
  {
    objc_msgSend(v14, "generalLanguageID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AXCLanguageCanonicalFormToGeneralLanguage();
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  AXLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v14, "generalLanguageID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "speechVoice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v15;
    v34 = 2112;
    v35 = v18;
    v36 = 2112;
    v37 = v20;
    _os_log_impl(&dword_1BD892000, v17, OS_LOG_TYPE_INFO, "AXSpeechSettingsUISupport: Updating selected voice identifier for key: %@, languageCode: %@, updatedLanguageCode: %@, generalLanguageID: %@, identifier: %@", buf, 0x34u);

  }
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "speechVoice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSpeechVoiceIdentifier:forLanguage:sourceKey:", v23, v15, v8);

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUserDidSelectVoiceForLanguage:sourceKey:", v15, v8);

  if (objc_msgSend(v11, "type") == 3 || objc_msgSend(v11, "type") == 7)
  {
    -[AXSpeechSettingsModelController assetsService](self, "assetsService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "informSiriVoiceSubscriptionsWithVoiceId:addition:", v7, 1);

  }
  if (objc_msgSend(v11, "type") == 4 && objc_msgSend(v11, "footprint") == 3)
  {
    objc_msgSend(MEMORY[0x1E0DBEF10], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "downloadCompactResourceIfNeededForIdentifier:", v7);

  }
}

- (void)startDownloadForResource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DBEF08];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "downloadResourceWithVoiceId:", v5);
}

- (void)stopDownloadForResource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DBEF08];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stopDownloadResourceWithVoiceId:", v5);
}

- (void)deleteResource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DBEF08];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deleteResourceWithVoiceId:", v5);
}

- (BOOL)isResourceUserDeletable:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  void *v10;
  void *v11;
  float v12;
  NSObject *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isInstalled") & 1) != 0)
  {
    objc_msgSend(v4, "speechVoice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canBeDownloaded");

    if ((v6 & 1) != 0)
    {
      if (AXResourceActivelyUsed())
      {
        AXLogSpeechAssetDownload();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[AXSpeechSettingsModelController isResourceUserDeletable:].cold.1(v4);
      }
      else
      {
        -[AXSpeechSettingsModelController downloadProgessByVoiceID](self, "downloadProgessByVoiceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "voiceId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v7 = objc_claimAutoreleasedReturnValue();

        if (!v7 || (-[NSObject floatValue](v7, "floatValue"), v12 >= 1.0))
        {
          v8 = 1;
          goto LABEL_11;
        }
        AXLogSpeechAssetDownload();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[AXSpeechSettingsModelController isResourceUserDeletable:].cold.2(v4);

      }
    }
    else
    {
      AXLogSpeechAssetDownload();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[AXSpeechSettingsModelController isResourceUserDeletable:].cold.3(v4);
    }
  }
  else
  {
    AXLogSpeechAssetDownload();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AXSpeechSettingsModelController isResourceUserDeletable:].cold.4(v4);
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)hasAnyUserDeletableResources:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[AXSpeechSettingsModelController isResourceUserDeletable:](self, "isResourceUserDeletable:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)updateDownloadProgressFromNPS:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  -[AXSpeechSettingsModelController downloadProgessByVoiceID](self, "downloadProgessByVoiceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToDictionary:", v7);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    -[AXSpeechSettingsModelController setDownloadProgessByVoiceID:](self, "setDownloadProgessByVoiceID:", v6);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__AXSpeechSettingsModelController_updateDownloadProgressFromNPS___block_invoke;
    v8[3] = &unk_1E76AC108;
    v8[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
  }

}

void __65__AXSpeechSettingsModelController_updateDownloadProgressFromNPS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double Current;
  double v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, float);
  float v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  float v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  id v23;

  v23 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "valueForKey:", v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (Current = CFAbsoluteTimeGetCurrent(), objc_msgSend(v6, "doubleValue"), Current - v8 >= 5.0))
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceWithVoiceId:", v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "downloadProgressForVoiceIdCallback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "downloadProgressForVoiceIdCallback");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, float))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "floatValue");
      v13 = v12;
      objc_msgSend(v9, "voiceAsset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, uint64_t, uint64_t, float))v11)[2](v11, v23, objc_msgSend(v14, "fileSize"), 1, v13);

    }
    objc_msgSend(v5, "floatValue");
    if (v15 == 1.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishedDownloadingResourceCallback");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 32), "finishedDownloadingResourceCallback");
        v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v17)[2](v17, v9, 0);

      }
    }
    objc_msgSend(v5, "floatValue");
    if (v18 == 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishedDownloadingResourceCallback");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(*(id *)(a1 + 32), "finishedDownloadingResourceCallback");
        v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, uint64_t))v20)[2](v20, v9, 1);

      }
      objc_msgSend(*(id *)(a1 + 32), "finishedDeletingResourceCallback");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(*(id *)(a1 + 32), "finishedDeletingResourceCallback");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v22)[2](v22, v9);

      }
    }

  }
}

- (AVAudioSession)audioSessionForSamplePlayback
{
  AVAudioSession *audioSessionForSamplePlayback;
  AVAudioSession *v4;
  AVAudioSession *v5;
  AVAudioSession *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v12;

  audioSessionForSamplePlayback = self->_audioSessionForSamplePlayback;
  if (!audioSessionForSamplePlayback)
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
    v4 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    v5 = self->_audioSessionForSamplePlayback;
    self->_audioSessionForSamplePlayback = v4;

    v6 = self->_audioSessionForSamplePlayback;
    v7 = *MEMORY[0x1E0C89690];
    v8 = *MEMORY[0x1E0C89748];
    v12 = 0;
    -[AVAudioSession setCategory:mode:options:error:](v6, "setCategory:mode:options:error:", v7, v8, 1, &v12);
    v9 = v12;
    if (v9)
    {
      AXTTSLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AXSpeechSettingsModelController audioSessionForSamplePlayback].cold.1();

    }
    audioSessionForSamplePlayback = self->_audioSessionForSamplePlayback;
  }
  return audioSessionForSamplePlayback;
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  AVSpeechSynthesizer *speechSynthesizer;
  AVSpeechSynthesizer *v4;
  AVSpeechSynthesizer *v5;

  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    v4 = (AVSpeechSynthesizer *)objc_alloc_init(MEMORY[0x1E0C89B98]);
    v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    -[AVSpeechSynthesizer setIsInternalSynth:](self->_speechSynthesizer, "setIsInternalSynth:", 1);
    -[AVSpeechSynthesizer setUsesApplicationAudioSession:](self->_speechSynthesizer, "setUsesApplicationAudioSession:", 0);
    speechSynthesizer = self->_speechSynthesizer;
  }
  return speechSynthesizer;
}

- (void)playSampleForResource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__AXSpeechSettingsModelController_playSampleForResource_completion___block_invoke;
  v12[3] = &unk_1E76AC158;
  objc_copyWeak(&v15, &location);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v8, "sampleURLForVoiceId:completion:", v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __68__AXSpeechSettingsModelController_playSampleForResource_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AXSpeechSettingsModelController_playSampleForResource_completion___block_invoke_2;
  v5[3] = &unk_1E76AC130;
  objc_copyWeak(&v9, a1 + 6);
  v6 = a1[4];
  v7 = v3;
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __68__AXSpeechSettingsModelController_playSampleForResource_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_playSampleForResource:url:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_playSampleForResource:(id)a3 url:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  AVAudioPlayer *v16;
  id v17;
  AVAudioPlayer *audioPlayer;
  void *v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (!v9)
  {
    AXTTSLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AXSpeechSettingsModelController _playSampleForResource:url:completion:].cold.2();
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject path](v9, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  AXTTSLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AXSpeechSettingsModelController _playSampleForResource:url:completion:].cold.5(v8, v15);
LABEL_12:

    v22 = (void *)MEMORY[0x1E0C89B88];
    objc_msgSend(v8, "voiceId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_voiceFromInternalVoiceListWithIdentifier:", v23);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0DBEF30], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "speechVoice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sampleStringForVoiceIdentifier:", v26);
      v27 = objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        AXUILocalizedStringForKey(CFSTR("SAMPLE_STRING"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringWithFormat:", v29, v30);
        v27 = objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0C89BA8], "speechUtteranceWithString:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setVoice:", v17);
      AXTTSLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v27;
        v37 = 2112;
        v38 = v17;
        _os_log_impl(&dword_1BD892000, v32, OS_LOG_TYPE_INFO, "Will synthesize voice sample '%@'. voice: %@", buf, 0x16u);
      }

      -[AXSpeechSettingsModelController speechSynthesizer](self, "speechSynthesizer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "speakUtterance:", v31);

    }
    else
    {
      AXTTSLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[AXSpeechSettingsModelController _playSampleForResource:url:completion:].cold.1(v8, v27);
    }

    goto LABEL_26;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v9;
    _os_log_impl(&dword_1BD892000, v15, OS_LOG_TYPE_DEFAULT, "Will play voice sample at URL: %@", buf, 0xCu);
  }

  v34 = 0;
  v16 = (AVAudioPlayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC8]), "initWithContentsOfURL:error:", v9, &v34);
  v17 = v34;
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = v16;

  -[AXSpeechSettingsModelController audioSessionForSamplePlayback](self, "audioSessionForSamplePlayback");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioPlayer setAudioSession:](self->_audioPlayer, "setAudioSession:", v19);

  LODWORD(v20) = 1.0;
  -[AVAudioPlayer setVolume:](self->_audioPlayer, "setVolume:", v20);
  if (v17)
  {
    AXTTSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AXSpeechSettingsModelController _playSampleForResource:url:completion:].cold.4();
  }
  else
  {
    if (-[AVAudioPlayer prepareToPlay](self->_audioPlayer, "prepareToPlay"))
    {
      -[AVAudioPlayer play](self->_audioPlayer, "play");
      goto LABEL_26;
    }
    AXTTSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AXSpeechSettingsModelController _playSampleForResource:url:completion:].cold.3(v21);
  }

LABEL_26:
  if (v10)
    v10[2](v10);

}

- (BOOL)allowedToDownload
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getAXSettingsVoiceAssetManagerClass_softClass;
  v11 = getAXSettingsVoiceAssetManagerClass_softClass;
  if (!getAXSettingsVoiceAssetManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getAXSettingsVoiceAssetManagerClass_block_invoke;
    v7[3] = &unk_1E76AB358;
    v7[4] = &v8;
    __getAXSettingsVoiceAssetManagerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowedToDownloadVoiceAssets");

  return v5;
}

- (void)downloadProgressForVoiceId:(id)a3 progress:(float)a4 storageSize:(int64_t)a5 requiredDiskSpace:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  NSObject *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, float);
  int v17;
  id v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v6 = a6;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  AXLogSpeechAssetDownload();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543874;
    v18 = v10;
    v19 = 2048;
    v20 = a4;
    v21 = 2048;
    v22 = a5;
    _os_log_impl(&dword_1BD892000, v11, OS_LOG_TYPE_DEFAULT, "Download progress: %{public}@ progress: %f size: %lld", (uint8_t *)&v17, 0x20u);
  }

  *(float *)&v12 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsModelController downloadProgessByVoiceID](self, "downloadProgessByVoiceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v10);

  -[AXSpeechSettingsModelController downloadProgressForVoiceIdCallback](self, "downloadProgressForVoiceIdCallback");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AXSpeechSettingsModelController downloadProgressForVoiceIdCallback](self, "downloadProgressForVoiceIdCallback");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, float))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, int64_t, _BOOL8, float))v16)[2](v16, v10, a5, v6, a4);

  }
}

- (void)finishedDownloadingResource:(id)a3 wasCancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  int v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "voiceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
      v8 = &unk_1E76C2288;
    else
      v8 = &unk_1E76C22A0;
    -[AXSpeechSettingsModelController downloadProgessByVoiceID](self, "downloadProgessByVoiceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "voiceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  if (objc_msgSend(v6, "type") == 3)
  {
    -[AXSpeechSettingsModelController assetsService](self, "assetsService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "voiceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "informSiriVoiceSubscriptionsWithVoiceId:addition:", v12, 1);

  }
  AXLogSpeechAssetDownload();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "voiceId");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("Sample asset");
    v17 = CFSTR("finished successfully");
    if (v14)
      v16 = (const __CFString *)v14;
    if (v4)
      v17 = CFSTR("cancelled");
    v20 = 138412546;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_1BD892000, v13, OS_LOG_TYPE_DEFAULT, "Asset download %@ - reloading specs: %{public}@", (uint8_t *)&v20, 0x16u);

  }
  -[AXSpeechSettingsModelController finishedDownloadingResourceCallback](self, "finishedDownloadingResourceCallback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AXSpeechSettingsModelController finishedDownloadingResourceCallback](self, "finishedDownloadingResourceCallback");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _BOOL8))v19)[2](v19, v6, v4);

  }
}

- (void)finishedDeletingResource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[AXSpeechSettingsModelController downloadProgessByVoiceID](self, "downloadProgessByVoiceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voiceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E76C22B8, v5);

  -[AXSpeechSettingsModelController finishedDeletingResourceCallback](self, "finishedDeletingResourceCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AXSpeechSettingsModelController finishedDeletingResourceCallback](self, "finishedDeletingResourceCallback");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)resourceCacheDidReceiveUpdate
{
  void *v3;
  void (**v4)(void);

  -[AXSpeechSettingsModelController resourceCacheDidReceiveUpdateCallback](self, "resourceCacheDidReceiveUpdateCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXSpeechSettingsModelController resourceCacheDidReceiveUpdateCallback](self, "resourceCacheDidReceiveUpdateCallback");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

+ (void)partitionVoiceFootprints:(id)a3 intoStandardVoices:(id)a4 andNoveltyVoices:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "resources");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isNoveltyVoice");

        if (v17)
          v18 = v9;
        else
          v18 = v8;
        objc_msgSend(v18, "addObject:", v14);
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

+ (void)partitionVoiceFootprints:(id)a3 intoStandardVoices:(id)a4 noveltyVoices:(id)a5 personalVoices:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v24 = a4;
  v10 = a5;
  v11 = a6;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "resources");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isNoveltyVoice");

        v20 = v10;
        if ((v19 & 1) == 0)
        {
          objc_msgSend(v16, "resources");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isPersonalVoice");

          if (v23)
            v20 = v11;
          else
            v20 = v24;
        }
        objc_msgSend(v20, "addObject:", v16);
      }
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

}

- (NSMutableDictionary)downloadProgessByVoiceID
{
  return self->_downloadProgessByVoiceID;
}

- (void)setDownloadProgessByVoiceID:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgessByVoiceID, a3);
}

- (NSMutableDictionary)stoppedVoiceIds
{
  return self->_stoppedVoiceIds;
}

- (void)setStoppedVoiceIds:(id)a3
{
  objc_storeStrong((id *)&self->_stoppedVoiceIds, a3);
}

- (id)downloadProgressForVoiceIdCallback
{
  return self->_downloadProgressForVoiceIdCallback;
}

- (void)setDownloadProgressForVoiceIdCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)finishedDownloadingResourceCallback
{
  return self->_finishedDownloadingResourceCallback;
}

- (void)setFinishedDownloadingResourceCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)finishedDeletingResourceCallback
{
  return self->_finishedDeletingResourceCallback;
}

- (void)setFinishedDeletingResourceCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)resourceCacheDidReceiveUpdateCallback
{
  return self->_resourceCacheDidReceiveUpdateCallback;
}

- (void)setResourceCacheDidReceiveUpdateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)selectedVoiceDidUpdateCallback
{
  return self->_selectedVoiceDidUpdateCallback;
}

- (void)setSelectedVoiceDidUpdateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (void)setAssetsService:(id)a3
{
  objc_storeStrong((id *)&self->_assetsService, a3);
}

- (void)setAudioSessionForSamplePlayback:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionForSamplePlayback, a3);
}

- (void)setSpeechSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_speechSynthesizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_audioSessionForSamplePlayback, 0);
  objc_storeStrong((id *)&self->_assetsService, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong(&self->_selectedVoiceDidUpdateCallback, 0);
  objc_storeStrong(&self->_resourceCacheDidReceiveUpdateCallback, 0);
  objc_storeStrong(&self->_finishedDeletingResourceCallback, 0);
  objc_storeStrong(&self->_finishedDownloadingResourceCallback, 0);
  objc_storeStrong(&self->_downloadProgressForVoiceIdCallback, 0);
  objc_storeStrong((id *)&self->_stoppedVoiceIds, 0);
  objc_storeStrong((id *)&self->_downloadProgessByVoiceID, 0);
}

- (void)isResourceUserDeletable:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "voiceId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BD892000, v2, v3, "Asset '%@' not deletable. Its being actively used", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)isResourceUserDeletable:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "voiceId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BD892000, v2, v3, "Asset '%@' not deletable. Its being downloaded", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)isResourceUserDeletable:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "voiceId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BD892000, v2, v3, "Asset '%@' not deletable. Not downloadable to begin with", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)isResourceUserDeletable:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "voiceId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BD892000, v2, v3, "Asset '%@' not deletable. Not installed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)audioSessionForSamplePlayback
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_1(&dword_1BD892000, v0, v1, "Failed to set up aux session for sample playback: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_playSampleForResource:(void *)a1 url:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "voiceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_1(&dword_1BD892000, a2, v4, "Error, unable to synthesize voice sample for %@. No AVSpeechSynthesisVoice could be created", v5);

  OUTLINED_FUNCTION_9();
}

- (void)_playSampleForResource:url:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_1(&dword_1BD892000, v0, v1, "Error while playing sample. URL was nil. Will attempt to synthesize sample. %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_playSampleForResource:(os_log_t)log url:completion:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD892000, log, OS_LOG_TYPE_ERROR, "failed to prepare audio player", v1, 2u);
}

- (void)_playSampleForResource:url:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_1(&dword_1BD892000, v0, v1, "Error while playing sample: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_playSampleForResource:(void *)a1 url:(NSObject *)a2 completion:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "voiceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_1(&dword_1BD892000, a2, v4, "Error, unable to find sample URL for %@, attempting to synthesize sample instead.", v5);

  OUTLINED_FUNCTION_9();
}

@end
