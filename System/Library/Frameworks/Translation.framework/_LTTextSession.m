@implementation _LTTextSession

+ (OS_dispatch_queue)synchronizationQueue
{
  if (synchronizationQueue_onceToken != -1)
    dispatch_once(&synchronizationQueue_onceToken, &__block_literal_global_8);
  return (OS_dispatch_queue *)(id)synchronizationQueue_synchronizationQueue;
}

- (_LTTextSession)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  id v7;
  id v8;
  _LTTextSession *v9;
  _LTTextSession *v10;
  uint64_t v11;
  NSMutableDictionary *inProgressMultiParagraphRequestByUUID;
  _LTTranslator *v13;
  _LTTranslator *translator;
  uint64_t v15;
  _LTTranslationSession *translationSession;
  _LTPreflightChecker *v17;
  _LTPreflightChecker *preflightChecker;
  _LTLanguageAvailability *v19;
  _LTLanguageAvailability *languageAvailability;
  _LTTextSession *v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_LTTextSession;
  v9 = -[_LTTextSession init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLocale, a3);
    objc_storeStrong((id *)&v10->_targetLocale, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    inProgressMultiParagraphRequestByUUID = v10->_inProgressMultiParagraphRequestByUUID;
    v10->_inProgressMultiParagraphRequestByUUID = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(_LTTranslator);
    translator = v10->_translator;
    v10->_translator = v13;

    -[_LTTranslator startTranslationSession](v10->_translator, "startTranslationSession");
    v15 = objc_claimAutoreleasedReturnValue();
    translationSession = v10->_translationSession;
    v10->_translationSession = (_LTTranslationSession *)v15;

    v17 = objc_alloc_init(_LTPreflightChecker);
    preflightChecker = v10->_preflightChecker;
    v10->_preflightChecker = v17;

    -[_LTPreflightChecker setDelegate:](v10->_preflightChecker, "setDelegate:", v10);
    objc_storeWeak((id *)&v10->_textTranslator, v10);
    v19 = objc_alloc_init(_LTLanguageAvailability);
    languageAvailability = v10->_languageAvailability;
    v10->_languageAvailability = v19;

    v21 = v10;
  }

  return v10;
}

- (void)translateString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _LTTextInput *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _LTTextInput *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134217984;
    v17 = objc_msgSend(v6, "length");
    _os_log_impl(&dword_235438000, v9, OS_LOG_TYPE_DEFAULT, "Client asked to translate single string: of length %zu", buf, 0xCu);

  }
  v10 = -[_LTTextInput initWithSourceText:clientIdentifier:]([_LTTextInput alloc], "initWithSourceText:clientIdentifier:", v6, 0);
  v15 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52___LTTextSession_translateString_completionHandler___block_invoke;
  v13[3] = &unk_250694000;
  v14 = v7;
  v12 = v7;
  -[_LTTextSession translateBatch:itemHandler:completionHandler:](self, "translateBatch:itemHandler:completionHandler:", v11, 0, v13);

}

- (void)translateBatch:(id)a3 itemHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTTextSessionRequest *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_LTTextSessionRequest initWithBatch:sourceLocale:targetLocale:itemHandler:completionHandler:]([_LTTextSessionRequest alloc], "initWithBatch:sourceLocale:targetLocale:itemHandler:completionHandler:", v10, self->_sourceLocale, self->_targetLocale, v9, v8);

  -[_LTTextSession _prepareRequest:](self, "_prepareRequest:", v11);
}

- (void)prepareDownloadsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[_LTTextSessionRequest initForDownloadRequestWithSourceLocale:targetLocale:completionHandler:]([_LTTextSessionRequest alloc], "initForDownloadRequestWithSourceLocale:targetLocale:completionHandler:", self->_sourceLocale, self->_targetLocale, v4);

  -[_LTTextSession _prepareRequest:](self, "_prepareRequest:", v5);
}

- (void)cancel
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __24___LTTextSession_cancel__block_invoke;
  v3[3] = &unk_250693730;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setAllowOnlineTranslation:(BOOL)a3
{
  -[_LTLanguageAvailability setAllowOnlineTranslation:](self->_languageAvailability, "setAllowOnlineTranslation:", a3);
}

