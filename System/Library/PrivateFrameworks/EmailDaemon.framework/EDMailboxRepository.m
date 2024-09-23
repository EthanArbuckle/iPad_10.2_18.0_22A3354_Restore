@implementation EDMailboxRepository

BOOL __72__EDMailboxRepository_mailboxObjectIDsForMailboxType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (void)mailboxObjectIDsForMailboxType:(int64_t)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);
  _QWORD v12[5];

  v11 = (void (**)(id, void *))a4;
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allMailboxes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__EDMailboxRepository_mailboxObjectIDsForMailboxType_completionHandler___block_invoke;
  v12[3] = &__block_descriptor_40_e19_B16__0__EMMailbox_8l;
  v12[4] = a3;
  objc_msgSend(v7, "ef_filter:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_compactMap:", &__block_literal_global_15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v10);

}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

void __26__EDMailboxRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_42;
  log_log_42 = (uint64_t)v1;

}

id __72__EDMailboxRepository_mailboxObjectIDsForMailboxType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (EDMailboxRepository)initWithMailboxPersistence:(id)a3
{
  id v5;
  EDMailboxRepository *v6;
  EDMailboxRepository *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serializationQueue;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EDMailboxRepository;
  v6 = -[EDMailboxRepository init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailboxPersistence, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.email.EDMessageRepository.serializationQueue", v9);
    serializationQueue = v7->_serializationQueue;
    v7->_serializationQueue = (OS_dispatch_queue *)v10;

    v12 = (void *)MEMORY[0x1E0D1E2C0];
    v16[0] = *MEMORY[0x1E0D1DFA8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addValidSortDescriptorKeyPaths:forTargetClass:", v13, objc_opt_class());

  }
  return v7;
}

- (void)startObservingMailboxChangesWithChangeObserver:(id)a3 observationIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDMailboxRepository log](EDMailboxRepository, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_INFO, "Registering For Mailbox Observation With Observer %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addChangeObserver:withIdentifier:", v6, v7);

}

- (void)getMailboxesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  +[EDMailboxRepository log](EDMailboxRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "Get All Mailboxes", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1D824B334]();
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__EDMailboxRepository_getMailboxesWithCompletion___block_invoke;
  v9[3] = &unk_1E949CC88;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "allMailboxesWithCompletionHandler:", v9);

  objc_autoreleasePoolPop(v6);
}

void __50__EDMailboxRepository_getMailboxesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDMailboxRepository log](EDMailboxRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "Number of Mailboxes %ld count", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EDMailboxRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_42 != -1)
    dispatch_once(&log_onceToken_42, block);
  return (OS_os_log *)(id)log_log_42;
}

- (void)cancelObservation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDMailboxRepository log](EDMailboxRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "Unregistering For Mailbox Observation With Observer %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeChangeObserverWithIdentifier:", v4);

}

- (void)performMailboxChangeAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDMailboxRepository log](EDMailboxRepository, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Perform Change Action:%{public}@", buf, 0xCu);
  }

  -[EDMailboxRepository serializationQueue](self, "serializationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__EDMailboxRepository_performMailboxChangeAction_completionHandler___block_invoke;
  block[3] = &unk_1E949CCB0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __68__EDMailboxRepository_performMailboxChangeAction_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mailboxPersistence");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginDeferringInvalidation");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performCreateMailboxChangeAction:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_performDeleteMailboxChangeAction:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_performMoveMailboxChangeAction:", *(_QWORD *)(a1 + 40));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "_performRenameMailboxChangeAction:", *(_QWORD *)(a1 + 40));
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "mailboxPersistence");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDeferringInvalidation");

}

- (void)refreshMailboxList
{
  id v2;

  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchMailboxLists");

}

- (void)getAllMailboxObjectIDsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allMailboxes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v7);

}

id __60__EDMailboxRepository_getAllMailboxObjectIDsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)mailboxTypeForMailboxObjectID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allMailboxes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__EDMailboxRepository_mailboxTypeForMailboxObjectID_completionHandler___block_invoke;
  v14[3] = &unk_1E949CB28;
  v13 = v6;
  v15 = v13;
  objc_msgSend(v9, "ef_firstObjectPassingTest:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "type");
  else
    v12 = -500;
  v7[2](v7, v12);

}

uint64_t __71__EDMailboxRepository_mailboxTypeForMailboxObjectID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_performCreateMailboxChangeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "createMailbox:parentMailboxID:", v6, v7);

  return v8;
}

- (BOOL)_performDeleteMailboxChangeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "deleteMailbox:", v6);

  return v7;
}

- (BOOL)_performMoveMailboxChangeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentMailboxID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "moveMailbox:newParentMailboxID:", v6, v7);

  return v8;
}

- (BOOL)_performRenameMailboxChangeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "renameMailbox:newName:", v6, v7);

  return v8;
}

- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordFrecencyEventWithMailboxesWithIDs:", v5);

}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  id v2;

  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testRecordFrecencyEventsForAllMailboxes");

}

- (void)testResetFrecencyForAllMailboxes
{
  id v2;

  -[EDMailboxRepository mailboxPersistence](self, "mailboxPersistence");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testResetFrecencyForAllMailboxes");

}

- (void)setMailboxPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPersistence, a3);
}

- (OS_dispatch_queue)serializationQueue
{
  return self->_serializationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationQueue, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
}

@end
