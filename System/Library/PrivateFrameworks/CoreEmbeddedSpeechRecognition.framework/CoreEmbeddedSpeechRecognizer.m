@implementation CoreEmbeddedSpeechRecognizer

- (CoreEmbeddedSpeechRecognizer)initWithDelegate:(id)a3 instanceUUID:(unsigned __int8)a4[16]
{
  id v6;
  CoreEmbeddedSpeechRecognizer *v7;
  CoreEmbeddedSpeechRecognizer *v8;
  void *v9;
  int v10;
  dispatch_qos_class_t QoSClassFromInstanceUUID;
  dispatch_qos_class_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  dispatch_queue_t v18;
  OS_dispatch_queue *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  dispatch_qos_class_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CoreEmbeddedSpeechRecognizer;
  v7 = -[CoreEmbeddedSpeechRecognizer init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    if ((AFDeviceSupportsSiriUOD() & 1) != 0 || AFOfflineDictationCapable())
    {
      objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "infersQoSFromInstanceUUIDForEAR");

      if (v10)
      {
        QoSClassFromInstanceUUID = CoreEmbeddedSpeechRecognizerGetQoSClassFromInstanceUUID((uint64_t)a4);
        if (QoSClassFromInstanceUUID)
        {
          v12 = QoSClassFromInstanceUUID;
          v13 = *MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]";
            v24 = 1024;
            v25 = v12;
            _os_log_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_INFO, "%s ASR: Using QoS class %#02X.", buf, 0x12u);
          }
          dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v14 = objc_claimAutoreleasedReturnValue();
          dispatch_queue_attr_make_with_qos_class(v14, v12, 0);
          v15 = objc_claimAutoreleasedReturnValue();

          v16 = dispatch_queue_create("CoreEmbeddedSpeechRecognizer", v15);
          queue = v8->_queue;
          v8->_queue = (OS_dispatch_queue *)v16;

        }
      }
    }
    if (!v8->_queue)
    {
      v18 = dispatch_queue_create("CoreEmbeddedSpeechRecognizer", 0);
      v19 = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v18;

    }
    uuid_copy(v8->_instanceUUID, a4);
  }

  return v8;
}

- (CoreEmbeddedSpeechRecognizer)init
{

  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CoreEmbeddedSpeechRecognizer dealloc]";
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s CoreEmbeddedSpeechRecognizer Dealloc", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CoreEmbeddedSpeechRecognizer;
  -[CoreEmbeddedSpeechRecognizer dealloc](&v4, sel_dealloc);
}

- (id)_newConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.siri.embeddedspeech"));
  CESRSpeechServiceGetXPCInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  CESRSpeechServiceDelegateGetXPCInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);

  objc_msgSend(v3, "setExportedObject:", self);
  objc_msgSend(v3, "_setQueue:", self->_queue);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_instanceUUID);
  objc_msgSend(v3, "_setUUID:", v6);

  return v3;
}

- (id)_connection
{
  NSXPCConnection *esConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  uint64_t v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  if ((AFOfflineDictationCapable() & 1) != 0 || AFDeviceSupportsSiriUOD())
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    esConnection = self->_esConnection;
    if (!esConnection)
    {
      v4 = -[CoreEmbeddedSpeechRecognizer _newConnection](self, "_newConnection");
      v5 = self->_esConnection;
      self->_esConnection = v4;

      objc_initWeak(&location, self);
      v6 = self->_esConnection;
      v7 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __43__CoreEmbeddedSpeechRecognizer__connection__block_invoke;
      v13[3] = &unk_1E6734800;
      objc_copyWeak(&v14, &location);
      -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v13);
      v8 = self->_esConnection;
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __43__CoreEmbeddedSpeechRecognizer__connection__block_invoke_222;
      v11[3] = &unk_1E6734800;
      objc_copyWeak(&v12, &location);
      -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v11);
      -[NSXPCConnection resume](self->_esConnection, "resume");
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      esConnection = self->_esConnection;
    }
    v9 = esConnection;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_service
{
  void *v2;
  void *v3;

  -[CoreEmbeddedSpeechRecognizer _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_serviceWithFunctionName:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CoreEmbeddedSpeechRecognizer _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__CoreEmbeddedSpeechRecognizer__serviceWithFunctionName_errorHandler___block_invoke;
    v12[3] = &unk_1E6734828;
    v13 = v6;
    v14 = v7;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 601, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);

    v9 = 0;
  }

  return v9;
}

- (id)_synchronousServiceWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[CoreEmbeddedSpeechRecognizer _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 601, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

    v7 = 0;
  }

  return v7;
}

- (void)preheatSpeechRecognitionWithLanguage:(id)a3 modelOverrideURL:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CoreEmbeddedSpeechRecognizer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithLanguage_modelOverrideURL___block_invoke;
  block[3] = &unk_1E6734878;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CoreEmbeddedSpeechRecognizer *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithAssetConfig_preheatSource_modelOverrideURL___block_invoke;
  v15[3] = &unk_1E67348A0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandler___block_invoke;
  v8[3] = &unk_1E67349B8;
  v9 = v6;
  v7 = v6;
  -[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:](self, "startSpeechRecognitionWithParameters:didStartHandlerWithInfo:", a3, v8);

}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke;
  block[3] = &unk_1E6734AC0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CoreEmbeddedSpeechRecognizer_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke;
  block[3] = &unk_1E6734878;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)createSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__CoreEmbeddedSpeechRecognizer_createSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke;
  block[3] = &unk_1E6734B28;
  v22 = v12;
  v23 = v13;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(queue, block);

}

- (void)updateSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CoreEmbeddedSpeechRecognizer *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke;
  v15[3] = &unk_1E6734BA0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withCompletion___block_invoke;
  v11[3] = &unk_1E6734BC8;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a4;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withCompletion:(id)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  BOOL v16;
  BOOL v17;

  v10 = a6;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __111__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withDetailedStatus_withCompletion___block_invoke;
  v13[3] = &unk_1E6734BF0;
  v13[4] = self;
  v14 = v10;
  v16 = a3;
  v15 = a4;
  v17 = a5;
  v12 = v10;
  dispatch_async(queue, v13);

}

- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__CoreEmbeddedSpeechRecognizer_getOfflineDictationStatusIgnoringCache_withCompletion___block_invoke;
  block[3] = &unk_1E6734C18;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)getOfflineDictationStatusWithCompletion:(id)a3
{
  -[CoreEmbeddedSpeechRecognizer getOfflineDictationStatusIgnoringCache:withCompletion:](self, "getOfflineDictationStatusIgnoringCache:withCompletion:", 0, a3);
}

