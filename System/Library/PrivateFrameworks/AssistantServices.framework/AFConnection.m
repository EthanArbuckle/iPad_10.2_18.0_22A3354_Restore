@implementation AFConnection

- (AFConnection)initWithTargetQueue:(id)a3 instanceContext:(id)a4
{
  AFCallSiteInfo *v4;
  AFCallSiteInfo *v5;
  id v8;
  id v9;
  AFConnection *v10;
  AFConnection *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  AFCallSiteInfo *initiationCallSiteInfo;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *targetQueue;
  OS_dispatch_queue *v21;
  id v22;
  AFInstanceContext *v23;
  AFInstanceContext *instanceContext;
  AFAnalytics *v25;
  AFAnalytics *analytics;
  uint64_t v27;
  AFPreferences *preferences;
  NSObject *v29;
  AFInstanceContext *v30;
  AFCallSiteInfo *v31;
  _QWORD v33[4];
  id v34;
  id v35;
  objc_super v36;
  Dl_info v37;
  __int16 v38;
  AFCallSiteInfo *v39;
  uint64_t v40;

  v5 = v4;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)AFConnection;
  v10 = -[AFConnection init](&v36, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_clientID = v10;
    if (v4)
    {
      memset(&v37, 0, sizeof(v37));
      if (dladdr(v4, &v37))
      {
        if (v37.dli_fname && *v37.dli_fname)
        {
          v12 = objc_alloc(MEMORY[0x1E0CB3940]);
          v13 = (void *)objc_msgSend(v12, "initWithUTF8String:", v37.dli_fname);
        }
        else
        {
          v13 = 0;
        }
        if (v37.dli_sname && *v37.dli_sname)
        {
          v14 = objc_alloc(MEMORY[0x1E0CB3940]);
          v15 = (void *)objc_msgSend(v14, "initWithUTF8String:", v37.dli_sname);
        }
        else
        {
          v15 = 0;
        }
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __52__AFConnection_initWithTargetQueue_instanceContext___block_invoke;
        v33[3] = &unk_1E3A33CF8;
        v34 = v13;
        v35 = v15;
        v16 = v15;
        v17 = v13;
        v5 = +[AFCallSiteInfo newWithBuilder:](AFCallSiteInfo, "newWithBuilder:", v33);

      }
      else
      {
        v5 = 0;
      }
    }
    initiationCallSiteInfo = v11->_initiationCallSiteInfo;
    v11->_initiationCallSiteInfo = v5;

    if (v8)
    {
      v19 = (OS_dispatch_queue *)v8;
      targetQueue = v11->_targetQueue;
      v11->_targetQueue = v19;
    }
    else
    {
      v21 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v22 = MEMORY[0x1E0C80D38];
      targetQueue = v11->_targetQueue;
      v11->_targetQueue = v21;
    }

    *((_BYTE *)v11 + 216) |= 2u;
    if (v9)
    {
      v23 = (AFInstanceContext *)v9;
    }
    else
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v23 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = v23;

    v25 = -[AFAnalytics initWithInstanceContext:]([AFAnalytics alloc], "initWithInstanceContext:", v9);
    analytics = v11->_analytics;
    v11->_analytics = v25;

    atomic_store(0, &v11->_activePlaybackCount);
    v11->_uufrID = 0;
    +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
    v27 = objc_claimAutoreleasedReturnValue();
    preferences = v11->_preferences;
    v11->_preferences = (AFPreferences *)v27;

    v29 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v30 = v11->_instanceContext;
      v31 = v11->_initiationCallSiteInfo;
      LODWORD(v37.dli_fname) = 136315906;
      *(const char **)((char *)&v37.dli_fname + 4) = "-[AFConnection initWithTargetQueue:instanceContext:]";
      WORD2(v37.dli_fbase) = 2048;
      *(void **)((char *)&v37.dli_fbase + 6) = v11;
      HIWORD(v37.dli_sname) = 2112;
      v37.dli_saddr = v30;
      v38 = 2112;
      v39 = v31;
      _os_log_impl(&dword_19AF50000, v29, OS_LOG_TYPE_INFO, "%s %p (instanceContext = %@, caller = %@)", (uint8_t *)&v37, 0x2Au);
    }
  }

  return v11;
}

- (AFConnection)initWithTargetQueue:(id)a3
{
  return -[AFConnection initWithTargetQueue:instanceContext:](self, "initWithTargetQueue:instanceContext:", a3, 0);
}

- (AFConnection)init
{
  return -[AFConnection initWithTargetQueue:](self, "initWithTargetQueue:", 0);
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[AFError errorWithCode:](AFError, "errorWithCode:", 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConnection _connectionFailedWithError:](self, "_connectionFailedWithError:", v3);
  -[AFConnection _clearConnection](self, "_clearConnection");
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFConnection dealloc]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)AFConnection;
  -[AFConnection dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = objc_storeWeak((id *)&self->_delegate, a3);
  v5 = a3;
  if (!a3)
  {
    -[AFConnection _clearConnection](self, "_clearConnection");
    v5 = 0;
  }

}

- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3
{
  char v4;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = *((_BYTE *)self + 216);
    if ((v4 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFConnection.m"), 377, CFSTR("Client is already capturing speech"));

      v4 = *((_BYTE *)self + 216);
    }
    *((_BYTE *)self + 216) = v4 | 4;
    -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginListeningForClient:", self->_clientID);
  }
  else
  {
    -[AFConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
    *((_BYTE *)self + 216) &= ~4u;
    -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endListeningForClient:", self->_clientID);
  }

}

- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 analyticsEventProvider:(id)a7
{
  -[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroundRequest:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroundRequest:analyticsEventProvider:", a3, a4, a5, a6, 0, a7);
}

- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 isBackgroundRequest:(BOOL)a7 analyticsEventProvider:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v12;
  NSString *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSString *outstandingRequestClass;
  int v22;
  const char *v23;
  __int16 v24;
  AFConnection *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v9 = a7;
  v12 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v15 = (NSString *)a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136316418;
    v23 = "-[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackground"
          "Request:analyticsEventProvider:]";
    v24 = 2048;
    v25 = self;
    v26 = 2112;
    v27 = v15;
    v28 = 1024;
    v29 = v12;
    v30 = 2112;
    v31 = v16;
    v32 = 1024;
    v33 = v9;
    _os_log_impl(&dword_19AF50000, v19, OS_LOG_TYPE_DEFAULT, "%s %p (requestClass = %@, isSpeechRequest = %d (%@), isBackgroundRequest = %d)", (uint8_t *)&v22, 0x36u);
  }
  if (!v9)
  {
    -[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:", v12, v16, v17, v18);
    -[AFConnection _tellDelegateRequestWillStart](self, "_tellDelegateRequestWillStart");
    if (!v12)
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFConnection _scheduleRequestTimeoutForReason:durationInSeconds:](self, "_scheduleRequestTimeoutForReason:durationInSeconds:", v20, 0.0);
      -[AFConnection _beginInterstitialsForReason:](self, "_beginInterstitialsForReason:", v20);

    }
  }
  *((_BYTE *)self + 216) |= 8u;
  outstandingRequestClass = self->_outstandingRequestClass;
  self->_outstandingRequestClass = v15;

}

- (void)_requestDidEnd
{
  NSObject *v4;
  NSString *outstandingRequestClass;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  AFConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFConnection _requestDidEnd]";
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v7, 0x16u);
  }
  *((_BYTE *)self + 216) &= ~8u;
  outstandingRequestClass = self->_outstandingRequestClass;
  self->_outstandingRequestClass = 0;

  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v6);
  -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v6);

}

- (void)_startUIRequestWithText:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:startUIRequestWithText:completion:", self, v10, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)_startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:startUIRequestWithInfo:completion:", self, v10, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)_handleCommand:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  NSObject *v8;
  NSObject *v9;
  Class *v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[AFConnection _handleCommand:reply:]";
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEFAULT, "%s command = %@", (uint8_t *)&v14, 0x16u);
  }
  if (AFInterstitialIsCommandInterstitial(v6))
  {
    if (self->_activeRequestType && !self->_activeRequestUsefulUserResultType)
    {
      -[AFConnection _enqueueInterstitialCommand:](self, "_enqueueInterstitialCommand:", v6);
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v14 = 136315394;
        v15 = "-[AFConnection _handleCommand:reply:]";
        v16 = 2112;
        v17 = v6;
        _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s Enqueued command %@ because it is an interstitial and active request has not presented UUFR yet.", (uint8_t *)&v14, 0x16u);
      }
      v10 = (Class *)0x1E0D87FF8;
    }
    else
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v14 = 136315394;
        v15 = "-[AFConnection _handleCommand:reply:]";
        v16 = 2112;
        v17 = v6;
        _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s Ignored command %@ because it is an interstitial but there's no active request or active request has presented UUFR already.", (uint8_t *)&v14, 0x16u);
      }
      v10 = (Class *)0x1E0D87FF0;
    }
    v12 = objc_alloc_init(*v10);
    objc_msgSend(v6, "aceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRefId:", v13);

    if (v7)
      v7[2](v7, v12, 0);

  }
  else
  {
    -[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:](self, "_dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:", v6, 0, 0, v7, 0.0);
  }

}

- (void)_dispatchCommand:(id)a3 isInterstitial:(BOOL)a4 interstitialPhase:(int64_t)a5 interstitialDelay:(double)a6 reply:(id)a7
{
  _BOOL4 v10;
  id v13;
  id v14;
  id WeakRetained;
  char v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  unint64_t activeRequestSpeechEvent;
  uint64_t v24;
  NSObject *targetQueue;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  SEL v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  AFConnection *v39;
  id v40;
  id v41;
  int64_t v42;
  SEL v43;
  double v44;
  BOOL v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v10 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = objc_opt_respondsToSelector();
  v17 = AFSiriLogContextConnection;
  if ((v16 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v47 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]";
      v48 = 2112;
      v49 = v13;
      v50 = 1024;
      LODWORD(v51) = v10;
      _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_DEFAULT, "%s command = %@, isInterstitial = %d", buf, 0x1Cu);
    }
    v18 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke;
    v37[3] = &unk_1E3A2C768;
    v19 = v13;
    v38 = v19;
    v39 = self;
    v45 = v10;
    v42 = a5;
    v43 = a2;
    v44 = a6;
    v40 = WeakRetained;
    v20 = v14;
    v41 = v20;
    v21 = MEMORY[0x1A1AC0C3C](v37);
    v22 = (void *)v21;
    activeRequestSpeechEvent = self->_activeRequestSpeechEvent;
    if (activeRequestSpeechEvent <= 0x1F && ((0x80018900 >> activeRequestSpeechEvent) & 1) != 0)
    {
      v24 = v18;
      targetQueue = self->_targetQueue;
      v31[0] = v24;
      v31[1] = 3221225472;
      v31[2] = __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_102;
      v31[3] = &unk_1E3A2C790;
      v36 = v10;
      v31[4] = self;
      v32 = v19;
      v33 = v20;
      v34 = v22;
      v35 = a2;
      dispatch_async(targetQueue, v31);

    }
    else
    {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
      if (!v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSStringFromSelector(a2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v28);

        }
      }
    }

    v27 = v38;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v29 = v17;
    objc_msgSend(v13, "encodedClassName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v47 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]";
    v48 = 2112;
    v49 = WeakRetained;
    v50 = 2112;
    v51 = v30;
    _os_log_error_impl(&dword_19AF50000, v29, OS_LOG_TYPE_ERROR, "%s no delegate method on %@ to handle command: %@", buf, 0x20u);

  }
  +[AFError errorWithCode:](AFError, "errorWithCode:", 26);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v26);

  if (!v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v27);
LABEL_16:

    }
  }

}

- (void)_setShouldSpeak:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  char v6;
  NSObject *targetQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[AFConnection _setShouldSpeak:]";
    v11 = 1024;
    v12 = v3;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s shouldSpeak = %d", buf, 0x12u);
  }
  if (-[AFConnection shouldSpeak](self, "shouldSpeak") != v3)
  {
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 216) = *((_BYTE *)self + 216) & 0xFD | v6;
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__AFConnection__setShouldSpeak___block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(targetQueue, block);
  }
}

- (void)_aceConnectionWillRetryOnError:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryError, a3);
}

- (BOOL)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  AFAudioPowerXPCProvider *v7;
  AFAudioPowerUpdater *v8;
  AFAudioPowerUpdater *inputAudioPowerUpdater;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AFConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
  if (v4
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate),
        v6 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v6 & 1) != 0))
  {
    v7 = -[AFAudioPowerXPCProvider initWithXPCWrapper:]([AFAudioPowerXPCProvider alloc], "initWithXPCWrapper:", v4);
    v8 = -[AFAudioPowerUpdater initWithProvider:queue:frequency:delegate:]([AFAudioPowerUpdater alloc], "initWithProvider:queue:frequency:delegate:", v7, self->_targetQueue, 1, self);
    inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = v8;

    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[AFConnection _startInputAudioPowerUpdatesWithXPCWrapper:]";
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s Prepared for input audio power updates. Waiting for _speechCallbackGroup...", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__AFConnection__startInputAudioPowerUpdatesWithXPCWrapper___block_invoke;
    v13[3] = &unk_1E3A2C7B8;
    objc_copyWeak(&v14, (id *)buf);
    -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_stopInputAudioPowerUpdates
{
  AFAudioPowerUpdater *inputAudioPowerUpdater;
  AFAudioPowerUpdater *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
      v6 = 136315138;
      v7 = "-[AFConnection _stopInputAudioPowerUpdates]";
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Stopped input audio power updates.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  NSObject *v5;
  NSObject *targetQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[AFConnection _setAudioSessionID:]";
    v10 = 2048;
    v11 = a3;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s audioSessionID = %lu", buf, 0x16u);
  }
  if (self->_audioSessionID != a3)
  {
    self->_audioSessionID = a3;
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__AFConnection__setAudioSessionID___block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(targetQueue, block);
  }
}

- (void)_setRecordRoute:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *recordRoute;
  NSString *v7;
  NSString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[AFConnection _setRecordRoute:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s recordRoute = %@", (uint8_t *)&v9, 0x16u);
  }
  recordRoute = self->_recordRoute;
  if (recordRoute != v4 && !-[NSString isEqualToString:](recordRoute, "isEqualToString:", v4))
  {
    v7 = (NSString *)-[NSString copy](v4, "copy");
    v8 = self->_recordRoute;
    self->_recordRoute = v7;

  }
}

- (void)_markIsDucking
{
  int64_t activeRequestType;
  NSObject *v4;
  NSUUID *activeRequestUUID;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  __int16 v10;
  NSUUID *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    self->_activeRequestIsDucking = 1;
  }
  else
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      activeRequestUUID = self->_activeRequestUUID;
      v6 = 136315650;
      v7 = "-[AFConnection _markIsDucking]";
      v8 = 2048;
      v9 = activeRequestType;
      v10 = 2112;
      v11 = activeRequestUUID;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Unable to mark isDucking because the active request is not a speech request. (_activeRequestType = %zd, _activeRequestUUID = %@)", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)_markIsTwoShot
{
  int64_t activeRequestType;
  NSObject *v4;
  NSUUID *activeRequestUUID;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  __int16 v10;
  NSUUID *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    self->_activeRequestIsTwoShot = 1;
  }
  else
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      activeRequestUUID = self->_activeRequestUUID;
      v6 = 136315650;
      v7 = "-[AFConnection _markIsTwoShot]";
      v8 = 2048;
      v9 = activeRequestType;
      v10 = 2112;
      v11 = activeRequestUUID;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Unable to mark isTwoShot because the active request is not a speech request. (_activeRequestType = %zd, _activeRequestUUID = %@)", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)_markSpeechRecognized
{
  int64_t activeRequestType;
  NSObject *v4;
  NSUUID *activeRequestUUID;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  __int16 v10;
  NSUUID *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    self->_activeRequestHasSpeechRecognition = 1;
  }
  else
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      activeRequestUUID = self->_activeRequestUUID;
      v6 = 136315650;
      v7 = "-[AFConnection _markSpeechRecognized]";
      v8 = 2048;
      v9 = activeRequestType;
      v10 = 2112;
      v11 = activeRequestUUID;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Unable to mark speech recognized because the active request is not a speech request. (_activeRequestType = %ld, _activeRequestUUID = %@)", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)_markNetworkDidBecomeActive
{
  void *v3;
  BOOL v4;

  self->_connectionHadActiveNetwork = 1;
  if (!AFDeviceSupportsSiriUOD()
    || (+[AFConnection currentLanguageCode](AFConnection, "currentLanguageCode"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = +[AFFeatureFlags isSiriUODAvailableForLanguage:](AFFeatureFlags, "isSiriUODAvailableForLanguage:", v3), v3, !v4))
  {
    -[AFConnection _extendExpiringRequestTimeout](self, "_extendExpiringRequestTimeout");
  }
}

- (void)_updateSpeechEndHostTime:(unint64_t)a3
{
  int64_t activeRequestType;
  NSObject *v5;
  unint64_t activeRequestNumberOfPresentedInterstitials;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSUUID *activeRequestUUID;
  _QWORD v17[6];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  NSUUID *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  activeRequestType = self->_activeRequestType;
  v5 = AFSiriLogContextConnection;
  if (activeRequestType != 1)
  {
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      return;
    activeRequestUUID = self->_activeRequestUUID;
    *(_DWORD *)buf = 136315650;
    v19 = "-[AFConnection _updateSpeechEndHostTime:]";
    v20 = 2048;
    v21 = activeRequestType;
    v22 = 2112;
    v23 = activeRequestUUID;
    v12 = "%s Unable to update speech end host time. (_activeRequestType = %zd, _activeRequestUUID = %@)";
    v13 = v5;
    v14 = 32;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[AFConnection _updateSpeechEndHostTime:]";
    v20 = 2048;
    v21 = a3;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s updating speech end host time: %llu", buf, 0x16u);
  }
  if (self->_activeRequestSpeechEndHostTime != a3)
  {
    self->_activeRequestSpeechEndHostTime = a3;
    if (+[AFFeatureFlags isStateFeedbackEnabled](AFFeatureFlags, "isStateFeedbackEnabled"))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __41__AFConnection__updateSpeechEndHostTime___block_invoke;
      v17[3] = &unk_1E3A2C7E0;
      v17[4] = self;
      v17[5] = a3;
      -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v17);
      return;
    }
    activeRequestNumberOfPresentedInterstitials = self->_activeRequestNumberOfPresentedInterstitials;
    if (activeRequestNumberOfPresentedInterstitials == 1)
    {
      v11 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136315138;
      v19 = "-[AFConnection _updateSpeechEndHostTime:]";
      v12 = "%s Skipped timing adjustment because 1 interstitial has been presented.";
      v13 = v11;
      v14 = 12;
    }
    else
    {
      if (!activeRequestNumberOfPresentedInterstitials)
      {
        v9 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v19 = "-[AFConnection _updateSpeechEndHostTime:]";
          v20 = 2048;
          v21 = a3;
          _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s No interstitial has been presented yet, adjusting timings based on updated speech end host time %llu.", buf, 0x16u);
        }
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v10);
        -[AFConnection _beginInterstitialsForReason:](self, "_beginInterstitialsForReason:", v10);

        return;
      }
      v15 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136315394;
      v19 = "-[AFConnection _updateSpeechEndHostTime:]";
      v20 = 2048;
      v21 = activeRequestNumberOfPresentedInterstitials;
      v12 = "%s Skipped timing adjustment because %lu interstitials have been presented.";
      v13 = v15;
      v14 = 22;
    }
