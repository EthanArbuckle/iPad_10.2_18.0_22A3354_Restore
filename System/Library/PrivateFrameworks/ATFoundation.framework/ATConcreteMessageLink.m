@implementation ATConcreteMessageLink

- (ATConcreteMessageLink)initWithSocket:(id)a3
{
  id v6;
  ATConcreteMessageLink *v7;
  void *v8;
  uint64_t v9;
  NSString *guid;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  dispatch_queue_t v13;
  OS_dispatch_queue *handlerAccessQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *callbackQueue;
  uint64_t v17;
  NSMapTable *outputStreamsToInputStreams;
  uint64_t v19;
  NSMutableDictionary *requestWritersByID;
  uint64_t v21;
  NSMutableDictionary *responseWritersByID;
  uint64_t v23;
  NSMutableDictionary *streamReadersByID;
  uint64_t v25;
  NSMutableSet *requestWritersPendingStopByID;
  uint64_t v27;
  NSMutableSet *responseWritersPendingStopByID;
  uint64_t v29;
  NSMutableSet *requestReadersPendingStopByID;
  uint64_t v31;
  NSMutableDictionary *sentRequestsByID;
  uint64_t v33;
  NSMutableDictionary *receivedRequestsByID;
  uint64_t v35;
  NSMutableDictionary *completionHandlersByRequestID;
  uint64_t v37;
  NSMutableDictionary *completionHandlersByResponseID;
  uint64_t v39;
  NSMutableDictionary *requestHandlersByDataClass;
  dispatch_group_t v41;
  OS_dispatch_group *stopReadersAndWritersGroup;
  ATMessageParser *v43;
  ATMessageParser *parser;
  ATMessageParser *v45;
  uint64_t v46;
  NSHashTable *observers;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, void *);
  void *v53;
  id v54;
  id location;
  objc_super v56;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATConcreteMessageLink.m"), 117, CFSTR("socket is nil"));

  }
  v56.receiver = self;
  v56.super_class = (Class)ATConcreteMessageLink;
  v7 = -[ATMessageLink init](&v56, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    guid = v7->_guid;
    v7->_guid = (NSString *)v9;

    v11 = dispatch_queue_create("com.apple.amp.AirTraffic.ATFoundation.ATConcreteMessageLink.queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_create("com.apple.amp.AirTraffic.ATFoundation.ATConcreteMessageLink.handlerAccess", 0);
    handlerAccessQueue = v7->_handlerAccessQueue;
    v7->_handlerAccessQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.apple.amp.AirTraffic.ATFoundation.ATConcreteMessageLink.callBack", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    outputStreamsToInputStreams = v7->_outputStreamsToInputStreams;
    v7->_outputStreamsToInputStreams = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    requestWritersByID = v7->_requestWritersByID;
    v7->_requestWritersByID = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    responseWritersByID = v7->_responseWritersByID;
    v7->_responseWritersByID = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    streamReadersByID = v7->_streamReadersByID;
    v7->_streamReadersByID = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = objc_claimAutoreleasedReturnValue();
    requestWritersPendingStopByID = v7->_requestWritersPendingStopByID;
    v7->_requestWritersPendingStopByID = (NSMutableSet *)v25;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    responseWritersPendingStopByID = v7->_responseWritersPendingStopByID;
    v7->_responseWritersPendingStopByID = (NSMutableSet *)v27;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = objc_claimAutoreleasedReturnValue();
    requestReadersPendingStopByID = v7->_requestReadersPendingStopByID;
    v7->_requestReadersPendingStopByID = (NSMutableSet *)v29;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = objc_claimAutoreleasedReturnValue();
    sentRequestsByID = v7->_sentRequestsByID;
    v7->_sentRequestsByID = (NSMutableDictionary *)v31;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = objc_claimAutoreleasedReturnValue();
    receivedRequestsByID = v7->_receivedRequestsByID;
    v7->_receivedRequestsByID = (NSMutableDictionary *)v33;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v35 = objc_claimAutoreleasedReturnValue();
    completionHandlersByRequestID = v7->_completionHandlersByRequestID;
    v7->_completionHandlersByRequestID = (NSMutableDictionary *)v35;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v37 = objc_claimAutoreleasedReturnValue();
    completionHandlersByResponseID = v7->_completionHandlersByResponseID;
    v7->_completionHandlersByResponseID = (NSMutableDictionary *)v37;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = objc_claimAutoreleasedReturnValue();
    requestHandlersByDataClass = v7->_requestHandlersByDataClass;
    v7->_requestHandlersByDataClass = (NSMutableDictionary *)v39;

    v41 = dispatch_group_create();
    stopReadersAndWritersGroup = v7->_stopReadersAndWritersGroup;
    v7->_stopReadersAndWritersGroup = (OS_dispatch_group *)v41;

    v43 = -[ATMessageParser initWithMessageClass:]([ATMessageParser alloc], "initWithMessageClass:", objc_opt_class());
    parser = v7->_parser;
    v7->_parser = v43;

    objc_initWeak(&location, v7);
    v45 = v7->_parser;
    v50 = MEMORY[0x1E0C809B0];
    v51 = 3221225472;
    v52 = __40__ATConcreteMessageLink_initWithSocket___block_invoke;
    v53 = &unk_1E928C8C8;
    objc_copyWeak(&v54, &location);
    -[ATMessageParser setObjectParsedBlock:](v45, "setObjectParsedBlock:", &v50);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v50, v51, v52, v53);
    v46 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v46;

    objc_storeStrong((id *)&v7->_socket, a3);
    objc_msgSend(v6, "addDelegate:", v7);
    v7->_endpointType = 0;
    v7->_lastActivityTime = CFAbsoluteTimeGetCurrent();
    v7->_idleTimeoutExceptionCount = 0;
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *requestTimeoutTimer;
  OS_dispatch_source *v5;
  ATSocket *socket;
  ATSocket *v7;
  objc_super v8;
  uint8_t buf[4];
  ATConcreteMessageLink *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ getting dealloced", buf, 0xCu);
  }

  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    dispatch_source_cancel(requestTimeoutTimer);
    v5 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0;

  }
  socket = self->_socket;
  if (socket)
  {
    -[ATSocket removeDelegate:](socket, "removeDelegate:", self);
    if (-[ATSocket isOpen](self->_socket, "isOpen"))
      -[ATSocket close](self->_socket, "close");
    v7 = self->_socket;
    self->_socket = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)ATConcreteMessageLink;
  -[ATConcreteMessageLink dealloc](&v8, sel_dealloc);
}

- (BOOL)open
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__ATConcreteMessageLink_open__block_invoke;
  v5[3] = &unk_1E928CCA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ATConcreteMessageLink_close__block_invoke;
  block[3] = &unk_1E928CC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)addRequestHandler:(id)a3 forDataClass:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerAccessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerAccessQueue = self->_handlerAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ATConcreteMessageLink_addRequestHandler_forDataClass___block_invoke;
  block[3] = &unk_1E928CD38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(handlerAccessQueue, block);

}

- (void)removeRequestHandlerForDataClass:(id)a3
{
  id v4;
  NSObject *handlerAccessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  handlerAccessQueue = self->_handlerAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATConcreteMessageLink_removeRequestHandlerForDataClass___block_invoke;
  block[3] = &unk_1E928CDD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(handlerAccessQueue, block);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *handlerAccessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  handlerAccessQueue = self->_handlerAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATConcreteMessageLink_addObserver___block_invoke;
  block[3] = &unk_1E928CDD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(handlerAccessQueue, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *handlerAccessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  handlerAccessQueue = self->_handlerAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ATConcreteMessageLink_removeObserver___block_invoke;
  block[3] = &unk_1E928CDD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(handlerAccessQueue, block);

}

- (void)setInitialized:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (self->_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATConcreteMessageLink.m"), 340, CFSTR("we should not be initializing twice"));

  }
  self->_initialized = v3;
  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ATConcreteMessageLink _getObservers](self, "_getObservers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "messageLinkWasInitialized:", self);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
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
  block[2] = __52__ATConcreteMessageLink_sendRequest_withCompletion___block_invoke;
  block[3] = &unk_1E928CE78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  -[ATConcreteMessageLink sendResponse:withProgress:completion:](self, "sendResponse:withProgress:completion:", a3, 0, a4);
}