- (void)runCorrectedTextEvaluationWithAudioDatas:(id)a3 recordDatas:(id)a4 language:(id)a5 samplingRate:(unint64_t)a6 caseSensitive:(BOOL)a7 skipLME:(BOOL)a8 wordSenseAccessListSet:(id)a9 completion:(id)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD);
  NSObject *queue;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, _QWORD);
  _QWORD block[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a8;
  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v20 = (void (**)(id, _QWORD))a10;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3629;
  v37 = __Block_byref_object_dispose__3630;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3629;
  v31 = __Block_byref_object_dispose__3630;
  v32 = 0;
  queue = self->_queue;
  v22 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke;
  block[3] = &unk_1E6734C68;
  block[4] = self;
  block[5] = &v27;
  block[6] = &v33;
  dispatch_sync(queue, block);
  if (v34[5])
  {
    v20[2](v20, 0);
  }
  else
  {
    v23 = (void *)v28[5];
    v24[0] = v22;
    v24[1] = 3221225472;
    v24[2] = __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke_3;
    v24[3] = &unk_1E6734C90;
    v25 = v20;
    objc_msgSend(v23, "runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:caseSensitive:skipLME:wordSenseAccessListSet:completion:", v16, v17, v18, a6, v11, v10, v19, v24);

  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
}

- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 attachments:(id)a6 fidesPersonalizedLMPath:(id)a7 fidesPersonalizedLMTrainingAsset:(id)a8 scrubResult:(BOOL)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, _QWORD);
  NSObject *queue;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  void (**v28)(id, _QWORD);
  _QWORD block[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = (void (**)(id, _QWORD))a10;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3629;
  v40 = __Block_byref_object_dispose__3630;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3629;
  v34 = __Block_byref_object_dispose__3630;
  v35 = 0;
  queue = self->_queue;
  v24 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke;
  block[3] = &unk_1E6734C68;
  block[4] = self;
  block[5] = &v30;
  block[6] = &v36;
  dispatch_sync(queue, block);
  if (v37[5])
  {
    v22[2](v22, 0);
  }
  else
  {
    v25 = (void *)v31[5];
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke_3;
    v27[3] = &unk_1E6734C90;
    v28 = v22;
    LOBYTE(v26) = a9;
    objc_msgSend(v25, "runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:", v16, v17, v18, v19, v20, v21, v26, v27);

  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 fidesPersonalizedLMPath:(id)a6 fidesPersonalizedLMTrainingAsset:(id)a7 scrubResult:(BOOL)a8 completion:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  -[CoreEmbeddedSpeechRecognizer runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:](self, "runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalizedLMPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:", a3, a4, a5, 0, a6, a7, v9, a9);
}

- (void)redecodeWithAudioDatas:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  NSObject *queue;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, _QWORD);
  _QWORD block[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD))a7;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3629;
  v32 = __Block_byref_object_dispose__3630;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3629;
  v26 = __Block_byref_object_dispose__3630;
  v27 = 0;
  queue = self->_queue;
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke;
  block[3] = &unk_1E6734C68;
  block[4] = self;
  block[5] = &v22;
  block[6] = &v28;
  dispatch_sync(queue, block);
  if (v29[5])
  {
    v15[2](v15, 0);
  }
  else
  {
    v18 = (void *)v23[5];
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke_3;
    v19[3] = &unk_1E6734C90;
    v20 = v15;
    objc_msgSend(v18, "redecodeWithAudioDatas:language:task:samplingRate:completion:", v12, v13, v14, a6, v19);

  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

- (void)readProfileAndUserDataWithLanguage:(id)a3 allowOverride:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke_2;
    block[3] = &unk_1E6734CE0;
    block[4] = self;
    v16 = v11;
    v17 = v10;
    v18 = a4;
    v13 = v11;
    dispatch_async(queue, block);

  }
  else
  {
    v14 = self->_queue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke;
    v19[3] = &unk_1E6734CB8;
    v20 = v9;
    dispatch_async(v14, v19);
    v13 = v20;
  }

}

- (void)resetDESWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CoreEmbeddedSpeechRecognizer_resetDESWithCompletion___block_invoke;
  block[3] = &unk_1E6734CB8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (id)modelPropertiesForAssetConfig:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  __int128 *p_buf;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v10 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CoreEmbeddedSpeechRecognizer modelPropertiesForAssetConfig:error:]";
      _os_log_error_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_ERROR, "%s Not fetching assets for nil language", (uint8_t *)&buf, 0xCu);
      if (a4)
        goto LABEL_7;
    }
    else if (a4)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 401, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v9 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3629;
  v25 = __Block_byref_object_dispose__3630;
  v26 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3629;
  v20 = __Block_byref_object_dispose__3630;
  v21 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke;
  v12[3] = &unk_1E6734D58;
  v12[4] = self;
  v14 = &v16;
  v13 = v6;
  p_buf = &buf;
  dispatch_sync(queue, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

LABEL_10:
  return v9;
}

- (void)addAudioPacket:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CoreEmbeddedSpeechRecognizer_addAudioPacket___block_invoke;
  v7[3] = &unk_1E6734D80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__CoreEmbeddedSpeechRecognizer_addAudioPacket_packetRecordedTime_packetReadyUpstreamTime___block_invoke;
  v15[3] = &unk_1E67348A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)finishAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CoreEmbeddedSpeechRecognizer_finishAudio__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAudioDecoding
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CoreEmbeddedSpeechRecognizer_stopAudioDecoding__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestEagerResult
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CoreEmbeddedSpeechRecognizer_requestEagerResult__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CoreEmbeddedSpeechRecognizer_invalidate__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)deleteAllDESRecordsForDictationPersonalization
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CoreEmbeddedSpeechRecognizer_deleteAllDESRecordsForDictationPersonalization__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unsigned)instanceUUID
{
  return (unsigned __int8 (*)[16])self->_instanceUUID;
}

- (void)pauseRecognition
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CoreEmbeddedSpeechRecognizer_pauseRecognition__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__CoreEmbeddedSpeechRecognizer_resumeRecognitionWithPrefixText_postfixText_selectedText___block_invoke;
  v15[3] = &unk_1E67348A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)speechServiceDidSelectRecognitionModelWithModelProperties:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "localSpeechRecognizer:didSelectRecognitionModelWithModelProperties:", self, v7);

  }
}

- (void)speechServiceDidRecognizeTokens:(id)a3
{
  CoreEmbeddedSpeechRecognizerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognizer:didRecognizeTokens:", self, v5);

}

- (void)speechServiceDidRecognizeTokens:(id)a3 withMetadata:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "localSpeechRecognizer:didRecognizeTokens:withMetadata:", self, v10, v6);

  }
}

