@implementation CSVoiceProfileRetrainManager

- (CSVoiceProfileRetrainManager)init
{
  CSVoiceProfileRetrainManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  CSVoiceProfileRetrainManager *v6;
  NSObject *v7;
  _QWORD block[4];
  CSVoiceProfileRetrainManager *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  CSVoiceProfileRetrainManager *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CSVoiceProfileRetrainManager;
  v2 = -[CSVoiceProfileRetrainManager init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("cs.secondpass.retrainer.q", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__CSVoiceProfileRetrainManager_init__block_invoke;
    block[3] = &unk_1E7C292C8;
    v6 = v2;
    v10 = v6;
    dispatch_async(v5, block);
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSVoiceProfileRetrainManager init]";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Created CSVoiceProfileRetrainManager %@", buf, 0x16u);
    }

  }
  return v2;
}

- (void)triggerVoiceProfileRetrainingWithAsset:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSVoiceProfileRetrainManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CSVoiceProfileRetrainManager_triggerVoiceProfileRetrainingWithAsset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  NSObject *queue;
  _QWORD v5[5];
  BOOL v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__CSVoiceProfileRetrainManager_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke;
  v5[3] = &unk_1E7C28480;
  v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSVoiceProfileRetrainManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Language Changed to %{public}@ - Triggering voice profile retraining", buf, 0x16u);
  }
  +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__CSVoiceProfileRetrainManager_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke;
  v9[3] = &unk_1E7C26A18;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getVoiceTriggerAssetWithEndpointId:completion:", 0, v9);

}

- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5
{
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0D19260], "supportsSpeakerRecognitionAssets", a3, a4);
  v8 = *MEMORY[0x1E0D18F60];
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s New SpeakerRecognition assets downloaded - Triggering voice profile retraining", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __110__CSVoiceProfileRetrainManager_CSSpeakerRecognitionAssetDownloadMonitor_didInstallNewAsset_assetProviderType___block_invoke;
    v12[3] = &unk_1E7C26A18;
    v12[4] = self;
    v13 = v9;
    v11 = v9;
    objc_msgSend(v10, "assetOfType:providerType:language:completion:", 3, a5, v11, v12);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
    _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s ERR: Ignoring CSSpeakerRecognitionAssetDownloadMonitorDelegate for non-TVOS platforms !", buf, 0xCu);
  }
}

- (void)_speakerRecognitionModelRetrainCallback
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSVoiceProfileRetrainManager _speakerRecognitionModelRetrainCallback]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s SpeakerRecognition Model Missing - Triggering voice profile retraining", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CSVoiceProfileRetrainManager__speakerRecognitionModelRetrainCallback__block_invoke;
  v7[3] = &unk_1E7C26A18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "assetOfType:providerType:language:completion:", 3, 0, v6, v7);

}

- (void)_speakerRecognitionCleanupDuplicatedProfilesCallback
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  if (CSIsIOS() && v4)
  {
    objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceProfileRetrainManager _speakerRecognitionCleanupDuplicatedProfilesCallback]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Triggered cleanup of duplicated profiles", buf, 0xCu);
    }
    if (objc_msgSend(v5, "triggerVoiceProfileDuplicatesCleanup"))
    {
      objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __84__CSVoiceProfileRetrainManager__speakerRecognitionCleanupDuplicatedProfilesCallback__block_invoke;
      v10[3] = &unk_1E7C26A18;
      v10[4] = self;
      v11 = v7;
      v9 = v7;
      objc_msgSend(v8, "getVoiceTriggerAssetWithEndpointId:completion:", 0, v10);

    }
  }
}

- (void)_migrateTDVoiceProfileCallback
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "migrateTDVoiceProfilesToTDTI");

}

