@implementation AFDictationConnection

- (BOOL)dictationIsAvailableForLanguage:(id)a3
{
  return -[AFDictationConnection dictationIsAvailableForLanguage:synchronous:](self, "dictationIsAvailableForLanguage:synchronous:", a3, 0);
}

+ (BOOL)dictationIsSupportedForLanguageCode:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  if (AFDictationCapable_onceToken != -1)
    dispatch_once(&AFDictationCapable_onceToken, &__block_literal_global_45_40095);
  if (AFDictationCapable_isCapable)
  {
    if ((AFPreferencesLanguageIsSupportedForDictation((uint64_t)v5) & 1) != 0)
    {
      v6 = 0;
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
    v7 = 401;
  }
  else
  {
    v7 = 400;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), v7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v6);
LABEL_11:

  return v6 == 0;
}

- (AFDictationConnection)init
{
  void *v3;
  AFDictationConnection *v4;

  +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFDictationConnection initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (AFDictationConnection)initWithInstanceContext:(id)a3
{
  AFCallSiteInfo *v3;
  AFCallSiteInfo *v4;
  id v6;
  AFDictationConnection *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  AFCallSiteInfo *initiationCallSiteInfo;
  NSObject *v15;
  AFCallSiteInfo *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *internalQueue;
  NSMutableData *v20;
  NSMutableData *buffer;
  AFInstanceContext *v22;
  AFInstanceContext *instanceContext;
  _QWORD v25[4];
  id v26;
  id v27;
  objc_super v28;
  Dl_info v29;
  uint64_t v30;

  v4 = v3;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AFDictationConnection;
  v7 = -[AFDictationConnection init](&v28, sel_init);
  if (v7)
  {
    if (v3)
    {
      memset(&v29, 0, sizeof(v29));
      if (dladdr(v3, &v29))
      {
        if (v29.dli_fname && *v29.dli_fname)
        {
          v8 = objc_alloc(MEMORY[0x1E0CB3940]);
          v9 = (void *)objc_msgSend(v8, "initWithUTF8String:", v29.dli_fname);
        }
        else
        {
          v9 = 0;
        }
        if (v29.dli_sname && *v29.dli_sname)
        {
          v10 = objc_alloc(MEMORY[0x1E0CB3940]);
          v11 = (void *)objc_msgSend(v10, "initWithUTF8String:", v29.dli_sname);
        }
        else
        {
          v11 = 0;
        }
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __49__AFDictationConnection_initWithInstanceContext___block_invoke;
        v25[3] = &unk_1E3A33CF8;
        v26 = v9;
        v27 = v11;
        v12 = v11;
        v13 = v9;
        v4 = +[AFCallSiteInfo newWithBuilder:](AFCallSiteInfo, "newWithBuilder:", v25);

      }
      else
      {
        v4 = 0;
      }
    }
    initiationCallSiteInfo = v7->_initiationCallSiteInfo;
    v7->_initiationCallSiteInfo = v4;

    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v16 = v7->_initiationCallSiteInfo;
      LODWORD(v29.dli_fname) = 136315650;
      *(const char **)((char *)&v29.dli_fname + 4) = "-[AFDictationConnection initWithInstanceContext:]";
      WORD2(v29.dli_fbase) = 2048;
      *(void **)((char *)&v29.dli_fbase + 6) = v7;
      HIWORD(v29.dli_sname) = 2112;
      v29.dli_saddr = v16;
      _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s %p (Caller = %@)", (uint8_t *)&v29, 0x20u);
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(0, v17);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v7->_delegateQueue, MEMORY[0x1E0C80D38]);
    v20 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    buffer = v7->_buffer;
    v7->_buffer = v20;

    v7->_audioStartTime = -1.0;
    if (v6)
    {
      v22 = (AFInstanceContext *)v6;
    }
    else
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v22 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v7->_instanceContext;
    v7->_instanceContext = v22;

  }
  return v7;
}

void __49__AFDictationConnection_initWithInstanceContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImagePath:", v3);
  objc_msgSend(v4, "setSymbolName:", *(_QWORD *)(a1 + 40));

}

- (BOOL)dictationIsAvailableForLanguage:(id)a3 synchronous:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableDictionary *languagesLoggingInfo;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  const char *v39;
  _BYTE v40[24];
  id v41;
  __int128 v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    languagesLoggingInfo = self->_languagesLoggingInfo;
    if (!languagesLoggingInfo)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_languagesLoggingInfo;
      self->_languagesLoggingInfo = v8;

      languagesLoggingInfo = self->_languagesLoggingInfo;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](languagesLoggingInfo, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = v12;

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CheckLanguageAvailable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LanguageAvailableOverNetwork"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HQAssetsAvailable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LQAssetsAvailable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if ((v16 & 1) == 0)
    {
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v40 = 136315650;
        *(_QWORD *)&v40[4] = "-[AFDictationConnection dictationIsAvailableForLanguage:synchronous:]";
        *(_WORD *)&v40[12] = 2048;
        *(_QWORD *)&v40[14] = self;
        *(_WORD *)&v40[22] = 2112;
        v41 = v6;
        _os_log_debug_impl(&dword_19AF50000, v23, OS_LOG_TYPE_DEBUG, "%s %p Checking if language %@ is available", v40, 0x20u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("CheckLanguageAvailable"));

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_languagesLoggingInfo, "setObject:forKeyedSubscript:", v14, v6);
    }
    +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isDictationHIPAACompliant");

    if (v26)
    {
      +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "offlineDictationStatus");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = AFIsDictationLanguageSupportedForOnDeviceDictation(v6, v28);

      if (!v14 || v20 == v13)
        goto LABEL_29;
      v29 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      v30 = "is not";
      *(_QWORD *)&v40[4] = "-[AFDictationConnection dictationIsAvailableForLanguage:synchronous:]";
      *(_WORD *)&v40[12] = 2048;
      *(_DWORD *)v40 = 136315906;
      *(_QWORD *)&v40[14] = self;
      if ((_DWORD)v13)
        v30 = "is";
      *(_WORD *)&v40[22] = 2112;
      v41 = v6;
      LOWORD(v42) = 2080;
      *(_QWORD *)((char *)&v42 + 2) = v30;
      v31 = "%s %p Language %@ %s available on-device (HQ assets)";
      goto LABEL_34;
    }
    +[AFNetworkAvailability sharedAvailability](AFNetworkAvailability, "sharedAvailability");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isAvailable");

    if (v33)
    {
      if ((v18 & 1) == 0)
      {
        v36 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v40 = 136315650;
          *(_QWORD *)&v40[4] = "-[AFDictationConnection dictationIsAvailableForLanguage:synchronous:]";
          *(_WORD *)&v40[12] = 2048;
          *(_QWORD *)&v40[14] = self;
          *(_WORD *)&v40[22] = 2112;
          v41 = v6;
          _os_log_debug_impl(&dword_19AF50000, v36, OS_LOG_TYPE_DEBUG, "%s %p Language %@ is available over network", v40, 0x20u);
        }
        v34 = (void *)MEMORY[0x1E0CB37E8];
        LOBYTE(v13) = 1;
        v35 = 1;
        goto LABEL_28;
      }
      LOBYTE(v13) = 1;
    }
    else
    {
      v13 = -[AFDictationConnection forcedOfflineDictationIsAvailableForLanguage:synchronous:](self, "forcedOfflineDictationIsAvailableForLanguage:synchronous:", v6, v4);
      if (v22 != (_DWORD)v13)
      {
        v29 = AFSiriLogContextConnection;
        if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
LABEL_24:
          v34 = (void *)MEMORY[0x1E0CB37E8];
          v35 = v13;
LABEL_28:
          objc_msgSend(v34, "numberWithBool:", v35, *(_OWORD *)v40, *(_QWORD *)&v40[16], v41, v42);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v37, CFSTR("LanguageAvailableOverNetwork"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_languagesLoggingInfo, "setObject:forKeyedSubscript:", v14, v6);
          goto LABEL_29;
        }
        v39 = "is not";
        *(_QWORD *)&v40[4] = "-[AFDictationConnection dictationIsAvailableForLanguage:synchronous:]";
        *(_WORD *)&v40[12] = 2048;
        *(_DWORD *)v40 = 136315906;
        *(_QWORD *)&v40[14] = self;
        if ((_DWORD)v13)
          v39 = "is";
        *(_WORD *)&v40[22] = 2112;
        v41 = v6;
        LOWORD(v42) = 2080;
        *(_QWORD *)((char *)&v42 + 2) = v39;
        v31 = "%s %p Language %@ %s available on-device (LQ assets)";
LABEL_34:
        _os_log_debug_impl(&dword_19AF50000, v29, OS_LOG_TYPE_DEBUG, v31, v40, 0x2Au);
        goto LABEL_24;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  LOBYTE(v13) = 0;
LABEL_30:

  return v13;
}

uint64_t __57__AFDictationConnection_networkAvailability_isAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_availabilityChanged");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)beginAvailabilityMonitoring
{
  id v3;

  +[AFNetworkAvailability sharedAvailability](AFNetworkAvailability, "sharedAvailability");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AFDictationConnection_networkAvailability_isAvailable___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __53__AFDictationConnection__dispatchCallbackGroupBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

void __63__AFDictationConnection__tellSpeechDelegateAvailabilityChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnnectionDidChangeAvailability:", *(_QWORD *)(a1 + 32));

}

- (void)_tellSpeechDelegateAvailabilityChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__AFDictationConnection__tellSpeechDelegateAvailabilityChanged__block_invoke;
  v2[3] = &unk_1E3A2FC20;
  v2[4] = self;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v2);
}

- (void)_dispatchCallbackGroupBlock:(id)a3
{
  id v4;
  NSObject *speechCallbackGroup;
  NSObject *delegateQueue;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id to;

  v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
    if (self->_speechCallbackGroup)
    {
      objc_copyWeak(&to, (id *)&self->_delegate);
      speechCallbackGroup = self->_speechCallbackGroup;
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__AFDictationConnection__dispatchCallbackGroupBlock___block_invoke;
      block[3] = &unk_1E3A2FBF8;
      v11 = v4;
      objc_copyWeak(&v12, &to);
      dispatch_group_notify(speechCallbackGroup, delegateQueue, block);
      objc_destroyWeak(&v12);

      objc_destroyWeak(&to);
    }
    else
    {
      v7 = self->_delegateQueue;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __53__AFDictationConnection__dispatchCallbackGroupBlock___block_invoke_2;
      v8[3] = &unk_1E3A36FA0;
      v8[4] = self;
      v9 = v4;
      dispatch_async(v7, v8);

    }
  }

}