LABEL_19:
    _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
  }
}

- (id)_siriClientStateManager
{
  AFSiriClientStateManager *siriClientStateManager;
  AFSiriClientStateManager *v4;
  AFSiriClientStateManager *v5;

  siriClientStateManager = self->_siriClientStateManager;
  if (!siriClientStateManager)
  {
    +[AFSiriClientStateManager sharedManager](AFSiriClientStateManager, "sharedManager");
    v4 = (AFSiriClientStateManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_siriClientStateManager;
    self->_siriClientStateManager = v4;

    siriClientStateManager = self->_siriClientStateManager;
  }
  return siriClientStateManager;
}

- (int64_t)_getActiveSpeechEvent
{
  return self->_activeRequestSpeechEvent;
}

- (void)_tellDelegateRequestWillStart
{
  AFAssistantUIService **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "assistantConnectionRequestWillStart:", self);

  }
}

- (void)_completeRequestWithUUID:(id)a3 forReason:(int64_t)a4 error:(id)a5
{
  NSUUID *v8;
  id v9;
  NSObject *v10;
  NSUUID *activeTurnIdentifier;
  int64_t activeRequestType;
  int v13;
  id *p_activeRequestUUID;
  id WeakRetained;
  char v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSUUID *activeRequestUUID;
  NSUUID *v21;
  id v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  NSUUID *v26;
  NSUUID *v27;
  int v28;
  const char *v29;
  __int16 v30;
  NSUUID *v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = (NSUUID *)a3;
  v9 = a5;
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    activeTurnIdentifier = self->_activeTurnIdentifier;
    v28 = 136316162;
    v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = (int64_t)activeTurnIdentifier;
    v34 = 2048;
    v35 = a4;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s requestUUID = %@, turnId = %@, reason %ld, error = %@", (uint8_t *)&v28, 0x34u);
  }
  activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    v13 = -[NSUUID isEqual:](self->_activeRequestUUID, "isEqual:", v8);
    if (self->_activeRequestType)
      goto LABEL_5;
LABEL_10:
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v28 = 136315138;
      v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
      _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, "%s Dropping delegate callback because request is complete", (uint8_t *)&v28, 0xCu);
    }
    p_activeRequestUUID = (id *)&self->_activeRequestUUID;
    if ((-[NSUUID isEqual:](self->_activeRequestUUID, "isEqual:", v8) & 1) != 0)
      goto LABEL_18;
LABEL_13:
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      v21 = self->_activeTurnIdentifier;
      v28 = 136315906;
      v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
      v30 = 2112;
      v31 = activeRequestUUID;
      v32 = 2112;
      v33 = (int64_t)v8;
      v34 = 2112;
      v35 = (int64_t)v21;
      _os_log_impl(&dword_19AF50000, v19, OS_LOG_TYPE_INFO, "%s Dropping delegate callback because request is different (_activeRequestUUID = %@, requestUUID = %@, turnId = %@)", (uint8_t *)&v28, 0x2Au);
    }
    goto LABEL_18;
  }
  v13 = 0;
  if (!activeRequestType)
    goto LABEL_10;
LABEL_5:
  p_activeRequestUUID = (id *)&self->_activeRequestUUID;
  if ((-[NSUUID isEqual:](self->_activeRequestUUID, "isEqual:", v8) & 1) == 0)
    goto LABEL_13;
  if (v9)
  {
    -[AFConnection _willFailRequestWithError:](self, "_willFailRequestWithError:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "assistantConnection:requestFailedWithError:requestClass:", self, v9, self->_outstandingRequestClass);
LABEL_17:

    }
  }
  else
  {
    -[AFConnection _willCompleteRequest](self, "_willCompleteRequest");
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "assistantConnectionRequestFinished:", self);
      goto LABEL_17;
    }
  }
LABEL_18:
  if (*p_activeRequestUUID && !objc_msgSend(*p_activeRequestUUID, "isEqual:", v8))
  {
    v25 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v26 = self->_activeRequestUUID;
      v27 = self->_activeTurnIdentifier;
      v28 = 136315906;
      v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
      v30 = 2112;
      v31 = v26;
      v32 = 2112;
      v33 = (int64_t)v8;
      v34 = 2112;
      v35 = (int64_t)v27;
      _os_log_impl(&dword_19AF50000, v25, OS_LOG_TYPE_INFO, "%s Not ending the ongoing request because the active request ID is different than the completed request ID: (_activeRequestUUID = %@, requestUUID = %@, turnId = %@)", (uint8_t *)&v28, 0x2Au);
    }
  }
  else
  {
    -[AFConnection _requestDidEnd](self, "_requestDidEnd");
  }
  if (v13)
  {
    v24 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v28 = 136315650;
      v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
      v30 = 2112;
      v31 = v8;
      v32 = 2048;
      v33 = a4;
      _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s Resetting isCapturingSpeech for %@ for reason: %ld", (uint8_t *)&v28, 0x20u);
    }
    -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  }

}

- (void)_tellDelegateShouldSpeakChanged:(BOOL)a3
{
  _BOOL8 v3;
  AFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:shouldSpeak:", self, v3);

  }
}

- (void)_tellDelegateAudioSessionIDChanged:(unsigned int)a3
{
  uint64_t v3;
  AFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:didChangeAudioSessionID:", self, v3);

  }
}

- (void)_tellDelegateWillStartAcousticIDRequest
{
  id WeakRetained;
  char v4;
  id v5;

  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1916, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "assistantConnectionWillStartAcousticIDRequest:", self);

  }
}

- (void)_tellDelegateDidDetectMusic
{
  AFAssistantUIService **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "assistantConnectionDidDetectMusic:", self);

  }
}

- (void)_tellDelegateDidFinishAcousticIDRequestWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  AFAnalytics *analytics;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  analytics = self->_analytics;
  v10 = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 1917, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:didFinishAcousticIDRequestWithSuccess:", self, v3);

  }
}

- (void)_tellDelegateSetUserActivityInfo:(id)a3 webpageURL:(id)a4
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
    objc_msgSend(v9, "assistantConnection:setUserActivtiyInfoAndMakeCurrent:webpageURL:", self, v10, v6);

  }
}

- (void)_tellDelegateInvalidateCurrentUserActivity
{
  AFAssistantUIService **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "assistantConnectionInvalidateCurrentUserActivity:", self);

  }
}

- (void)_tellDelegateCacheImage:(id)a3
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
    objc_msgSend(v6, "assistantConnection:wantsToCacheImage:", self, v7);

  }
}

- (void)_tellDelegateExtensionRequestWillStartForApplication:(id)a3
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
    objc_msgSend(v6, "assistantConnection:extensionRequestWillStartForApplication:", self, v7);

  }
}

- (void)_tellDelegateExtensionRequestFinishedForApplication:(id)a3 error:(id)a4
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
    objc_msgSend(v9, "assistantConnection:extensionRequestFinishedForApplication:error:", self, v10, v6);

  }
}

- (void)_tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  char v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "assistantConnectionAudioSessionDidBeginInterruption:userInfo:", self, v9);
LABEL_5:

    goto LABEL_6;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "assistantConnectionAudioSessionDidBeginInterruption:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_tellDelegateAudioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  id v8;
  id v9;
  char v10;
  id v11;

  v4 = a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "assistantConnectionAudioSessionDidEndInterruption:shouldResume:userInfo:", self, v4, v11);
LABEL_5:

    goto LABEL_6;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnectionAudioSessionDidEndInterruption:shouldResume:", self, v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_tellDelegateAudioPlaybackRequestWillStart:(id)a3
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
    objc_msgSend(v6, "assistantConnection:willStartAudioPlaybackRequest:", self, v7);

  }
}

- (void)_tellDelegateAudioPlaybackRequestDidStart:(id)a3
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
    objc_msgSend(v6, "assistantConnection:didStartAudioPlaybackRequest:", self, v7);

  }
}

- (void)_tellDelegateAudioPlaybackRequestDidStop:(id)a3 error:(id)a4
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
    objc_msgSend(v9, "assistantConnection:didStopAudioPlaybackRequest:error:", self, v10, v6);

  }
}

- (void)_tellDelegateWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, uint64_t);
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;

  v15 = a4;
  v8 = (void (**)(id, uint64_t, uint64_t))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "assistantConnection:willProcessStartPlayback:intent:completion:", self, a3, v15, v8);

  }
  else
  {
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "assistantConnection:willProcessStartPlayback:", self, a3);

    }
    if (v8)
      v8[2](v8, 1, 1);
  }

}

- (void)_tellDelegateStartPlaybackDidFail:(int64_t)a3
{
  AFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:startPlaybackDidFail:", self, a3);

  }
}

- (void)_tellDelegateAudioSessionWillBecomeActive:(BOOL)a3
{
  _BOOL8 v3;
  AFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:audioSessionWillBecomeActive:", self, v3);

  }
}

- (void)_tellDelegateAudioSessionDidBecomeActive:(BOOL)a3
{
  _BOOL8 v3;
  AFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:audioSessionDidBecomeActive:", self, v3);

  }
}

- (void)_tellDelegateWillProcessAppLaunchWithBundleIdentifier:(id)a3
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
    objc_msgSend(v6, "assistantConnection:willProcessAppLaunchWithBundleIdentifier:", self, v7);

  }
}

- (void)_tellDelegateFailedToLaunchAppWithBundleIdentifier:(id)a3
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
    objc_msgSend(v6, "assistantConnection:appLaunchFailedWithBundleIdentifier:", self, v7);

  }
}

- (void)_dispatchCallbackGroupBlock:(id)a3
{
  id v4;
  NSObject *speechCallbackGroup;
  NSObject *targetQueue;
  id WeakRetained;
  _QWORD block[4];
  id v9;
  id v10;
  id to;

  v4 = a3;
  if (v4)
  {
    if (self->_speechCallbackGroup)
    {
      objc_copyWeak(&to, (id *)&self->_speechDelegate);
      speechCallbackGroup = self->_speechCallbackGroup;
      targetQueue = self->_targetQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__AFConnection__dispatchCallbackGroupBlock___block_invoke;
      block[3] = &unk_1E3A2FBF8;
      v9 = v4;
      objc_copyWeak(&v10, &to);
      dispatch_group_notify(speechCallbackGroup, targetQueue, block);
      objc_destroyWeak(&v10);

      objc_destroyWeak(&to);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
      (*((void (**)(id, id))v4 + 2))(v4, WeakRetained);

    }
  }

}

- (void)_tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__AFConnection__tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke;
  v6[3] = &unk_1E3A2C808;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

- (void)_tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unsigned int v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__AFConnection__tellSpeechDelegateRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke;
  v8[3] = &unk_1E3A2C830;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v8);

}

- (void)_tellSpeechDelegateRecordingDidChangeAVRecordRoute:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__AFConnection__tellSpeechDelegateRecordingDidChangeAVRecordRoute___block_invoke;
  v6[3] = &unk_1E3A2C808;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

- (void)_tellSpeechDelegateRecordingDidDetectStartpoint
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__AFConnection__tellSpeechDelegateRecordingDidDetectStartpoint__block_invoke;
  v2[3] = &unk_1E3A2C858;
  v2[4] = self;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v2);
}

- (void)_tellSpeechDelegateToPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__AFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke;
  v8[3] = &unk_1E3A2C8A8;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v8);

}

- (void)_tellSpeechDelegateRecordingDidEnd
{
  double v3;
  _QWORD v4[5];

  if (self->_activeRequestType == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_activeRequestSpeechRecordingEndTimeInterval = v3;
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__AFConnection__tellSpeechDelegateRecordingDidEnd__block_invoke;
  v4[3] = &unk_1E3A2C858;
  v4[4] = self;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v4);
}

- (void)_tellSpeechDelegateRecordingDidCancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__AFConnection__tellSpeechDelegateRecordingDidCancel__block_invoke;
  v2[3] = &unk_1E3A2C858;
  v2[4] = self;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v2);
}

- (void)_tellSpeechDelegateRecordingDidFail:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AFConnection__tellSpeechDelegateRecordingDidFail___block_invoke;
  v6[3] = &unk_1E3A2C808;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

- (void)_tellSpeechDelegateSpeechRecognized:(id)a3
{
  id v4;
  double v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self->_activeRequestType == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_activeRequestSpeechRecognitionTimeInterval = v5;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__AFConnection__tellSpeechDelegateSpeechRecognized___block_invoke;
  v7[3] = &unk_1E3A2C808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

- (void)_tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__AFConnection__tellSpeechDelegateRecognizedAdditionalSpeechInterpretation_refId___block_invoke;
  v10[3] = &unk_1E3A2C8D0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v10);

}

- (void)_tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__AFConnection__tellSpeechDelegateRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke;
  v14[3] = &unk_1E3A2C8F8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v14);

}

- (void)_tellSpeechDelegateRecognitionUpdateWillBeginForTask:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__AFConnection__tellSpeechDelegateRecognitionUpdateWillBeginForTask___block_invoke;
  v6[3] = &unk_1E3A2C808;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

- (void)_tellSpeechDelegateSpeechRecognizedPartialResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__AFConnection__tellSpeechDelegateSpeechRecognizedPartialResult___block_invoke;
  v6[3] = &unk_1E3A2C808;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__AFConnection__tellSpeechDelegateRecognitionDidFail___block_invoke;
  v6[3] = &unk_1E3A2C808;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  AFSpeechDelegate **p_speechDelegate;
  id WeakRetained;
  char v8;
  id v9;

  if (self->_inputAudioPowerUpdater == a3)
  {
    p_speechDelegate = &self->_speechDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_speechDelegate);
      objc_msgSend(v9, "assistantConnectionDidChangeAudioRecordingPower:", self);

    }
  }
}

- (void)accessibilityObserver:(id)a3 stateDidChangeFrom:(id)a4 to:(id)a5
{
  id v6;
  NSObject *targetQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  targetQueue = self->_targetQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__AFConnection_accessibilityObserver_stateDidChangeFrom_to___block_invoke;
  v9[3] = &unk_1E3A36FC8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(targetQueue, v9);

}

- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4
{
  NSObject *targetQueue;
  _QWORD v5[6];

  targetQueue = self->_targetQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AFConnection_deviceRingerObserver_didChangeState___block_invoke;
  v5[3] = &unk_1E3A353C0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(targetQueue, v5);
}

- (void)interstitialProvider:(id)a3 handlePhase:(int64_t)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *targetQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  double v34;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  targetQueue = self->_targetQueue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __108__AFConnection_interstitialProvider_handlePhase_displayText_speakableText_expectedDelay_context_completion___block_invoke;
  v27[3] = &unk_1E3A2C920;
  v32 = v20;
  v33 = a4;
  v27[4] = self;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v34 = a7;
  v31 = v19;
  v22 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  dispatch_async(targetQueue, v27);

}

- (void)_connectionFailedWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginTransaction");

  v6 = *((_BYTE *)self + 216);
  *((_BYTE *)self + 216) = v6 & 0xFE;
  *((_BYTE *)self + 272) &= ~1u;
  if ((v6 & 4) != 0)
  {
    *((_BYTE *)self + 216) = v6 & 0xFA;
    WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);

    if (WeakRetained)
    {
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315138;
        v12 = "-[AFConnection _connectionFailedWithError:]";
        _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Reporting speech error on connection tear down", (uint8_t *)&v11, 0xCu);
      }
      -[AFConnection _tellSpeechDelegateRecordingDidFail:](self, "_tellSpeechDelegateRecordingDidFail:", v4);
    }
    if (!_AFConnectionIsErrorDeallocation(v4))
    {
      -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endListeningForClient:", self->_clientID);

    }
  }
  -[AFConnection _completeRequestWithUUID:forReason:error:](self, "_completeRequestWithUUID:forReason:error:", self->_activeRequestUUID, 4, v4);
  -[AFConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endTransaction");

}

- (void)_clearConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (id)_connection
{
  NSXPCConnection *connection;
  AFInstanceContext *instanceContext;
  AFInstanceContext *v5;
  AFInstanceContext *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  OS_dispatch_queue *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  OS_dispatch_queue *v12;
  NSXPCConnection *v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  NSXPCConnection *v18;
  void *v19;
  NSXPCConnection *v20;
  void *v21;
  NSXPCConnection *v22;
  AFConnectionClientServiceDelegate *v23;
  _QWORD v25[4];
  OS_dispatch_queue *v26;
  id v27;
  _QWORD v28[4];
  OS_dispatch_queue *v29;
  id v30;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    instanceContext = self->_instanceContext;
    if (instanceContext)
    {
      v5 = instanceContext;
    }
    else
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v5 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    -[AFInstanceContext createXPCConnectionWithMachServiceName:options:](v5, "createXPCConnectionWithMachServiceName:options:", CFSTR("com.apple.assistant.client"), 0);
    v7 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_connection;
    self->_connection = v7;

    objc_initWeak(&location, self);
    v9 = self->_targetQueue;
    v10 = self->_connection;
    v11 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __27__AFConnection__connection__block_invoke;
    v28[3] = &unk_1E3A33A28;
    v12 = v9;
    v29 = v12;
    objc_copyWeak(&v30, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v28);
    v13 = self->_connection;
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __27__AFConnection__connection__block_invoke_209;
    v25[3] = &unk_1E3A33A28;
    v14 = v12;
    v26 = v14;
    objc_copyWeak(&v27, &location);
    -[NSXPCConnection setInterruptionHandler:](v13, "setInterruptionHandler:", v25);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("AFConnection", v16);
    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", v17);
    v18 = self->_connection;
    AFClientServiceXPCInterface();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v18, "setRemoteObjectInterface:", v19);

    v20 = self->_connection;
    AFClientServiceDelegateXPCInterface();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v20, "setExportedInterface:", v21);

    v22 = self->_connection;
    v23 = -[AFConnectionClientServiceDelegate initWithConnection:targetQueue:]([AFConnectionClientServiceDelegate alloc], "initWithConnection:targetQueue:", self, self->_targetQueue);
    -[NSXPCConnection setExportedObject:](v22, "setExportedObject:", v23);

    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }
  return connection;
}