- (void)sendResponse:(id)a3 withProgress:(id)a4 completion:(id)a5
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
  v15[2] = __62__ATConcreteMessageLink_sendResponse_withProgress_completion___block_invoke;
  v15[3] = &unk_1E928C968;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)sendPartialResponse:(id)a3 withCompletion:(id)a4
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
  block[2] = __60__ATConcreteMessageLink_sendPartialResponse_withCompletion___block_invoke;
  block[3] = &unk_1E928CE78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATConcreteMessageLink endpointType](self, "endpointType");
  v7 = -[ATConcreteMessageLink isOpen](self, "isOpen");
  -[ATConcreteMessageLink identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type=%d, open=%d identifier=%@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)addTimeoutException
{
  NSObject *v3;
  int64_t idleTimeoutExceptionCount;
  int v5;
  ATConcreteMessageLink *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ++self->_idleTimeoutExceptionCount;
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    idleTimeoutExceptionCount = self->_idleTimeoutExceptionCount;
    v5 = 138543618;
    v6 = self;
    v7 = 1024;
    v8 = idleTimeoutExceptionCount;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding idleTimeoutException - count %d", (uint8_t *)&v5, 0x12u);
  }

}

- (void)removeTimeoutException
{
  int64_t idleTimeoutExceptionCount;
  NSObject *v4;
  int64_t v5;
  void *v7;
  int v8;
  ATConcreteMessageLink *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  idleTimeoutExceptionCount = self->_idleTimeoutExceptionCount;
  if (idleTimeoutExceptionCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATConcreteMessageLink.m"), 510, CFSTR("timeout exception already at 0!"));

    idleTimeoutExceptionCount = self->_idleTimeoutExceptionCount;
  }
  self->_idleTimeoutExceptionCount = idleTimeoutExceptionCount - 1;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self->_idleTimeoutExceptionCount;
    v8 = 138543618;
    v9 = self;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing idleTimeoutException - count %d", (uint8_t *)&v8, 0x12u);
  }

}

- (BOOL)idleTimeoutEnabled
{
  return self->_idleTimeoutExceptionCount == 0;
}

- (void)addKeepAliveException
{
  NSObject *v3;
  int64_t keepAliveExceptionCount;
  int v5;
  ATConcreteMessageLink *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ++self->_keepAliveExceptionCount;
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    keepAliveExceptionCount = self->_keepAliveExceptionCount;
    v5 = 138543618;
    v6 = self;
    v7 = 1024;
    v8 = keepAliveExceptionCount;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding keepAliveException - count %d", (uint8_t *)&v5, 0x12u);
  }

}

- (void)removeKeepAliveException
{
  int64_t keepAliveExceptionCount;
  NSObject *v4;
  int64_t v5;
  void *v7;
  int v8;
  ATConcreteMessageLink *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  keepAliveExceptionCount = self->_keepAliveExceptionCount;
  if (keepAliveExceptionCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATConcreteMessageLink.m"), 525, CFSTR("keep-alive exception already at 0!"));

    keepAliveExceptionCount = self->_keepAliveExceptionCount;
  }
  self->_keepAliveExceptionCount = keepAliveExceptionCount - 1;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self->_keepAliveExceptionCount;
    v8 = 138543618;
    v9 = self;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing keepAliveException - count %d", (uint8_t *)&v8, 0x12u);
  }

}

- (void)socketDidClose:(id)a3
{
  NSObject *v4;
  int v5;
  ATConcreteMessageLink *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Underlying socket closed", (uint8_t *)&v5, 0xCu);
  }

  -[ATConcreteMessageLink close](self, "close");
}

- (void)socket:(id)a3 hasDataAvailable:(const char *)a4 length:(int64_t)a5
{
  void *v8;
  id v9;

  v9 = a3;
  self->_lastActivityTime = CFAbsoluteTimeGetCurrent();
  v8 = (void *)MEMORY[0x1D8230CE4]();
  -[ATMessageParser processData:length:](self->_parser, "processData:length:", a4, a5);
  objc_autoreleasePoolPop(v8);

}

- (unsigned)_nextRequestID
{
  unsigned int *p_nextMessageID;
  unsigned int v3;
  unsigned int result;

  p_nextMessageID = &self->_nextMessageID;
  do
  {
    v3 = __ldxr(p_nextMessageID);
    result = v3 + 1;
  }
  while (__stxr(v3 + 1, p_nextMessageID));
  return result;
}

- (void)_prepareStreamReaderForMessage:(id)a3 withProgress:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSMutableDictionary *streamReadersByID;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21[2];
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  id v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  id v32;
  id v33[2];
  id from;
  id location;
  _QWORD v36[3];
  char v37;
  _QWORD v38[3];
  char v39;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D4D0E8]);
  objc_msgSend(v6, "dataStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithInputStream:queue:", v9, self->_queue);

  objc_msgSend(v10, "setMaximumBufferSize:", -[ATSocket suggestedBufferSize](self->_socket, "suggestedBufferSize"));
  objc_msgSend(v10, "setCompress:", (objc_msgSend(v6, "options") >> 1) & 1);
  v11 = objc_msgSend(v6, "messageID");
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 1;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  objc_initWeak(&location, v10);
  objc_initWeak(&from, self);
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke;
  v27[3] = &unk_1E928C990;
  objc_copyWeak(&v32, &from);
  objc_copyWeak(v33, &location);
  v30 = v38;
  v13 = v6;
  v28 = v13;
  v31 = v36;
  v33[1] = (id)v11;
  v14 = v7;
  v29 = v14;
  objc_msgSend(v10, "setDidReadDataBlock:", v27);
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_50;
  v22[3] = &unk_1E928C9E0;
  objc_copyWeak(v26, &from);
  v24 = v38;
  v26[1] = (id)v11;
  v15 = v13;
  v23 = v15;
  v25 = v36;
  objc_msgSend(v10, "setDidEncounterErrorBlock:", v22);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_2;
  v19[3] = &unk_1E928CA08;
  objc_copyWeak(v21, &from);
  v21[1] = (id)v11;
  v16 = v15;
  v20 = v16;
  objc_msgSend(v10, "setDidFinishReadingBlock:", v19);
  streamReadersByID = self->_streamReadersByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](streamReadersByID, "setObject:forKey:", v10, v18);

  objc_msgSend(v10, "start");
  objc_destroyWeak(v21);

  objc_destroyWeak(v26);
  objc_destroyWeak(v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

}

- (void)_invokeCompletionHandlerForResponseID:(unint64_t)a3 withError:(id)a4
{
  id v6;
  NSMutableDictionary *completionHandlersByResponseID;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSObject *callbackQueue;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  completionHandlersByResponseID = self->_completionHandlersByResponseID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](completionHandlersByResponseID, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = self->_completionHandlersByResponseID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

    callbackQueue = self->_callbackQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__ATConcreteMessageLink__invokeCompletionHandlerForResponseID_withError___block_invoke;
    v13[3] = &unk_1E928C940;
    v15 = v9;
    v14 = v6;
    dispatch_async(callbackQueue, v13);

  }
}

- (void)_processIncomingMessage:(id)a3
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
  v7[2] = __49__ATConcreteMessageLink__processIncomingMessage___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_processIncomingRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *receivedRequestsByID;
  void *v9;
  NSMutableDictionary *requestHandlersByDataClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *requestWritersByID;
  void *v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  NSObject *callbackQueue;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD block[4];
  id v31;
  void (**v32)(_QWORD, _QWORD);
  _QWORD v33[4];
  id v34;
  ATConcreteMessageLink *v35;
  _QWORD v36[5];
  uint8_t buf[4];
  ATConcreteMessageLink *v38;
  __int16 v39;
  _BYTE v40[10];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "formattedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = self;
    v39 = 2114;
    *(_QWORD *)v40 = v6;
    _os_log_impl(&dword_1D19F1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <--- %{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF76A0]), "initWithATPMessage:", v4);
  objc_msgSend(v7, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  receivedRequestsByID = self->_receivedRequestsByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](receivedRequestsByID, "setObject:forKey:", v7, v9);

  requestHandlersByDataClass = self->_requestHandlersByDataClass;
  objc_msgSend(v7, "dataClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](requestHandlersByDataClass, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v4, "additionalPayload"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0F0]), "initWithQueue:", self->_queue);
      objc_msgSend(v13, "setCompressed:", (objc_msgSend(v7, "options") >> 1) & 1);
      objc_msgSend(v13, "start");
      objc_msgSend(v13, "inputStream");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDataStream:", v14);

      requestWritersByID = self->_requestWritersByID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](requestWritersByID, "setObject:forKey:", v13, v16);

      _ATLogCategoryFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v4, "messageID");
        v19 = objc_msgSend(v13, "isCompressed");
        *(_DWORD *)buf = 138543874;
        v38 = self;
        v39 = 1024;
        *(_DWORD *)v40 = v18;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)&v40[6] = v19;
        _os_log_impl(&dword_1D19F1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Opened data stream for request ID %d, isCompressed=%{BOOL}u", buf, 0x18u);
      }

    }
    v20 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __49__ATConcreteMessageLink__processIncomingRequest___block_invoke_59;
    v33[3] = &unk_1E928CA50;
    v34 = v12;
    v35 = self;
    v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8230E64](v33);
    v22 = v21;
    if (self->_initialized)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __49__ATConcreteMessageLink__processIncomingRequest___block_invoke_2;
      block[3] = &unk_1E928C940;
      v32 = v21;
      v31 = v7;
      dispatch_async(callbackQueue, block);

    }
    else
    {
      ((void (**)(_QWORD, void *))v21)[2](v21, v7);
    }

  }
  else
  {
    objc_msgSend(v7, "command");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("Ping"));

    if (v25)
    {
      objc_msgSend(v7, "responseWithError:parameters:", 0, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __49__ATConcreteMessageLink__processIncomingRequest___block_invoke;
      v36[3] = &unk_1E928CBE0;
      v36[4] = self;
      -[ATConcreteMessageLink sendResponse:withCompletion:](self, "sendResponse:withCompletion:", v26, v36);
    }
    else
    {
      _ATLogCategoryFramework();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "dataClass");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = self;
        v39 = 2114;
        *(_QWORD *)v40 = v28;
        _os_log_impl(&dword_1D19F1000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping message for unhandled dataclass %{public}@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "responseWithError:parameters:", v26, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATConcreteMessageLink sendResponse:withCompletion:](self, "sendResponse:withCompletion:", v29, &__block_literal_global_1477);

    }
  }

}

