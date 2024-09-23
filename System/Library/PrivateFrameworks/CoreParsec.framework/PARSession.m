@implementation PARSession

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  -[PARSessionSwiftInternal reportFeedback:queryId:](self->_internal, "reportFeedback:queryId:", a3, a4);
}

- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4
{
  -[PARSessionSwiftInternal fileHandleAndAttributesForResource:completion:](self->_internal, "fileHandleAndAttributesForResource:completion:", a3, a4);
}

+ (id)sharedPARSessionWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (sharedPARSessionWithConfiguration__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      v5 = v4;
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&sharedPARSessionWithConfiguration__onceToken, &__block_literal_global_2360);
    if (v4)
      goto LABEL_3;
  }
  +[PARSessionConfiguration defaultSessionConfiguration](PARSessionConfiguration, "defaultSessionConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = v5;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)sharedPARSessionWithConfiguration__sharedSessions;
  objc_sync_enter(v8);
  objc_msgSend((id)sharedPARSessionWithConfiguration__sharedSessions, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setConfiguration:", v4);
  }
  else
  {
    +[PARSession sessionWithConfiguration:](PARSession, "sessionWithConfiguration:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)sharedPARSessionWithConfiguration__sharedSessions, "setObject:forKeyedSubscript:", v10, v7);
  objc_sync_exit(v8);

  return v10;
}

- (PARBag)bag
{
  return -[PARSessionSwiftInternal bag](self->_internal, "bag");
}

+ (PARSession)sessionWithConfiguration:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:connection:delegate:startImmediately:", v4, 0, 0, 1);

  return (PARSession *)v5;
}

- (PARSession)initWithConfiguration:(id)a3 connection:(id)a4 delegate:(id)a5 startImmediately:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  PARSessionSwiftInternal *v13;
  PARSession *v14;
  NSObject *v15;
  uint8_t v17[16];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (checkValidParsecHost_once != -1)
    dispatch_once(&checkValidParsecHost_once, &__block_literal_global_2877);
  if (checkValidParsecHost_isValidHost)
  {
    v13 = -[PARSessionSwiftInternal initWithSession:configuration:connection:delegate:]([PARSessionSwiftInternal alloc], "initWithSession:configuration:connection:delegate:", self, v10, v11, v12);
    self = (PARSession *)-[PARSession initInternal:startImmediately:](self, "initInternal:startImmediately:", v13, v6);

    v14 = self;
  }
  else
  {
    if (PARLogHandleForCategory_onceToken_2319 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_2319, &__block_literal_global_193);
    v15 = PARLogHandleForCategory_logHandles_2_2320;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2320, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_19A825000, v15, OS_LOG_TYPE_ERROR, "PARSession setup failed on host check", v17, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (id)initInternal:(id)a3 startImmediately:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PARSession *v8;
  PARSession *v9;
  objc_super v11;

  v4 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PARSession;
  v8 = -[PARSession init](&v11, sel_init);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_internal, a3);
  if (v4)
    -[PARSession start](v9, "start");

  return v9;
}

- (void)start
{
  -[PARSessionSwiftInternal start](self->_internal, "start");
}

- (void)setDelegate:(id)a3
{
  -[PARSessionSwiftInternal setDelegate:](self->_internal, "setDelegate:", a3);
}

- (unint64_t)enabledStatus
{
  return -[PARSessionSwiftInternal enabledStatus](self->_internal, "enabledStatus");
}

void __48__PARSession_sharedPARSessionWithConfiguration___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedPARSessionWithConfiguration__sharedSessions;
  sharedPARSessionWithConfiguration__sharedSessions = v0;

}

- (void)subscribeToChannel:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PARSession internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeToChannel:reply:", v7, v6);

}

- (void)unsubscribeFromChannel:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PARSession internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unsubscribeFromChannel:reply:", v7, v6);

}

- (void)subscriptionStatusForChannel:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PARSession internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscriptionStatusForChannel:reply:", v7, v6);

}

- (id)internal
{
  return self->_internal;
}

- (PARSession)initWithConfiguration:(id)a3 connection:(id)a4
{
  return -[PARSession initWithConfiguration:connection:delegate:startImmediately:](self, "initWithConfiguration:connection:delegate:startImmediately:", a3, a4, 0, 1);
}

- (PARSession)initWithConfiguration:(id)a3
{
  return -[PARSession initWithConfiguration:connection:delegate:startImmediately:](self, "initWithConfiguration:connection:delegate:startImmediately:", a3, 0, 0, 1);
}

