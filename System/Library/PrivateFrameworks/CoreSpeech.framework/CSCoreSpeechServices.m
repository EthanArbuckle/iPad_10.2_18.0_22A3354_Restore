@implementation CSCoreSpeechServices

+ (id)getCoreSpeechServiceConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.corespeechservices"), 0);
  CoreSpeechServiceListenerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

+ (id)getCoreSpeechXPCConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.corespeech.xpc"));
  CoreSpeechXPCGetInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

+ (void)installedVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  CSLogInitIfNeeded();
  objc_msgSend(a1, "getCoreSpeechXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__CSCoreSpeechServices_installedVoiceTriggerAssetForLanguageCode_completion___block_invoke;
  v17[3] = &unk_1E7C28F10;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v8, "setInvalidationHandler:", v17);
  objc_msgSend(v8, "resume");
  objc_initWeak(&location, v8);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __77__CSCoreSpeechServices_installedVoiceTriggerAssetForLanguageCode_completion___block_invoke_10;
  v13[3] = &unk_1E7C24880;
  v12 = v10;
  v14 = v12;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "installedVoiceTriggerAssetForLanguageCode:completion:", v6, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

+ (void)fetchRemoteVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  CSLogInitIfNeeded();
  objc_msgSend(a1, "getCoreSpeechXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__CSCoreSpeechServices_fetchRemoteVoiceTriggerAssetForLanguageCode_completion___block_invoke;
  v17[3] = &unk_1E7C28F10;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v8, "setInvalidationHandler:", v17);
  objc_msgSend(v8, "resume");
  objc_initWeak(&location, v8);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __79__CSCoreSpeechServices_fetchRemoteVoiceTriggerAssetForLanguageCode_completion___block_invoke_15;
  v13[3] = &unk_1E7C24880;
  v12 = v10;
  v14 = v12;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "fetchRemoteVoiceTriggerAssetForLanguageCode:completion:", v6, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

+ (void)getCurrentVoiceTriggerLocaleWithEndpointId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__CSCoreSpeechServices_getCurrentVoiceTriggerLocaleWithEndpointId_completion___block_invoke;
  v8[3] = &unk_1E7C248A8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "getCSVoiceTriggerRTModelRequestOptions:completion:", a3, v8);

}

+ (void)getCSVoiceTriggerRTModelRequestOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__CSCoreSpeechServices_getCSVoiceTriggerRTModelRequestOptions_completion___block_invoke;
  v20[3] = &unk_1E7C248A8;
  v9 = v7;
  v21 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v20);
  objc_msgSend(a1, "getCoreSpeechServiceConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x1E0D18F60];
  v13 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:]";
    v24 = 1026;
    v25 = 0;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s making connection to corespeechd with (%{public}d)", buf, 0x12u);
  }
  objc_msgSend(v11, "resume");
  v14 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "+[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:]";
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Asking VoiceTrigger locale to corespeechd", buf, 0xCu);
  }
  objc_msgSend(v11, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_initWeak((id *)buf, v11);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __74__CSCoreSpeechServices_getCSVoiceTriggerRTModelRequestOptions_completion___block_invoke_17;
    v17[3] = &unk_1E7C248D0;
    v18 = v10;
    objc_copyWeak(&v19, (id *)buf);
    objc_msgSend(v15, "getVoiceTriggerRTModelRequestOptionsWithEndpointId:completion:", v6, v17);
    objc_destroyWeak(&v19);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 406, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v16);

    objc_msgSend(v11, "setInvalidationHandler:", 0);
    objc_msgSend(v11, "invalidate");
  }

}