- (void)_processIncomingDataRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *receivedRequestsByID;
  void *v8;
  void *v9;
  ATSignatureProvider *signatureProvider;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSMutableDictionary *requestWritersByID;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  int v21;
  double Current;
  double v23;
  double v24;
  NSObject *v25;
  double v26;
  uint64_t v27;
  double v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  ATConcreteMessageLink *v35;
  void *v36;
  id v37;
  _BYTE buf[22];
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "formattedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1D19F1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <--- %{public}@", buf, 0x16u);

  }
  receivedRequestsByID = self->_receivedRequestsByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](receivedRequestsByID, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_10;
  if (!self->_signatureProvider)
    goto LABEL_10;
  if ((objc_msgSend(v9, "options") & 1) == 0)
    goto LABEL_10;
  signatureProvider = self->_signatureProvider;
  objc_msgSend(v4, "payloadSignature");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSignatureProvider verifySignature:forData:](signatureProvider, "verifySignature:forData:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_10:
    requestWritersByID = self->_requestWritersByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](requestWritersByID, "objectForKey:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13
      || -[ATConcreteMessageLink _isWriterPendingStopForforMessage:](self, "_isWriterPendingStopForforMessage:", v4))
    {
      goto LABEL_26;
    }
    if (objc_msgSend(v4, "hasPayload"))
    {
      objc_msgSend(v4, "payload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v18 = objc_msgSend(v13, "writeAllData:error:", v17, &v37);
      v19 = v37;

      if ((v18 & 1) == 0)
      {
        _ATLogCategoryFramework();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = objc_msgSend(v4, "messageID");
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v19;
          v39 = 2048;
          v40 = *(double *)&v13;
          v41 = 1024;
          LODWORD(v42) = v21;
          _os_log_impl(&dword_1D19F1000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Error=%{public}@ writing to data stream, stopping %p for request=%u", buf, 0x26u);
        }

        goto LABEL_23;
      }
    }
    else
    {
      v19 = 0;
    }
    if ((objc_msgSend(v4, "additionalPayload") & 1) != 0)
    {
LABEL_25:

      goto LABEL_26;
    }
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v13, "timestamp");
    v24 = v23;
    _ATLogCategoryFramework();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = Current - v24;
      v27 = objc_msgSend(v13, "bytesWritten");
      v28 = (double)(unint64_t)objc_msgSend(v13, "bytesWritten") / v26;
      v29 = objc_msgSend(v4, "messageID");
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v27;
      v39 = 2048;
      v40 = v26;
      v41 = 2048;
      v42 = v28;
      v43 = 1024;
      v44 = v29;
      _os_log_impl(&dword_1D19F1000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished streaming %llu bytes in %.2f seconds (%.2f b/s) for request %u", buf, 0x30u);
    }

    if (objc_msgSend(v4, "hasStreamError"))
    {
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "streamError");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = objc_msgSend(v30, "domainCode");
      objc_msgSend(v4, "streamError");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&buf[8] = objc_msgSend(v31, "code");

      v32 = objc_msgSend(v4, "messageID");
      v33 = objc_msgSend(v4, "messageType");
      v34 = buf;
      v35 = self;
      v36 = v13;
LABEL_24:
      -[ATConcreteMessageLink _stopWriter:byInjectingStreamError:forMessageId:type:](v35, "_stopWriter:byInjectingStreamError:forMessageId:type:", v36, v34, v32, v33);
      goto LABEL_25;
    }
LABEL_23:
    v32 = objc_msgSend(v4, "messageID");
    v33 = objc_msgSend(v4, "messageType");
    v35 = self;
    v36 = v13;
    v34 = 0;
    goto LABEL_24;
  }
  _ATLogCategoryFramework();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1D19F1000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to verify payload signature: %{public}@", buf, 0x16u);
  }

  -[ATConcreteMessageLink close](self, "close");
LABEL_26:

}

- (void)_processIncomingResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *sentRequestsByID;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *receivedResponsesByID;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *responseWritersByID;
  void *v18;
  NSObject *v19;
  int v20;
  int v21;
  NSMutableDictionary *completionHandlersByRequestID;
  void *v23;
  NSObject *v24;
  NSMutableDictionary *v25;
  void *v26;
  NSObject *callbackQueue;
  int v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  uint8_t buf[4];
  ATConcreteMessageLink *v33;
  __int16 v34;
  _WORD v35[9];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "formattedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = self;
    v34 = 2114;
    *(_QWORD *)v35 = v6;
    _os_log_impl(&dword_1D19F1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <--- %{public}@", buf, 0x16u);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF76A8]), "initWithATPMessage:", v4);
  sentRequestsByID = self->_sentRequestsByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sentRequestsByID, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = self->_sentRequestsByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

    receivedResponsesByID = self->_receivedResponsesByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](receivedResponsesByID, "setObject:forKey:", v7, v14);

    if (objc_msgSend(v4, "additionalPayload"))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0F0]), "initWithQueue:", self->_queue);
      objc_msgSend(v15, "setCompressed:", (objc_msgSend(v7, "options") >> 1) & 1);
      objc_msgSend(v15, "inputStream");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDataStream:", v16);

      responseWritersByID = self->_responseWritersByID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](responseWritersByID, "setObject:forKey:", v15, v18);

      objc_msgSend(v15, "start");
      _ATLogCategoryFramework();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v4, "messageID");
        v21 = objc_msgSend(v15, "isCompressed");
        *(_DWORD *)buf = 138543874;
        v33 = self;
        v34 = 1024;
        *(_DWORD *)v35 = v20;
        v35[2] = 1024;
        *(_DWORD *)&v35[3] = v21;
        _os_log_impl(&dword_1D19F1000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Opened data stream for response ID %d, isCompressed=%{BOOL}u", buf, 0x18u);
      }

    }
    completionHandlersByRequestID = self->_completionHandlersByRequestID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "messageID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](completionHandlersByRequestID, "objectForKey:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = self->_completionHandlersByRequestID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "messageID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v25, "removeObjectForKey:", v26);

      callbackQueue = self->_callbackQueue;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __50__ATConcreteMessageLink__processIncomingResponse___block_invoke;
      v29[3] = &unk_1E928C940;
      v24 = v24;
      v31 = v24;
      v30 = v7;
      dispatch_async(callbackQueue, v29);

    }
  }
  else
  {
    _ATLogCategoryFramework();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v7, "messageID");
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 1024;
      *(_DWORD *)v35 = v28;
      _os_log_impl(&dword_1D19F1000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Received incoming response for unknown message ID %d", buf, 0x12u);
    }
  }

}

- (void)_processIncomingPartialResponse:(id)a3
{
  id v4;
  NSMutableDictionary *sentRequestsByID;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  ATConcreteMessageLink *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sentRequestsByID = self->_sentRequestsByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sentRequestsByID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  }
  else
  {
    _ATLogCategoryFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 1024;
      v12 = objc_msgSend(v4, "messageID");
      _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Received incoming partial response for unknown message ID %d", (uint8_t *)&v9, 0x12u);
    }

  }
}