- (void)speechServiceDidRecognizePartialPackage:(id)a3 withMetadata:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "localSpeechRecognizer:didRecognizePartialPackage:withMetadata:", self, v10, v6);

  }
}

- (void)speechServiceDidProcessAudioDuration:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognizer:didProcessAudioDuration:", self, a3);

}

- (void)speechServiceDidRecognizeRawEagerRecognitionCandidate:(id)a3
{
  CoreEmbeddedSpeechRecognizerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognizer:didRecognizeRawEagerRecognitionCandidate:", self, v5);

}

- (void)speechServiceDidRecognizeFinalResultCandidatePackage:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "localSpeechRecognizer:didRecognizeFinalResultCandidatePackage:", self, v7);

  }
}

- (void)speechServiceDidRecognizeVoiceCommandCandidatePackage:(id)a3 withMetadata:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "localSpeechRecognizer:didRecognizeVoiceCommandCandidatePackage:withMetadata:", self, v10, v6);

  }
}

- (void)speechServiceDidRecognizePackage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "recognition", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "interpretationIndices");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          self->_hasRecognizedAnything = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognizer:didRecognizePackage:", self, v4);

}

- (void)speechServiceDidRecognizePackage:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  char v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "recognition", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "utterances");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "interpretationIndices");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          self->_hasRecognizedAnything = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "localSpeechRecognizer:didRecognizePackage:withMetadata:", self, v6, v7);

  }
}

- (void)speechServiceDidFinishRecognitionWithStatistics:(id)a3 error:(id)a4
{
  id v6;
  NSError *v7;
  NSObject *v8;
  id WeakRetained;
  NSError *recognitionError;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSError *)a4;
  if (!v7)
  {
    if (self->_hasRecognizedAnything)
    {
      v7 = 0;
    }
    else
    {
      v8 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "-[CoreEmbeddedSpeechRecognizer speechServiceDidFinishRecognitionWithStatistics:error:]";
        _os_log_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_INFO, "%s No speech recognized, synthesizing local speech error", (uint8_t *)&v11, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 1110, 0);
      v7 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognizer:didCompletionRecognitionWithStatistics:error:", self, v6, v7);

  self->_recognitionActive = 0;
  recognitionError = self->_recognitionError;
  self->_recognitionError = v7;

}

- (void)speechServiceDidProduceEndpointFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 processedAudioDurationInMilliseconds:(int64_t)a8 acousticEndpointerScore:(double)a9
{
  id WeakRetained;
  char v17;
  id v18;
  id v19;

  v19 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "localSpeechRecognizer:didProduceEndpointFeaturesWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:processedAudioDurationInMilliseconds:acousticEndpointerScore:", self, a3, a4, v19, a8, a5, a7, a9);

  }
}

- (void)speechServiceDidProduceLoggablePackage:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "localSpeechRecognizer:didProduceLoggablePackage:", self, v7);

  }
}

- (void)fetchUserDataForLanguage:(id)a3 completion:(id)a4
{
  objc_class *v4;
  void (**v5)(id, void *, _QWORD);
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB35C8];
    v5 = (void (**)(id, void *, _QWORD))a4;
    v6 = [v4 alloc];
    v7 = *MEMORY[0x1E0CFEB48];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("No API is available to fetch user data.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 500, v8);

    v5[2](v5, v9, 0);
  }
}

- (void)startMissingAssetDownload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CoreEmbeddedSpeechRecognizer_startMissingAssetDownload__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)writeUaapOovsForLanguage:(id)a3 bundleId:(id)a4 customProns:(id)a5 newOovs:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__CoreEmbeddedSpeechRecognizer_writeUaapOovsForLanguage_bundleId_customProns_newOovs_completion___block_invoke;
  v23[3] = &unk_1E6734E60;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v16;
  dispatch_async(queue, v23);

}

- (void)invalidatePersonalizedLM
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CoreEmbeddedSpeechRecognizer_invalidatePersonalizedLM__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removePersonalizedLMForFidesOnly:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CoreEmbeddedSpeechRecognizer_removePersonalizedLMForFidesOnly___block_invoke;
  v4[3] = &unk_1E6734EC8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)invalidateUaapLM
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CoreEmbeddedSpeechRecognizer_invalidateUaapLM__block_invoke;
  block[3] = &unk_1E6734990;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CoreEmbeddedSpeechRecognizerDelegate)delegate
{
  return (CoreEmbeddedSpeechRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preheatedProfile, 0);
  objc_storeStrong((id *)&self->_preheatedProfileAssetPath, 0);
  objc_storeStrong((id *)&self->_recognitionError, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_esConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__CoreEmbeddedSpeechRecognizer_invalidateUaapLM__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer invalidateUaapLM]_block_invoke");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_serviceWithFunctionName:errorHandler:", v3, &__block_literal_global_289);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateUaapLm");

}

void __48__CoreEmbeddedSpeechRecognizer_invalidateUaapLM__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[CoreEmbeddedSpeechRecognizer invalidateUaapLM]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_ERROR, "%s UaaP: Invalidation error %@", (uint8_t *)&v4, 0x16u);
  }

}

void __65__CoreEmbeddedSpeechRecognizer_removePersonalizedLMForFidesOnly___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_synchronousServiceWithErrorHandler:", &__block_literal_global_286);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removePersonalizedLMForFidesOnly:completion:", *(unsigned __int8 *)(a1 + 40), &__block_literal_global_288);

}

void __65__CoreEmbeddedSpeechRecognizer_removePersonalizedLMForFidesOnly___block_invoke_287()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[CoreEmbeddedSpeechRecognizer removePersonalizedLMForFidesOnly:]_block_invoke";
    _os_log_impl(&dword_1B3E5F000, v0, OS_LOG_TYPE_INFO, "%s PLM: Removed", (uint8_t *)&v1, 0xCu);
  }
}

void __65__CoreEmbeddedSpeechRecognizer_removePersonalizedLMForFidesOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[CoreEmbeddedSpeechRecognizer removePersonalizedLMForFidesOnly:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_ERROR, "%s PLM: Removal error %@", (uint8_t *)&v4, 0x16u);
  }

}

void __56__CoreEmbeddedSpeechRecognizer_invalidatePersonalizedLM__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer invalidatePersonalizedLM]_block_invoke");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_serviceWithFunctionName:errorHandler:", v3, &__block_literal_global_285);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidatePersonalizedLM");

}

