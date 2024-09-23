@implementation EDMessageChangeManager

- (BOOL)_hookResponderRespondsToRequiredMethods:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_opt_respondsToSelector();
  }
  else
  {
    v4 = 0;
  }

  return v4 & 1;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__EDMessageChangeManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_48 != -1)
    dispatch_once(&log_onceToken_48, block);
  return (OS_os_log *)(id)log_log_48;
}

void __29__EDMessageChangeManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_48;
  log_log_48 = (uint64_t)v1;

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EDMessageChangeManager_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_2 != -1)
    dispatch_once(&signpostLog_onceToken_2, block);
  return (id)signpostLog_log_2;
}

void __37__EDMessageChangeManager_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_2;
  signpostLog_log_2 = (uint64_t)v1;

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

- (EDMessageChangeManager)initWithDatabase:(id)a3 localActionPersistence:(id)a4 messagePersistence:(id)a5 serverMessagePersistenceFactory:(id)a6 readLaterPersistence:(id)a7 categoryPersistence:(id)a8 bimiManager:(id)a9 hookResponder:(id)a10 hookRegistry:(id)a11
{
  id v18;
  id v19;
  EDMessageChangeManager *v20;
  id *p_isa;
  EDMessageChangeManager *v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *markAllWorkQueue;
  void *v27;
  uint64_t v28;
  EDBiomeBlackPearlLogger *biomeCollector;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v38 = a3;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v39 = a8;
  v33 = a9;
  v18 = a10;
  v19 = a11;
  v40.receiver = self;
  v40.super_class = (Class)EDMessageChangeManager;
  v20 = -[EDMessageChangeManager init](&v40, sel_init);
  p_isa = (id *)&v20->super.isa;
  v22 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_database, a3);
    objc_storeStrong(p_isa + 9, a4);
    objc_storeStrong(p_isa + 7, a5);
    objc_storeStrong(p_isa + 3, a6);
    objc_storeStrong(p_isa + 2, a7);
    objc_storeStrong(p_isa + 4, a9);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_UTILITY, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.email.EDMessageChangeManager", v24);
    markAllWorkQueue = v22->_markAllWorkQueue;
    v22->_markAllWorkQueue = (OS_dispatch_queue *)v25;

    objc_msgSend(v39, "analyticsLogger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "biomeCollector");
    v28 = objc_claimAutoreleasedReturnValue();
    biomeCollector = v22->_biomeCollector;
    v22->_biomeCollector = (EDBiomeBlackPearlLogger *)v28;

    if (!-[EDMessageChangeManager _hookResponderRespondsToRequiredMethods:](v22, "_hookResponderRespondsToRequiredMethods:", v18))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("EDMessageChangeManager.m"), 137, CFSTR("HookResponder does not respond to all of the methods required by the EDMessageChangeManager."));

    }
    objc_storeWeak(p_isa + 8, v18);
    objc_msgSend(v19, "registerCloudStorageChangeHookResponder:", v22);
  }

  return v22;
}

- (EDMessageChangeManager)init
{
  -[EDMessageChangeManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessageChangeManager init]", "EDMessageChangeManager.m", 146, "0");
}

- (void)test_tearDown
{
  void *v4;
  NSObject *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageChangeManager.m"), 150, CFSTR("%s can only be called from unit tests"), "-[EDMessageChangeManager test_tearDown]");

  }
  -[EDMessageChangeManager markAllWorkQueue](self, "markAllWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, &__block_literal_global_37);

}

- (id)moveMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218242;
    v14 = objc_msgSend(v8, "count");
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Moving %lu new messages to %@", (uint8_t *)&v13, 0x16u);
  }

  -[EDMessageChangeManager transferMessages:transferType:destinationMailboxURL:userInitiated:](self, "transferMessages:transferType:destinationMailboxURL:userInitiated:", v8, 1, v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyMessages:(id)a3 destinationMailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218242;
    v14 = objc_msgSend(v8, "count");
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Copying %lu new messages to %@", (uint8_t *)&v13, 0x16u);
  }

  -[EDMessageChangeManager transferMessages:transferType:destinationMailboxURL:userInitiated:](self, "transferMessages:transferType:destinationMailboxURL:userInitiated:", v8, 0, v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)transferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  -[EDMessageChangeManager transferMessages:transferType:destinationMailboxURL:userInitiated:oldMessagesByNewMessage:](self, "transferMessages:transferType:destinationMailboxURL:userInitiated:oldMessagesByNewMessage:", v10, a4, v11, v6, v12);
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)transferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6 oldMessagesByNewMessage:(id)a7
{
  _BOOL8 v8;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  EDPersistenceDatabaseGenerationWindow *v21;
  BOOL v22;
  id v23;
  EDPersistenceDatabaseGenerationWindow *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  EDPersistenceDatabaseGenerationWindow *v45;
  id v46;
  id v47;
  id v48;
  uint8_t *v49;
  int64_t v50;
  os_signpost_id_t v51;
  BOOL v52;
  BOOL v53;
  uint8_t v54[4];
  int64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint8_t buf[8];
  __int128 v61;
  char v62;
  uint64_t v63;

  v8 = a6;
  v63 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v40 = a5;
  v41 = a7;
  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v16 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v42, "count"));
    objc_msgSend(v40, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240450;
    *(_DWORD *)&buf[4] = v16;
    LOWORD(v61) = 2112;
    *(_QWORD *)((char *)&v61 + 2) = v17;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EDMessageChangeManagerTransferMessages", "Begin transferring NumberOfMessages=%{public,signpost.telemetry:number1}u messages to destinationMailbox=%@ enableTelemetry=YES ", buf, 0x12u);

  }
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "persistenceWillBeginUpdates");

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistenceWillTransferMessages:transferType:destinationMailboxURL:userInitiated:", v42, a4, v40, v8);

  if (!v41)
    v41 = (id)objc_opt_new();
  objc_msgSend(v42, "ef_groupBy:", &__block_literal_global_36);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E778], "setDeleted");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_opt_new();
  v21 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v61 = buf;
  *((_QWORD *)&v61 + 1) = 0x2020000000;
  v62 = 0;
  v22 = -[EDMessageChangeManager mailboxURLIsInRemoteAccount:](self, "mailboxURLIsInRemoteAccount:", v40, v21, v20);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2;
  v43[3] = &unk_1E949D318;
  v43[4] = self;
  v23 = v40;
  v44 = v23;
  v50 = a4;
  v51 = v13;
  v24 = v21;
  v45 = v24;
  v25 = v41;
  v46 = v25;
  v52 = v22;
  v53 = v8;
  v26 = v20;
  v47 = v26;
  v27 = v38;
  v48 = v27;
  v49 = buf;
  objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v43);
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend(v25, "count");
    v30 = objc_msgSend(v27, "count");
    *(_DWORD *)v54 = 134218496;
    v55 = a4;
    v56 = 2048;
    v57 = v29;
    v58 = 2048;
    v59 = v30;
    _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "Transfer messages with type %ld, oldMessagesByNewMessage:%lld deletedMessages:%lld", v54, 0x20u);
  }

  if (objc_msgSend(v25, "count"))
  {
    -[EDMessageChangeManager willStartPersistenceDidAddMessages:](self, "willStartPersistenceDidAddMessages:", v25);
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "persistenceDidAddMessages:generationWindow:", v32, v24);

    -[EDMessageChangeManager didFinishPersistenceDidAddMessages:](self, "didFinishPersistenceDidAddMessages:", v25);
  }
  if (objc_msgSend(v27, "count"))
  {
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "persistenceDidChangeFlags:messages:generationWindow:", v26, v27, v24);

  }
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "persistenceDidDeleteMessages:generationWindow:", v27, v24);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "persistenceDidFinishUpdates");

  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)v54 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v37, OS_SIGNPOST_INTERVAL_END, v13, "EDMessageChangeManagerTransferMessages", ", v54, 2u);
  }

  _Block_object_dispose(buf, 8);
}

id __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  char v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  _QWORD v35[3];
  char v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {

    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "messagesToJournalForMessages:inMailbox:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "mailboxURL:isInSameAccountAsMailboxURL:", v5, *(_QWORD *)(a1 + 40));
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 88);
  if (v11 == 1)
    v12 = v9;
  else
    v12 = 0;
  if (v12 != 1)
  {
LABEL_9:
    if (v5)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "mailboxIsAllMail:", v5))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "mailboxPartOfAllMail:", *(_QWORD *)(a1 + 40)) ^ 1;
    goto LABEL_9;
  }
  v11 = 1;
  if (v5)
    goto LABEL_12;
LABEL_10:
  if (*(_QWORD *)(a1 + 88) == 1)
    v11 = 0;
LABEL_12:
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__14;
  v39[4] = __Block_byref_object_dispose__14;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__14;
  v37[4] = __Block_byref_object_dispose__14;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_41;
  v18[3] = &unk_1E949D2F0;
  v30 = *(_QWORD *)(a1 + 96);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 32);
  v19 = v13;
  v20 = v14;
  v15 = *(id *)(a1 + 48);
  v31 = v11;
  v21 = v15;
  v26 = v39;
  v22 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 56);
  v32 = *(_BYTE *)(a1 + 104);
  v33 = v10;
  v23 = v16;
  v27 = v37;
  v34 = *(_BYTE *)(a1 + 105);
  v24 = *(id *)(a1 + 64);
  v25 = *(id *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 80);
  v28 = v35;
  v29 = v17;
  objc_msgSend(v8, "ef_enumerateObjectsInBatchesOfSize:block:", 25, v18);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  int v20;
  uint64_t v21;
  int8x16_t v22;
  _QWORD v23[4];
  int8x16_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  __int16 v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 120);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v3, "count"));
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    v39 = v7;
    v40 = 2112;
    v41 = v8;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_EVENT, v6, "EDMessageChangeManagerTransferMessages", "Begin Processing batch of %u messages for sourceMailboxURL %@", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager transferMessages:transferType:destinationMailboxURL:userInitiated:oldMessagesByNewMessage:]_block_invoke");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_43;
  v23[3] = &unk_1E949D2C8;
  v34 = *(_QWORD *)(a1 + 120);
  v22 = *(int8x16_t *)(a1 + 32);
  v11 = (id)v22.i64[0];
  v24 = vextq_s8(v22, v22, 8uLL);
  v12 = *(id *)(a1 + 48);
  v35 = *(_QWORD *)(a1 + 128);
  v13 = *(_QWORD *)(a1 + 88);
  v25 = v12;
  v31 = v13;
  v14 = v3;
  v26 = v14;
  v27 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v36 = *(_BYTE *)(a1 + 136);
  v37 = *(_WORD *)(a1 + 137);
  v16 = *(_QWORD *)(a1 + 96);
  v28 = v15;
  v32 = v16;
  v29 = *(id *)(a1 + 72);
  v30 = *(id *)(a1 + 80);
  v33 = *(_OWORD *)(a1 + 104);
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v23);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 40), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 40), "mailboxDatabaseIDForURL:"));
  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog", *(_OWORD *)&v22);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 120);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v20 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v14, "count"));
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    v39 = v20;
    v40 = 2112;
    v41 = v21;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v18, OS_SIGNPOST_EVENT, v19, "EDMessageChangeManagerTransferMessages", "End Processing batch of %u messages for sourceMailboxURL %@", buf, 0x12u);
  }

}