- (void)_processIncomingDataResponse:(id)a3
{
  id v4;
  NSMutableDictionary *receivedResponsesByID;
  void *v6;
  void *v7;
  ATSignatureProvider *signatureProvider;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *responseWritersByID;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  int v19;
  double Current;
  double v21;
  double v22;
  NSObject *v23;
  double v24;
  uint64_t v25;
  double v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  ATConcreteMessageLink *v33;
  void *v34;
  id v35;
  _BYTE buf[22];
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  receivedResponsesByID = self->_receivedResponsesByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](receivedResponsesByID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_8;
  if (!self->_signatureProvider)
    goto LABEL_8;
  if ((objc_msgSend(v7, "options") & 1) == 0)
    goto LABEL_8;
  signatureProvider = self->_signatureProvider;
  objc_msgSend(v4, "payloadSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSignatureProvider verifySignature:forData:](signatureProvider, "verifySignature:forData:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_8:
    responseWritersByID = self->_responseWritersByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](responseWritersByID, "objectForKey:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || -[ATConcreteMessageLink _isWriterPendingStopForforMessage:](self, "_isWriterPendingStopForforMessage:", v4))
    {
      goto LABEL_24;
    }
    if (objc_msgSend(v4, "hasPayload"))
    {
      objc_msgSend(v4, "payload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v16 = objc_msgSend(v11, "writeAllData:error:", v15, &v35);
      v17 = v35;

      if ((v16 & 1) == 0)
      {
        _ATLogCategoryFramework();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = objc_msgSend(v4, "messageID");
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v17;
          v37 = 2048;
          v38 = *(double *)&v11;
          v39 = 1024;
          LODWORD(v40) = v19;
          _os_log_impl(&dword_1D19F1000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Error=%{public}@ writing to data stream, stopping %p for response=%u", buf, 0x26u);
        }

        goto LABEL_21;
      }
    }
    else
    {
      v17 = 0;
    }
    if ((objc_msgSend(v4, "additionalPayload") & 1) != 0)
    {
LABEL_23:

      goto LABEL_24;
    }
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v11, "timestamp");
    v22 = v21;
    _ATLogCategoryFramework();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = Current - v22;
      v25 = objc_msgSend(v11, "bytesWritten");
      v26 = (double)(unint64_t)objc_msgSend(v11, "bytesWritten") / v24;
      v27 = objc_msgSend(v4, "messageID");
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v25;
      v37 = 2048;
      v38 = v24;
      v39 = 2048;
      v40 = v26;
      v41 = 1024;
      v42 = v27;
      _os_log_impl(&dword_1D19F1000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished streaming %llu bytes in %.2f seconds (%.2f b/s) for response %u", buf, 0x30u);
    }

    if (objc_msgSend(v4, "hasStreamError"))
    {
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "streamError");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = objc_msgSend(v28, "domainCode");
      objc_msgSend(v4, "streamError");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&buf[8] = objc_msgSend(v29, "code");

      v30 = objc_msgSend(v4, "messageID");
      v31 = objc_msgSend(v4, "messageType");
      v32 = buf;
      v33 = self;
      v34 = v11;
LABEL_22:
      -[ATConcreteMessageLink _stopWriter:byInjectingStreamError:forMessageId:type:](v33, "_stopWriter:byInjectingStreamError:forMessageId:type:", v34, v32, v30, v31);
      goto LABEL_23;
    }
LABEL_21:
    v30 = objc_msgSend(v4, "messageID");
    v31 = objc_msgSend(v4, "messageType");
    v33 = self;
    v34 = v11;
    v32 = 0;
    goto LABEL_22;
  }
  _ATLogCategoryFramework();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1D19F1000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to verify payload signature: %{public}@", buf, 0x16u);
  }

  -[ATConcreteMessageLink close](self, "close");
LABEL_24:

}

- (void)_checkMessageTimeouts
{
  NSObject *v3;
  double Current;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *callbackQueue;
  NSObject *v25;
  NSMutableDictionary *streamReadersByID;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  double v33;
  NSObject *queue;
  NSObject *v35;
  uint64_t v36;
  NSMutableDictionary *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  double v43;
  void *v44;
  NSObject *v45;
  double lastActivityTime;
  int64_t idleTimeoutExceptionCount;
  int64_t keepAliveExceptionCount;
  void *v49;
  NSObject *v50;
  __int128 v51;
  id obj;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD block[4];
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  ATConcreteMessageLink *v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v72 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking for message timeouts ....", buf, 0xCu);
  }

  Current = CFAbsoluteTimeGetCurrent();
  -[NSMutableDictionary allKeys](self->_sentRequestsByID, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138543618;
    v72 = self;
    v73 = 2048;
    v74 = *(double *)&v7;
    _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sentRequestIds count=%lu ....", buf, 0x16u);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v68;
    *(_QWORD *)&v9 = 138543618;
    v51 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v68 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_sentRequestsByID, "objectForKey:", v13, v51);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timestamp");
        if (Current - v15 > 45.0)
        {
          _ATLogCategoryFramework();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v51;
            v72 = self;
            v73 = 2114;
            v74 = *(double *)&v14;
            _os_log_impl(&dword_1D19F1000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Timing out sent request %{public}@", buf, 0x16u);
          }

          -[NSMutableDictionary objectForKey:](self->_streamReadersByID, "objectForKey:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "didEncounterErrorBlock");
            v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 2, CFSTR("request timed out"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v19)[2](v19, v20);

          }
          -[NSMutableDictionary removeObjectForKey:](self->_sentRequestsByID, "removeObjectForKey:", v13);
          -[NSMutableDictionary objectForKey:](self->_completionHandlersByRequestID, "objectForKey:", v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_completionHandlersByRequestID, "removeObjectForKey:", v13);
            _ATLogCategoryFramework();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = objc_msgSend(v13, "longLongValue");
              *(_DWORD *)buf = v51;
              v72 = self;
              v73 = 2048;
              v74 = *(double *)&v23;
              _os_log_impl(&dword_1D19F1000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Calling completion block for timed out messgage if %lld", buf, 0x16u);
            }

            callbackQueue = self->_callbackQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke;
            block[3] = &unk_1E928C940;
            v66 = v21;
            v65 = v14;
            dispatch_async(callbackQueue, block);

          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v10);
  }

  _ATLogCategoryFramework_Oversize();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    streamReadersByID = self->_streamReadersByID;
    *(_DWORD *)buf = 138543618;
    v72 = self;
    v73 = 2114;
    v74 = *(double *)&streamReadersByID;
    _os_log_impl(&dword_1D19F1000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping remaining readers %{public}@", buf, 0x16u);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[NSMutableDictionary allKeys](self->_streamReadersByID, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v61 != v30)
          objc_enumerationMutation(v27);
        -[NSMutableDictionary objectForKey:](self->_streamReadersByID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "timestamp");
        if (Current - v33 > 300.0)
        {
          queue = self->_queue;
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke_66;
          v58[3] = &unk_1E928CC80;
          v59 = v32;
          dispatch_async(queue, v58);

        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
    }
    while (v29);
  }

  _ATLogCategoryFramework();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = -[NSMutableDictionary count](self->_receivedRequestsByID, "count");
    *(_DWORD *)buf = 138543618;
    v72 = self;
    v73 = 2048;
    v74 = *(double *)&v36;
    _os_log_impl(&dword_1D19F1000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ _receivedRequestsByID count=%lu ....", buf, 0x16u);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v37 = self->_receivedRequestsByID;
  v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v54, v81, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v55 != v40)
          objc_enumerationMutation(v37);
        -[NSMutableDictionary objectForKey:](self->_receivedRequestsByID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "timestamp");
        if (Current - v43 > 22.0)
        {
          objc_msgSend(v42, "partialResponseWithParameters:", 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATConcreteMessageLink sendPartialResponse:withCompletion:](self, "sendPartialResponse:withCompletion:", v44, 0);

        }
      }
      v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v54, v81, 16);
    }
    while (v39);
  }

  _ATLogCategoryFramework();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    lastActivityTime = self->_lastActivityTime;
    idleTimeoutExceptionCount = self->_idleTimeoutExceptionCount;
    keepAliveExceptionCount = self->_keepAliveExceptionCount;
    *(_DWORD *)buf = 138544386;
    v72 = self;
    v73 = 2048;
    v74 = Current;
    v75 = 2048;
    v76 = lastActivityTime;
    v77 = 1024;
    v78 = idleTimeoutExceptionCount;
    v79 = 1024;
    v80 = keepAliveExceptionCount;
    _os_log_impl(&dword_1D19F1000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ now=%f, _lastActivityTime=%f, _idleTimeoutExceptionCount=%d, _keepAliveExceptionCount=%d", buf, 0x2Cu);
  }

  if (Current - self->_lastActivityTime > 45.0)
  {
    if (self->_idleTimeoutExceptionCount)
    {
      if (!self->_keepAliveExceptionCount)
      {
        v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF76A0]), "initWithCommand:dataClass:parameters:", CFSTR("Ping"), 0, 0);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke_69;
        v53[3] = &unk_1E928CA78;
        v53[4] = self;
        -[ATConcreteMessageLink sendRequest:withCompletion:](self, "sendRequest:withCompletion:", v49, v53);

      }
    }
    else
    {
      _ATLogCategoryFramework();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v72 = self;
        _os_log_impl(&dword_1D19F1000, v50, OS_LOG_TYPE_ERROR, "idle timeout expired for %{public}@ - closing", buf, 0xCu);
      }

      -[ATConcreteMessageLink close](self, "close");
    }
  }

}