void __56__CoreEmbeddedSpeechRecognizer_invalidatePersonalizedLM__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[CoreEmbeddedSpeechRecognizer invalidatePersonalizedLM]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_ERROR, "%s PLM: Invalidation error %@", (uint8_t *)&v4, 0x16u);
  }

}

void __97__CoreEmbeddedSpeechRecognizer_writeUaapOovsForLanguage_bundleId_customProns_newOovs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer writeUaapOovsForLanguage:bundleId:customProns:newOovs:completion:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__CoreEmbeddedSpeechRecognizer_writeUaapOovsForLanguage_bundleId_customProns_newOovs_completion___block_invoke_2;
  v5[3] = &unk_1E6734A48;
  v6 = *(id *)(a1 + 72);
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeUaapOovsForLanguage:bundleId:customProns:newOovs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

uint64_t __97__CoreEmbeddedSpeechRecognizer_writeUaapOovsForLanguage_bundleId_customProns_newOovs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__CoreEmbeddedSpeechRecognizer_startMissingAssetDownload__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer startMissingAssetDownload]_block_invoke");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_serviceWithFunctionName:errorHandler:", v3, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startMissingAssetDownload");

}

void __89__CoreEmbeddedSpeechRecognizer_resumeRecognitionWithPrefixText_postfixText_selectedText___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeRecognitionWithPrefixText:postfixText:selectedText:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __48__CoreEmbeddedSpeechRecognizer_pauseRecognition__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pauseRecognition");

}

void __78__CoreEmbeddedSpeechRecognizer_deleteAllDESRecordsForDictationPersonalization__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer deleteAllDESRecordsForDictationPersonalization]_block_invoke");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_serviceWithFunctionName:errorHandler:", v3, &__block_literal_global_264);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAllDESRecordsForDictationPersonalizationWithCompletion:", &__block_literal_global_266);

}

void __78__CoreEmbeddedSpeechRecognizer_deleteAllDESRecordsForDictationPersonalization__block_invoke_265(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v4 = 136315394;
      v5 = "-[CoreEmbeddedSpeechRecognizer deleteAllDESRecordsForDictationPersonalization]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Failed to delete DES Records for Dictation Personalization with error=%@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void __78__CoreEmbeddedSpeechRecognizer_deleteAllDESRecordsForDictationPersonalization__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[CoreEmbeddedSpeechRecognizer deleteAllDESRecordsForDictationPersonalization]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Failed to delete DES Records for Dictation Personalization with error=%@", (uint8_t *)&v4, 0x16u);
  }

}

void __42__CoreEmbeddedSpeechRecognizer_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(v2, "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

  }
}

void __50__CoreEmbeddedSpeechRecognizer_requestEagerResult__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestEagerResult");

}

void __49__CoreEmbeddedSpeechRecognizer_stopAudioDecoding__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopAudioDecoding");

}

void __43__CoreEmbeddedSpeechRecognizer_finishAudio__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishAudio");

}

void __90__CoreEmbeddedSpeechRecognizer_addAudioPacket_packetRecordedTime_packetReadyUpstreamTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAudioPacket:packetRecordedTime:packetReadyUpstreamTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __47__CoreEmbeddedSpeechRecognizer_addAudioPacket___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAudioPacket:", *(_QWORD *)(a1 + 40));

}

void __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke(int8x16_t *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  _QWORD v8[5];

  v2 = (void *)a1[2].i64[0];
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke_2;
  v8[3] = &unk_1E6734C40;
  v8[4] = a1[3].i64[0];
  objc_msgSend(v2, "_synchronousServiceWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[2].i64[1];
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke_3;
  v6[3] = &unk_1E6734D30;
  v7 = vextq_s8(a1[3], a1[3], 8uLL);
  objc_msgSend(v4, "fetchModelPropertiesForAssetConfig:completion:", v5, v6);

}

void __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __55__CoreEmbeddedSpeechRecognizer_resetDESWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v2 = dispatch_group_create();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3629;
  v14 = __Block_byref_object_dispose__3630;
  v15 = 0;
  dispatch_group_enter(v2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D398]), "initWithBundleIdentifier:", CFSTR("com.apple.fides.asr"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CoreEmbeddedSpeechRecognizer_resetDESWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6734D08;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "deleteAllSavedRecordsWithCompletion:", v7);

  v5 = dispatch_time(0, 300000000000);
  dispatch_group_wait(v4, v5);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v11[5]);

  _Block_object_dispose(&v10, 8);
}

void __55__CoreEmbeddedSpeechRecognizer_resetDESWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[CoreEmbeddedSpeechRecognizer resetDESWithCompletion:]_block_invoke_2";
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_ERROR, "%s Error deleting all DES records (SPI v2): %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer readProfileAndUserDataWithLanguage:allowOverride:completion:]_block_invoke_2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke_3;
  v5[3] = &unk_1E6734A48;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readProfileAndUserDataWithLanguage:allowOverride:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[CoreEmbeddedSpeechRecognizer readProfileAndUserDataWithLanguage:allowOverride:completion:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke_2;
  v6[3] = &unk_1E6734C40;
  v6[4] = a1[6];
  objc_msgSend(v2, "_synchronousServiceWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[CoreEmbeddedSpeechRecognizer redecodeWithAudioDatas:language:task:samplingRate:completion:]_block_invoke_3";
      _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s User edit ASR redecoding was successful", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke_2;
  v6[3] = &unk_1E6734C40;
  v6[4] = a1[6];
  objc_msgSend(v2, "_synchronousServiceWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[CoreEmbeddedSpeechRecognizer runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalizedL"
           "MPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke_3";
      _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s DES recipe evaluation was successful", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke_2;
  v6[3] = &unk_1E6734C40;
  v6[4] = a1[6];
  objc_msgSend(v2, "_synchronousServiceWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[CoreEmbeddedSpeechRecognizer runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:cas"
           "eSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke_3";
      _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s DES recipe evaluation was successful", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __86__CoreEmbeddedSpeechRecognizer_getOfflineDictationStatusIgnoringCache_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer getOfflineDictationStatusIgnoringCache:withCompletion:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__CoreEmbeddedSpeechRecognizer_getOfflineDictationStatusIgnoringCache_withCompletion___block_invoke_2;
  v5[3] = &unk_1E6734A48;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getOfflineDictationStatusIgnoringCache:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __86__CoreEmbeddedSpeechRecognizer_getOfflineDictationStatusIgnoringCache_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __111__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withDetailedStatus_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer getOfflineAssetStatusIgnoringCache:assetType:withDetailedStatus:withCompletion:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __111__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withDetailedStatus_withCompletion___block_invoke_2;
  v5[3] = &unk_1E6734A48;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getOfflineAssetStatusIgnoringCache:assetType:withDetailedStatus:withCompletion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 40));

}

uint64_t __111__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withDetailedStatus_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer getOfflineAssetStatusIgnoringCache:assetType:withCompletion:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withCompletion___block_invoke_2;
  v5[3] = &unk_1E6734A48;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getOfflineAssetStatusIgnoringCache:assetType:withCompletion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __92__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1B5E32344]();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = v2;
  v6 = v5;

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_2;
  v10[3] = &unk_1E6734B78;
  v10[4] = v8;
  v13 = *(id *)(a1 + 56);
  v11 = v7;
  v12 = *(id *)(a1 + 48);
  v9 = v7;
  objc_msgSend(v8, "readProfileAndUserDataWithLanguage:allowOverride:completion:", v9, 0, v10);

}