- (void)cancelAvailabilityMonitoring
{
  id v3;

  +[AFNetworkAvailability sharedAvailability](AFNetworkAvailability, "sharedAvailability");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFDictationConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFDictationConnection dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFDictationConnection;
  -[AFDictationConnection dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_languagesLoggingInfo, 0);
  objc_storeStrong((id *)&self->_intstrumentationContext, 0);
  objc_storeStrong((id *)&self->_preheatEvent, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_onDeviceDictationUIInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_previouslyRecognizedPhrases, 0);
  objc_storeStrong((id *)&self->_requestIdString, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_stopOptions, 0);
  objc_storeStrong((id *)&self->_bufferTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_speechCallbackGroup, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_initiationCallSiteInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_knownOfflineInstalledLanguages, 0);
  objc_storeStrong((id *)&self->_lastUsedLanguage, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (v3 && self->_isCapturingSpeech)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[AFDictationConnection _checkAndSetIsCapturingSpeech:]";
      _os_log_fault_impl(&dword_19AF50000, v5, OS_LOG_TYPE_FAULT, "%s Trying to start speech capture while we are already capturing. This is a client app logic error, cancelling dictation", buf, 0xCu);
    }
    -[AFDictationConnection _dictationService](self, "_dictationService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelSpeech");

    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11 = CFSTR("Trying to start speech capture while we are already capturing. This is a client app logic error, cancelling dictation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 205, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFDictationConnection _tellSpeechDelegateRecordingDidFail:](self, "_tellSpeechDelegateRecordingDidFail:", v9);

    self->_isCapturingSpeech = 0;
  }
  else
  {
    -[AFDictationConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
    self->_isCapturingSpeech = v3;
  }
}

- (void)_dispatchAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_internalQueue, a3);
}

- (void)_tellSpeechDelegateRecordingWillBegin
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__AFDictationConnection__tellSpeechDelegateRecordingWillBegin__block_invoke;
  v2[3] = &unk_1E3A2FC20;
  v2[4] = self;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v2);
}

- (void)_tellSpeechDelegateRecordingDidBeginWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFDictationConnection _tellSpeechDelegateRecordingDidBeginWithOptions:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  self->_isDetectingUtterances = objc_msgSend(v4, "detectUtterances");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__AFDictationConnection__tellSpeechDelegateRecordingDidBeginWithOptions___block_invoke;
  v7[3] = &unk_1E3A2FC48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

- (void)_tellSpeechDelegateRecordingDidEnd
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__AFDictationConnection__tellSpeechDelegateRecordingDidEnd__block_invoke;
  v2[3] = &unk_1E3A2FC20;
  v2[4] = self;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v2);
}

- (void)_tellSpeechDelegateRecordingDidCancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__AFDictationConnection__tellSpeechDelegateRecordingDidCancel__block_invoke;
  v2[3] = &unk_1E3A2FC20;
  v2[4] = self;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v2);
}

- (void)_tellSpeechDelegateRecordingDidFail:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[AFDictationConnection _willFailDictationWithError:](self, "_willFailDictationWithError:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__AFDictationConnection__tellSpeechDelegateRecordingDidFail___block_invoke;
  v6[3] = &unk_1E3A2FC48;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

- (void)_tellSpeechDelegateDidRecognizePackage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizePackage:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[AFDictationConnection _willCompleteDictation](self, "_willCompleteDictation");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AFDictationConnection__tellSpeechDelegateDidRecognizePackage___block_invoke;
  v7[3] = &unk_1E3A2FC48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

- (void)_tellSpeechDelegateDidRecognizeFinalResultCandidatePackage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeFinalResultCandidatePackage:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__AFDictationConnection__tellSpeechDelegateDidRecognizeFinalResultCandidatePackage___block_invoke;
  v7[3] = &unk_1E3A2FC48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

- (void)_tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage:nluResult:]";
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__AFDictationConnection__tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage_nluResult___block_invoke;
  v11[3] = &unk_1E3A2FC70;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v11);

}

- (void)_tellSpeechDelegateDidRecognizeSpeechPhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 languageModel:(id)a8 correctionIdentifier:(id)a9 audioAnalytics:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  AFDictationConnection *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeSpeechPhrases:rawPhrases:utterances:rawUtterances:nluRe"
          "sult:languageModel:correctionIdentifier:audioAnalytics:]";
    _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (!self->_isDetectingUtterances)
    -[AFDictationConnection _willCompleteDictation](self, "_willCompleteDictation");
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __166__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechPhrases_rawPhrases_utterances_rawUtterances_nluResult_languageModel_correctionIdentifier_audioAnalytics___block_invoke;
  v33[3] = &unk_1E3A2FCC0;
  v34 = v16;
  v35 = v18;
  v36 = v17;
  v37 = v19;
  v38 = v23;
  v39 = self;
  v40 = v21;
  v41 = v22;
  v42 = v20;
  v25 = v20;
  v26 = v22;
  v27 = v21;
  v28 = v23;
  v29 = v19;
  v30 = v17;
  v31 = v18;
  v32 = v16;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v33);

}

- (void)_delegateDidRecognizeSpeechTokens:(id)a3 nluResult:(id)a4 languageModel:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  AFSpeechInterpretation *v22;
  void *v23;
  AFSpeechPhrase *v24;
  void *v25;
  AFSpeechPhrase *v26;
  void *v27;
  uint64_t v28;
  NSArray *previouslyRecognizedPhrases;
  AFDictationConnection *v30;
  id v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  AFSpeechInterpretation *v38;
  uint64_t v39;
  uint8_t v40[128];
  uint8_t buf[24];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[AFDictationConnection _delegateDidRecognizeSpeechTokens:nluResult:languageModel:delegate:]";
    _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_recognizingIncrementally && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v30 = self;
    v31 = v12;
    v32 = v11;
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AFDictationConnection _delegateDidRecognizeSpeechTokens:nluResult:languageModel:delegate:]";
      _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s Recognizing incrementally.", buf, 0xCu);
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v10;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v22 = objc_alloc_init(AFSpeechInterpretation);
          v39 = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFSpeechInterpretation setTokens:](v22, "setTokens:", v23);

          v24 = [AFSpeechPhrase alloc];
          v38 = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[AFSpeechPhrase initWithInterpretations:isLowConfidence:](v24, "initWithInterpretations:isLowConfidence:", v25, 0);
          objc_msgSend(v16, "addObject:", v26);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v18);
    }

    *(_QWORD *)buf = 0;
    DeltaPhrases(v16, v30->_previouslyRecognizedPhrases, buf);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v31;
    objc_msgSend(v13, "dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:replacingPreviousPhrasesCount:", v30, v27, v31, 0, *(_QWORD *)buf);
    v28 = objc_msgSend(v16, "copy");
    previouslyRecognizedPhrases = v30->_previouslyRecognizedPhrases;
    v30->_previouslyRecognizedPhrases = (NSArray *)v28;

    v11 = v32;
  }
  else if ((self->_shouldClassifyIntent || self->_shouldRecognizeCommands) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "dictationConnection:didRecognizeTokens:nluResult:languageModel:", self, v10, v11, v12);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "dictationConnection:didRecognizeTokens:languageModel:", self, v10, v12);
  }

}

- (void)_delegateDidRecognizePartialSpeechPackage:(id)a3 nluResult:(id)a4 languageModel:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "-[AFDictationConnection _delegateDidRecognizePartialSpeechPackage:nluResult:languageModel:delegate:]";
    _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v16, 0xCu);
  }
  if ((self->_shouldClassifyIntent || self->_shouldRecognizeCommands) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "dictationConnection:didRecognizePartialPackage:nluResult:languageModel:", self, v10, v11, v12);
  }
  else
  {
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "-[AFDictationConnection _delegateDidRecognizePartialSpeechPackage:nluResult:languageModel:delegate:]";
      _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s No opt-in to command recognition, intent classification or no partial package delegate callback implemented. Dropping.", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void)_tellSpeechDelegateDidRecognizePartialResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AFDictationConnection *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__AFDictationConnection__tellSpeechDelegateDidRecognizePartialResult___block_invoke;
  v6[3] = &unk_1E3A2FC48;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

- (void)_tellSpeechDelegateDidRecognizeSpeechTokens:(id)a3 nluResult:(id)a4 languageModel:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeSpeechTokens:nluResult:languageModel:]";
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechTokens_nluResult_languageModel___block_invoke;
  v15[3] = &unk_1E3A2FD10;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v15);

}

- (void)_tellSpeechDelegateDidRecognizePartialSpeechPackage:(id)a3 nluResult:(id)a4 languageModel:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizePartialSpeechPackage:nluResult:languageModel:]";
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__AFDictationConnection__tellSpeechDelegateDidRecognizePartialSpeechPackage_nluResult_languageModel___block_invoke;
  v15[3] = &unk_1E3A2FD10;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v15);

}

- (void)_tellSpeechDelegateDidProcessAudioDuration:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__AFDictationConnection__tellSpeechDelegateDidProcessAudioDuration___block_invoke;
  v3[3] = &unk_1E3A2FD38;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v3);
}

- (void)_tellSpeechDelegateDidRecognizeTranscriptionObjects:(id)a3 languageModel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeTranscriptionObjects:languageModel:]";
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[AFDictationConnection _willCompleteDictation](self, "_willCompleteDictation");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__AFDictationConnection__tellSpeechDelegateDidRecognizeTranscriptionObjects_languageModel___block_invoke;
  v11[3] = &unk_1E3A2FC70;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v11);

}

- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFDictationConnection _tellSpeechDelegateRecognitionDidFail:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[AFDictationConnection _willFailDictationWithError:](self, "_willFailDictationWithError:", v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AFDictationConnection__tellSpeechDelegateRecognitionDidFail___block_invoke;
  v7[3] = &unk_1E3A2FC48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

- (void)_tellSpeechDelegateSpeechRecognitionDidSucceed
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[AFDictationConnection _tellSpeechDelegateSpeechRecognitionDidSucceed]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[AFDictationConnection _willCompleteDictation](self, "_willCompleteDictation");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__AFDictationConnection__tellSpeechDelegateSpeechRecognitionDidSucceed__block_invoke;
  v4[3] = &unk_1E3A2FC20;
  v4[4] = self;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v4);
}