- (BOOL)_sendMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v17;
  void *v18;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ATConcreteMessageLink socket](self, "socket");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isOpen");

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 3, CFSTR("underlying socket for link closed"));
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_23;
  }
  self->_lastActivityTime = CFAbsoluteTimeGetCurrent();
  if (!objc_msgSend(v6, "messageType")
    || objc_msgSend(v6, "messageType") == 1
    || objc_msgSend(v6, "messageType") == 2)
  {
    _ATLogCategoryFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      objc_msgSend(v6, "formattedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = self;
      *(_WORD *)&v20[12] = 2114;
      *(_QWORD *)&v20[14] = v10;
      _os_log_impl(&dword_1D19F1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ ---> %{public}@", v20, 0x16u);

    }
  }
  else
  {
    if ((objc_msgSend(v6, "hasAdditionalPayload") & 1) != 0)
      goto LABEL_8;
    _ATLogCategoryFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
  }

LABEL_8:
  objc_msgSend(v6, "data", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "length");
  v12 = PBDataWriterWriteBareVarint();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "appendBytes:length:", v20, v12);
  objc_msgSend(v13, "appendData:", v11);
  -[ATConcreteMessageLink socket](self, "socket");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "writeAllData:error:", v13, a4);

  if ((v15 & 1) != 0)
  {
    if ((objc_msgSend(v6, "hasAdditionalPayload") & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      -[ATConcreteMessageLink socket](self, "socket");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "flush");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v18 == 0;
      if (a4 && v18)
        *a4 = objc_retainAutorelease(v18);

    }
  }
  else
  {
    if (a4 && !*a4)
    {
      +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 3, CFSTR("failed to write message to socket"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[ATConcreteMessageLink close](self, "close");
    v16 = 0;
  }

LABEL_23:
  return v16;
}

- (id)_getObservers
{
  NSObject *handlerAccessQueue;
  NSObject *v4;
  int v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  ATConcreteMessageLink *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1470;
  v13 = __Block_byref_object_dispose__1471;
  v14 = 0;
  handlerAccessQueue = self->_handlerAccessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__ATConcreteMessageLink__getObservers__block_invoke;
  v8[3] = &unk_1E928CCA8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(handlerAccessQueue, v8);
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend((id)v10[5], "count");
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Returning %d observers", buf, 0x12u);
  }

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_stopWriter:(id)a3 byInjectingStreamError:(id *)a4 forMessageId:(unsigned int)a5 type:(int)a6
{
  uint64_t v7;
  id v10;
  NSMutableSet *responseWritersPendingStopByID;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSMutableSet *requestWritersPendingStopByID;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  NSMutableSet *v20;
  void *v21;
  NSObject *v22;
  NSMutableSet *v23;
  uint64_t *v24;
  NSMutableSet *v25;
  void *v26;
  NSObject *v27;
  NSMutableSet *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  ATConcreteMessageLink *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  ATConcreteMessageLink *v39;
  uint64_t v40;
  uint8_t buf[4];
  ATConcreteMessageLink *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  $C9A20311543CE7131523B4F7AC24AF8E *v46;
  __int16 v47;
  NSMutableSet *v48;
  uint64_t v49;

  v7 = *(_QWORD *)&a5;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (a6 > 4)
  {
    _ATLogCategoryFramework();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v42 = self;
      v43 = 1024;
      v44 = v7;
      v45 = 1024;
      LODWORD(v46) = a6;
      v14 = "%{public}@ Cannot stop writer for invalid message ID %d, type %d";
      v17 = v13;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 24;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (((1 << a6) & 0x16) != 0)
  {
    responseWritersPendingStopByID = self->_responseWritersPendingStopByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(responseWritersPendingStopByID) = -[NSMutableSet containsObject:](responseWritersPendingStopByID, "containsObject:", v12);

    if ((responseWritersPendingStopByID & 1) != 0)
    {
      _ATLogCategoryFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v42 = self;
        v43 = 1024;
        v44 = v7;
        v14 = "%{public}@ Response writer for ID %d is already pending stop";
LABEL_9:
        v17 = v13;
        v18 = OS_LOG_TYPE_DEFAULT;
        v19 = 18;
LABEL_17:
        _os_log_impl(&dword_1D19F1000, v17, v18, v14, buf, v19);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    v20 = self->_responseWritersPendingStopByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v20, "addObject:", v21);

    _ATLogCategoryFramework_Oversize();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_responseWritersPendingStopByID;
      *(_DWORD *)buf = 138544130;
      v42 = self;
      v43 = 1024;
      v44 = v7;
      v45 = 2048;
      v46 = a4;
      v47 = 2114;
      v48 = v23;
      _os_log_impl(&dword_1D19F1000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping response writer for ID %d, error=%p, _requestWritersPendingStopByID=%{public}@", buf, 0x26u);
    }

    if (a4)
      objc_msgSend(v10, "writeStreamError:", a4->var0, *(_QWORD *)&a4->var1);
    dispatch_group_enter((dispatch_group_t)self->_stopReadersAndWritersGroup);
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __78__ATConcreteMessageLink__stopWriter_byInjectingStreamError_forMessageId_type___block_invoke_76;
    v32 = &unk_1E928CAA0;
    v33 = self;
    LODWORD(v34) = v7;
    v24 = &v29;
LABEL_24:
    objc_msgSend(v10, "stopWithCompletion:", v24, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_25;
  }
  requestWritersPendingStopByID = self->_requestWritersPendingStopByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(requestWritersPendingStopByID) = -[NSMutableSet containsObject:](requestWritersPendingStopByID, "containsObject:", v16);

  if ((requestWritersPendingStopByID & 1) == 0)
  {
    v25 = self->_requestWritersPendingStopByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v25, "addObject:", v26);

    _ATLogCategoryFramework_Oversize();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_requestWritersPendingStopByID;
      *(_DWORD *)buf = 138544130;
      v42 = self;
      v43 = 1024;
      v44 = v7;
      v45 = 2048;
      v46 = a4;
      v47 = 2114;
      v48 = v28;
      _os_log_impl(&dword_1D19F1000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping request writer for ID %d, error=%p, _requestWritersPendingStopByID=%{public}@", buf, 0x26u);
    }

    if (a4)
      objc_msgSend(v10, "writeStreamError:", a4->var0, *(_QWORD *)&a4->var1);
    dispatch_group_enter((dispatch_group_t)self->_stopReadersAndWritersGroup);
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __78__ATConcreteMessageLink__stopWriter_byInjectingStreamError_forMessageId_type___block_invoke;
    v38 = &unk_1E928CAA0;
    v39 = self;
    LODWORD(v40) = v7;
    v24 = &v35;
    goto LABEL_24;
  }
  _ATLogCategoryFramework();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v42 = self;
    v43 = 1024;
    v44 = v7;
    v14 = "%{public}@ Request writer for ID %d is already pending stop";
    goto LABEL_9;
  }
LABEL_18:

LABEL_25:
}

- (BOOL)_isWriterPendingStopForforMessage:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "messageType");
  if (v5 > 4)
  {
    v9 = 0;
  }
  else
  {
    if (((1 << v5) & 0x16) != 0)
      v6 = 104;
    else
      v6 = 96;
    v7 = *(Class *)((char *)&self->super.super.isa + v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

  }
  return v9;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (ATSignatureProvider)signatureProvider
{
  return self->_signatureProvider;
}

- (void)setSignatureProvider:(id)a3
{
  objc_storeStrong((id *)&self->_signatureProvider, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (double)lastActivityTime
{
  return self->_lastActivityTime;
}

- (void)setLastActivityTime:(double)a3
{
  self->_lastActivityTime = a3;
}

- (ATSocket)socket
{
  return self->_socket;
}

- (NSString)guid
{
  return self->_guid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_signatureProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_stopReadersAndWritersGroup, 0);
  objc_storeStrong((id *)&self->_handlerAccessQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_requestHandlersByDataClass, 0);
  objc_storeStrong((id *)&self->_requestReadersPendingStopByID, 0);
  objc_storeStrong((id *)&self->_responseWritersPendingStopByID, 0);
  objc_storeStrong((id *)&self->_requestWritersPendingStopByID, 0);
  objc_storeStrong((id *)&self->_streamReadersByID, 0);
  objc_storeStrong((id *)&self->_responseWritersByID, 0);
  objc_storeStrong((id *)&self->_requestWritersByID, 0);
  objc_storeStrong((id *)&self->_completionHandlersByResponseID, 0);
  objc_storeStrong((id *)&self->_completionHandlersByRequestID, 0);
  objc_storeStrong((id *)&self->_receivedResponsesByID, 0);
  objc_storeStrong((id *)&self->_receivedRequestsByID, 0);
  objc_storeStrong((id *)&self->_sentRequestsByID, 0);
  objc_storeStrong((id *)&self->_outputStreamsToInputStreams, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_socket, 0);
}

void __78__ATConcreteMessageLink__stopWriter_byInjectingStreamError_forMessageId_type___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 144));
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Writer for request ID %d was stopped successfully - removing from our collection", (uint8_t *)&v9, 0x12u);
  }

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 168));
}

