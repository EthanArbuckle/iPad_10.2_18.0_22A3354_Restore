@implementation _LTTranslationSession

- (_LTTranslationSession)initWithTranslator:(id)a3 selfLoggingInvocationId:(id)a4
{
  id v7;
  id v8;
  _LTTranslationSession *v9;
  _LTTranslationSession *v10;
  _LTTranslationSession *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTTranslationSession;
  v9 = -[_LTTranslationSession init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_translator, a3);
    objc_storeStrong((id *)&v10->_logIdentifier, a4);
    -[_LTTranslationSession _commonInitWithSuggestedSessionID:](v10, "_commonInitWithSuggestedSessionID:", 0);
    v11 = v10;
  }

  return v10;
}

- (id)initForFutureServiceWithSessionID:(id)a3 selfLoggingInvocationId:(id)a4
{
  id v6;
  id v7;
  _LTTranslationSession *v8;
  _LTTranslationSession *v9;
  _LTTranslationSession *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_LTTranslationSession;
  v8 = -[_LTTranslationSession init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_waitingForService = 1;
    objc_storeStrong((id *)&v8->_logIdentifier, a4);
    -[_LTTranslationSession _commonInitWithSuggestedSessionID:](v9, "_commonInitWithSuggestedSessionID:", v6);
    v10 = v9;
  }

  return v9;
}

- (void)_commonInitWithSuggestedSessionID:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *translationQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *outstandingRequests;
  NSUUID *v8;
  NSUUID *sessionID;
  id v10;

  v10 = a3;
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.translation.text", 0);
  translationQueue = self->_translationQueue;
  self->_translationQueue = v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  outstandingRequests = self->_outstandingRequests;
  self->_outstandingRequests = v6;

  if (v10)
  {
    v8 = (NSUUID *)v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  sessionID = self->_sessionID;
  self->_sessionID = v8;

}

- (void)prepareWithService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
  self->_waitingForService = 0;
}

- (void)_ensureServiceConnection:(id)a3 useDedicatedTextMachPort:(BOOL)a4
{
  id v6;
  NSObject *translationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  translationQueue = self->_translationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke;
  block[3] = &unk_250694570;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(translationQueue, block);

}

- (void)translate:(id)a3
{
  -[_LTTranslationSession translate:useDedicatedTextMachPort:](self, "translate:useDedicatedTextMachPort:", a3, 0);
}

- (void)translate:(id)a3 useDedicatedTextMachPort:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke;
  v8[3] = &unk_250694608;
  v7 = v6;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  -[_LTTranslationSession _ensureServiceConnection:useDedicatedTextMachPort:](self, "_ensureServiceConnection:useDedicatedTextMachPort:", v8, v4);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)cancelPendingWork
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42___LTTranslationSession_cancelPendingWork__block_invoke;
  v3[3] = &unk_250694630;
  objc_copyWeak(&v4, &location);
  -[_LTTranslationSession _ensureServiceConnection:useDedicatedTextMachPort:](self, "_ensureServiceConnection:useDedicatedTextMachPort:", v3, 1);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)provideFeedback:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41___LTTranslationSession_provideFeedback___block_invoke;
  v6[3] = &unk_250694658;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[_LTTranslationSession _ensureServiceConnection:useDedicatedTextMachPort:](self, "_ensureServiceConnection:useDedicatedTextMachPort:", v6, 0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)markFirstParagraphComplete
{
  NSObject *translationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  translationQueue = self->_translationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51___LTTranslationSession_markFirstParagraphComplete__block_invoke;
  v4[3] = &unk_250693730;
  objc_copyWeak(&v5, &location);
  dispatch_async(translationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)markProgressDone
{
  NSObject *translationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  translationQueue = self->_translationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41___LTTranslationSession_markProgressDone__block_invoke;
  v4[3] = &unk_250693730;
  objc_copyWeak(&v5, &location);
  dispatch_async(translationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)markPageComplete
{
  NSObject *translationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  translationQueue = self->_translationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41___LTTranslationSession_markPageComplete__block_invoke;
  v4[3] = &unk_250693730;
  objc_copyWeak(&v5, &location);
  dispatch_async(translationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)paragraphTranslation:(id)a3 result:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *translationQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_impl(&dword_235438000, v11, OS_LOG_TYPE_INFO, "Received translation result for %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  translationQueue = self->_translationQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59___LTTranslationSession_paragraphTranslation_result_error___block_invoke;
  v16[3] = &unk_250694068;
  objc_copyWeak(&v20, (id *)buf);
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(translationQueue, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_LTTranslator)translator
{
  return self->_translator;
}

- (void)setTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_translator, a3);
}

- (_LTTextTranslationService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (_LTRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimiter, a3);
}

- (OS_dispatch_queue)translationQueue
{
  return self->_translationQueue;
}

- (void)setTranslationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_translationQueue, a3);
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationQueue, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_logging, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
}

@end
