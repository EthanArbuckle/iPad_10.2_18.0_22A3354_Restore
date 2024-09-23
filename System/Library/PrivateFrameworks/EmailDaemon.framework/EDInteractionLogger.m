@implementation EDInteractionLogger

- (EDInteractionLogger)initWithMessagePersistence:(id)a3 mailboxPersistence:(id)a4 eventLog:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDInteractionLogger *v12;
  EDInteractionLogger *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *viewedMessages;
  NSMutableDictionary *v16;
  NSMutableDictionary *messageListMessages;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *stateTrackingQueue;
  dispatch_queue_t v22;
  OS_dispatch_queue *processingQueue;
  void *v24;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)EDInteractionLogger;
  v12 = -[EDInteractionLogger init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messagePersistence, a3);
    objc_storeStrong((id *)&v13->_mailboxPersistence, a4);
    objc_storeStrong((id *)&v13->_eventLog, a5);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    viewedMessages = v13->_viewedMessages;
    v13->_viewedMessages = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    messageListMessages = v13->_messageListMessages;
    v13->_messageListMessages = v16;

    v13->_messageListVisibleRows = (_NSRange)kMaxRange;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UTILITY, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = dispatch_queue_create("com.apple.mail.EDInteractionLoggerStateTracking", v19);
    stateTrackingQueue = v13->_stateTrackingQueue;
    v13->_stateTrackingQueue = (OS_dispatch_queue *)v20;

    v22 = dispatch_queue_create("com.apple.email.EDInteractionLoggerProcessing", v19);
    processingQueue = v13->_processingQueue;
    v13->_processingQueue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v13, sel__conversationFlagsChanged_, EDConversationFlagsChanged, 0);

  }
  return v13;
}

- (void)logEvent:(id)a3 date:(id)a4 messageID:(id)a5 data:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[EDInteractionLogger processingQueue](self, "processingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EDInteractionLogger_logEvent_date_messageID_data___block_invoke;
  block[3] = &unk_1E949C5E8;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async(v14, block);

}

void __52__EDInteractionLogger_logEvent_date_messageID_data___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistedMessagesForMessageObjectIDs:requireProtectedData:temporarilyUnavailableMessageObjectIDs:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "_eventLog", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "persistEvent:date:message:data:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v9, *(_QWORD *)(a1 + 64));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)logEvent:(id)a3 date:(id)a4 data:(id)a5
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDInteractionLogger processingQueue](self, "processingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__EDInteractionLogger_logEvent_date_data___block_invoke;
  v15[3] = &unk_1E949B680;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __42__EDInteractionLogger_logEvent_date_data___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_eventLog");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistEvent:date:message:data:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));

}

- (void)composeReplyStartedForMessage:(id)a3
{
  -[EDInteractionLogger _composeStartedForMessage:eventName:](self, "_composeStartedForMessage:eventName:", a3, CFSTR("reply_draft_started"));
}

- (void)composeFowardStartedForMessage:(id)a3
{
  -[EDInteractionLogger _composeStartedForMessage:eventName:](self, "_composeStartedForMessage:eventName:", a3, CFSTR("forward_draft_started"));
}

- (void)_composeStartedForMessage:(id)a3 eventName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInteractionLogger _eventLog](self, "_eventLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistEvent:date:message:data:", v6, v7, v9, MEMORY[0x1E0C9AA70]);

}

- (void)scrolledToEndOfMessage:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__EDInteractionLogger_scrolledToEndOfMessage___block_invoke;
    v6[3] = &unk_1E949B6D0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __46__EDInteractionLogger_scrolledToEndOfMessage___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "_viewedMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_stateForMessage:extra:container:", v2, &stru_1E94A4508, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setScrolledToEnd:", 1);
}

- (void)viewingStartedForMessage:(id)a3
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
  -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EDInteractionLogger_viewingStartedForMessage___block_invoke;
  block[3] = &unk_1E949B390;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

void __48__EDInteractionLogger_viewingStartedForMessage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_viewedMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateForMessage:extra:container:", v3, &stru_1E94A4508, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    objc_msgSend(v8, "viewingStarted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v8;
    if (!v6)
    {
      objc_msgSend(v8, "setViewingStarted:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_eventLog");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistEvent:date:message:data:", CFSTR("message_view_start"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA70]);

      v5 = v8;
    }
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
  -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EDInteractionLogger_viewingEndedForMessage___block_invoke;
  block[3] = &unk_1E949B390;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

