@implementation SFLocalSpeechRecognitionClient

- (SFLocalSpeechRecognitionClient)initWithDelegate:(id)a3
{
  id v4;
  SFLocalSpeechRecognitionClient *v5;

  v4 = a3;
  v5 = -[SFLocalSpeechRecognitionClient init](self, "init");
  objc_storeWeak((id *)&v5->_delegate, v4);

  return v5;
}

- (SFLocalSpeechRecognitionClient)init
{
  SFLocalSpeechRecognitionClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSXPCConnection *lsrConnection;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  NSError *connectionUnavailableError;
  NSXPCConnection *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SFLocalSpeechRecognitionClient;
  v2 = -[SFLocalSpeechRecognitionClient init](&v21, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("SFLocalSpeechRecognitionClient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.speech.localspeechrecognition"));
    lsrConnection = v2->_lsrConnection;
    v2->_lsrConnection = (NSXPCConnection *)v5;

    v7 = v2->_lsrConnection;
    SFLSRGetInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    v9 = v2->_lsrConnection;
    SFLSRDelegateGetInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v10);

    -[NSXPCConnection setExportedObject:](v2->_lsrConnection, "setExportedObject:", v2);
    connectionUnavailableError = v2->_connectionUnavailableError;
    v2->_connectionUnavailableError = 0;

    objc_initWeak(&location, v2);
    v12 = v2->_lsrConnection;
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __38__SFLocalSpeechRecognitionClient_init__block_invoke;
    v18[3] = &unk_1E6485E20;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v18);
    v14 = v2->_lsrConnection;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __38__SFLocalSpeechRecognitionClient_init__block_invoke_2;
    v16[3] = &unk_1E6485E20;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v16);
    -[NSXPCConnection resume](v2->_lsrConnection, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFLocalSpeechRecognitionClient_invalidate__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SFLocalSpeechRecognitionClient dealloc]";
    _os_log_debug_impl(&dword_1B2494000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SFLocalSpeechRecognitionClient;
  -[SFLocalSpeechRecognitionClient dealloc](&v4, sel_dealloc);
}

- (void)startRecordedAudioDictationWithParameters:(id)a3
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
  v7[2] = __76__SFLocalSpeechRecognitionClient_startRecordedAudioDictationWithParameters___block_invoke;
  v7[3] = &unk_1E6486378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

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
  v7[2] = __49__SFLocalSpeechRecognitionClient_addAudioPacket___block_invoke;
  v7[3] = &unk_1E6486378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stopSpeech
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFLocalSpeechRecognitionClient_stopSpeech__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelSpeech
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SFLocalSpeechRecognitionClient_cancelSpeech__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)preloadRecognizerForLanguage:(id)a3 task:(id)a4 clientID:(id)a5 recognitionOverrides:(id)a6 modelOverrideURL:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __126__SFLocalSpeechRecognitionClient_preloadRecognizerForLanguage_task_clientID_recognitionOverrides_modelOverrideURL_completion___block_invoke;
  block[3] = &unk_1E64859A8;
  v32 = v18;
  v33 = v19;
  block[4] = self;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = v19;
  dispatch_async(queue, block);

}

- (void)pathToAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__SFLocalSpeechRecognitionClient_pathToAssetWithConfig_clientID_completion___block_invoke;
  v13[3] = &unk_1E6485980;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathToAssetWithConfig:clientID:completion:", v11, v10, v9);

}

- (void)supportedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SFLocalSpeechRecognitionClient_supportedLanguagesForAssetType_completion___block_invoke;
  block[3] = &unk_1E64859D0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)installedLanguagesForAssetType:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *queue;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v8 = a5;
  v9 = v8;
  if (v5)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke;
    v17[3] = &unk_1E6485980;
    v10 = v8;
    v18 = v10;
    -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "installedLanguagesForAssetType:completion:", a3, v10);

    v12 = v18;
  }
  else
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke_39;
    v14[3] = &unk_1E64859D0;
    v14[4] = self;
    v15 = v8;
    v16 = a3;
    dispatch_async(queue, v14);
    v12 = v15;
  }

}