- (void)requestDidAskForTimeoutExtension:(double)a3
{
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315394;
    v9 = "-[AFConnection requestDidAskForTimeoutExtension:]";
    v10 = 2048;
    v11 = a3;
    _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s durationInSeconds: %f", (uint8_t *)&v8, 0x16u);
  }
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConnection _extendRequestTimeoutForReason:durationInSeconds:](self, "_extendRequestTimeoutForReason:durationInSeconds:", v7, a3);

}

- (void)_scheduleRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4
{
  id v6;
  void *v7;
  double v8;
  NSObject *v9;
  const char *v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v6);
  if (!self->_requestTimeoutTimer)
  {
    if (a4 != 0.0)
    {
LABEL_11:
      -[AFConnection _startRequestTimeoutTimerWithTimeInterval:reason:](self, "_startRequestTimeoutTimerWithTimeInterval:reason:", v6, a4, *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
      goto LABEL_12;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.assistant"));
    objc_msgSend(v7, "doubleForKey:", CFSTR("defaultTimeout"));
    if (v8 == 0.0)
    {
      a4 = 12.0;
      if (!AFDeviceSupportsSAE())
        goto LABEL_10;
      v9 = AFSiriLogContextConnection;
      a4 = 20.0;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)&v11[4] = "-[AFConnection _scheduleRequestTimeoutForReason:durationInSeconds:]";
      *(_WORD *)&v11[12] = 2048;
      *(_QWORD *)&v11[14] = 0x4034000000000000;
      v10 = "%s Extending request timeout to %f seconds as IE is enabled";
    }
    else
    {
      a4 = v8;
      v9 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:

        goto LABEL_11;
      }
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)&v11[4] = "-[AFConnection _scheduleRequestTimeoutForReason:durationInSeconds:]";
      *(_WORD *)&v11[12] = 2048;
      *(double *)&v11[14] = a4;
      v10 = "%s Using timeout interval of %f seconds based on UserDefaults";
    }
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, v10, v11, 0x16u);
    goto LABEL_10;
  }
LABEL_12:

}

- (void)_startRequestTimeoutTimerWithTimeInterval:(double)a3 reason:(id)a4
{
  id v7;
  NSObject *v8;
  AFWatchdogTimer *v9;
  OS_dispatch_queue *targetQueue;
  uint64_t v11;
  id *p_requestTimeoutTimer;
  AFWatchdogTimer *requestTimeoutTimer;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18[2];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[AFConnection _startRequestTimeoutTimerWithTimeInterval:reason:]";
    v21 = 2048;
    v22 = a3;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEFAULT, "%s Scheduling request timeout for %f seconds for reason %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v9 = [AFWatchdogTimer alloc];
  targetQueue = self->_targetQueue;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __65__AFConnection__startRequestTimeoutTimerWithTimeInterval_reason___block_invoke;
  v17 = &unk_1E3A33538;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a2;
  v11 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v9, "initWithTimeoutInterval:onQueue:timeoutHandler:", targetQueue, &v14, a3);
  requestTimeoutTimer = self->_requestTimeoutTimer;
  p_requestTimeoutTimer = (id *)&self->_requestTimeoutTimer;
  *p_requestTimeoutTimer = (id)v11;

  objc_msgSend(*p_requestTimeoutTimer, "start", v14, v15, v16, v17);
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);

}

- (void)_invokeRequestTimeoutForReason:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[AFConnection _invokeRequestTimeoutForReason:]";
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEFAULT, "%s Invoking request timeout for reason %{public}@", (uint8_t *)&v11, 0x16u);
  }
  -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v4);
  if (self->_connectionHadActiveNetwork
    || AFDeviceSupportsSiriUOD()
    && (+[AFConnection currentLanguageCode](AFConnection, "currentLanguageCode"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = +[AFFeatureFlags isSiriUODAvailableForLanguage:](AFFeatureFlags, "isSiriUODAvailableForLanguage:", v7), v7, v8))
  {
    v6 = 1;
  }
  else
  {
    v6 = 52;
  }
  +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", v6, 0, self->_lastRetryError);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConnection _clientService](self, "_clientService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelRequestForReason:withError:", 4, v9);

  -[AFConnection _completeRequestWithUUID:forReason:error:](self, "_completeRequestWithUUID:forReason:error:", self->_activeRequestUUID, 3, v9);
}

- (void)_pauseRequestTimeoutForReason:(id)a3
{
  id v4;
  AFWatchdogTimer *requestTimeoutTimer;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[AFConnection _pauseRequestTimeoutForReason:]";
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEFAULT, "%s Pausing request timeout for reason %{public}@", (uint8_t *)&v7, 0x16u);
      requestTimeoutTimer = self->_requestTimeoutTimer;
    }
    -[AFWatchdogTimer stop](requestTimeoutTimer, "stop");
  }

}

- (void)_resumeRequestTimeoutForReason:(id)a3
{
  id v4;
  AFWatchdogTimer *requestTimeoutTimer;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[AFConnection _resumeRequestTimeoutForReason:]";
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEFAULT, "%s Resuming request timeout for reason %{public}@", (uint8_t *)&v7, 0x16u);
      requestTimeoutTimer = self->_requestTimeoutTimer;
    }
    -[AFWatchdogTimer start](requestTimeoutTimer, "start");
  }

}

- (void)_cancelRequestTimeoutForReason:(id)a3
{
  id v4;
  AFWatchdogTimer *requestTimeoutTimer;
  NSObject *v6;
  AFWatchdogTimer *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[AFConnection _cancelRequestTimeoutForReason:]";
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEFAULT, "%s Canceling request timeout for reason %{public}@", (uint8_t *)&v8, 0x16u);
      requestTimeoutTimer = self->_requestTimeoutTimer;
    }
    -[AFWatchdogTimer cancel](requestTimeoutTimer, "cancel");
    v7 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0;

  }
}

- (void)_extendRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[AFConnection _extendRequestTimeoutForReason:durationInSeconds:]";
    v10 = 2114;
    v11 = v6;
    v12 = 2050;
    v13 = a4;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@, durationInSeconds: %{public}f", (uint8_t *)&v8, 0x20u);
  }
  -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v6);
  if (self->_activeRequestType && !self->_activeRequestUsefulUserResultType)
    -[AFConnection _scheduleRequestTimeoutForReason:durationInSeconds:](self, "_scheduleRequestTimeoutForReason:durationInSeconds:", v6, a4);

}

- (void)_extendExistingRequestTimeoutForReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AFConnection _extendExistingRequestTimeoutForReason:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  if (self->_requestTimeoutTimer)
    -[AFConnection _extendRequestTimeoutForReason:durationInSeconds:](self, "_extendRequestTimeoutForReason:durationInSeconds:", v4, 0.0);

}

- (void)_extendExpiringRequestTimeout
{
  double v3;
  double v4;
  BOOL v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[AFWatchdogTimer timeRemaining](self->_requestTimeoutTimer, "timeRemaining");
  v4 = v3;
  if (self->_requestTimeoutTimer)
    v5 = v3 < 4.0;
  else
    v5 = 0;
  if (v5)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[AFConnection _extendExpiringRequestTimeout]";
      v9 = 2048;
      v10 = v4;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEFAULT, "%s Extending timeout with time remaining %.2f", (uint8_t *)&v7, 0x16u);
    }
    -[AFConnection _extendRequestTimeoutForReason:durationInSeconds:](self, "_extendRequestTimeoutForReason:durationInSeconds:", CFSTR("ExtendOnlyIfExpiring"), 4.0);
  }
}

- (void)_updateStateIfNotInSync
{
  if ((*((_BYTE *)self + 216) & 1) == 0)
    -[AFConnection _updateState](self, "_updateState");
}

- (void)_fetchShouldSpeak:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__AFConnection__fetchShouldSpeak___block_invoke;
  v7[3] = &unk_1E3A34420;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestShouldSpeakStateWithReply:", v7);

}

- (void)_updateState
{
  void *v3;
  _QWORD v4[5];

  -[AFConnection _clientService](self, "_clientService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__AFConnection__updateState__block_invoke;
  v4[3] = &unk_1E3A2C948;
  v4[4] = self;
  objc_msgSend(v3, "requestStateUpdateWithReply:", v4);

}

- (void)_updateClientConfiguration
{
  void *v3;
  void *v4;

  if ((*((_BYTE *)self + 272) & 1) == 0)
  {
    -[AFConnection _clientService](self, "_clientService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConnection _clientConfiguration](self, "_clientConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setConfiguration:", v4);

    *((_BYTE *)self + 272) |= 1u;
  }
}

- (BOOL)_shouldEmitUEIRequestLinkForRequestInfo:(id)a3 speechRequestOptions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "activationEvent");
  v7 = objc_msgSend(v5, "activationEvent");

  return v6 == 6 || (unint64_t)(v6 - 9) < 2 || v7 == 17;
}

- (void)_willStartRequestWithSpeech:(BOOL)a3 speechRequestOptions:(id)a4 requestInfo:(id)a5 analyticsEventProvider:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  AFConnection *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  double v31;
  double v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  objc_class *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  AFConnection *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  int64_t v65;
  double v66;
  double v67;
  unint64_t v68;
  NSError *lastRetryError;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSUUID *v77;
  uint64_t (**v78)(id, id);
  _BOOL4 v79;
  id obj;
  void *v81;
  id v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  _QWORD v87[2];
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[2];
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  AFConnection *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  _BOOL4 v98;
  __int16 v99;
  id v100;
  uint64_t v101;

  v79 = a3;
  v101 = *MEMORY[0x1E0C80C00];
  v82 = a4;
  v9 = a5;
  v78 = (uint64_t (**)(id, id))a6;
  v77 = self->_activeRequestUUID;
  v81 = v9;
  objc_msgSend(v9, "startRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v81, "startRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v81, "startRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "aceId");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v21 = (void *)v16;
      v22 = (void *)objc_msgSend(v14, "initWithUUIDString:", v16);

      goto LABEL_9;
    }
  }
  objc_msgSend(v81, "startLocalRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v81, "startLocalRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "aceId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v81, "startLocalRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "aceId");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v22 = 0;
LABEL_9:
  objc_msgSend(v82, "intuitiveConversationRequestId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v82, "intuitiveConversationRequestId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      objc_msgSend(v24, "UUIDString");
      v27 = (AFConnection *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v92 = "-[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
      v93 = 2112;
      v94 = v27;
      _os_log_impl(&dword_19AF50000, v26, OS_LOG_TYPE_INFO, "%s Setting IntuitiveConversationRequestId = %@ from AFSpeechRequestOptions", buf, 0x16u);

    }
  }
  else
  {
    v24 = v22;
  }
  obj = v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    obj = (id)objc_claimAutoreleasedReturnValue();
  }
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "beginRequestWithUUID:forClient:", obj, self->_clientID);

  -[AFConnection _willCancelRequest](self, "_willCancelRequest");
  -[AFConnection _completeRequestWithUUID:forReason:error:](self, "_completeRequestWithUUID:forReason:error:", v77, 1, 0);
  v29 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v92 = "-[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
    v93 = 2048;
    v94 = self;
    v95 = 2112;
    v96 = obj;
    v97 = 1024;
    v98 = v79;
    v99 = 2112;
    v100 = v82;
    _os_log_impl(&dword_19AF50000, v29, OS_LOG_TYPE_INFO, "%s %p %@ %d (%@)", buf, 0x30u);
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "systemUptime");
  v32 = v31;

  if (v78 && (v34 = (void *)v78[2](v78, obj)) != 0)
  {
    v35 = v33;
  }
  else
  {
    v88[0] = CFSTR("isSpeechRequest");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v79);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v36;
    v88[1] = CFSTR("id");
    objc_msgSend(obj, "UUIDString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v37;
    v88[2] = CFSTR("unixTime");
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "timeIntervalSince1970");
    objc_msgSend(v38, "numberWithDouble:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v89[2] = v40;
    v88[3] = CFSTR("systemVersion");
    AFProductAndBuildVersion();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v89[3] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v42;
    -[AFConnection _startRequestMetricSettings](self, "_startRequestMetricSettings");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (AFIsInternalInstall_onceToken != -1)
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
    if (AFIsInternalInstall_isInternal)
    {
      v87[0] = v45;
      AFAnalyticsTurnContextCreateWithRequestInfo(v81);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      AFAnalyticsContextsMerge(v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v48;
    }
    AFAnalyticsEventCreateCurrent(1901, v45);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 3;
  }
  -[AFAnalytics logEvent:](self->_analytics, "logEvent:", v34);
  if (v79)
    v49 = v82;
  else
    v49 = v81;
  objc_msgSend(v49, "turnIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_activeTurnIdentifier, v50);
  v51 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v92 = "-[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
    _os_log_debug_impl(&dword_19AF50000, v51, OS_LOG_TYPE_DEBUG, "%s Logging TurnMTE From _willStartRequestWithSpeech", buf, 0xCu);
  }
  v52 = obj;
  if (v50)
  {
    v53 = (objc_class *)MEMORY[0x1E0D9A500];
    v54 = v50;
    v55 = (void *)objc_msgSend([v53 alloc], "initWithNSUUID:", v52);
    v56 = objc_alloc_init(MEMORY[0x1E0D9A4B0]);
    objc_msgSend(v56, "setMteRequestId:", v55);

    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v56, mach_absolute_time(), v54);

  }
  if (-[AFConnection _shouldEmitUEIRequestLinkForRequestInfo:speechRequestOptions:](self, "_shouldEmitUEIRequestLinkForRequestInfo:speechRequestOptions:", v81, v82))
  {
    v58 = (id)AFSiriLogContextConnection;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v50, "UUIDString");
      v59 = (AFConnection *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "UUIDString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v92 = "-[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
      v93 = 2112;
      v94 = v59;
      v95 = 2112;
      v96 = v60;
      _os_log_impl(&dword_19AF50000, v58, OS_LOG_TYPE_INFO, "%s Emitting Request link message between turnID: %@ and RequestID: %@", buf, 0x20u);

    }
    objc_msgSend(v52, "UUIDString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "UUIDString");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    ADCreateRequestLinkInfo(v61, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    ADCreateRequestLinkInfo(v62, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    ADEmitRequestLinkEventMessage(v63, v64);
  }
  objc_storeStrong((id *)&self->_activeRequestUUID, obj);
  v65 = 1;
  if (!v79)
    v65 = 2;
  self->_activeRequestType = v65;
  self->_activeRequestSpeechEvent = objc_msgSend(v82, "activationEvent");
  self->_activeRequestActivationEvent = objc_msgSend(v81, "activationEvent");
  self->_activeRequestBeginTime = v32;
  self->_activeRequestTypeForRequestCategorization = v35;
  if (!v79)
  {
    self->_activeRequestStartSpeechTimeRequested = 0.0;
    self->_activeRequestStartSpeechTimeAPICalled = 0.0;
    goto LABEL_48;
  }
  self->_activeRequestStartSpeechTimeAPICalled = v32;
  if (!v82)
    goto LABEL_48;
  objc_msgSend(v82, "activationEventTime");
  if (v66 <= 0.0)
  {
    if (!objc_msgSend(v82, "activationEventMachAbsoluteTime"))
      goto LABEL_48;
    v68 = objc_msgSend(v82, "activationEventMachAbsoluteTime");
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v67 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v68 / 1000000000.0;
  }
  else
  {
    objc_msgSend(v82, "activationEventTime");
  }
  self->_activeRequestStartSpeechTimeRequested = v67;
LABEL_48:
  self->_activeRequestUsefulUserResultType = 0;
  *(_WORD *)&self->_activeRequestIsDucking = 0;
  self->_activeRequestSpeechEndHostTime = 0;
  self->_activeRequestNumberOfPresentedInterstitials = 0;
  *(_OWORD *)&self->_activeRequestStopSpeechTimeRequested = 0u;
  *(_OWORD *)&self->_activeRequestSpeechRecordingEndTimeInterval = 0u;
  self->_activeRequestInitialInterstitialBeginTimeInterval = 0.0;
  lastRetryError = self->_lastRetryError;
  self->_lastRetryError = 0;

  self->_uufrID = 0;
  -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
  _EmitHomePodLaunchContextTime(self->_analytics, self->_activeRequestUUID, self->_activeTurnIdentifier, v82);
  if (v79)
  {
    +[AFAggregator logSiriSpeechRequestStarted](AFAggregator, "logSiriSpeechRequestStarted");
  }
  else
  {
    +[AFAggregator logSiriOtherRequestStarted](AFAggregator, "logSiriOtherRequestStarted");
    -[AFConnection _updateStateIfNotInSync](self, "_updateStateIfNotInSync");
  }
  if (AFSupportsSCDAFramework_onceToken != -1)
    dispatch_once(&AFSupportsSCDAFramework_onceToken, &__block_literal_global_143_40244);
  if (!AFSupportsSCDAFramework_scdaFrameworkEnabled)
  {
    +[AFMyriadCoordinator currentCoordinator](AFMyriadCoordinator, "currentCoordinator");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v70)
      goto LABEL_55;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = CFSTR("requestId");
    objc_msgSend(v52, "UUIDString");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v73;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("RequestIdForMyriad"), 0, v74, 1);
LABEL_60:

    v71 = 0;
    goto LABEL_61;
  }
  objc_msgSend(MEMORY[0x1E0D97CE0], "currentCoordinator");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = CFSTR("requestId");
    objc_msgSend(v52, "UUIDString");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v73;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("RequestIdForMyriad"), 0, v74, 1);
    goto LABEL_60;
  }
LABEL_55:
  objc_msgSend(v70, "setCurrentRequestId:", v52);
LABEL_61:

  +[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addListener:", self);

  +[AFDeviceRingerSwitchObserver sharedObserver](AFDeviceRingerSwitchObserver, "sharedObserver");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addListener:", self);

}

- (void)_willEndSession
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  AFConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[AFConnection _willEndSession]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  if (self->_activeRequestUsefulUserResultType == 2)
    -[AFConnection _willCompleteRequest](self, "_willCompleteRequest");
  else
    -[AFConnection _willCancelRequest](self, "_willCancelRequest");
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSessionForClient:", self->_clientID);

}