void __46__EDInteractionLogger_viewingEndedForMessage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_viewedMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateForMessage:extra:container:", v3, &stru_1E94A4508, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "viewingStarted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 48);
      objc_msgSend(v5, "viewingStarted");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "scrolledToEnd"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_eventLog");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v21[0] = CFSTR("duration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = CFSTR("scrolled_to_end");
      v22[0] = v15;
      v22[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "persistEvent:date:message:data:", CFSTR("message_view_end"), v13, v14, v16);

      objc_msgSend(*(id *)(a1 + 32), "_viewedMessages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "key");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectForKey:", v18);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_viewedMessages");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "key");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", v20);

    }
  }

}

- (void)_logMessageListDisplayStartedMessage:(id)a3 now:(id)a4 type:(id)a5 row:(int64_t)a6 cellStyle:(id)a7
{
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a7;
  -[EDInteractionLogger _eventLog](self, "_eventLog");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v17 = v14;
  else
    v17 = &stru_1E94A4508;
  v23[0] = v17;
  v22[0] = CFSTR("message_list_type");
  v22[1] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v22[2] = CFSTR("cell_style");
  if (v15)
    v20 = v15;
  else
    v20 = &stru_1E94A4508;
  v23[1] = v18;
  v23[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistEvent:date:message:data:", CFSTR("message_list_display_started"), v13, v12, v21);

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
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
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

    -[EDInteractionLogger _eventLog](self, "_eventLog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "message");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("cell_style");
    v20[0] = v14;
    objc_msgSend(v6, "cellStyle");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &stru_1E94A4508;
    if (v15)
      v17 = (const __CFString *)v15;
    v20[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistEvent:date:message:data:", CFSTR("message_list_display_ended"), v7, v13, v18);

  }
}

- (id)_range:(_NSRange)a3 minusRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  length = a4.length;
  location = a4.location;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", a3.location, a3.length);
  objc_msgSend(v6, "removeIndexesInRange:", location, length);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (void)messageListDisplayVisibleRowsChanged:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  NSUInteger v11;
  NSUInteger v12;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__EDInteractionLogger_messageListDisplayVisibleRowsChanged___block_invoke;
  v9[3] = &unk_1E949C610;
  v11 = location;
  v12 = length;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

void __60__EDInteractionLogger_messageListDisplayVisibleRowsChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id obj;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) != objc_msgSend(*(id *)(a1 + 32), "_messageListVisibleRows") || *(_QWORD *)(a1 + 56) != v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_messageListVisibleRows"))
      v5 = 0;
    else
      v5 = v4 == -1;
    if (v5)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      v6 = *(void **)(a1 + 32);
      v7 = objc_msgSend(v6, "_messageListVisibleRows");
      objc_msgSend(v6, "_range:minusRange:", v7, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      v11 = objc_msgSend(v10, "_messageListVisibleRows");
      objc_msgSend(v10, "_range:minusRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v13;
    v28 = v9;
    objc_msgSend(*(id *)(a1 + 32), "set_messageListVisibleRows:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_messageListMessages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v15;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v28, "containsIndex:", objc_msgSend(v19, "row")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_logMessageListDisplayEndedForState:now:", v19, *(_QWORD *)(a1 + 40));
            objc_msgSend(v19, "setViewingStarted:", 0);
          }
          if (objc_msgSend(v27, "containsIndex:", objc_msgSend(v19, "row")))
          {
            objc_msgSend(v19, "setViewingStarted:", *(_QWORD *)(a1 + 40));
            v20 = *(void **)(a1 + 32);
            objc_msgSend(v19, "message");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v19, "messageListType");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v19, "row");
            objc_msgSend(v19, "cellStyle");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "_logMessageListDisplayStartedMessage:now:type:row:cellStyle:", v21, v22, v23, v24, v25);

          }
        }
        v15 = obj;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v16);
    }

  }
}

- (void)messageListDisplayStartedForMessage:(id)a3 messageListType:(id)a4 row:(int64_t)a5 cellStyle:(id)a6
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
  -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__EDInteractionLogger_messageListDisplayStartedForMessage_messageListType_row_cellStyle___block_invoke;
  v19[3] = &unk_1E949C638;
  v19[4] = self;
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = v13;
  v24 = a5;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  v18 = v10;
  dispatch_async(v14, v19);

}

