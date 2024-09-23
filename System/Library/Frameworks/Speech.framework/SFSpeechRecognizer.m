@implementation SFSpeechRecognizer

void __32__SFSpeechRecognizer_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(a2, "copy");
  v6 = (void *)sSupportedLocales_929;
  sSupportedLocales_929 = v5;

  v7 = objc_msgSend(v4, "copy");
  v8 = (void *)sSupportedLocaleIdentifiers_909;
  sSupportedLocaleIdentifiers_909 = v7;

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[SFUtilities supportedLocalesWithCompletion:](SFUtilities, "supportedLocalesWithCompletion:", &__block_literal_global_931);
}

+ (SFSpeechRecognizerAuthorizationStatus)authorizationStatus
{
  int v2;

  v2 = TCCAccessPreflight();
  if (v2 == 2)
    return 0;
  if (!v2)
    return 3;
  if (TCCAccessRestricted())
    return 2;
  return 1;
}

- (SFSpeechRecognizer)init
{
  void *v3;
  SFSpeechRecognizer *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFSpeechRecognizer initWithLocale:](self, "initWithLocale:", v3);

  return v4;
}

- (SFSpeechRecognizer)initWithLocale:(NSLocale *)locale
{
  NSLocale *v4;
  void *v5;
  void *v6;
  SFSpeechRecognizer *v7;
  uint64_t v8;
  SFSpeechRecognizer *v9;
  uint64_t v10;
  NSLocale *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *languageCode;
  uint64_t v17;
  NSOperationQueue *queue;
  AFDictationConnection *v19;
  AFDictationConnection *dictationConnection;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *preferencesObserver;
  CXCallObserver *v26;
  CXCallObserver *callObserver;
  CXCallObserver *v28;
  uint64_t v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v4 = locale;
  -[NSLocale localeIdentifier](v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend((id)sSupportedLocaleIdentifiers_909, "containsObject:", v6) & 1) == 0)
  {
    AFDictationLanguageForKeyboardLanguage();
    v7 = (SFSpeechRecognizer *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      NSLog(CFSTR("Cannot make recognizer for %@. Supported locale identifiers are %@"), v6, sSupportedLocaleIdentifiers_909);
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (NSLocale *)v8;
  }
  v35.receiver = self;
  v35.super_class = (Class)SFSpeechRecognizer;
  v9 = -[SFSpeechRecognizer init](&v35, sel_init);
  if (v9)
  {
    v10 = -[NSLocale copy](v4, "copy");
    v11 = v9->_locale;
    v9->_locale = (NSLocale *)v10;

    v12 = (void *)MEMORY[0x1E0CB3940];
    -[NSLocale objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLocale objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    languageCode = v9->_languageCode;
    v9->_languageCode = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (NSOperationQueue *)v17;

    v19 = (AFDictationConnection *)objc_alloc_init(MEMORY[0x1E0CFE888]);
    dictationConnection = v9->_dictationConnection;
    v9->_dictationConnection = v19;

    -[AFDictationConnection setDelegate:](v9->_dictationConnection, "setDelegate:", v9);
    -[AFDictationConnection beginAvailabilityMonitoring](v9->_dictationConnection, "beginAvailabilityMonitoring");
    objc_initWeak(&location, v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0CFE5B8];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __37__SFSpeechRecognizer_initWithLocale___block_invoke;
    v32[3] = &unk_1E64857B0;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v21, "addObserverForName:object:queue:usingBlock:", v23, 0, v22, v32);
    v24 = objc_claimAutoreleasedReturnValue();
    preferencesObserver = v9->_preferencesObserver;
    v9->_preferencesObserver = v24;

    v26 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E0C932E0]);
    callObserver = v9->_callObserver;
    v9->_callObserver = v26;

    v28 = v9->_callObserver;
    v29 = MEMORY[0x1E0C80D38];
    v30 = MEMORY[0x1E0C80D38];
    -[CXCallObserver setDelegate:queue:](v28, "setDelegate:queue:", v9, v29);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  self = v9;
  v7 = self;
LABEL_9:

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[AFDictationConnection endSession](self->_dictationConnection, "endSession");
  -[AFDictationConnection cancelAvailabilityMonitoring](self->_dictationConnection, "cancelAvailabilityMonitoring");
  if (self->_facetimeObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_facetimeObserver);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_foregroundObserver);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self->_preferencesObserver);

  +[SFLocalSpeechRecognitionClient cleanupCacheWithCompletion:](SFLocalSpeechRecognitionClient, "cleanupCacheWithCompletion:", &__block_literal_global_15);
  v6.receiver = self;
  v6.super_class = (Class)SFSpeechRecognizer;
  -[SFSpeechRecognizer dealloc](&v6, sel_dealloc);
}