void __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer updateSpeechProfileWithLanguage:modelOverridePath:completion:]_block_invoke_2");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_3;
  v17[3] = &unk_1E6734A48;
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_serviceWithFunctionName:errorHandler:", v9, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_4;
  v14[3] = &unk_1E6734B50;
  v15 = v12;
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v11, "updateSpeechProfileWithLanguage:modelOverridePath:existingProfile:existingAssetPath:completion:", v15, v13, v8, v7, v14);

}

uint64_t __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(id, id);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject **v20;
  NSObject *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void (*v29)(void);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  _QWORD v41[4];
  _BYTE v42[24];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7)
  {
    objc_msgSend(v9, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CFEB48]))
    {
      v26 = objc_msgSend(v10, "code");

      if (v26 == 1114)
      {
        v27 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
        {
          v28 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)v42 = 136315394;
          *(_QWORD *)&v42[4] = "-[CoreEmbeddedSpeechRecognizer updateSpeechProfileWithLanguage:modelOverridePath:completi"
                               "on:]_block_invoke_4";
          *(_WORD *)&v42[12] = 2112;
          *(_QWORD *)&v42[14] = v28;
          _os_log_impl(&dword_1B3E5F000, v27, OS_LOG_TYPE_INFO, "%s Update skipped for %@, not propagating an error", v42, 0x16u);
        }
        v29 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_18;
      }
    }
    else
    {

    }
    v29 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_18:
    v29();
    goto LABEL_27;
  }
  v11 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = v11;
  v34 = 0;
  +[CoreEmbeddedSpeechRecognizer profilePathForLanguage:errorOut:](CoreEmbeddedSpeechRecognizer, "profilePathForLanguage:errorOut:", v12, &v34);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v34;
  if (v14)
  {
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = CFSTR("data");
    v41[1] = CFSTR("version");
    *(_QWORD *)v42 = v7;
    *(_QWORD *)&v42[8] = CFSTR("2.0");
    v41[2] = CFSTR("language");
    v41[3] = CFSTR("assetPath");
    *(_QWORD *)&v42[16] = v16;
    v43 = v8;
    v31 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v17, 200, 0, &v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v33;

    v20 = (NSObject **)MEMORY[0x1E0CFE6C0];
    v21 = *MEMORY[0x1E0CFE6C0];
    if (v18)
    {
      v30 = v17;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "WriteSpeechProfileData";
        v37 = 2112;
        v38 = v16;
        _os_log_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_INFO, "%s Serialization of %@ speech profile done.", buf, 0x16u);
      }
      v32 = v19;
      v22 = objc_msgSend(v18, "writeToFile:options:error:", v14, 0x40000000, &v32);
      v15 = v32;

      v23 = *v20;
      v24 = *v20;
      if ((v22 & 1) != 0)
      {
        v17 = v30;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v36 = "WriteSpeechProfileData";
          v37 = 2112;
          v38 = v16;
          v39 = 2112;
          v40 = v14;
          _os_log_impl(&dword_1B3E5F000, v23, OS_LOG_TYPE_INFO, "%s Persisted %@ speech profile to path=%@", buf, 0x20u);
        }
        v19 = 0;
      }
      else
      {
        v17 = v30;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v36 = "WriteSpeechProfileData";
          v37 = 2112;
          v38 = v16;
          v39 = 2114;
          v40 = v15;
          _os_log_error_impl(&dword_1B3E5F000, v23, OS_LOG_TYPE_ERROR, "%s Persisting %@ speech profile to disk failed with error=%{public}@", buf, 0x20u);
        }
        v19 = v15;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "WriteSpeechProfileData";
        v37 = 2112;
        v38 = v16;
        v39 = 2114;
        v40 = v19;
        _os_log_error_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_ERROR, "%s Serialization of  %@ speech profile failed with error=%{public}@", buf, 0x20u);
      }
      v15 = v19;
    }
    v13[2](v13, v19);

    v8 = v31;
  }
  else
  {
    v13[2](v13, v15);
    v16 = v12;
  }

LABEL_27:
}

void __102__CoreEmbeddedSpeechRecognizer_createSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer createSpeechProfileWithLanguage:modelOverridePath:JSONData:completion:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __102__CoreEmbeddedSpeechRecognizer_createSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke_2;
  v5[3] = &unk_1E6734A48;
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createSpeechProfileWithLanguage:modelOverridePath:JSONData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __102__CoreEmbeddedSpeechRecognizer_createSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__CoreEmbeddedSpeechRecognizer_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v4, &__block_literal_global_251);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSpeechCorrectionInfo:interactionIdentifier:", a1[5], a1[6]);

}

void __79__CoreEmbeddedSpeechRecognizer_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[CoreEmbeddedSpeechRecognizer sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke_2";
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Failed to send speech correction info: %@", (uint8_t *)&v6, 0x16u);

    }
  }

}