- (void)_runVoiceProfileRetrainerWithAsset:(id)a3 withLanguageCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  NSObject *v12;
  _BOOL4 v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *context;
  id v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  _BYTE *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[4];
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  uint8_t v37[4];
  const char *v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__16408;
  v35[4] = __Block_byref_object_dispose__16409;
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CSVoiceProfileRetrainManager__runVoiceProfileRetrainerWithAsset_withLanguageCode___block_invoke;
  block[3] = &unk_1E7C29228;
  v10 = v7;
  v33 = v10;
  v34 = v35;
  if (_runVoiceProfileRetrainerWithAsset_withLanguageCode__onceCleanupToken == -1)
  {
    if ((v9 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&_runVoiceProfileRetrainerWithAsset_withLanguageCode__onceCleanupToken, block);
    if ((v9 & 1) == 0)
    {
LABEL_3:
      if (!objc_msgSend(MEMORY[0x1E0D19260], "supportsSpeakerRecognitionAssets"))
        goto LABEL_28;
    }
  }
  context = (void *)MEMORY[0x1C3BC4590]();
  objc_msgSend(v10, "cleanupVoiceProfileModelFilesForLocale:withAsset:", v23, v6);
  objc_msgSend(v10, "provisionedVoiceProfilesForAppDomain:withLocale:", *MEMORY[0x1E0DA8C70], v23);
  v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D18F60];
  v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      v40 = v11;
      LOWORD(v41) = 2112;
      *(_QWORD *)((char *)&v41 + 2) = v6;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s languageCode:  %{public}@ -voiceProfileArray: %{public}@, _currentAsset:%@", buf, 0x2Au);
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = v11;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v40 = __Block_byref_object_copy__16408;
          *(_QWORD *)&v41 = __Block_byref_object_dispose__16409;
          *((_QWORD *)&v41 + 1) = v6;
          if (objc_msgSend(*((id *)&v41 + 1), "useSpeakerRecognitionAsset"))
          {
            +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __84__CSVoiceProfileRetrainManager__runVoiceProfileRetrainerWithAsset_withLanguageCode___block_invoke_28;
            v24[3] = &unk_1E7C26A68;
            v27 = buf;
            v24[4] = self;
            v25 = v10;
            v26 = v18;
            objc_msgSend(v19, "assetOfType:providerType:language:completion:", 3, 0, v23, v24);

          }
          else
          {
            -[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:](self, "_retrainingVoiceProfile:voiceProfile:asset:", v10, v18, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          }
          if ((CSIsCommunalDevice() & 1) == 0 && (unint64_t)objc_msgSend(v14, "count") >= 2)
          {
            v20 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v37 = 136315138;
              v38 = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]";
              _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s ERR: Constraining pruning and retraining to first profile", v37, 0xCu);
            }
            _Block_object_dispose(buf, 8);

            goto LABEL_26;
          }
          _Block_object_dispose(buf, 8);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_26:

    v11 = v21;
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]";
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s No voice profiles found, trigger a download", buf, 0xCu);
    }
    objc_msgSend(v10, "triggerVoiceProfileDownload");
  }

  objc_autoreleasePoolPop(context);
LABEL_28:

  _Block_object_dispose(v35, 8);
}

- (void)_retrainingVoiceProfile:(id)a3 voiceProfile:(id)a4 asset:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0D18F60];
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:]";
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s recognitionAsset:%@", buf, 0x16u);
    }
    objc_msgSend(v7, "pruneImplicitUtterancesOfProfile:withAsset:", v8, v9);
    v11 = *MEMORY[0x1E0DA8CA0];
    v18[0] = *MEMORY[0x1E0DA8CA8];
    v18[1] = v11;
    v19[0] = v8;
    v19[1] = MEMORY[0x1E0C9AAB0];
    v18[2] = *MEMORY[0x1E0DA8C98];
    v19[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8C30]), "initWithVoiceRetrainingContext:error:", v12, &v17);
    v14 = v17;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__CSVoiceProfileRetrainManager__retrainingVoiceProfile_voiceProfile_asset___block_invoke;
    v15[3] = &unk_1E7C285E8;
    v16 = v8;
    objc_msgSend(v7, "triggerRetrainingVoiceProfile:withContext:withCompletion:", v16, v13, v15);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:]";
    _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Asset is nil. Cannot retrain voice profile.", buf, 0xCu);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __75__CSVoiceProfileRetrainManager__retrainingVoiceProfile_voiceProfile_asset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "profileID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Retraining done for profile %@ with error %@", (uint8_t *)&v8, 0x20u);

  }
}

void __84__CSVoiceProfileRetrainManager__runVoiceProfileRetrainerWithAsset_withLanguageCode___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[6];
  __int128 buf;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Triggered migration if needed...", (uint8_t *)&buf, 0xCu);
  }
  v4 = (void *)MEMORY[0x1C3BC4590]();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16408;
  v11 = __Block_byref_object_dispose__16409;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D19178]), "initWithDescription:", CFSTR("VoiceProfile Migration"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__CSVoiceProfileRetrainManager__runVoiceProfileRetrainerWithAsset_withLanguageCode___block_invoke_26;
  v7[3] = &unk_1E7C26A40;
  v5 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v7[5] = &buf;
  objc_msgSend(v5, "triggerVoiceProfileMigrationWithCompletion:", v7);
  _Block_object_dispose(&buf, 8);

  objc_autoreleasePoolPop(v4);
  v6 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Completed one-time migration...", (uint8_t *)&buf, 0xCu);
  }
}