uint64_t __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_43(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  _BOOL4 v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  char v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  void *v51;
  void *v52;
  _BOOL4 v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD aBlock[5];
  id v71;
  id v72;
  id v73;
  BOOL v74;
  char v75;
  BOOL v76;
  uint8_t buf[16];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v55 = a2;
  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 128);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v4, OS_SIGNPOST_EVENT, v5, "EDMessageChangeManagerTransferMessages", "Begin database write connection", buf, 2u);
  }

  v6 = objc_msgSend(*(id *)(a1 + 32), "mailboxURLIsInRemoteAccount:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "insertGeneration:", objc_msgSend(v55, "transactionGeneration"));
  v7 = *(_QWORD *)(a1 + 136);
  if (v7 == 3)
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_opt_new();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v8 = objc_msgSend(*(id *)(a1 + 32), "persistNewMessages:mailboxURL:oldMessagesByNewMessage:fromSyncing:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), 0);
    objc_msgSend(*(id *)(a1 + 72), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    v7 = *(_QWORD *)(a1 + 136);
  }
  if (*(_BYTE *)(a1 + 144))
    v12 = 1;
  else
    v12 = v6;
  if (v12 == 1)
  {
    v13 = 0;
    if (v7 != 3 && ((v6 ^ 1) & 1) == 0)
      v13 = *(_BYTE *)(a1 + 145) == 0;
    v14 = v8;
    if (v6)
    {
      v16 = v7 == 1 || v7 == 3;
      v53 = v16;
    }
    else
    {
      v53 = 0;
    }
    v51 = (void *)objc_opt_new();
    v52 = (void *)objc_opt_new();
    v17 = (void *)objc_opt_new();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_44;
    aBlock[3] = &unk_1E949D238;
    v74 = v13;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v18 = v51;
    v71 = v18;
    v75 = *(_BYTE *)(a1 + 144);
    v19 = v52;
    v72 = v19;
    v76 = v53;
    v54 = v17;
    v73 = v54;
    v20 = _Block_copy(aBlock);
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (v21)
    {
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v20, v51, v52);
    }
    else
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v22 = *(id *)(a1 + 56);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v78, 16, v51, v52);
      if (v23)
      {
        v24 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v67 != v24)
              objc_enumerationMutation(v22);
            (*((void (**)(void *, _QWORD, _QWORD, _QWORD))v20 + 2))(v20, 0, *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i), 0);
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        }
        while (v23);
      }

      v8 = v14;
    }
    v26 = objc_msgSend(v18, "count");
    v27 = (id *)(a1 + 40);
    if (!v26)
    {
      if (objc_msgSend(v19, "count"))
      {
        v27 = (id *)(a1 + 40);
        if (!*(_BYTE *)(a1 + 145))
          v27 = (id *)(a1 + 64);
      }
      else
      {
        v27 = (id *)(a1 + 40);
        if (!v53)
        {
LABEL_40:
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
          {
            v31 = objc_alloc(MEMORY[0x1E0D1E7C8]);
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_3;
            v56[3] = &unk_1E949D260;
            v57 = v18;
            v58 = v19;
            v59 = v54;
            v60 = *(id *)(a1 + 40);
            v64 = *(_BYTE *)(a1 + 144);
            v32 = *(id *)(a1 + 64);
            v33 = *(_QWORD *)(a1 + 104);
            v61 = v32;
            v62 = v33;
            v65 = *(_BYTE *)(a1 + 146);
            v63 = *(_QWORD *)(a1 + 136);
            v34 = (void *)objc_msgSend(v31, "initWithBuilder:", v56);
            objc_msgSend(*(id *)(a1 + 32), "localActionPersistence");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v35, "persistTransferAction:", v34);

          }
          v7 = *(_QWORD *)(a1 + 136);
          goto LABEL_43;
        }
      }
    }
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v29 = *v27;
    v30 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v29;
    v8 = v14;

    goto LABEL_40;
  }
LABEL_43:
  if (v7 == 3 || ((v36 = v7 == 1, v7 != 1) ? (v37 = 1) : (v37 = v6), (v37 & 1) == 0))
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v43, OS_LOG_TYPE_DEFAULT, "Deleting the source library messages if necessary", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 56), "ef_filter:", &__block_literal_global_354);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hookResponder");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "persistenceWillChangeFlags:messages:", *(_QWORD *)(a1 + 80), v38);

    v45 = (id)objc_msgSend(*(id *)(a1 + 32), "applyFlagChange:toMessagesInDatabase:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "hookResponder");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "persistenceIsChangingFlags:messages:generationWindow:", *(_QWORD *)(a1 + 80), v38, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "deletePersistedMessages:", v38);
    objc_msgSend(*(id *)(a1 + 88), "addObjectsFromArray:", v38);
    if (!_os_feature_enabled_impl())
      goto LABEL_56;
    objc_msgSend(*(id *)(a1 + 32), "biomeCollector");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "deleteEventsForMessages:", *(_QWORD *)(a1 + 88));
LABEL_55:

LABEL_56:
    goto LABEL_57;
  }
  if (v36)
  {
    objc_msgSend(*(id *)(a1 + 56), "ef_filter:", &__block_literal_global_354);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hookResponder");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "persistenceWillChangeFlags:messages:", *(_QWORD *)(a1 + 80), v38);

    v40 = (id)objc_msgSend(*(id *)(a1 + 32), "applyFlagChange:toMessagesInDatabase:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "hookResponder");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "persistenceIsChangingFlags:messages:generationWindow:", *(_QWORD *)(a1 + 80), v38, *(_QWORD *)(a1 + 48));

    objc_msgSend(v38, "ef_filter:", &__block_literal_global_55_0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deletePersistedMessages:", v42);
    objc_msgSend(*(id *)(a1 + 88), "addObjectsFromArray:", v38);
    goto LABEL_55;
  }
LABEL_57:
  if ((_DWORD)v8
    && (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24)
     || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
    && objc_msgSend(*(id *)(a1 + 56), "ef_any:", &__block_literal_global_58))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) && *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "resetStatusCountsForMailboxWithURL:");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) && *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "resetStatusCountsForMailboxWithURL:");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 1;
    }
  }
  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  v49 = *(_QWORD *)(a1 + 128);
  if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v48, OS_SIGNPOST_EVENT, v49, "EDMessageChangeManagerTransferMessages", "End database write connection", buf, 2u);
  }

  return v8;
}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0D1E7D0]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_46;
  v12[3] = &unk_1E949D210;
  v8 = v6;
  v13 = v8;
  v11 = v5;
  v14 = v11;
  v9 = (void *)objc_msgSend(v7, "initWithBuilder:", v12);
  if (*(_BYTE *)(a1 + 64) && (objc_msgSend(*(id *)(a1 + 32), "haveCompleteMIMEForMessage:", v11) & 1) == 0)
  {
    v10 = (id *)(a1 + 40);
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 65))
  {
    v10 = (id *)(a1 + 48);
LABEL_8:
    objc_msgSend(*v10, "addObject:", v9);
    goto LABEL_9;
  }
  if (*(_BYTE *)(a1 + 66))
  {
    v10 = (id *)(a1 + 56);
    goto LABEL_8;
  }
LABEL_9:

}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_46(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setSourceMessage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setDestinationMessage:", *(_QWORD *)(a1 + 40));

}

void __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setItemsToDownload:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setItemsToCopy:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setItemsToDelete:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setSourceMailboxURL:", *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 88))
    v3 = *(_QWORD *)(a1 + 64);
  else
    v3 = 0;
  objc_msgSend(v4, "setDestinationMailboxURL:", v3);
  objc_msgSend(v4, "setMailboxURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(v4, "setUserInitiated:", *(unsigned __int8 *)(a1 + 89));
  objc_msgSend(v4, "setTransferType:", *(_QWORD *)(a1 + 80));

}

BOOL __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_53(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "remoteID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

uint64_t __116__EDMessageChangeManager_transferMessages_transferType_destinationMailboxURL_userInitiated_oldMessagesByNewMessage___block_invoke_2_56(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "read") ^ 1;

  return v3;
}

- (void)deleteAllMessageFromMailboxes:(id)a3 exceptMessages:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Deleting all message from %@", (uint8_t *)&v9, 0xCu);
  }

  -[EDMessageChangeManager transferAllMessagesFromMailboxes:exceptMessages:transferType:destinationMailboxURL:userInitiated:](self, "transferAllMessagesFromMailboxes:exceptMessages:transferType:destinationMailboxURL:userInitiated:", v6, v7, 3, 0, 0);
}

- (void)transferAllMessagesFromMailboxes:(id)a3 exceptMessages:(id)a4 transferType:(int64_t)a5 destinationMailboxURL:(id)a6 userInitiated:(BOOL)a7
{
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  EDMessageChangeManager *v32;
  id v33;
  id v34;
  int64_t v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;
  int64_t v39;
  BOOL v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = a4;
  v12 = a6;
  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);

  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v29, "count"));
    objc_msgSend(v12, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240450;
    v42 = v17;
    v43 = 2112;
    v44 = v18;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "EDMessageChangeManagerTransferAllMessages", "Begin transfer all NumberOfMessages=%{public,signpost.telemetry:number1}u messages to destinationMailbox=%@ enableTelemetry=YES ", buf, 0x12u);

  }
  v19 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke;
  v37[3] = &unk_1E949D368;
  v37[4] = self;
  v39 = a5;
  v20 = v12;
  v38 = v20;
  v40 = a7;
  -[EDMessageChangeManager iterateMessagesInMailboxURLs:excludingMessages:batchSize:returnMessagesForFlagChange:handler:](self, "iterateMessagesInMailboxURLs:excludingMessages:batchSize:returnMessagesForFlagChange:handler:", v28, v29, 256, 0, v37);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageChangeManager markAllWorkQueue](self, "markAllWorkQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_3;
  block[3] = &unk_1E949D3B8;
  v23 = v28;
  v35 = a5;
  v31 = v23;
  v32 = self;
  v24 = v20;
  v33 = v24;
  v25 = v21;
  v34 = v25;
  v36 = a7;
  dispatch_sync(v22, block);

  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v27, OS_SIGNPOST_INTERVAL_END, v14, "EDMessageChangeManagerTransferAllMessages", ", buf, 2u);
  }

}

void __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "markAllWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_2;
  block[3] = &unk_1E949D340;
  v5 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v11 = *(_BYTE *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, block);

}

id __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "transferMessages:transferType:destinationMailboxURL:userInitiated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

void __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v21;
    v5 = *MEMORY[0x1E0D1DB68];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v8 = *(_QWORD *)(a1 + 64);
        if (v8 == 1)
        {
          if (objc_msgSend(*(id *)(a1 + 40), "mailboxIsAllMail:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i)))v8 = objc_msgSend(*(id *)(a1 + 40), "mailboxPartOfAllMail:", *(_QWORD *)(a1 + 48)) ^ 1;
          else
            v8 = 1;
        }
        objc_msgSend(*(id *)(a1 + 40), "resetStatusCountsForMailboxWithURL:", v7);
        if (*(_QWORD *)(a1 + 48))
          objc_msgSend(*(id *)(a1 + 40), "resetStatusCountsForMailboxWithURL:");
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "ef_hasScheme:", v5);
        if (v9)
          v11 = v10;
        else
          v11 = 0;
        if (v11 == 1 && (objc_msgSend(v9, "isEqualToString:", CFSTR("1")) & 1) == 0)
        {
          v12 = objc_alloc(MEMORY[0x1E0D1E7E8]);
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_4;
          v15[3] = &unk_1E949D390;
          v15[4] = v7;
          v16 = *(id *)(a1 + 48);
          v18 = v8;
          v19 = *(_BYTE *)(a1 + 72);
          v17 = v9;
          v13 = (void *)objc_msgSend(v12, "initWithBuilder:", v15);
          objc_msgSend(*(id *)(a1 + 40), "localActionPersistence");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "persistTransferUndownloadedAction:", v13);

          objc_msgSend(*(id *)(a1 + 40), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 40), "mailboxDatabaseIDForURL:", v7));
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v3);
  }

}

void __123__EDMessageChangeManager_transferAllMessagesFromMailboxes_exceptMessages_transferType_destinationMailboxURL_userInitiated___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setMailboxURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setSourceMailboxURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setDestinationMailboxURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setTransferType:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setUserInitiated:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v3, "setOldestPersistedRemoteID:", *(_QWORD *)(a1 + 48));

}

- (id)addNewMessages:(id)a3 mailboxURL:(id)a4 userInitiated:(BOOL)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  EDPersistenceDatabaseGenerationWindow *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  EDPersistenceDatabaseGenerationWindow *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  EDPersistenceDatabaseGenerationWindow *v28;
  id v29;
  id v30;
  char v31;
  BOOL v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v8 = a4;
  v23 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v34 = objc_msgSend(v24, "count");
    v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Adding %lu new messages to %@", buf, 0x16u);
  }

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistenceWillBeginUpdates");

  LOBYTE(v10) = -[EDMessageChangeManager mailboxURLIsInRemoteAccount:](self, "mailboxURLIsInRemoteAccount:", v8);
  v11 = (void *)objc_opt_new();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke;
  v25[3] = &unk_1E949D458;
  v25[4] = self;
  v13 = v8;
  v26 = v13;
  v14 = v11;
  v27 = v14;
  v15 = v23;
  v28 = v15;
  v16 = v12;
  v29 = v16;
  v17 = v24;
  v30 = v17;
  v31 = (char)v10;
  v32 = a5;
  objc_msgSend(v17, "ef_enumerateObjectsInBatchesOfSize:block:", 25, v25);
  if (objc_msgSend(v16, "count"))
  {
    -[EDMessageChangeManager willStartPersistenceDidAddMessages:](self, "willStartPersistenceDidAddMessages:", v14);
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "persistenceDidAddMessages:generationWindow:", v16, v15);

    -[EDMessageChangeManager didFinishPersistenceDidAddMessages:](self, "didFinishPersistenceDidAddMessages:", v14);
  }
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistenceDidFinishUpdates");

  v20 = v30;
  v21 = v16;

  return v21;
}