void __78__ATConcreteMessageLink__stopWriter_byInjectingStreamError_forMessageId_type___block_invoke_76(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 144));
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Writer for response ID %d was stopped successfully - removing from our collection", (uint8_t *)&v9, 0x12u);
  }

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 168));
}

void __38__ATConcreteMessageLink__getObservers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 2, CFSTR("message %u timed out"), objc_msgSend(*(id *)(a1 + 32), "messageID"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke_66(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "didEncounterErrorBlock");
  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 2, CFSTR("stream reader %@ timed out"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2);

}

void __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _ATLogCategoryFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1D19F1000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send ping request: error=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }

}

uint64_t __50__ATConcreteMessageLink__processIncomingResponse___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __49__ATConcreteMessageLink__processIncomingRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to send ping response. error=%{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }

}

uint64_t __49__ATConcreteMessageLink__processIncomingRequest___block_invoke_59(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "messageLink:didReceiveRequest:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __49__ATConcreteMessageLink__processIncomingRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __49__ATConcreteMessageLink__processIncomingMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (!v2)
    goto LABEL_18;
  objc_msgSend(*(id *)(a1 + 40), "paramsSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verifySignature:forData:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ATLogCategoryFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to verify params signature: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }
  else
  {
LABEL_18:
    v8 = (void *)MEMORY[0x1D8230CE4]();
    v9 = objc_msgSend(*(id *)(a1 + 40), "messageType");
    switch(v9)
    {
      case 0:
        objc_msgSend(*(id *)(a1 + 32), "_processIncomingRequest:", *(_QWORD *)(a1 + 40));
        break;
      case 1:
        objc_msgSend(*(id *)(a1 + 32), "_processIncomingResponse:", *(_QWORD *)(a1 + 40));
        break;
      case 2:
        objc_msgSend(*(id *)(a1 + 32), "_processIncomingPartialResponse:", *(_QWORD *)(a1 + 40));
        break;
      case 3:
        objc_msgSend(*(id *)(a1 + 32), "_processIncomingDataRequest:", *(_QWORD *)(a1 + 40));
        break;
      case 4:
        objc_msgSend(*(id *)(a1 + 32), "_processIncomingDataResponse:", *(_QWORD *)(a1 + 40));
        break;
      default:
        _ATLogCategoryFramework();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = 138543618;
          v13 = v11;
          v14 = 1024;
          LODWORD(v15) = v9;
          _os_log_impl(&dword_1D19F1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Received message with unknown type %d", (uint8_t *)&v12, 0x12u);
        }

        break;
    }
    objc_autoreleasePoolPop(v8);
  }
}

uint64_t __73__ATConcreteMessageLink__invokeCompletionHandlerForResponseID_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  id v17;
  uint8_t buf[4];
  dispatch_queue_t *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 64));
  dispatch_assert_queue_V2(WeakRetained[18]);
  v5 = objc_loadWeakRetained((id *)(a1 + 72));
  if (v5 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "ATPMessageWithPayloadData:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject setAdditionalPayload:](v6, "setAdditionalPayload:", 1);
    if (WeakRetained[26] && objc_msgSend(v3, "length") && (objc_msgSend(*(id *)(a1 + 32), "options") & 1) != 0)
    {
      v7 = WeakRetained[26];
      v17 = 0;
      -[NSObject createSignature:forData:](v7, "createSignature:forData:", &v17, v3);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      if (v8)
      {
        _ATLogCategorySyncBundle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v19 = WeakRetained;
          v20 = 2114;
          *(_QWORD *)v21 = v8;
          _os_log_impl(&dword_1D19F1000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create signature for payload data: %{public}@", buf, 0x16u);
        }

        goto LABEL_18;
      }
      -[NSObject setPayloadSignature:](v6, "setPayloadSignature:", v9);

    }
    v16 = 0;
    v12 = -[dispatch_queue_t _sendMessage:error:](WeakRetained, "_sendMessage:error:", v6, &v16);
    v8 = v16;
    if ((v12 & 1) != 0)
    {
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, objc_msgSend(v3, "length"));
      goto LABEL_19;
    }
    _ATLogCategorySyncBundle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 138543874;
      v19 = WeakRetained;
      v20 = 1024;
      *(_DWORD *)v21 = v14;
      v21[2] = 2114;
      *(_QWORD *)&v21[3] = v8;
      _os_log_impl(&dword_1D19F1000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send data for message ID %d: %{public}@", buf, 0x1Cu);
    }
LABEL_18:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(v5, "didEncounterErrorBlock");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v15)[2](v15, v8);

LABEL_19:
    goto LABEL_20;
  }
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 138543618;
    v19 = WeakRetained;
    v20 = 1024;
    *(_DWORD *)v21 = v11;
    _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Not processing message id %d", buf, 0x12u);
  }
LABEL_20:

}

void __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATPError *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  dispatch_queue_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  dispatch_queue_t v21;
  void *v22;
  dispatch_queue_t v23;
  void *v24;
  void *v25;
  dispatch_queue_t *v26;
  uint64_t v27;
  _QWORD v28[4];
  dispatch_queue_t *v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  dispatch_queue_t *v33;
  __int16 v34;
  _BYTE v35[14];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 56));
  dispatch_assert_queue_V2(WeakRetained[18]);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    v33 = WeakRetained;
    v34 = 1024;
    *(_DWORD *)v35 = v6;
    *(_WORD *)&v35[4] = 2114;
    *(_QWORD *)&v35[6] = v3;
    _os_log_impl(&dword_1D19F1000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Did encounter error reading input stream for message ID %d: %{public}@", buf, 0x1Cu);
  }

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ATPMessageWithPayloadData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(ATPError);
  objc_msgSend(v9, "setStreamError:", v10);

  v11 = objc_msgSend(v3, "code");
  objc_msgSend(v9, "streamError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCode:", v11);

  objc_msgSend(v9, "streamError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDomainCode:", -1);

  v31 = 0;
  LODWORD(v12) = -[dispatch_queue_t _sendMessage:error:](WeakRetained, "_sendMessage:error:", v9, &v31);
  v14 = v31;
  -[dispatch_queue_t _invokeCompletionHandlerForResponseID:withError:](WeakRetained, "_invokeCompletionHandlerForResponseID:withError:", *(_QWORD *)(a1 + 64), v14);
  if ((_DWORD)v12 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v17 = WeakRetained[14];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = -[NSObject containsObject:](v17, "containsObject:", v18);

    if ((v17 & 1) == 0)
    {
      _ATLogCategoryFramework();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138543618;
        v33 = WeakRetained;
        v34 = 1024;
        *(_DWORD *)v35 = v20;
        _os_log_impl(&dword_1D19F1000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing stop for message %d", buf, 0x12u);
      }

      v21 = WeakRetained[14];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v21, "addObject:", v22);

      v23 = WeakRetained[11];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v23, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        dispatch_group_enter(WeakRetained[21]);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_52;
        v28[3] = &unk_1E928C9B8;
        v26 = WeakRetained;
        v27 = *(_QWORD *)(a1 + 64);
        v29 = v26;
        v30 = v27;
        objc_msgSend(v25, "stopWithCompletion:", v28);

      }
    }
  }
  else
  {
    _ATLogCategorySyncBundle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 138543874;
      v33 = WeakRetained;
      v34 = 2114;
      *(_QWORD *)v35 = v14;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = v16;
      _os_log_impl(&dword_1D19F1000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send message: %{public}@, shouldCloseMessageLink %d", buf, 0x1Cu);
    }

    -[dispatch_queue_t close](WeakRetained, "close");
  }

}