- (void)initializeWithSandboxExtensions:(id)a3
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
  v7[2] = __66__SFLocalSpeechRecognitionClient_initializeWithSandboxExtensions___block_invoke;
  v7[3] = &unk_1E6486378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 progress:(id)a5 completionHandler:(id)a6
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
  block[2] = __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke;
  block[3] = &unk_1E6485AD0;
  v22 = v12;
  v23 = v13;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  v18 = v12;
  dispatch_async(queue, block);

}

- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 detailedProgress:(id)a5 completionHandler:(id)a6
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
  block[2] = __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke;
  block[3] = &unk_1E6485AD0;
  v22 = v12;
  v23 = v13;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  v18 = v12;
  dispatch_async(queue, block);

}

- (void)fetchAssetsForLanguage:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__SFLocalSpeechRecognitionClient_fetchAssetsForLanguage_clientID_completion___block_invoke;
  v13[3] = &unk_1E6485980;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetsForLanguage:clientID:completion:", v11, v10, v9);

}

- (void)configParametersForVoicemailWithLanguage:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__SFLocalSpeechRecognitionClient_configParametersForVoicemailWithLanguage_clientID_completion___block_invoke;
  v13[3] = &unk_1E6485980;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configParametersForVoicemailWithLanguage:clientID:completion:", v11, v10, v9);

}

- (void)unsubscribeFromAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__SFLocalSpeechRecognitionClient_unsubscribeFromAssetWithConfig_clientID_completion___block_invoke;
  v13[3] = &unk_1E6485980;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unsubscribeFromAssetWithConfig:clientID:completion:", v11, v10, v9);

}

- (void)subscriptionsForClientId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SFLocalSpeechRecognitionClient_subscriptionsForClientId_completion___block_invoke;
  v10[3] = &unk_1E6485980;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscriptionsForClientId:completion:", v8, v7);

}

- (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 clientID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__SFLocalSpeechRecognitionClient_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion___block_invoke;
  block[3] = &unk_1E6485AF8;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(queue, block);

}

- (void)initializeLmWithLocale:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__SFLocalSpeechRecognitionClient_initializeLmWithLocale_clientID_completion___block_invoke;
  v13[3] = &unk_1E6485980;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "initializeLmWithLocale:clientID:completion:", v11, v10, v9);

}

- (void)initializeLmWithAssetPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__SFLocalSpeechRecognitionClient_initializeLmWithAssetPath_completion___block_invoke;
  v10[3] = &unk_1E6485980;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "initializeLmWithAssetPath:completion:", v8, v7);

}

- (void)addSentenceToNgramCounts:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, &__block_literal_global_44);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSentenceToNgramCounts:", v4);

}

- (void)addSentenceToNgramCounts:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SFLocalSpeechRecognitionClient_addSentenceToNgramCounts_completion___block_invoke;
  v10[3] = &unk_1E6485980;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSentenceToNgramCounts:completion:", v8, v7);

}

- (void)addProns:(id)a3 forWord:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SFLocalSpeechRecognitionClient_addProns_forWord_completion___block_invoke;
  v13[3] = &unk_1E6485980;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addProns:forWord:completion:", v11, v10, v9);

}

- (void)oovWordsAndFrequenciesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SFLocalSpeechRecognitionClient_oovWordsAndFrequenciesWithCompletion___block_invoke;
  v7[3] = &unk_1E6485980;
  v8 = v4;
  v5 = v4;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oovWordsAndFrequenciesWithCompletion:", v5);

}

- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 sandboxExtension:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__SFLocalSpeechRecognitionClient_trainFromPlainTextAndWriteToDirectory_sandboxExtension_completion___block_invoke;
  v13[3] = &unk_1E6485980;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:", v11, v10, v9);

}

- (void)generateNgramCountsSerializeDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__SFLocalSpeechRecognitionClient_generateNgramCountsSerializeDataWithCompletion___block_invoke;
  v7[3] = &unk_1E6485980;
  v8 = v4;
  v5 = v4;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateNgramCountsSerializeDataWithCompletion:", v5);

}

- (void)deserializeNgramCountsData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SFLocalSpeechRecognitionClient_deserializeNgramCountsData_completion___block_invoke;
  v10[3] = &unk_1E6485980;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deserializeNgramCountsData:completion:", v8, v7);

}

- (void)lmeThresholdWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SFLocalSpeechRecognitionClient_lmeThresholdWithCompletion___block_invoke;
  v7[3] = &unk_1E6485980;
  v8 = v4;
  v5 = v4;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lmeThresholdWithCompletion:", v5);

}

- (void)metricsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SFLocalSpeechRecognitionClient_metricsWithCompletion___block_invoke;
  v7[3] = &unk_1E6485980;
  v8 = v4;
  v5 = v4;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metricsWithCompletion:", v5);

}

- (void)wakeUpWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFLocalSpeechRecognitionClient_wakeUpWithCompletion___block_invoke;
  v7[3] = &unk_1E6485980;
  v8 = v4;
  v5 = v4;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wakeUpWithCompletion:", v5);

}

- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtension:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v14 = a8;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __139__SFLocalSpeechRecognitionClient_trainAppLmFromNgramsSerializedData_customPronsData_language_writeToDirectory_sandboxExtension_completion___block_invoke;
  v22[3] = &unk_1E6485980;
  v23 = v14;
  v15 = v14;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:", v20, v19, v18, v17, v16, v15);

}

- (void)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v14 = a8;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __166__SFLocalSpeechRecognitionClient_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeToDirectory_sandboxExtensions_completion___block_invoke;
  v22[3] = &unk_1E6485980;
  v23 = v14;
  v15 = v14;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeToDirectory:sandboxExtensions:completion:", v20, v19, v18, v17, v16, v15);

}

- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeToDirectory:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __129__SFLocalSpeechRecognitionClient_createNgramCountsArtifactFromPhraseCountArtifact_writeToDirectory_sandboxExtensions_completion___block_invoke;
  v16[3] = &unk_1E6485980;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createNgramCountsArtifactFromPhraseCountArtifact:writeToDirectory:sandboxExtensions:completion:", v14, v13, v12, v11);

}

- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v14 = a8;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __130__SFLocalSpeechRecognitionClient_trainAppLmFromNgramCountsArtifact_forApp_language_writeToDirectory_sandboxExtensions_completion___block_invoke;
  v22[3] = &unk_1E6485980;
  v23 = v14;
  v15 = v14;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:", v20, v19, v18, v17, v16, v15);

}

- (void)appLmNeedsRebuild:(id)a3 language:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__SFLocalSpeechRecognitionClient_appLmNeedsRebuild_language_sandboxExtensions_completion___block_invoke;
  v16[3] = &unk_1E6485980;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appLmNeedsRebuild:language:sandboxExtensions:completion:", v14, v13, v12, v11);

}

- (void)synchronousCreateEuclidInstanceForLanguageStr:(id)a3 clientID:(id)a4 inputFormat:(int64_t)a5 loadingOption:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v12 = a7;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __126__SFLocalSpeechRecognitionClient_synchronousCreateEuclidInstanceForLanguageStr_clientID_inputFormat_loadingOption_completion___block_invoke;
  v17[3] = &unk_1E6485980;
  v18 = v12;
  v13 = v12;
  v14 = a4;
  v15 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "synchronousCreateEuclidInstanceForLanguageStr:clientID:inputFormat:loadingOption:completion:", v15, v14, a5, a6, v13);

}

- (void)synchronousComputeEuclidEmbeddingsForSources:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__SFLocalSpeechRecognitionClient_synchronousComputeEuclidEmbeddingsForSources_completion___block_invoke;
  v10[3] = &unk_1E6485980;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousComputeEuclidEmbeddingsForSources:completion:", v8, v7);

}