- (BOOL)isAvailable
{
  return -[AFDictationConnection dictationIsAvailableForLanguage:synchronous:](self->_dictationConnection, "dictationIsAvailableForLanguage:synchronous:", self->_languageCode, 1);
}

- (BOOL)_isAvailableForForcedOfflineRecognition
{
  NSString *v3;
  NSString *languageCode;
  NSString *v5;
  SFEntitledAssetConfig *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v12;
  void *v13;

  if (!+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
    return -[AFDictationConnection forcedOfflineDictationIsAvailableForLanguage:](self->_dictationConnection, "forcedOfflineDictationIsAvailableForLanguage:", self->_languageCode);
  _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  languageCode = v3;
  if (!v3)
    languageCode = self->_languageCode;
  v5 = languageCode;

  v6 = -[SFEntitledAssetConfig initWithLanguage:taskHint:]([SFEntitledAssetConfig alloc], "initWithLanguage:taskHint:", v5, 1);
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSpeechAssetManager pathToAssetWithConfig:clientIdentifier:](SFSpeechAssetManager, "pathToAssetWithConfig:clientIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = -[SFEntitledAssetConfig assetType](v6, "assetType");
    if ((unint64_t)(v9 - 1) > 6)
      v10 = CFSTR("Unknown");
    else
      v10 = off_1E6485350[v9 - 1];
    v12 = v10;
    -[SFEntitledAssetConfig language](v6, "language");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("No %@ asset for language %@"), v12, v13);

  }
  return v8 != 0;
}

- (void)_requestOfflineDictationSupportForClientIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SFEntitledAssetConfig *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    v8 = -[SFEntitledAssetConfig initWithLanguage:taskHint:]([SFEntitledAssetConfig alloc], "initWithLanguage:taskHint:", self->_languageCode, 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__SFSpeechRecognizer__requestOfflineDictationSupportForClientIdentifier_completion___block_invoke;
    v9[3] = &unk_1E64857F8;
    v10 = v7;
    +[SFSpeechAssetManager fetchAssetWithConfig:clientIdentifier:progress:completion:](SFSpeechAssetManager, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v8, v6, 0, v9);

  }
  else
  {
    -[AFDictationConnection requestOfflineDictationSupportForLanguage:completion:](self->_dictationConnection, "requestOfflineDictationSupportForLanguage:completion:", self->_languageCode, v7);
  }

}

- (void)_requestOfflineDictationSupportWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSpeechRecognizer _requestOfflineDictationSupportForClientIdentifier:completion:](self, "_requestOfflineDictationSupportForClientIdentifier:completion:", v5, v4);

}

- (void)_prepareToRecognizeWithTaskHint:(int64_t)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSOperationQueue *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__SFSpeechRecognizer__prepareToRecognizeWithTaskHint_clientIdentifier_completion___block_invoke;
  v13[3] = &unk_1E6485870;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v13);

}

- (void)_prepareToRecognizeWithTaskHint:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSpeechRecognizer _prepareToRecognizeWithTaskHint:clientIdentifier:completion:](self, "_prepareToRecognizeWithTaskHint:clientIdentifier:completion:", a3, v7, v6);

}

- (SFSpeechRecognitionTask)recognitionTaskWithRequest:(SFSpeechRecognitionRequest *)request resultHandler:(void *)resultHandler
{
  SFSpeechRecognitionRequest *v6;
  void *v7;
  id v8;

  v6 = request;
  v7 = resultHandler;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Result handler must be non-null"));
  v8 = -[_SFSpeechRecognitionBlockTask _initWithRequest:queue:languageCode:taskHint:resultHandler:]([_SFSpeechRecognitionBlockTask alloc], "_initWithRequest:queue:languageCode:taskHint:resultHandler:", v6, self->_queue, self->_languageCode, self->_defaultTaskHint, v7);

  return (SFSpeechRecognitionTask *)v8;
}

- (SFSpeechRecognitionTask)recognitionTaskWithRequest:(SFSpeechRecognitionRequest *)request delegate:(id)delegate
{
  id v6;
  SFSpeechRecognitionRequest *v7;
  id v8;

  v6 = delegate;
  v7 = request;
  v8 = -[_SFSpeechRecognitionDelegateTask _initWithRequest:queue:languageCode:taskHint:delegate:]([_SFSpeechRecognitionDelegateTask alloc], "_initWithRequest:queue:languageCode:taskHint:delegate:", v7, self->_queue, self->_languageCode, self->_defaultTaskHint, v6);

  return (SFSpeechRecognitionTask *)v8;
}

