@implementation SHManagedSession

- (SHManagedSession)init
{
  void *v3;
  SHManagedSession *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[SHManagedSession initWithCatalog:](self, "initWithCatalog:", v3);

  return v4;
}

- (SHManagedSession)initWithCatalog:(id)a3
{
  id v4;
  SHShazamKitServiceConnection *v5;
  void *v6;
  SHShazamKitServiceConnection *v7;
  SHManagedSessionCustomCatalogDriver *v8;
  SHManagedSessionCustomCatalogMatcher *v9;
  SHManagedSession *v10;

  v4 = a3;
  v5 = [SHShazamKitServiceConnection alloc];
  v6 = (void *)objc_opt_new();
  v7 = -[SHShazamKitServiceConnection initWithConnectionProvider:](v5, "initWithConnectionProvider:", v6);

  if (-[SHManagedSession isUsingCustomCatalog:](self, "isUsingCustomCatalog:", v4))
  {
    v8 = -[SHManagedSessionCustomCatalogDriver initWithServiceConnection:]([SHManagedSessionCustomCatalogDriver alloc], "initWithServiceConnection:", v7);
    v9 = -[SHManagedSessionCustomCatalogMatcher initWithCustomCatalog:]([SHManagedSessionCustomCatalogMatcher alloc], "initWithCustomCatalog:", v4);
    v10 = -[SHManagedSession initWithCatalog:matcher:sessionDriver:serviceConnection:](self, "initWithCatalog:matcher:sessionDriver:serviceConnection:", v4, v9, v8, v7);

  }
  else
  {
    v10 = -[SHManagedSession initWithCatalog:matcher:sessionDriver:serviceConnection:](self, "initWithCatalog:matcher:sessionDriver:serviceConnection:", v4, v7, 0, v7);
  }

  return v10;
}

- (SHManagedSession)initWithCatalog:(id)a3 matcher:(id)a4 sessionDriver:(id)a5 serviceConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SHManagedSession *v14;
  SHManagedSession *v15;
  SHSession *v16;
  SHSession *session;
  uint64_t v18;
  NSUUID *sharedRequestID;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SHManagedSession;
  v14 = -[SHManagedSession init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_shazamServiceConnection, a6);
    v16 = -[SHSession initWithCatalog:matcher:sessionDriver:]([SHSession alloc], "initWithCatalog:matcher:sessionDriver:", v10, v11, v12);
    session = v15->_session;
    v15->_session = v16;

    -[SHSession setDelegate:](v15->_session, "setDelegate:", v15);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    sharedRequestID = v15->_sharedRequestID;
    v15->_sharedRequestID = (NSUUID *)v18;

  }
  return v15;
}

+ (BOOL)isLiveActivityAvailable
{
  return 1;
}