void __89__EDInteractionLogger_messageListDisplayStartedForMessage_messageListType_row_cellStyle___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_messageListMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateForMessage:extra:container:", v3, v4, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v12;
  if (v12)
  {
    objc_msgSend(v12, "viewingStarted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v12;
    if (!v7)
    {
      v8 = (__CFString *)*(id *)(a1 + 56);
      if (!-[__CFString length](v8, "length"))
      {

        v8 = CFSTR("none");
      }
      objc_msgSend(v12, "setViewingStarted:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v12, "setCellStyle:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v12, "setRow:", *(_QWORD *)(a1 + 72));
      objc_msgSend(v12, "setMessageListType:", v8);
      v9 = *(_QWORD *)(a1 + 72);
      v10 = objc_msgSend(*(id *)(a1 + 32), "_messageListVisibleRows");
      if (v9 >= v10 && v9 - v10 < v11)
        objc_msgSend(*(id *)(a1 + 32), "_logMessageListDisplayStartedMessage:now:type:row:cellStyle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v8, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));

      v6 = v12;
    }
  }

}

- (void)messageListDisplayEndedForMessage:(id)a3 cellStyle:(id)a4
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
  -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__EDInteractionLogger_messageListDisplayEndedForMessage_cellStyle___block_invoke;
  v13[3] = &unk_1E949B680;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __67__EDInteractionLogger_messageListDisplayEndedForMessage_cellStyle___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_messageListMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateForMessage:extra:container:", v3, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_messageListMessages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    objc_msgSend(*(id *)(a1 + 32), "_logMessageListDisplayEndedForState:now:", v8, *(_QWORD *)(a1 + 56));
  }

}

- (void)messageListDisplayEndedForAllMessages
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__EDInteractionLogger_messageListDisplayEndedForAllMessages__block_invoke;
  v6[3] = &unk_1E949B6D0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __60__EDInteractionLogger_messageListDisplayEndedForAllMessages__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_messageListMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __60__EDInteractionLogger_messageListDisplayEndedForAllMessages__block_invoke_2;
  v8 = &unk_1E949C660;
  v3 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v5);

  objc_msgSend(*(id *)(a1 + 32), "_messageListMessages", v5, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

uint64_t __60__EDInteractionLogger_messageListDisplayEndedForAllMessages__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logMessageListDisplayEndedForState:now:", a3, *(_QWORD *)(a1 + 40));
}

- (void)movedMessages:(id)a3 toMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        -[EDInteractionLogger _eventLog](self, "_eventLog");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "persistEvent:date:message:mailbox:", CFSTR("message_moved"), v8, v13, v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)movedMessages:(id)a3 toMailboxType:(int64_t)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v13;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[EDInteractionLogger _eventLog](self, "_eventLog");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "persistEvent:date:message:mailboxType:", CFSTR("message_moved"), v6, v11, a4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)archivedMessages:(id)a3
{
  -[EDInteractionLogger movedMessages:toMailboxType:](self, "movedMessages:toMailboxType:", a3, 2);
}

- (void)deletedMessages:(id)a3
{
  -[EDInteractionLogger movedMessages:toMailboxType:](self, "movedMessages:toMailboxType:", a3, 3);
}

- (void)copiedMessages:(id)a3 toMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        -[EDInteractionLogger _eventLog](self, "_eventLog");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "persistEvent:date:message:mailbox:", CFSTR("message_copied"), v8, v13, v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)clickedLinkInMessage:(id)a3 scheme:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EDInteractionLogger _eventLog](self, "_eventLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistEvent:date:message:data:", CFSTR("link_clicked"), v6, v7, MEMORY[0x1E0C9AA70]);

}

- (id)_stateForMessage:(id)a3 extra:(id)a4 container:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _EDUserActionState *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "persistentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "persistentID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("\x01%@"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", v12);
    v13 = (_EDUserActionState *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v13 = objc_alloc_init(_EDUserActionState);
      -[_EDUserActionState setMessage:](v13, "setMessage:", v7);
      -[_EDUserActionState setKey:](v13, "setKey:", v12);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v12);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
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
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ConversationViewExcludesRelatedMessages"), CFSTR("ConversationViewShowsNewestAtTop"), CFSTR("LinesOfPreview"), CFSTR("NumberOfActiveAccounts"), CFSTR("DisableThreading"), CFSTR("LeftEdgeSwipeAction"), CFSTR("RightEdgeSwipeAction"), CFSTR("ColumnLayoutMessageList"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("NumberOfSnippetLines");
  v17[1] = CFSTR("ConversationViewSortDescending");
  v18[0] = &__block_literal_global_24;
  v18[1] = &__block_literal_global_118;
  v17[2] = CFSTR("ConversationViewSpansMailboxes");
  v17[3] = CFSTR("AccountOrdering");
  v18[2] = &__block_literal_global_122;
  v18[3] = &__block_literal_global_126;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__EDInteractionLogger_applicationLaunched__block_invoke_5;
  v13[3] = &unk_1E949C708;
  v9 = v7;
  v14 = v9;
  v10 = v4;
  v15 = v10;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
  -[EDInteractionLogger _eventLog](self, "_eventLog");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistEvent:date:message:data:", CFSTR("app_launch"), v3, 0, v10);

}

