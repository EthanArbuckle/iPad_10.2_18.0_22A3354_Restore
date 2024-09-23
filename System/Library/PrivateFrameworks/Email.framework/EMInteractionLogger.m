@implementation EMInteractionLogger

+ (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FDF0);
}

- (EMInteractionLogger)initWithRemoteConnection:(id)a3
{
  id v5;
  EMInteractionLogger *v6;
  EMInteractionLogger *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *stateTrackingQueue;
  uint64_t v12;
  NSMutableDictionary *viewedMessages;
  uint64_t v14;
  NSMutableDictionary *messageListMessages;
  void *v16;
  void *v17;
  EMInteractionLogger *v18;
  objc_super v20;

  v5 = a3;
  if ((EMInteractionLoggerShouldLog() & 1) != 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)EMInteractionLogger;
    v6 = -[EMInteractionLogger init](&v20, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_connection, a3);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = dispatch_queue_create("com.apple.email.EMInteractionLogger", v9);
      stateTrackingQueue = v7->_stateTrackingQueue;
      v7->_stateTrackingQueue = (OS_dispatch_queue *)v10;

      v12 = objc_opt_new();
      viewedMessages = v7->_viewedMessages;
      v7->_viewedMessages = (NSMutableDictionary *)v12;

      v14 = objc_opt_new();
      messageListMessages = v7->_messageListMessages;
      v7->_messageListMessages = (NSMutableDictionary *)v14;

      v7->_messageListVisibleRows = (_NSRange)kMaxRange;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__appWillEnterForeground, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel__appDidEnterBackground, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListMessages, 0);
  objc_storeStrong((id *)&self->_viewedMessages, 0);
  objc_storeStrong((id *)&self->_stateTrackingQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EMInteractionLogger_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_19 != -1)
    dispatch_once(&log_onceToken_19, block);
  return (OS_os_log *)(id)log_log_19;
}

void __26__EMInteractionLogger_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_19;
  log_log_19 = (uint64_t)v1;

}

- (id)_stateForObjectID:(id)a3 container:(id)a4
{
  id v5;
  id v6;
  _EMUserActionState *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (_EMUserActionState *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(_EMUserActionState);
    -[_EMUserActionState setKey:](v7, "setKey:", v5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_EMUserActionState setMessageObjectID:](v7, "setMessageObjectID:", v5);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);
  }

  return v7;
}

- (void)_xpcLogEvent:(id)a3 date:(id)a4 messageID:(id)a5 data:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMInteractionLogger.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageID"));

    if (v11)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v11)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  -[EMInteractionLogger connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reattemptingRemoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logEvent:date:messageID:data:", v17, v11, v12, v13);

}

- (void)_xpcLogEvent:(id)a3 date:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[EMInteractionLogger connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reattemptingRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEvent:date:data:", v12, v8, v9);

}

- (void)_viewingEndedForAllMessages
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger stateTrackingQueue](self, "stateTrackingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__EMInteractionLogger__viewingEndedForAllMessages__block_invoke;
  v6[3] = &unk_1E70F2070;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __50__EMInteractionLogger__viewingEndedForAllMessages__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "viewedMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "viewingStarted");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = *(void **)(a1 + 40);
          objc_msgSend(v7, "viewingStarted");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "timeIntervalSinceDate:", v10);
          v12 = v11;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "scrolledToEnd"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 32);
          v14 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v15, "_rescopedMessageObjectID:", v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = CFSTR("duration");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = CFSTR("scrolled_to_end");
          v26[0] = v17;
          v26[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_xpcLogEvent:date:messageID:data:", CFSTR("message_view_end"), v14, v16, v18);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "viewedMessages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

}

- (void)clickedLinkInMessage:(id)a3 scheme:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v10 = v7;
  else
    v10 = &stru_1E70F6E90;
  v12 = CFSTR("scheme");
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger _xpcLogEvent:date:messageID:data:](self, "_xpcLogEvent:date:messageID:data:", CFSTR("link_clicked"), v8, v9, v11);

}

- (void)scrolledToEndOfMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EMInteractionLogger stateTrackingQueue](self, "stateTrackingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__EMInteractionLogger_scrolledToEndOfMessage___block_invoke;
  v7[3] = &unk_1E70F2070;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__EMInteractionLogger_scrolledToEndOfMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewedMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateForObjectID:container:", v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setScrolledToEnd:", 1);
}

- (id)_rescopedMessageObjectID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  EMMessageObjectID *v7;
  uint64_t v8;
  void *v9;
  EMMessageObjectID *v10;

  v3 = a3;
  objc_msgSend(v3, "messageObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailboxScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = objc_msgSend(v4, "globalMessageID"), v5, v6))
  {
    v7 = [EMMessageObjectID alloc];
    v8 = objc_msgSend(v4, "globalMessageID");
    objc_msgSend(v3, "mailboxScope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EMMessageObjectID initWithGlobalMessageID:mailboxScope:](v7, "initWithGlobalMessageID:mailboxScope:", v8, v9);

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (void)viewingStartedForMessage:(id)a3 messageListScope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger stateTrackingQueue](self, "stateTrackingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__EMInteractionLogger_viewingStartedForMessage_messageListScope___block_invoke;
  v13[3] = &unk_1E70F3768;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __65__EMInteractionLogger_viewingStartedForMessage_messageListScope___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewedMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateForObjectID:container:", v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "viewingStarted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v9, "setViewingStarted:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v9, "setMailboxScope:", *(_QWORD *)(a1 + 56));
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "_rescopedMessageObjectID:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_xpcLogEvent:date:messageID:data:", CFSTR("message_view_start"), v7, v8, MEMORY[0x1E0C9AA70]);

  }
}

