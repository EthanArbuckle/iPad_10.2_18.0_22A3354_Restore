@implementation EMOutgoingMessageRepository

+ (NSXPCInterface)remoteInterface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF24F448);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_numberOfPendingMessagesChanged_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FD30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_startObservingPendingMessageChangesWithChangeObserver_observationIdentifier_, 0, 0);

  return (NSXPCInterface *)v4;
}

- (EMOutgoingMessageRepository)initWithRemoteConnection:(id)a3
{
  id v5;
  EMOutgoingMessageRepository *v6;
  EMOutgoingMessageRepository *v7;
  uint64_t v8;
  EFScheduler *scheduler;
  NSMutableArray *v10;
  NSMutableArray *observers;
  EMRemoteConnection *connection;
  uint64_t v13;
  EMRemoteConnection *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EMOutgoingMessageRepository;
  v6 = -[EMOutgoingMessageRepository init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EMOutgoingMessageRepository"), 17);
    v8 = objc_claimAutoreleasedReturnValue();
    scheduler = v7->_scheduler;
    v7->_scheduler = (EFScheduler *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v7->_observers;
    v7->_observers = v10;

    atomic_store(0, (unsigned __int8 *)&v7->_hasStartedObservingUnsentChanges);
    v7->_hasDelayedMessages = 0;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__EMOutgoingMessageRepository_initWithRemoteConnection___block_invoke;
    v18[3] = &unk_1E70F1F78;
    objc_copyWeak(&v19, &location);
    -[EMRemoteConnection addResetHandler:](connection, "addResetHandler:", v18);
    v14 = v7->_connection;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __56__EMOutgoingMessageRepository_initWithRemoteConnection___block_invoke_2;
    v16[3] = &unk_1E70F1F78;
    objc_copyWeak(&v17, &location);
    -[EMRemoteConnection addRecoveryHandler:](v14, "addRecoveryHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)numberOfPendingMessagesChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EMOutgoingMessageRepository scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__EMOutgoingMessageRepository_numberOfPendingMessagesChanged___block_invoke;
  v7[3] = &unk_1E70F2070;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)removeOutgoingMessageRepositoryObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EMOutgoingMessageRepository scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__EMOutgoingMessageRepository_removeOutgoingMessageRepositoryObserver___block_invoke;
  v7[3] = &unk_1E70F2070;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)addOutgoingMessageRepositoryObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EMOutgoingMessageRepository scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__EMOutgoingMessageRepository_addOutgoingMessageRepositoryObserver___block_invoke;
  v7[3] = &unk_1E70F2070;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

void __62__EMOutgoingMessageRepository_numberOfPendingMessagesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "pendingMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPendingMessages:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "updateObserversForPendingMessagesChange");
  }
}

- (void)updateObserversForPendingMessagesChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[EMOutgoingMessageRepository pendingMessages](self, "pendingMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[EMOutgoingMessageRepository observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "numberOfPendingMessagesChanged:", v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __71__EMOutgoingMessageRepository_removeOutgoingMessageRepositoryObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __68__EMOutgoingMessageRepository_addOutgoingMessageRepositoryObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "pendingMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pendingMessages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberOfPendingMessagesChanged:", objc_msgSend(v5, "unsignedIntegerValue"));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_startObservingUnsentChangesIfNecessary");
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (NSNumber)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMessages, a3);
}

- (void)_startObservingUnsentChangesIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  -[EMOutgoingMessageRepository registrationCancelable](self, "registrationCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_hasStartedObservingUnsentChanges);
    -[EMOutgoingMessageRepository connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_153);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[EMObjectID initAsEphemeralID:]([EMObjectID alloc], "initAsEphemeralID:", 1);
    objc_msgSend(v5, "startObservingPendingMessageChangesWithChangeObserver:observationIdentifier:", self, v6);
    v7 = (void *)MEMORY[0x1E0D1EE90];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __70__EMOutgoingMessageRepository__startObservingUnsentChangesIfNecessary__block_invoke_156;
    v14 = &unk_1E70F2070;
    v8 = v5;
    v15 = v8;
    v9 = v6;
    v16 = v9;
    objc_msgSend(v7, "tokenWithCancelationBlock:", &v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMOutgoingMessageRepository setRegistrationCancelable:](self, "setRegistrationCancelable:", v10, v11, v12, v13, v14);

  }
}

- (EFCancelable)registrationCancelable
{
  return (EFCancelable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegistrationCancelable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 16, 1);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EMOutgoingMessageRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_30 != -1)
    dispatch_once(&log_onceToken_30, block);
  return (OS_os_log *)(id)log_log_30;
}