void __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int16 v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager addNewMessages:mailboxURL:userInitiated:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_2;
  v7[3] = &unk_1E949D430;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = v6;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v14 = *(_WORD *)(a1 + 80);
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v7);

  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 32), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 32), "mailboxDatabaseIDForURL:", *(_QWORD *)(a1 + 40)));

}

uint64_t __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  char v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v19 = (void *)objc_opt_new();
  v3 = objc_msgSend(*(id *)(a1 + 32), "persistNewMessages:mailboxURL:oldMessagesByNewMessage:fromSyncing:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v19, 0);
  objc_msgSend(*(id *)(a1 + 56), "addEntriesFromDictionary:", v19);
  objc_msgSend(v19, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "insertGeneration:", objc_msgSend(v20, "transactionGeneration"));
  objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", v21);
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 80), "ef_any:", &__block_literal_global_67))
      objc_msgSend(*(id *)(a1 + 32), "resetStatusCountsForMailboxWithURL:", *(_QWORD *)(a1 + 48));
    if (*(_BYTE *)(a1 + 88))
    {
      v4 = (void *)objc_opt_new();
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v5 = v21;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v7 = MEMORY[0x1E0C809B0];
      if (v6)
      {
        v8 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            v11 = objc_alloc(MEMORY[0x1E0D1E7D0]);
            v26[0] = v7;
            v26[1] = 3221225472;
            v26[2] = __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_4;
            v26[3] = &unk_1E949D3E0;
            v26[4] = v10;
            v12 = (void *)objc_msgSend(v11, "initWithBuilder:", v26);
            objc_msgSend(v4, "addObject:", v12);

          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v6);
      }

      v13 = objc_alloc(MEMORY[0x1E0D1E7C8]);
      v22[0] = v7;
      v22[1] = 3221225472;
      v22[2] = __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_5;
      v22[3] = &unk_1E949D408;
      v14 = v4;
      v23 = v14;
      v24 = *(id *)(a1 + 48);
      v25 = *(_BYTE *)(a1 + 89);
      v15 = (void *)objc_msgSend(v13, "initWithBuilder:", v22);
      objc_msgSend(*(id *)(a1 + 32), "localActionPersistence");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "persistTransferAction:", v15);

    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "read") ^ 1;

  return v3;
}

uint64_t __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDestinationMessage:", *(_QWORD *)(a1 + 32));
}

void __66__EDMessageChangeManager_addNewMessages_mailboxURL_userInitiated___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setItemsToCopy:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setDestinationMailboxURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setMailboxURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setUserInitiated:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v3, "setTransferType:", 2);

}

- (void)deleteMessages:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Deleting %lu messages", (uint8_t *)&v7, 0xCu);
  }

  v6 = -[EDMessageChangeManager transferMessages:transferType:destinationMailboxURL:userInitiated:](self, "transferMessages:transferType:destinationMailboxURL:userInitiated:", v4, 3, 0, 0);
}

- (void)applyFlagChange:(id)a3 toAllMessagesFromMailboxes:(id)a4 exceptMessages:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  EDMessageChangeManager *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  _BYTE v36[18];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v8 = a4;
  v9 = a5;
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v27, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v36 = v11;
    *(_WORD *)&v36[8] = 2112;
    *(_QWORD *)&v36[10] = v8;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Setting flags %{public}@ on all message for mailboxes %@", buf, 0x16u);

  }
  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v16 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v9, "count"));
    v17 = objc_msgSend(v27, "hash");
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v36 = v16;
    *(_WORD *)&v36[4] = 2050;
    *(_QWORD *)&v36[6] = v17;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EDMessageChangeManagerChangeFlagAllMessages", "Begin flag change NumberOfMessages=%{public,signpost.telemetry:number1}u messages to FlagChange=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x12u);
  }

  v18 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke;
  v33[3] = &unk_1E949D480;
  v33[4] = self;
  v19 = v27;
  v34 = v19;
  -[EDMessageChangeManager iterateMessagesInMailboxURLs:excludingMessages:batchSize:returnMessagesForFlagChange:handler:](self, "iterateMessagesInMailboxURLs:excludingMessages:batchSize:returnMessagesForFlagChange:handler:", v8, v9, 256, v19, v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageChangeManager markAllWorkQueue](self, "markAllWorkQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_3;
  block[3] = &unk_1E949B680;
  v22 = v8;
  v29 = v22;
  v23 = v19;
  v30 = v23;
  v31 = self;
  v24 = v20;
  v32 = v24;
  dispatch_sync(v21, block);

  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v26, OS_SIGNPOST_INTERVAL_END, v13, "EDMessageChangeManagerChangeFlagAllMessages", ", buf, 2u);
  }

}

void __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "markAllWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_2;
  block[3] = &unk_1E949B390;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

id __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "applyFlagChange:toMessages:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_3(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v18;
    v5 = *MEMORY[0x1E0D1DB68];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(a1[5], "readChanged") & 1) != 0 || objc_msgSend(a1[5], "deletedChanged"))
          objc_msgSend(a1[6], "resetStatusCountsForMailboxWithURL:", v7);
        objc_msgSend(a1[7], "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "ef_hasScheme:", v5);
        if (v8)
          v10 = v9;
        else
          v10 = 0;
        if (v10 == 1 && (objc_msgSend(v8, "isEqualToString:", CFSTR("1")) & 1) == 0)
        {
          v11 = objc_alloc(MEMORY[0x1E0D1E6F8]);
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_4;
          v14[3] = &unk_1E949D4A8;
          v14[4] = v7;
          v15 = a1[5];
          v16 = v8;
          v12 = (void *)objc_msgSend(v11, "initWithBuilder:", v14);
          objc_msgSend(a1[6], "localActionPersistence");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "persistFlagChangeUndownloadedAction:", v12);

          objc_msgSend(a1[6], "checkForNewActionsInMailboxID:", objc_msgSend(a1[6], "mailboxDatabaseIDForURL:", v7));
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);
  }

}

void __84__EDMessageChangeManager_applyFlagChange_toAllMessagesFromMailboxes_exceptMessages___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setMailboxURL:", a1[4]);
  objc_msgSend(v3, "setFlagChange:", a1[5]);
  objc_msgSend(v3, "setOldestPersistedRemoteID:", a1[6]);

}

- (id)applyFlagChange:(id)a3 toMessages:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  __CFString *v29;
  EDPersistenceDatabaseGenerationWindow *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  EDPersistenceDatabaseGenerationWindow *v37;
  __CFString *v38;
  uint8_t v39[16];
  _QWORD v40[5];
  id v41;
  __CFString *v42;
  EDPersistenceDatabaseGenerationWindow *v43;
  _BYTE *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v6, "readChanged");
  v10 = &stru_1E94A4508;
  if (v9)
    v10 = CFSTR("[ReadFlags] ");
  v38 = v10;
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "ef_publicDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2048;
    v53 = (uint64_t (*)(uint64_t, uint64_t))v8;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Setting flags %{public}@ on %lu messages", buf, 0x20u);

  }
  v37 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);

  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", v8);
    v18 = objc_msgSend(v6, "hash");
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&buf[4] = v17;
    *(_WORD *)&buf[8] = 2050;
    *(_QWORD *)&buf[10] = v18;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "EDMessageChangeManagerChangeFlagMessages", "Begin flag change NumberOfMessages=%{public,signpost.telemetry:number1}u messages to FlagChange=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x12u);
  }

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistenceWillBeginUpdates");

  objc_msgSend(v7, "ef_filter:", &__block_literal_global_71);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ef_groupBy:", &__block_literal_global_73);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ef_flatten");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24 != v8)
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[EDMessageChangeManager applyFlagChange:toMessages:].cold.1(v24, v8, v25);

  }
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_filter:", &__block_literal_global_354);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "persistenceWillChangeFlags:messages:", v6, v27);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v53 = __Block_byref_object_copy__14;
  v54 = __Block_byref_object_dispose__14;
  v55 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__14;
  v50 = __Block_byref_object_dispose__14;
  v51 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_74;
  v40[3] = &unk_1E949D540;
  v40[4] = self;
  v28 = v6;
  v41 = v28;
  v29 = v38;
  v42 = v29;
  v30 = v37;
  v43 = v30;
  v44 = buf;
  v45 = &v46;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v40);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "persistenceDidChangeFlags:messages:generationWindow:", v28, v47[5], v30);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "persistenceDidFinishUpdates");

  +[EDMessageChangeManager signpostLog](EDMessageChangeManager, "signpostLog");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)v39 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v34, OS_SIGNPOST_INTERVAL_END, v14, "EDMessageChangeManagerChangeFlagMessages", ", v39, 2u);
  }

  v35 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(buf, 8);
  return v35;
}

BOOL __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

id __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  char v20;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "mailboxURLIsInRemoteAccount:", v5);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager applyFlagChange:toMessages:]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2_75;
  v13[3] = &unk_1E949D518;
  v10 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v10;
  v11 = v6;
  v15 = v11;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v19 = *(_OWORD *)(a1 + 64);
  v12 = v5;
  v18 = v12;
  v20 = v7;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 32), "mailboxDatabaseIDForURL:", v12));

}

uint64_t __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2_75(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "applyFlagChange:toMessagesInDatabase:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 != objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 56);
      v8 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 138543874;
      v27 = v7;
      v28 = 2048;
      v29 = v5;
      v30 = 2048;
      v31 = v8;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Applied flag change to %lu of %lu messages", buf, 0x20u);
    }

  }
  objc_msgSend(v4, "ef_filter:", &__block_literal_global_354);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != objc_msgSend(v9, "count"))
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2_75_cold_1((uint64_t)buf, objc_msgSend(v9, "count"), v5, v10);

  }
  objc_msgSend(*(id *)(a1 + 64), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObjectsFromArray:", v9);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "hookResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistenceIsChangingFlags:messages:generationWindow:", *(_QWORD *)(a1 + 40), v9, *(_QWORD *)(a1 + 64));

    if ((objc_msgSend(*(id *)(a1 + 40), "readChanged") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 40), "deletedChanged"))
    {
      objc_msgSend(*(id *)(a1 + 32), "resetStatusCountsForMailboxWithURL:", *(_QWORD *)(a1 + 72));
    }
  }
  if (*(_BYTE *)(a1 + 96) && objc_msgSend(v4, "count"))
  {
    v12 = objc_alloc(MEMORY[0x1E0D1E6E8]);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_77;
    v21 = &unk_1E949D4F0;
    v13 = *(id *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 32);
    v22 = v13;
    v23 = v14;
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 40);
    v15 = (void *)objc_msgSend(v12, "initWithBuilder:", &v18);
    objc_msgSend(*(id *)(a1 + 32), "localActionPersistence", v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "persistFlagChangeAction:", v15);

  }
  return 1;
}

void __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_77(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setMailboxURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "messagesToJournalForMessages:inMailbox:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessages:", v3);

  objc_msgSend(v4, "setFlagChange:", *(_QWORD *)(a1 + 56));
}

- (void)applyFollowUp:(id)a3 toMessages:(id)a4
{
  -[EDMessageChangeManager applyFollowUp:toMessages:withNegativeFeedbackForSuggestions:](self, "applyFollowUp:toMessages:withNegativeFeedbackForSuggestions:", a3, a4, 0);
}

- (void)applyFollowUp:(id)a3 toMessages:(id)a4 withNegativeFeedbackForSuggestions:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  EDPersistenceDatabaseGenerationWindow *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[5];
  id v22;
  uint8_t v23[4];
  uint64_t v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Setting follow up dates and json data %{public}@ on %lu messages", buf, 0x16u);
  }

  v11 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistenceWillBeginUpdates");

  if (v5)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__14;
    v27 = __Block_byref_object_dispose__14;
    v28 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(MEMORY[0x1E0D19970], "serviceForMail");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setSyncTimeout:", 0.1);
    -[EDMessageChangeManager messagePersistence](self, "messagePersistence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "retrieveFollowUpJsonStringForModelEvaluationForSuggestionsForMessages:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__14;
    v21[4] = __Block_byref_object_dispose__14;
    v22 = 0;
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v14, "count");
      *(_DWORD *)v23 = 134217984;
      v24 = v16;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Sending negative feedback for follow up to Suggestions for %lu messages", v23, 0xCu);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__EDMessageChangeManager_applyFollowUp_toMessages_withNegativeFeedbackForSuggestions___block_invoke;
    v20[3] = &unk_1E949D568;
    v20[4] = buf;
    v20[5] = v21;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
    _Block_object_dispose(v21, 8);

    _Block_object_dispose(buf, 8);
  }
  -[EDMessageChangeManager messagePersistence](self, "messagePersistence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "persistFollowUp:forMessages:", v8, v9);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "persistenceDidUpdateFollowUpForMessages:generationWindow:", v9, v11);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistenceDidFinishUpdates");

}