- (void)viewingEndedForMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger stateTrackingQueue](self, "stateTrackingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EMInteractionLogger_viewingEndedForMessage___block_invoke;
  block[3] = &unk_1E70F2158;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

void __46__EMInteractionLogger_viewingEndedForMessage___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewedMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stateForObjectID:container:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "viewingStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(v6, "viewingStarted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    if (v11 > 0.1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "scrolledToEnd"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v13, "_rescopedMessageObjectID:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = CFSTR("duration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = CFSTR("scrolled_to_end");
      v23[0] = v16;
      v23[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_xpcLogEvent:date:messageID:data:", CFSTR("message_view_end"), v14, v15, v17);

    }
    objc_msgSend(*(id *)(a1 + 32), "viewedMessages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v19);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "viewedMessages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v21);

  }
}

- (void)composeReplyStartedForMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger _xpcLogEvent:date:messageID:data:](self, "_xpcLogEvent:date:messageID:data:", CFSTR("reply_draft_started"), v4, v5, MEMORY[0x1E0C9AA70]);

}

- (void)composeFowardStartedForMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger _xpcLogEvent:date:messageID:data:](self, "_xpcLogEvent:date:messageID:data:", CFSTR("forward_draft_started"), v4, v5, MEMORY[0x1E0C9AA70]);

}

- (void)_logMessageListDisplayStartedMessageID:(id)a3 now:(id)a4 type:(id)a5 row:(int64_t)a6 cellStyle:(id)a7
{
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = (__CFString *)a5;
  v16 = (__CFString *)a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMInteractionLogger.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageID"));

  }
  if (v15)
    v17 = v15;
  else
    v17 = &stru_1E70F6E90;
  v24[0] = v17;
  v23[0] = CFSTR("message_list_type");
  v23[1] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v23[2] = CFSTR("cell_style");
  if (v16)
    v20 = v16;
  else
    v20 = &stru_1E70F6E90;
  v24[1] = v18;
  v24[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger _xpcLogEvent:date:messageID:data:](self, "_xpcLogEvent:date:messageID:data:", CFSTR("message_list_display_started"), v14, v13, v21);

}

- (void)_logMessageListDisplayEndedForState:(id)a3 now:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "viewingStarted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "viewingStarted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v9);
    v11 = v10;

    objc_msgSend(v6, "messageObjectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v18[1] = CFSTR("cell_style");
    objc_msgSend(v6, "cellStyle");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &stru_1E70F6E90;
    if (v14)
      v16 = (const __CFString *)v14;
    v19[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMInteractionLogger _xpcLogEvent:date:messageID:data:](self, "_xpcLogEvent:date:messageID:data:", CFSTR("message_list_display_ended"), v7, v12, v17);

  }
}

- (void)messageListDisplayStartedForListItem:(id)a3 messageListType:(id)a4 row:(int64_t)a5 cellStyle:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger stateTrackingQueue](self, "stateTrackingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__EMInteractionLogger_messageListDisplayStartedForListItem_messageListType_row_cellStyle___block_invoke;
  v19[3] = &unk_1E70F3790;
  v19[4] = self;
  v20 = v10;
  v21 = v13;
  v22 = v12;
  v23 = v11;
  v24 = a5;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v10;
  dispatch_async(v14, v19);

}

void __90__EMInteractionLogger_messageListDisplayStartedForListItem_messageListType_row_cellStyle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messageListMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateForObjectID:container:", v3, v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "viewingStarted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v12, "setViewingStarted:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v12, "setCellStyle:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v12, "setRow:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v12, "setMessageListType:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 40), "displayMessageObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMessageObjectID:", v6);

    v7 = *(_QWORD *)(a1 + 72);
    v8 = objc_msgSend(*(id *)(a1 + 32), "messageListVisibleRows");
    if (v7 >= v8 && v7 - v8 < v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v12, "messageObjectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_logMessageListDisplayStartedMessageID:now:type:row:cellStyle:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));

    }
  }

}

- (void)messageListDisplayEndedForListItem:(id)a3 cellStyle:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger stateTrackingQueue](self, "stateTrackingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__EMInteractionLogger_messageListDisplayEndedForListItem_cellStyle___block_invoke;
  block[3] = &unk_1E70F2158;
  block[4] = self;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void __68__EMInteractionLogger_messageListDisplayEndedForListItem_cellStyle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messageListMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateForObjectID:container:", v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messageListMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_logMessageListDisplayEndedForState:now:", v7, *(_QWORD *)(a1 + 48));
}