id __42__EDInteractionLogger_applicationLaunched__block_invoke(uint64_t a1, void *a2)
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

id __42__EDInteractionLogger_applicationLaunched__block_invoke_2(uint64_t a1, void *a2)
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

id __42__EDInteractionLogger_applicationLaunched__block_invoke_3(uint64_t a1, void *a2)
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

id __42__EDInteractionLogger_applicationLaunched__block_invoke_4(uint64_t a1, void *a2)
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

void __42__EDInteractionLogger_applicationLaunched__block_invoke_5(id *a1, void *a2, void *a3)
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

- (void)applicationWillSuspend
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EDInteractionLogger messageListDisplayEndedForAllMessages](self, "messageListDisplayEndedForAllMessages");
  -[EDInteractionLogger _viewingEndedForAllMessages](self, "_viewingEndedForAllMessages");
  -[EDInteractionLogger _eventLog](self, "_eventLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistEvent:date:message:data:", CFSTR("app_background"), v4, 0, MEMORY[0x1E0C9AA70]);

}

- (void)applicationWillResume
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EDInteractionLogger _eventLog](self, "_eventLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistEvent:date:message:data:", CFSTR("app_resume"), v4, 0, MEMORY[0x1E0C9AA70]);

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
  -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__EDInteractionLogger__viewingEndedForAllMessages__block_invoke;
  v6[3] = &unk_1E949B6D0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __50__EDInteractionLogger__viewingEndedForAllMessages__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, void *);
  void *v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "_viewedMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __50__EDInteractionLogger__viewingEndedForAllMessages__block_invoke_2;
  v9 = &unk_1E949C660;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v6);

  objc_msgSend(*(id *)(a1 + 32), "_viewedMessages", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

void __50__EDInteractionLogger__viewingEndedForAllMessages__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "viewingStarted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v4, "viewingStarted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "scrolledToEnd"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_eventLog");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "message");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("scrolled_to_end");
    v17[0] = v14;
    v17[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistEvent:date:message:data:", CFSTR("message_view_end"), v12, v13, v15);

  }
}

- (void)_conversationFlagsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EDConversationFlagsChangedConversationIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EDConversationFlagsReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EDConversationFlagsKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EDConversationFlagsOldFlags"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedLongLongValue");

  if (v10 == 4 && v14 != v12)
  {
    if ((v14 & 4) == 0 && (v12 & 4) != 0)
    {
      -[EDInteractionLogger _eventLog](self, "_eventLog");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("value");
      v20[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistEvent:date:conversationID:data:", CFSTR("marked_mute_thread"), v5, v8, v16);
LABEL_9:

      goto LABEL_10;
    }
    if ((v14 & 4) != 0 && (v12 & 4) == 0)
    {
      -[EDInteractionLogger _eventLog](self, "_eventLog");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("value");
      v18 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistEvent:date:conversationID:data:", CFSTR("marked_mute_thread"), v5, v8, v16);
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  EDInteractionLogger *v10;

  v5 = a3;
  -[EDInteractionLogger processingQueue](self, "processingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__EDInteractionLogger_persistenceDidAddMessages_generationWindow___block_invoke;
  v8[3] = &unk_1E949B6D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __66__EDInteractionLogger_persistenceDidAddMessages_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v14 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "account");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v5, "account");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
          {

            goto LABEL_11;
          }
          objc_msgSend(v5, "account");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "emailAddressStrings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (v11)
            continue;
        }
        objc_msgSend(*(id *)(a1 + 40), "_eventLog");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "persistEvent:dataFromMessage:", CFSTR("message_fetched"), v5);
LABEL_11:

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v2);
  }

}

- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  EDInteractionLogger *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInteractionLogger processingQueue](self, "processingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__EDInteractionLogger_persistenceWillChangeFlags_messages___block_invoke;
  v13[3] = &unk_1E949B680;
  v14 = v7;
  v15 = v6;
  v16 = self;
  v17 = v8;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  dispatch_async(v9, v13);

}