void __84__CSVoiceProfileRetrainManager__runVoiceProfileRetrainerWithAsset_withLanguageCode___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = *MEMORY[0x1E0D18F60];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (!v6 || v7)
  {
    if (v9)
    {
      v10 = 136315138;
      v11 = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Speaker recognition asset not found", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      v10 = 136315394;
      v11 = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Found speaker recognition asset:%@", (uint8_t *)&v10, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "_retrainingVoiceProfile:voiceProfile:asset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

void __84__CSVoiceProfileRetrainManager__runVoiceProfileRetrainerWithAsset_withLanguageCode___block_invoke_26(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v5)
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]_block_invoke";
      v11 = 2114;
      v12 = v5;
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s ERR: Failed voice profile migration with error %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __84__CSVoiceProfileRetrainManager__speakerRecognitionCleanupDuplicatedProfilesCallback__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__CSVoiceProfileRetrainManager__speakerRecognitionCleanupDuplicatedProfilesCallback__block_invoke_2;
  v12[3] = &unk_1E7C27E78;
  v13 = v5;
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __84__CSVoiceProfileRetrainManager__speakerRecognitionCleanupDuplicatedProfilesCallback__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[CSVoiceProfileRetrainManager _speakerRecognitionCleanupDuplicatedProfilesCallback]_block_invoke_2";
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetched latest VT asset %@ for retraining", (uint8_t *)&v8, 0x16u);
      v2 = *(void **)(a1 + 32);
    }
    objc_msgSend(*(id *)(a1 + 40), "_runVoiceProfileRetrainerWithAsset:withLanguageCode:", v2, *(_QWORD *)(a1 + 48));
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(void **)(a1 + 56);
    v6 = v3;
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CSVoiceProfileRetrainManager _speakerRecognitionCleanupDuplicatedProfilesCallback]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Cannot retrain since we cannot look-up SSR asset with error %@", (uint8_t *)&v8, 0x16u);

  }
}

void __71__CSVoiceProfileRetrainManager__speakerRecognitionModelRetrainCallback__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__CSVoiceProfileRetrainManager__speakerRecognitionModelRetrainCallback__block_invoke_2;
  v12[3] = &unk_1E7C27E78;
  v13 = v5;
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __71__CSVoiceProfileRetrainManager__speakerRecognitionModelRetrainCallback__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[CSVoiceProfileRetrainManager _speakerRecognitionModelRetrainCallback]_block_invoke_2";
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetched latest SSR asset %@ for retraining", (uint8_t *)&v8, 0x16u);
      v2 = *(void **)(a1 + 32);
    }
    objc_msgSend(*(id *)(a1 + 40), "_runVoiceProfileRetrainerWithAsset:withLanguageCode:", v2, *(_QWORD *)(a1 + 48));
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(void **)(a1 + 56);
    v6 = v3;
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CSVoiceProfileRetrainManager _speakerRecognitionModelRetrainCallback]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Cannot retrain since we cannot look-up SSR asset with error %@", (uint8_t *)&v8, 0x16u);

  }
}

void __110__CSVoiceProfileRetrainManager_CSSpeakerRecognitionAssetDownloadMonitor_didInstallNewAsset_assetProviderType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__CSVoiceProfileRetrainManager_CSSpeakerRecognitionAssetDownloadMonitor_didInstallNewAsset_assetProviderType___block_invoke_2;
  v12[3] = &unk_1E7C27E78;
  v13 = v5;
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __110__CSVoiceProfileRetrainManager_CSSpeakerRecognitionAssetDownloadMonitor_didInstallNewAsset_assetProviderType___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:"
           "]_block_invoke_2";
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetched latest SSR asset %@ for retraining", (uint8_t *)&v8, 0x16u);
      v2 = *(void **)(a1 + 32);
    }
    objc_msgSend(*(id *)(a1 + 40), "_runVoiceProfileRetrainerWithAsset:withLanguageCode:", v2, *(_QWORD *)(a1 + 48));
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(void **)(a1 + 56);
    v6 = v3;
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Cannot retrain since we cannot look-up SSR asset with error %@", (uint8_t *)&v8, 0x16u);

  }
}