- (BOOL)isMatching
{
  void *v2;
  BOOL v3;

  -[SHManagedSession inflightRequest](self, "inflightRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)matchAmbientAudioSnippet
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[16];

  -[SHManagedSession inflightRequest](self, "inflightRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    sh_log_object();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218BF1000, v4, OS_LOG_TYPE_DEFAULT, "Can't start a new match attempt when there is an existing attempt already running.", buf, 2u);
    }

  }
  else
  {
    -[SHManagedSession session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "catalog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SHManagedSession isUsingCustomCatalog:](self, "isUsingCustomCatalog:", v6);

    if (v7)
    {
      -[SHManagedSession sharedRequestID](self, "sharedRequestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHMatcherRequest requestSignatureGenerationOnceForRequestID:](SHMatcherRequest, "requestSignatureGenerationOnceForRequestID:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[SHManagedSession enableLiveActivity](self, "enableLiveActivity"))
      {
        -[SHManagedSession sharedRequestID](self, "sharedRequestID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHMatcherRequest requestOnceWithAppIntentForRequestID:](SHMatcherRequest, "requestOnceWithAppIntentForRequestID:", v8);
      }
      else
      {
        v10 = -[SHManagedSession sendNotifications](self, "sendNotifications");
        -[SHManagedSession sharedRequestID](self, "sharedRequestID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHMatcherRequest requestOnceWithNotifications:forRequestID:](SHMatcherRequest, "requestOnceWithNotifications:forRequestID:", v10, v8);
      }
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v9;
    -[SHManagedSession setInflightRequest:](self, "setInflightRequest:", v9);

    -[SHManagedSession shazamServiceConnection](self, "shazamServiceConnection");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[SHManagedSession inflightRequest](self, "inflightRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startRecognitionForRequest:", v12);

  }
}

- (void)matchAmbientAudioSnippetUntilDeadline:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  v4 = a3;
  -[SHManagedSession inflightRequest](self, "inflightRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    sh_log_object();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_218BF1000, v6, OS_LOG_TYPE_DEFAULT, "Can't start a new match attempt when there is an existing attempt already running.", v17, 2u);
    }

  }
  else
  {
    -[SHManagedSession session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "catalog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SHManagedSession isUsingCustomCatalog:](self, "isUsingCustomCatalog:", v8);

    if (v9)
    {
      -[SHManagedSession sharedRequestID](self, "sharedRequestID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHMatcherRequest requestSignatureGenerationUntilDeadline:forRequestID:](SHMatcherRequest, "requestSignatureGenerationUntilDeadline:forRequestID:", v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHManagedSession setInflightRequest:](self, "setInflightRequest:", v11);

    }
    else
    {
      v12 = -[SHManagedSession sendNotifications](self, "sendNotifications");
      -[SHManagedSession sharedRequestID](self, "sharedRequestID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHMatcherRequest requestToMatchUntilDeadline:sendNotifications:forRequestID:](SHMatcherRequest, "requestToMatchUntilDeadline:sendNotifications:forRequestID:", v4, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHManagedSession setInflightRequest:](self, "setInflightRequest:", v14);

    }
    -[SHManagedSession shazamServiceConnection](self, "shazamServiceConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHManagedSession inflightRequest](self, "inflightRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startRecognitionForRequest:", v16);

  }
}

- (BOOL)isUsingCustomCatalog:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)stopMatchingAmbientAudioSnippet
{
  void *v3;
  void *v4;

  -[SHManagedSession shazamServiceConnection](self, "shazamServiceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHManagedSession sharedRequestID](self, "sharedRequestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopRecognitionForRequestID:", v4);

  -[SHManagedSession setInflightRequest:](self, "setInflightRequest:", 0);
  -[SHManagedSession setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (void)ensureCallerHasRecordTCCWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDB17E0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__SHManagedSession_ensureCallerHasRecordTCCWithCompletionHandler___block_invoke;
  v6[3] = &unk_24D9B7C90;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestRecordPermissionWithCompletionHandler:", v6);

}

uint64_t __66__SHManagedSession_ensureCallerHasRecordTCCWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__SHManagedSession_prepareWithCompletionHandler___block_invoke;
  v6[3] = &unk_24D9B7CB8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SHManagedSession ensureCallerHasRecordTCCWithCompletionHandler:](self, "ensureCallerHasRecordTCCWithCompletionHandler:", v6);

}

void __49__SHManagedSession_prepareWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "shazamServiceConnection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sharedRequestID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareMatcherForRequestID:completionHandler:", v3, *(_QWORD *)(a1 + 40));

  }
  else
  {
    sh_log_object();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218BF1000, v4, OS_LOG_TYPE_ERROR, "Prepare call ignored, the caller does not have record permission", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)singleMatchWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  v4 = a3;
  sh_log_object();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_218BF1000, v5, OS_LOG_TYPE_DEBUG, "Calling single match with completion handler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SHManagedSession_singleMatchWithCompletionHandler___block_invoke;
  v6[3] = &unk_24D9B7B88;
  objc_copyWeak(&v7, buf);
  -[SHManagedSession prepareMatchWithPreparedCallback:withCompletionHandler:](self, "prepareMatchWithPreparedCallback:withCompletionHandler:", v6, v4);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);

}

void __53__SHManagedSession_singleMatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "matchAmbientAudioSnippet");

}