+ (void)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  os_log_t *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v26 = v10;
    v14 = objc_alloc(MEMORY[0x1E0D191E0]);
    v15 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __123__CSCoreSpeechServices_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_completion___block_invoke;
    v34[3] = &unk_1E7C248F8;
    v35 = v13;
    v16 = (void *)objc_msgSend(v14, "initWithDefaultValue:completionBlock:", MEMORY[0x1E0C9AAA0], v34);
    objc_msgSend(a1, "getCoreSpeechXPCConnection");
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __123__CSCoreSpeechServices_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_completion___block_invoke_2;
    v32[3] = &unk_1E7C292C8;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v17;
    v18 = (void *)MEMORY[0x1C3BC4734](v32);
    objc_msgSend(v17, "setInterruptionHandler:", v18);
    v30[0] = v15;
    v30[1] = 3221225472;
    v30[2] = __123__CSCoreSpeechServices_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_completion___block_invoke_21;
    v30[3] = &unk_1E7C292C8;
    v19 = v17;
    v31 = v19;
    objc_msgSend(v19, "setInvalidationHandler:", v30);
    objc_msgSend(v19, "resume");
    objc_msgSend(v19, "remoteObjectProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (os_log_t *)MEMORY[0x1E0D18F60];
    v22 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "+[CSCoreSpeechServices supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:completion:]";
      v38 = 2048;
      v39 = v20;
      _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s Remote object proxy %p", buf, 0x16u);
    }
    if (v20)
    {
      objc_msgSend(v19, "remoteObjectProxy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v15;
      v27[1] = 3221225472;
      v27[2] = __123__CSCoreSpeechServices_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_completion___block_invoke_22;
      v27[3] = &unk_1E7C284D0;
      v29 = v18;
      v28 = v16;
      v10 = v26;
      objc_msgSend(v23, "supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:completion:", v26, v11, v12, v27);

    }
    else
    {
      v24 = *v21;
      v25 = os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR);
      v10 = v26;
      if (v25)
      {
        *(_DWORD *)buf = 136315138;
        v37 = "+[CSCoreSpeechServices supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModel"
              "Type:completion:]";
        _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s Remote object proxy is nil", buf, 0xCu);
      }
    }

  }
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 downloadedModels:(id)a6 preinstalledModels:(id)a7 completion:(id)a8
{
  objc_msgSend(a1, "voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:endpointId:downloadedModels:preinstalledModels:completion:", a3, a4, a5, 0, a6, a7, a8);
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10
{
  objc_msgSend(a1, "_voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpointId:downloadedModels:preinstalledModels:completion:", a3, a4, a5, a6, a7, a8);
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 endpointId:(id)a6 downloadedModels:(id)a7 preinstalledModels:(id)a8 completion:(id)a9
{
  objc_msgSend(a1, "_voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpointId:downloadedModels:preinstalledModels:completion:", a3, a4, a5, 0, a6, a7, a8, a9);
}

+ (void)_voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  int64_t v37;
  id v38;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  CSLogInitIfNeeded();
  if (a5)
  {
    objc_msgSend(v16, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __161__CSCoreSpeechServices__voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion___block_invoke;
  v28[3] = &unk_1E7C24970;
  v35 = a3;
  v36 = a4;
  v29 = v16;
  v30 = v20;
  v37 = a5;
  v38 = a1;
  v31 = v15;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v21 = v18;
  v22 = v17;
  v23 = v19;
  v24 = v15;
  v25 = v20;
  v26 = v16;
  +[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:](CSCoreSpeechServices, "getCSVoiceTriggerRTModelRequestOptions:completion:", v25, v28);

}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  CSLogInitIfNeeded();
  objc_msgSend(a1, "voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpointId:downloadedModels:preinstalledModels:completion:", a3, a4, 0, 0, 0, v14, v13, v12);

}

+ (void)voiceTriggerJarvisLanguageList:(id)a3 jarvisSelectedLanguage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CSLogInitIfNeeded();
  objc_msgSend(a1, "getCoreSpeechXPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__CSCoreSpeechServices_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke;
  v20[3] = &unk_1E7C28F10;
  v13 = v10;
  v21 = v13;
  objc_msgSend(v11, "setInvalidationHandler:", v20);
  objc_msgSend(v11, "resume");
  v14 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "+[CSCoreSpeechServices voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]";
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Asking keyword language given Jarvis language list %{public}@, jarvis-selected language: %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, v11);
  objc_msgSend(v11, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __89__CSCoreSpeechServices_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke_43;
  v17[3] = &unk_1E7C24998;
  v16 = v13;
  v18 = v16;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v15, "voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:", v8, v9, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

+ (void)requestUpdatedSATAudio
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  CSLogInitIfNeeded();
  objc_msgSend(a1, "getCoreSpeechServiceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_6063);
  objc_msgSend(v3, "resume");
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_initWeak(&location, v3);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__CSCoreSpeechServices_requestUpdatedSATAudio__block_invoke_45;
    v5[3] = &unk_1E7C249E0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "requestUpdatedSATAudio:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v3, "setInvalidationHandler:", 0);
    objc_msgSend(v3, "invalidate");
  }

}

+ (int64_t)getFirstPassRunningMode
{
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int64_t v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;

  CSLogInitIfNeeded();
  v3 = dispatch_semaphore_create(0);
  objc_msgSend(a1, "getCoreSpeechServiceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__CSCoreSpeechServices_getFirstPassRunningMode__block_invoke;
  v20[3] = &unk_1E7C292C8;
  v6 = v3;
  v21 = v6;
  objc_msgSend(v4, "setInvalidationHandler:", v20);
  objc_msgSend(v4, "resume");
  objc_msgSend(v4, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -1;
  if (v7)
  {
    objc_initWeak(&location, v4);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __47__CSCoreSpeechServices_getFirstPassRunningMode__block_invoke_46;
    v11[3] = &unk_1E7C24A08;
    v13 = &v16;
    objc_copyWeak(&v14, &location);
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "getFirstPassRunningMode:", v11);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v4, "setInvalidationHandler:", 0);
    objc_msgSend(v4, "invalidate");
  }
  v9 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v9;
}

intptr_t __47__CSCoreSpeechServices_getFirstPassRunningMode__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[CSCoreSpeechServices getFirstPassRunningMode]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSCoreSpeechServices Invalidated", (uint8_t *)&v4, 0xCu);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __47__CSCoreSpeechServices_getFirstPassRunningMode__block_invoke_46(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "invalidate");

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __46__CSCoreSpeechServices_requestUpdatedSATAudio__block_invoke_45(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  id *v7;
  id WeakRetained;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v10 = 136315138;
      v11 = "+[CSCoreSpeechServices requestUpdatedSATAudio]_block_invoke";
      v6 = "%s Request updated SAT audio succeed.";
LABEL_6:
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v5)
  {
    v10 = 136315138;
    v11 = "+[CSCoreSpeechServices requestUpdatedSATAudio]_block_invoke";
    v6 = "%s Request updated SAT audio failed.";
    goto LABEL_6;
  }
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);

  v9 = objc_loadWeakRetained(v7);
  objc_msgSend(v9, "invalidate");

}