- (NSXPCConnection)connection
{
  return -[PARSessionSwiftInternal connection](self->_internal, "connection");
}

- (PARSessionConfiguration)configuration
{
  return -[PARSessionSwiftInternal configuration](self->_internal, "configuration");
}

- (void)setConfiguration:(id)a3
{
  -[PARSessionSwiftInternal setConfiguration:](self->_internal, "setConfiguration:", a3);
}

- (PARSessionDelegate)delegate
{
  return -[PARSessionSwiftInternal delegate](self->_internal, "delegate");
}

- (void)setBag:(id)a3
{
  -[PARSessionSwiftInternal setBag:](self->_internal, "setBag:", a3);
}

- (_TtC10CoreParsec15PARSearchClient)client
{
  return -[PARSessionSwiftInternal client](self->_internal, "client");
}

- (id)taskWithRequest:(id)a3 completion:(id)a4
{
  return -[PARSessionSwiftInternal taskWith:completion:](self->_internal, "taskWith:completion:", a3, a4);
}

- (void)loadTask:(id)a3
{
  -[PARSessionSwiftInternal loadWithTask:](self->_internal, "loadWithTask:", a3);
}

- (unint64_t)safariAssistantEnabledStatus
{
  return -[PARSessionSwiftInternal safariAssistantEnabledStatus](self->_internal, "safariAssistantEnabledStatus");
}

- (unint64_t)safariAssistantEnabledStatusForPageLanguage:(id)a3
{
  return -[PARSessionSwiftInternal safariAssistantEnabledStatusForPageLanguage:](self->_internal, "safariAssistantEnabledStatusForPageLanguage:", a3);
}

- (BOOL)loadImage:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PARSession imageLoader](self, "imageLoader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "canLoadImage:context:", v8, v9);
  if (v12)
    objc_msgSend(v11, "loadImage:context:completionHandler:", v8, v9, v10);

  return v12;
}

- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;

  v6 = a3;
  v7 = a4;
  -[PARSession imageLoader](self, "imageLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canLoadImage:context:", v6, 0);
  if (v9)
    objc_msgSend(v8, "loadImage:context:completionHandler:", v6, 0, v7);

  return v9;
}

- (BOOL)loadCard:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;

  v6 = a3;
  v7 = a4;
  -[PARSession cardLoader](self, "cardLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canLoadCard:", v6);
  if (v9)
    objc_msgSend(v8, "loadCard:completionHandler:", v6, v7);

  return v9;
}

- (BOOL)loadMoreResults:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;

  v6 = a3;
  v7 = a4;
  -[PARSession moreResultsLoader](self, "moreResultsLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canLoadMoreResults:", v6);
  if (v9)
    objc_msgSend(v8, "loadMoreResults:completionHandler:", v6, v7);

  return v9;
}

- (id)imageLoader
{
  return self->_internal;
}

- (id)cardLoader
{
  return self->_internal;
}

- (id)moreResultsLoader
{
  return self->_internal;
}

- (void)sendCustomFeedback:(id)a3
{
  -[PARSessionSwiftInternal sendCustomFeedback:](self->_internal, "sendCustomFeedback:", a3);
}

- (void)sendCustomFeedback:(id)a3 completion:(id)a4
{
  -[PARSessionSwiftInternal send:completion:](self->_internal, "send:completion:", a3, a4);
}

- (void)didSkipSearch:(int)a3 forInput:(id)a4 queryId:(unint64_t)a5
{
  -[PARSessionSwiftInternal didSkipSearch:input:queryId:](self->_internal, "didSkipSearch:input:queryId:", *(_QWORD *)&a3, a4, a5);
}

- (void)reportFeedback:(id)a3
{
  PARSessionSwiftInternal *internal;
  unint64_t v4;
  unint64_t v5;
  id v6;

  internal = self->_internal;
  v6 = a3;
  v4 = objc_msgSend(v6, "queryId");
  if (v4 >> 31)
    v5 = 0;
  else
    v5 = v4;
  -[PARSessionSwiftInternal reportFeedback:queryId:](internal, "reportFeedback:queryId:", v6, v5);

}

- (void)sendCBAEngagementFeedback:(id)a3 query:(unint64_t)a4
{
  -[PARSessionSwiftInternal sendCBAEngagementFeedback:query:](self->_internal, "sendCBAEngagementFeedback:query:", a3, a4);
}