- (void)localSpeechRecognitionDidFail:(id)a3
{
  SFLocalSpeechRecognitionDelegate **p_delegate;
  id v5;
  id WeakRetained;
  NSObject *queue;
  _QWORD block[5];

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecognitionDidFail:", self, v5);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidFail___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognitionDidFinishRecognition:(id)a3
{
  SFLocalSpeechRecognitionDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:didFinishRecognition:", self, v5);

}

- (void)localSpeechRecognitionDidProcessAudioDuration:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:didProcessAudioDuration:", self, a3);

}

- (void)localSpeechRecognitionDidRecognizePartialResult:(id)a3 rawPartialResult:(id)a4
{
  SFLocalSpeechRecognitionDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:didRecognizePartialResult:rawPartialResult:", self, v8, v7);

}

- (void)localSpeechRecognitionDidSucceed
{
  id WeakRetained;
  NSObject *queue;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognitionClientSpeechRecognitionDidSucceed:", self);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidSucceed__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognitionDidDownloadAssetsWithProgress:(unint64_t)a3 isStalled:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidDownloadAssetsWithProgress_isStalled___block_invoke;
  block[3] = &unk_1E6485B40;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognitionDidFinishDownloadingAssets:(id)a3 error:(id)a4
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
  block[2] = __89__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidFinishDownloadingAssets_error___block_invoke;
  block[3] = &unk_1E6485CE0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (SFLocalSpeechRecognitionDelegate)delegate
{
  return (SFLocalSpeechRecognitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_downloadCompletion, 0);
  objc_storeStrong(&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_connectionUnavailableError, 0);
  objc_storeStrong((id *)&self->_lsrConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __89__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidFinishDownloadingAssets_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

void __96__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidDownloadAssetsWithProgress_isStalled___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;

  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  if (v2)
  {
    v3 = v2;
    v2[2](v2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  }

}

uint64_t __66__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidSucceed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 0;
  return result;
}

uint64_t __64__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidFail___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 0;
  return result;
}

void __90__SFLocalSpeechRecognitionClient_synchronousComputeEuclidEmbeddingsForSources_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

- (_QWORD)_serviceProxyWithErrorHandler:(_QWORD *)a1
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  void *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  if (a1)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1440;
    v18 = __Block_byref_object_dispose__1441;
    v19 = 0;
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__1440;
    v12 = __Block_byref_object_dispose__1441;
    v13 = 0;
    v4 = a1[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__SFLocalSpeechRecognitionClient__serviceProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E6485930;
    block[4] = a1;
    block[5] = &v14;
    block[6] = &v8;
    dispatch_sync(v4, block);
    v5 = (void *)v15[5];
    if (v5)
    {
      objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v3);
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3[2](v3, v9[5]);
      a1 = 0;
    }
    _Block_object_dispose(&v8, 8);

    _Block_object_dispose(&v14, 8);
  }

  return a1;
}

void __64__SFLocalSpeechRecognitionClient__serviceProxyWithErrorHandler___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
}

void __126__SFLocalSpeechRecognitionClient_synchronousCreateEuclidInstanceForLanguageStr_clientID_inputFormat_loadingOption_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __90__SFLocalSpeechRecognitionClient_appLmNeedsRebuild_language_sandboxExtensions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __130__SFLocalSpeechRecognitionClient_trainAppLmFromNgramCountsArtifact_forApp_language_writeToDirectory_sandboxExtensions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

void __129__SFLocalSpeechRecognitionClient_createNgramCountsArtifactFromPhraseCountArtifact_writeToDirectory_sandboxExtensions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __166__SFLocalSpeechRecognitionClient_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeToDirectory_sandboxExtensions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __139__SFLocalSpeechRecognitionClient_trainAppLmFromNgramsSerializedData_customPronsData_language_writeToDirectory_sandboxExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