- (BOOL)allowOnlineTranslation
{
  return -[_LTLanguageAvailability allowOnlineTranslation](self->_languageAvailability, "allowOnlineTranslation");
}

- (void)setLocaleProvider:(id)a3
{
  -[_LTLanguageAvailability setLocaleProvider:](self->_languageAvailability, "setLocaleProvider:", a3);
}

- (_LTTextSessionLocaleProviding)localeProvider
{
  return -[_LTLanguageAvailability localeProvider](self->_languageAvailability, "localeProvider");
}

- (void)_prepareRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _LTTextSession *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "batch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 134217984;
    v17 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_235438000, v7, OS_LOG_TYPE_DEFAULT, "Client asked to translate batch of %zu inputs", buf, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __34___LTTextSession__prepareRequest___block_invoke;
  v11[3] = &unk_250694068;
  objc_copyWeak(&v15, (id *)buf);
  v12 = v4;
  v13 = v8;
  v14 = self;
  v9 = v8;
  v10 = v4;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)_beginBatchRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  id location;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  objc_msgSend(v4, "batch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = v8;
    do
    {
      dispatch_group_enter(v6);
      --v9;
    }
    while (v9);
  }
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __37___LTTextSession__beginBatchRequest___block_invoke;
  v18[3] = &unk_2506940E0;
  objc_copyWeak(&v22, &location);
  v11 = v5;
  v19 = v11;
  v12 = v4;
  v20 = v12;
  v13 = v6;
  v21 = v13;
  -[_LTTextSession _translateRequest:perItemHandler:](self, "_translateRequest:perItemHandler:", v12, v18);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __37___LTTextSession__beginBatchRequest___block_invoke_19;
  block[3] = &unk_250694108;
  v16 = v12;
  v17 = v8;
  v14 = v12;
  dispatch_group_notify(v13, v11, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)translateRequest:(id)a3 forSession:(id)a4 perItemHandler:(id)a5
{
  id v8;
  id v9;
  _LTLocalePair *v10;
  void *v11;
  void *v12;
  _LTLocalePair *v13;
  void *v14;
  void *v15;
  _LTLocalePair *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  _LTLocalePair *v38;
  id v39;
  id v40;
  id v41;
  id location;
  uint8_t buf[4];
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v31 = a4;
  v9 = a5;
  v10 = [_LTLocalePair alloc];
  objc_msgSend(v8, "resolvedSourceLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedTargetLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_LTLocalePair initWithSourceLocale:targetLocale:](v10, "initWithSourceLocale:targetLocale:", v11, v12);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v8, "batch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __61___LTTextSession_translateRequest_forSession_perItemHandler___block_invoke;
  v37[3] = &unk_250694158;
  v32 = &v41;
  objc_copyWeak(&v41, &location);
  v16 = v13;
  v38 = v16;
  v17 = v9;
  v40 = v17;
  v18 = v14;
  v39 = v18;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v37);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v23, "setSourceOrigin:", 3, v31, v32, (_QWORD)v33);
        objc_msgSend(v8, "logIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setLogIdentifier:", v24);

        objc_msgSend(v23, "setForcedOfflineTranslation:", -[_LTTextSession allowOnlineTranslation](self, "allowOnlineTranslation") ^ 1);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v20);
  }

  objc_msgSend(v8, "batch");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (objc_msgSend(v19, "count"))
  {
    +[_LTTranslator interruptionController](_LTTranslator, "interruptionController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:", v8);

    v28 = (id)_LTOSLogTextAPI();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[_LTTextSession translateRequest:forSession:perItemHandler:].cold.1((uint64_t)buf, objc_msgSend(v19, "count"), v26, v28);

    objc_msgSend(v8, "logIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationSession setLogIdentifier:](self->_translationSession, "setLogIdentifier:", v29);

    -[_LTTranslationSession translate:useDedicatedTextMachPort:](self->_translationSession, "translate:useDedicatedTextMachPort:", v19, 1);
  }
  else
  {
    v30 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v44 = v26;
      _os_log_impl(&dword_235438000, v30, OS_LOG_TYPE_INFO, "Didn't create any paragraph requests from %zu inputs, all inputs were likely whitespace only", buf, 0xCu);
    }
  }

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

}