void __46__CSCoreSpeechServices_requestUpdatedSATAudio__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "+[CSCoreSpeechServices requestUpdatedSATAudio]_block_invoke";
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_DEFAULT, "%s CSCoreSpeechServices Invalidated", (uint8_t *)&v1, 0xCu);
  }
}

void __89__CSCoreSpeechServices_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSCoreSpeechServices voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CoreSpeechXPCConnection Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 402, &unk_1E7C64908);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __89__CSCoreSpeechServices_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke_43(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "invalidate");

}

void __161__CSCoreSpeechServices__voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  os_log_t *v8;
  __CFString *v9;
  void *v10;
  CSVoiceTriggerRTModelRequestOptions *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  CSVoiceTriggerRTModelRequestOptions *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  __CFString *v41;
  __int128 v42;
  uint64_t v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  _BYTE v47[10];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v31 = a3;
  objc_msgSend(v5, "siriLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    v10 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v29 = v10;
      objc_msgSend(v31, "localizedDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "+[CSCoreSpeechServices _voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpoi"
            "ntId:downloadedModels:preinstalledModels:completion:]_block_invoke";
      v46 = 2114;
      *(_QWORD *)v47 = v30;
      _os_log_error_impl(&dword_1C2614000, v29, OS_LOG_TYPE_ERROR, "%s Cannot get Current VoiceTrigger Locale, falling back to en-US : %{public}@", buf, 0x16u);

    }
    v9 = CFSTR("en-US");
  }
  v11 = [CSVoiceTriggerRTModelRequestOptions alloc];
  v12 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __161__CSCoreSpeechServices__voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion___block_invoke_29;
  v37[3] = &unk_1E7C24920;
  v42 = *(_OWORD *)(a1 + 80);
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 96);
  v38 = v13;
  v43 = v14;
  v39 = *(id *)(a1 + 40);
  v40 = *(id *)(a1 + 48);
  v15 = v9;
  v41 = v15;
  v16 = -[CSVoiceTriggerRTModelRequestOptions initWithCSRTModelRequestOptions:builder:](v11, "initWithCSRTModelRequestOptions:builder:", v5, v37);
  v17 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 80);
    v19 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 136315650;
    v45 = "+[CSCoreSpeechServices _voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpoint"
          "Id:downloadedModels:preinstalledModels:completion:]_block_invoke";
    v46 = 1026;
    *(_DWORD *)v47 = v18;
    *(_WORD *)&v47[4] = 1026;
    *(_DWORD *)&v47[6] = v19;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Asking current VoiceTrigger asset for %{public}d.%{public}d", buf, 0x18u);
    v17 = *v8;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "+[CSCoreSpeechServices _voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpoint"
          "Id:downloadedModels:preinstalledModels:completion:]_block_invoke";
    v46 = 2112;
    *(_QWORD *)v47 = v16;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Voicetrigger RT model request options: %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 104), "getCoreSpeechXPCConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v12;
  v35[1] = 3221225472;
  v35[2] = __161__CSCoreSpeechServices__voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion___block_invoke_31;
  v35[3] = &unk_1E7C28F10;
  v36 = *(id *)(a1 + 72);
  objc_msgSend(v20, "setInvalidationHandler:", v35);
  objc_msgSend(v20, "resume");
  v21 = *v8;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 80);
    v23 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 136315650;
    v45 = "+[CSCoreSpeechServices _voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpoint"
          "Id:downloadedModels:preinstalledModels:completion:]_block_invoke";
    v46 = 1026;
    *(_DWORD *)v47 = v22;
    *(_WORD *)&v47[4] = 1026;
    *(_DWORD *)&v47[6] = v23;
    _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s Asking current VoiceTrigger aset for %{public}d.%{public}d", buf, 0x18u);
  }
  objc_msgSend(v20, "remoteObjectProxy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_initWeak((id *)buf, v20);
    v25 = *(_QWORD *)(a1 + 56);
    v26 = *(_QWORD *)(a1 + 64);
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __161__CSCoreSpeechServices__voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion___block_invoke_35;
    v32[3] = &unk_1E7C24948;
    v33 = *(id *)(a1 + 72);
    objc_copyWeak(&v34, (id *)buf);
    objc_msgSend(v24, "voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:", v16, v25, v26, v32);
    objc_destroyWeak(&v34);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    v27 = *(_QWORD *)(a1 + 72);
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 402, &unk_1E7C648E0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v27 + 16))(v27, 0, 0, v28);

    }
    objc_msgSend(v20, "setInvalidationHandler:", 0);
    objc_msgSend(v20, "invalidate");
  }

}