void __34__EMOutgoingMessageRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_30;
  log_log_30 = (uint64_t)v1;

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EMOutgoingMessageRepository_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1)
    dispatch_once(&signpostLog_onceToken_1, block);
  return (id)signpostLog_log_1;
}

void __42__EMOutgoingMessageRepository_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

void __56__EMOutgoingMessageRepository_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRegistrationCancelable:", 0);

}

void __56__EMOutgoingMessageRepository_initWithRemoteConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restartObservingUnsentChangesIfNecessary");

}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelable cancel](self->_registrationCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EMOutgoingMessageRepository;
  -[EMOutgoingMessageRepository dealloc](&v3, sel_dealloc);
}

- (id)saveDraftMessage:(id)a3 mailboxObjectID:(id)a4 previousDraftObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EMAIL DELIVERY", "Begin Saving Draft %@", buf, 0xCu);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reattemptingRemoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__EMOutgoingMessageRepository_saveDraftMessage_mailboxObjectID_previousDraftObjectID___block_invoke;
  v20[3] = &unk_1E70F54C8;
  v20[4] = self;
  v16 = v11;
  v21 = v16;
  v17 = v10;
  v22 = v17;
  objc_msgSend(v15, "saveDraftMessage:mailboxID:previousDraftObjectID:completion:", v8, v9, v17, v20);

  objc_msgSend(v16, "future");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __86__EMOutgoingMessageRepository_saveDraftMessage_mailboxObjectID_previousDraftObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __86__EMOutgoingMessageRepository_saveDraftMessage_mailboxObjectID_previousDraftObjectID___block_invoke_2;
  v12 = &unk_1E70F2070;
  v13 = *(id *)(a1 + 40);
  v5 = v3;
  v14 = v5;
  objc_msgSend(v4, "performBlock:", &v9);

  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog", v9, v10, v11, v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMAIL DELIVERY", "End Saving Draft %@", buf, 0xCu);
  }

}

uint64_t __86__EMOutgoingMessageRepository_saveDraftMessage_mailboxObjectID_previousDraftObjectID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

- (id)saveSendLaterMessage:(id)a3 sendLaterDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  EMOutgoingMessageRepository *v20;
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EMAIL DELIVERY", "Begin Saving Send Later", buf, 2u);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reattemptingRemoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __66__EMOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate___block_invoke;
  v19 = &unk_1E70F54F0;
  v20 = self;
  v13 = v8;
  v21 = v13;
  objc_msgSend(v12, "saveSendLaterMessage:sendLaterDate:completion:", v6, v7, &v16);

  objc_msgSend(v13, "future", v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __66__EMOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__EMOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate___block_invoke_2;
  v9[3] = &unk_1E70F2070;
  v10 = *(id *)(a1 + 40);
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "performBlock:", v9);

  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMAIL DELIVERY", "End Saving Send Later", v8, 2u);
  }

}

uint64_t __66__EMOutgoingMessageRepository_saveSendLaterMessage_sendLaterDate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

- (id)updateSendLaterDate:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMOutgoingMessageRepository.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "EMAIL DELIVERY", "Begin Saving Send Later", buf, 2u);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reattemptingRemoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__EMOutgoingMessageRepository_updateSendLaterDate_message___block_invoke;
  v18[3] = &unk_1E70F54F0;
  v18[4] = self;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v13, "updateSendLaterDate:message:completion:", v7, v8, v18);

  objc_msgSend(v14, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __59__EMOutgoingMessageRepository_updateSendLaterDate_message___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__EMOutgoingMessageRepository_updateSendLaterDate_message___block_invoke_2;
  v9[3] = &unk_1E70F2070;
  v10 = *(id *)(a1 + 40);
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "performBlock:", v9);

  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMAIL DELIVERY", "End Saving Send Later", v8, 2u);
  }

}

uint64_t __59__EMOutgoingMessageRepository_updateSendLaterDate_message___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

- (id)removeSendLaterDateFromMessage:(id)a3 draftsMailboxObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  EMOutgoingMessageRepository *v20;
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EMAIL DELIVERY", "Begin Removing Send Later", buf, 2u);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reattemptingRemoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __84__EMOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID___block_invoke;
  v19 = &unk_1E70F54F0;
  v20 = self;
  v13 = v8;
  v21 = v13;
  objc_msgSend(v12, "removeSendLaterDateFromMessage:draftsMailboxObjectID:completion:", v6, v7, &v16);

  objc_msgSend(v13, "future", v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __84__EMOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__EMOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID___block_invoke_2;
  v9[3] = &unk_1E70F2070;
  v10 = *(id *)(a1 + 40);
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "performBlock:", v9);

  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMAIL DELIVERY", "End Removing Send Later", v8, 2u);
  }

}

uint64_t __84__EMOutgoingMessageRepository_removeSendLaterDateFromMessage_draftsMailboxObjectID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

- (void)scheduleAlarmForSendLaterDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[EMOutgoingMessageRepository connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reattemptingRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__EMOutgoingMessageRepository_scheduleAlarmForSendLaterDate_completion___block_invoke;
  v11[3] = &unk_1E70F4ED8;
  v11[4] = self;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "scheduleAlarmForSendLaterDate:completion:", v6, v11);

}

void __72__EMOutgoingMessageRepository_scheduleAlarmForSendLaterDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__EMOutgoingMessageRepository_scheduleAlarmForSendLaterDate_completion___block_invoke_2;
  v6[3] = &unk_1E70F2F18;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "performBlock:", v6);

}

uint64_t __72__EMOutgoingMessageRepository_scheduleAlarmForSendLaterDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)deleteDraftsInMailbox:(id)a3 documentID:(id)a4 previousDraftObjectID:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
    v13 = v9 == 0;
  else
    v13 = 1;
  if (v13 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMOutgoingMessageRepository.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(mailboxObjectID && documentID) || objectID"));

  }
  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1B99BB000, v14, OS_LOG_TYPE_DEFAULT, "Begin Deleting Drafts In Mailbox %@", buf, 0xCu);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reattemptingRemoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteDraftsInMailboxID:documentID:previousDraftObjectID:", v9, v10, v12);

  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1B99BB000, v17, OS_LOG_TYPE_DEFAULT, "End Deleting Drafts In Mailbox %@", buf, 0xCu);
  }

}

- (id)deliverMessage:(id)a3 usingMailDrop:(BOOL)a4 isCancelable:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v5 = a5;
  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    objc_msgSend(v8, "originalMessageID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v12;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "EMAIL DELIVERY", "Begin Message Delivery %@", buf, 0xCu);

  }
  -[EMOutgoingMessageRepository connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reattemptingRemoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__EMOutgoingMessageRepository_deliverMessage_usingMailDrop_isCancelable___block_invoke;
  v19[3] = &unk_1E70F5518;
  v19[4] = self;
  v15 = v8;
  v20 = v15;
  v16 = v9;
  v21 = v16;
  objc_msgSend(v14, "deliverMessage:usingMailDrop:isCancelable:completion:", v15, v6, v5, v19);

  objc_msgSend(v16, "future");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __73__EMOutgoingMessageRepository_deliverMessage_usingMailDrop_isCancelable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__EMOutgoingMessageRepository_deliverMessage_usingMailDrop_isCancelable___block_invoke_2;
  v7[3] = &unk_1E70F3768;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  v10 = v6;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __73__EMOutgoingMessageRepository_deliverMessage_usingMailDrop_isCancelable___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    objc_msgSend(*(id *)(a1 + 40), "originalMessageID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v2, OS_SIGNPOST_INTERVAL_END, v3, "EMAIL DELIVERY", "End Message Delivery %@", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 56));
}

- (void)cancelLastDelayedMessage:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "UNDO SEND", "Begin Cancelling Last Pending Message", buf, 2u);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reattemptingRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__EMOutgoingMessageRepository_cancelLastDelayedMessage___block_invoke;
  v10[3] = &unk_1E70F4A20;
  v10[4] = self;
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "cancelLastDelayedMessage:", v10);

}

uint64_t __56__EMOutgoingMessageRepository_cancelLastDelayedMessage___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  os_signpost_id_t v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v4, OS_SIGNPOST_INTERVAL_END, v5, "UNDO SEND", "End Cancelling Last Pending Message (success:%{BOOL}d)", (uint8_t *)v7, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)outboxContainsMessageFromAccount:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  BOOL v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    objc_msgSend(v4, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = (uint64_t)v7;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EMAIL DELIVERY", "Begin Outbox Query For Account %@", buf, 0xCu);

  }
  -[EMOutgoingMessageRepository connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke;
  v21[3] = &unk_1E70F3AD0;
  v10 = v4;
  v22 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke_143;
  v20[3] = &unk_1E70F5540;
  v20[4] = &v23;
  objc_msgSend(v11, "outboxContainsMessageFromAccountObjectID:completion:", v12, v20);

  +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    objc_msgSend(v10, "ef_publicDescription");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (*((_BYTE *)v24 + 24))
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v28 = v15;
    v29 = 2112;
    v30 = v17;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "EMAIL DELIVERY", "End Outbox Query For Account %@: Contains Messages : %@", buf, 0x16u);

  }
  v18 = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  return v18;
}

void __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke_cold_1(v3, (uint64_t)v4, v2);
  }

}

uint64_t __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke_143(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)suspendDeliveryQueue
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Begin Suspending Delivery Queue", v6, 2u);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspendDeliveryQueue");

}