- (void)preflightChecker:(id)a3 continueCheckingFromStep:(int64_t)a4 forConfiguration:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v14 = (void *)objc_msgSend(v11, "copy");
  v15 = v14;
  if (a4)
  {
    if (a4 != 2)
      goto LABEL_4;
    v16 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v14, "effectiveSourceLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "effectiveTargetLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lt_unsupportedPairingErrorWithSource:target:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_4;
LABEL_6:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke;
    block[3] = &unk_250693E28;
    objc_copyWeak(&v30, &location);
    v27 = v19;
    v28 = v15;
    v29 = v12;
    v20 = v19;
    dispatch_async(v13, block);

    objc_destroyWeak(&v30);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 20, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    goto LABEL_6;
LABEL_4:
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_27;
  v21[3] = &unk_2506941A8;
  objc_copyWeak(&v25, &location);
  v22 = v13;
  v24 = v12;
  v23 = v15;
  -[_LTTextSession _checkDownloadStatusForConfiguration:completion:](self, "_checkDownloadStatusForConfiguration:completion:", v23, v21);

  objc_destroyWeak(&v25);
LABEL_7:

  objc_destroyWeak(&location);
}

- (BOOL)isTranslationSupportedOnCurrentDeviceForPreflightChecker:(id)a3
{
  return 1;
}

- (void)_callDelegateOrGiveError:(id)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  NSObject *v11;
  id WeakRetained;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "needsUserInterventionForTextSession:configuration:completion:", self, v9, v10);
  }
  else
  {
    v13 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_LTTextSession _callDelegateOrGiveError:forConfiguration:completion:].cold.1((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);
    v10[2](v10, 0, v8);
  }

}

- (void)_checkDownloadStatusForConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke;
  block[3] = &unk_250693E28;
  objc_copyWeak(&v16, &location);
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_supportedLocalePairsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTextSession localeProvider](self, "localeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61___LTTextSession__supportedLocalePairsWithCompletionHandler___block_invoke;
  v9[3] = &unk_250694248;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "supportedLocalePairsWithCompletion:", v9);

}

- (void)_translateRequest:(id)a3 perItemHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isForDownloadRequest"))
  {
    v9 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235438000, v9, OS_LOG_TYPE_INFO, "Finished preflight checks for download-only request and everything was installed already", buf, 2u);
    }
  }
  else
  {
    -[_LTTextSession textTranslator](self, "textTranslator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51___LTTextSession__translateRequest_perItemHandler___block_invoke;
    v11[3] = &unk_250694298;
    v12 = v8;
    v13 = v7;
    objc_msgSend(v10, "translateRequest:forSession:perItemHandler:", v6, self, v11);

  }
}

- (void)_didFinishMultiParagraphRequestWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58___LTTextSession__didFinishMultiParagraphRequestWithUUID___block_invoke;
  block[3] = &unk_250693708;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setLocaleResolver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_LTTextSession preflightChecker](self, "preflightChecker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocaleResolver:", v4);

}