void __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_2(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  dispatch_queue_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  dispatch_queue_t *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[18]);
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v15 = WeakRetained;
    v16 = 1024;
    LODWORD(v17) = v4;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Did finish reading input stream for message ID %d", buf, 0x12u);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ATPMessageWithPayloadData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v8 = -[dispatch_queue_t _sendMessage:error:](WeakRetained, "_sendMessage:error:", v7, &v13);
  v9 = v13;
  -[dispatch_queue_t _invokeCompletionHandlerForResponseID:withError:](WeakRetained, "_invokeCompletionHandlerForResponseID:withError:", *(_QWORD *)(a1 + 48), v9);
  v10 = WeakRetained[11];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject removeObjectForKey:](v10, "removeObjectForKey:", v11);

  if ((v8 & 1) == 0)
  {
    _ATLogCategorySyncBundle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = WeakRetained;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_1D19F1000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send message: %{public}@", buf, 0x16u);
    }

    -[dispatch_queue_t close](WeakRetained, "close");
  }

}

void __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_52(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 144));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 168));
}

void __60__ATConcreteMessageLink_sendPartialResponse_withCompletion___block_invoke(id *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  int v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (*((_BYTE *)v2 + 185))
  {
    v3 = (void *)v2[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1[5], "messageID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1[5], "ATPMessage");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = (id)*((_QWORD *)a1[4] + 26);
      if (v8
        && (v27 = 0,
            -[NSObject parameters](v6, "parameters"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "createSignature:forData:", &v27, v9),
            v10 = (id)objc_claimAutoreleasedReturnValue(),
            v8 = v27,
            v9,
            v10))
      {
        _ATLogCategoryFramework();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = a1[4];
          *(_DWORD *)buf = 138543618;
          v29 = v12;
          v30 = 2114;
          v31 = v10;
          _os_log_impl(&dword_1D19F1000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to sign response params: %{public}@", buf, 0x16u);
        }

        objc_msgSend(a1[4], "close");
      }
      else
      {
        -[NSObject setParamsSignature:](v7, "setParamsSignature:", v8);
        v17 = a1[4];
        v26 = 0;
        objc_msgSend(v17, "_sendMessage:error:", v7, &v26);
        v10 = v26;
      }
      v18 = *((_QWORD *)a1[4] + 19);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __60__ATConcreteMessageLink_sendPartialResponse_withCompletion___block_invoke_40;
      v23[3] = &unk_1E928C940;
      v19 = a1[6];
      v24 = v10;
      v25 = v19;
      v20 = v10;
      dispatch_async(v18, v23);

    }
    else
    {
      _ATLogCategoryFramework();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = a1[4];
        v22 = objc_msgSend(a1[5], "messageID");
        *(_DWORD *)buf = 138543618;
        v29 = v21;
        v30 = 1024;
        LODWORD(v31) = v22;
        _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Received outgoing response for unknown message ID %d", buf, 0x12u);
      }
    }

    goto LABEL_17;
  }
  _ATLogCategoryFramework();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = a1[4];
    v15 = a1[5];
    *(_DWORD *)buf = 138543618;
    v29 = v14;
    v30 = 2114;
    v31 = v15;
    _os_log_impl(&dword_1D19F1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Not sending partial response %{public}@ as the link is closed", buf, 0x16u);
  }

  v16 = (void (**)(id, void *))a1[6];
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v5);
LABEL_17:

  }
}

uint64_t __60__ATConcreteMessageLink_sendPartialResponse_withCompletion___block_invoke_40(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __62__ATConcreteMessageLink_sendResponse_withProgress_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 185))
  {
    v3 = *(void **)(v2 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = *(void **)(a1 + 48);
      if (v6)
      {
        v7 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
        v8 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v8, v9);

      }
      objc_msgSend(*(id *)(a1 + 40), "ATPMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dataStream");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "_prepareStreamReaderForMessage:withProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPayload:", v12);

        objc_msgSend(v10, "setAdditionalPayload:", 1);
      }
      v13 = *(id *)(*(_QWORD *)(a1 + 32) + 208);
      if (v13
        && (v41 = 0,
            objc_msgSend(v10, "parameters"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v13, "createSignature:forData:", &v41, v14),
            v15 = (id)objc_claimAutoreleasedReturnValue(),
            v13 = v41,
            v14,
            v15))
      {
        _ATLogCategoryFramework();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v43 = v17;
          v44 = 2114;
          v45 = v15;
          _os_log_impl(&dword_1D19F1000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to sign response params: %{public}@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "close");
      }
      else
      {
        objc_msgSend(v10, "setParamsSignature:", v13);
        v22 = *(void **)(a1 + 32);
        v40 = 0;
        v23 = objc_msgSend(v22, "_sendMessage:error:", v10, &v40);
        v15 = v40;
        if ((v23 & 1) == 0)
        {
          _ATLogCategoryFramework();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v10, "formattedDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v25;
            v44 = 2114;
            v45 = v26;
            v46 = 2114;
            v47 = v15;
            _os_log_impl(&dword_1D19F1000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send response %{public}@. err=%{public}@", buf, 0x20u);

          }
        }
      }
      v27 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeObjectForKey:", v28);

      objc_msgSend(*(id *)(a1 + 40), "dataStream");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29 || v15)
      {
        v30 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObjectForKey:", v31);

        v32 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 152);
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __62__ATConcreteMessageLink_sendResponse_withProgress_completion___block_invoke_39;
        v37[3] = &unk_1E928C940;
        v39 = *(id *)(a1 + 48);
        v38 = v15;
        dispatch_async(v32, v37);

      }
    }
    else
    {
      _ATLogCategoryFramework();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = *(_QWORD *)(a1 + 32);
        v35 = objc_msgSend(*(id *)(a1 + 40), "messageID");
        *(_DWORD *)buf = 138543618;
        v43 = v34;
        v44 = 1024;
        LODWORD(v45) = v35;
        _os_log_impl(&dword_1D19F1000, v33, OS_LOG_TYPE_ERROR, "%{public}@ Received outgoing response for unknown message ID %d", buf, 0x12u);
      }

      v36 = *(_QWORD *)(a1 + 48);
      if (!v36)
      {
        v5 = 0;
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 23, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v10);
    }

LABEL_29:
    return;
  }
  _ATLogCategoryFramework();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v43 = v19;
    v44 = 2114;
    v45 = v20;
    _os_log_impl(&dword_1D19F1000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Not sending response %{public}@ as the link is closed", buf, 0x16u);
  }

  v21 = *(_QWORD *)(a1 + 48);
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v5);
    goto LABEL_29;
  }
}

uint64_t __62__ATConcreteMessageLink_sendResponse_withProgress_completion___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __52__ATConcreteMessageLink_sendRequest_withCompletion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[185])
  {
    objc_msgSend(*(id *)(a1 + 40), "setMessageID:", objc_msgSend(v2, "_nextRequestID"));
    objc_msgSend(*(id *)(a1 + 40), "ATPMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dataStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_prepareStreamReaderForMessage:withProgress:", *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPayload:", v5);

      objc_msgSend(v3, "setAdditionalPayload:", 1);
    }
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 208);
    if (v6
      && (v32 = 0,
          objc_msgSend(v3, "parameters"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "createSignature:forData:", &v32, v7),
          v8 = (id)objc_claimAutoreleasedReturnValue(),
          v6 = v32,
          v7,
          v8))
    {
      _ATLogCategoryFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v34 = v10;
        v35 = 2114;
        v36 = v8;
        _os_log_impl(&dword_1D19F1000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to sign request params: %{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "close");
    }
    else
    {
      objc_msgSend(v3, "setParamsSignature:", v6);
      objc_msgSend(*(id *)(a1 + 40), "setTimestamp:", CFAbsoluteTimeGetCurrent());
      v11 = *(void **)(a1 + 32);
      v31 = 0;
      v12 = objc_msgSend(v11, "_sendMessage:error:", v3, &v31);
      v8 = v31;
      if ((v12 & 1) != 0)
      {
        v13 = *(void **)(a1 + 48);
        if (v13)
        {
          v14 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
          v15 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v15, v16);

        }
        v17 = *(void **)(a1 + 40);
        v18 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v17, "messageID"));
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v17, v19);
      }
      else
      {
        _ATLogCategoryFramework();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v24 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v3, "formattedDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v34 = v24;
          v35 = 2114;
          v36 = v25;
          v37 = 2114;
          v38 = v8;
          _os_log_impl(&dword_1D19F1000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send request %{public}@. err=%{public}@", buf, 0x20u);

        }
      }

      if (!v8)
        goto LABEL_22;
    }
    v26 = *(void **)(a1 + 48);
    if (v26)
    {
      v27 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 152);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __52__ATConcreteMessageLink_sendRequest_withCompletion___block_invoke_38;
      v28[3] = &unk_1E928C940;
      v30 = v26;
      v8 = v8;
      v29 = v8;
      dispatch_async(v27, v28);

    }