- (void)_tellSpeechDelegateAudioFileFinished:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_isWaitingForAudioFile)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__AFDictationConnection__tellSpeechDelegateAudioFileFinished_error___block_invoke;
    v8[3] = &unk_1E3A2FC70;
    v8[4] = self;
    v9 = v6;
    v10 = v7;
    -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v8);
    self->_isWaitingForAudioFile = 0;

  }
}

- (void)_tellSpeechDelegateSearchResultsReceived:(id)a3 recognitionText:(id)a4 stable:(BOOL)a5 final:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[AFDictationConnection _tellSpeechDelegateSearchResultsReceived:recognitionText:stable:final:]";
    _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__AFDictationConnection__tellSpeechDelegateSearchResultsReceived_recognitionText_stable_final___block_invoke;
  v15[3] = &unk_1E3A2FD60;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v15);

}

- (void)_tellSpeechDelegateLanguageDetected:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[AFDictationConnection _tellSpeechDelegateLanguageDetected:confidenceScores:isConfident:]";
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__AFDictationConnection__tellSpeechDelegateLanguageDetected_confidenceScores_isConfident___block_invoke;
  v13[3] = &unk_1E3A2FD88;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v13);

}

- (void)_tellSpeechDelegateMultilingualSpeechRecognized:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFDictationConnection _tellSpeechDelegateMultilingualSpeechRecognized:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__AFDictationConnection__tellSpeechDelegateMultilingualSpeechRecognized___block_invoke;
  v7[3] = &unk_1E3A2FC48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

- (void)_tellSpeechDelegateLanguageDetectorDidFail:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFDictationConnection _tellSpeechDelegateLanguageDetectorDidFail:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__AFDictationConnection__tellSpeechDelegateLanguageDetectorDidFail___block_invoke;
  v7[3] = &unk_1E3A2FC48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

- (void)_tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  AFDictationConnection *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[AFDictationConnection _tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo:]";
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p Local speech recognizer model info: %@", buf, 0x20u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__AFDictationConnection__tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo___block_invoke;
  v7[3] = &unk_1E3A2FC48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

- (void)_tellSpeechDelegateDidPauseRecognition
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFDictationConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFDictationConnection _tellSpeechDelegateDidPauseRecognition]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p Speech recognition is paused", buf, 0x16u);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__AFDictationConnection__tellSpeechDelegateDidPauseRecognition__block_invoke;
  v4[3] = &unk_1E3A2FC20;
  v4[4] = self;
  -[AFDictationConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v4);
}

- (void)_connectionClearedForInterruption:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  AFDictationConnection *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "-[AFDictationConnection _connectionClearedForInterruption:]";
    v12 = 2048;
    v13 = self;
    v14 = 1024;
    v15 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %d", (uint8_t *)&v10, 0x1Cu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_isCapturingSpeech || self->_isWaitingForAudioFile || self->_hasActiveRequest)
  {
    if (v3)
    {
      if (AFIsInternalInstall_onceToken != -1)
        dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
      if (AFIsInternalInstall_isInternal && (_connectionClearedForInterruption__hasAskedOnceForARadar & 1) == 0)
      {
        _connectionClearedForInterruption__hasAskedOnceForARadar = 1;
        dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_12072);
      }
    }
    if (self->_isCapturingSpeech || self->_hasActiveRequest)
    {
      self->_isCapturingSpeech = 0;
      if (v3)
        v6 = 7;
      else
        v6 = 23;
      +[AFError errorWithCode:](AFError, "errorWithCode:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFDictationConnection _tellSpeechDelegateRecognitionDidFail:](self, "_tellSpeechDelegateRecognitionDidFail:", v7);

    }
    if (self->_isWaitingForAudioFile)
    {
      if (v3)
        v8 = 7;
      else
        v8 = 23;
      +[AFError errorWithCode:](AFError, "errorWithCode:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFDictationConnection _tellSpeechDelegateAudioFileFinished:error:](self, "_tellSpeechDelegateAudioFileFinished:error:", 0, v9);

    }
  }
  -[AFDictationConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
}

- (void)_clearConnection
{
  NSXPCConnection *connection;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[AFDictationConnection _cancelTimerClearBuffer](self, "_cancelTimerClearBuffer");
  -[AFDictationConnection _connectionClearedForInterruption:](self, "_connectionClearedForInterruption:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)_registerInvalidationHandlerForXPCConnection:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__AFDictationConnection__registerInvalidationHandlerForXPCConnection___block_invoke;
  v5[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "setInvalidationHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  void *v13;
  NSXPCConnection *v14;
  AFDictationConnectionServiceDelegate *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  connection = self->_connection;
  if (!connection)
  {
    -[AFInstanceContext createXPCConnectionWithMachServiceName:options:](self->_instanceContext, "createXPCConnectionWithMachServiceName:options:", CFSTR("com.apple.assistant.dictation"), 0);
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_connection;
    self->_connection = v4;

    -[AFDictationConnection _registerInvalidationHandlerForXPCConnection:](self, "_registerInvalidationHandlerForXPCConnection:", self->_connection);
    objc_initWeak(&location, self);
    v6 = self->_connection;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __36__AFDictationConnection__connection__block_invoke;
    v20 = &unk_1E3A35AE0;
    objc_copyWeak(&v21, &location);
    -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", &v17);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("AFDictationConnection.connection", v8);
    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", v9, v17, v18, v19, v20);
    v10 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE432258);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v11);

    v12 = self->_connection;
    AFDictationServiceDelegateXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v12, "setExportedInterface:", v13);

    v14 = self->_connection;
    v15 = -[AFDictationConnectionServiceDelegate initWithDictationConnection:]([AFDictationConnectionServiceDelegate alloc], "initWithDictationConnection:", self);
    -[NSXPCConnection setExportedObject:](v14, "setExportedObject:", v15);

    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (id)_dictationService
{
  void *v2;
  void *v3;

  -[AFDictationConnection _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dictationServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFDictationConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_scheduleRequestTimeout
{
  NSObject *timeoutTimer;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  timeoutTimer = self->_timeoutTimer;
  if (!timeoutTimer)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internalQueue);
    v5 = self->_timeoutTimer;
    self->_timeoutTimer = v4;

    v6 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __48__AFDictationConnection__scheduleRequestTimeout__block_invoke;
    handler[3] = &unk_1E3A36F30;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    timeoutTimer = self->_timeoutTimer;
  }
  v7 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(timeoutTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_cancelRequestTimeout
{
  NSObject *timeoutTimer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
    dispatch_source_cancel(timeoutTimer);
}

- (void)_invokeRequestTimeout
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventWithType:context:", 2208, 0);

  -[AFDictationConnection _dictationService](self, "_dictationService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSpeech");

  +[AFError errorWithCode:](AFError, "errorWithCode:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AFDictationConnection _tellSpeechDelegateRecognitionDidFail:](self, "_tellSpeechDelegateRecognitionDidFail:", v5);

}

- (void)_extendRequestTimeout
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[AFDictationConnection _cancelRequestTimeout](self, "_cancelRequestTimeout");
  if (self->_hasActiveRequest)
    -[AFDictationConnection _scheduleRequestTimeout](self, "_scheduleRequestTimeout");
}

- (void)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3
{
  id v4;
  AFAudioPowerXPCProvider *v5;
  AFAudioPowerUpdater *v6;
  AFAudioPowerUpdater *inputAudioPowerUpdater;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  AFDictationConnection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AFDictationConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (v4)
  {
    v5 = -[AFAudioPowerXPCProvider initWithXPCWrapper:]([AFAudioPowerXPCProvider alloc], "initWithXPCWrapper:", v4);
    v6 = -[AFAudioPowerUpdater initWithProvider:queue:frequency:delegate:]([AFAudioPowerUpdater alloc], "initWithProvider:queue:frequency:delegate:", v5, self->_internalQueue, 0, 0);
    inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = v6;

    -[AFAudioPowerUpdater beginUpdate](self->_inputAudioPowerUpdater, "beginUpdate");
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[AFDictationConnection _startInputAudioPowerUpdatesWithXPCWrapper:]";
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p Started input audio power updates.", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)_stopInputAudioPowerUpdates
{
  AFAudioPowerUpdater *inputAudioPowerUpdater;
  AFAudioPowerUpdater *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  AFDictationConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  if (inputAudioPowerUpdater)
  {
    -[AFAudioPowerUpdater endUpdate](inputAudioPowerUpdater, "endUpdate");
    -[AFAudioPowerUpdater invalidate](self->_inputAudioPowerUpdater, "invalidate");
    v4 = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = 0;

    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v6 = 136315394;
      v7 = "-[AFDictationConnection _stopInputAudioPowerUpdates]";
      v8 = 2048;
      v9 = self;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p Stopped input audio power updates.", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)forcedOfflineDictationIsAvailableForLanguage:(id)a3
{
  return -[AFDictationConnection forcedOfflineDictationIsAvailableForLanguage:synchronous:](self, "forcedOfflineDictationIsAvailableForLanguage:synchronous:", a3, 1);
}

- (BOOL)forcedOfflineDictationIsAvailableForLanguage:(id)a3 synchronous:(BOOL)a4
{
  id v5;
  NSSet *knownOfflineInstalledLanguages;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *v10;
  NSObject *internalQueue;
  void *v12;
  BOOL v13;
  _QWORD block[5];

  v5 = a3;
  knownOfflineInstalledLanguages = self->_knownOfflineInstalledLanguages;
  if (!knownOfflineInstalledLanguages)
  {
    +[AFPreferences sharedPreferencesWithInstanceContext:](AFPreferences, "sharedPreferencesWithInstanceContext:", self->_instanceContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "offlineDictationStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_226);
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v10 = self->_knownOfflineInstalledLanguages;
    self->_knownOfflineInstalledLanguages = v9;

    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__AFDictationConnection_forcedOfflineDictationIsAvailableForLanguage_synchronous___block_invoke_2;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(internalQueue, block);
    knownOfflineInstalledLanguages = self->_knownOfflineInstalledLanguages;
  }
  AFOfflineDictationLanguageForKeyboardLanguage(v5, knownOfflineInstalledLanguages);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;

  return v13;
}

- (void)_willStartDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 machAbsoluteTime:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  AFAnalyticsTurnBasedInstrumentationContext *v15;
  void *v16;
  AFAnalyticsTurnBasedInstrumentationContext *v17;
  AFAnalyticsTurnBasedInstrumentationContext *intstrumentationContext;
  AFAnalyticsTurnBasedInstrumentationContext **p_intstrumentationContext;
  id v20;
  NSString *v21;
  NSString *requestIdString;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSString *onDeviceDictationUIInteractionIdentifier;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  int v39;
  int v40;
  NSString *v41;
  NSString *v42;
  NSString *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  _QWORD v73[2];
  _QWORD v74[4];
  _QWORD v75[4];
  const __CFString *v76;
  id v77;
  _QWORD v78[5];
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  AFDictationConnection *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  unint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v80 = "-[AFDictationConnection _willStartDictationWithLanguageCode:options:speechOptions:machAbsoluteTime:]";
    v81 = 2048;
    v82 = self;
    v83 = 2112;
    v84 = v10;
    v85 = 2112;
    v86 = v11;
    v87 = 2112;
    v88 = v12;
    v89 = 2048;
    v90 = a6;
    _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s %p %@ %@ %@ %llu", buf, 0x3Eu);
  }
  v71 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  self->_isDetectingUtterances = 0;
  objc_msgSend(v12, "turnIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = [AFAnalyticsTurnBasedInstrumentationContext alloc];
    objc_msgSend(v12, "turnIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[AFAnalyticsTurnBasedInstrumentationContext initWithTurnIdentifier:](v15, "initWithTurnIdentifier:", v16);
    p_intstrumentationContext = &self->_intstrumentationContext;
    intstrumentationContext = self->_intstrumentationContext;
    self->_intstrumentationContext = v17;

  }
  else
  {
    p_intstrumentationContext = &self->_intstrumentationContext;
    v16 = self->_intstrumentationContext;
    self->_intstrumentationContext = 0;
  }

  self->_hasActiveRequest = 1;
  v20 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v20, "UUIDString");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestIdString = self->_requestIdString;
  self->_requestIdString = v21;

  self->_isWaitingForAudioFile = objc_msgSend(v12, "audioFileType") != 0;
  objc_msgSend(v11, "interactionIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23
    || (v24 = (void *)v23,
        objc_msgSend(v11, "fieldLabel"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = objc_msgSend(v25, "hasPrefix:", CFSTR("SFSpeech")),
        v25,
        v24,
        v26))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInteractionIdentifier:", v28);

  }
  onDeviceDictationUIInteractionIdentifier = self->_onDeviceDictationUIInteractionIdentifier;
  self->_onDeviceDictationUIInteractionIdentifier = 0;

  v72 = v12;
  if (AFIsDictationRequestEligibleForOnDeviceDictation(v11))
  {
    +[AFPreferences sharedPreferencesWithInstanceContext:](AFPreferences, "sharedPreferencesWithInstanceContext:", self->_instanceContext);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "offlineDictationStatus");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      AFOfflineDictationStatusForLanguage(v10, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Installed"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "BOOLValue");

      if (v34)
      {
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("High Quality"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "BOOLValue");

        v37 = v36 ^ 1;
      }
      else
      {
        v37 = 1;
      }
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("On Device Search"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "BOOLValue");

      if (objc_msgSend(v11, "returnKeyType") == 7)
        v40 = (objc_msgSend(v11, "preferOnDeviceRecognition") | v39) ^ 1;
      else
        v40 = 0;
      if (((v37 | v40) & 1) == 0)
      {
        objc_msgSend(v11, "interactionIdentifier");
        v41 = (NSString *)objc_claimAutoreleasedReturnValue();
        v42 = self->_onDeviceDictationUIInteractionIdentifier;
        self->_onDeviceDictationUIInteractionIdentifier = v41;

      }
    }

  }
  v43 = self->_onDeviceDictationUIInteractionIdentifier;
  if (self->_intstrumentationContext)
  {
    v44 = objc_alloc_init(MEMORY[0x1E0D9A478]);
    v45 = v44;
    if (v43)
      v46 = 1;
    else
      v46 = 2;
    objc_msgSend(v44, "setSpeechRecognitionSource:", v46);
    -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_intstrumentationContext, "emitInstrumentation:", v45);
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_requestIdString);
    if (v47)
    {
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v47);
      v49 = objc_alloc_init(MEMORY[0x1E0D9A4B0]);
      objc_msgSend(v49, "setMteRequestId:", v48);
      -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](*p_intstrumentationContext, "emitInstrumentation:", v49);

    }
  }
  +[AFAggregator logDictationStarted](AFAggregator, "logDictationStarted");
  v70 = v10;
  if (v10)
  {
    v76 = CFSTR("languageCode");
    v77 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v50 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = MEMORY[0x1E0C9AA70];
  }
  v67 = (void *)v50;
  v78[0] = v50;
  AFAnalyticsContextCreateWithSpeechRequestOptions(v72);
  v68 = v11;
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v69;
  AFAnalyticsContextCreateWithDictationOptions(v11);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v51;
  AFAnalyticsContextCreateForCurrentProcess();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v52;
  v74[0] = CFSTR("unixTime");
  v53 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "timeIntervalSince1970");
  objc_msgSend(v53, "numberWithDouble:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = self->_requestIdString;
  v75[0] = v55;
  v75[1] = v56;
  v74[1] = CFSTR("id");
  v74[2] = CFSTR("systemVersion");
  AFProductAndBuildVersion();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v57;
  v74[3] = CFSTR("isOnDeviceDictationExpected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43 != 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge(v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    v73[0] = v61;
    v62 = v72;
    AFAnalyticsTurnContextCreateWithSpeechRequestOptions(v72);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge(v64);
    v65 = objc_claimAutoreleasedReturnValue();

    v61 = (void *)v65;
  }
  else
  {
    v62 = v72;
  }
  -[AFDictationConnection _sendPendingAnalyticsEvents](self, "_sendPendingAnalyticsEvents");
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "logEventWithType:machAbsoluteTime:context:", 2201, v71, v61);

}