- (void)resumeDeliveryQueue
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Resuming Delivery Queue", v6, 2u);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeDeliveryQueue");

}

- (void)processAllQueuedMessages
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Trigger Processing Queued Delivery Messages", v6, 2u);
  }

  -[EMOutgoingMessageRepository connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processAllQueuedMessages");

}

- (BOOL)isProcessing
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EMOutgoingMessageRepository connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__EMOutgoingMessageRepository_isProcessing__block_invoke_148;
  v5[3] = &unk_1E70F5540;
  v5[4] = &v6;
  objc_msgSend(v3, "isProcessingWithCompletion:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __43__EMOutgoingMessageRepository_isProcessing__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__EMOutgoingMessageRepository_isProcessing__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

uint64_t __43__EMOutgoingMessageRepository_isProcessing__block_invoke_148(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)numberOfPendingMessages
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__10;
  v25 = __Block_byref_object_dispose__10;
  v26 = 0;
  -[EMOutgoingMessageRepository scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke;
  v20[3] = &unk_1E70F3660;
  v20[4] = self;
  v20[5] = &v21;
  objc_msgSend(v3, "performSyncBlock:", v20);

  v5 = (void *)v22[5];
  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntValue");
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "EMAIL DELIVERY", "Begin Query For Number of Pending Messages", buf, 2u);
    }

    -[EMOutgoingMessageRepository connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_150);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_151;
    v15[3] = &unk_1E70F5568;
    v15[4] = &v16;
    objc_msgSend(v10, "numberOfPendingMessagesWithCompletion:", v15);

    +[EMOutgoingMessageRepository signpostLog](EMOutgoingMessageRepository, "signpostLog");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[EMOutgoingMessageRepository signpostID](self, "signpostID");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = v17[3];
      *(_DWORD *)buf = 134217984;
      v28 = v13;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "EMAIL DELIVERY", "End Query For Number of Pending Messages with result %lu", buf, 0xCu);
    }

    v6 = v17[3];
    _Block_object_dispose(&v16, 8);
  }
  _Block_object_dispose(&v21, 8);

  return v6;
}

void __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pendingMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_149()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_149_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

uint64_t __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_151(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_restartObservingUnsentChangesIfNecessary
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_hasStartedObservingUnsentChanges);
  if ((v2 & 1) != 0)
    -[EMOutgoingMessageRepository _startObservingUnsentChangesIfNecessary](self, "_startObservingUnsentChangesIfNecessary");
}

void __70__EMOutgoingMessageRepository__startObservingUnsentChangesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  +[EMOutgoingMessageRepository log](EMOutgoingMessageRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__EMOutgoingMessageRepository__startObservingUnsentChangesIfNecessary__block_invoke_cold_1((uint64_t)v2, v3, v4);

}

uint64_t __70__EMOutgoingMessageRepository__startObservingUnsentChangesIfNecessary__block_invoke_156(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelObservation:", *(_QWORD *)(a1 + 40));
}

- (void)hasDelayedMessagesDidChange:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[EMOutgoingMessageRepository scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__EMOutgoingMessageRepository_hasDelayedMessagesDidChange___block_invoke;
  v6[3] = &unk_1E70F2CA8;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

uint64_t __59__EMOutgoingMessageRepository_hasDelayedMessagesDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 32), "hasDelayedMessages");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != (_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasDelayedMessages:", v3 != 0);
    return objc_msgSend(*(id *)(a1 + 32), "updateObserversForHasDelayedMessagesDidChange");
  }
  return result;
}

- (void)updateObserversForHasDelayedMessagesDidChange
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[EMOutgoingMessageRepository hasDelayedMessages](self, "hasDelayedMessages");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EMOutgoingMessageRepository observers](self, "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "hasDelayedMessagesDidChange:", v3);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)hasDelayedMessages
{
  return self->_hasDelayedMessages;
}

- (void)setHasDelayedMessages:(BOOL)a3
{
  self->_hasDelayedMessages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_registrationCancelable, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __64__EMOutgoingMessageRepository_outboxContainsMessageFromAccount___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a3, (uint64_t)a3, "encountered error while looking for outbox messages for account %{public}@", (uint8_t *)a2);

}

void __43__EMOutgoingMessageRepository_isProcessing__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B99BB000, a1, a3, "encountered error while determining outbox isProcessing state", a5, a6, a7, a8, 0);
}

void __54__EMOutgoingMessageRepository_numberOfPendingMessages__block_invoke_149_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B99BB000, a1, a3, "encountered error while determining numberOfPendingMessages in outbox", a5, a6, a7, a8, 0);
}

void __70__EMOutgoingMessageRepository__startObservingUnsentChangesIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a2, a3, "Error establishing xpc connection : %@", (uint8_t *)&v3);
}

@end