LABEL_22:

    goto LABEL_23;
  }
  _ATLogCategoryFramework();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v34 = v21;
    v35 = 2114;
    v36 = v22;
    _os_log_impl(&dword_1D19F1000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Not sending request %{public}@ as the link is closed", buf, 0x16u);
  }

  v23 = *(_QWORD *)(a1 + 48);
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v3);
LABEL_23:

  }
}

uint64_t __52__ATConcreteMessageLink_sendRequest_withCompletion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __40__ATConcreteMessageLink_removeObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObject:", *(_QWORD *)(a1 + 40));
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed observer %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

void __37__ATConcreteMessageLink_addObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Added observer %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

void __58__ATConcreteMessageLink_removeRequestHandlerForDataClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Removed request for dataclass %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

void __56__ATConcreteMessageLink_addRequestHandler_forDataClass___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 120), "setObject:forKey:", a1[5], a1[6]);
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = 138543874;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered request handler %{public}@ for dataclass %{public}@", (uint8_t *)&v6, 0x20u);
  }

}

void __30__ATConcreteMessageLink_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  _QWORD block[5];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[6];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 136);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(unsigned __int8 *)(v2 + 185);
  _ATLogCategoryFramework();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v83 = v9;
      _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Closing ...", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 185) = 0;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
    {
      _ATLogCategoryFramework();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = objc_msgSend(*(id *)(v11 + 32), "count");
        v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
        *(_DWORD *)buf = 138543874;
        v83 = v11;
        v84 = 2048;
        v85 = v12;
        v86 = 2048;
        v87 = v13;
        _os_log_impl(&dword_1D19F1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Abandoning %lu sent and %lu received messages", buf, 0x20u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeDelegate:");
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isOpen"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "close");
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 8);
    *(_QWORD *)(v14 + 8) = 0;

    _ATLogCategoryFramework_Oversize();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(v17 + 88);
      *(_DWORD *)buf = 138543618;
      v83 = v17;
      v84 = 2114;
      v85 = v18;
      _os_log_impl(&dword_1D19F1000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ _streamReadersByID=%{public}@", buf, 0x16u);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v19 = 88;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v76;
      v25 = 0x1EFC67000uLL;
      *(_QWORD *)&v22 = 138543618;
      v61 = v22;
      do
      {
        v26 = 0;
        v62 = v23;
        do
        {
          if (*(_QWORD *)v76 != v24)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v26);
          v28 = *(int *)(v25 + 3636);
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v28), "containsObject:", v27, v61) & 1) == 0)
          {
            _ATLogCategoryFramework();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = v24;
              v31 = v25;
              v32 = v20;
              v33 = v19;
              v34 = *(_QWORD *)(a1 + 32);
              v35 = objc_msgSend(v27, "integerValue");
              *(_DWORD *)buf = v61;
              v83 = v34;
              v19 = v33;
              v20 = v32;
              v25 = v31;
              v24 = v30;
              v23 = v62;
              v84 = 1024;
              LODWORD(v85) = v35;
              _os_log_impl(&dword_1D19F1000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing stop for message %d", buf, 0x12u);
            }

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v19), "objectForKey:", v27);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v28), "addObject:", v27);
              dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 168));
              v74[0] = MEMORY[0x1E0C809B0];
              v74[1] = 3221225472;
              v74[2] = __30__ATConcreteMessageLink_close__block_invoke_22;
              v74[3] = &unk_1E928CDD8;
              v74[4] = *(_QWORD *)(a1 + 32);
              v74[5] = v27;
              objc_msgSend(v36, "stopWithCompletion:", v74);
            }

          }
          ++v26;
        }
        while (v23 != v26);
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
      }
      while (v23);
    }

    v73 = xmmword_1D1A14F00;
    _ATLogCategoryFramework_Oversize();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = *(_QWORD *)(a1 + 32);
      v39 = *(_QWORD *)(v38 + 72);
      *(_DWORD *)buf = 138543618;
      v83 = v38;
      v84 = 2114;
      v85 = v39;
      _os_log_impl(&dword_1D19F1000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ _requestWritersByID=%{public}@", buf, 0x16u);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allKeys");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v70 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_stopWriter:byInjectingStreamError:forMessageId:type:", v46, &v73, objc_msgSend(v45, "unsignedIntValue"), 0);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      }
      while (v42);
    }

    _ATLogCategoryFramework_Oversize();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = *(_QWORD *)(a1 + 32);
      v49 = *(_QWORD *)(v48 + 80);
      *(_DWORD *)buf = 138543618;
      v83 = v48;
      v84 = 2114;
      v85 = v49;
      _os_log_impl(&dword_1D19F1000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ _responseWritersByID=%{public}@", buf, 0x16u);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allKeys");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v66 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_stopWriter:byInjectingStreamError:forMessageId:type:", v56, &v73, objc_msgSend(v55, "unsignedIntValue"), 1);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      }
      while (v52);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v57 = *(_QWORD *)(a1 + 32);
    v58 = *(NSObject **)(v57 + 168);
    v59 = *(NSObject **)(v57 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__ATConcreteMessageLink_close__block_invoke_23;
    block[3] = &unk_1E928C918;
    block[4] = v57;
    objc_copyWeak(&v64, (id *)buf);
    dispatch_group_notify(v58, v59, block);
    objc_destroyWeak(&v64);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v60 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v83 = v60;
      _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_ERROR, "%{public}@ is already closed", buf, 0xCu);
    }

  }
}

void __30__ATConcreteMessageLink_close__block_invoke_22(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 168));
}

void __30__ATConcreteMessageLink_close__block_invoke_23(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id WeakRetained;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v44 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 152);
        block[0] = v4;
        block[1] = 3221225472;
        block[2] = __30__ATConcreteMessageLink_close__block_invoke_2;
        block[3] = &unk_1E928C8F0;
        block[4] = v8;
        dispatch_async(v9, block);
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allValues", 64);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 152);
        v37[0] = v4;
        v37[1] = 3221225472;
        v37[2] = __30__ATConcreteMessageLink_close__block_invoke_3;
        v37[3] = &unk_1E928C8F0;
        v37[4] = v15;
        dispatch_async(v16, v37);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v12);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v31), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_getObservers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(NSObject **)(v18 + 160);
  v36[0] = v4;
  v36[1] = 3221225472;
  v36[2] = __30__ATConcreteMessageLink_close__block_invoke_4;
  v36[3] = &unk_1E928CC80;
  v36[4] = v18;
  dispatch_sync(v19, v36);
  _ATLogCategoryFramework();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v49 = v21;
    _os_log_impl(&dword_1D19F1000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ All stream readers and writers have been stopped", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = v17;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v28, "messageLinkWasClosed:", WeakRetained);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
    }
    while (v25);
  }

  _ATLogCategoryFramework();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v49 = v30;
    _os_log_impl(&dword_1D19F1000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Wrapped up ...", buf, 0xCu);
  }

}

void __30__ATConcreteMessageLink_close__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 3, CFSTR("message link closed"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __30__ATConcreteMessageLink_close__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 3, CFSTR("message link closed"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __30__ATConcreteMessageLink_close__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeAllObjects");
}

void __29__ATConcreteMessageLink_open__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  dispatch_source_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD handler[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "open");
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 8);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v5 = "without error";
    else
      v5 = "with error";
    *(_DWORD *)buf = 138543874;
    v29 = v3;
    v30 = 2114;
    v31 = v4;
    v32 = 2080;
    v33 = v5;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Opened socket %{public}@ %s", buf, 0x20u);
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 185) = 1;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_getObservers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "messageLinkWasOpened:", *(_QWORD *)(a1 + 32));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 144));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 136);
    *(_QWORD *)(v13 + 136) = v12;

    v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 136);
    v16 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v15, v16, 0x37E11D600uLL, 0x3B9ACA00uLL);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(NSObject **)(v17 + 136);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __29__ATConcreteMessageLink_open__block_invoke_20;
    handler[3] = &unk_1E928CC80;
    handler[4] = v17;
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 136));
  }
  else
  {
    _ATLogCategoryFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(v20 + 8);
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      v30 = 2114;
      v31 = v21;
      _os_log_impl(&dword_1D19F1000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to open socket %{public}@", buf, 0x16u);
    }

  }
}

uint64_t __29__ATConcreteMessageLink_open__block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkMessageTimeouts");
}

void __40__ATConcreteMessageLink_initWithSocket___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_processIncomingMessage:", v3);

}

@end