void __86__EDMessageChangeManager_applyFollowUp_toMessages_withNegativeFeedbackForSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[8];
  id obj;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Suggestions does not respond to selector @selector(reportMailIntelligenceFollowUpUserEngagement:forStringFromFollowUpWarning:error:)", v11, 2u);
    }
    goto LABEL_7;
  }
  v5 = *(_QWORD *)(a1 + 40);
  v4 = a1 + 40;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 8) + 40);
  v7 = *(_QWORD *)(v5 + 8);
  obj = *(id *)(v7 + 40);
  v8 = (id)objc_msgSend(v6, "reportMailIntelligenceFollowUpUserEngagement:forStringFromFollowUpWarning:error:", 0, v3, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40))
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __86__EDMessageChangeManager_applyFollowUp_toMessages_withNegativeFeedbackForSuggestions___block_invoke_cold_1(v4, v9, v10);
LABEL_7:

  }
}

- (id)applyReadLaterDate:(id)a3 displayDate:(id)a4 toMessages:(id)a5
{
  -[EDMessageChangeManager _applyReadLaterDate:displayDate:toMessages:changeIsRemote:](self, "_applyReadLaterDate:displayDate:toMessages:changeIsRemote:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_applyReadLaterDate:(id)a3 displayDate:(id)a4 toMessages:(id)a5 changeIsRemote:(BOOL)a6
{
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  EDPersistenceDatabaseGenerationWindow *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  EDPersistenceDatabaseGenerationWindow *v28;
  void *v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  EDPersistenceDatabaseGenerationWindow *v37;
  id v38;
  id v39;
  id v40;
  EDMessageChangeManager *v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD aBlock[4];
  id v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v32 = a6;
  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v30 = a4;
  v35 = a5;
  -[EDMessageChangeManager _truncateReadLaterDate:](self, "_truncateReadLaterDate:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v10;
  if (v10)
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2C8]), "initWithDate:", v10);
  else
    v29 = 0;
  EDRemindMeLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2048;
    v54 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v35, "count");
    LOWORD(v55) = 1024;
    *(_DWORD *)((char *)&v55 + 2) = v32;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Setting read later date=%{public}@, displayDate=%{public}@ on %lu messages, changeIsRemote:%{BOOL}d", buf, 0x26u);
  }

  v28 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v12;
  objc_msgSend(v12, "persistenceWillBeginUpdates");
  if (objc_msgSend(v35, "count"))
    objc_msgSend(v12, "persistenceWillChangeReadLaterDate:messages:", v34, v35);
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__EDMessageChangeManager__applyReadLaterDate_displayDate_toMessages_changeIsRemote___block_invoke;
  aBlock[3] = &unk_1E949D590;
  v14 = v30;
  v52 = v14;
  v33 = _Block_copy(aBlock);
  objc_msgSend(v35, "ef_filter:", v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v12, "persistenceWillUpdateDisplayDateForMessages:", v15);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v54 = __Block_byref_object_copy__14;
  v55 = __Block_byref_object_dispose__14;
  v56 = 0;
  -[EDMessageChangeManager database](self, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager _applyReadLaterDate:displayDate:toMessages:changeIsRemote:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = __84__EDMessageChangeManager__applyReadLaterDate_displayDate_toMessages_changeIsRemote___block_invoke_2;
  v36[3] = &unk_1E949D5B8;
  v45 = &v47;
  v18 = v28;
  v37 = v18;
  v19 = v35;
  v38 = v19;
  v20 = v29;
  v39 = v20;
  v21 = v33;
  v44 = v21;
  v22 = v34;
  v40 = v22;
  v41 = self;
  v23 = v14;
  v42 = v23;
  v24 = v31;
  v43 = v24;
  v46 = buf;
  objc_msgSend(v16, "__performWriteWithCaller:usingBlock:", v17, v36);

  if (objc_msgSend(v19, "count"))
    objc_msgSend(v24, "persistenceDidChangeReadLaterDate:messages:changeIsRemote:generationWindow:", v22, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v32, v18);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v24, "persistenceDidUpdateDisplayDateForMessages:changeIsRemote:generation:", v15, v32, v48[3]);
  objc_msgSend(v24, "persistenceDidFinishUpdates");
  v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (!v25)
    v25 = (void *)MEMORY[0x1E0C9AA60];
  v26 = v25;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v47, 8);

  return v26;
}

uint64_t __84__EDMessageChangeManager__applyReadLaterDate_displayDate_toMessages_changeIsRemote___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "displayDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToDate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "dateReceived");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToDate:", v7);

  }
  return v6 ^ 1u;
}

uint64_t __84__EDMessageChangeManager__applyReadLaterDate_displayDate_toMessages_changeIsRemote___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(v3, "transactionGeneration");
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "setReadLater:", *(_QWORD *)(a1 + 48), (_QWORD)v17);
        objc_msgSend(v8, "displayDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
        v11 = *(void **)(a1 + 64);
        if (*(_QWORD *)(a1 + 56))
        {
          objc_msgSend(v11, "readLaterPersistence");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "persistReadLaterForMessage:date:displayDate:", v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
        }
        else
        {
          objc_msgSend(v11, "readLaterPersistence");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeReadLaterForMessage:", v8);
        }

        if (v10)
          objc_msgSend(*(id *)(a1 + 80), "persistenceIsUpdatingDisplayDateForMessage:fromDate:generation:", v8, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v13 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  return 1;
}

- (id)_truncateReadLaterDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "ef_dateWithTruncatedSeconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ef_isLaterThanOrEqualDate:", v5);

  v7 = v4;
  if ((v6 & 1) == 0)
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[EDMessageChangeManager _truncateReadLaterDate:].cold.1((uint64_t)v4, (uint64_t)v3, v8);

    v7 = v3;
  }
  v9 = v7;

  return v9;
}

- (void)applyVIPStatus:(BOOL)a3 forMessages:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistenceWillBeginUpdates");

  -[EDMessageChangeManager applyVIPStatus:toMessagesInDatabase:](self, "applyVIPStatus:toMessagesInDatabase:", v4, v9);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistenceDidChangeVIPStatus:messages:", v4, v9);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceDidFinishUpdates");

}

- (id)addLabels:(id)a3 removeLabels:(id)a4 forMessages:(id)a5
{
  id v8;
  id v9;
  id v10;
  EDPersistenceDatabaseGenerationWindow *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  EDPersistenceDatabaseGenerationWindow *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  EDPersistenceDatabaseGenerationWindow *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistenceWillBeginUpdates");

  objc_msgSend(v10, "ef_groupBy:", &__block_literal_global_85);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_2;
  v25[3] = &unk_1E949D630;
  v25[4] = self;
  v15 = v8;
  v26 = v15;
  v16 = v9;
  v27 = v16;
  v17 = v11;
  v28 = v17;
  v18 = v14;
  v29 = v18;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v25);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ef_filter:", &__block_literal_global_354);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistenceDidAddLabels:removeLabels:messages:generationWindow:", v15, v16, v20, v17);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "persistenceDidFinishUpdates");

  v22 = v29;
  v23 = v18;

  return v23;
}

id __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "mailboxURLIsInRemoteAccount:", v5);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager addLabels:removeLabels:forMessages:]_block_invoke_2");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_3;
  v13[3] = &unk_1E949D608;
  v10 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v10;
  v15 = *(id *)(a1 + 48);
  v11 = v6;
  v16 = v11;
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v20 = v7;
  v12 = v5;
  v19 = v12;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "checkForNewActionsInMailboxID:", objc_msgSend(*(id *)(a1 + 32), "mailboxDatabaseIDForURL:", v12));

}

uint64_t __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *, void *);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addLabels:removeLabels:toMessagesInDatabase:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", v4);
  if (*(_BYTE *)(a1 + 88) && objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0D1E738]);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_4;
    v12 = &unk_1E949D5E0;
    v13 = *(id *)(a1 + 80);
    v14 = v4;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v6 = (void *)objc_msgSend(v5, "initWithBuilder:", &v9);
    objc_msgSend(*(id *)(a1 + 32), "localActionPersistence", v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistLabelChangeAction:", v6);

  }
  return 1;
}

void __61__EDMessageChangeManager_addLabels_removeLabels_forMessages___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setMailboxURL:", a1[4]);
  objc_msgSend(v3, "setMessages:", a1[5]);
  objc_msgSend(v3, "setLabelsToAdd:", a1[6]);
  objc_msgSend(v3, "setLabelsToRemove:", a1[7]);

}

- (id)messagesToJournalForMessages:(id)a3 inMailbox:(id)a4
{
  return a3;
}

- (id)reflectNewMessages:(id)a3 mailboxURL:(id)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  dispatch_time_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  EDPersistenceDatabaseGenerationWindow *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id obj;
  _QWORD v45[4];
  id v46;
  EDMessageChangeManager *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[5];
  id v54;
  _QWORD v55[5];
  EDPersistenceDatabaseGenerationWindow *v56;
  id v57;
  id v58;
  id v59;
  SEL v60;
  void *v61;
  void *v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  unint64_t v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v41 = a4;
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistenceWillBeginUpdates");

  +[EDMessageChangeManager log](EDMessageChangeManager, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v64 = objc_msgSend(v42, "count");
    v65 = 2112;
    v66 = (uint64_t)v41;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Adding %lu new messages from server sync to %@", buf, 0x16u);
  }

  if (objc_msgSend(v42, "count"))
  {
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistenceWillAddNewMessages:", v42);

  }
  v39 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  v43 = (void *)objc_opt_new();
  v10 = -[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:", v41);
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v12 = (void *)objc_opt_new();
    v55[0] = v11;
    v55[1] = 3221225472;
    v55[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke;
    v55[3] = &unk_1E949D720;
    v55[4] = self;
    v56 = v39;
    v57 = v41;
    v58 = v43;
    v60 = a2;
    v13 = v12;
    v59 = v13;
    objc_msgSend(v42, "ef_enumerateObjectsInBatchesOfSize:block:", 256, v55);
    v14 = v59;
    v15 = v13;

  }
  else
  {
    -[EDMessageChangeManager persistNewMessages:mailboxURL:oldMessagesByNewMessage:fromSyncing:](self, "persistNewMessages:mailboxURL:oldMessagesByNewMessage:fromSyncing:", v42, v41, v43, 1);
    objc_msgSend(v43, "allKeys");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[EDMessageChangeManager markAllWorkQueue](self, "markAllWorkQueue", v39);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_7;
  block[3] = &unk_1E949B6D0;
  block[4] = self;
  v17 = v15;
  v54 = v17;
  dispatch_async(v16, block);

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1D824B334]();
        -[EDMessageChangeManager readLaterPersistence](self, "readLaterPersistence");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        objc_msgSend(v23, "cloudStorageReadLaterDateForMessage:displayDate:", v21, &v48);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (unint64_t)v48;

        if (v24 | v25)
        {
          EDRemindMeLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v21, "messageIDHeaderHash");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "int64Value");
            *(_DWORD *)buf = 134218498;
            v64 = v28;
            v65 = 2114;
            v66 = v24;
            v67 = 2114;
            v68 = v25;
            _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Applying to downloaded message: %lld readLaterDate:%{public}@ displayDate:%{public}@", buf, 0x20u);

          }
          if (v24)
          {
            v62 = v21;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[EDMessageChangeManager _applyReadLaterDate:displayDate:toMessages:changeIsRemote:](self, "_applyReadLaterDate:displayDate:toMessages:changeIsRemote:", v24, v25, v29, 1);
          }
          else
          {
            if (!v25)
              goto LABEL_21;
            -[EDMessageChangeManager messagePersistence](self, "messagePersistence");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v21;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "updateDisplayDateForPersistedMessages:displayDate:changeIsRemote:", v31, v25, 1);

          }
        }