- (_LTPreflightLocaleResolving)localeResolver
{
  void *v2;
  void *v3;

  -[_LTTextSession preflightChecker](self, "preflightChecker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_LTPreflightLocaleResolving *)v3;
}

- (void)_invocationStartedSELFLogging:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _LTLocalePair *v13;
  _LTSELFLoggingEventData *v14;
  void *v15;
  _LTSELFLoggingEventData *v16;
  _LTSELFLoggingTranslateAppContext *v17;
  void *v18;
  _LTSELFLoggingTranslateAppContext *v19;
  _LTSELFLoggingInvocationOptions *v20;
  _LTSELFLoggingEventData *v21;
  void *v22;
  _LTSELFLoggingEventData *v23;
  _LTSELFLoggingInvocationOptions *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "synchronizationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if ((objc_msgSend(v3, "isForDownloadRequest") & 1) == 0)
  {
    objc_msgSend(v3, "resolvedSourceLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", &stru_250695360);
    v8 = v7;

    objc_msgSend(v3, "resolvedTargetLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", &stru_250695360);
    v12 = v11;

    v39 = v8;
    v13 = -[_LTLocalePair initWithSourceLocale:targetLocale:]([_LTLocalePair alloc], "initWithSourceLocale:targetLocale:", v8, v12);
    v14 = [_LTSELFLoggingEventData alloc];
    objc_msgSend(v3, "logIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_LTSELFLoggingEventData initWithType:invocationId:](v14, "initWithType:invocationId:", 1, v15);

    v17 = [_LTSELFLoggingTranslateAppContext alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v38) = 0;
    LOBYTE(v37) = 0;
    v19 = -[_LTSELFLoggingTranslateAppContext initWithDisplayMode:localePair:isGenderAlternativeEnabled:tabName:tabSessionId:conversationTabView:isPlayTranslationsEnabled:autoTranslateSessionId:audioChannel:languageIdentificationEnabled:](v17, "initWithDisplayMode:localePair:isGenderAlternativeEnabled:tabName:tabSessionId:conversationTabView:isPlayTranslationsEnabled:autoTranslateSessionId:audioChannel:languageIdentificationEnabled:", 0, v13, 0, 0, v18, 0, v37, 0, 0, v38);

    v20 = -[_LTSELFLoggingInvocationOptions initWithTask:inputMode:invocationType:translateAppContext:]([_LTSELFLoggingInvocationOptions alloc], "initWithTask:inputMode:invocationType:translateAppContext:", 0, 1, 10, v19);
    -[_LTSELFLoggingEventData setStartInvocationOptions:](v16, "setStartInvocationOptions:", v20);
    v21 = [_LTSELFLoggingEventData alloc];
    objc_msgSend(v3, "logIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[_LTSELFLoggingEventData initWithType:invocationId:](v21, "initWithType:invocationId:", 10, v22);

    v24 = -[_LTSELFLoggingInvocationOptions initWithTask:inputMode:invocationType:translateAppContext:]([_LTSELFLoggingInvocationOptions alloc], "initWithTask:inputMode:invocationType:translateAppContext:", 0, 1, 10, 0);
    -[_LTSELFLoggingEventData setStartInvocationOptions:](v23, "setStartInvocationOptions:", v24);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForInfoDictionaryKey:", CFSTR("CFBundleIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = _LTOSLogXPC();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v26;
        _os_log_impl(&dword_235438000, v27, OS_LOG_TYPE_INFO, "Got untrusted client identifier from Info.plist: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "processName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = _LTOSLogXPC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[_LTTextSession _invocationStartedSELFLogging:].cold.1((uint64_t)v26, v29, v30, v31, v32, v33, v34, v35);
    }
    v36 = v26;

    -[_LTSELFLoggingEventData setUntrustedClientIdentifier:](v23, "setUntrustedClientIdentifier:", v36);
    +[_LTTranslator selfLoggingInvocationStartedWithData:invocationStartedTier1Data:](_LTTranslator, "selfLoggingInvocationStartedWithData:invocationStartedTier1Data:", v16, v23);

  }
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (_LTTextSessionDelegate)delegate
{
  return (_LTTextSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_LTTextSessionTranslating)textTranslator
{
  return (_LTTextSessionTranslating *)objc_loadWeakRetained((id *)&self->_textTranslator);
}

- (void)setTextTranslator:(id)a3
{
  objc_storeWeak((id *)&self->_textTranslator, a3);
}

- (_LTPreflightChecker)preflightChecker
{
  return self->_preflightChecker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightChecker, 0);
  objc_destroyWeak((id *)&self->_textTranslator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_installedAssets, 0);
  objc_storeStrong((id *)&self->_inProgressMultiParagraphRequestByUUID, 0);
  objc_storeStrong((id *)&self->_languageAvailability, 0);
  objc_storeStrong((id *)&self->_translationSession, 0);
  objc_storeStrong((id *)&self->_translator, 0);
}

- (void)translateRequest:(uint64_t)a3 forSession:(NSObject *)a4 perItemHandler:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  OUTLINED_FUNCTION_3_2(&dword_235438000, a4, a3, "Translating %zu paragraphs from %zu batch items", (uint8_t *)a1);
}

- (void)_callDelegateOrGiveError:(uint64_t)a3 forConfiguration:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "_LTTextSessionDelegate doesn't implement selector for getting user intervention so can't complete validation, returning error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_invocationStartedSELFLogging:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Unable to read untrusted client identifier from Info.plist; falling back to process name: %{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_1();
}

@end
