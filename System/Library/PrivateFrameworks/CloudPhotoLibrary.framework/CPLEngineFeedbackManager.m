@implementation CPLEngineFeedbackManager

- (CPLEngineFeedbackManager)initWithEngineLibrary:(id)a3
{
  id v4;
  CPLEngineFeedbackManager *v5;
  CPLEngineFeedbackManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  NSURL *feedbackMessagesURL;
  uint64_t v13;
  NSString *libraryIdentifier;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLEngineFeedbackManager;
  v5 = -[CPLEngineFeedbackManager init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_engineLibrary, v4);
    v7 = dispatch_queue_create("com.apple.cpl.feedback", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_engineLibrary);
    objc_msgSend(WeakRetained, "clientLibraryBaseURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("feedbackmessages.plist"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    feedbackMessagesURL = v6->_feedbackMessagesURL;
    v6->_feedbackMessagesURL = (NSURL *)v11;

    objc_msgSend(v4, "libraryIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    libraryIdentifier = v6->_libraryIdentifier;
    v6->_libraryIdentifier = (NSString *)v13;

  }
  return v6;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__CPLEngineFeedbackManager_openWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15285;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD block[4];
  id v17;

  v6 = a4;
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__CPLEngineFeedbackManager_closeAndDeactivate_completionHandler___block_invoke;
  v13[3] = &unk_1E60DC058;
  v15 = a3;
  v13[4] = self;
  v14 = v6;
  v9 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15285;
  block[3] = &unk_1E60D71F8;
  v17 = v9;
  v10 = queue;
  v11 = v6;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

- (void)setDisableFeedback:(BOOL)a3
{
  uint64_t v3;
  OS_dispatch_queue *queue;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  self->_disableFeedback = a3;
  if (a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__CPLEngineFeedbackManager_setDisableFeedback___block_invoke;
    v8[3] = &unk_1E60D65B8;
    v8[4] = self;
    v5 = v8;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_15285;
    block[3] = &unk_1E60D71F8;
    v10 = v5;
    v6 = queue;
    v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v6, v7);

  }
}

- (id)componentName
{
  return CFSTR("feedback");
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  OS_dispatch_queue *queue;
  _QWORD *v8;
  NSObject *v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  v5 = v4;
  if (self->_disableFeedback)
  {
    (*((void (**)(id, const __CFString *, _QWORD))v4 + 2))(v4, CFSTR("disabled"), 0);
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__CPLEngineFeedbackManager_getStatusWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E60D6708;
    v11[4] = self;
    v12 = v4;
    v8 = v11;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_15285;
    block[3] = &unk_1E60D71F8;
    v14 = v8;
    v9 = queue;
    v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);

  }
}

- (void)_save
{
  NSMutableArray *messagesToSend;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_closed)
  {
    messagesToSend = self->_messagesToSend;
    if (messagesToSend)
    {
      if (-[NSMutableArray count](messagesToSend, "count"))
      {
        v5 = (void *)MEMORY[0x1B5E08BF0]();
        if ((unint64_t)-[NSMutableArray count](self->_messagesToSend, "count") >= 0xB)
        {
          v6 = -[NSMutableArray count](self->_messagesToSend, "count") - 10;
          if (!_CPLSilentLogging)
          {
            __CPLFeedbackOSLogDomain();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v20 = v6;
              _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Too many messages to send to the server. Will drop %lu messages", buf, 0xCu);
            }

          }
          -[NSMutableArray removeObjectsInRange:](self->_messagesToSend, "removeObjectsInRange:", 0, v6);
        }
        v17[0] = CFSTR("messages");
        +[CPLSerializedFeedbackMessage plistRepresentationForMessages:](CPLSerializedFeedbackMessage, "plistRepresentationForMessages:", self->_messagesToSend);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17[1] = CFSTR("lastAttempt");
        v18[0] = v8;
        v18[1] = self->_lastAttemptDate;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, &v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v16;
        if (!v10)
        {
          if (!_CPLSilentLogging)
          {
            __CPLGenericOSLogDomain();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v20 = (uint64_t)v11;
              _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Failed to create feedback messages serialization: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Feedback/CPLEngineFeedbackManager.m");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 160, CFSTR("Failed to create feedback messages serialization: %@"), v11);

          abort();
        }
        objc_msgSend(v10, "writeToURL:atomically:", self->_feedbackMessagesURL, 1);

        objc_autoreleasePoolPop(v5);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeItemAtURL:error:", self->_feedbackMessagesURL, 0);

      }
    }
  }
}