void __55__SFLocalSpeechRecognitionClient_wakeUpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __56__SFLocalSpeechRecognitionClient_metricsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __61__SFLocalSpeechRecognitionClient_lmeThresholdWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, -1);

}

void __72__SFLocalSpeechRecognitionClient_deserializeNgramCountsData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __81__SFLocalSpeechRecognitionClient_generateNgramCountsSerializeDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __100__SFLocalSpeechRecognitionClient_trainFromPlainTextAndWriteToDirectory_sandboxExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

void __71__SFLocalSpeechRecognitionClient_oovWordsAndFrequenciesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __62__SFLocalSpeechRecognitionClient_addProns_forWord_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __70__SFLocalSpeechRecognitionClient_addSentenceToNgramCounts_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __59__SFLocalSpeechRecognitionClient_addSentenceToNgramCounts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v4 = 138412546;
    v5 = CFSTR("com.apple.speech.localspeechrecognition");
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1B2494000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __71__SFLocalSpeechRecognitionClient_initializeLmWithAssetPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __77__SFLocalSpeechRecognitionClient_initializeLmWithLocale_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __98__SFLocalSpeechRecognitionClient_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__SFLocalSpeechRecognitionClient_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion___block_invoke_2;
  v4[3] = &unk_1E6485980;
  v5 = *(id *)(a1 + 56);
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPurgeabilityForAssetWithConfig:purgeable:clientID:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __98__SFLocalSpeechRecognitionClient_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (id)_asynchronousServiceProxyWithErrorHandler:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  void *v4;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = *(void **)(a1 + 16);
    if (v4)
    {
      objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v3);
      a1 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3[2](v3, *(_QWORD *)(a1 + 24));
      a1 = 0;
    }
  }

  return (id)a1;
}

void __70__SFLocalSpeechRecognitionClient_subscriptionsForClientId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, MEMORY[0x1E0C9AA60]);

}

void __85__SFLocalSpeechRecognitionClient_unsubscribeFromAssetWithConfig_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __95__SFLocalSpeechRecognitionClient_configParametersForVoicemailWithLanguage_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __77__SFLocalSpeechRecognitionClient_fetchAssetsForLanguage_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;

  v2 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(_QWORD *)(a1 + 32);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke_2;
  v13 = &unk_1E6486570;
  v14 = v8;
  v15 = *(id *)(a1 + 64);
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v8, &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "downloadAssetsForConfig:clientID:detailedProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, v10, v11, v12, v13, v14);

}

void __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v13 = CFSTR("com.apple.speech.localspeechrecognition");
    v14 = 2112;
    v15 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke_43;
  block[3] = &unk_1E6485AA8;
  block[4] = v5;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, block);

}

uint64_t __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke_43(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  v2 = a1[4];
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = a1[4];
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, a1[5]);
  return result;
}

void __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6485A80;
  v14 = *(id *)(a1 + 56);
  v3 = _Block_copy(aBlock);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(a1 + 32);
  v11[0] = v2;
  v11[1] = 3221225472;
  v11[2] = __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_3;
  v11[3] = &unk_1E6486570;
  v11[4] = v9;
  v12 = *(id *)(a1 + 64);
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "downloadAssetsForConfig:clientID:detailedProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

uint64_t __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v13 = CFSTR("com.apple.speech.localspeechrecognition");
    v14 = 2112;
    v15 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_42;
  block[3] = &unk_1E6485AA8;
  block[4] = v5;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, block);

}

uint64_t __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_42(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  v2 = a1[4];
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = a1[4];
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, a1[5]);
  return result;
}

void __66__SFLocalSpeechRecognitionClient_initializeWithSandboxExtensions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__SFLocalSpeechRecognitionClient_initializeWithSandboxExtensions___block_invoke_2;
  v4[3] = &unk_1E6485958;
  v4[4] = v2;
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initializeWithSandboxExtensions:", *(_QWORD *)(a1 + 40));

}

