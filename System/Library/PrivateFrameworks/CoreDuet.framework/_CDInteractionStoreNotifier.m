@implementation _CDInteractionStoreNotifier

+ (_CDInteractionStoreNotifier)sharedInstance
{
  if (sharedInstance__pasOnceToken2_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_0, &__block_literal_global_63);
  return (_CDInteractionStoreNotifier *)(id)sharedInstance__pasExprOnceResult_3;
}

- (_CDInteractionStoreNotifier)init
{
  _CDInteractionStoreNotifier *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  OS_dispatch_queue *v22;
  void *v23;
  uint64_t v24;
  _CDXPCEventPublisher *interactionRecordedEventPublisher;
  OS_dispatch_queue *v26;
  void *v27;
  uint64_t v28;
  _CDXPCEventPublisher *interactionDeletedEventPublisher;
  uint64_t v30;
  NSMutableDictionary *interactionStoreRecordedEventSubscribersByToken;
  uint64_t v32;
  NSMutableDictionary *interactionStoreDeletedEventSubscribersByToken;
  _QWORD v35[4];
  id v36;
  _QWORD handler[4];
  id v38;
  id buf[2];
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)_CDInteractionStoreNotifier;
  v2 = -[_CDInteractionStoreNotifier init](&v40, sel_init);
  if (v2)
  {
    if (notify_register_check((const char *)objc_msgSend(CFSTR("PSStoreChangedNotificationInternal"), "UTF8String"), &v2->_notifierToken))
    {
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[_CDInteractionStoreNotifier init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    }
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v15;

    LODWORD(v13) = getuid();
    v2->_isRootProcess = (_DWORD)v13 == 0;
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v13)
    {
      if (v18)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEFAULT, "Setting up interaction XPC event handler", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, v2);
      v19 = v2->_queue;
      v20 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __35___CDInteractionStoreNotifier_init__block_invoke;
      handler[3] = &unk_1E26E5838;
      objc_copyWeak(&v38, buf);
      xpc_set_event_stream_handler("com.apple.coreduetinteraction.interaction-recorded", v19, handler);
      v21 = v2->_queue;
      v35[0] = v20;
      v35[1] = 3221225472;
      v35[2] = __35___CDInteractionStoreNotifier_init__block_invoke_2;
      v35[3] = &unk_1E26E5838;
      objc_copyWeak(&v36, buf);
      xpc_set_event_stream_handler("com.apple.coreduetinteraction.interaction-deleted", v21, v35);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&v38);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v18)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEFAULT, "Setting up interaction XPC event publisher", (uint8_t *)buf, 2u);
      }

      v22 = v2->_queue;
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDXPCEventPublisher eventPublisherWithStreamName:delegate:queue:log:](_CDXPCEventPublisher, "eventPublisherWithStreamName:delegate:queue:log:", "com.apple.coreduetinteraction.interaction-recorded", v2, v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      interactionRecordedEventPublisher = v2->_interactionRecordedEventPublisher;
      v2->_interactionRecordedEventPublisher = (_CDXPCEventPublisher *)v24;

      v26 = v2->_queue;
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDXPCEventPublisher eventPublisherWithStreamName:delegate:queue:log:](_CDXPCEventPublisher, "eventPublisherWithStreamName:delegate:queue:log:", "com.apple.coreduetinteraction.interaction-deleted", v2, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      interactionDeletedEventPublisher = v2->_interactionDeletedEventPublisher;
      v2->_interactionDeletedEventPublisher = (_CDXPCEventPublisher *)v28;

      v30 = objc_opt_new();
      interactionStoreRecordedEventSubscribersByToken = v2->_interactionStoreRecordedEventSubscribersByToken;
      v2->_interactionStoreRecordedEventSubscribersByToken = (NSMutableDictionary *)v30;

      v32 = objc_opt_new();
      interactionStoreDeletedEventSubscribersByToken = v2->_interactionStoreDeletedEventSubscribersByToken;
      v2->_interactionStoreDeletedEventSubscribersByToken = (NSMutableDictionary *)v32;

    }
  }
  return v2;
}