- (void)_load
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *messagesToSend;
  NSMutableArray *v11;
  NSObject *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  NSDate *v15;
  NSDate *lastAttemptDate;
  uint8_t v17[16];

  if (!self->_messagesToSend)
  {
    v3 = (void *)MEMORY[0x1B5E08BF0]();
    if (!self->_closed)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", self->_feedbackMessagesURL);
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastAttempt"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_storeStrong((id *)&self->_lastAttemptDate, v6);
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messages"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            +[CPLSerializedFeedbackMessage messagesForPlistRepresentation:](CPLSerializedFeedbackMessage, "messagesForPlistRepresentation:", v7);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
            messagesToSend = self->_messagesToSend;
            self->_messagesToSend = v9;

          }
        }
        v11 = self->_messagesToSend;
        if (v11)
        {
          if ((unint64_t)-[NSMutableArray count](v11, "count") >= 0xB)
            -[CPLEngineFeedbackManager _save](self, "_save");
        }
        else if (!_CPLSilentLogging)
        {
          __CPLFeedbackOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Unable to read stored feedback messages. We might have dropped some messages we wanted to send", v17, 2u);
          }

        }
      }
      if (!self->_messagesToSend)
      {
        v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v14 = self->_messagesToSend;
        self->_messagesToSend = v13;

      }
      if (!self->_lastAttemptDate)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
        lastAttemptDate = self->_lastAttemptDate;
        self->_lastAttemptDate = v15;

      }
    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)_appendMessage:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *messagesToSend;
  CPLSerializedFeedbackMessage *v7;
  NSObject *v8;
  int v9;
  CPLSerializedFeedbackMessage *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_deactivated && !self->_disableFeedback)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[CPLEngineFeedbackManager _load](self, "_load");
    if (!self->_messagesToSend)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      messagesToSend = self->_messagesToSend;
      self->_messagesToSend = v5;

    }
    v7 = -[CPLSerializedFeedbackMessage initWithMessage:]([CPLSerializedFeedbackMessage alloc], "initWithMessage:", v4);
    if (!_CPLSilentLogging)
    {
      __CPLFeedbackOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling feedback message %@", (uint8_t *)&v9, 0xCu);
      }

    }
    -[NSMutableArray addObject:](self->_messagesToSend, "addObject:", v7);
    -[CPLEngineFeedbackManager _save](self, "_save");
    -[CPLEngineFeedbackManager _sendFeedbackToServerIfNecessary](self, "_sendFeedbackToServerIfNecessary");

  }
}

- (void)_appendMessages:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *messagesToSend;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  CPLSerializedFeedbackMessage *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  CPLSerializedFeedbackMessage *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_deactivated && !self->_disableFeedback)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[CPLEngineFeedbackManager _load](self, "_load");
    if (!self->_messagesToSend)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      messagesToSend = self->_messagesToSend;
      self->_messagesToSend = v5;

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = -[CPLSerializedFeedbackMessage initWithMessage:]([CPLSerializedFeedbackMessage alloc], "initWithMessage:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          if (!_CPLSilentLogging)
          {
            __CPLFeedbackOSLogDomain();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v12;
              _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Scheduling feedback message %@", buf, 0xCu);
            }

          }
          -[NSMutableArray addObject:](self->_messagesToSend, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v9);
    }

    -[CPLEngineFeedbackManager _save](self, "_save");
    -[CPLEngineFeedbackManager _sendFeedbackToServerIfNecessary](self, "_sendFeedbackToServerIfNecessary");
  }

}