- (void)_logRequestCompetionStatusWithEventType:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  NSString *onDeviceDictationUIInteractionIdentifier;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_onDeviceDictationUIInteractionIdentifier)
  {
    switch(a3)
    {
      case 2205:
        v8 = CFSTR("canceled");
        break;
      case 2206:
        if (v6)
        {
          objc_msgSend(v6, "domain");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("kAFAssistantErrorDomain"));

          v8 = CFSTR("failure");
          if (v10)
          {
            v11 = objc_msgSend(v7, "code");
            v12 = CFSTR("interrupted");
            if (v11 != 1107)
              v12 = CFSTR("failure");
            if (v11 == 1110)
              v8 = CFSTR("noMatch");
            else
              v8 = v12;
          }
        }
        else
        {
          v8 = CFSTR("failure");
        }
        break;
      case 2207:
        v8 = CFSTR("success");
        break;
      default:
        v8 = CFSTR("unknown");
        break;
    }
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("requestStatus");
    v16[1] = CFSTR("dictationUIInteractionIdentifier");
    onDeviceDictationUIInteractionIdentifier = self->_onDeviceDictationUIInteractionIdentifier;
    v17[0] = v8;
    v17[1] = onDeviceDictationUIInteractionIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logEventWithType:context:", 2222, v15);

  }
}

- (void)_LogUEIRequestCategorization:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D9A4D0]);
  objc_msgSend(v5, "setRequestStatus:", v3);
  objc_msgSend(v5, "setRequestType:", 6);
  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_intstrumentationContext, "emitInstrumentation:", v5);

}

- (void)_willCancelDictation
{
  NSObject *v3;
  NSString *requestIdString;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  AFDictationConnection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[AFDictationConnection _willCancelDictation]";
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_hasActiveRequest)
  {
    self->_hasActiveRequest = 0;
    if (self->_intstrumentationContext)
      -[AFDictationConnection _LogUEIRequestCategorization:](self, "_LogUEIRequestCategorization:", 1);
    requestIdString = self->_requestIdString;
    if (requestIdString)
    {
      v7 = CFSTR("id");
      v8 = requestIdString;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logEventWithType:context:", 2205, v5);

    -[AFDictationConnection _logRequestCompetionStatusWithEventType:error:](self, "_logRequestCompetionStatusWithEventType:error:", 2205, 0);
    +[AFAggregator logDictationCancelled](AFAggregator, "logDictationCancelled");

  }
}

- (void)_willFailDictationWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *requestIdString;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  NSString *v23;
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  AFDictationConnection *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[AFDictationConnection _willFailDictationWithError:]";
    v27 = 2048;
    v28 = self;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_hasActiveRequest)
  {
    self->_hasActiveRequest = 0;
    if (self->_intstrumentationContext)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D9A468]);
      AFPNRFatalErrorInfoFromNSError(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setError:", v7);

      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      AFPNRFatalErrorInfoFromNSError(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUnderlyingError:", v11);

      objc_msgSend(v10, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      AFPNRFatalErrorInfoFromNSError(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUnderUnderlyingError:", v14);

      -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_intstrumentationContext, "emitInstrumentation:", v6);
      -[AFDictationConnection _LogUEIRequestCategorization:](self, "_LogUEIRequestCategorization:", 2);

    }
    requestIdString = self->_requestIdString;
    if (requestIdString)
    {
      v22 = CFSTR("id");
      v23 = requestIdString;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C9AA70];
    }
    v24[0] = v16;
    AFAnalyticsContextCreateWithError(v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (requestIdString)
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logEventWithType:context:", 2206, v19);

    -[AFDictationConnection _logRequestCompetionStatusWithEventType:error:](self, "_logRequestCompetionStatusWithEventType:error:", 2206, v4);
    +[AFAggregator logDictationFailedWithError:](AFAggregator, "logDictationFailedWithError:", v4);
    -[AFDictationConnection _dictationService](self, "_dictationService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recordFailureMetricsForError:", v4);

    -[AFDictationConnection reportIssueForError:eventType:subtype:context:](self, "reportIssueForError:eventType:subtype:context:", v4, 2206, CFSTR("Dictation"), v19);
  }

}