void __66__SFLocalSpeechRecognitionClient_initializeWithSandboxExtensions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecognitionDidFail:", *(_QWORD *)(a1 + 32), v3);

}

void __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412546;
    v8 = CFSTR("com.apple.speech.localspeechrecognition");
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke_39(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke_2;
  v4[3] = &unk_1E6485980;
  v2 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installedLanguagesForAssetType:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412546;
    v8 = CFSTR("com.apple.speech.localspeechrecognition");
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __76__SFLocalSpeechRecognitionClient_supportedLanguagesForAssetType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SFLocalSpeechRecognitionClient_supportedLanguagesForAssetType_completion___block_invoke_2;
  v4[3] = &unk_1E6485980;
  v2 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedLanguagesForAssetType:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __76__SFLocalSpeechRecognitionClient_supportedLanguagesForAssetType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412546;
    v8 = CFSTR("com.apple.speech.localspeechrecognition");
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __76__SFLocalSpeechRecognitionClient_pathToAssetWithConfig_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __126__SFLocalSpeechRecognitionClient_preloadRecognizerForLanguage_task_clientID_recognitionOverrides_modelOverrideURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __126__SFLocalSpeechRecognitionClient_preloadRecognizerForLanguage_task_clientID_recognitionOverrides_modelOverrideURL_completion___block_invoke_2;
  v4[3] = &unk_1E6485980;
  v5 = *(id *)(a1 + 80);
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preloadRecognizerForLanguage:task:clientID:recognitionOverrides:modelOverrideURL:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

}

void __126__SFLocalSpeechRecognitionClient_preloadRecognizerForLanguage_task_clientID_recognitionOverrides_modelOverrideURL_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __46__SFLocalSpeechRecognitionClient_cancelSpeech__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__SFLocalSpeechRecognitionClient_cancelSpeech__block_invoke_2;
  v3[3] = &unk_1E6485958;
  v3[4] = v1;
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v1, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelSpeech");

}

void __46__SFLocalSpeechRecognitionClient_cancelSpeech__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecognitionDidFail:", *(_QWORD *)(a1 + 32), v3);

}

void __44__SFLocalSpeechRecognitionClient_stopSpeech__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__SFLocalSpeechRecognitionClient_stopSpeech__block_invoke_2;
  v3[3] = &unk_1E6485958;
  v3[4] = v1;
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v1, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSpeech");

}

void __44__SFLocalSpeechRecognitionClient_stopSpeech__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecordingDidFail:", *(_QWORD *)(a1 + 32), v3);

}

void __49__SFLocalSpeechRecognitionClient_addAudioPacket___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SFLocalSpeechRecognitionClient_addAudioPacket___block_invoke_2;
  v4[3] = &unk_1E6485958;
  v4[4] = v2;
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAudioPacket:", *(_QWORD *)(a1 + 40));

}

void __49__SFLocalSpeechRecognitionClient_addAudioPacket___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecordingDidFail:", *(_QWORD *)(a1 + 32), v3);

}

void __76__SFLocalSpeechRecognitionClient_startRecordedAudioDictationWithParameters___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    v3 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B2494000, v3, OS_LOG_TYPE_ERROR, "Local speech recognizer restarted while already recognizing", buf, 2u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 56));
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 1100, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecognitionDidFail:", v5, v6);

  }
  else
  {
    *(_BYTE *)(v2 + 48) = 1;
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__SFLocalSpeechRecognitionClient_startRecordedAudioDictationWithParameters___block_invoke_35;
    v8[3] = &unk_1E6485958;
    v8[4] = v7;
    -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v7, v8);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "startRecordedAudioDictationWithParameters:", *(_QWORD *)(a1 + 40));
  }

}

void __76__SFLocalSpeechRecognitionClient_startRecordedAudioDictationWithParameters___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = CFSTR("com.apple.speech.localspeechrecognition");
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecognitionDidFail:", *(_QWORD *)(a1 + 32), v3);

}