- (void)dealloc
{
  int notifierToken;
  objc_super v4;

  notifierToken = self->_notifierToken;
  if (notifierToken)
    notify_cancel(notifierToken);
  v4.receiver = self;
  v4.super_class = (Class)_CDInteractionStoreNotifier;
  -[_CDInteractionStoreNotifier dealloc](&v4, sel_dealloc);
}

- (void)postPackedMechanisms:(unint64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (notify_set_state(self->_notifierToken, a3))
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[_CDInteractionStoreNotifier postPackedMechanisms:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  notify_post((const char *)objc_msgSend(CFSTR("PSStoreChangedNotificationInternal"), "UTF8String"));
}

- (id)filterInteractionsForUser:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (self->_isRootProcess)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_25);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)recorded:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _CDInteractionStoreNotifier *v14;
  _QWORD block[4];
  id v16;
  id v17;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40___CDInteractionStoreNotifier_recorded___block_invoke;
  v12[3] = &unk_1E26E3250;
  v13 = v4;
  v14 = self;
  v7 = v12;
  v8 = queue;
  v9 = v4;
  v10 = (void *)os_transaction_create();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_7;
  block[3] = &unk_1E26E3380;
  v16 = v10;
  v17 = v7;
  v11 = v10;
  dispatch_async(v8, block);

}

- (void)deleted:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _CDInteractionStoreNotifier *v14;
  _QWORD block[4];
  id v16;
  id v17;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39___CDInteractionStoreNotifier_deleted___block_invoke;
  v12[3] = &unk_1E26E3250;
  v13 = v4;
  v14 = self;
  v7 = v12;
  v8 = queue;
  v9 = v4;
  v10 = (void *)os_transaction_create();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_7;
  block[3] = &unk_1E26E3380;
  v16 = v10;
  v17 = v7;
  v11 = v10;
  dispatch_async(v8, block);

}

- (void)deleteAll
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("_CDInteractionStoreDeleteAllInteractionsNotification"), 0, 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_CDInteractionStoreDeleteAllInteractionsNotification"), 0, 0);

}

- (void)suspend
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___CDInteractionStoreNotifier_suspend__block_invoke;
  block[3] = &unk_1E26E2F20;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_queue);
}

- (void)addSubscriber:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *interactionStoreRecordedEventSubscribersByToken;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  void *v16;
  int v17;
  NSMutableDictionary *interactionStoreDeletedEventSubscribersByToken;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int16 v26;
  __int16 v27;
  uint8_t buf[16];

  v4 = a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "Adding subscriber", buf, 2u);
  }

  objc_msgSend(v4, "streamName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "token");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduetinteraction.interaction-recorded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    v10 = self->_interactionStoreRecordedEventSubscribersByToken;
    objc_sync_enter(v10);
    interactionStoreRecordedEventSubscribersByToken = self->_interactionStoreRecordedEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](interactionStoreRecordedEventSubscribersByToken, "setObject:forKeyedSubscript:", v4, v12);

    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 0;
      v14 = "Successfully added subscriber for interaction recording";
      v15 = (uint8_t *)&v27;
LABEL_9:
      _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduetinteraction.interaction-deleted");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v6);

  if (v17)
  {
    v10 = self->_interactionStoreDeletedEventSubscribersByToken;
    objc_sync_enter(v10);
    interactionStoreDeletedEventSubscribersByToken = self->_interactionStoreDeletedEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](interactionStoreDeletedEventSubscribersByToken, "setObject:forKeyedSubscript:", v4, v19);

    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 0;
      v14 = "Successfully added subscriber for interaction deletions";
      v15 = (uint8_t *)&v26;
      goto LABEL_9;
    }
LABEL_10:

    objc_sync_exit(v10);
    goto LABEL_13;
  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
    -[_CDInteractionStoreNotifier addSubscriber:].cold.1((uint64_t)v6, &v10->super.super, v20, v21, v22, v23, v24, v25);