LABEL_21:

        objc_autoreleasePoolPop(v22);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v43, "count") && objc_msgSend(obj, "count"))
  {
    -[EDMessageChangeManager willStartPersistenceDidAddMessages:](self, "willStartPersistenceDidAddMessages:", v43);
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "persistenceDidAddMessages:generationWindow:", obj, v40);

    -[EDMessageChangeManager didFinishPersistenceDidAddMessages:](self, "didFinishPersistenceDidAddMessages:", v43);
    -[EDMessageChangeManager didReflectNewMessages:](self, "didReflectNewMessages:", obj);
  }
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "persistenceDidFinishUpdates");

  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 46))
  {
    v34 = dispatch_time(0, 15000000000);
    -[EDMessageChangeManager markAllWorkQueue](self, "markAllWorkQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_100;
    v45[3] = &unk_1E949B6D0;
    v46 = obj;
    v47 = self;
    dispatch_after(v34, v35, v45);

  }
  v36 = v54;
  v37 = obj;

  return v37;
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager reflectNewMessages:mailboxURL:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_2;
  v11[3] = &unk_1E949D6F8;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v9 = v3;
  v14 = v9;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 64);
  v8 = (id)v10;
  v17 = v10;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v11);

}

uint64_t __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  uint64_t v37;
  void *v38;
  __int16 v39;
  _QWORD v40[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v33 = (void *)objc_opt_new();
  v37 = a1;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v31, "transactionGeneration"));
  LODWORD(a1) = objc_msgSend(*(id *)(v37 + 40), "persistNewMessages:mailboxURL:oldMessagesByNewMessage:fromSyncing:", *(_QWORD *)(v37 + 48), *(_QWORD *)(v37 + 56), v33, 1);
  objc_msgSend(*(id *)(v37 + 64), "addEntriesFromDictionary:", v33);
  if ((_DWORD)a1 && _os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(v37 + 40), "bimiManager", v31);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processBIMIHeadersForMessages:", *(_QWORD *)(v37 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v4, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ef_mapSelector:", sel_second);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_flatten");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithArray:", v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_3;
    v49[3] = &unk_1E949D658;
    v12 = v9;
    v50 = v12;
    v13 = v10;
    v51 = v13;
    objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v49);
    v46[0] = v11;
    v46[1] = 3221225472;
    v46[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_4;
    v46[3] = &unk_1E949D6A8;
    v14 = v13;
    v15 = *(_QWORD *)(v37 + 40);
    v47 = v14;
    v48 = v15;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v46);

  }
  objc_msgSend(*(id *)(v37 + 40), "serverMessagePersistenceFactory", v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serverMessagePersistenceForMailboxURL:", *(_QWORD *)(v37 + 56));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)objc_opt_new();
  v34 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v33, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v17;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v43;
    v20 = MEMORY[0x1E0C809B0];
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v21);
        v23 = objc_alloc(MEMORY[0x1E0D1E798]);
        v40[0] = v20;
        v40[1] = 3221225472;
        v40[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_6;
        v40[3] = &unk_1E949D6D0;
        v40[4] = v22;
        v24 = v38;
        v41 = v24;
        v25 = (void *)objc_msgSend(v23, "initWithIMAPServerMessageBuilder:", v40);
        v39 = 0;
        objc_msgSend(v24, "addServerMessage:invalidMessage:duplicateRemoteID:", v25, (char *)&v39 + 1, &v39);
        if (HIBYTE(v39))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v37 + 80), *(_QWORD *)(v37 + 40), CFSTR("EDMessageChangeManager.m"), 856, CFSTR("Got foreign key constraint"));

        }
        if ((_BYTE)v39)
        {
          v26 = *(void **)(v37 + 40);
          objc_msgSend(v22, "persistentID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "messageForDatabaseID:", objc_msgSend(v27, "longLongValue"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "addObject:", v28);
        }
        else
        {
          objc_msgSend(v34, "addObject:", v22);
        }

        ++v21;
      }
      while (v18 != v21);
      v17 = obj;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v36, "count"))
    objc_msgSend(*(id *)(v37 + 40), "deletePersistedMessages:", v36);
  if (objc_msgSend(v34, "count"))
    objc_msgSend(*(id *)(v37 + 72), "addObjectsFromArray:", v34);

  return 1;
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      *a4 = 1;
  }

}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v5, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_5;
  v12[3] = &unk_1E949D680;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v6, "ef_compactMap:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "messagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "longLongValue");
  objc_msgSend(v5, "first");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBrandIndicatorDatabaseID:location:forMessages:", v9, v10, v7);

}

id __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_5(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "remoteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImapUID:", uidFromString(v3));

  objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessagePersistentID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "flags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerFlags:", v5);

  if (objc_msgSend(*(id *)(a1 + 40), "supportsLabels"))
  {
    objc_msgSend(*(id *)(a1 + 32), "labels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLabels:", v6);

  }
}

uint64_t __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearFollowUpsFromThreadsForMessages:", *(_QWORD *)(a1 + 40));
}

void __56__EDMessageChangeManager_reflectNewMessages_mailboxURL___block_invoke_100(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v1)
  {
    v2 = *(_QWORD *)v26;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v26 != v2)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v3);
        v5 = objc_alloc(MEMORY[0x1E0CB3498]);
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "subject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "subjectString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("Top line summary for %@"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v5, "initWithString:", v9);

        v11 = objc_alloc(MEMORY[0x1E0CB3498]);
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "subject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subjectString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("Synopsis for %@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v11, "initWithString:", v15);

        objc_msgSend(v4, "subject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "subjectString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("Urgent"));

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F0]), "initWithGlobalMessageID:", objc_msgSend(v4, "globalMessageID"));
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E188]), "initWithTopLine:synopsis:urgent:messageItemID:", v10, v16, v19, v20);
        objc_msgSend(*(id *)(a1 + 40), "messagePersistence");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setGeneratedSummary:forPersistedMessage:", v21, v4);

        ++v3;
      }
      while (v1 != v3);
      v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v1);
  }

}

- (void)reflectDeletedMessages:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  EDPersistenceDatabaseGenerationWindow *v10;
  void *v11;
  void *v12;
  void *v13;
  EDPersistenceDatabaseGenerationWindow *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  EDPersistenceDatabaseGenerationWindow *v20;
  EDMessageChangeManager *v21;
  id v22;

  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailbox");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageChangeManager.m"), 940, CFSTR("Calling reflectFlagChanges:forMessages: on IMAP"));

  }
  v10 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistenceWillBeginUpdates");

  -[EDMessageChangeManager database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager reflectDeletedMessages:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__EDMessageChangeManager_reflectDeletedMessages___block_invoke;
  v19[3] = &unk_1E949B0B8;
  v14 = v10;
  v20 = v14;
  v21 = self;
  v18 = v5;
  v22 = v18;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v19);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "persistenceDidDeleteMessages:generationWindow:", v18, v14);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistenceDidFinishUpdates");

}

uint64_t __49__EDMessageChangeManager_reflectDeletedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(*(id *)(a1 + 40), "deletePersistedMessages:", *(_QWORD *)(a1 + 48));

  return 1;
}

- (void)reflectDeletedMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4
{
  id v6;
  EDPersistenceDatabaseGenerationWindow *v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  EDPersistenceDatabaseGenerationWindow *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  EDPersistenceDatabaseGenerationWindow *v20;
  id v21;
  BOOL v22;

  v17 = a3;
  v6 = a4;
  v7 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceWillBeginUpdates");

  v9 = -[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:", v6);
  v10 = v9;
  if (v9)
  {
    -[EDMessageChangeManager serverMessagePersistenceFactory](self, "serverMessagePersistenceFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverMessagePersistenceForMailboxURL:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__EDMessageChangeManager_reflectDeletedMessagesWithRemoteIDs_mailboxURL___block_invoke;
  v18[3] = &unk_1E949D770;
  v18[4] = self;
  v13 = v6;
  v19 = v13;
  v14 = v7;
  v20 = v14;
  v22 = v10;
  v15 = v12;
  v21 = v15;
  objc_msgSend(v17, "ef_enumerateObjectsInBatchesOfSize:block:", 25, v18);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistenceDidFinishUpdates");

}

void __73__EDMessageChangeManager_reflectDeletedMessagesWithRemoteIDs_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager reflectDeletedMessagesWithRemoteIDs:mailboxURL:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__EDMessageChangeManager_reflectDeletedMessagesWithRemoteIDs_mailboxURL___block_invoke_2;
  v9[3] = &unk_1E949D748;
  v6 = *(_QWORD *)(a1 + 32);
  v14 = &v16;
  v9[4] = v6;
  v7 = v3;
  v10 = v7;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v15 = *(_BYTE *)(a1 + 64);
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v9);

  objc_msgSend(*(id *)(a1 + 32), "hookResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceDidDeleteMessages:generationWindow:", v17[5], *(_QWORD *)(a1 + 48));

  _Block_object_dispose(&v16, 8);
}

uint64_t __73__EDMessageChangeManager_reflectDeletedMessagesWithRemoteIDs_mailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "messagesForRemoteIDs:mailboxURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 56), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(*(id *)(a1 + 32), "deletePersistedMessages:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 64), "deleteServerMessagesWithRemoteIDs:", *(_QWORD *)(a1 + 40));

  return 1;
}

- (void)reflectAllMessagesDeletedInMailboxURL:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  EDPersistenceDatabaseGenerationWindow *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  EDPersistenceDatabaseGenerationWindow *v29;
  void *v30;
  _QWORD v31[4];
  EDPersistenceDatabaseGenerationWindow *v32;
  id v33;
  id v34;
  EDMessageChangeManager *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  if (!-[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageChangeManager.m"), 987, CFSTR("Reflect all deleted server messages for a data source without server messages"));

  }
  v29 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceWillBeginUpdates");

  -[EDMessageChangeManager serverMessagePersistenceFactory](self, "serverMessagePersistenceFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverMessagePersistenceForMailboxURL:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  while (1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 1, 0xFFFFFFFFLL);
    objc_msgSend(v30, "serverMessagesForIMAPUIDs:limit:returnLastEntries:", v7, 25, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "count"))
      break;
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v15, "remoteID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

          objc_msgSend(v15, "messagePersistentID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v15, "messagePersistentID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[EDMessageChangeManager messageForDatabaseID:](self, "messageForDatabaseID:", objc_msgSend(v18, "longLongValue"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v19);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v12);
    }

    -[EDMessageChangeManager database](self, "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager reflectAllMessagesDeletedInMailboxURL:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __64__EDMessageChangeManager_reflectAllMessagesDeletedInMailboxURL___block_invoke;
    v31[3] = &unk_1E949D798;
    v22 = v29;
    v32 = v22;
    v33 = v30;
    v23 = v9;
    v34 = v23;
    v35 = self;
    v24 = v10;
    v36 = v24;
    objc_msgSend(v20, "__performWriteWithCaller:usingBlock:", v21, v31);

    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "persistenceDidDeleteMessages:generationWindow:", v24, v22);

  }
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "persistenceDidFinishUpdates");

}

uint64_t __64__EDMessageChangeManager_reflectAllMessagesDeletedInMailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(*(id *)(a1 + 40), "deleteServerMessagesWithRemoteIDs:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "deletePersistedMessages:", *(_QWORD *)(a1 + 64));

  return 1;
}

- (void)reflectDeletedAllClearedMessagesInMailboxURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EDPersistenceDatabaseGenerationWindow *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  EDPersistenceDatabaseGenerationWindow *v22;
  _QWORD v23[4];
  EDPersistenceDatabaseGenerationWindow *v24;
  EDMessageChangeManager *v25;
  id v26;
  _QWORD v27[5];

  v21 = a3;
  if (-[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:"))
  {
    v22 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistenceWillBeginUpdates");

    -[EDMessageChangeManager serverMessagePersistenceFactory](self, "serverMessagePersistenceFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverMessagePersistenceForMailboxURL:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v6, "deleteAllClearedUIDMessages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    while (objc_msgSend(v9, "count"))
    {
      v11 = objc_msgSend(v9, "count");
      if (v11 >= 0xC8)
        v12 = 200;
      else
        v12 = v11;
      objc_msgSend(v9, "subarrayWithRange:", 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectsInRange:", 0, v12);
      v27[0] = v10;
      v27[1] = 3221225472;
      v27[2] = __71__EDMessageChangeManager_reflectDeletedAllClearedMessagesInMailboxURL___block_invoke;
      v27[3] = &unk_1E949D7C0;
      v27[4] = self;
      objc_msgSend(v13, "ef_compactMap:", v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageChangeManager database](self, "database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager reflectDeletedAllClearedMessagesInMailboxURL:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __71__EDMessageChangeManager_reflectDeletedAllClearedMessagesInMailboxURL___block_invoke_2;
      v23[3] = &unk_1E949B0B8;
      v17 = v22;
      v24 = v17;
      v25 = self;
      v18 = v14;
      v26 = v18;
      objc_msgSend(v15, "__performWriteWithCaller:usingBlock:", v16, v23);

      -[EDMessageChangeManager hookResponder](self, "hookResponder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "persistenceDidDeleteMessages:generationWindow:", v18, v17);

    }
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "persistenceDidFinishUpdates");

  }
}

id __71__EDMessageChangeManager_reflectDeletedAllClearedMessagesInMailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "longLongValue");
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "messageForDatabaseID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __71__EDMessageChangeManager_reflectDeletedAllClearedMessagesInMailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(*(id *)(a1 + 40), "deletePersistedMessages:", *(_QWORD *)(a1 + 48));

  return 1;
}

- (void)reflectFlagChanges:(id)a3 forMessages:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageChangeManager.m"), 1057, CFSTR("Calling reflectFlagChanges:forMessages: on IMAP"));

  }
  -[EDMessageChangeManager _reflectFlagChanges:messages:remoteIDs:mailboxURL:](self, "_reflectFlagChanges:messages:remoteIDs:mailboxURL:", v13, v7, 0, 0);

}