- (void)_reallySendFeedbackToServer
{
  NSDate *v3;
  NSDate *lastAttemptDate;
  NSObject *v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *messagesSending;
  id WeakRetained;
  void *v10;
  NSArray *v11;
  CPLEngineTransportSendFeedbackTask *v12;
  CPLEngineTransportSendFeedbackTask *sendTask;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_closed && self->_opened && !self->_sendTask)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastAttemptDate = self->_lastAttemptDate;
    self->_lastAttemptDate = v3;

    -[CPLEngineFeedbackManager _save](self, "_save");
    if (!_CPLSilentLogging)
    {
      __CPLFeedbackOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = -[NSMutableArray count](self->_messagesToSend, "count");
        *(_DWORD *)buf = 134217984;
        v16 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Sending feedback to server with %lu messages", buf, 0xCu);
      }

    }
    v7 = (NSArray *)-[NSMutableArray copy](self->_messagesToSend, "copy");
    messagesSending = self->_messagesSending;
    self->_messagesSending = v7;

    WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    objc_msgSend(WeakRetained, "transport");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_messagesSending;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__CPLEngineFeedbackManager__reallySendFeedbackToServer__block_invoke;
    v14[3] = &unk_1E60DDB80;
    v14[4] = self;
    objc_msgSend(v10, "sendFeedbackTaskForMessages:completionHandler:", v11, v14);
    v12 = (CPLEngineTransportSendFeedbackTask *)objc_claimAutoreleasedReturnValue();
    sendTask = self->_sendTask;
    self->_sendTask = v12;

    -[CPLEngineTransportSendFeedbackTask runWithNoSyncSession](self->_sendTask, "runWithNoSyncSession");
  }
}

- (void)_sendFeedbackToServerIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  int v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_sendTask)
  {
    -[CPLEngineFeedbackManager engineLibrary](self, "engineLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNetworkConnected");

    if (v5)
    {
      -[CPLEngineFeedbackManager _load](self, "_load");
      if (-[NSMutableArray count](self->_messagesToSend, "count"))
      {
        -[NSDate timeIntervalSinceNow](self->_lastAttemptDate, "timeIntervalSinceNow");
        if (v6 > 0.0
          || v6 < -3600.0
          || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
              v7 = (void *)objc_claimAutoreleasedReturnValue(),
              v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("CPLAlwaysSendFeedback")),
              v7,
              v8))
        {
          -[CPLEngineFeedbackManager _reallySendFeedbackToServer](self, "_reallySendFeedbackToServer");
        }
      }
    }
  }
}

- (void)sendFeedbackToServerIfNecessary
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CPLEngineFeedbackManager_sendFeedbackToServerIfNecessary__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15285;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)reportMessage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CPLEngineFeedbackManager_reportMessage___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)reportMessages:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CPLEngineFeedbackManager_reportMessages___block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)reportResetType:(id)a3 reason:(id)a4 uuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPLResetFeedbackMessage *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CPLResetFeedbackMessage initWithResetType:reason:uuid:libraryIdentifier:]([CPLResetFeedbackMessage alloc], "initWithResetType:reason:uuid:libraryIdentifier:", v10, v9, v8, self->_libraryIdentifier);

  -[CPLEngineFeedbackManager reportMessage:](self, "reportMessage:", v11);
}

- (void)reportEndOfResetWithUUID:(id)a3 reason:(id)a4
{
  -[CPLEngineFeedbackManager reportResetType:reason:uuid:](self, "reportResetType:reason:uuid:", CFSTR("end"), a4, a3);
}

- (void)reportFetchChangesRewindToFeatureVersion:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rewind to catch up with changes from feature version %lu"), a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineFeedbackManager reportResetType:reason:uuid:](self, "reportResetType:reason:uuid:", CFSTR("rewind"), v6, v5);

}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  id v6;
  id v7;
  CPLSettingFeedbackMessage *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CPLSettingFeedbackMessage initWithSetting:value:libraryIdentifier:]([CPLSettingFeedbackMessage alloc], "initWithSetting:value:libraryIdentifier:", v7, v6, self->_libraryIdentifier);

  -[CPLEngineFeedbackManager reportMessage:](self, "reportMessage:", v8);
}

- (void)reportMiscInformation:(id)a3
{
  id v4;
  CPLInfoFeedbackMessage *v5;

  v4 = a3;
  v5 = -[CPLInfoFeedbackMessage initWithInfo:libraryIdentifier:]([CPLInfoFeedbackMessage alloc], "initWithInfo:libraryIdentifier:", v4, self->_libraryIdentifier);

  -[CPLEngineFeedbackManager reportMessage:](self, "reportMessage:", v5);
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPLTestFeedbackMessage *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  _QWORD *v14;
  NSObject *v15;
  dispatch_block_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("feedback")))
  {
    if (v9)
    {
      v11 = -[CPLTestFeedbackMessage initWithTestMessage:libraryIdentifier:]([CPLTestFeedbackMessage alloc], "initWithTestMessage:libraryIdentifier:", v9, self->_libraryIdentifier);
      -[CPLEngineFeedbackManager reportMessage:](self, "reportMessage:", v11);
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v10 + 2))(v10, 1, 0, 0);

    }
    else
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("value"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, _QWORD, void *))v10 + 2))(v10, 1, 0, v17);

    }
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("send-feedback")))
  {
    v12 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__CPLEngineFeedbackManager_testKey_value_completionHandler___block_invoke;
    v18[3] = &unk_1E60D6708;
    v18[4] = self;
    v19 = v10;
    v14 = v18;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_15285;
    block[3] = &unk_1E60D71F8;
    v21 = v14;
    v15 = queue;
    v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v15, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
  }

}