- (void)matchWithCallback:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SHManagedSession_matchWithCallback___block_invoke;
  v5[3] = &unk_24D9B7B88;
  objc_copyWeak(&v6, &location);
  -[SHManagedSession prepareMatchWithPreparedCallback:withCompletionHandler:](self, "prepareMatchWithPreparedCallback:withCompletionHandler:", v5, v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __38__SHManagedSession_matchWithCallback___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "matchAmbientAudioSnippetUntilDeadline:", v1);

}

- (void)prepareMatchWithPreparedCallback:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *, void *);
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *, void *))a4;
  -[SHManagedSession inflightRequest](self, "inflightRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    sh_log_object();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_218BF1000, v9, OS_LOG_TYPE_DEBUG, "Cancelling this new attempt as there's an attempt already running", (uint8_t *)buf, 2u);
    }

    v10 = (void *)objc_opt_new();
    +[SHError errorWithCode:underlyingError:](SHError, "errorWithCode:underlyingError:", 202, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10, v11);

  }
  else
  {
    objc_initWeak(buf, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__SHManagedSession_prepareMatchWithPreparedCallback_withCompletionHandler___block_invoke;
    v12[3] = &unk_24D9B7CE0;
    v12[4] = self;
    v13 = v7;
    objc_copyWeak(&v15, buf);
    v14 = v6;
    -[SHManagedSession ensureCallerHasRecordTCCWithCompletionHandler:](self, "ensureCallerHasRecordTCCWithCompletionHandler:", v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }

}

void __75__SHManagedSession_prepareMatchWithPreparedCallback_withCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setCompletionHandler:", v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v10 = *MEMORY[0x24BDD0BA0];
    v11[0] = CFSTR("Record permission is required");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError errorWithCode:underlyingError:keyOverrides:](SHError, "errorWithCode:underlyingError:keyOverrides:", 202, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v3 + 16))(v3, 0, v5, v7);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishedSession:", v9);

  }
}

- (SHMatcherRequest)inflightRequest
{
  return self->_inflightRequest;
}

- (void)setInflightRequest:(id)a3
{
  objc_storeStrong((id *)&self->_inflightRequest, a3);
}

- (SHCatalog)catalog
{
  void *v2;
  void *v3;

  -[SHManagedSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "catalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SHCatalog *)v3;
}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SHManagedSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SHManagedSession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "session:didFindMatch:", v13, v6);

  }
  -[SHManagedSession completionHandler](self, "completionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SHManagedSession completionHandler](self, "completionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "querySignature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, _QWORD))v11)[2](v11, v6, v12, 0);

  }
}

- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[SHManagedSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SHManagedSession delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "session:didNotFindMatchForSignature:error:", v15, v8, v9);

  }
  -[SHManagedSession completionHandler](self, "completionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SHManagedSession completionHandler](self, "completionHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id, id))v14)[2](v14, 0, v8, v9);

  }
}

- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[SHManagedSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SHManagedSession delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "session:shouldAttemptToMatchSignature:", v6, v7);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)session:(id)a3 didProduceResponse:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SHManagedSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SHManagedSession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "session:didProduceResponse:", v10, v6);

  }
}

- (void)finishedSession:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SHManagedSession setInflightRequest:](self, "setInflightRequest:", 0);
  -[SHManagedSession setCompletionHandler:](self, "setCompletionHandler:", 0);
  -[SHManagedSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SHManagedSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishedSession:", v10);

  }
  -[SHManagedSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SHManagedSession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishedManagedSession:", self);

  }
}

- (void)didCalculateSpectralData:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SHManagedSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SHManagedSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didCalculateSpectralData:", v7);

  }
}

- (SHManagedSessionDelegate)delegate
{
  return (SHManagedSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enableLiveActivity
{
  return self->_enableLiveActivity;
}

- (void)setEnableLiveActivity:(BOOL)a3
{
  self->_enableLiveActivity = a3;
}

- (NSUUID)sharedRequestID
{
  return self->_sharedRequestID;
}

- (SHSession)session
{
  return self->_session;
}

- (SHPreparableMatcher)shazamServiceConnection
{
  return self->_shazamServiceConnection;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)sendNotifications
{
  return self->_sendNotifications;
}

- (void)setSendNotifications:(BOOL)a3
{
  self->_sendNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_shazamServiceConnection, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sharedRequestID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inflightRequest, 0);
}

@end