- (void)_willCancelRequest
{
  int64_t *p_activeRequestType;
  NSObject *v5;
  NSUUID *activeRequestUUID;
  void *v7;
  AFAnalytics *analytics;
  NSUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSUUID *activeTurnIdentifier;
  NSUUID *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  AFConnection *v22;
  __int16 v23;
  NSUUID *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_activeRequestType = &self->_activeRequestType;
  if (self->_activeRequestType)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      *(_DWORD *)buf = 136315650;
      v20 = "-[AFConnection _willCancelRequest]";
      v21 = 2048;
      v22 = self;
      v23 = 2112;
      v24 = activeRequestUUID;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v7);

    *p_activeRequestType = 0;
    p_activeRequestType[1] = 0;
    analytics = self->_analytics;
    v9 = self->_activeRequestUUID;
    if (v9)
    {
      -[NSUUID UUIDString](v9, "UUIDString", CFSTR("id"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 1912, v11);

    }
    else
    {
      -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1912, 0);
    }
    +[AFAggregator logSiriRequestCancelled](AFAggregator, "logSiriRequestCancelled");
    +[AFDeviceRingerSwitchObserver sharedObserver](AFDeviceRingerSwitchObserver, "sharedObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeListener:", self);

    +[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeListener:", self);

    -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endRequestWithUUID:forClient:", self->_activeRequestUUID, self->_clientID);

    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 1, self->_activeRequestTypeForRequestCategorization);
    activeTurnIdentifier = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestActivationEvent = 0;
    self->_activeRequestSpeechEvent = 0;
    *(int64_t *)((char *)&self->_activeRequestSpeechEvent + 7) = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    v16 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;

  }
}

- (void)_willFailRequestWithError:(id)a3
{
  void *v3;
  AFConnection *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  NSObject *v15;
  AFConnection *v16;
  NSUUID *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSUUID *v22;
  NSUUID *v23;
  AFAnalytics *v24;
  NSUUID *v25;
  NSUUID *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  unint64_t activeRequestSpeechEvent;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  NSUUID *v45;
  void *v46;
  NSUUID *v47;
  NSUUID *v48;
  NSUUID *activeRequestUUID;
  NSUUID *activeTurnIdentifier;
  void *v51;
  _QWORD v52[5];
  id v53;
  const __CFString *v54;
  void *v55;
  _QWORD v56[2];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  AFConnection *v60;
  __int16 v61;
  NSUUID *v62;
  __int16 v63;
  NSUUID *v64;
  __int16 v65;
  AFConnection *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = (AFConnection *)a3;
  if (!self->_activeRequestType)
    goto LABEL_46;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    activeRequestUUID = self->_activeRequestUUID;
    activeTurnIdentifier = self->_activeTurnIdentifier;
    *(_DWORD *)buf = 136316162;
    v58 = "-[AFConnection _willFailRequestWithError:]";
    v59 = 2048;
    v60 = self;
    v61 = 2112;
    v62 = activeRequestUUID;
    v63 = 2112;
    v64 = activeTurnIdentifier;
    v65 = 2112;
    v66 = v6;
    _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s %p activeRequestUUID = %@ turnId = %@ %@", buf, 0x34u);
  }
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v8);

  self->_activeRequestType = 0;
  self->_activeRequestUsefulUserResultType = 0;
  -[AFConnection domain](v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("kAFAssistantErrorDomain"));

  if ((v10 & 1) == 0)
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[AFConnection _willFailRequestWithError:]";
      v59 = 2112;
      v60 = v6;
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s Wrapping up non-siri error in generic error %@", buf, 0x16u);
    }
    +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 0, 0, v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (AFConnection *)v12;
  }
  v52[4] = self;
  v53 = 0;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __42__AFConnection__willFailRequestWithError___block_invoke_2;
  v52[3] = &unk_1E3A2C9B0;
  v13 = AFErrorSetUnderlyingError(v6, &v53, &__block_literal_global_236, v52);
  v14 = v53;
  if (v13)
  {
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[AFConnection _willFailRequestWithError:]";
      v59 = 2112;
      v60 = v6;
      _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s Appending additional details to error %@", buf, 0x16u);
    }
    v16 = (AFConnection *)v14;

    v6 = v16;
  }
  v51 = v14;
  v17 = self->_activeRequestUUID;
  if (v17)
  {
    v54 = CFSTR("id");
    -[NSUUID UUIDString](v17, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA70];
  }
  v56[0] = v18;
  AFAnalyticsContextCreateWithError(v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {

  }
  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1913, v21);
  v22 = self->_activeRequestUUID;
  v23 = self->_activeTurnIdentifier;
  v24 = self->_analytics;
  v25 = v22;
  v26 = v23;
  v6 = v6;
  if (!v6)
  {
    v27 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136315650;
    v58 = "_EmitPNRFatalError";
    v59 = 2112;
    v60 = (AFConnection *)v25;
    v61 = 2112;
    v62 = v26;
    v37 = "%s error is nil. Instrumentation logging is skipped. requestUUID = %@ turnId = %@";
LABEL_48:
    _os_log_error_impl(&dword_19AF50000, v27, OS_LOG_TYPE_ERROR, v37, buf, 0x20u);
    goto LABEL_29;
  }
  v27 = AFSiriLogContextConnection;
  if (v26)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v58 = "_EmitPNRFatalError";
      v59 = 2112;
      v60 = (AFConnection *)v25;
      v61 = 2112;
      v62 = v26;
      v63 = 2112;
      v64 = (NSUUID *)v6;
      _os_log_impl(&dword_19AF50000, v27, OS_LOG_TYPE_INFO, "%s Logging instrumentation for requestUUID = %@ turnId = %@ error = %@", buf, 0x2Au);
    }
    v28 = objc_alloc_init(MEMORY[0x1E0D9A468]);
    _PNRFatalErrorInfo(v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setError:", v29);

    -[AFConnection userInfo](v6, "userInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      _PNRFatalErrorInfo(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setUnderlyingError:", v33);

      objc_msgSend(v32, "userInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        _PNRFatalErrorInfo(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setUnderUnderlyingError:", v36);

      }
    }
    -[AFAnalytics logInstrumentation:machAbsoluteTime:turnIdentifier:](v24, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v28, mach_absolute_time(), v26);

    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "_EmitPNRFatalError";
    v59 = 2112;
    v60 = (AFConnection *)v25;
    v61 = 2112;
    v62 = (NSUUID *)v6;
    v37 = "%s turnId is nil. Instrumentation logging is skipped. requestUUID = %@ error = %@";
    goto LABEL_48;
  }
LABEL_29:

  +[AFAggregator logSiriRequestFailedWithError:](AFAggregator, "logSiriRequestFailedWithError:", v6);
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    -[AFConnection _clientService](self, "_clientService");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    activeRequestSpeechEvent = self->_activeRequestSpeechEvent;
    if (activeRequestSpeechEvent > 0x24)
      v40 = CFSTR("Unknown");
    else
      v40 = off_1E3A2DF78[activeRequestSpeechEvent];
    v41 = v40;
    objc_msgSend(v38, "reportIssueForError:type:subtype:context:", v6, 1913, v41, v21);

  }
  if (!_AFConnectionIsErrorDeallocation(v6))
  {
    +[AFDeviceRingerSwitchObserver sharedObserver](AFDeviceRingerSwitchObserver, "sharedObserver");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeListener:", self);

    +[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeListener:", self);

    -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "endRequestWithUUID:forClient:", self->_activeRequestUUID, self->_clientID);

  }
  _LogUEIRequestCategorization(self->_activeTurnIdentifier, 2, self->_activeRequestTypeForRequestCategorization);
  v45 = self->_activeTurnIdentifier;
  self->_activeTurnIdentifier = 0;

  self->_activeRequestTypeForRequestCategorization = 0;
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  if (AFIsHorseman_isHorseman)
    goto LABEL_44;
  if (AFIsPad_onceToken != -1)
    dispatch_once(&AFIsPad_onceToken, &__block_literal_global_132_40147);
  if (AFIsPad_isPad)
  {
LABEL_44:
    -[AFConnection _clientService](self, "_clientService");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "emitHomeMetricInvocationEvent");

  }
  *(_WORD *)&self->_activeRequestHasSpeechRecognition = 0;
  self->_activeRequestIsTwoShot = 0;
  self->_activeRequestActivationEvent = 0;
  self->_activeRequestSpeechEvent = 0;
  *(_OWORD *)&self->_activeRequestBeginTime = 0u;
  *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
  *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
  *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
  *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
  v47 = self->_activeRequestUUID;
  self->_activeRequestUUID = 0;

  v48 = self->_activeTurnIdentifier;
  self->_activeTurnIdentifier = 0;

LABEL_46:
}

- (void)_willCompleteRequest
{
  int64_t *p_activeRequestType;
  NSObject *v5;
  NSUUID *activeRequestUUID;
  void *v7;
  AFAnalytics *analytics;
  NSUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUUID *activeTurnIdentifier;
  void *v17;
  NSUUID *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  AFConnection *v24;
  __int16 v25;
  NSUUID *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_activeRequestType = &self->_activeRequestType;
  if (self->_activeRequestType)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      *(_DWORD *)buf = 136315650;
      v22 = "-[AFConnection _willCompleteRequest]";
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = activeRequestUUID;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v7);

    *p_activeRequestType = 0;
    p_activeRequestType[1] = 0;
    analytics = self->_analytics;
    v9 = self->_activeRequestUUID;
    if (v9)
    {
      -[NSUUID UUIDString](v9, "UUIDString", CFSTR("id"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 1914, v11);

    }
    else
    {
      -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1914, 0);
    }
    +[AFAggregator logSiriRequestSucceeded](AFAggregator, "logSiriRequestSucceeded");
    -[AFConnection _clientService](self, "_clientService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordAWDSuccessMetrics");

    +[AFDeviceRingerSwitchObserver sharedObserver](AFDeviceRingerSwitchObserver, "sharedObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeListener:", self);

    +[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeListener:", self);

    -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endRequestWithUUID:forClient:", self->_activeRequestUUID, self->_clientID);

    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 3, self->_activeRequestTypeForRequestCategorization);
    activeTurnIdentifier = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestTypeForRequestCategorization = 0;
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (AFIsHorseman_isHorseman)
      goto LABEL_13;
    if (AFIsPad_onceToken != -1)
      dispatch_once(&AFIsPad_onceToken, &__block_literal_global_132_40147);
    if (AFIsPad_isPad)
    {
LABEL_13:
      -[AFConnection _clientService](self, "_clientService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "emitHomeMetricInvocationEvent");

    }
    *(_WORD *)&self->_activeRequestHasSpeechRecognition = 0;
    self->_activeRequestIsTwoShot = 0;
    self->_activeRequestActivationEvent = 0;
    self->_activeRequestSpeechEvent = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    v18 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;

  }
}

- (void)_willPresentUsefulUserResultWithType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  AFConnection *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v5);
  -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v5);
  if (self->_activeRequestType)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v10 = 136315650;
      v11 = "-[AFConnection _willPresentUsefulUserResultWithType:]";
      v12 = 2048;
      v13 = self;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p %ld", (uint8_t *)&v10, 0x20u);
    }
    self->_activeRequestUsefulUserResultType = a3;
    if (AFIsInternalInstall_onceToken != -1)
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
    if (AFIsInternalInstall_isInternal)
    {
      if (self->_activeRequestInitialInterstitialBeginTimeInterval > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v8 = v7 - self->_activeRequestInitialInterstitialBeginTimeInterval;
        if (v8 < 0.5)
        {
          v9 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            v10 = 136315394;
            v11 = "-[AFConnection _willPresentUsefulUserResultWithType:]";
            v12 = 2048;
            v13 = *(AFConnection **)&v8;
            _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Initial interstitial fired %f seconds right before UUFR!", (uint8_t *)&v10, 0x16u);
          }
          -[AFConnection reportIssueForType:subtype:context:](self, "reportIssueForType:subtype:context:", CFSTR("Interstitial"), CFSTR("Near Fire before UUFR"), 0);
        }
      }
    }
  }
  else
  {
    self->_activeRequestUsefulUserResultType = 0;
  }

}

- (void)_enqueueInterstitialCommand:(id)a3
{
  id v4;
  NSObject *v5;
  AFQueue *interstitialCommandQueue;
  AFQueue *v7;
  AFQueue *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315394;
    v10 = "-[AFConnection _enqueueInterstitialCommand:]";
    v11 = 2112;
    v12 = v4;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s command = %@", (uint8_t *)&v9, 0x16u);
  }
  interstitialCommandQueue = self->_interstitialCommandQueue;
  if (!interstitialCommandQueue)
  {
    v7 = objc_alloc_init(AFQueue);
    v8 = self->_interstitialCommandQueue;
    self->_interstitialCommandQueue = v7;

    interstitialCommandQueue = self->_interstitialCommandQueue;
  }
  -[AFQueue enqueueObject:](interstitialCommandQueue, "enqueueObject:", v4);

}

- (void)_beginInterstitialsForReason:(id)a3
{
  id v4;
  int64_t activeRequestSpeechEvent;
  int64_t activeRequestActivationEvent;
  uint64_t ForcedInterstitialStyle;
  NSObject *v8;
  AFInterstitialProvider *v9;
  AFInterstitialProvider *interstitialProvider;
  NSString *recordRoute;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_interstitialProvider)
  {
    if (self->_activeRequestType)
    {
      if (!self->_activeRequestUsefulUserResultType)
      {
        activeRequestSpeechEvent = self->_activeRequestSpeechEvent;
        if (activeRequestSpeechEvent != 17)
        {
          activeRequestActivationEvent = self->_activeRequestActivationEvent;
          if (activeRequestActivationEvent != 6 && activeRequestActivationEvent != 9 && activeRequestSpeechEvent != 32)
          {
            if (AFIsInternalInstall_onceToken != -1)
              dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
            if (!AFIsInternalInstall_isInternal
              || (ForcedInterstitialStyle = _AFPreferencesGetForcedInterstitialStyle()) == 0)
            {
              if (AFIsHorseman_onceToken != -1)
                dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
              if (AFIsHorseman_isHorseman)
              {
                ForcedInterstitialStyle = 4;
              }
              else
              {
                recordRoute = self->_recordRoute;
                if (recordRoute
                  && -[NSString isEqualToString:](recordRoute, "isEqualToString:", CFSTR("BluetoothDoAP")))
                {
                  ForcedInterstitialStyle = 3;
                }
                else if (-[AFClientConfiguration isDeviceInStarkMode](self->_clientConfiguration, "isDeviceInStarkMode"))
                {
                  ForcedInterstitialStyle = 6;
                }
                else if (-[AFClientConfiguration isDeviceInCarDNDMode](self->_clientConfiguration, "isDeviceInCarDNDMode"))
                {
                  ForcedInterstitialStyle = 5;
                }
                else if (AFPlaybackRouteIsHandsFree(self->_playbackRoute))
                {
                  ForcedInterstitialStyle = 2;
                }
                else
                {
                  ForcedInterstitialStyle = 1;
                }
              }
            }
            v8 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v13 = "-[AFConnection _beginInterstitialsForReason:]";
              v14 = 2114;
              v15 = v4;
              _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@", buf, 0x16u);
            }
            v9 = -[AFInterstitialProvider initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:context:preferences:delegate:]([AFInterstitialProvider alloc], "initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:context:preferences:delegate:", ForcedInterstitialStyle, self->_recordRoute, (self->_activeRequestSpeechEvent < 0x20uLL) & (0x80018900 >> self->_activeRequestSpeechEvent), self->_activeRequestIsDucking, self->_activeRequestIsTwoShot, self->_activeRequestSpeechEndHostTime, self->_activeRequestUUID, self->_preferences, self);
            interstitialProvider = self->_interstitialProvider;
            self->_interstitialProvider = v9;

          }
        }
      }
    }
  }

}

- (void)_handleInterstitialPhase:(int64_t)a3 fromProvider:(id)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9
{
  AFInterstitialProvider *v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[4];
  void (**v32)(_QWORD);
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  double v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v17 = (AFInterstitialProvider *)a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = (void (**)(_QWORD))a9;
  if (self->_interstitialProvider == v17 && (-[NSUUID isEqual:](self->_activeRequestUUID, "isEqual:", v20) & 1) != 0)
  {
    v22 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      if ((unint64_t)a3 > 4)
        v24 = CFSTR("(unknown)");
      else
        v24 = off_1E3A32208[a3];
      v25 = v24;
      *(_DWORD *)buf = 136316418;
      v34 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
      v35 = 2112;
      v36 = v25;
      v37 = 2112;
      v38 = v18;
      v39 = 2112;
      v40 = v19;
      v41 = 2048;
      v42 = a7;
      v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_19AF50000, v23, OS_LOG_TYPE_INFO, "%s phase = %@, displayText = %@, speakableText = %@, expectedDelay = %f, context = %@", buf, 0x3Eu);

    }
    if ((unint64_t)(a3 - 1) >= 3)
    {
      if (a3 == 4)
      {
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v29);
        -[AFConnection _invokeRequestTimeoutForReason:](self, "_invokeRequestTimeoutForReason:", v29);

      }
    }
    else
    {
      -[AFQueue dequeueObject](self->_interstitialCommandQueue, "dequeueObject");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        if (objc_msgSend(v18, "length") || objc_msgSend(v19, "length"))
        {
          -[NSUUID UUIDString](self->_activeRequestUUID, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          AFInterstitialCreateCommand(a3, v18, v19, v27);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v30 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v34 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
            _os_log_impl(&dword_19AF50000, v30, OS_LOG_TYPE_INFO, "%s Unable to create an interstitial command because display text and speakable text are both empty.", buf, 0xCu);
          }
          v26 = 0;
        }
      }
      v28 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
        v35 = 2112;
        v36 = v26;
        _os_log_impl(&dword_19AF50000, v28, OS_LOG_TYPE_INFO, "%s interstitialCommand = %@", buf, 0x16u);
      }
      if (v26)
      {
        ++self->_activeRequestNumberOfPresentedInterstitials;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __113__AFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke;
        v31[3] = &unk_1E3A2C9D8;
        v32 = v21;
        -[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:](self, "_dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:", v26, 1, a3, v31, a7);

      }
      else if (v21)
      {
        v21[2](v21);
      }

    }
  }
  else if (v21)
  {
    v21[2](v21);
  }

}

- (void)_endInterstitialsForReason:(id)a3
{
  id v4;
  NSObject *v5;
  AFInterstitialProvider *interstitialProvider;
  AFQueue *interstitialCommandQueue;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_interstitialProvider)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[AFConnection _endInterstitialsForReason:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v8, 0x16u);
    }
    -[AFConnection stopAllAudioPlaybackRequests:](self, "stopAllAudioPlaybackRequests:", +[AFFeatureFlags isStateFeedbackEnabled](AFFeatureFlags, "isStateFeedbackEnabled") ^ 1);
    -[AFInterstitialProvider invalidate](self->_interstitialProvider, "invalidate");
    interstitialProvider = self->_interstitialProvider;
    self->_interstitialProvider = 0;

  }
  interstitialCommandQueue = self->_interstitialCommandQueue;
  self->_interstitialCommandQueue = 0;

}