LABEL_13:

}

- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *interactionStoreRecordedEventSubscribersByToken;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  void *v16;
  int v17;
  NSMutableDictionary *interactionStoreDeletedEventSubscribersByToken;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int16 v26;
  __int16 v27;
  uint8_t buf[16];

  v6 = a4;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEFAULT, "Removing subscriber", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduetinteraction.interaction-recorded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    v10 = self->_interactionStoreRecordedEventSubscribersByToken;
    objc_sync_enter(v10);
    interactionStoreRecordedEventSubscribersByToken = self->_interactionStoreRecordedEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](interactionStoreRecordedEventSubscribersByToken, "setObject:forKeyedSubscript:", 0, v12);

    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 0;
      v14 = "Successfully removed subscriber for interaction recording";
      v15 = (uint8_t *)&v27;
LABEL_9:
      _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduetinteraction.interaction-deleted");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v6);

  if (v17)
  {
    v10 = self->_interactionStoreDeletedEventSubscribersByToken;
    objc_sync_enter(v10);
    interactionStoreDeletedEventSubscribersByToken = self->_interactionStoreDeletedEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](interactionStoreDeletedEventSubscribersByToken, "setObject:forKeyedSubscript:", 0, v19);

    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 0;
      v14 = "Successfully removed subscriber for interaction deletion";
      v15 = (uint8_t *)&v26;
      goto LABEL_9;
    }
LABEL_10:

    objc_sync_exit(v10);
    goto LABEL_13;
  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
    -[_CDInteractionStoreNotifier removeSubscriberWithToken:streamName:].cold.1((uint64_t)v6, &v10->super.super, v20, v21, v22, v23, v24, v25);
LABEL_13:

}

- (void)handleXPCNotificationEvent:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "Handling notification event", buf, 2u);
  }

  v13 = 0;
  v14 = 0;
  v12 = 0;
  v6 = +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:](_CDXPCCodecs, "parseNotificationEvent:registrationIdentifier:info:error:", v4, &v14, &v13, &v12);

  v7 = v14;
  v8 = v13;
  v9 = v12;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_CDInteractionStoreNotifier handleXPCNotificationEvent:].cold.1((uint64_t)v7);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    v16 = v7;
    v17 = 2113;
    v18 = v8;
    _os_log_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEFAULT, "Received XPC notification event for registration %@: %{private}@", buf, 0x16u);
  }

  if (objc_msgSend(CFSTR("_CDInteractionStoreRecordedInteractionsNotification"), "isEqualToString:", v7))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_CDInteractionsKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[_CDInteractionStoreNotifier recorded:](self, "recorded:", v11);
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(CFSTR("_CDInteractionStoreDeletedInteractionsNotification"), "isEqualToString:", v7))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_CDInteractionsKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[_CDInteractionStoreNotifier deleted:](self, "deleted:", v11);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)publishRecordedXPCEvent:(id)a3
{
  _CDXPCEventPublisher *v4;
  NSObject *v5;
  NSObject *v6;
  _CDXPCEventPublisher *interactionRecordedEventPublisher;
  _CDXPCEventPublisher *v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  _CDXPCEventPublisher *v13;
  NSObject *v14;
  _CDXPCEventPublisher *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _CDXPCEventPublisher *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  const __CFString *v26;
  _CDXPCEventPublisher *v27;
  uint8_t buf[4];
  _CDXPCEventPublisher *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (_CDXPCEventPublisher *)a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138739971;
    v29 = v4;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Publishing recorded XPC event with interactions %{sensitive}@", buf, 0xCu);
  }

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    interactionRecordedEventPublisher = self->_interactionRecordedEventPublisher;
    *(_DWORD *)buf = 138412290;
    v29 = interactionRecordedEventPublisher;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "_interactionRecordedEventPublisher %@", buf, 0xCu);
  }

  if (self->_interactionRecordedEventPublisher)
  {
    if (v4)
      v8 = v4;
    else
      v8 = (_CDXPCEventPublisher *)MEMORY[0x1E0C9AA60];
    v26 = CFSTR("_CDInteractionsKey");
    v27 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:info:error:](_CDXPCCodecs, "notificationEventWithRegistrationIdentifier:info:error:", CFSTR("_CDInteractionStoreRecordedInteractionsNotification"), v9, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;

    v12 = self->_interactionStoreRecordedEventSubscribersByToken;
    objc_sync_enter(v12);
    -[NSMutableDictionary allValues](self->_interactionStoreRecordedEventSubscribersByToken, "allValues");
    v13 = (_CDXPCEventPublisher *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_INFO, "All subscribers %@", buf, 0xCu);
    }

    v19 = v4;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v13;
    v16 = -[_CDXPCEventPublisher countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v15);
          -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:](self->_interactionRecordedEventPublisher, "sendEvent:toSubscriber:handler:", v10);
        }
        v16 = -[_CDXPCEventPublisher countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v16);
    }

    v4 = v19;
    objc_sync_exit(v12);

  }
}