void __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke(id *a1)
{
  NSObject *v2;
  void (**v3)(id, _QWORD, void *);
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void (**v9)(void *, uint64_t, _QWORD);
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)a1[4] + 8))
  {
    v2 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
      _os_log_error_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_ERROR, "%s Local speech recognizer restarted while already recognizing", buf, 0xCu);
    }
    v3 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 1100, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, v4);
  }
  else
  {
    objc_msgSend(a1[5], "language");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1[4], "_service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startRequestActivityWithCompletion:", &__block_literal_global_3656);

      objc_storeStrong((id *)a1[4] + 7, v4);
      *((_BYTE *)a1[4] + 8) = 1;
      v6 = MEMORY[0x1E0C809B0];
      *((_BYTE *)a1[4] + 32) = 0;
      aBlock[0] = v6;
      aBlock[1] = 3221225472;
      aBlock[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_245;
      aBlock[3] = &unk_1E6734A98;
      v7 = a1[5];
      v8 = a1[4];
      v29 = v7;
      v30 = v8;
      v31 = a1[6];
      v9 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
      v10 = a1[4];
      v11 = v10[10];
      if (v11 || v10[9])
      {
        v12 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
          _os_log_impl(&dword_1B3E5F000, v12, OS_LOG_TYPE_INFO, "%s Using preheat-loaded speech profile", buf, 0xCu);
          v10 = a1[4];
          v11 = v10[10];
        }
        v9[2](v9, v11, v10[9]);
        v13 = a1[4];
        v14 = (void *)v13[9];
        v13[9] = 0;

        v15 = a1[4];
        v16 = (id)v15[10];
        v15[10] = 0;
      }
      else
      {
        objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1B5E32344]();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
          v26 = (void *)v24;
        else
          v26 = v23;
        v16 = v26;

        v27 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
          v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_1B3E5F000, v27, OS_LOG_TYPE_INFO, "%s Loading speech profile for language %@", buf, 0x16u);
        }
        objc_msgSend(a1[4], "readProfileAndUserDataWithLanguage:allowOverride:completion:", v16, 1, v9);
      }

      v17 = v29;
    }
    else
    {
      v18 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
        _os_log_error_impl(&dword_1B3E5F000, v18, OS_LOG_TYPE_ERROR, "%s Invalid nil language", buf, 0xCu);
      }
      v19 = (void (**)(id, _QWORD, void *))a1[6];
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CFEB48];
      v36 = *MEMORY[0x1E0CB2D68];
      v37[0] = CFSTR("Language is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1107, v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v22);

    }
  }

}

void __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_245(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_2;
  v16[3] = &unk_1E6734A20;
  v17 = v3;
  v6 = v3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_3;
  v14[3] = &unk_1E6734A48;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v8, "_serviceWithFunctionName:errorHandler:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_4;
  v12[3] = &unk_1E6734A70;
  v11 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v11;
  objc_msgSend(v10, "startSpeechRecognitionWithParameters:didStartHandlerWithInfo:", v7, v12);

}

uint64_t __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setProfile:", *(_QWORD *)(a1 + 32));
}

uint64_t __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke_4";
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_INFO, "%s Failed to start local recognition: %@", (uint8_t *)&v10, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_244()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
    _os_log_impl(&dword_1B3E5F000, v0, OS_LOG_TYPE_INFO, "%s Local speech recognition completed", (uint8_t *)&v1, 0xCu);
  }
}

void __85__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "modelVersion");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

void __103__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithAssetConfig_preheatSource_modelOverrideURL___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]_block_invoke";
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Preheat loading profile with language %@", buf, 0x16u);
  }
  v4 = *(_QWORD **)(a1 + 40);
  if (!v4[9] && !v4[10])
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __103__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithAssetConfig_preheatSource_modelOverrideURL___block_invoke_226;
    v6[3] = &unk_1E6734850;
    v6[4] = v4;
    objc_msgSend(v4, "readProfileAndUserDataWithLanguage:allowOverride:completion:", v2, 1, v6);
    v4 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v4, "_service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __103__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithAssetConfig_preheatSource_modelOverrideURL___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = *MEMORY[0x1E0CFE6C0];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      v15 = 136315138;
      v16 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]_block_invoke";
      _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s Loaded preheat-loaded speech profile", (uint8_t *)&v15, 0xCu);
    }
    v9 = objc_msgSend(v5, "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 80);
    *(_QWORD *)(v10 + 80) = v9;

    v12 = objc_msgSend(v6, "copy");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 72);
    *(_QWORD *)(v13 + 72) = v12;

  }
  else if (v8)
  {
    v15 = 136315138;
    v16 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]_block_invoke";
    _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s Failed to load speech profile during preheat", (uint8_t *)&v15, 0xCu);
  }

}

void __86__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithLanguage_modelOverrideURL___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 136315394;
    v9 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithLanguage:modelOverrideURL:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_INFO, "%s Preheat loading profile with language %@", buf, 0x16u);
  }
  v4 = (_QWORD *)a1[5];
  if (!v4[9] && !v4[10])
  {
    v5 = a1[4];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithLanguage_modelOverrideURL___block_invoke_224;
    v7[3] = &unk_1E6734850;
    v7[4] = v4;
    objc_msgSend(v4, "readProfileAndUserDataWithLanguage:allowOverride:completion:", v5, 1, v7);
    v4 = (_QWORD *)a1[5];
  }
  objc_msgSend(v4, "_service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preheatSpeechRecognitionWithLanguage:modelOverrideURL:", a1[4], a1[6]);

}

void __86__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithLanguage_modelOverrideURL___block_invoke_224(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = *MEMORY[0x1E0CFE6C0];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      v15 = 136315138;
      v16 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithLanguage:modelOverrideURL:]_block_invoke";
      _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s Loaded preheat-loaded speech profile", (uint8_t *)&v15, 0xCu);
    }
    v9 = objc_msgSend(v5, "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 80);
    *(_QWORD *)(v10 + 80) = v9;

    v12 = objc_msgSend(v6, "copy");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 72);
    *(_QWORD *)(v13 + 72) = v12;

  }
  else if (v8)
  {
    v15 = 136315138;
    v16 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithLanguage:modelOverrideURL:]_block_invoke";
    _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s Failed to load speech profile during preheat", (uint8_t *)&v15, 0xCu);
  }

}

void __70__CoreEmbeddedSpeechRecognizer__serviceWithFunctionName_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[CoreEmbeddedSpeechRecognizer _serviceWithFunctionName:errorHandler:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s %@: Local speech recognition not reachable: %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __43__CoreEmbeddedSpeechRecognizer__connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[CoreEmbeddedSpeechRecognizer _connection]_block_invoke";
    v10 = 2112;
    v11 = CFSTR("com.apple.siri.embeddedspeech");
    _os_log_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_INFO, "%s %@ Interrupted", (uint8_t *)&v8, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "invalidate");
    v5 = v4[3];
    v4[3] = 0;

    if (*((_BYTE *)v4 + 8))
    {
      v6 = objc_loadWeakRetained(v4 + 11);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 1107, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localSpeechRecognizer:didCompletionRecognitionWithStatistics:error:", v4, 0, v7);

    }
  }

}

void __43__CoreEmbeddedSpeechRecognizer__connection__block_invoke_222(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[CoreEmbeddedSpeechRecognizer _connection]_block_invoke";
    v10 = 2112;
    v11 = CFSTR("com.apple.siri.embeddedspeech");
    _os_log_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_INFO, "%s %@ Invalidated", (uint8_t *)&v8, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    WeakRetained[3] = 0;

    if (*((_BYTE *)v4 + 8))
    {
      v6 = objc_loadWeakRetained(v4 + 11);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 1101, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localSpeechRecognizer:didCompletionRecognitionWithStatistics:error:", v4, 0, v7);

    }
  }

}