- (void)endSession
{
  NSObject *v3;
  __objc2_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  AFConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[AFConnection endSession]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v8, 0x16u);
  }
  -[AFConnection _willEndSession](self, "_willEndSession");
  if (AFSupportsSCDAFramework_onceToken != -1)
    dispatch_once(&AFSupportsSCDAFramework_onceToken, &__block_literal_global_143_40244);
  if (AFSupportsSCDAFramework_scdaFrameworkEnabled)
    v4 = (__objc2_class *)MEMORY[0x1E0D97CE0];
  else
    v4 = AFMyriadCoordinator;
  -[__objc2_class currentCoordinator](v4, "currentCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "endTask");

  -[AFConnection _clientService](self, "_clientService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endSession");

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  AFConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[AFConnection invalidate]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  -[AFConnection _clearConnection](self, "_clearConnection");
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateClient:", self->_clientID);

}

- (void)preheatWithStyle:(int64_t)a3
{
  -[AFConnection preheatWithStyle:forOptions:](self, "preheatWithStyle:forOptions:", a3, 0);
}

- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  AFConnection *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = 136315906;
    v12 = "-[AFConnection preheatWithStyle:forOptions:]";
    v13 = 2048;
    v14 = self;
    v15 = 2048;
    v16 = a3;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %p %ld %@", (uint8_t *)&v11, 0x2Au);
  }
  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1915, 0);
  -[AFConnection _clientService](self, "_clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preheatWithStyle:forOptions:", a3, v6);

  v9 = +[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver");
  v10 = +[AFDeviceRingerSwitchObserver sharedObserver](AFDeviceRingerSwitchObserver, "sharedObserver");

}

- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  AFConnection *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[AFConnection boostedPreheatWithStyle:completion:]";
    v16 = 2048;
    v17 = self;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %p %ld", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__AFConnection_boostedPreheatWithStyle_completion___block_invoke;
  v12[3] = &unk_1E3A35B08;
  v13 = v6;
  v8 = v6;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v8;
  else
    v11 = &__block_literal_global_257;
  objc_msgSend(v9, "boostedPreheatWithStyle:completion:", a3, v11);

}

- (void)forceAudioSessionActive
{
  -[AFConnection forceAudioSessionActiveWithOptions:completion:](self, "forceAudioSessionActiveWithOptions:completion:", 0, 0);
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  -[AFConnection forceAudioSessionActiveWithOptions:reason:completion:](self, "forceAudioSessionActiveWithOptions:reason:completion:", a3, 0, a4);
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  -[AFConnection forceAudioSessionActiveWithOptions:reason:speechRequestOptions:completion:](self, "forceAudioSessionActiveWithOptions:reason:speechRequestOptions:completion:", a3, a4, 0, a5);
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  unint64_t v20;
  int64_t v21;

  v10 = a5;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__AFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke;
  v18[3] = &unk_1E3A2D788;
  v20 = a3;
  v21 = a4;
  v19 = v10;
  v13 = v10;
  v14 = +[AFSetAudioSessionActiveContext newWithBuilder:](AFSetAudioSessionActiveContext, "newWithBuilder:", v18);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __90__AFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke_2;
  v16[3] = &unk_1E3A2CA20;
  v17 = v11;
  v15 = v11;
  -[AFConnection forceAudioSessionActiveWithContext:completion:](self, "forceAudioSessionActiveWithContext:completion:", v14, v16);

}

- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AFOneArgumentSafetyBlock *v9;
  uint64_t v10;
  id v11;
  id v12;
  AFOneArgumentSafetyBlock *v13;
  AFOneArgumentSafetyBlock *v14;
  void *v15;
  AFOneArgumentSafetyBlock *v16;
  _QWORD v17[4];
  AFOneArgumentSafetyBlock *v18;
  _QWORD v19[4];
  AFOneArgumentSafetyBlock *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  AFConnection *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[AFConnection forceAudioSessionActiveWithContext:completion:]";
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  v9 = [AFOneArgumentSafetyBlock alloc];
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke;
  v21[3] = &unk_1E3A2CA48;
  v21[4] = self;
  v22 = v7;
  v11 = v7;
  v12 = +[AFSetAudioSessionActiveResult newWithBuilder:](AFSetAudioSessionActiveResult, "newWithBuilder:", &__block_literal_global_265);
  v13 = -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](v9, "initWithBlock:defaultValue:", v21, v12);

  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2;
  v19[3] = &unk_1E3A36A00;
  v14 = v13;
  v20 = v14;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2_271;
  v17[3] = &unk_1E3A2CAD8;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "forceAudioSessionActiveWithContext:completion:", v6, v17);

}

- (void)acquireAudioSessionWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  AFConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[AFConnection acquireAudioSessionWithContext:completion:]";
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke;
  v13[3] = &unk_1E3A2CB28;
  v13[4] = self;
  v14 = v6;
  v15 = v9;
  v16 = v7;
  v10 = v9;
  v11 = v6;
  v12 = v7;
  -[AFConnection forceAudioSessionActiveWithContext:completion:](self, "forceAudioSessionActiveWithContext:completion:", v11, v13);

}

- (void)forceAudioSessionInactive
{
  -[AFConnection forceAudioSessionInactiveWithOptions:completion:](self, "forceAudioSessionInactiveWithOptions:completion:", 1, 0);
}

- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  AFConnection *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[AFConnection forceAudioSessionInactiveWithOptions:completion:]";
    v21 = 2048;
    v22 = self;
    v23 = 2048;
    v24 = a3;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %lu", buf, 0x20u);
  }
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__AFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke;
  v17[3] = &unk_1E3A36BB8;
  v18 = v6;
  v9 = v6;
  v12 = v8;
  v13 = 3221225472;
  v14 = __64__AFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke_2;
  v15 = &unk_1E3A35B08;
  v16 = (id)MEMORY[0x1A1AC0C3C](v17);
  v10 = v16;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forceAudioSessionInactiveWithOptions:completion:", a3, v10, v12, v13, v14, v15);

}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  id v2;

  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", &__block_literal_global_275);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeInterruptedAudioPlaybackIfNeeded");

}

- (void)willPresentUI
{
  void *v3;
  id v4;

  -[AFConnection _clientService](self, "_clientService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willPresentUIWithReply:", &__block_literal_global_276);

  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginSessionForClient:", self->_clientID);

}

- (void)didDismissUI
{
  void *v3;
  id v4;

  -[AFConnection _clientService](self, "_clientService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissUI");

  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSessionForClient:", self->_clientID);

}

- (void)setLockState:(BOOL)a3 screenLocked:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLockState:showingLockScreen:", v5, v4);

}

- (void)setIsDeviceInStarkMode:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[AFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__AFConnection_setIsDeviceInStarkMode___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[AFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__AFConnection_setSupportsCarPlayVehicleData___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

- (void)setCarDNDActive:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[AFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__AFConnection_setCarDNDActive___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

- (void)setModesConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[AFFeatureFlags isResponseFrameworkEnabled](AFFeatureFlags, "isResponseFrameworkEnabled"))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[AFConnection setModesConfiguration:]";
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s #modes set modesConfiguration", (uint8_t *)&v7, 0xCu);
    }
    -[AFConnection _clientService](self, "_clientService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModesConfiguration:", v4);

  }
}

- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[AFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__AFConnection_setAnnouncementRequestsPermittedByPresentationWhileActive___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

- (void)setWatchAuthenticated:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[AFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__AFConnection_setWatchAuthenticated___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

- (void)setAccessibilityState:(id)a3
{
  id v4;
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__AFConnection_setAccessibilityState___block_invoke;
  v9[3] = &unk_1E3A2CB70;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v9);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");

}

- (void)setDeviceRingerSwitchState:(int64_t)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[5];

  -[AFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__AFConnection_setDeviceRingerSwitchState___block_invoke;
  v8[3] = &__block_descriptor_40_e41_v16__0___AFClientConfigurationMutating__8l;
  v8[4] = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

- (void)setShouldWaitForMyriad:(BOOL)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFConnection setShouldWaitForMyriad:]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setMyriadDecisionResult:(BOOL)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFConnection setMyriadDecisionResult:]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setVoiceOverIsActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 272) = *((_BYTE *)self + 272) & 0xFD | v3;
}

- (void)setConfiguration:(id)a3
{
  AFClientConfiguration *v4;
  AFClientConfiguration *clientConfiguration;

  v4 = (AFClientConfiguration *)objc_msgSend(a3, "copy");
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v4;

  *((_BYTE *)self + 272) &= ~1u;
  -[AFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

- (void)startRequestWithText:(id)a3
{
  id v4;
  AFRequestInfo *v5;

  v4 = a3;
  v5 = objc_alloc_init(AFRequestInfo);
  -[AFRequestInfo setActivationEvent:](v5, "setActivationEvent:", 5);
  -[AFRequestInfo setText:](v5, "setText:", v4);

  -[AFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v5);
}

- (void)startDirectActionRequestWithString:(id)a3
{
  id v4;
  AFRequestInfo *v5;

  v4 = a3;
  v5 = objc_alloc_init(AFRequestInfo);
  -[AFRequestInfo setActivationEvent:](v5, "setActivationEvent:", 2);
  -[AFRequestInfo setLegacyDirectActionIdentifier:](v5, "setLegacyDirectActionIdentifier:", v4);

  -[AFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v5);
}

- (void)startContinuationRequestWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  AFRequestInfo *v6;

  v4 = a3;
  v6 = objc_alloc_init(AFRequestInfo);
  objc_msgSend(v4, "objectForKey:", CFSTR("Data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFRequestInfo setHandoffRequestData:](v6, "setHandoffRequestData:", v5);
  -[AFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v6);

}

- (void)startRequestWithAceCommand:(id)a3
{
  -[AFConnection _startRequestWithAceCommand:turnIdentifier:suppressAlert:](self, "_startRequestWithAceCommand:turnIdentifier:suppressAlert:", a3, 0, 0);
}

- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5
{
  -[AFConnection startRequestWithCorrectedText:forSpeechIdentifier:userSelectionResults:turnIdentifier:](self, "startRequestWithCorrectedText:forSpeechIdentifier:userSelectionResults:turnIdentifier:", a3, a4, a5, 0);
}

- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AFRequestInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(AFRequestInfo);
  -[AFRequestInfo setActivationEvent:](v14, "setActivationEvent:", 4);
  -[AFRequestInfo setCorrectedSpeech:](v14, "setCorrectedSpeech:", v13);

  -[AFRequestInfo setCorrectedSpeechContext:](v14, "setCorrectedSpeechContext:", v12);
  -[AFRequestInfo setTurnIdentifier:](v14, "setTurnIdentifier:", v11);

  v24 = v10;
  objc_msgSend(v24, "combinedRank");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFRequestInfo setCombinedRank:](v14, "setCombinedRank:", v15);

  objc_msgSend(v24, "combinedScore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFRequestInfo setCombinedScore:](v14, "setCombinedScore:", v16);

  objc_msgSend(v24, "interactionId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFRequestInfo setInteractionId:](v14, "setInteractionId:", v17);

  objc_msgSend(v24, "onDeviceUtterancesPresent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFRequestInfo setOnDeviceUtterancesPresent:](v14, "setOnDeviceUtterancesPresent:", v18);

  objc_msgSend(v24, "originalRank");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFRequestInfo setOriginalRank:](v14, "setOriginalRank:", v19);

  objc_msgSend(v24, "originalScore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFRequestInfo setOriginalScore:](v14, "setOriginalScore:", v20);

  objc_msgSend(v24, "previousUtterance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFRequestInfo setPreviousUtterance:](v14, "setPreviousUtterance:", v21);

  objc_msgSend(v24, "sessionId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFRequestInfo setSessionId:](v14, "setSessionId:", v22);

  objc_msgSend(v24, "utteranceSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFRequestInfo setUtteranceSource:](v14, "setUtteranceSource:", v23);
  -[AFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v14);

}

- (void)startRequestWithInfo:(id)a3 activationEvent:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a4 > 0xB)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E3A2DF18[a4];
    v10 = v9;
    v11 = 136315650;
    v12 = "-[AFConnection startRequestWithInfo:activationEvent:]";
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Overriding activation event in info %@ %@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v6, "setActivationEvent:", a4);
  -[AFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v6);

}

- (void)_startRequestWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSUUID *v10;
  NSUUID *v11;
  void *v12;
  NSUUID *v13;
  _QWORD v14[5];
  NSUUID *v15;
  _QWORD v16[5];
  NSUUID *v17;
  _QWORD v18[4];
  id v19;
  AFConnection *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  AFConnection *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFConnection _startRequestWithInfo:]";
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  if (objc_msgSend(v4, "activationEvent") == 2)
  {
    objc_msgSend(v4, "speechRequestOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "activationEvent");

    if (v7 == 9)
      kdebug_trace();
  }
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38__AFConnection__startRequestWithInfo___block_invoke;
  v18[3] = &unk_1E3A2CBB8;
  v19 = v4;
  v20 = self;
  v9 = v4;
  -[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 0, 0, v9, v18);
  v10 = self->_activeRequestUUID;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __38__AFConnection__startRequestWithInfo___block_invoke_2;
  v16[3] = &unk_1E3A2CBE0;
  v16[4] = self;
  v11 = v10;
  v17 = v11;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __38__AFConnection__startRequestWithInfo___block_invoke_2_285;
  v14[3] = &unk_1E3A2CBE0;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "startRequestWithInfo:completion:", v9, v14);

}

- (id)_startRequestMetricSettings
{
  id v3;
  AFPreferences *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = self->_preferences;
  -[AFPreferences languageCode](v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("siriInputLanguage"));
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  if (!AFIsHorseman_isHorseman)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AFPreferencesTypeToSiriEnabled());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("typeToSiri"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFPreferences alwaysShowRecognizedSpeech](v4, "alwaysShowRecognizedSpeech"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("showRecognizedSpeech"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFPreferences siriResponseShouldAlwaysPrint](v4, "siriResponseShouldAlwaysPrint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("captionVoiceFeedback"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFPreferences alwaysObscureBackgroundContentWhenActive](v4, "alwaysObscureBackgroundContentWhenActive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("hideBackgroundContent"));

    -[AFConnection _metricContextValueForUseDeviceSpeakerForTTS:](self, "_metricContextValueForUseDeviceSpeakerForTTS:", -[AFPreferences useDeviceSpeakerForTTS](v4, "useDeviceSpeakerForTTS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("useSpeakerForTTS"));
    objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("requestSettings"));

  }
  return v3;
}

- (id)_metricContextValueForUseDeviceSpeakerForTTS:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_1E3A2CCE8[a3 - 1];
}

- (void)_startRequestWithAceCommand:(id)a3 turnIdentifier:(id)a4 suppressAlert:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  AFRequestInfo *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  v9 = objc_alloc_init(AFRequestInfo);
  -[AFRequestInfo setActivationEvent:](v9, "setActivationEvent:", 0);
  -[AFRequestInfo setTurnIdentifier:](v9, "setTurnIdentifier:", v8);

  if (v5)
    -[AFRequestInfo setOptions:](v9, "setOptions:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AFRequestInfo setStartLocalRequest:](v9, "setStartLocalRequest:", v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AFRequestInfo setStartRequest:](v9, "setStartRequest:", v10);
  }
  -[AFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v9);

}

- (void)startSpeechRequestWithOptions:(id)a3
{
  void (**v3)(void);

  -[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:](self, "startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;

  v6 = (void (**)(id, id))a4;
  -[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:](self, "startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (id)startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t pendingSpeechRequestCounter;
  NSUUID *v10;
  NSUUID *v11;
  void *v12;
  NSUUID *v13;
  NSObject *v14;
  AFSafetyBlock *v15;
  NSObject *v16;
  AFSafetyBlock *v17;
  OS_dispatch_group *speechCallbackGroup;
  OS_dispatch_group *v19;
  void *v20;
  AFSafetyBlock *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  AFConnection *v27;
  AFSafetyBlock *v28;
  unint64_t v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD v32[5];
  NSUUID *v33;
  _QWORD v34[5];
  NSUUID *v35;
  _QWORD v36[4];
  id v37;
  AFConnection *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  AFConnection *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]";
    v41 = 2048;
    v42 = self;
    v43 = 2112;
    v44 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  +[AFAggregator logSiriInvokedVia:](AFAggregator, "logSiriInvokedVia:", objc_msgSend(v4, "activationEvent"));
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransaction");

  -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 1);
  v7 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke;
  v36[3] = &unk_1E3A2CBB8;
  v8 = v4;
  v37 = v8;
  v38 = self;
  -[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 1, v8, 0, v36);
  pendingSpeechRequestCounter = self->_pendingSpeechRequestCounter;
  self->_pendingSpeechRequestCounter = pendingSpeechRequestCounter + 1;
  v10 = self->_activeRequestUUID;
  kdebug_trace();
  v34[0] = v7;
  v34[1] = 3221225472;
  v34[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2;
  v34[3] = &unk_1E3A2CBE0;
  v34[4] = self;
  v11 = v10;
  v35 = v11;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2_299;
  v32[3] = &unk_1E3A2CBE0;
  v32[4] = self;
  v13 = v11;
  v33 = v13;
  objc_msgSend(v12, "startRecordingForPendingSpeechRequestWithOptions:requestId:sessionUUID:completion:", v8, pendingSpeechRequestCounter, v13, v32);

  if (objc_msgSend(v8, "pendCallbacksUntilAfterContinuation"))
  {
    v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    v15 = [AFSafetyBlock alloc];
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_4;
    v30[3] = &unk_1E3A313B0;
    v16 = v14;
    v31 = v16;
    v17 = -[AFSafetyBlock initWithBlock:](v15, "initWithBlock:", v30);
    speechCallbackGroup = self->_speechCallbackGroup;
    self->_speechCallbackGroup = (OS_dispatch_group *)v16;
    v19 = v16;

  }
  else
  {
    v17 = 0;
    v19 = self->_speechCallbackGroup;
    self->_speechCallbackGroup = 0;
  }

  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endTransaction");

  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_5;
  v25[3] = &unk_1E3A32C20;
  v26 = v8;
  v27 = self;
  v28 = v17;
  v29 = pendingSpeechRequestCounter;
  v21 = v17;
  v22 = v8;
  v23 = (void *)MEMORY[0x1A1AC0C3C](v25);

  return v23;
}

- (void)startSpeechPronunciationRequestWithOptions:(id)a3 pronunciationContext:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSUUID *v13;
  NSUUID *v14;
  void *v15;
  NSUUID *v16;
  _QWORD v17[5];
  NSUUID *v18;
  _QWORD v19[5];
  NSUUID *v20;
  _QWORD v21[4];
  id v22;
  AFConnection *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[AFConnection startSpeechPronunciationRequestWithOptions:pronunciationContext:]";
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 1);
  objc_msgSend(v7, "serverCommandId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConnection _extendRequestTimeoutForReason:durationInSeconds:](self, "_extendRequestTimeoutForReason:durationInSeconds:", v12, 0.0);
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke;
    v21[3] = &unk_1E3A2CBB8;
    v22 = v7;
    v23 = self;
    -[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 1, v22, 0, v21);
    v12 = v22;
  }

  v13 = self->_activeRequestUUID;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2;
  v19[3] = &unk_1E3A2CBE0;
  v19[4] = self;
  v14 = v13;
  v20 = v14;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2_302;
  v17[3] = &unk_1E3A2CBE0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "startSpeechPronunciationRequestWithOptions:context:completion:", v7, v8, v17);

}