- (void)reflectFlagChanges:(id)a3 forMessagesWithRemoteIDs:(id)a4 mailboxURL:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[EDMessageChangeManager messagesForRemoteIDs:mailboxURL:](self, "messagesForRemoteIDs:mailboxURL:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageChangeManager _reflectFlagChanges:messages:remoteIDs:mailboxURL:](self, "_reflectFlagChanges:messages:remoteIDs:mailboxURL:", v11, v10, v8, v9);

}

- (void)_reflectFlagChanges:(id)a3 messages:(id)a4 remoteIDs:(id)a5 mailboxURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EDPersistenceDatabaseGenerationWindow *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  EDPersistenceDatabaseGenerationWindow *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  EDPersistenceDatabaseGenerationWindow *v27;
  EDMessageChangeManager *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "persistenceWillBeginUpdates");

  if (objc_msgSend(v11, "count"))
  {
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "persistenceWillChangeFlags:messages:", v10, v11);

  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__14;
  v38 = __Block_byref_object_dispose__14;
  v39 = 0;
  -[EDMessageChangeManager database](self, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager _reflectFlagChanges:messages:remoteIDs:mailboxURL:]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__EDMessageChangeManager__reflectFlagChanges_messages_remoteIDs_mailboxURL___block_invoke;
  v26[3] = &unk_1E949D7E8;
  v19 = v14;
  v27 = v19;
  v28 = self;
  v20 = v13;
  v29 = v20;
  v21 = v12;
  v30 = v21;
  v22 = v10;
  v31 = v22;
  v23 = v11;
  v32 = v23;
  v33 = &v34;
  objc_msgSend(v17, "__performWriteWithCaller:usingBlock:", v18, v26);

  if (objc_msgSend(v23, "count"))
  {
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "persistenceDidChangeFlags:messages:generationWindow:", v22, v35[5], v19);

  }
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "persistenceDidFinishUpdates");

  _Block_object_dispose(&v34, 8);
}

uint64_t __76__EDMessageChangeManager__reflectFlagChanges_messages_remoteIDs_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if (objc_msgSend(*(id *)(a1 + 40), "_needToStoreServerMessagesForMailboxURL:", *(_QWORD *)(a1 + 48))
    && objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "serverMessagePersistenceFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverMessagePersistenceForMailboxURL:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "applyFlagChange:toMessagesWithRemoteIDs:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "applyFlagChange:toMessagesInDatabase:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "hookResponder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "persistenceIsChangingFlags:messages:generationWindow:", *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 32));

    }
  }

  return 1;
}

- (void)reflectSortedFlagChanges:(id)a3 mailboxURL:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id obj;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v33 = a4;
  v5 = objc_msgSend(v30, "count");
  if (v33 && v5)
  {
    v29 = v30;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v29, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v29;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v42 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v10, "first");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "unsignedIntegerValue");

          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __groupFlagChangesByChange_block_invoke;
          v40[3] = &unk_1E949DA20;
          v40[4] = v10;
          v13 = objc_msgSend(v6, "indexOfObjectPassingTest:", v40);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v14 = (void *)MEMORY[0x1E0D1EF38];
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "second");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "pairWithFirst:second:", v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v17);

          }
          else
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "first");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addIndex:", v12);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v7);
    }

    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          v23 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v22, "first");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "first");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __62__EDMessageChangeManager_reflectSortedFlagChanges_mailboxURL___block_invoke;
          v34[3] = &unk_1E949D810;
          v27 = v25;
          v35 = v27;
          objc_msgSend(v26, "enumerateIndexesUsingBlock:", v34);

          objc_msgSend(v22, "second");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDMessageChangeManager reflectFlagChanges:forMessagesWithRemoteIDs:mailboxURL:](self, "reflectFlagChanges:forMessagesWithRemoteIDs:mailboxURL:", v28, v27, v33);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v19);
    }

  }
}

void __62__EDMessageChangeManager_reflectSortedFlagChanges_mailboxURL___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (void)reflectAddedLabels:(id)a3 removedLabels:(id)a4 forMessagesWithRemoteIDs:(id)a5 mailboxURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  EDPersistenceDatabaseGenerationWindow *v13;
  void *v14;
  void *v15;
  void *v16;
  EDPersistenceDatabaseGenerationWindow *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  EDPersistenceDatabaseGenerationWindow *v26;
  EDMessageChangeManager *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v24 = a5;
  v12 = a6;
  v13 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager hookResponder](self, "hookResponder", v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistenceWillBeginUpdates");

  LOBYTE(a5) = -[EDMessageChangeManager _needToStoreServerMessagesForMailboxURL:](self, "_needToStoreServerMessagesForMailboxURL:", v12);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__14;
  v38 = __Block_byref_object_dispose__14;
  v39 = 0;
  -[EDMessageChangeManager database](self, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager reflectAddedLabels:removedLabels:forMessagesWithRemoteIDs:mailboxURL:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __95__EDMessageChangeManager_reflectAddedLabels_removedLabels_forMessagesWithRemoteIDs_mailboxURL___block_invoke;
  v25[3] = &unk_1E949D838;
  v17 = v13;
  v33 = (char)a5;
  v26 = v17;
  v27 = self;
  v18 = v12;
  v28 = v18;
  v19 = v10;
  v29 = v19;
  v20 = v11;
  v30 = v20;
  v21 = v24;
  v31 = v21;
  v32 = &v34;
  objc_msgSend(v15, "__performWriteWithCaller:usingBlock:", v16, v25);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "persistenceDidAddLabels:removeLabels:messages:generationWindow:", v19, v20, v35[5], v17);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "persistenceDidFinishUpdates");

  _Block_object_dispose(&v34, 8);
}

uint64_t __95__EDMessageChangeManager_reflectAddedLabels_removedLabels_forMessagesWithRemoteIDs_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "serverMessagePersistenceFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverMessagePersistenceForMailboxURL:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addLabels:removeLabels:toMessagesWithRemoteIDs:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  objc_msgSend(*(id *)(a1 + 40), "messagesForRemoteIDs:mailboxURL:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "addLabels:removeLabels:toMessagesInDatabase:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  return 1;
}

- (BOOL)persistResults:(id)a3 forAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceWillBeginUpdates");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EDMessageChangeManager _persistResults:forFlagChangeAction:](self, "_persistResults:forFlagChangeAction:", v6, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_10:
          -[EDMessageChangeManager localActionPersistence](self, "localActionPersistence");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "persistentID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeMessageAction:", objc_msgSend(v13, "databaseID"));

          v9 = 0;
        }
        else
        {
          -[EDMessageChangeManager localActionPersistence](self, "localActionPersistence");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "updateTransferUndownloadedMessageAction:withResults:", v7, v6);
        }

        goto LABEL_8;
      }
      -[EDMessageChangeManager _persistResults:forLabelChangeAction:](self, "_persistResults:forLabelChangeAction:", v6, v7);
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v9 = -[EDMessageChangeManager _persistResults:forTransferAction:](self, "_persistResults:forTransferAction:", v6, v7);
LABEL_8:
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistenceDidFinishUpdates");

  return v9;
}

- (void)deleteLocalMessageActionsWithIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistenceWillBeginUpdates");

  -[EDMessageChangeManager localActionPersistence](self, "localActionPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeMessageActions:", v7);

  -[EDMessageChangeManager hookResponder](self, "hookResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistenceDidFinishUpdates");

}

- (BOOL)_persistResults:(id)a3 forLabelChangeAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  EDMessageChangeManager *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "remoteIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v7, "messages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "remoteID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
          objc_msgSend(v10, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  -[EDMessageChangeManager database](self, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager _persistResults:forLabelChangeAction:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__EDMessageChangeManager__persistResults_forLabelChangeAction___block_invoke;
  v22[3] = &unk_1E949D860;
  v18 = v6;
  v23 = v18;
  v24 = self;
  v19 = v7;
  v25 = v19;
  v20 = v10;
  v26 = v20;
  objc_msgSend(v16, "__performWriteWithCaller:usingBlock:", v17, v22);

  return 0;
}

uint64_t __63__EDMessageChangeManager__persistResults_forLabelChangeAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "mailboxURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs:mailboxURL:", v4, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "serverMessagePersistenceFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "mailboxURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverMessagePersistenceForMailboxURL:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "labelsToAdd");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "labelsToRemove");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addLabels:removeLabels:toMessagesWithRemoteIDs:", v8, v9, *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 40), "localActionPersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "persistentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeMessageAction:", objc_msgSend(v11, "databaseID"));

  return 1;
}

- (void)_resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id obj;
  id v24;
  EDMessageChangeManager *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = a4;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = self;
  -[EDMessageChangeManager serverMessagePersistenceFactory](self, "serverMessagePersistenceFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverMessagePersistenceForMailboxURL:", v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v7;
  objc_msgSend(v7, "serverMessagesForRemoteIDs:", v21);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "messagePersistentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDMessageChangeManager messageForDatabaseID:](v25, "messageForDatabaseID:", objc_msgSend(v12, "longLongValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "labels");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "labels");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "minusSet:", v14);
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "minusSet:", v15);
          v31[0] = MEMORY[0x1E0C9AAB0];
          v31[1] = MEMORY[0x1E0C9AAA0];
          v32[0] = v16;
          v32[1] = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v19 = (void *)objc_opt_new();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, v18);
          }
          objc_msgSend(v19, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v8);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __93__EDMessageChangeManager__resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs_mailboxURL___block_invoke;
  v26[3] = &unk_1E949D888;
  v26[4] = v25;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v26);

}

void __93__EDMessageChangeManager__resetLocalLabelsToServerLabelsForMessagesWithRemoteIDs_mailboxURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v10, "objectForKeyedSubscript:", MEMORY[0x1E0C9AAB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", MEMORY[0x1E0C9AAA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "addLabels:removeLabels:toMessagesInDatabase:", v7, v8, v5);

}

- (BOOL)_persistResults:(id)a3 forFlagChangeAction:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  EDMessageChangeManager *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[EDMessageChangeManager _persistFlagChangeResults:forFlagChangeAction:](self, "_persistFlagChangeResults:forFlagChangeAction:", v6, v7);
  }
  else
  {
    objc_msgSend(v7, "remoteIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v7, "messages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v16, "remoteID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (v18)
          {
            objc_msgSend(v16, "remoteID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);

          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }

    -[EDMessageChangeManager database](self, "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager _persistResults:forFlagChangeAction:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__EDMessageChangeManager__persistResults_forFlagChangeAction___block_invoke;
    v25[3] = &unk_1E949D860;
    v26 = v24;
    v27 = self;
    v28 = v7;
    v22 = v11;
    v29 = v22;
    objc_msgSend(v20, "__performWriteWithCaller:usingBlock:", v21, v25);

    v8 = 0;
  }

  return v8;
}

uint64_t __62__EDMessageChangeManager__persistResults_forFlagChangeAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "mailboxURL");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:mailboxURL:", v4, v5);
    v6 = (void *)v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "serverMessagePersistenceFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "mailboxURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverMessagePersistenceForMailboxURL:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "flagChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyFlagChange:toMessagesWithRemoteIDs:", v9, *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 40), "localActionPersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "persistentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeMessageAction:", objc_msgSend(v11, "databaseID"));

  return 1;
}