+ (void)handlePostUpgradeSubscriptions
{
  CoreEmbeddedSpeechRecognizer *v2;
  uint64_t v3;
  CoreEmbeddedSpeechRecognizer *v4;
  void *v5;
  NSObject *queue;
  id v7;
  CoreEmbeddedSpeechRecognizer *v8;
  _QWORD block[4];
  CoreEmbeddedSpeechRecognizer *v10;
  id v11;
  _QWORD aBlock[4];
  CoreEmbeddedSpeechRecognizer *v13;

  v2 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]([CoreEmbeddedSpeechRecognizer alloc], "initWithDelegate:instanceUUID:", 0, CoreEmbeddedSpeechRecognizerInstanceUUIDBackground);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CoreEmbeddedSpeechRecognizer_handlePostUpgradeSubscriptions__block_invoke;
  aBlock[3] = &unk_1E67348C8;
  v4 = v2;
  v13 = v4;
  v5 = _Block_copy(aBlock);
  queue = v4->_queue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __62__CoreEmbeddedSpeechRecognizer_handlePostUpgradeSubscriptions__block_invoke_228;
  block[3] = &unk_1E67348F0;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

+ (void)cleanupUnusedSubscriptions
{
  CoreEmbeddedSpeechRecognizer *v2;
  uint64_t v3;
  CoreEmbeddedSpeechRecognizer *v4;
  void *v5;
  NSObject *queue;
  id v7;
  CoreEmbeddedSpeechRecognizer *v8;
  _QWORD block[4];
  CoreEmbeddedSpeechRecognizer *v10;
  id v11;
  _QWORD aBlock[4];
  CoreEmbeddedSpeechRecognizer *v13;

  v2 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]([CoreEmbeddedSpeechRecognizer alloc], "initWithDelegate:instanceUUID:", 0, CoreEmbeddedSpeechRecognizerInstanceUUIDBackground);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CoreEmbeddedSpeechRecognizer_cleanupUnusedSubscriptions__block_invoke;
  aBlock[3] = &unk_1E67348C8;
  v4 = v2;
  v13 = v4;
  v5 = _Block_copy(aBlock);
  queue = v4->_queue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __58__CoreEmbeddedSpeechRecognizer_cleanupUnusedSubscriptions__block_invoke_230;
  block[3] = &unk_1E67348F0;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

+ (void)compileAllAssetsWithType:(unint64_t)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  CoreEmbeddedSpeechRecognizer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  CoreEmbeddedSpeechRecognizer *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *queue;
  id v20;
  CoreEmbeddedSpeechRecognizer *v21;
  _QWORD block[4];
  CoreEmbeddedSpeechRecognizer *v23;
  id v24;
  unint64_t v25;
  _QWORD aBlock[4];
  id v27;
  CoreEmbeddedSpeechRecognizer *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() > 9)
  {
    v7 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]([CoreEmbeddedSpeechRecognizer alloc], "initWithDelegate:instanceUUID:", 0, CoreEmbeddedSpeechRecognizerInstanceUUIDBackground);
    SFEntitledAssetTypeToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.siri.embeddedspeech.compilation.%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    objc_msgSend(v12, "UTF8String");
    v13 = (void *)os_transaction_create();
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__CoreEmbeddedSpeechRecognizer_compileAllAssetsWithType_completion___block_invoke;
    aBlock[3] = &unk_1E6734918;
    v27 = v8;
    v15 = v7;
    v28 = v15;
    v29 = v13;
    v30 = v5;
    v16 = v13;
    v17 = v8;
    v18 = _Block_copy(aBlock);
    queue = v15->_queue;
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __68__CoreEmbeddedSpeechRecognizer_compileAllAssetsWithType_completion___block_invoke_233;
    block[3] = &unk_1E6734940;
    v23 = v15;
    v24 = v18;
    v25 = a3;
    v20 = v18;
    v21 = v15;
    dispatch_async(queue, block);

  }
  else
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "+[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:completion:]";
      _os_log_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_INFO, "%s Skipping model compilation as this device does not support ANE.", buf, 0xCu);
    }
    if (v5)
      (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

+ (void)forceCooldownIfIdle
{
  CoreEmbeddedSpeechRecognizer *v2;
  NSObject *queue;
  CoreEmbeddedSpeechRecognizer *v4;
  _QWORD block[4];
  CoreEmbeddedSpeechRecognizer *v6;

  v2 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]([CoreEmbeddedSpeechRecognizer alloc], "initWithDelegate:instanceUUID:", 0, CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive);
  queue = v2->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CoreEmbeddedSpeechRecognizer_forceCooldownIfIdle__block_invoke;
  block[3] = &unk_1E6734990;
  v6 = v2;
  v4 = v2;
  dispatch_async(queue, block);

}

+ (id)speechProfileDataLastModifiedDataForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "profilePathForLanguage:errorOut:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB2A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)profilePathForLanguage:(id)a3 errorOut:(id *)a4
{
  id v4;
  size_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  passwd *v17;
  passwd v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sysconf(71);
  if (v5 == -1)
  {
    v7 = 0;
  }
  else
  {
    memset(&v18, 0, sizeof(v18));
    v17 = 0;
    if (getpwnam_r("mobile", &v18, (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5, &v17))
      v6 = 1;
    else
      v6 = v17 == 0;
    if (v6)
    {
      v7 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18.pw_dir);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v19[1] = CFSTR("Library");
      v19[2] = CFSTR("/Assistant");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathWithComponents:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("SpeechProfile"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", CFSTR("_"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingString:", v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = (id)v12;
      }
      else
      {
        v7 = 0;
      }

    }
  }

  return v7;
}