- (void)_willCompleteDictation
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSString *requestIdString;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  NSString *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  AFDictationConnection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFDictationConnection _willCompleteDictation]";
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_hasActiveRequest)
  {
    self->_hasActiveRequest = 0;
    if (self->_intstrumentationContext)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D9A4D8]);
      -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_intstrumentationContext, "emitInstrumentation:", v4);
      -[AFDictationConnection _LogUEIRequestCategorization:](self, "_LogUEIRequestCategorization:", 3);

    }
    if (AFIsInternalInstall_onceToken != -1)
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
    if (AFIsInternalInstall_isInternal)
    {
      v5 = (id)AFSiriLogContextSpeech;
      v6 = os_signpost_id_generate((os_log_t)AFSiriLogContextSpeech);
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19AF50000, v5, OS_SIGNPOST_EVENT, v7, "UsefulUserFacingResults", ", buf, 2u);
        }
      }

    }
    requestIdString = self->_requestIdString;
    if (requestIdString)
    {
      v12 = CFSTR("id");
      v13 = requestIdString;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logEventWithType:context:", 2207, v9);

    -[AFDictationConnection _logRequestCompetionStatusWithEventType:error:](self, "_logRequestCompetionStatusWithEventType:error:", 2207, 0);
    +[AFAggregator logDictationSucceeded](AFAggregator, "logDictationSucceeded");
    -[AFDictationConnection _dictationService](self, "_dictationService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordAWDSuccessMetrics");

  }
}

- (void)_addPreheatAnalyticsEvent
{
  AFAnalyticsEvent *v3;
  AFAnalyticsEvent *preheatEvent;

  AFAnalyticsEventCreateCurrent(2225, 0);
  v3 = (AFAnalyticsEvent *)objc_claimAutoreleasedReturnValue();
  preheatEvent = self->_preheatEvent;
  self->_preheatEvent = v3;

}

- (void)_sendPendingAnalyticsEvents
{
  NSObject *v3;
  void *v4;
  AFAnalyticsEvent *preheatEvent;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_preheatEvent)
  {
    v3 = AFSiriLogContextSpeech;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[AFDictationConnection _sendPendingAnalyticsEvents]";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Sending 1 event", (uint8_t *)&v6, 0xCu);
    }
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEvent:", self->_preheatEvent);

    preheatEvent = self->_preheatEvent;
    self->_preheatEvent = 0;

  }
}

- (void)preheat
{
  void *v3;
  id v4;

  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictationConnection preheatForLanguageCode:](self, "preheatForLanguageCode:", v3);

}

- (void)preheatWithRecordDeviceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  AFDictationConnection *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[AFDictationConnection preheatWithRecordDeviceIdentifier:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__AFDictationConnection_preheatWithRecordDeviceIdentifier___block_invoke;
  v8[3] = &unk_1E3A36FC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(internalQueue, v8);

}

- (void)_setActivationTimeOnOptionsIfNecessary:(id)a3
{
  id v3;
  double v4;
  NSObject *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "expectedActivationEventTime");
  if (v4 <= 0.0)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[AFDictationConnection _setActivationTimeOnOptionsIfNecessary:]";
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Inserting activation timestamps since client did not set them", (uint8_t *)&v10, 0xCu);
    }
    objc_msgSend(v3, "activationEventTime");
    if (v6 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemUptime");
      v9 = v8;

      objc_msgSend(v3, "setActivationEventTime:", v9);
    }
    objc_msgSend(v3, "activationEventTime");
    objc_msgSend(v3, "setExpectedActivationEventTime:");
  }

}

- (id)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5
{
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  NSObject *v11;
  dispatch_group_t v12;
  NSObject *internalQueue;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _BYTE *v25;
  _QWORD block[5];
  id v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  id v29;
  NSObject *v30;
  _QWORD *v31;
  _BYTE *v32;
  _QWORD v33[5];
  id v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  _BYTE v37[20];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    v36 = v8;
    *(_WORD *)v37 = 2112;
    *(_QWORD *)&v37[2] = v9;
    *(_WORD *)&v37[10] = 2112;
    *(_QWORD *)&v37[12] = v10;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p %@ %@ %@", buf, 0x34u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v36 = __Block_byref_object_copy__11944;
  *(_QWORD *)v37 = __Block_byref_object_dispose__11945;
  *(_QWORD *)&v37[8] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__268;
  v33[4] = __Block_byref_object_dispose__269;
  v34 = 0;
  v12 = dispatch_group_create();
  internalQueue = self->_internalQueue;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke;
  block[3] = &unk_1E3A2FEA8;
  block[4] = self;
  v27 = v10;
  v28 = v8;
  v29 = v9;
  v15 = v12;
  v30 = v15;
  v31 = v33;
  v32 = buf;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  dispatch_sync(internalQueue, block);
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_3;
  v22[3] = &unk_1E3A2FEF8;
  v23 = v15;
  v24 = v33;
  v25 = buf;
  v19 = v15;
  v20 = (void *)MEMORY[0x1A1AC0C3C](v22);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  AFDictationConnection *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v22 = "-[AFDictationConnection startDictationWithLanguageCode:options:speechOptions:]";
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %p %@ %@ %@", buf, 0x34u);
  }
  v12 = (void *)objc_msgSend(v8, "copy");
  internalQueue = self->_internalQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__AFDictationConnection_startDictationWithLanguageCode_options_speechOptions___block_invoke;
  v17[3] = &unk_1E3A369B8;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v9;
  dispatch_async(internalQueue, v17);

}

- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4
{
  -[AFDictationConnection startDictationWithLanguageCode:options:speechOptions:](self, "startDictationWithLanguageCode:options:speechOptions:", a3, a4, 0);
}

- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4
{
  -[AFDictationConnection startRecordedAudioDictationWithOptions:forLanguage:narrowband:forceSampling:](self, "startRecordedAudioDictationWithOptions:forLanguage:narrowband:forceSampling:", a3, a4, 0, 0);
}

- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4 narrowband:(BOOL)a5
{
  -[AFDictationConnection startRecordedAudioDictationWithOptions:forLanguage:narrowband:forceSampling:](self, "startRecordedAudioDictationWithOptions:forLanguage:narrowband:forceSampling:", a3, a4, a5, 0);
}

- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4 narrowband:(BOOL)a5 forceSampling:(BOOL)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  AFDictationConnection *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v23 = "-[AFDictationConnection startRecordedAudioDictationWithOptions:forLanguage:narrowband:forceSampling:]";
    v24 = 2048;
    v25 = self;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    v30 = 1024;
    v31 = v7;
    _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s %p %@ %@ %d", buf, 0x30u);
  }
  v13 = (void *)objc_msgSend(v10, "copy");
  internalQueue = self->_internalQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__AFDictationConnection_startRecordedAudioDictationWithOptions_forLanguage_narrowband_forceSampling___block_invoke;
  v17[3] = &unk_1E3A2FF40;
  v17[4] = self;
  v18 = v11;
  v19 = v13;
  v20 = v7;
  v21 = a6;
  v15 = v13;
  v16 = v11;
  dispatch_async(internalQueue, v17);

}

- (void)addRecordedSpeechSampleData:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AFDictationConnection_addRecordedSpeechSampleData___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

- (void)cancelSpeech
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFDictationConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFDictationConnection cancelSpeech]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AFDictationConnection_cancelSpeech__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)stopSpeechWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  AFDictationConnection *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[AFDictationConnection stopSpeechWithOptions:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__AFDictationConnection_stopSpeechWithOptions___block_invoke;
  v8[3] = &unk_1E3A36FC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(internalQueue, v8);

}

- (void)_delayedStopSpeechWithOptions:(id)a3
{
  NSObject *internalQueue;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  internalQueue = self->_internalQueue;
  v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[AFDictationConnection _delayedStopSpeechWithOptions:]";
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Delayed stop after buffer cleared", (uint8_t *)&v10, 0xCu);
  }
  kdebug_trace();
  AFAnalyticsContextCreateWithSpeechRequestOptions(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventWithType:context:contextNoCopy:", 2203, v7, 1);

  -[AFDictationConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  -[AFDictationConnection _dictationService](self, "_dictationService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopSpeechWithOptions:", v5);

}

- (void)stopSpeech
{
  -[AFDictationConnection stopSpeechWithOptions:](self, "stopSpeechWithOptions:", 0);
}

- (void)updateSpeechOptions:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  AFDictationConnection *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  AFDictationConnection *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[AFDictationConnection updateSpeechOptions:]";
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__AFDictationConnection_updateSpeechOptions___block_invoke;
  v8[3] = &unk_1E3A36FC8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(internalQueue, v8);

}

- (void)sendSpeechCorrection:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AFDictationConnection_sendSpeechCorrection_forIdentifier___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

- (void)sendSpeechCorrection:(id)a3 interactionIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AFDictationConnection_sendSpeechCorrection_interactionIdentifier___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

- (void)sendUserSelectedAlternativeDictationLanguageCode:(id)a3
{
  id v4;
  NSObject *internalQueue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__AFDictationConnection_sendUserSelectedAlternativeDictationLanguageCode___block_invoke;
    v7[3] = &unk_1E3A33A28;
    objc_copyWeak(&v9, location);
    v8 = v4;
    dispatch_async(internalQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[AFDictationConnection sendUserSelectedAlternativeDictationLanguageCode:]";
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Language code is nil.", (uint8_t *)location, 0xCu);
    }
  }

}

- (float)averagePower
{
  float result;

  -[AFAudioPowerUpdater _unsafeAveragePower](self->_inputAudioPowerUpdater, "_unsafeAveragePower");
  return result;
}

- (float)peakPower
{
  float result;

  -[AFAudioPowerUpdater _unsafePeakPower](self->_inputAudioPowerUpdater, "_unsafePeakPower");
  return result;
}

- (void)endSession
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFDictationConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFDictationConnection endSession]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AFDictationConnection_endSession__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)requestOfflineAssistantSupportForLanguage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AFDictationConnection_requestOfflineAssistantSupportForLanguage_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AFDictationConnection_requestOfflineDictationSupportForLanguage_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AFDictationConnection_suppressLowStorageNotificationForLanguage_suppress___block_invoke;
  block[3] = &unk_1E3A2FF68;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