- (BOOL)_persistFlagChangeResults:(id)a3 forFlagChangeAction:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  int v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  int v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  EDMessageChangeManager *v67;
  id v68;
  void *v69;
  id v70;
  _QWORD v71[5];
  _QWORD v72[4];
  id v73;
  EDMessageChangeManager *v74;
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t v89[128];
  uint8_t buf[4];
  _BYTE v91[10];
  uint8_t v92[4];
  uint64_t v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v64 = a4;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v64, "remoteIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v86 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        v11 = uidFromString(v10);
        if (v11 - 1 > 0xFFFFFFFD)
        {
          +[EDMessageChangeManager log](EDMessageChangeManager, "log");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v91 = v10;
            _os_log_error_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_ERROR, "Invalid UID (%{public}@) in flag change action.", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v5, "addIndex:", v11);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    }
    while (v7);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v64, "messages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v82 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
        objc_msgSend(v17, "remoteID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = uidFromString(v18);

        if (v19 - 1 > 0xFFFFFFFD)
        {
          +[EDMessageChangeManager log](EDMessageChangeManager, "log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v17, "remoteID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[EDMessageChangeManager _persistFlagChangeResults:forFlagChangeAction:].cold.1(v21, v92, &v93, v20);
          }

        }
        else
        {
          objc_msgSend(v5, "addIndex:", v19);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
    }
    while (v14);
  }

  v22 = objc_msgSend(v5, "count");
  objc_msgSend(v64, "remoteIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 == objc_msgSend(v23, "count");

  if (!v24)
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v57 = objc_msgSend(v5, "count");
      objc_msgSend(v64, "remoteIDs");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "count");
      objc_msgSend(v64, "remoteIDs");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v91 = v57 - v59;
      *(_WORD *)&v91[4] = 1024;
      *(_DWORD *)&v91[6] = v61;
      _os_log_error_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_ERROR, "%d of %d UIDs in flag change action were invalid.", buf, 0xEu);

    }
  }
  objc_msgSend(v63, "completedUIDs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToIndexSet:", v5);

  if (v27)
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v91 = v29;
      _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_INFO, "All %d UIDs in flag change action were completed.", buf, 8u);
    }

    objc_msgSend(v64, "remoteIDs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "mutableCopy");

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    objc_msgSend(v64, "messages");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v78 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
          objc_msgSend(v37, "remoteID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "length");

          if (v39)
          {
            objc_msgSend(v37, "remoteID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v40);

          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      }
      while (v34);
    }

    -[EDMessageChangeManager database](self, "database");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager _persistFlagChangeResults:forFlagChangeAction:]");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke;
    v72[3] = &unk_1E949D860;
    v73 = v63;
    v74 = self;
    v75 = v64;
    v76 = v32;
    objc_msgSend(v41, "__performWriteWithCaller:usingBlock:", v42, v72);

  }
  else
  {
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v63, "completedUIDs");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");
      v46 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v91 = v45;
      *(_WORD *)&v91[4] = 1024;
      *(_DWORD *)&v91[6] = v46;
      _os_log_impl(&dword_1D2F2C000, v43, OS_LOG_TYPE_INFO, "%d of %d UIDs in flag change action were completed.", buf, 0xEu);

    }
    v47 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v63, "completedUIDs");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "arrayWithCapacity:", objc_msgSend(v48, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v63, "completedUIDs");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = MEMORY[0x1E0C809B0];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke_124;
    v71[3] = &unk_1E949D810;
    v71[4] = v32;
    objc_msgSend(v49, "enumerateIndexesUsingBlock:", v71);

    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", v5);
    objc_msgSend(v63, "completedUIDs");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "removeIndexes:", v52);

    -[EDMessageChangeManager database](self, "database");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager _persistFlagChangeResults:forFlagChangeAction:]");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v50;
    v65[1] = 3221225472;
    v65[2] = __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke_2;
    v65[3] = &unk_1E949D798;
    v66 = v63;
    v67 = self;
    v68 = v64;
    v69 = v32;
    v55 = v51;
    v70 = v55;
    objc_msgSend(v53, "__performWriteWithCaller:usingBlock:", v54, v65);

  }
  return 0;
}

uint64_t __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "mailboxURL");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:mailboxURL:", v4, v5);
    v6 = (void *)v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "serverMessagePersistenceFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "mailboxURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverMessagePersistenceForMailboxURL:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "flagChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyFlagChange:toMessagesWithRemoteIDs:", v9, *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 40), "localActionPersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "persistentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeMessageAction:", objc_msgSend(v11, "databaseID"));

  return 1;
}

void __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke_124(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

uint64_t __72__EDMessageChangeManager__persistFlagChangeResults_forFlagChangeAction___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "mailboxURL");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:mailboxURL:", v4, v5);
    v6 = (void *)v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "serverMessagePersistenceFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "mailboxURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverMessagePersistenceForMailboxURL:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "flagChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyFlagChange:toMessagesWithRemoteIDs:", v9, *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 40), "localActionPersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateFlagChangeAction:withRemainingUIDs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

  return 1;
}

- (void)_clearFollowUpsFromThreadsForMessages:(id)a3
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *context;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  void *v39;
  id obj;
  id obja;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  if (objc_msgSend(v37, "count"))
  {
    context = (void *)MEMORY[0x1D824B334]();
    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v53 = objc_msgSend(v37, "count");
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Starting to clear follow-ups from threads of %lu incoming messages.", buf, 0xCu);
    }

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v37;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v47 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "conversationID"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10
            || (objc_msgSend(v8, "dateReceived"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = objc_msgSend(v10, "ef_isEarlierThanDate:", v11),
                v11,
                v12))
          {
            objc_msgSend(v8, "dateReceived");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "conversationID"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v5);
    }

    objc_msgSend(v4, "allKeys");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(obj, "ef_map:", &__block_literal_global_130);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v15, "initWithArray:", v16);

    -[EDMessageChangeManager messagePersistence](self, "messagePersistence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "persistedMessageIDsForMessagesWithFollowUpsForConversationIDs:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessageChangeManager messagePersistence](self, "messagePersistence");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v35, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obja = v33;
    v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(obja);
          v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v22, "dateReceived");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v22, "conversationID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v23, "ef_isEarlierThanDate:", v25);

          if (v26)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v22, "globalMessageID"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v39, "containsObject:", v27);

            if ((v28 & 1) == 0)
              objc_msgSend(v38, "addObject:", v22);
          }
        }
        v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v19);
    }

    -[EDMessageChangeManager messagePersistence](self, "messagePersistence");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "persistFollowUp:forMessages:", 0, v38);

    +[EDMessageChangeManager log](EDMessageChangeManager, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v38, "count");
      *(_DWORD *)buf = 134217984;
      v53 = v31;
      _os_log_impl(&dword_1D2F2C000, v30, OS_LOG_TYPE_DEFAULT, "Finished clearing %lu follow-ups.", buf, 0xCu);
    }

    objc_autoreleasePoolPop(context);
  }

}

id __64__EDMessageChangeManager__clearFollowUpsFromThreadsForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs:(id)a3 mailboxURL:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[EDMessageChangeManager serverMessagePersistenceFactory](self, "serverMessagePersistenceFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverMessagePersistenceForMailboxURL:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v7;
  objc_msgSend(v7, "serverMessagesForRemoteIDs:", v20);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "messagePersistentID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDMessageChangeManager messageForDatabaseID:](self, "messageForDatabaseID:", objc_msgSend(v13, "longLongValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "flags");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "serverFlags");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isEqual:", v16) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0D1E778], "changeFrom:to:", v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
            {
              v18 = (void *)objc_opt_new();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, v17);
            }
            objc_msgSend(v18, "addObject:", v14);

          }
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__EDMessageChangeManager__resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs_mailboxURL___block_invoke;
  v23[3] = &unk_1E949D8D0;
  v23[4] = self;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v23);

}

id __91__EDMessageChangeManager__resetLocalFlagsToServerFlagsForMessagesWithRemoteIDs_mailboxURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "applyFlagChange:toMessagesInDatabase:", a2, a3);
}

- (BOOL)_persistResults:(id)a3 forTransferAction:(id)a4
{
  id v6;
  id v7;
  EDPersistenceDatabaseGenerationWindow *v8;
  void *v9;
  void *v10;
  EDPersistenceDatabaseGenerationWindow *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  EDPersistenceDatabaseGenerationWindow *v21;
  id v22;
  EDMessageChangeManager *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v6 = a3;
  v7 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v8 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDMessageChangeManager database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDMessageChangeManager _persistResults:forTransferAction:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke;
  v20 = &unk_1E949C980;
  v11 = v8;
  v21 = v11;
  v12 = v6;
  v22 = v12;
  v23 = self;
  v13 = v7;
  v24 = v13;
  v25 = &v31;
  v26 = &v27;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, &v17);

  objc_msgSend(v12, "error", v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[EDMessageChangeManager displayErrorForTransferAction:withResults:](self, "displayErrorForTransferAction:withResults:", v13, v12);
  if (*((_BYTE *)v28 + 24))
  {
    *((_BYTE *)v32 + 24) = 0;
    -[EDMessageChangeManager actionHasChangedAccount:](self, "actionHasChangedAccount:", v13);
  }
  v15 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

uint64_t __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(*(id *)(a1 + 40), "failedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "phaseForResults") == 3
      || objc_msgSend(*(id *)(a1 + 40), "phaseForResults") == 4)
    {
      v6 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "failedItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_handleFailedCopyItems:transferAction:generationWindow:", v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
LABEL_5:

      goto LABEL_6;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "phaseForResults") == 1)
    {
      v30 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "failedItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_handleFailedDownload:generationWindow:", v7, *(_QWORD *)(a1 + 32));
      goto LABEL_5;
    }
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "completedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "phaseForResults");
    v11 = *(void **)(a1 + 40);
    if (v10 == 1)
    {
      objc_msgSend(v11, "downloadedDataByCopyItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke_2;
      v68[3] = &unk_1E949D8F8;
      v68[4] = *(_QWORD *)(a1 + 48);
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v68);

    }
    else if (objc_msgSend(v11, "phaseForResults") == 3)
    {
      objc_msgSend(*(id *)(a1 + 56), "mailboxURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "destinationMailboxURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "completedItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v65 != v18)
                objc_enumerationMutation(v16);
              v20 = *(void **)(a1 + 48);
              objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "destinationMessage");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "messageWasAppended:", v21);

            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
          }
          while (v17);
        }

      }
      v22 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "destinationMailboxURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = objc_msgSend(v22, "_needToStoreServerMessagesForMailboxURL:", v23);

      if ((_DWORD)v22)
      {
        v24 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "createdServerMessages");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "destinationMailboxURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_storeServerMessages:mailboxURL:generationWindow:", v25, v26, *(_QWORD *)(a1 + 32));

        v27 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "completedItems");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "createdServerMessages");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_deleteDestinationMessagesFromCompletedItems:notInServerMessages:", v28, v29);

      }
      else
      {
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "createdServerMessages");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v44; ++j)
            {
              if (*(_QWORD *)v61 != v45)
                objc_enumerationMutation(v43);
              v47 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
              v48 = *(void **)(a1 + 48);
              objc_msgSend(v47, "remoteID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "messagePersistentID");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setRemoteID:onMessageWithDatabaseID:", v49, objc_msgSend(v50, "longLongValue"));

            }
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          }
          while (v44);
        }

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "phaseForResults") == 4)
    {
      v31 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "sourceMailboxURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = objc_msgSend(v31, "_needToStoreServerMessagesForMailboxURL:", v32);

      if ((_DWORD)v31)
      {
        v33 = (void *)objc_opt_new();
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "completedItems", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v57;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v57 != v36)
                objc_enumerationMutation(v34);
              objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "sourceRemoteID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
                objc_msgSend(v33, "addObject:", v38);

            }
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
          }
          while (v35);
        }

        objc_msgSend(*(id *)(a1 + 48), "serverMessagePersistenceFactory");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "mailboxURL");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "serverMessagePersistenceForMailboxURL:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E778]), "initWithBuilder:", &__block_literal_global_134);
        objc_msgSend(v41, "applyFlagChange:toMessagesWithRemoteIDs:", v42, v33);

      }
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "mailboxURL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "localActionPersistence");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v52, "updateTransferAction:withResults:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v53 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "mailboxURL");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v53, "mailboxURL:isInSameAccountAsMailboxURL:", v54, v51) ^ 1;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }

  return 1;
}

void __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "destinationMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setData:onMessage:", v6, v5);

}

uint64_t __60__EDMessageChangeManager__persistResults_forTransferAction___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changesDeletedTo:", 1);
}

- (void)_handleFailedDownload:(id)a3 generationWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
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
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_opt_new();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "destinationMessage", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v8, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[EDMessageChangeManager deletePersistedMessages:](self, "deletePersistedMessages:", v8);
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "persistenceDidDeleteMessages:generationWindow:", v8, v7);

  }
}