void __90__CSVoiceProfileRetrainManager_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__CSVoiceProfileRetrainManager_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke_2;
  v12[3] = &unk_1E7C27E78;
  v13 = v5;
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __90__CSVoiceProfileRetrainManager_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[CSVoiceProfileRetrainManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]_block_invoke_2";
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetched latest assets %@ for retraining", (uint8_t *)&v8, 0x16u);
      v2 = *(void **)(a1 + 32);
    }
    objc_msgSend(*(id *)(a1 + 40), "_runVoiceProfileRetrainerWithAsset:withLanguageCode:", v2, *(_QWORD *)(a1 + 48));
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(void **)(a1 + 56);
    v6 = v3;
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CSVoiceProfileRetrainManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]_block_invoke";
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Cannot retrain since we cannot look-up VoiceTrigger asset : %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __79__CSVoiceProfileRetrainManager_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CSVoiceProfileRetrainManager CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger is enabled, trigger retraining if needed!", buf, 0xCu);
    }
    +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __79__CSVoiceProfileRetrainManager_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke_17;
    v4[3] = &unk_1E7C28D98;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "getVoiceTriggerAssetWithEndpointId:completion:", 0, v4);

  }
}

void __79__CSVoiceProfileRetrainManager_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSVoiceProfileRetrainManager_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke_2;
  block[3] = &unk_1E7C291C0;
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __79__CSVoiceProfileRetrainManager_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke_2(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  v5 = *MEMORY[0x1E0D18F60];
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[CSVoiceProfileRetrainManager CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke_2";
      v12 = 2112;
      v13 = v2;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched latest assets %@ for retraining", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "_runVoiceProfileRetrainerWithAsset:withLanguageCode:", *(_QWORD *)(a1 + 32), v6);
    }
    else
    {
      v9 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[CSVoiceProfileRetrainManager CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s LanguageCode is nil - Bailing out", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      return;
    v7 = *(void **)(a1 + 48);
    v6 = v4;
    objc_msgSend(v7, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[CSVoiceProfileRetrainManager CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
    v12 = 2114;
    v13 = v8;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Cannot retrain since we cannot look-up VoiceTrigger asset : %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

void __71__CSVoiceProfileRetrainManager_triggerVoiceProfileRetrainingWithAsset___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D18F60];
  v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[CSVoiceProfileRetrainManager triggerVoiceProfileRetrainingWithAsset:]_block_invoke";
      v8 = 2114;
      v9 = v2;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Retraining on %{public}@ with asset %{public}@", (uint8_t *)&v6, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_runVoiceProfileRetrainerWithAsset:withLanguageCode:", *(_QWORD *)(a1 + 32), v2);
  }
  else if (v4)
  {
    v6 = 136315138;
    v7 = "-[CSVoiceProfileRetrainManager triggerVoiceProfileRetrainingWithAsset:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s LanguageCode is nil - Bailing out", (uint8_t *)&v6, 0xCu);
  }

}

void __36__CSVoiceProfileRetrainManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  CSAssetDownloadingOption *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0D19158], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", *(_QWORD *)(a1 + 32));

  if (objc_msgSend(MEMORY[0x1E0D19260], "supportsSpeakerRecognitionAssets"))
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSpeakerRecognitionAvailable");

    if (v5)
    {
      v6 = objc_alloc_init(CSAssetDownloadingOption);
      -[CSAssetDownloadingOption setAllowSpeakerRecognitionAssetDownloading:](v6, "setAllowSpeakerRecognitionAssetDownloading:", 1);
      +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAssetDownloadingOption:", v6);

      +[CSSpeakerRecognitionAssetDownloadMonitor sharedInstance](CSSpeakerRecognitionAssetDownloadMonitor, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:", *(_QWORD *)(a1 + 32));

      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__speakerRecognitionModelRetrainCallback, *MEMORY[0x1E0DA8CB0], 0);

    }
  }
  if (CSIsIOS())
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__speakerRecognitionCleanupDuplicatedProfilesCallback, *MEMORY[0x1E0DA8D20], 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__migrateTDVoiceProfileCallback, *MEMORY[0x1E0DA8D28], 0);

  }
}

+ (CSVoiceProfileRetrainManager)sharedInstance
{
  if (sharedInstance_onceToken_16459 != -1)
    dispatch_once(&sharedInstance_onceToken_16459, &__block_literal_global_16460);
  return (CSVoiceProfileRetrainManager *)(id)sharedInstance_voiceProfileRetrainMgr;
}

void __46__CSVoiceProfileRetrainManager_sharedInstance__block_invoke()
{
  CSVoiceProfileRetrainManager *v0;
  void *v1;

  if (((CSIsIOS() & 1) != 0
     || (objc_msgSend(MEMORY[0x1E0D19260], "supportsSpeakerRecognitionAssets") & 1) != 0
     || CSIsASMacWithAOP())
    && (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) == 0)
  {
    v0 = objc_alloc_init(CSVoiceProfileRetrainManager);
  }
  else
  {
    v0 = 0;
  }
  v1 = (void *)sharedInstance_voiceProfileRetrainMgr;
  sharedInstance_voiceProfileRetrainMgr = (uint64_t)v0;

}

@end