- (void)_sendDataIfNeeded
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_stopOptions && !-[NSMutableData length](self->_buffer, "length"))
  {
    -[AFDictationConnection _delayedStopSpeechWithOptions:](self, "_delayedStopSpeechWithOptions:", self->_stopOptions);
  }
  else if (!self->_bufferTimer && -[NSMutableData length](self->_buffer, "length"))
  {
    if (self->_audioStartTime < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "systemUptime");
      self->_audioStartTime = v4;

    }
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    v7 = v6 - self->_audioStartTime;

    v8 = v7 + 15.0 - self->_amountDataSent;
    v9 = -[NSMutableData length](self->_buffer, "length");
    v10 = dbl_19B0EC770[!self->_narrowband];
    v11 = fmin(v8, (double)v9 / v10);
    v12 = v10 * v11;
    v13 = (double)-[NSMutableData length](self->_buffer, "length");
    if (v12 < v13)
      v13 = v12;
    -[AFDictationConnection _dequeueAudioWithLength:](self, "_dequeueAudioWithLength:", (unint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFDictationConnection _dictationService](self, "_dictationService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addRecordedSpeechSampleData:", v14);

    v16 = v11 + self->_amountDataSent;
    self->_amountDataSent = v16;
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v18 = 136315906;
      v19 = "-[AFDictationConnection _sendDataIfNeeded]";
      v20 = 2048;
      v21 = v7;
      v22 = 2048;
      v23 = v16;
      v24 = 2048;
      v25 = v11;
      _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s Sent data from buffer, actualRuntime=%f, amountSent=%f, outgoingDuration=%f", (uint8_t *)&v18, 0x2Au);
    }
    if (-[NSMutableData length](self->_buffer, "length"))
    {
      -[AFDictationConnection _updateBufferFlushTimerWithDelay:](self, "_updateBufferFlushTimerWithDelay:", 2.0);
    }
    else if (self->_stopOptions)
    {
      -[AFDictationConnection _delayedStopSpeechWithOptions:](self, "_delayedStopSpeechWithOptions:");
    }

  }
}

- (id)_dequeueAudioWithLength:(unint64_t)a3
{
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NSMutableData subdataWithRange:](self->_buffer, "subdataWithRange:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_buffer, "replaceBytesInRange:withBytes:length:", 0, a3, 0, 0);
  return v5;
}

- (void)_updateBufferFlushTimerWithDelay:(double)a3
{
  NSObject *v5;
  NSObject *bufferTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD handler[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFDictationConnection _updateBufferFlushTimerWithDelay:]";
    v15 = 2048;
    v16 = a3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Schedule timer with delay: %.2f", buf, 0x16u);
  }
  bufferTimer = self->_bufferTimer;
  if (!bufferTimer)
  {
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internalQueue);
    v8 = self->_bufferTimer;
    self->_bufferTimer = v7;

    objc_initWeak((id *)buf, self);
    v9 = self->_bufferTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__AFDictationConnection__updateBufferFlushTimerWithDelay___block_invoke;
    handler[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_bufferTimer);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
    bufferTimer = self->_bufferTimer;
  }
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(bufferTimer, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_cancelBufferFlushTimer
{
  NSObject *bufferTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  bufferTimer = self->_bufferTimer;
  if (bufferTimer)
  {
    dispatch_source_cancel(bufferTimer);
    v4 = self->_bufferTimer;
    self->_bufferTimer = 0;

  }
}

- (void)_cancelTimerClearBuffer
{
  NSMutableData *v3;
  NSMutableData *buffer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[AFDictationConnection _cancelBufferFlushTimer](self, "_cancelBufferFlushTimer");
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  buffer = self->_buffer;
  self->_buffer = v3;

}

- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 context:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    -[AFDictationConnection _dictationService](self, "_dictationService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportIssueForError:eventType:context:", v10, a4, v8);

  }
}

- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a5;
  v11 = a6;
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    -[AFDictationConnection _dictationService](self, "_dictationService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportIssueForError:eventType:subtype:context:", v13, a4, v10, v11);

  }
}

- (void)pauseRecognition
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFDictationConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFDictationConnection pauseRecognition]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AFDictationConnection_pauseRecognition__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
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
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__AFDictationConnection_resumeRecognitionWithPrefixText_postfixText_selectedText___block_invoke;
  v15[3] = &unk_1E3A369B8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

- (void)preheatEuclidModelWithLanguage:(id)a3 clientID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AFDictationConnection_preheatEuclidModelWithLanguage_clientID___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

- (void)getEuclidPhonetic:(id)a3 maxResultsCount:(int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__AFDictationConnection_getEuclidPhonetic_maxResultsCount_completion___block_invoke;
  v13[3] = &unk_1E3A2FF90;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *internalQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  internalQueue = self->_internalQueue;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __179__AFDictationConnection_updateVoiceCommandContextWithPrefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression___block_invoke;
  v30[3] = &unk_1E3A2FFB8;
  v30[4] = self;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v37 = v21;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  v27 = v17;
  v28 = v16;
  v29 = v15;
  dispatch_async(internalQueue, v30);

}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *internalQueue;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v32 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __189__AFDictationConnection_updateVoiceCommandContextWithPrefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent___block_invoke;
  block[3] = &unk_1E3A2FFE0;
  block[4] = self;
  v34 = v32;
  v35 = v16;
  v36 = v17;
  v37 = v18;
  v38 = v19;
  v39 = v20;
  v40 = v21;
  v41 = v22;
  v24 = v22;
  v25 = v21;
  v26 = v20;
  v27 = v19;
  v28 = v18;
  v29 = v17;
  v30 = v16;
  v31 = v32;
  dispatch_async(internalQueue, block);

}

- (AFDictationDelegate)delegate
{
  return (AFDictationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

void __189__AFDictationConnection_updateVoiceCommandContextWithPrefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  id v3;

  v2 = (_BYTE *)a1[4];
  if (v2[57])
  {
    objc_msgSend(v2, "_dictationService");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12]);

  }
}

void __179__AFDictationConnection_updateVoiceCommandContextWithPrefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  id v3;

  v2 = (_BYTE *)a1[4];
  if (v2[57])
  {
    objc_msgSend(v2, "_dictationService");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], 0);

  }
}

void __70__AFDictationConnection_getEuclidPhonetic_maxResultsCount_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findAlternativesForString:maxResults:completion:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __65__AFDictationConnection_preheatEuclidModelWithLanguage_clientID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preheatEuclidModelWithLanguage:clientID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __82__AFDictationConnection_resumeRecognitionWithPrefixText_postfixText_selectedText___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 57))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dictationService");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resumeRecognitionWithPrefixText:postfixText:selectedText:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v6 = "-[AFDictationConnection resumeRecognitionWithPrefixText:postfixText:selectedText:]_block_invoke";
      v7 = 2048;
      v8 = v1;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p ignoring - no active request", buf, 0x16u);
    }
  }
}

void __41__AFDictationConnection_pauseRecognition__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  id v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 57))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dictationService");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseRecognition");

  }
  else
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v5 = "-[AFDictationConnection pauseRecognition]_block_invoke";
      v6 = 2048;
      v7 = v1;
      _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s %p ignoring - no active request", buf, 0x16u);
    }
  }
}

void __58__AFDictationConnection__updateBufferFlushTimerWithDelay___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "_cancelBufferFlushTimer");

  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "_sendDataIfNeeded");

  objc_destroyWeak(&to);
}

void __76__AFDictationConnection_suppressLowStorageNotificationForLanguage_suppress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suppressLowStorageNotificationForLanguage:suppress:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

void __78__AFDictationConnection_requestOfflineDictationSupportForLanguage_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestOfflineDictationSupportForLanguage:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __78__AFDictationConnection_requestOfflineAssistantSupportForLanguage_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestOfflineAssistantSupportForLanguage:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __35__AFDictationConnection_endSession__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endSession");

  return objc_msgSend(*(id *)(a1 + 32), "_clearConnection");
}

void __74__AFDictationConnection_sendUserSelectedAlternativeDictationLanguageCode___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dictationService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendUserSelectedAlternativeDictationLanguageCode:", *(_QWORD *)(a1 + 32));

}

void __68__AFDictationConnection_sendSpeechCorrection_interactionIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendSpeechCorrectionInfo:interactionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __60__AFDictationConnection_sendSpeechCorrection_forIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendSpeechCorrectionInfo:forCorrectionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __45__AFDictationConnection_updateSpeechOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  AFAnalyticsContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:context:contextNoCopy:", 2202, v4, 1);

  objc_msgSend(*(id *)(a1 + 40), "_dictationService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateSpeechOptions:", *(_QWORD *)(a1 + 32));

}

void __47__AFDictationConnection_stopSpeechWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  AFSpeechRequestOptions *v4;
  AFSpeechRequestOptions *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 96))
    goto LABEL_2;
  if (!objc_msgSend(*(id *)(v2 + 112), "length"))
  {
    v2 = *(_QWORD *)(a1 + 32);
LABEL_2:
    objc_msgSend((id)v2, "_delayedStopSpeechWithOptions:", *(_QWORD *)(a1 + 40));
    return;
  }
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[AFDictationConnection stopSpeechWithOptions:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Stop requested, delaying till buffer is empty", (uint8_t *)&v6, 0xCu);
  }
  if (*(_QWORD *)(a1 + 40))
    v4 = (AFSpeechRequestOptions *)objc_msgSend(*(id *)(a1 + 40), "copy");
  else
    v4 = objc_alloc_init(AFSpeechRequestOptions);
  v5 = v4;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v4);

}

void __37__AFDictationConnection_cancelSpeech__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:context:", 2204, 0);

  objc_msgSend(*(id *)(a1 + 32), "_cancelTimerClearBuffer");
  objc_msgSend(*(id *)(a1 + 32), "_checkAndSetIsCapturingSpeech:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_willCancelDictation");
  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelSpeech");

}

void __53__AFDictationConnection_addRecordedSpeechSampleData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 96))
  {
    objc_msgSend((id)v2, "_dictationService");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addRecordedSpeechSampleData:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 112), "appendData:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_sendDataIfNeeded");
  }
}