- (void)_handleFailedCopyItems:(id)a3 transferAction:(id)a4 generationWindow:(id)a5
{
  id v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  EDMessageChangeManager *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  v27 = a5;
  v28 = v7;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v30, "sourceMailboxURL");
    v8 = objc_claimAutoreleasedReturnValue();
    v25 = v8;
    if (v8)
      v9 = !-[EDMessageChangeManager mailboxURLIsInRemoteAccount:](self, "mailboxURLIsInRemoteAccount:", v8, v8);
    else
      v9 = 0;
    v31 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((v9 & 1) == 0)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "sourceRemoteID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {

            }
            else
            {
              objc_msgSend(v15, "sourceMessage");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "remoteID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "length") == 0;

              if (v19)
                continue;
            }
          }
          objc_msgSend(v15, "destinationMessage", v25);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v31, "addObject:", v20);
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v20);
          }

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v30, "transferType") == 1 && objc_msgSend(v31, "count"))
    {
      v21 = (void *)objc_opt_new();
      objc_msgSend(v30, "sourceMailboxURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[EDMessageChangeManager persistNewMessages:mailboxURL:oldMessagesByNewMessage:fromSyncing:](self, "persistNewMessages:mailboxURL:oldMessagesByNewMessage:fromSyncing:", v31, v22, v21, 0);

      if (((v23 ^ 1 | v9) & 1) == 0)
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __81__EDMessageChangeManager__handleFailedCopyItems_transferAction_generationWindow___block_invoke;
        v32[3] = &unk_1E949D658;
        v33 = v10;
        v34 = self;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v32);

      }
    }
    -[EDMessageChangeManager deletePersistedMessages:](self, "deletePersistedMessages:", v31, v25);
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "persistenceDidDeleteMessages:generationWindow:", v31, v27);

  }
}

void __81__EDMessageChangeManager__handleFailedCopyItems_transferAction_generationWindow___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceRemoteID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "persistentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  objc_msgSend(*(id *)(a1 + 40), "setRemoteID:onMessageWithDatabaseID:", v6, v8);
  objc_msgSend(v15, "mailbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "_needToStoreServerMessagesForMailboxURL:", v10))
  {
    objc_msgSend(*(id *)(a1 + 40), "serverMessagePersistenceFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mailbox");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverMessagePersistenceForMailboxURL:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "attachMessage:toServerMessageWithRemoteID:", v8, v6);
  }

}

- (void)_storeServerMessages:(id)a3 mailboxURL:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  __int16 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27 = a5;
  v28 = v9;
  -[EDMessageChangeManager serverMessagePersistenceFactory](self, "serverMessagePersistenceFactory", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverMessagePersistenceForMailboxURL:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v11)
  {
    v31 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v38 = 0;
        objc_msgSend(v32, "addServerMessage:invalidMessage:duplicateRemoteID:", v13, (char *)&v38 + 1, &v38);
        if ((_BYTE)v38)
        {
          -[EDMessageChangeManager _handleDuplicateServerMessage:serverMessagePersistence:](self, "_handleDuplicateServerMessage:serverMessagePersistence:", v13, v32);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v29, "addObject:", v14);

        }
        else if (HIBYTE(v38))
        {
          v15 = objc_alloc(MEMORY[0x1E0D1E798]);
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke;
          v37[3] = &unk_1E949D940;
          v37[4] = v13;
          v16 = (void *)objc_msgSend(v15, "initWithServerMessageBuilder:", v37);
          objc_msgSend(v32, "addServerMessage:invalidMessage:duplicateRemoteID:", v16, 0, 0);
          v17 = objc_alloc(MEMORY[0x1E0D1E7D0]);
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke_2;
          v36[3] = &unk_1E949D3E0;
          v36[4] = v13;
          v18 = (void *)objc_msgSend(v17, "initWithBuilder:", v36);
          v19 = objc_alloc(MEMORY[0x1E0D1E7C8]);
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke_3;
          v33[3] = &unk_1E949D968;
          v20 = v18;
          v34 = v20;
          v21 = v28;
          v35 = v21;
          v22 = (void *)objc_msgSend(v19, "initWithBuilder:", v33);
          -[EDMessageChangeManager localActionPersistence](self, "localActionPersistence");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "persistTransferAction:", v22);

          -[EDMessageChangeManager checkForNewActionsInMailboxID:](self, "checkForNewActionsInMailboxID:", -[EDMessageChangeManager mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v21));
        }
        objc_msgSend(v13, "remoteID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "messagePersistentID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDMessageChangeManager setRemoteID:onMessageWithDatabaseID:](self, "setRemoteID:onMessageWithDatabaseID:", v24, objc_msgSend(v25, "longLongValue"));

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v29, "count"))
  {
    -[EDMessageChangeManager deletePersistedMessages:](self, "deletePersistedMessages:", v29);
    -[EDMessageChangeManager hookResponder](self, "hookResponder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "persistenceDidDeleteMessages:generationWindow:", v29, v27);

  }
}

void __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "remoteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "serverFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServerFlags:", v4);

}

void __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "remoteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceRemoteID:", v3);

}

void __75__EDMessageChangeManager__storeServerMessages_mailboxURL_generationWindow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItemsToDelete:", v4);

  objc_msgSend(v3, "setSourceMailboxURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setMailboxURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setUserInitiated:", 0);
  objc_msgSend(v3, "setTransferType:", 3);

}

- (void)_deleteDestinationMessagesFromCompletedItems:(id)a3 notInServerMessages:(id)a4
{
  void *v5;
  id v6;

  -[EDMessageChangeManager _findDestinationMessagesFromCompletedItems:notInServerMessages:](self, "_findDestinationMessagesFromCompletedItems:notInServerMessages:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_filter:", &__block_literal_global_354);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageChangeManager deletePersistedMessages:](self, "deletePersistedMessages:", v5);

}

- (id)_findDestinationMessagesFromCompletedItems:(id)a3 notInServerMessages:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = a4;
  if (v16)
  {
    objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_137);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v16;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "messagePersistentID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __89__EDMessageChangeManager__findDestinationMessagesFromCompletedItems_notInServerMessages___block_invoke_2;
            v17[3] = &unk_1E949D9D0;
            v18 = v12;
            v14 = objc_msgSend(v7, "indexOfObjectPassingTest:", v17);
            if (v14 != 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v7, "removeObjectAtIndex:", v14);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

id __89__EDMessageChangeManager__findDestinationMessagesFromCompletedItems_notInServerMessages___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "destinationMessage");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __89__EDMessageChangeManager__findDestinationMessagesFromCompletedItems_notInServerMessages___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_handleDuplicateServerMessage:(id)a3 serverMessagePersistence:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "remoteID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverMessagesForRemoteIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "messagePersistentID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "messagePersistentID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageChangeManager messageForDatabaseID:](self, "messageForDatabaseID:", objc_msgSend(v13, "longLongValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v6, "messagePersistentID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longLongValue");
  objc_msgSend(v11, "remoteID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachMessage:toServerMessageWithRemoteID:", v16, v17);

  return v14;
}

- (BOOL)mailboxURLIsInRemoteAccount:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "ef_hasScheme:", *MEMORY[0x1E0D1DB68]) & 1) != 0
      || (objc_msgSend(v4, "ef_hasScheme:", *MEMORY[0x1E0D1DB60]) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v4, "ef_hasScheme:", *MEMORY[0x1E0D1DB58]);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_needToStoreServerMessagesForMailboxURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "ef_hasScheme:", *MEMORY[0x1E0D1DB68]);
  else
    v5 = 0;

  return v5;
}

- (BOOL)mailboxURL:(id)a3 isInSameAccountAsMailboxURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  return v8;
}

- (id)accountForMailboxURL:(id)a3
{
  id v5;

  v5 = a3;
  -[EDMessageChangeManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDMessageChangeManager accountForMailboxURL:]", "EDMessageChangeManager.m", 1694, "0");
}

- (void)remindMeCloudStorageChangedWithAddedOrChangedItems:(id)a3 deletedItems:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = a4;
  EDRemindMeLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v6;
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Processing remote changes for changed items: %{public}@ deleted items: %{public}@", buf, 0x16u);
  }

  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v15;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__EDMessageChangeManager_remindMeCloudStorageChangedWithAddedOrChangedItems_deletedItems___block_invoke;
  v16[3] = &unk_1E949D9F8;
  v16[4] = self;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);

}

void __90__EDMessageChangeManager_remindMeCloudStorageChangedWithAddedOrChangedItems_deletedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v25 = v5;
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "globalIDForMessageIDHash:", v5);

  v9 = objc_alloc(MEMORY[0x1E0D1E258]);
  objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithGlobalMessageID:mailboxScope:", v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistedMessagesForObjectIDs:requireProtectedData:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "readLater");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "date");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *MEMORY[0x1E0D1ED90];
    if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D1ED90] + 16))(*MEMORY[0x1E0D1ED90], v6) & 1) != 0)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(v6, "readLaterDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (((*(uint64_t (**)(uint64_t, id))(v20 + 16))(v20, v6) & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(v6, "displayDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((EFObjectsAreEqual() & 1) == 0)
    {
      EDRemindMeLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219010;
        v27 = v8;
        v28 = 2114;
        v29 = v21;
        v30 = 2114;
        v31 = v17;
        v32 = 2114;
        v33 = v22;
        v34 = 2114;
        v35 = v19;
        _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "Applying new read later date due to remote change for messages with global message id: %lld, new read later date: %{public}@, old read later date: %{public}@, new display date: %{public}@, old display date: %{public}@", buf, 0x34u);
      }

      if (objc_msgSend(v22, "isEqualToDate:", v19))
      {

        v22 = 0;
      }
      v24 = (id)objc_msgSend(*(id *)(a1 + 32), "_applyReadLaterDate:displayDate:toMessages:changeIsRemote:", v21, v22, v14, 1);
    }

  }
  else
  {
    EDRemindMeLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "No persisted messages found for remote changes.", buf, 2u);
    }
  }

}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDReadLaterPersistence)readLaterPersistence
{
  return self->_readLaterPersistence;
}

- (EDServerMessagePersistenceFactory)serverMessagePersistenceFactory
{
  return self->_serverMessagePersistenceFactory;
}

- (EDBIMIManager)bimiManager
{
  return self->_bimiManager;
}

- (OS_dispatch_queue)markAllWorkQueue
{
  return self->_markAllWorkQueue;
}

- (void)setMarkAllWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_markAllWorkQueue, a3);
}

- (EDBiomeBlackPearlLogger)biomeCollector
{
  return self->_biomeCollector;
}

- (void)setBiomeCollector:(id)a3
{
  objc_storeStrong((id *)&self->_biomeCollector, a3);
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDMessageChangeHookResponder)hookResponder
{
  return (EDMessageChangeHookResponder *)objc_loadWeakRetained((id *)&self->_hookResponder);
}

- (EDLocalActionPersistence)localActionPersistence
{
  return self->_localActionPersistence;
}

- (EDMessageAuthenticator)messageAuthenticator
{
  return (EDMessageAuthenticator *)objc_loadWeakRetained((id *)&self->_messageAuthenticator);
}

- (void)setMessageAuthenticator:(id)a3
{
  objc_storeWeak((id *)&self->_messageAuthenticator, a3);
}

- (EDMessageCategorizer)messageCategorizer
{
  return (EDMessageCategorizer *)objc_loadWeakRetained((id *)&self->_messageCategorizer);
}

- (void)setMessageCategorizer:(id)a3
{
  objc_storeWeak((id *)&self->_messageCategorizer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageCategorizer);
  objc_destroyWeak((id *)&self->_messageAuthenticator);
  objc_storeStrong((id *)&self->_localActionPersistence, 0);
  objc_destroyWeak((id *)&self->_hookResponder);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_biomeCollector, 0);
  objc_storeStrong((id *)&self->_markAllWorkQueue, 0);
  objc_storeStrong((id *)&self->_bimiManager, 0);
  objc_storeStrong((id *)&self->_serverMessagePersistenceFactory, 0);
  objc_storeStrong((id *)&self->_readLaterPersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)applyFlagChange:(NSObject *)a3 toMessages:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a3, (uint64_t)a3, "Warning, only changing flags on %lu of %lu messages as some messages were missing mailbox URLs", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __53__EDMessageChangeManager_applyFlagChange_toMessages___block_invoke_2_75_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a4, a3, "Warning, only converted %lu of %lu to persisted messages", (uint8_t *)a1);
}

void __86__EDMessageChangeManager_applyFollowUp_toMessages_withNegativeFeedbackForSuggestions___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "ERROR calling the follow up feedback SPI from Suggestions: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)_truncateReadLaterDate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "Skip truncation. truncatedDate:%{public}@ readLaterDate:%{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_persistFlagChangeResults:(_QWORD *)a3 forFlagChangeAction:(NSObject *)a4 .cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a4, (uint64_t)a3, "Message’s UID (%{public}@) is invalid in flag change action.", a2);

}

@end