- (void)setQueue:(NSOperationQueue *)queue
{
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  v4 = queue;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ queue must not be nil"), objc_opt_class());
  v5 = self->_queue;
  self->_queue = v4;

}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setSupportsOnDeviceRecognition:(BOOL)supportsOnDeviceRecognition
{
  self->_supportsOnDeviceRecognition = supportsOnDeviceRecognition;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (SFSpeechRecognitionTaskHint)defaultTaskHint
{
  return self->_defaultTaskHint;
}

- (void)setDefaultTaskHint:(SFSpeechRecognitionTaskHint)defaultTaskHint
{
  self->_defaultTaskHint = defaultTaskHint;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_preferencesObserver, 0);
  objc_storeStrong((id *)&self->_foregroundObserver, 0);
  objc_storeStrong((id *)&self->_facetimeObserver, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_dictationConnection, 0);
}

- (uint64_t)_informDelegateOfAvailabilityChange
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 88);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __57__SFSpeechRecognizer__informDelegateOfAvailabilityChange__block_invoke;
    v2[3] = &unk_1E6486328;
    v2[4] = result;
    return objc_msgSend(v1, "addOperationWithBlock:", v2);
  }
  return result;
}

void __57__SFSpeechRecognizer__informDelegateOfAvailabilityChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "speechRecognizer:availabilityDidChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isAvailable"));

}

void __82__SFSpeechRecognizer__prepareToRecognizeWithTaskHint_clientIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 56))
  {
    +[SFUtilities taskNameFromTaskHint:](SFUtilities, "taskNameFromTaskHint:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3 && objc_msgSend(*(id *)(a1 + 32), "supportsOnDeviceRecognition"))
    {
      v2 = (void *)objc_opt_new();
      objc_msgSend(v2, "preloadRecognizerForLanguage:task:clientID:recognitionOverrides:modelOverrideURL:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v3, *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 48));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __84__SFSpeechRecognizer__requestOfflineDictationSupportForClientIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

void __37__SFSpeechRecognizer_initWithLocale___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 11);
    v5[1] = 3221225472;
    v5[2] = __56__SFSpeechRecognizer__informDelegateOfPreferencesChange__block_invoke;
    v5[3] = &unk_1E6486328;
    v5[4] = v2;
    v4 = v2;
    v5[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v3, "addOperationWithBlock:", v5);
    v2 = v4;
  }

}

void __56__SFSpeechRecognizer__informDelegateOfPreferencesChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "speechRecognizer:availabilityDidChange:", *(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0CFE888], "dictationIsEnabled"));

}

+ (NSSet)supportedLocales
{
  return (NSSet *)(id)sSupportedLocales_929;
}

+ (void)requestAuthorization:(void *)handler
{
  void *v3;
  void *v4;
  id v5;

  v3 = handler;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    TCCAccessRequest();

  }
}

+ (void)_fetchSupportedForcedOfflineLocalesWithCompletion:(id)a3
{
  id v3;
  id *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  if (+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__SFSpeechRecognizer__fetchSupportedForcedOfflineLocalesWithCompletion___block_invoke;
    v10[3] = &unk_1E6485820;
    v4 = &v11;
    v11 = v3;
    v5 = v3;
    +[SFSpeechAssetManager installedLanguagesForTaskHint:completion:](SFSpeechAssetManager, "installedLanguagesForTaskHint:completion:", 1, v10);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CFE888];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__SFSpeechRecognizer__fetchSupportedForcedOfflineLocalesWithCompletion___block_invoke_2;
    v8[3] = &unk_1E6485848;
    v4 = &v9;
    v9 = v3;
    v7 = v3;
    objc_msgSend(v6, "getForcedOfflineDictationSupportedLanguagesWithCompletion:", v8);
  }

}

void __72__SFSpeechRecognizer__fetchSupportedForcedOfflineLocalesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id, _QWORD))(v11 + 16))(v11, v4, 0);

}

void __72__SFSpeechRecognizer__fetchSupportedForcedOfflineLocalesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id, _QWORD))(v11 + 16))(v11, v4, 0);

}

uint64_t __43__SFSpeechRecognizer_requestAuthorization___block_invoke(uint64_t a1, int a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "authorizationStatus");
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  return v3();
}

@end