- (void)startAcousticIDRequestWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSUUID *v7;
  NSUUID *v8;
  void *v9;
  NSUUID *v10;
  _QWORD v11[5];
  NSUUID *v12;
  _QWORD v13[5];
  NSUUID *v14;
  _QWORD v15[4];
  id v16;
  AFConnection *v17;

  v4 = a3;
  -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 1);
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke;
  v15[3] = &unk_1E3A2CBB8;
  v16 = v4;
  v17 = self;
  v6 = v4;
  -[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 1, v6, 0, v15);
  v7 = self->_activeRequestUUID;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_2;
  v13[3] = &unk_1E3A2CBE0;
  v13[4] = self;
  v8 = v7;
  v14 = v8;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_2_304;
  v11[3] = &unk_1E3A2CBE0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "startAcousticIDRequestWithOptions:context:completion:", v6, 0, v11);

}

- (void)cancelSpeech
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  AFConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[AFConnection cancelSpeech]";
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  -[AFConnection cancelRequest](self, "cancelRequest");
}

- (void)cancelRequest
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  AFConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[AFConnection cancelRequest]";
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  -[AFConnection cancelRequestForReason:](self, "cancelRequestForReason:", 13);
}

- (void)cancelRequestForReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[AFConnection cancelRequestForReason:]";
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s reason = %ld", (uint8_t *)&v9, 0x16u);
  }
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransaction");

  -[AFConnection _willCancelRequest](self, "_willCancelRequest");
  -[AFConnection _requestDidEnd](self, "_requestDidEnd");
  -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  -[AFConnection _clientService](self, "_clientService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelRequestForReason:withError:", a3, 0);

  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endTransaction");

}

- (void)failRequestWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  AFConnection *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315650;
    v14 = "-[AFConnection failRequestWithError:]";
    v15 = 2048;
    v16 = self;
    v17 = 2112;
    v18 = v4;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %p %@", (uint8_t *)&v13, 0x20u);
  }
  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransaction");

  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("kAFAssistantErrorDomain")))
    goto LABEL_8;
  v8 = objc_msgSend(v4, "code");

  if (v8 == 1)
  {
    if (self->_lastRetryError)
    {
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 1, CFSTR("kAFAssistantErrorDomain"), self->_lastRetryError);
        v7 = v4;
        v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

      }
    }
  }
  -[AFConnection _willFailRequestWithError:](self, "_willFailRequestWithError:", v4);
  -[AFConnection _requestDidEnd](self, "_requestDidEnd");
  -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  -[AFConnection _clientService](self, "_clientService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelRequestForReason:withError:", 3, v4);

  -[AFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endTransaction");

}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5
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
    -[AFConnection _clientService](self, "_clientService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportIssueForError:type:context:", v10, a4, v8);

  }
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6
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
    -[AFConnection _clientService](self, "_clientService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportIssueForError:type:subtype:context:", v13, a4, v10, v11);

  }
}

- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    -[AFConnection _clientService](self, "_clientService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportIssueForType:subtype:context:", v11, v8, v9);

  }
}

- (void)stopSpeech
{
  -[AFConnection stopSpeechWithOptions:](self, "stopSpeechWithOptions:", 0);
}

- (void)stopSpeechWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  AFAnalytics *analytics;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  int v14;
  const char *v15;
  __int16 v16;
  AFConnection *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  kdebug_trace();
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v14 = 136315650;
    v15 = "-[AFConnection stopSpeechWithOptions:]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v14, 0x20u);
  }
  -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  analytics = self->_analytics;
  AFAnalyticsContextCreateWithSpeechRequestOptions(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFAnalytics logEventWithType:context:contextNoCopy:](analytics, "logEventWithType:context:contextNoCopy:", 1910, v7, 0);

  -[AFConnection _clientService](self, "_clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopSpeechWithOptions:", v4);

  if (self->_activeRequestType == 1 && self->_activeRequestStopSpeechTimeAPICalled == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    self->_activeRequestStopSpeechTimeAPICalled = v10;

    if (v4)
    {
      if (objc_msgSend(v4, "stopRecordingHostTime"))
      {
        v11 = objc_msgSend(v4, "stopRecordingHostTime");
        if (_AFMachAbsoluteTimeRate_onceToken == -1)
          goto LABEL_8;
      }
      else
      {
        objc_msgSend(v4, "activationEventTime");
        if (v13 > 0.0)
        {
          objc_msgSend(v4, "activationEventTime");
          goto LABEL_11;
        }
        if (!objc_msgSend(v4, "activationEventMachAbsoluteTime"))
          goto LABEL_12;
        v11 = objc_msgSend(v4, "activationEventMachAbsoluteTime");
        if (_AFMachAbsoluteTimeRate_onceToken == -1)
        {
LABEL_8:
          v12 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v11 / 1000000000.0;
LABEL_11:
          self->_activeRequestStopSpeechTimeRequested = v12;
          goto LABEL_12;
        }
      }
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
      goto LABEL_8;
    }
  }
LABEL_12:

}

- (void)updateSpeechOptions:(id)a3
{
  id v4;
  NSObject *v5;
  AFAnalytics *analytics;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  AFConnection *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[AFConnection updateSpeechOptions:]";
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v9, 0x20u);
  }
  analytics = self->_analytics;
  AFAnalyticsContextCreateWithSpeechRequestOptions(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFAnalytics logEventWithType:context:contextNoCopy:](analytics, "logEventWithType:context:contextNoCopy:", 1909, v7, 0);

  -[AFConnection _clientService](self, "_clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSpeechOptions:", v4);

}

- (void)rollbackClearContext
{
  id v2;

  -[AFConnection _clientService](self, "_clientService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackClearContext");

}

- (void)rollbackRequest
{
  void *v3;
  id v4;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v3);

  -[AFConnection _clientService](self, "_clientService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rollbackRequest");

}

- (BOOL)isRecording
{
  return (*((unsigned __int8 *)self + 216) >> 2) & 1;
}

- (BOOL)hasActiveRequest
{
  return self->_activeRequestType != 0;
}

- (BOOL)shouldSpeak
{
  return (*((unsigned __int8 *)self + 216) >> 1) & 1;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
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

- (void)sendGenericAceCommand:(id)a3
{
  -[AFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:](self, "sendGenericAceCommand:turnIdentifier:conflictHandler:", a3, 0, 0);
}

- (void)sendGenericAceCommand:(id)a3 conflictHandler:(id)a4
{
  -[AFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:](self, "sendGenericAceCommand:turnIdentifier:conflictHandler:", a3, 0, a4);
}

- (void)sendGenericAceCommand:(id)a3 turnIdentifier:(id)a4 conflictHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  id v34;
  id obj;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[AFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:]";
        v46 = 2112;
        v47 = v12;
        _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s passed command without ACE ID; inventing one (%@)",
          buf,
          0x16u);
      }
      objc_msgSend(v8, "setAceId:", v12);

    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v30 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "commands");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      v33 = *MEMORY[0x1E0D891D0];
      v31 = *MEMORY[0x1E0D891C8];
      v32 = isKindOfClass & 1;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(obj);
          v20 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v20, "encodedClassName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = v20;
            objc_opt_class();
            LOBYTE(v23) = objc_opt_isKindOfClass();
          }
          else
          {
            if ((objc_msgSend(v21, "isEqualToString:", v33) & 1) == 0
              && !objc_msgSend(v21, "isEqualToString:", v31))
            {
              LOBYTE(v23) = 0;
LABEL_22:
              v22 = 0;
              goto LABEL_25;
            }
            v23 = objc_opt_class();
            if (!v23)
              goto LABEL_22;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = v20;
            }
            else
            {
              v24 = objc_alloc((Class)v23);
              objc_msgSend(v20, "dictionary");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (id)objc_msgSend(v24, "initWithDictionary:", v25);

            }
            LOBYTE(v23) = 0;
          }
LABEL_25:

          if (!v22 || (v23 & 1) != 0)
          {
            if ((v23 & 1) != 0)
            {
              v26 = AFSiriLogContextConnection;
              if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v45 = "-[AFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:]";
                _os_log_impl(&dword_19AF50000, v26, OS_LOG_TYPE_INFO, "%s Performing BackgroundUpdateRequest outside normal request processing flow.", buf, 0xCu);
              }
              objc_msgSend(v20, "encodedClassName");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroundRequest:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroundRequest:analyticsEventProvider:", v27, 0, 0, 0, 1, 0);

            }
            -[AFConnection _clientService](self, "_clientService");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dictionary");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __69__AFConnection_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke;
            v36[3] = &unk_1E3A31538;
            v37 = v9;
            objc_msgSend(v28, "performGenericAceCommand:interruptOutstandingRequest:reply:", v29, v9 == 0, v36);

          }
          else
          {
            -[AFConnection _startRequestWithAceCommand:turnIdentifier:suppressAlert:](self, "_startRequestWithAceCommand:turnIdentifier:suppressAlert:", v22, v34, v32);
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v17);
    }

    v8 = v30;
  }

}

- (void)sendReplyCommand:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "refId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_replyHandlerForAceId, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
      -[NSMutableDictionary removeObjectForKey:](self->_replyHandlerForAceId, "removeObjectForKey:", v4);
    }

  }
}

- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getDeferredObjectsWithIdentifiers:completion:", v7, v6);

}

- (void)getCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke;
  v10[3] = &unk_1E3A31510;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getSerializedCachedObjectsWithIdentifiers:completion:", v7, v10);

}

- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__AFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke;
    v11[3] = &unk_1E3A35B08;
    v7 = v4;
    v12 = v7;
    -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __58__AFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke_2;
    v9[3] = &unk_1E3A2CC58;
    v10 = v7;
    objc_msgSend(v8, "getRemoteClockTimerSnapshotWithCompletion:", v9);

  }
}

- (void)clearContext
{
  id v2;

  -[AFConnection _clientService](self, "_clientService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearContext");

}

- (void)willSetApplicationContextWithRefId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willSetApplicationContextWithRefId:", v4);

}

- (void)setApplicationContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationContext:", v4);

}

- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAppicationContextForApplicationInfo:supplementalContext:refID:", v10, v9, v8);

}

- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAppicationContextForApplicationInfo:supplementalContext:refID:", v7, 0, v6);

}

- (void)setApplicationContextForApplicationInfos:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAppicationContextForApplicationInfo:supplementalContext:refID:", v4, 0, 0);

}

- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverriddenApplicationContext:withContext:", v7, v6);

}

- (void)setAlertContextWithBulletins:(id)a3
{
  NSArray *v4;
  NSArray *cachedBulletins;
  id v6;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  cachedBulletins = self->_cachedBulletins;
  self->_cachedBulletins = v4;

  -[AFConnection _clientService](self, "_clientService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlertContextDirty");

}

- (void)prepareForPhoneCall
{
  id v2;

  -[AFConnection _clientService](self, "_clientService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForPhoneCall");

}

- (void)telephonyRequestCompleted
{
  id v2;

  -[AFConnection _clientService](self, "_clientService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "telephonyRequestCompleted");

}

- (void)usefulUserResultWillPresent
{
  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1420, 0);
}

- (void)willPresentUsefulUserResultWithType:(int64_t)a3
{
  -[AFConnection willPresentUsefulUserResultWithType:forCommand:](self, "willPresentUsefulUserResultWithType:forCommand:", a3, 0);
}

- (void)willPresentUsefulUserResultWithType:(int64_t)a3 forCommand:(id)a4
{
  AFAnalytics *analytics;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t uufrID;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  analytics = self->_analytics;
  AFAnalyticsContextCreateWithCommand(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 1420, v7);

  if (self->_uufrID && self->_activeRequestUUID && self->_activeRequestType)
  {
    v8 = (id)AFSiriLogContextConnection;
    v9 = v8;
    uufrID = self->_uufrID;
    if (uufrID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      v11 = 136315394;
      v12 = "SiriX";
      v13 = 2080;
      v14 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_19AF50000, v9, OS_SIGNPOST_INTERVAL_END, uufrID, "UsefulUserFacingResults", "%s %s", (uint8_t *)&v11, 0x16u);
    }

  }
  -[AFConnection _willPresentUsefulUserResultWithType:](self, "_willPresentUsefulUserResultWithType:", a3);
}

- (void)checkLanguageReady:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __61__AFConnection_startAudioPlaybackRequest_options_completion___block_invoke;
  v16 = &unk_1E3A32F48;
  v17 = v8;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startAudioPlaybackRequest:options:reply:", v11, a4, v10, v13, v14, v15, v16);

}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopAudioPlaybackRequest:immediately:", v6, v4);

}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAllAudioPlaybackRequests:", v3);

}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSpeechSynthesisRecord:", v4);

}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adviseSessionArbiterToContinueWithPreviousWinner:", v3);

}

- (void)_speechRecordingDidFailWithError:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (self->_activeRequestType == 1)
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v5);

  }
  -[AFConnection _updateStateIfNotInSync](self, "_updateStateIfNotInSync");
  -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  -[AFConnection _tellSpeechDelegateRecordingDidFail:](self, "_tellSpeechDelegateRecordingDidFail:", v6);

}

- (void)_willStopRecordingWithSignpostID:(unint64_t)a3
{
  self->_uufrID = a3;
}

- (id)acquireUserInteractionAssertion
{
  return 0;
}

- (AFAssistantUIService)delegate
{
  return (AFAssistantUIService *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (AFSpeechDelegate)speechDelegate
{
  return (AFSpeechDelegate *)objc_loadWeakRetained((id *)&self->_speechDelegate);
}

- (void)setSpeechDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_speechDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_speechDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_siriClientStateManager, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_speechCallbackGroup, 0);
  objc_storeStrong((id *)&self->_lastRetryError, 0);
  objc_storeStrong((id *)&self->_interstitialCommandQueue, 0);
  objc_storeStrong((id *)&self->_interstitialProvider, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_playbackRoute, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_replyHandlerForAceId, 0);
  objc_storeStrong((id *)&self->_activeTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_activeRequestUUID, 0);
  objc_storeStrong((id *)&self->_cachedBulletins, 0);
  objc_storeStrong((id *)&self->_initiationCallSiteInfo, 0);
  objc_storeStrong((id *)&self->_outstandingRequestClass, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __61__AFConnection_startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1, void *a2)
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
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136315650;
    v8 = "-[AFConnection startAudioPlaybackRequest:options:completion:]_block_invoke";
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Fail to start audio playback request %{public}@ due to error %{public}@.", (uint8_t *)&v7, 0x20u);
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __58__AFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__AFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AFOneArgumentSafetyBlock *v4;
  uint64_t v5;
  AFOneArgumentSafetyBlock *v6;
  id INSerializedCacheItemClass;
  void *v8;
  void *v9;
  void *v10;
  AFOneArgumentSafetyBlock *v11;
  _QWORD v12[4];
  AFOneArgumentSafetyBlock *v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = [AFOneArgumentSafetyBlock alloc];
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke_2;
  v14[3] = &unk_1E3A2CC08;
  v15 = *(id *)(a1 + 32);
  v6 = -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](v4, "initWithBlock:defaultValue:", v14, MEMORY[0x1E0C9AA70]);
  INSerializedCacheItemClass = getINSerializedCacheItemClass();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke_3;
  v12[3] = &unk_1E3A2CC30;
  v13 = v6;
  v11 = v6;
  objc_msgSend(INSerializedCacheItemClass, "deserializeCacheItems:completion:", v10, v12);

}

uint64_t __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
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
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "cacheIdentifier", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", v4);
}

uint64_t __69__AFConnection_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AFAnalyticsContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v19[0] = CFSTR("unixTime");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("id");
  v20[0] = v7;
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(*(id *)(a1 + 40), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    v18[0] = v12;
    AFAnalyticsTurnContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge(v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  AFAnalyticsEventCreateCurrent(1904, v12);
  v16 = objc_claimAutoreleasedReturnValue();

  return v16;
}

void __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFConnection startAcousticIDRequestWithOptions:]_block_invoke_2";
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 7, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_303;
  block[3] = &unk_1E3A36B90;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

void __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_2_304(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_3;
  block[3] = &unk_1E3A36B90;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

uint64_t __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_303(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 48));
}

uint64_t __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AFAnalyticsContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v19[0] = CFSTR("unixTime");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("id");
  v20[0] = v7;
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(*(id *)(a1 + 40), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    v18[0] = v12;
    AFAnalyticsTurnContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge(v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  AFAnalyticsEventCreateCurrent(1903, v12);
  v16 = objc_claimAutoreleasedReturnValue();

  return v16;
}

void __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFConnection startSpeechPronunciationRequestWithOptions:pronunciationContext:]_block_invoke_2";
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 7, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_301;
  block[3] = &unk_1E3A36B90;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

void __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2_302(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_3;
  block[3] = &unk_1E3A36B90;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

uint64_t __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_301(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 48));
}

uint64_t __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AFAnalyticsContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v19[0] = CFSTR("unixTime");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("id");
  v20[0] = v7;
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(*(id *)(a1 + 40), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    v18[0] = v12;
    AFAnalyticsTurnContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge(v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  AFAnalyticsEventCreateCurrent(1902, v12);
  v16 = objc_claimAutoreleasedReturnValue();

  return v16;
}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke_2";
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 7, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_298;
  block[3] = &unk_1E3A36B90;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2_299(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_3;
  block[3] = &unk_1E3A36B90;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  v4 = v3;

  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v12 = "-[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke_5";
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Continuing pending speech request %p", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_300;
  v9[3] = &unk_1E3A36A00;
  v7 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v7, "_clientServiceWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "continuePendingSpeechRequestWithId:fromTimestamp:", *(_QWORD *)(a1 + 56), v4);

  objc_msgSend(*(id *)(a1 + 48), "invoke");
}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_300(uint64_t a1, void *a2)
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
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke";
    v8 = 2048;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Failed continuing pending speech request %p %{public}@", (uint8_t *)&v6, 0x20u);
  }

}