- (void)publishDeletedXPCEvent:(id)a3
{
  _CDXPCEventPublisher *v4;
  NSObject *v5;
  NSObject *v6;
  _CDXPCEventPublisher *interactionDeletedEventPublisher;
  _CDXPCEventPublisher *v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  _CDXPCEventPublisher *v13;
  NSObject *v14;
  _CDXPCEventPublisher *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _CDXPCEventPublisher *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  const __CFString *v26;
  _CDXPCEventPublisher *v27;
  uint8_t buf[4];
  _CDXPCEventPublisher *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (_CDXPCEventPublisher *)a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138739971;
    v29 = v4;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Publishing deleted XPC event with interactions %{sensitive}@", buf, 0xCu);
  }

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    interactionDeletedEventPublisher = self->_interactionDeletedEventPublisher;
    *(_DWORD *)buf = 138412290;
    v29 = interactionDeletedEventPublisher;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "_interactionDeletedEventPublisher %@", buf, 0xCu);
  }

  if (self->_interactionDeletedEventPublisher)
  {
    if (v4)
      v8 = v4;
    else
      v8 = (_CDXPCEventPublisher *)MEMORY[0x1E0C9AA60];
    v26 = CFSTR("_CDInteractionsKey");
    v27 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:info:error:](_CDXPCCodecs, "notificationEventWithRegistrationIdentifier:info:error:", CFSTR("_CDInteractionStoreDeletedInteractionsNotification"), v9, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;

    v12 = self->_interactionStoreDeletedEventSubscribersByToken;
    objc_sync_enter(v12);
    -[NSMutableDictionary allValues](self->_interactionStoreDeletedEventSubscribersByToken, "allValues");
    v13 = (_CDXPCEventPublisher *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_INFO, "All subscribers %@", buf, 0xCu);
    }

    v19 = v4;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v13;
    v16 = -[_CDXPCEventPublisher countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v15);
          -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:](self->_interactionDeletedEventPublisher, "sendEvent:toSubscriber:handler:", v10);
        }
        v16 = -[_CDXPCEventPublisher countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v16);
    }

    v4 = v19;
    objc_sync_exit(v12);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionStoreDeletedEventSubscribersByToken, 0);
  objc_storeStrong((id *)&self->_interactionStoreRecordedEventSubscribersByToken, 0);
  objc_storeStrong((id *)&self->_interactionDeletedEventPublisher, 0);
  objc_storeStrong((id *)&self->_interactionRecordedEventPublisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "Failed to register token for internal store notifications.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)postPackedMechanisms:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "Failed to set state for internal store notifications.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)addSubscriber:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Unknown event stream name adding subscriber: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)removeSubscriberWithToken:(uint64_t)a3 streamName:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Unknown event stream name removing subscriber: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)handleXPCNotificationEvent:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_6_9(&dword_18DDBE000, v1, v2, "Failed to parse notification event for registration %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

@end