void *__44__SFLocalSpeechRecognitionClient_invalidate__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return (void *)objc_msgSend(result, "invalidate");
  return result;
}

void __38__SFLocalSpeechRecognitionClient_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  _QWORD *v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = CFSTR("com.apple.speech.localspeechrecognition");
    _os_log_impl(&dword_1B2494000, v2, OS_LOG_TYPE_INFO, "%@ Interrupted", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__SFLocalSpeechRecognitionClient_init__block_invoke_29;
    block[3] = &unk_1E6486328;
    v7 = WeakRetained;
    dispatch_async(v5, block);

  }
}

void __38__SFLocalSpeechRecognitionClient_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  _QWORD *v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = CFSTR("com.apple.speech.localspeechrecognition");
    _os_log_impl(&dword_1B2494000, v2, OS_LOG_TYPE_INFO, "%@ Invalidated", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__SFLocalSpeechRecognitionClient_init__block_invoke_32;
    block[3] = &unk_1E6486328;
    v7 = WeakRetained;
    dispatch_async(v5, block);

  }
}

uint64_t __38__SFLocalSpeechRecognitionClient_init__block_invoke_32(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 1101, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 56));
    objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecognitionDidFail:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    v7 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v7, "localSpeechRecognitionDidFinishDownloadingAssets:error:", 0, *(_QWORD *)(v7 + 24));
}

uint64_t __38__SFLocalSpeechRecognitionClient_init__block_invoke_29(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 1107, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 56));
    objc_msgSend(WeakRetained, "localSpeechRecognitionClient:speechRecognitionDidFail:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    v7 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v7, "localSpeechRecognitionDidFinishDownloadingAssets:error:", 0, *(_QWORD *)(v7 + 24));
}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.speech.localspeechrecognition", "SFLocalSpeechRecognitionClient");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

+ (void)logCoreAnalyticsEvent:(id)a3 withAnalytics:(id)a4
{
  id v5;
  id v6;
  SFLocalSpeechRecognitionClient *v7;
  NSObject *queue;
  id v9;
  id v10;
  SFLocalSpeechRecognitionClient *v11;
  _QWORD block[4];
  SFLocalSpeechRecognitionClient *v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  queue = v7->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SFLocalSpeechRecognitionClient_logCoreAnalyticsEvent_withAnalytics___block_invoke;
  block[3] = &unk_1E6485CE0;
  v13 = v7;
  v14 = v5;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  v11 = v7;
  dispatch_async(queue, block);

}

+ (void)cleanupCacheWithCompletion:(id)a3
{
  id v3;
  SFLocalSpeechRecognitionClient *v4;
  NSObject *queue;
  id v6;
  SFLocalSpeechRecognitionClient *v7;
  _QWORD v8[4];
  SFLocalSpeechRecognitionClient *v9;
  id v10;

  v3 = a3;
  v4 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  queue = v4->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SFLocalSpeechRecognitionClient_cleanupCacheWithCompletion___block_invoke;
  v8[3] = &unk_1E6485A58;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __61__SFLocalSpeechRecognitionClient_cleanupCacheWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](*(_QWORD *)(a1 + 32), &__block_literal_global_40);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanupCacheWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __61__SFLocalSpeechRecognitionClient_cleanupCacheWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = CFSTR("com.apple.speech.localspeechrecognition");
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1B2494000, v3, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __70__SFLocalSpeechRecognitionClient_logCoreAnalyticsEvent_withAnalytics___block_invoke(uint64_t *a1)
{
  id v2;

  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](a1[4], &__block_literal_global_1457);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logCoreAnalyticsEvent:withAnalytics:", a1[5], a1[6]);

}

void __70__SFLocalSpeechRecognitionClient_logCoreAnalyticsEvent_withAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = CFSTR("com.apple.speech.localspeechrecognition");
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1B2494000, v3, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v4, 0x16u);
  }

}

@end