- (CPLEngineLibrary)engineLibrary
{
  return (CPLEngineLibrary *)objc_loadWeakRetained((id *)&self->_engineLibrary);
}

- (BOOL)disableFeedback
{
  return self->_disableFeedback;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_feedbackMessagesURL, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_messagesSending, 0);
  objc_storeStrong((id *)&self->_messagesToSend, 0);
  objc_storeStrong((id *)&self->_sendTask, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __60__CPLEngineFeedbackManager_testKey_value_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_load");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    objc_msgSend(*(id *)(a1 + 32), "_reallySendFeedbackToServer");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __43__CPLEngineFeedbackManager_reportMessages___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendMessages:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__CPLEngineFeedbackManager_reportMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendMessage:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__CPLEngineFeedbackManager_sendFeedbackToServerIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendFeedbackToServerIfNecessary");
}

void __55__CPLEngineFeedbackManager__reallySendFeedbackToServer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CPLEngineFeedbackManager__reallySendFeedbackToServer__block_invoke_2;
  v11[3] = &unk_1E60D6F88;
  v11[4] = v4;
  v12 = v3;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15285;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __55__CPLEngineFeedbackManager__reallySendFeedbackToServer__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      if (!_CPLSilentLogging)
      {
        __CPLFeedbackOSLogDomain();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v4 = *(_QWORD *)(a1 + 40);
          v12 = 138412290;
          v13 = v4;
          _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Failed to send feedback. Will retry later. Error: %@", (uint8_t *)&v12, 0xCu);
        }

      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLFeedbackOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "timeIntervalSinceNow");
          v12 = 134218240;
          v13 = v6;
          v14 = 2048;
          v15 = -v7;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "%lu feedback messages sent in %.1fs", (uint8_t *)&v12, 0x16u);
        }

        v2 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(v2 + 24), "removeObjectsInArray:", *(_QWORD *)(v2 + 32));
      objc_msgSend(*(id *)(a1 + 32), "_save");
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = 0;

}

void __59__CPLEngineFeedbackManager_getStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  id v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "_load");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16))
  {
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Sending %lu feedback messages..."), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"));
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v23 = 0;
  }
  v3 = objc_msgSend(*(id *)(v2 + 24), "count");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v3)
  {
    if ((v6 & 1) != 0)
    {
      v7 = CFSTR("never sent");
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      +[CPLDateFormatter stringForTimeIntervalAgo:now:](CPLDateFormatter, "stringForTimeIntervalAgo:now:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("last attempt %@"), v9);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    if (v3 >= 4)
      v10 = 4;
    else
      v10 = v3;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
    v12 = v3 - v10;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

      ++v12;
    }
    while (v12 < v3);
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n    "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
      v17 = "";
      if (v3 > 4)
        v17 = "\n    ...";
      objc_msgSend(v23, "appendFormat:", CFSTR("\n%lu messages to send (%@):%s\n    %@"), v16, v7, v17, v15);
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x1E0CB37A0]);
      v19 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
      v20 = "";
      if (v3 > 4)
        v20 = "\n    ...";
      v23 = (id)objc_msgSend(v18, "initWithFormat:", CFSTR("%lu messages to send (%@):%s\n    %@"), v19, v7, v20, v15);
    }

  }
  else
  {
    if ((v6 & 1) != 0)
    {
      v7 = CFSTR("no feedback ever sent");
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      +[CPLDateFormatter stringForTimeIntervalAgo:now:](CPLDateFormatter, "stringForTimeIntervalAgo:now:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("last feedback sent %@"), v22);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v11 = v23;
    v23 = (id)-[__CFString mutableCopy](v7, "mutableCopy");
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __47__CPLEngineFeedbackManager_setDisableFeedback___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

uint64_t __65__CPLEngineFeedbackManager_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = *(_BYTE *)(a1 + 48);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    objc_msgSend(v2, "cancel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __54__CPLEngineFeedbackManager_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_sendFeedbackToServerIfNecessary");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