void __59__EDInteractionLogger_persistenceWillChangeFlags_messages___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v18;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v18 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v4);
        if (objc_msgSend(*(id *)(a1 + 40), "reason") >= 4)
        {
          if (objc_msgSend(*(id *)(a1 + 40), "readChanged"))
          {
            objc_msgSend(*(id *)(a1 + 48), "_eventLog");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = *(_QWORD *)(a1 + 56);
            v23 = CFSTR("value");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "read"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "persistEvent:date:message:data:", CFSTR("read_changed"), v7, v5, v9);

          }
          if (objc_msgSend(*(id *)(a1 + 40), "flaggedChanged"))
          {
            objc_msgSend(*(id *)(a1 + 48), "_eventLog");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = *(_QWORD *)(a1 + 56);
            v21 = CFSTR("value");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "flagged"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "persistEvent:date:message:data:", CFSTR("flag_changed"), v11, v5, v13);

          }
          if (objc_msgSend(*(id *)(a1 + 40), "repliedChanged")
            && objc_msgSend(*(id *)(a1 + 40), "replied"))
          {
            objc_msgSend(*(id *)(a1 + 48), "_eventLog");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "persistEvent:date:message:data:", CFSTR("reply_sent"), *(_QWORD *)(a1 + 56), v5, MEMORY[0x1E0C9AA70]);

          }
          if (((objc_msgSend(*(id *)(a1 + 40), "forwardedChanged") & 1) != 0
             || objc_msgSend(*(id *)(a1 + 40), "redirectedChanged"))
            && ((objc_msgSend(*(id *)(a1 + 40), "forwarded") & 1) != 0
             || objc_msgSend(*(id *)(a1 + 40), "redirected")))
          {
            objc_msgSend(*(id *)(a1 + 48), "_eventLog");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "persistEvent:date:message:data:", CFSTR("forward_sent"), *(_QWORD *)(a1 + 56), v5, MEMORY[0x1E0C9AA70]);

          }
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v2);
  }

}

- (void)persistenceWillTransferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  int64_t v19;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDInteractionLogger processingQueue](self, "processingQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__EDInteractionLogger_persistenceWillTransferMessages_transferType_destinationMailboxURL_userInitiated___block_invoke;
    block[3] = &unk_1E949BE68;
    block[4] = self;
    v16 = v11;
    v18 = v12;
    v19 = a4;
    v17 = v10;
    v14 = v12;
    dispatch_async(v13, block);

  }
}

void __104__EDInteractionLogger_persistenceWillTransferMessages_transferType_destinationMailboxURL_userInitiated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mailboxPersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legacyMailboxForMailboxURL:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1 + 64);
        if (v9)
        {
          if (v9 == 1)
          {
            objc_msgSend(*(id *)(a1 + 32), "_eventLog");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "persistEvent:date:message:mailbox:", CFSTR("message_moved"), *(_QWORD *)(a1 + 56), v8, v3);
          }
          else
          {
            if (v9 != 3)
              goto LABEL_13;
            objc_msgSend(*(id *)(a1 + 32), "_eventLog");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "persistEvent:date:message:mailboxType:", CFSTR("message_moved"), *(_QWORD *)(a1 + 56), v8, 3);
          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_eventLog", (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "persistEvent:date:message:mailbox:", CFSTR("message_copied"), *(_QWORD *)(a1 + 56), v8, v3);
        }

LABEL_13:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)deliveredMessage:(id)a3 account:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EDInteractionLogger _eventLog](self, "_eventLog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistEvent:dataFromMessage:account:", CFSTR("message_sent"), v8, v6);

}

- (void)waitForPendingStateChanges
{
  NSObject *v2;

  -[EDInteractionLogger _stateTrackingQueue](self, "_stateTrackingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_148);

}

- (NSMutableDictionary)_viewedMessages
{
  return self->_viewedMessages;
}

- (void)set_viewedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_viewedMessages, a3);
}

- (NSMutableDictionary)_messageListMessages
{
  return self->_messageListMessages;
}

- (void)set_messageListMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messageListMessages, a3);
}

- (_NSRange)_messageListVisibleRows
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

- (void)set_messageListVisibleRows:(_NSRange)a3
{
  self->_messageListVisibleRows = a3;
}

- (OS_dispatch_queue)_stateTrackingQueue
{
  return self->_stateTrackingQueue;
}

- (void)set_stateTrackingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateTrackingQueue, a3);
}

- (EDInteractionEventLog)_eventLog
{
  return self->_eventLog;
}

- (void)set_eventLog:(id)a3
{
  objc_storeStrong((id *)&self->_eventLog, a3);
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
  objc_storeStrong((id *)&self->_messagePersistence, a3);
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (void)setMailboxPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPersistence, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_eventLog, 0);
  objc_storeStrong((id *)&self->_stateTrackingQueue, 0);
  objc_storeStrong((id *)&self->_messageListMessages, 0);
  objc_storeStrong((id *)&self->_viewedMessages, 0);
}

@end