+ (id)dictionaryWithContentsProfilePathForLanguage:(id)a3 errorOut:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "profilePathForLanguage:errorOut:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "+[CoreEmbeddedSpeechRecognizer dictionaryWithContentsProfilePathForLanguage:errorOut:]";
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_INFO, "%s Using user profile from %@", (uint8_t *)&v11, 0x16u);
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 0, a4);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v9 = v8;
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)purgeInstalledAssetsExceptLanguages:(id)a3 error:(id *)a4
{
  id v5;
  CoreEmbeddedSpeechRecognizer *v6;
  uint64_t v7;
  NSObject *queue;
  CoreEmbeddedSpeechRecognizer *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD block[4];
  CoreEmbeddedSpeechRecognizer *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3629;
  v34 = __Block_byref_object_dispose__3630;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3629;
  v28 = __Block_byref_object_dispose__3630;
  v29 = 0;
  v6 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]([CoreEmbeddedSpeechRecognizer alloc], "initWithDelegate:instanceUUID:", 0, CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3629;
  v22 = __Block_byref_object_dispose__3630;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  queue = v6->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke;
  block[3] = &unk_1E6734C68;
  v16 = &v18;
  v9 = v6;
  v15 = v9;
  v17 = &v24;
  dispatch_sync(queue, block);
  v10 = (void *)v19[5];
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke_3;
  v13[3] = &unk_1E6734DA8;
  v13[4] = &v24;
  v13[5] = &v30;
  objc_msgSend(v10, "purgeInstalledAssetsExceptLanguages:completion:", v5, v13);
  -[CoreEmbeddedSpeechRecognizer invalidate](v9, "invalidate");
  if (a4)
    *a4 = objc_retainAutorelease((id)v25[5]);
  v11 = (id)v31[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

+ (BOOL)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 error:(id *)a5
{
  id v7;
  CoreEmbeddedSpeechRecognizer *v8;
  uint64_t v9;
  NSObject *queue;
  CoreEmbeddedSpeechRecognizer *v11;
  void *v12;
  char v13;
  _QWORD v15[6];
  _QWORD block[4];
  CoreEmbeddedSpeechRecognizer *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v7 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3629;
  v30 = __Block_byref_object_dispose__3630;
  v31 = 0;
  v8 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]([CoreEmbeddedSpeechRecognizer alloc], "initWithDelegate:instanceUUID:", 0, CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3629;
  v24 = __Block_byref_object_dispose__3630;
  v25 = 0;
  v9 = MEMORY[0x1E0C809B0];
  queue = v8->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke;
  block[3] = &unk_1E6734C68;
  v18 = &v20;
  v11 = v8;
  v17 = v11;
  v19 = &v26;
  dispatch_sync(queue, block);
  v12 = (void *)v21[5];
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke_3;
  v15[3] = &unk_1E6734DD0;
  v15[4] = &v26;
  v15[5] = &v32;
  objc_msgSend(v12, "purgeInstalledAssetsExceptLanguages:assetType:completion:", v7, a4, v15);
  -[CoreEmbeddedSpeechRecognizer invalidate](v11, "invalidate");
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v13 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

+ (id)offlineDictationStatusIgnoringCache:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  CoreEmbeddedSpeechRecognizer *v6;
  uint64_t v7;
  NSObject *queue;
  CoreEmbeddedSpeechRecognizer *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD block[4];
  CoreEmbeddedSpeechRecognizer *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3629;
  v34 = __Block_byref_object_dispose__3630;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3629;
  v28 = __Block_byref_object_dispose__3630;
  v29 = 0;
  v6 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]([CoreEmbeddedSpeechRecognizer alloc], "initWithDelegate:instanceUUID:", 0, CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3629;
  v22 = __Block_byref_object_dispose__3630;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  queue = v6->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke;
  block[3] = &unk_1E6734C68;
  v16 = &v18;
  v9 = v6;
  v15 = v9;
  v17 = &v30;
  dispatch_sync(queue, block);
  v10 = (void *)v19[5];
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke_3;
  v13[3] = &unk_1E6734DF8;
  v13[4] = &v30;
  v13[5] = &v24;
  objc_msgSend(v10, "getOfflineDictationStatusIgnoringCache:withCompletion:", v5, v13);
  -[CoreEmbeddedSpeechRecognizer invalidate](v9, "invalidate");
  if (a4)
    *a4 = objc_retainAutorelease((id)v31[5]);
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

void __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke_2;
  v6[3] = &unk_1E6734C40;
  v6[4] = a1[6];
  objc_msgSend(v2, "_synchronousServiceWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = a3;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke_2;
  v6[3] = &unk_1E6734C40;
  v6[4] = a1[6];
  objc_msgSend(v2, "_synchronousServiceWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke_2;
  v6[3] = &unk_1E6734C40;
  v6[4] = a1[6];
  objc_msgSend(v2, "_synchronousServiceWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = a3;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__CoreEmbeddedSpeechRecognizer_forceCooldownIfIdle__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "+[CoreEmbeddedSpeechRecognizer forceCooldownIfIdle]_block_invoke";
    _os_log_impl(&dword_1B3E5F000, v2, OS_LOG_TYPE_INFO, "%s Starting to cooldown", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CoreEmbeddedSpeechRecognizer_forceCooldownIfIdle__block_invoke_234;
  v4[3] = &unk_1E6734968;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "forceCooldownIfIdleWithCompletion:", v4);

}

uint64_t __51__CoreEmbeddedSpeechRecognizer_forceCooldownIfIdle__block_invoke_234(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NOT");
    if (a2)
      v5 = &stru_1E67359A8;
    v7 = 136315394;
    v8 = "+[CoreEmbeddedSpeechRecognizer forceCooldownIfIdle]_block_invoke";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Forced cooldown and was %@successful", (uint8_t *)&v7, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __68__CoreEmbeddedSpeechRecognizer_compileAllAssetsWithType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "+[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:completion:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_ERROR, "%s Error requesting model compilation for %@ assets: %@", (uint8_t *)&v7, 0x20u);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 0);

}

void __68__CoreEmbeddedSpeechRecognizer_compileAllAssetsWithType_completion___block_invoke_233(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:completion:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v4, a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compileAllAssetsWithType:completion:", a1[6], a1[5]);

}

void __58__CoreEmbeddedSpeechRecognizer_cleanupUnusedSubscriptions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "+[CoreEmbeddedSpeechRecognizer cleanupUnusedSubscriptions]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v5, OS_LOG_TYPE_ERROR, "%s Error requesting daily subscriptions cleanup: %@", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __58__CoreEmbeddedSpeechRecognizer_cleanupUnusedSubscriptions__block_invoke_230(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CoreEmbeddedSpeechRecognizer cleanupUnusedSubscriptions]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v4, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupUnusedSubscriptions");

}

void __62__CoreEmbeddedSpeechRecognizer_handlePostUpgradeSubscriptions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "+[CoreEmbeddedSpeechRecognizer handlePostUpgradeSubscriptions]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v5, OS_LOG_TYPE_ERROR, "%s Error requesting post-upgrade subscriptions: %@", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __62__CoreEmbeddedSpeechRecognizer_handlePostUpgradeSubscriptions__block_invoke_228(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CoreEmbeddedSpeechRecognizer handlePostUpgradeSubscriptions]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_serviceWithFunctionName:errorHandler:", v4, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handlePostUpgradeSubscriptions");

}

@end