uint64_t __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

uint64_t __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_298(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 48));
}

uint64_t __38__AFConnection__startRequestWithInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "activationEvent");
  if ((unint64_t)(v3 - 2) > 3)
    v4 = 1901;
  else
    v4 = qword_19B0ED5E8[v3 - 2];
  v20 = v4;
  AFAnalyticsContextCreateWithRequestInfo(*(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v23[0] = CFSTR("unixTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v23[1] = CFSTR("id");
  objc_msgSend(v21, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v23[2] = CFSTR("systemVersion");
  AFProductAndBuildVersion();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  objc_msgSend(*(id *)(a1 + 40), "_startRequestMetricSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    v22[0] = v14;
    AFAnalyticsTurnContextCreateWithRequestInfo(*(void **)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge(v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  AFAnalyticsEventCreateCurrent(v20, v14);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activationEvent");

  return v18;
}

void __38__AFConnection__startRequestWithInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFConnection _startRequestWithInfo:]_block_invoke_2";
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 7, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AFConnection__startRequestWithInfo___block_invoke_284;
  block[3] = &unk_1E3A36B90;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

void __38__AFConnection__startRequestWithInfo___block_invoke_2_285(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  _QWORD block[5];
  id v11;
  __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = &stru_1E3A37708;
    if (v3)
      v5 = v3;
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFConnection _startRequestWithInfo:]_block_invoke_2";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Complete %@", buf, 0x16u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AFConnection__startRequestWithInfo___block_invoke_288;
  block[3] = &unk_1E3A36B90;
  block[4] = v6;
  v11 = v7;
  v12 = v3;
  v9 = v3;
  dispatch_async(v8, block);

}

uint64_t __38__AFConnection__startRequestWithInfo___block_invoke_288(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

uint64_t __38__AFConnection__startRequestWithInfo___block_invoke_284(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 48));
}

uint64_t __43__AFConnection_setDeviceRingerSwitchState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceRingerSwitchState:", *(_QWORD *)(a1 + 32));
}

uint64_t __38__AFConnection_setAccessibilityState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessibilityState:", *(_QWORD *)(a1 + 32));
}

uint64_t __38__AFConnection_setWatchAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsDeviceWatchAuthenticated:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __74__AFConnection_setAnnouncementRequestsPermittedByPresentationWhileActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAreAnnouncementRequestsPermittedByPresentationWhileActive:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __32__AFConnection_setCarDNDActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsDeviceInCarDNDMode:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __46__AFConnection_setSupportsCarPlayVehicleData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportsCarPlayVehicleData:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __39__AFConnection_setIsDeviceInStarkMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsDeviceInStarkMode:", *(unsigned __int8 *)(a1 + 32));
}

void __29__AFConnection_willPresentUI__block_invoke()
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
    v2 = "-[AFConnection willPresentUI]_block_invoke";
    _os_log_impl(&dword_19AF50000, v0, OS_LOG_TYPE_INFO, "%s Received reply.", (uint8_t *)&v1, 0xCu);
  }
}

void __54__AFConnection_resumeInterruptedAudioPlaybackIfNeeded__block_invoke(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[AFConnection resumeInterruptedAudioPlaybackIfNeeded]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __64__AFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__AFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
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
    v6 = "-[AFConnection forceAudioSessionInactiveWithOptions:completion:]_block_invoke_2";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  unint64_t *v10;
  unint64_t v11;
  AFSafetyBlock *v12;
  uint64_t v13;
  AFSafetyBlock *v14;
  uint64_t v15;
  void (*v16)(uint64_t, id, _QWORD *);
  AFSafetyBlock *v17;
  _QWORD v18[4];
  AFSafetyBlock *v19;
  _QWORD v20[5];
  id v21;
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v25 = "-[AFConnection acquireAudioSessionWithContext:completion:]_block_invoke";
    v26 = 2048;
    v27 = v5;
    v28 = 2114;
    v29 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", buf, 0x20u);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "reason");
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

    v9 = v6 == 3;
    if (v9 && !v7)
    {
      v10 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 344);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      if (!v11)
        objc_msgSend(*(id *)(a1 + 48), "beginSpeakingForClient:", *(_QWORD *)(a1 + 32));
    }
    v12 = [AFSafetyBlock alloc];
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke_273;
    v20[3] = &unk_1E3A2CB00;
    v22 = v9;
    v23 = v8;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = *(id *)(a1 + 48);
    v14 = -[AFSafetyBlock initWithBlock:](v12, "initWithBlock:", v20);
    v15 = *(_QWORD *)(a1 + 56);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke_2;
    v18[3] = &unk_1E3A36F30;
    v19 = v14;
    v16 = *(void (**)(uint64_t, id, _QWORD *))(v15 + 16);
    v17 = v14;
    v16(v15, v3, v18);

  }
}

uint64_t __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke_273(uint64_t result)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;

  if (*(_BYTE *)(result + 48) && !*(_BYTE *)(result + 49))
  {
    v1 = (unint64_t *)(*(_QWORD *)(result + 32) + 344);
    do
    {
      v2 = __ldaxr(v1);
      v3 = v2 - 1;
    }
    while (__stlxr(v3, v1));
    if (!v3)
      return objc_msgSend(*(id *)(result + 40), "endSpeakingForClient:", *(_QWORD *)(result + 32));
  }
  return result;
}

uint64_t __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", 0);
}

void __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke(uint64_t a1, void *a2)
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
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 136315650;
    v8 = "-[AFConnection forceAudioSessionActiveWithContext:completion:]_block_invoke";
    v9 = 2048;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEFAULT, "%s %p %@", (uint8_t *)&v7, 0x20u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[AFConnection forceAudioSessionActiveWithContext:completion:]_block_invoke_2";
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_268;
  v8[3] = &unk_1E3A2CAB0;
  v9 = v3;
  v6 = v3;
  v7 = +[AFSetAudioSessionActiveResult newWithBuilder:](AFSetAudioSessionActiveResult, "newWithBuilder:", v8);
  objc_msgSend(v5, "invokeWithValue:", v7);

}

uint64_t __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2_271(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

void __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_268(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setAudioSessionID:", 0);
  +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 7, CFSTR("XPC connection encountered an error during -forceAudioSessionActive."), *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setError:", v4);

}

void __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_263(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setAudioSessionID:", 0);
  +[AFError errorWithCode:description:](AFError, "errorWithCode:description:", 40, CFSTR("Safety completion of -forceAudioSessionActive is deallocated without invocation."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

void __90__AFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[5];
  v4 = a2;
  objc_msgSend(v4, "setOptions:", v3);
  objc_msgSend(v4, "setReason:", a1[6]);
  objc_msgSend(v4, "setSpeechRequestOptions:", a1[4]);

}

void __90__AFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "audioSessionID");
    objc_msgSend(v3, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

uint64_t __51__AFConnection_boostedPreheatWithStyle_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __113__AFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v10 = 136315394;
      v11 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:complet"
            "ion:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s interstitialReply = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v6)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:complet"
            "ion:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s interstitialError = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

id __42__AFConnection__willFailRequestWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  double *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  _AFConnectionGetBucketStringFromTimeIntervals(*(double *)(*(_QWORD *)(a1 + 32) + 152), *(double *)(*(_QWORD *)(a1 + 32) + 168));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double **)(a1 + 32);
  v4 = v3[18];
  if (v4 == 0.0)
    v4 = v3[19];
  v5 = v3[20];
  if (v5 == 0.0)
    v5 = v3[21];
  _AFConnectionGetBucketStringFromTimeIntervals(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", v6))
    v7 = v2;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@,%@"), v2, v6);
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SpeechErrorHints[StartStopSpeechDelta:%@]"), v7);
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __42__AFConnection__willFailRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  int v8;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SiriSpeechErrorDomain"));

  if (!v4)
  {
    objc_msgSend(v2, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("kAFAssistantErrorDomain"));

    if (v8)
    {
      v6 = objc_msgSend(v2, "code") == 211;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v2, "code");
  if (v5 != 1 && v5 != 201 && v5 != 102)
    goto LABEL_8;
  v6 = 1;
LABEL_9:

  return v6;
}

void __28__AFConnection__updateState__block_invoke(uint64_t a1, char a2, int a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  int v6;
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__AFConnection__updateState__block_invoke_2;
  v5[3] = &unk_1E3A33180;
  v5[4] = v3;
  v7 = a2;
  v6 = a3;
  dispatch_async(v4, v5);
}

uint64_t __28__AFConnection__updateState__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) |= 1u;
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = *(unsigned __int8 *)(a1 + 44);
    v5 = v2;
    objc_msgSend(v3, "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[AFConnection _updateState]_block_invoke_2";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Updated internal state. ShouldSpeak %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setShouldSpeak:", *(unsigned __int8 *)(a1 + 44));
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = *(unsigned int *)(a1 + 40);
    v10 = v7;
    objc_msgSend(v8, "numberWithUnsignedInt:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[AFConnection _updateState]_block_invoke";
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s Updated internal state. AudioSessionID %@", (uint8_t *)&v13, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", *(unsigned int *)(a1 + 40));
}

void __34__AFConnection__fetchShouldSpeak___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AFConnection__fetchShouldSpeak___block_invoke_2;
  block[3] = &unk_1E3A356F8;
  v7 = a2;
  block[4] = v2;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __34__AFConnection__fetchShouldSpeak___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t result;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = *(unsigned __int8 *)(a1 + 48);
    v5 = v2;
    objc_msgSend(v3, "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFConnection _fetchShouldSpeak:]_block_invoke_2";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Updated internal state. ShouldSpeak %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setShouldSpeak:", *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

void __65__AFConnection__startRequestTimeoutTimerWithTimeInterval_reason___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invokeRequestTimeoutForReason:", v2);

}

void __27__AFConnection__connection__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AFConnection__connection__block_invoke_2;
  block[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __27__AFConnection__connection__block_invoke_209(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AFConnection__connection__block_invoke_2_210;
  block[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __27__AFConnection__connection__block_invoke_2_210(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id *v4;
  id WeakRetained;
  id v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[AFConnection _connection]_block_invoke_2";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Connection interrupted", (uint8_t *)&v8, 0xCu);
  }
  +[AFError errorWithCode:](AFError, "errorWithCode:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_connectionFailedWithError:", v3);

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "_updateState");

  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "_updateClientConfiguration");

}

void __27__AFConnection__connection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id *v4;
  id WeakRetained;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[AFConnection _connection]_block_invoke_2";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Connection invalidated", (uint8_t *)&v7, 0xCu);
  }
  +[AFError errorWithCode:](AFError, "errorWithCode:", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_connectionFailedWithError:", v3);

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "_clearConnection");

}

uint64_t __108__AFConnection_interstitialProvider_handlePhase_displayText_speakableText_expectedDelay_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (!+[AFFeatureFlags isStateFeedbackEnabled](AFFeatureFlags, "isStateFeedbackEnabled"))
    return objc_msgSend(*(id *)(a1 + 32), "_handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(double *)(a1 + 88));
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __52__AFConnection_deviceRingerObserver_didChangeState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceRingerSwitchState:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__AFConnection_accessibilityObserver_stateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessibilityState:", *(_QWORD *)(a1 + 40));
}

void __54__AFConnection__tellSpeechDelegateRecognitionDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecognitionDidFail:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __65__AFConnection__tellSpeechDelegateSpeechRecognizedPartialResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecognizedPartialResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__AFConnection__tellSpeechDelegateRecognitionUpdateWillBeginForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:recognitionUpdateWillBeginForTask:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __89__AFConnection__tellSpeechDelegateRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:recognitionUpdateWithPhrases:utterances:refId:", a1[4], a1[5], a1[6], a1[7]);

}

void __82__AFConnection__tellSpeechDelegateRecognizedAdditionalSpeechInterpretation_refId___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:recognizedAdditionalSpeechInterpretation:refId:", a1[4], a1[5], a1[6]);

}

void __52__AFConnection__tellSpeechDelegateSpeechRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecognized:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__AFConnection__tellSpeechDelegateRecordingDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecordingDidFail:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __53__AFConnection__tellSpeechDelegateRecordingDidCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnectionSpeechRecordingDidCancel:", *(_QWORD *)(a1 + 32));

}

void __50__AFConnection__tellSpeechDelegateRecordingDidEnd__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnectionSpeechRecordingDidEnd:", *(_QWORD *)(a1 + 32));

}

void __72__AFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 64);
  if (v5 == 1 && !*(_QWORD *)(v4 + 72))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __72__AFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke_2;
      v12[3] = &unk_1E3A2C880;
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 48);
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v3, "assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:", v9, v10, v12);

      goto LABEL_6;
    }
    v6 = *(_QWORD *)(a1 + 40);
    if (!v6)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Speech delegate %@ is incapable of performing two-shot prompt."), v3, v11);
    goto LABEL_5;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Active request type is %ld and active request UUFR type is %ld, two-shot prompt is ignored."), v5, *(_QWORD *)(v4 + 72));
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 15, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, double, double))(v6 + 16))(v6, v8, 0.0, 0.0);

  }
LABEL_6:

}

uint64_t __72__AFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __63__AFConnection__tellSpeechDelegateRecordingDidDetectStartpoint__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnectionSpeechRecordingDidDetectStartpoint:", *(_QWORD *)(a1 + 32));

}

void __67__AFConnection__tellSpeechDelegateRecordingDidChangeAVRecordRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecordingDidChangeAVRecordRoute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __83__AFConnection__tellSpeechDelegateRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assistantConnection:speechRecordingDidBeginOnAVRecordRoute:audioSessionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assistantConnection:speechRecordingDidBeginOnAVRecordRoute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __83__AFConnection__tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assistantConnection:speechRecordingWillBeginWithInputAudioPowerXPCWrapper:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assistantConnectionSpeechRecordingWillBegin:", *(_QWORD *)(a1 + 32));
  }

}

void __44__AFConnection__dispatchCallbackGroupBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

void __41__AFConnection__updateSpeechEndHostTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnectionUpdatedSpeechEndEstimate:speechEndEstimate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __35__AFConnection__setAudioSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellDelegateAudioSessionIDChanged:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 220));
}

void __59__AFConnection__startInputAudioPowerUpdatesWithXPCWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 30);
    if (v3)
    {
      objc_msgSend(v3, "beginUpdate");
      v4 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v5 = 136315138;
        v6 = "-[AFConnection _startInputAudioPowerUpdatesWithXPCWrapper:]_block_invoke";
        _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Started input audio power updates.", (uint8_t *)&v5, 0xCu);
      }
    }
  }

}

uint64_t __32__AFConnection__setShouldSpeak___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellDelegateShouldSpeakChanged:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 216) >> 1) & 1);
}