void __101__AFDictationConnection_startRecordedAudioDictationWithOptions_forLanguage_narrowband_forceSampling___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AFSpeechRequestOptions *v7;

  v7 = objc_alloc_init(AFSpeechRequestOptions);
  -[AFSpeechRequestOptions setActivationEvent:](v7, "setActivationEvent:", 12);
  objc_msgSend(*(id *)(a1 + 32), "_willStartDictationWithLanguageCode:options:speechOptions:machAbsoluteTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, mach_absolute_time());
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = objc_msgSend(*(id *)(a1 + 48), "forceOfflineRecognition");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 59) = objc_msgSend(*(id *)(a1 + 48), "incremental");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 60) = objc_msgSend(*(id *)(a1 + 48), "shouldClassifyIntent");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 61) = objc_msgSend(*(id *)(a1 + 48), "shouldRecognizeCommands");
  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRequestActivityWithCompletion:", &__block_literal_global_288);

  objc_msgSend(*(id *)(a1 + 48), "offlineLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(void **)(a1 + 48);
    AFOfflineDictationLanguageForKeyboardLanguage(*(void **)(a1 + 40), *(void **)(*(_QWORD *)(a1 + 32) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOfflineLanguage:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startRecordedAudioDictationWithOptions:language:narrowband:forceSampling:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));

}

void __101__AFDictationConnection_startRecordedAudioDictationWithOptions_forLanguage_narrowband_forceSampling___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[AFDictationConnection startRecordedAudioDictationWithOptions:forLanguage:narrowband:forceSampling:]_block_invoke_2";
    _os_log_impl(&dword_19AF50000, v0, OS_LOG_TYPE_INFO, "%s Recorded audio dictation request completed", (uint8_t *)&v1, 0xCu);
  }
}

void __78__AFDictationConnection_startDictationWithLanguageCode_options_speechOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 32), "_checkAndSetIsCapturingSpeech:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_setActivationTimeOnOptionsIfNecessary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_willStartDictationWithLanguageCode:options:speechOptions:machAbsoluteTime:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v2);
  v3 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = objc_msgSend(*(id *)(a1 + 56), "forceOfflineRecognition");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 59) = objc_msgSend(*(id *)(a1 + 56), "incremental");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 60) = objc_msgSend(*(id *)(a1 + 56), "shouldClassifyIntent");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 61) = objc_msgSend(*(id *)(a1 + 56), "shouldRecognizeCommands");
  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startRequestActivityWithCompletion:", &__block_literal_global_286);

  objc_msgSend(*(id *)(a1 + 56), "offlineLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = *(void **)(a1 + 56);
    AFOfflineDictationLanguageForKeyboardLanguage(*(void **)(a1 + 48), *(void **)(*(_QWORD *)(a1 + 32) + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOfflineLanguage:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDictationWithLanguageCode:options:speechOptions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __78__AFDictationConnection_startDictationWithLanguageCode_options_speechOptions___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[AFDictationConnection startDictationWithLanguageCode:options:speechOptions:]_block_invoke_2";
    _os_log_impl(&dword_19AF50000, v0, OS_LOG_TYPE_INFO, "%s Dictation request completed", (uint8_t *)&v1, 0xCu);
  }
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  AFSafetyBlock *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;

  v2 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRequestActivityWithCompletion:", &__block_literal_global_270);

  objc_msgSend(*(id *)(a1 + 32), "_checkAndSetIsCapturingSpeech:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_setActivationTimeOnOptionsIfNecessary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_willStartDictationWithLanguageCode:options:speechOptions:machAbsoluteTime:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v2);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
  kdebug_trace();
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_271;
  v26[3] = &unk_1E3A36A00;
  v27 = *(id *)(a1 + 64);
  objc_msgSend(v5, "_dictationServiceWithErrorHandler:", v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 40);
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_272;
  v22[3] = &unk_1E3A2FE80;
  v25 = *(_QWORD *)(a1 + 72);
  v23 = v9;
  v24 = *(id *)(a1 + 64);
  objc_msgSend(v6, "startRecordingForPendingDictationWithLanguageCode:options:speechOptions:reply:", v8, v7, v23, v22);

  if (objc_msgSend(*(id *)(a1 + 40), "pendCallbacksUntilAfterContinuation"))
  {
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = [AFSafetyBlock alloc];
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_2_280;
    v20[3] = &unk_1E3A313B0;
    v12 = v10;
    v21 = v12;
    v13 = -[AFSafetyBlock initWithBlock:](v11, "initWithBlock:", v20);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 64);
    *(_QWORD *)(v16 + 64) = v12;
    v18 = v12;

  }
  else
  {
    v19 = *(_QWORD *)(a1 + 32);
    v18 = *(NSObject **)(v19 + 64);
    *(_QWORD *)(v19 + 64) = 0;
  }

}

uint64_t __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v7[6];

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  v4 = v3;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_4;
  v7[3] = &unk_1E3A2FED0;
  v5 = a1[4];
  v7[4] = a1[5];
  v7[5] = v4;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v7);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "invoke");
}

uint64_t __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40);
  if (v1)
    return (*(uint64_t (**)(_QWORD, double))(v1 + 16))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), *(double *)(result + 40));
  return result;
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_271(uint64_t a1, void *a2)
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
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v5, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_272(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v3);
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE432678);
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create(0, v7);

  objc_msgSend(v5, "_setQueue:", v8);
  objc_msgSend(v5, "resume");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_273;
  v13[3] = &unk_1E3A2FE58;
  v14 = *(id *)(a1 + 32);
  v15 = v5;
  v9 = v5;
  v10 = MEMORY[0x1A1AC0C3C](v13);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_2_280(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_273(uint64_t a1, double a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v11 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke";
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Continuing pending speech request %p", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_275_11950);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "continuePendingSpeechRequestFromTimestamp:", a2);

  v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_276;
  v8[3] = &unk_1E3A36F30;
  v9 = v7;
  objc_msgSend(v9, "addBarrierBlock:", v8);

}

uint64_t __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_276(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_274(uint64_t a1, void *a2)
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
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke_2";
    _os_log_impl(&dword_19AF50000, v0, OS_LOG_TYPE_INFO, "%s Pending dictation request completed", (uint8_t *)&v1, 0xCu);
  }
}

void __59__AFDictationConnection_preheatWithRecordDeviceIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_addPreheatAnalyticsEvent");
  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preheatWithRecordDeviceIdentifier:", *(_QWORD *)(a1 + 40));

}

uint64_t __82__AFDictationConnection_forcedOfflineDictationIsAvailableForLanguage_synchronous___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_availabilityChanged");
}

uint64_t __82__AFDictationConnection_forcedOfflineDictationIsAvailableForLanguage_synchronous___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("Installed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __48__AFDictationConnection__scheduleRequestTimeout__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invokeRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_cancelRequestTimeout");
}

void __36__AFDictationConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__AFDictationConnection__connection__block_invoke_2;
  v3[3] = &unk_1E3A36F30;
  v4 = WeakRetained;
  v2 = WeakRetained;
  objc_msgSend(v2, "_dispatchAsync:", v3);

}

uint64_t __36__AFDictationConnection__connection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionClearedForInterruption:", 1);
}

void __70__AFDictationConnection__registerInvalidationHandlerForXPCConnection___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[9];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__AFDictationConnection__registerInvalidationHandlerForXPCConnection___block_invoke_2;
    block[3] = &unk_1E3A36F30;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __70__AFDictationConnection__registerInvalidationHandlerForXPCConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearConnection");
}

uint64_t __59__AFDictationConnection__connectionClearedForInterruption___block_invoke()
{
  return CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, CFSTR("Please file radar"), CFSTR("Sorry internal user, assistantd crashed during dictation"), CFSTR("OK"));
}

void __63__AFDictationConnection__tellSpeechDelegateDidPauseRecognition__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnectionDidPauseRecognition:", *(_QWORD *)(a1 + 32));

}

void __82__AFDictationConnection__tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:didBeginLocalRecognitionWithModelInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __68__AFDictationConnection__tellSpeechDelegateLanguageDetectorDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:languageDetectorFailedWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __73__AFDictationConnection__tellSpeechDelegateMultilingualSpeechRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:didRecognizeMultilingualSpeech:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __90__AFDictationConnection__tellSpeechDelegateLanguageDetected_confidenceScores_isConfident___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dictationConnection:didDetectLanguage:confidenceScores:isConfident:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dictationConnection:didDetectLanguage:confidenceScores:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __95__AFDictationConnection__tellSpeechDelegateSearchResultsReceived_recognitionText_stable_final___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:didReceiveSearchResults:recognizedText:stable:final:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));

}

void __68__AFDictationConnection__tellSpeechDelegateAudioFileFinished_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:didFinishWritingAudioFile:error:", a1[4], a1[5], a1[6]);

}

void __71__AFDictationConnection__tellSpeechDelegateSpeechRecognitionDidSucceed__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnectionSpeechRecognitionDidSucceed:", *(_QWORD *)(a1 + 32));

}

void __63__AFDictationConnection__tellSpeechDelegateRecognitionDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:speechRecognitionDidFail:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __91__AFDictationConnection__tellSpeechDelegateDidRecognizeTranscriptionObjects_languageModel___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:didRecognizeTranscriptionObjects:languageModel:", a1[4], a1[5], a1[6]);

}

void __68__AFDictationConnection__tellSpeechDelegateDidProcessAudioDuration___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:didProcessAudioDuration:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

uint64_t __101__AFDictationConnection__tellSpeechDelegateDidRecognizePartialSpeechPackage_nluResult_languageModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delegateDidRecognizePartialSpeechPackage:nluResult:languageModel:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
}

uint64_t __93__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechTokens_nluResult_languageModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delegateDidRecognizeSpeechTokens:nluResult:languageModel:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
}