void __161__CSCoreSpeechServices__voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEngineMajorVersion:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEngineMinorVersion:", v5);

  objc_msgSend(v3, "setEndpointId:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessoryModelType:", v6);

  if (*(_QWORD *)(a1 + 40))
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "+[CSCoreSpeechServices _voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpoin"
           "tId:downloadedModels:preinstalledModels:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Force disabling multiphrase on remora", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 48), "setSupportsJustSiri:", 0);
  }
  objc_msgSend(v3, "setCSCoreSpeechServicesAccessoryInfo:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setSiriLocale:", *(_QWORD *)(a1 + 56));

}

void __161__CSCoreSpeechServices__voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion___block_invoke_31(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSCoreSpeechServices _voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpointI"
         "d:downloadedModels:preinstalledModels:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CoreSpeechXPCConnection Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 402, &unk_1E7C648B8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, v4);

  }
}

void __161__CSCoreSpeechServices__voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "invalidate");

}

uint64_t __123__CSCoreSpeechServices_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_completion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "BOOLValue"));
}

void __123__CSCoreSpeechServices_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_completion___block_invoke_2(uint64_t a1)
{
  id v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 32);
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "+[CSCoreSpeechServices supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:"
         "completion:]_block_invoke_2";
    v5 = 2048;
    v6 = v1;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Invalidating Connection %p", (uint8_t *)&v3, 0x16u);
  }
  if (v1)
  {
    objc_msgSend(v1, "setInvalidationHandler:", 0);
    objc_msgSend(v1, "invalidate");

  }
}

void __123__CSCoreSpeechServices_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_completion___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[CSCoreSpeechServices supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:"
         "completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Connection invalidated", (uint8_t *)&v4, 0xCu);
  }
  v3 = *(id *)(a1 + 32);
  if (v3)

}

void __123__CSCoreSpeechServices_supportsMultiPhraseVoiceTriggerForEngineVersion_engineMinorVersion_accessoryRTModelType_completion___block_invoke_22(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invokeWithValue:", v5);

}

uint64_t __74__CSCoreSpeechServices_getCSVoiceTriggerRTModelRequestOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__CSCoreSpeechServices_getCSVoiceTriggerRTModelRequestOptions_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "+[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:]_block_invoke";
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Current VoiceTrigger request options = %{public}@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);

  v7 = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "invalidate");

}

void __78__CSCoreSpeechServices_getCurrentVoiceTriggerLocaleWithEndpointId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "siriLocale");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

void __79__CSCoreSpeechServices_fetchRemoteVoiceTriggerAssetForLanguageCode_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSCoreSpeechServices fetchRemoteVoiceTriggerAssetForLanguageCode:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CoreSpeechXPCConnection Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 402, &unk_1E7C64890);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, v4);

  }
}

void __79__CSCoreSpeechServices_fetchRemoteVoiceTriggerAssetForLanguageCode_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "invalidate");

}

void __77__CSCoreSpeechServices_installedVoiceTriggerAssetForLanguageCode_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSCoreSpeechServices installedVoiceTriggerAssetForLanguageCode:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CoreSpeechXPCConnection Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 402, &unk_1E7C64868);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, v4);

  }
}

void __77__CSCoreSpeechServices_installedVoiceTriggerAssetForLanguageCode_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "invalidate");

}

@end