void __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char *v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  double v50;
  double v51;
  NSObject *v52;
  uint64_t v53;
  unint64_t v54;
  double v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  char isKindOfClass;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  objc_class *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  os_signpost_id_t v91;
  char *v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  _QWORD v98[5];
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  os_signpost_id_t v103;
  char v104;
  uint8_t buf[4];
  const char *v106;
  __int16 v107;
  const char *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  AFAnalyticsContextCreateWithCommand(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 328), "logEventWithType:context:contextNoCopy:", 1421, v2, 1);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "encodedClassName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v7 = v4;
    objc_msgSend(v6, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ConvertIdToSchemaUUID(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0D99F00]);
      v11 = objc_alloc_init(MEMORY[0x1E0D99F10]);
      objc_msgSend(v11, "setRequestId:", v9);
      objc_msgSend(v10, "setEventMetadata:", v11);
      v96 = v2;
      v12 = objc_alloc_init(MEMORY[0x1E0D99EC0]);
      v13 = objc_alloc_init(MEMORY[0x1E0D99ED0]);
      objc_msgSend(v13, "setAceCommandType:", 2);
      objc_msgSend(v13, "setAceCommandName:", v7);
      objc_msgSend(v12, "setStartedOrChanged:", v13);
      _ConvertIdToSchemaUUID(v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAceId:", v14);

      objc_msgSend(v10, "setAceCommandContext:", v12);
      objc_msgSend(MEMORY[0x1E0D978A0], "sharedStream");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "emitMessage:", v10);

      v2 = v96;
    }
    else
    {
      v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v106 = "_EmitAceCommandStartedEvent";
        v107 = 2112;
        v108 = (const char *)v6;
        _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s The requestId=%@ is malformed, unable to log SELF command", buf, 0x16u);
      }
    }

  }
  v17 = os_signpost_id_generate((os_log_t)AFSiriLogContextPerformance);
  v18 = (id)AFSiriLogContextPerformance;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 136315394;
    v106 = "SiriX";
    v107 = 2080;
    v108 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_19AF50000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "UICommandHandle", "%s %s", buf, 0x16u);
  }

  if (!*(_BYTE *)(a1 + 88))
  {
    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(void **)(v24 + 200);
    if (!v25)
      goto LABEL_70;
    v26 = *(void **)(a1 + 32);
    v27 = *(id *)(v24 + 328);
    v28 = v26;
    v29 = v25;
    v30 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v28, "af_dialogPhase");
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      v32 = AFSiriLogContextConnection;
      v97 = v2;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v106 = "_LogUUFRReadyConditionally";
        v107 = 2112;
        v108 = v31;
        _os_log_impl(&dword_19AF50000, v32, OS_LOG_TYPE_INFO, "%s Logging uufr for phase= %@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_69;
      }
      v97 = v2;
      v31 = 0;
    }
    v57 = objc_alloc_init(MEMORY[0x1E0D9A4D8]);
    v92 = v31;
    objc_msgSend(v57, "setDialogPhase:", objc_msgSend(v31, "UEIUUFRReadyDialogPhase"));
    v93 = v30;
    v58 = v30;
    v95 = v28;
    v59 = v28;
    v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_opt_class();
    v94 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v91 = v17;
      v61 = v27;
      v62 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v59, "groupIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "encodedClassName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringWithFormat:", CFSTR("%@.%@"), v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "objectForKey:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v66;
      if (v66)
      {
        objc_msgSend(v66, "objectForKey:", CFSTR("dialogIdentifiers"));
        v68 = objc_claimAutoreleasedReturnValue();

        v60 = (id)v68;
      }

      v27 = v61;
      v17 = v91;
    }

    objc_msgSend(v57, "setDialogIdentifiers:", v60);
    v69 = v58;
    v70 = v59;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v69, "objectForKey:", CFSTR("com.apple.ace.assistant.AddViews"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectForKey:", CFSTR("views"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (v73 && objc_msgSend(v73, "count"))
      {
        objc_msgSend(v74, "objectAtIndex:", 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        _ExtractAceViewId(v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v76 = 0;
      }

    }
    else
    {
      v76 = 0;
    }

    objc_msgSend(v57, "setAceViewId:", v76);
    objc_msgSend(v57, "setUufrReadySource:", 1);
    v82 = (objc_class *)objc_opt_class();
    NSStringFromClass(v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setAceCommandClass:", v83);

    objc_msgSend(v70, "aceId");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    _ConvertIdToSchemaUUID(v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setAceCommandId:", v85);

    v29 = v94;
    objc_msgSend(v27, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v57, mach_absolute_time(), v94);

    v28 = v95;
    v2 = v97;
    v30 = v93;
LABEL_69:

    if (!*(_BYTE *)(a1 + 88))
      goto LABEL_70;
  }
  v20 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v21 = *(_QWORD *)(a1 + 64);
    v22 = v20;
    if (v21 > 4)
      v23 = CFSTR("(unknown)");
    else
      v23 = off_1E3A32208[v21];
    v33 = v23;
    *(_DWORD *)buf = 136315394;
    v106 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
    v107 = 2112;
    v108 = (const char *)v33;
    _os_log_impl(&dword_19AF50000, v22, OS_LOG_TYPE_INFO, "%s interstitialPhase = %@", buf, 0x16u);

  }
  v34 = *(void **)(a1 + 40);
  NSStringFromSelector(*(SEL *)(a1 + 72));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_pauseRequestTimeoutForReason:", v35);

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal && *(_QWORD *)(a1 + 64) == 1)
  {
    v36 = mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v38 = v37;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "systemUptime");
    v41 = v40;

    *(double *)(*(_QWORD *)(a1 + 40) + 192) = v38;
    v42 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v43 = *(const char **)(a1 + 80);
      *(_DWORD *)buf = 136315394;
      v106 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      v107 = 2048;
      v108 = v43;
      _os_log_impl(&dword_19AF50000, v42, OS_LOG_TYPE_INFO, "%s interstitialDelay = %f (expected)", buf, 0x16u);
    }
    v44 = *(_QWORD *)(a1 + 40);
    v45 = *(_QWORD *)(v44 + 64);
    v46 = 0.0;
    if (v45 == 2)
    {
      v77 = *(double *)(v44 + 120);
      if (v77 > 0.0)
      {
        v78 = v41 - v77;
        v79 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v106 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          v107 = 2048;
          v108 = *(const char **)&v78;
          _os_log_impl(&dword_19AF50000, v79, OS_LOG_TYPE_INFO, "%s durationFromRequestBegin = %f", buf, 0x16u);
        }
        v46 = fmax(v78, 0.0);
      }
    }
    else if (v45 == 1)
    {
      v47 = *(double *)(v44 + 176);
      if (v47 > 0.0)
      {
        v48 = v38 - v47;
        v49 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v106 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          v107 = 2048;
          v108 = *(const char **)&v48;
          _os_log_impl(&dword_19AF50000, v49, OS_LOG_TYPE_INFO, "%s durationFromSpeechRecordingEnd = %f", buf, 0x16u);
          v44 = *(_QWORD *)(a1 + 40);
        }
        v46 = fmax(v48, 0.0);
      }
      v50 = *(double *)(v44 + 184);
      if (v50 > 0.0)
      {
        v51 = v38 - v50;
        v52 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v106 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          v107 = 2048;
          v108 = *(const char **)&v51;
          _os_log_impl(&dword_19AF50000, v52, OS_LOG_TYPE_INFO, "%s durationFromSpeechRecognition = %f", buf, 0x16u);
          v44 = *(_QWORD *)(a1 + 40);
        }
        v46 = fmax(v46, v51);
      }
      v53 = *(_QWORD *)(v44 + 128);
      if (v53)
      {
        v54 = v36 - v53;
        if (_AFMachAbsoluteTimeRate_onceToken != -1)
          dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
        v55 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v54 / 1000000000.0;
        v56 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v106 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          v107 = 2048;
          v108 = *(const char **)&v55;
          _os_log_impl(&dword_19AF50000, v56, OS_LOG_TYPE_INFO, "%s durationFromSpeechEnd = %f", buf, 0x16u);
        }
        v46 = fmax(v46, v55);
      }
    }
    v80 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v106 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      v107 = 2048;
      v108 = *(const char **)&v46;
      _os_log_impl(&dword_19AF50000, v80, OS_LOG_TYPE_INFO, "%s interstitialDelay = %f (actual)", buf, 0x16u);
    }
    if (v46 < *(double *)(a1 + 80) + -0.2)
    {
      v81 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v106 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
        _os_log_error_impl(&dword_19AF50000, v81, OS_LOG_TYPE_ERROR, "%s Initial interstitial fired too early!", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 40), "reportIssueForType:subtype:context:", CFSTR("Interstitial"), CFSTR("Early Fire"), 0);
    }
  }
LABEL_70:
  v87 = *(_QWORD *)(a1 + 32);
  v86 = *(_QWORD *)(a1 + 40);
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_99;
  v98[3] = &unk_1E3A2C740;
  v104 = *(_BYTE *)(a1 + 88);
  v88 = *(_QWORD *)(a1 + 72);
  v98[4] = v86;
  v102 = v88;
  v89 = *(void **)(a1 + 48);
  v101 = *(id *)(a1 + 56);
  v99 = v2;
  v100 = *(id *)(a1 + 32);
  v103 = v17;
  v90 = v2;
  objc_msgSend(v89, "assistantConnection:receivedCommand:completion:", v86, v87, v98);

}

void __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_102(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72) && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v9 = 136315394;
      v10 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Drop command %@ because UUFR has been presented.", (uint8_t *)&v9, 0x16u);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      +[AFError errorWithCode:](AFError, "errorWithCode:", 38);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);
LABEL_12:

    }
  }
  else
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 136315394;
      v10 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Dispatching command %@", (uint8_t *)&v9, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (!*(_BYTE *)(a1 + 72))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = *(void **)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_cancelRequestTimeoutForReason:", v5);
        goto LABEL_12;
      }
    }
  }
}

void __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2;
  block[3] = &unk_1E3A2C718;
  v17 = *(_BYTE *)(a1 + 80);
  block[4] = v4;
  v10 = *(_OWORD *)(a1 + 56);
  v6 = (id)v10;
  v15 = v10;
  v12 = v3;
  v13 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 72);
  v14 = v7;
  v16 = v8;
  v9 = v3;
  dispatch_async(v5, block);

}

void __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 88))
  {
    v2 = *(void **)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_resumeRequestTimeoutForReason:", v3);

  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 40), 0);
  v5 = *(void **)(a1 + 40);
  v24[0] = *(_QWORD *)(a1 + 48);
  AFAnalyticsContextCreateWithCommand(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "logEventWithType:context:contextNoCopy:", 1422, v8, 1, v24[0]);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 56), "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ConvertIdToSchemaUUID(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0D99F00]);
      v15 = objc_alloc_init(MEMORY[0x1E0D99F10]);
      objc_msgSend(v15, "setRequestId:", v13);
      objc_msgSend(v14, "setEventMetadata:", v15);
      v16 = objc_alloc_init(MEMORY[0x1E0D99EC0]);
      v17 = objc_alloc_init(MEMORY[0x1E0D99EC8]);
      objc_msgSend(v17, "setExists:", 1);
      objc_msgSend(v17, "setAceCommandType:", 2);
      objc_msgSend(v16, "setEnded:", v17);
      _ConvertIdToSchemaUUID(v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAceId:", v18);

      objc_msgSend(v14, "setAceCommandContext:", v16);
      objc_msgSend(MEMORY[0x1E0D978A0], "sharedStream");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "emitMessage:", v14);

    }
    else
    {
      v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "_EmitAceCommandEndedEvent";
        v27 = 2112;
        v28 = (const char *)v11;
        _os_log_error_impl(&dword_19AF50000, v20, OS_LOG_TYPE_ERROR, "%s The requestId=%@ is malformed, unable to log SELF command", buf, 0x16u);
      }
    }

  }
  v21 = (id)AFSiriLogContextPerformance;
  v22 = v21;
  v23 = *(_QWORD *)(a1 + 80);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "SiriX";
    v27 = 2080;
    v28 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_19AF50000, v22, OS_SIGNPOST_INTERVAL_END, v23, "UICommandHandle", "%s %s", buf, 0x16u);
  }

}

void __52__AFConnection_initWithTargetQueue_instanceContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImagePath:", v3);
  objc_msgSend(v4, "setSymbolName:", *(_QWORD *)(a1 + 40));

}

+ (void)initialize
{
  if (AFLogInitIfNeeded_once != -1)
    dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2748);
}

+ (BOOL)assistantIsSupportedForLanguageCode:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  if (AFAssistantCapable_onceToken != -1)
    dispatch_once(&AFAssistantCapable_onceToken, &__block_literal_global_39_40088);
  if (AFAssistantCapable_isCapable)
  {
    +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLocaleIdentifierNativelySupported:", v5);

    if ((v7 & 1) != 0)
    {
      v8 = 0;
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
    v9 = 401;
  }
  else
  {
    v9 = 400;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), v9, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v8);
LABEL_11:

  return v8 == 0;
}

+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 deviceProductVersion:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "siriIsSupportedForLanguageCode:productName:productVersion:error:", a3, 0, a4, a5);
}

+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 productName:(id)a4 productVersion:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 402, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a6)
      goto LABEL_7;
LABEL_6:
    *a6 = objc_retainAutorelease(v14);
    goto LABEL_7;
  }
  AFPreferencesSupportedLanguagesForRemote(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v9) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 401, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a6)
    goto LABEL_6;
LABEL_7:

  return v14 == 0;
}

+ (BOOL)assistantIsSupported
{
  if (AFAssistantCapable_onceToken != -1)
    dispatch_once(&AFAssistantCapable_onceToken, &__block_literal_global_39_40088);
  return AFAssistantCapable_isCapable;
}

+ (void)beginMonitoringAvailability
{
  AFConnectionAvailabilityObserver *v2;
  void *v3;
  id v4;

  if (!sAvailabilityObserver)
  {
    v2 = objc_alloc_init(AFConnectionAvailabilityObserver);
    v3 = (void *)sAvailabilityObserver;
    sAvailabilityObserver = (uint64_t)v2;

    +[AFNetworkAvailability sharedAvailability](AFNetworkAvailability, "sharedAvailability");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", sAvailabilityObserver);

  }
}

+ (BOOL)isNetworkAvailable
{
  void *v2;
  char v3;

  if (!sAvailabilityObserver)
    objc_msgSend(a1, "beginMonitoringAvailability");
  +[AFNetworkAvailability sharedAvailability](AFNetworkAvailability, "sharedAvailability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAvailable");

  return v3;
}

+ (BOOL)isAvailable
{
  NSObject *v2;
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (+[AFConnection isNetworkAvailable](AFConnection, "isNetworkAvailable"))
  {
    v2 = AFSiriLogContextConnection;
    LOBYTE(v3) = 1;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "+[AFConnection isAvailable]";
      _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Network is available. Evaluating AFConnection as available.", (uint8_t *)&v10, 0xCu);
    }
    return v3;
  }
  if (AFDeviceSupportsSiriUOD())
  {
    +[AFConnection currentLanguageCode](AFConnection, "currentLanguageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[AFFeatureFlags isSiriUODAvailableForLanguage:](AFFeatureFlags, "isSiriUODAvailableForLanguage:", v4);
    v5 = AFSiriLogContextConnection;
    v6 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        v10 = 136315394;
        v11 = "+[AFConnection isAvailable]";
        v12 = 2112;
        v13 = v4;
        v7 = "%s Network is not available but device supports Understanding On Device for %@. Evaluating AFConnection as available.";
LABEL_13:
        _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, 0x16u);
      }
    }
    else if (v6)
    {
      v10 = 136315394;
      v11 = "+[AFConnection isAvailable]";
      v12 = 2112;
      v13 = v4;
      v7 = "%s Network is not available and language %@ is not supported for Understanding On Device. Evaluating AFConnec"
           "tion as NOT available.";
      goto LABEL_13;
    }

    return v3;
  }
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "+[AFConnection isAvailable]";
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Network is not available and device does not support Understanding On Device. Evaluating AFConnection as NOT available.", (uint8_t *)&v10, 0xCu);
  }
  LOBYTE(v3) = 0;
  return v3;
}

+ (void)stopMonitoringAvailability
{
  void *v2;
  void *v3;

  if (sAvailabilityObserver)
  {
    +[AFNetworkAvailability sharedAvailability](AFNetworkAvailability, "sharedAvailability");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:", sAvailabilityObserver);

    v3 = (void *)sAvailabilityObserver;
    sAvailabilityObserver = 0;

  }
}

+ (id)currentLanguageCode
{
  void *v2;
  void *v3;

  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)outputVoice
{
  void *v2;
  void *v3;

  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)defrost
{
  NSObject *v2;
  _xpc_connection_s *mach_service;
  xpc_object_t v4;
  uint64_t v5;
  _xpc_connection_s *v6;
  _QWORD barrier[4];
  _xpc_connection_s *v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "+[AFConnection defrost]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Begin sending defrost XPC message.", buf, 0xCu);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.assistant.sync", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_252);
  xpc_connection_resume(mach_service);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "name", "defrost");
  v5 = mach_absolute_time();
  xpc_dictionary_set_uint64(v4, "mach_time", v5);
  xpc_connection_send_message(mach_service, v4);
  barrier[0] = MEMORY[0x1E0C809B0];
  barrier[1] = 3221225472;
  barrier[2] = __23__AFConnection_defrost__block_invoke_2;
  barrier[3] = &unk_1E3A36F30;
  v8 = mach_service;
  v6 = mach_service;
  xpc_connection_send_barrier(v6, barrier);

}

void __23__AFConnection_defrost__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  v1 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "+[AFConnection defrost]_block_invoke_2";
    _os_log_impl(&dword_19AF50000, v1, OS_LOG_TYPE_INFO, "%s End sending defrost XPC message.", (uint8_t *)&v2, 0xCu);
  }
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3
{
  -[AFConnection startSpeechRequestWithSpeechFileAtURL:isNarrowBand:](self, "startSpeechRequestWithSpeechFileAtURL:isNarrowBand:", a3, 0);
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  v6 = a3;
  -[AFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__AFConnection_Private__startSpeechRequestWithSpeechFileAtURL_isNarrowBand___block_invoke;
  v8[3] = &unk_1E3A2CC80;
  v9 = v4;
  v8[4] = self;
  -[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 1, 0, 0, v8);
  -[AFConnection _clientService](self, "_clientService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_startSpeechWithURL:isNarrowBand:", v6, v4);

}

- (void)requestBarrier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AFConnection_Private__requestBarrier___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_requestBarrierWithReply:", v5);

}

- (void)requestBarrierIfNecessary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__AFConnection_Private__requestBarrierIfNecessary___block_invoke;
  v7[3] = &unk_1E3A35B08;
  v8 = v4;
  v5 = v4;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_requestBarrierIfNecessaryWithReply:", v5);

}

- (void)broadcastCommandDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_broadcastCommandDictionary:", v4);

}

uint64_t __51__AFConnection_Private__requestBarrierIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __40__AFConnection_Private__requestBarrier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__AFConnection_Private__startSpeechRequestWithSpeechFileAtURL_isNarrowBand___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16[0] = CFSTR("File");
  v15[0] = CFSTR("speechEvent");
  v15[1] = CFSTR("isNarrowBand");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("unixTime");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = CFSTR("id");
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(*(id *)(a1 + 32), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsEventCreateCurrent(1902, v12);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_activeRequestUUID
{
  return self->_activeRequestUUID;
}

- (void)_barrier
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;

  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__AFConnection_Internal___barrier__block_invoke;
  v11[3] = &unk_1E3A36A00;
  v5 = v3;
  v12 = v5;
  -[AFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __34__AFConnection_Internal___barrier__block_invoke_2;
  v9[3] = &unk_1E3A36F30;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "_barrierWithReply:", v9);

  v8 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v7, v8);

}

- (void)_clearAssistantInfoForAccountWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_clearAssistantInfoForAccountIdentifier:", v4);

}

- (id)_clientService
{
  void *v2;
  void *v3;

  -[AFConnection _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_clientServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cachedBulletins
{
  return self->_cachedBulletins;
}

- (id)_clientConfiguration
{
  AFClientConfiguration *clientConfiguration;
  void *v4;
  void *v5;
  AFClientConfiguration *v6;
  void *v7;
  AFClientConfiguration *v8;
  AFClientConfiguration *v9;
  uint64_t v11;

  clientConfiguration = self->_clientConfiguration;
  if (!clientConfiguration)
  {
    +[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFDeviceRingerSwitchObserver sharedObserver](AFDeviceRingerSwitchObserver, "sharedObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [AFClientConfiguration alloc];
    objc_msgSend(v4, "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    v8 = -[AFClientConfiguration initWithAccessibilityState:deviceRingerSwitchState:isDeviceInCarDNDMode:isDeviceInStarkMode:supportsCarPlayVehicleData:isDeviceWatchAuthenticated:areAnnouncementRequestsPermittedByPresentationWhileActive:outputVolume:tapToSiriAudioPlaybackRequest:twoShotAudioPlaybackRequest:deviceSetupFlowBeginDate:deviceSetupFlowEndDate:](v6, "initWithAccessibilityState:deviceRingerSwitchState:isDeviceInCarDNDMode:isDeviceInStarkMode:supportsCarPlayVehicleData:isDeviceWatchAuthenticated:areAnnouncementRequestsPermittedByPresentationWhileActive:outputVolume:tapToSiriAudioPlaybackRequest:twoShotAudioPlaybackRequest:deviceSetupFlowBeginDate:deviceSetupFlowEndDate:", v7, objc_msgSend(v5, "state"), 0, 0, 0, 0, 0.0, v11, 0, 0, 0, 0);
    v9 = self->_clientConfiguration;
    self->_clientConfiguration = v8;

    *((_BYTE *)self + 272) &= ~1u;
    clientConfiguration = self->_clientConfiguration;
  }
  return (id)-[AFClientConfiguration copy](clientConfiguration, "copy");
}

intptr_t __34__AFConnection_Internal___barrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __34__AFConnection_Internal___barrier__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