- (void)addCompletion:(id)a3 forInput:(id)a4
{
  -[PARSessionSwiftInternal addCompletion:forInput:](self->_internal, "addCompletion:forInput:", a3, a4);
}

- (void)addEngagedResults:(id)a3
{
  -[PARSessionSwiftInternal addEngagedResults:completion:](self->_internal, "addEngagedResults:completion:", a3, &__block_literal_global_10);
}

- (void)addEngagedResults:(id)a3 completion:(id)a4
{
  -[PARSessionSwiftInternal addEngagedResults:completion:](self->_internal, "addEngagedResults:completion:", a3, a4);
}

- (void)topEngagedResultsForInput:(id)a3 maxAmount:(int64_t)a4 completion:(id)a5
{
  -[PARSessionSwiftInternal topEngagedResultsFor:maxCount:completion:](self->_internal, "topEngagedResultsFor:maxCount:completion:", a3, a4, a5);
}

- (void)allEngagedResultsForInput:(id)a3 maxAmount:(int64_t)a4 completion:(id)a5
{
  -[PARSessionSwiftInternal allEngagedResultsFor:maxCount:completion:](self->_internal, "allEngagedResultsFor:maxCount:completion:", a3, a4, a5);
}

- (void)clearEngagementsFromDate:(id)a3 toDate:(id)a4
{
  -[PARSessionSwiftInternal clearEngagementsFrom:to:](self->_internal, "clearEngagementsFrom:to:", a3, a4);
}

- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4
{
  -[PARSessionSwiftInternal clearEngagementsWithTitle:type:](self->_internal, "clearEngagementsWithTitle:type:", a3, a4);
}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
  -[PARSessionSwiftInternal updateParametersForSmartSearchV1:smartSearchV2:](self->_internal, "updateParametersForSmartSearchV1:smartSearchV2:", a3, a4);
}

- (void)clearEngagedResult:(id)a3 completion:(id)a4
{
  PARSessionSwiftInternal *internal;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PARSessionSwiftInternal clearEngagedResults:completion:](internal, "clearEngagedResults:completion:", v9, v7, v10, v11);

}

- (void)clearEngagedResults:(id)a3 completion:(id)a4
{
  -[PARSessionSwiftInternal clearEngagedResults:completion:](self->_internal, "clearEngagedResults:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

void __32__PARSession_addEngagedResults___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];
  uint8_t v8[16];

  v2 = a2;
  if (PARLogHandleForCategory_onceToken_2319 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_2319, &__block_literal_global_193);
  v3 = PARLogHandleForCategory_logHandles_2_2320;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2320, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_19A825000, v3, OS_LOG_TYPE_DEBUG, "No completion provided. Please use the new SPI for addEngagedResults and provide a non null completion", v8, 2u);
    if (v2)
    {
      if (PARLogHandleForCategory_onceToken_2319 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_2319, &__block_literal_global_193);
      goto LABEL_5;
    }
    if (PARLogHandleForCategory_onceToken_2319 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_2319, &__block_literal_global_193);
  }
  else if (v2)
  {
LABEL_5:
    v4 = PARLogHandleForCategory_logHandles_2_2320;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2320, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19A825000, v4, OS_LOG_TYPE_ERROR, "Failed to add engagement to cache", buf, 2u);
    }
    goto LABEL_14;
  }
  v5 = PARLogHandleForCategory_logHandles_2_2320;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2320, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A825000, v5, OS_LOG_TYPE_INFO, "Engagement added to cache.", v6, 2u);
  }
LABEL_14:

}

+ (id)sharedSession
{
  id v2;

  if (checkValidParsecHost_once != -1)
    dispatch_once(&checkValidParsecHost_once, &__block_literal_global_2877);
  if (checkValidParsecHost_isValidHost)
  {
    if (sharedSession_onceToken != -1)
      dispatch_once(&sharedSession_onceToken, &__block_literal_global_7_2357);
    v2 = (id)sharedSession_sharedSession;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (PARSession)sessionWithConfiguration:(id)a3 delegate:(id)a4 startImmediately:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:connection:delegate:startImmediately:", v9, 0, v8, v5);

  return (PARSession *)v10;
}

void __27__PARSession_sharedSession__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PARSessionConfiguration defaultSessionConfiguration](PARSessionConfiguration, "defaultSessionConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PARSession sessionWithConfiguration:](PARSession, "sessionWithConfiguration:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = v0;

}

@end