void __70__AFDictationConnection__tellSpeechDelegateDidRecognizePartialResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _BYTE *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(*(id *)(a1 + 32), "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizePartialResult:]_block_invoke";
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %@ - %@", buf, 0x20u);
  }
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __70__AFDictationConnection__tellSpeechDelegateDidRecognizePartialResult___block_invoke_65;
  v18 = &unk_1E3A2FCE8;
  v20 = v7;
  v11 = v5;
  v19 = v11;
  objc_msgSend(v10, "logEventWithType:contextProvider:", 2214, &v15);

  v12 = *(_BYTE **)(a1 + 40);
  if (v12[59] || (v13 = objc_opt_respondsToSelector(), v12 = *(_BYTE **)(a1 + 40), (v13 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "af_tokens", v15, v16, v17, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_delegateDidRecognizeSpeechTokens:nluResult:languageModel:delegate:", v14, 0, v11, v3);

  }
  else
  {
    objc_msgSend(v3, "dictationConnection:didRecognizePartialResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v15, v16, v17, v18);
  }

}

id __70__AFDictationConnection__tellSpeechDelegateDidRecognizePartialResult___block_invoke_65(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("tokensCount"));

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("languageModel"));
  return v2;
}

void __166__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechPhrases_rawPhrases_utterances_rawUtterances_nluResult_languageModel_correctionIdentifier_audioAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v3 = a2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __166__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechPhrases_rawPhrases_utterances_rawUtterances_nluResult_languageModel_correctionIdentifier_audioAnalytics___block_invoke_2;
  v15[3] = &unk_1E3A2FC98;
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 64);
  v4 = (void (**)(_QWORD))MEMORY[0x1A1AC0C3C](v15);
  v5 = *(_QWORD *)(a1 + 72);
  if (*(_BYTE *)(v5 + 59))
  {
    v6 = objc_opt_respondsToSelector();
    v5 = *(_QWORD *)(a1 + 72);
    if ((v6 & 1) != 0)
    {
      v14 = 0;
      DeltaPhrases(*(void **)(a1 + 32), *(void **)(v5 + 152), &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:replacingPreviousPhrasesCount:", *(_QWORD *)(a1 + 72), v7, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v14);
      v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v9 = *(_QWORD *)(a1 + 72);
      v10 = *(void **)(v9 + 152);
      *(_QWORD *)(v9 + 152) = v8;

LABEL_10:
      goto LABEL_11;
    }
  }
  if ((*(_BYTE *)(v5 + 60) || *(_BYTE *)(v5 + 61)) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = *(_QWORD *)(a1 + 72);
    v4[2](v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictationConnection:didRecognizePackage:nluResult:", v11, v12, *(_QWORD *)(a1 + 96));

  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = *(_QWORD *)(a1 + 72);
      v4[2](v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dictationConnection:didRecognizePackage:", v13, v7);
      goto LABEL_10;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  }
LABEL_11:

}

AFSpeechPackage *__166__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechPhrases_rawPhrases_utterances_rawUtterances_nluResult_languageModel_correctionIdentifier_audioAnalytics___block_invoke_2(uint64_t a1)
{
  AFSpeechRecognition *v2;
  AFSpeechRecognition *v3;
  AFSpeechPackage *v4;
  AFSpeechPackage *v5;

  v2 = -[AFSpeechRecognition initWithPhrases:utterances:]([AFSpeechRecognition alloc], "initWithPhrases:utterances:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(a1 + 48), "count") || !objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v4 = [AFSpeechPackage alloc];
LABEL_6:
    v3 = (AFSpeechRecognition *)-[AFSpeechRecognition copy](v2, "copy");
    goto LABEL_7;
  }
  v3 = -[AFSpeechRecognition initWithPhrases:utterances:]([AFSpeechRecognition alloc], "initWithPhrases:utterances:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = [AFSpeechPackage alloc];
  if (!v3)
    goto LABEL_6;
LABEL_7:
  v5 = -[AFSpeechPackage initWithRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:](v4, "initWithRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:", v2, v3, *(_QWORD *)(a1 + 64), 1, 0.0);

  return v5;
}

void __95__AFDictationConnection__tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage_nluResult___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:didRecognizeVoiceCommandCandidatePackage:nluResult:", a1[4], a1[5], a1[6]);

}

void __84__AFDictationConnection__tellSpeechDelegateDidRecognizeFinalResultCandidatePackage___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:didRecognizeFinalResultCandidatePackage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __64__AFDictationConnection__tellSpeechDelegateDidRecognizePackage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 59) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = 0;
    objc_msgSend(*(id *)(a1 + 40), "recognition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phrases");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DeltaPhrases(v5, *(void **)(*(_QWORD *)(a1 + 32) + 152), &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:replacingPreviousPhrasesCount:", *(_QWORD *)(a1 + 32), v6, &stru_1E3A37708, 0, v15);
    objc_msgSend(*(id *)(a1 + 40), "recognition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phrases");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 152);
    *(_QWORD *)(v10 + 152) = v9;

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dictationConnection:didRecognizePackage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "recognition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "phrases");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:", v12, v14, &stru_1E3A37708, 0);

  }
}

void __61__AFDictationConnection__tellSpeechDelegateRecordingDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnection:speechRecordingDidFail:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __62__AFDictationConnection__tellSpeechDelegateRecordingDidCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnectionSpeechRecordingDidCancel:", *(_QWORD *)(a1 + 32));

}

void __59__AFDictationConnection__tellSpeechDelegateRecordingDidEnd__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnectionSpeechRecordingDidEnd:", *(_QWORD *)(a1 + 32));

}

void __73__AFDictationConnection__tellSpeechDelegateRecordingDidBeginWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dictationConnection:speechRecordingDidBeginWithOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "dictationConnectionSpeechRecordingDidBegin:", *(_QWORD *)(a1 + 32));
  }

}

void __62__AFDictationConnection__tellSpeechDelegateRecordingWillBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dictationConnectionSpeechRecordingWillBegin:", *(_QWORD *)(a1 + 32));

}

void __53__AFDictationConnection__dispatchCallbackGroupBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

+ (void)getForcedOfflineDictationSupportedLanguagesWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.assistant.dictation"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE432258);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__AFDictationConnection_getForcedOfflineDictationSupportedLanguagesWithCompletion___block_invoke;
  v15[3] = &unk_1E3A32F48;
  v7 = v4;
  v16 = v7;
  v8 = v3;
  v17 = v8;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __83__AFDictationConnection_getForcedOfflineDictationSupportedLanguagesWithCompletion___block_invoke_229;
  v12[3] = &unk_1E3A36460;
  v13 = v7;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "getInstalledOfflineLanguagesWithCompletion:", v12);

}

+ (BOOL)languageDetectorIsEnabled
{
  void *v2;
  char v3;

  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isLanguageDetectorEnabled"))
    v3 = objc_msgSend(v2, "isLanguageDetectorEnabledByServer");
  else
    v3 = 0;

  return v3;
}

+ (BOOL)dictationIsEnabled
{
  void *v2;
  int v3;
  void *v4;

  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "dictationIsEnabled") & 1) != 0)
  {
    v3 = AFDictationRestricted() ^ 1;
  }
  else
  {
    +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "assistantIsEnabled"))
      v3 = AFDictationRestricted() ^ 1;
    else
      LOBYTE(v3) = 0;

  }
  return v3;
}

+ (void)fetchSupportedLanguageCodes:(id)a3
{
  id v3;
  void *v4;
  void (*v5)(void);
  id v6;
  id v7;

  v3 = a3;
  if (AFDictationCapable_onceToken != -1)
  {
    v7 = v3;
    dispatch_once(&AFDictationCapable_onceToken, &__block_literal_global_45_40095);
    v3 = v7;
  }
  if (AFDictationCapable_isCapable)
  {
    if (v3)
    {
      v6 = v3;
      AFPreferencesSupportedDictationLanguages();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void (*)(void))*((_QWORD *)v6 + 2);
LABEL_8:
      v5();

      v3 = v6;
    }
  }
  else if (v3)
  {
    v6 = v3;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 400, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void (*)(void))*((_QWORD *)v6 + 2);
    goto LABEL_8;
  }

}

void __83__AFDictationConnection_getForcedOfflineDictationSupportedLanguagesWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "+[AFDictationConnection getForcedOfflineDictationSupportedLanguagesWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Offline language fetch failed: %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __83__AFDictationConnection_getForcedOfflineDictationSupportedLanguagesWithCompletion___block_invoke_229(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)preheatTestWithLanguage:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  AFDictationConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFDictationConnection(Private) preheatTestWithLanguage:options:]";
    v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AFDictationConnection_Private__preheatTestWithLanguage_options___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(internalQueue, block);

}

- (void)startDictationWithSpeechFileAtURL:(id)a3 options:(id)a4 forLanguage:(id)a5
{
  -[AFDictationConnection startDictationWithSpeechFileAtURL:isNarrowBand:options:forLanguage:](self, "startDictationWithSpeechFileAtURL:isNarrowBand:options:forLanguage:", a3, 0, a4, a5);
}

- (void)startDictationWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4 options:(id)a5 forLanguage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__AFDictationConnection_Private__startDictationWithSpeechFileAtURL_isNarrowBand_options_forLanguage___block_invoke;
  v16[3] = &unk_1E3A30008;
  v20 = a4;
  v16[4] = self;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  v13 = v12;
  v14 = v10;
  v15 = v11;
  -[AFDictationConnection _dispatchAsync:](self, "_dispatchAsync:", v16);

}

- (void)sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__AFDictationConnection_Private__sendEngagementFeedback_voiceQueryIdentifier___block_invoke;
  v8[3] = &unk_1E3A353E8;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[AFDictationConnection _dispatchAsync:](self, "_dispatchAsync:", v8);

}

void __78__AFDictationConnection_Private__sendEngagementFeedback_voiceQueryIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sendEngagementFeedback:voiceQueryIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __101__AFDictationConnection_Private__startDictationWithSpeechFileAtURL_isNarrowBand_options_forLanguage___block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = *(_BYTE *)(a1 + 64);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = objc_msgSend(*(id *)(a1 + 40), "forceOfflineRecognition");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 59) = objc_msgSend(*(id *)(a1 + 40), "incremental");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 60) = objc_msgSend(*(id *)(a1 + 40), "shouldClassifyIntent");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 61) = objc_msgSend(*(id *)(a1 + 40), "shouldRecognizeCommands");
  objc_msgSend(*(id *)(a1 + 32), "_checkAndSetIsCapturingSpeech:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_startDictationWithURL:isNarrowBand:language:options:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __66__AFDictationConnection_Private__preheatTestWithLanguage_options___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:context:", 2225, 0);

  objc_msgSend(*(id *)(a1 + 32), "_dictationService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preheatTestWithLanguage:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