- (void)messageListDisplayEndedForAllListItems
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInteractionLogger stateTrackingQueue](self, "stateTrackingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__EMInteractionLogger_messageListDisplayEndedForAllListItems__block_invoke;
  v6[3] = &unk_1E70F2070;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __61__EMInteractionLogger_messageListDisplayEndedForAllListItems__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "messageListMessages", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_logMessageListDisplayEndedForState:now:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "messageListMessages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (id)messageListTypeForMailboxes:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    v6 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "count") == 1 && objc_msgSend(v4, "isSmartMailbox"))
  {
    v5 = objc_msgSend(v4, "smartMailboxType");
    if (v5 < 0xE)
    {
      v6 = off_1E70F3898[v5];
      goto LABEL_13;
    }
    v7 = &stru_1E70F6E90;
  }
  else if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v7 = &stru_1E70F6E90;
  }
  else
  {
    v7 = CFSTR("all_");
  }
  v8 = objc_msgSend(v4, "type") - 1;
  if (v8 > 6)
  {
    v6 = CFSTR("mailbox");
  }
  else
  {
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", off_1E70F3908[v8]);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v6;
}

- (void)applicationLaunched
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  -[EMInteractionLogger setAppLaunched:](self, "setAppLaunched:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ConversationViewExcludesRelatedMessages"), CFSTR("ConversationViewShowsNewestAtTop"), CFSTR("LinesOfPreview"), CFSTR("NumberOfActiveAccounts"), CFSTR("DisableThreading"), CFSTR("LeftEdgeSwipeAction"), CFSTR("RightEdgeSwipeAction"), CFSTR("ColumnLayoutMessageList"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("NumberOfSnippetLines");
  v16[1] = CFSTR("ConversationViewSortDescending");
  v17[0] = &__block_literal_global_20;
  v17[1] = &__block_literal_global_199;
  v16[2] = CFSTR("ConversationViewSpansMailboxes");
  v16[3] = CFSTR("AccountOrdering");
  v17[2] = &__block_literal_global_203;
  v17[3] = &__block_literal_global_207;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__EMInteractionLogger_applicationLaunched__block_invoke_5;
  v12[3] = &unk_1E70F3878;
  v9 = v7;
  v13 = v9;
  v10 = v4;
  v14 = v10;
  v11 = v8;
  v15 = v11;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
  -[EMInteractionLogger _xpcLogEvent:date:data:](self, "_xpcLogEvent:date:data:", CFSTR("app_launch"), v3, v10);

}

id __42__EMInteractionLogger_applicationLaunched__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v5 = CFSTR("LinesOfPreview");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __42__EMInteractionLogger_applicationLaunched__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v5 = CFSTR("ConversationViewShowsNewestAtTop");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __42__EMInteractionLogger_applicationLaunched__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v6 = CFSTR("ConversationViewExcludesRelatedMessages");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "BOOLValue") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __42__EMInteractionLogger_applicationLaunched__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v6 = CFSTR("NumberOfActiveAccounts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "count") - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __42__EMInteractionLogger_applicationLaunched__block_invoke_5(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(a1[4], "containsObject:", v10))
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v5, v10);
  }
  else
  {
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v8 = a1[5];
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addEntriesFromDictionary:", v9);

    }
  }

}

- (void)_appWillEnterForeground
{
  id v3;

  if (-[EMInteractionLogger appLaunched](self, "appLaunched"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[EMInteractionLogger _xpcLogEvent:date:data:](self, "_xpcLogEvent:date:data:", CFSTR("app_resume"));

  }
}

- (void)_appDidEnterBackground
{
  id v3;

  if (-[EMInteractionLogger appLaunched](self, "appLaunched"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[EMInteractionLogger messageListDisplayEndedForAllListItems](self, "messageListDisplayEndedForAllListItems");
    -[EMInteractionLogger _viewingEndedForAllMessages](self, "_viewingEndedForAllMessages");
    -[EMInteractionLogger _xpcLogEvent:date:data:](self, "_xpcLogEvent:date:data:", CFSTR("app_background"), v3, MEMORY[0x1E0C9AA70]);

  }
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)stateTrackingQueue
{
  return self->_stateTrackingQueue;
}

- (void)setStateTrackingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateTrackingQueue, a3);
}

- (NSMutableDictionary)viewedMessages
{
  return self->_viewedMessages;
}

- (void)setViewedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_viewedMessages, a3);
}

- (NSMutableDictionary)messageListMessages
{
  return self->_messageListMessages;
}

- (void)setMessageListMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messageListMessages, a3);
}

- (_NSRange)messageListVisibleRows
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_messageListVisibleRows.length;
  location = self->_messageListVisibleRows.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setMessageListVisibleRows:(_NSRange)a3
{
  self->_messageListVisibleRows = a3;
}

- (BOOL)appLaunched
{
  return self->_appLaunched;
}

- (void)setAppLaunched:(BOOL)a3
{
  self->_appLaunched = a3;
}

@end
