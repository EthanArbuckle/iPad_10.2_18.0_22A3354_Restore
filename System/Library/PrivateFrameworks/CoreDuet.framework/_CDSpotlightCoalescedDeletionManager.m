@implementation _CDSpotlightCoalescedDeletionManager

- (_CDSpotlightCoalescedDeletionManager)initWithKnowledgeStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _CDSpotlightCoalescedDeletionManager *v7;

  v4 = a3;
  +[_CDPaths systemCachesDirectory](_CDPaths, "systemCachesDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("_CDSpotlightCoalescedDeletionManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_CDSpotlightCoalescedDeletionManager initWithKnowledgeStore:persistencePath:delay:](self, "initWithKnowledgeStore:persistencePath:delay:", v4, v6, 5.0);
  return v7;
}

- (_CDSpotlightCoalescedDeletionManager)initWithKnowledgeStore:(id)a3 persistencePath:(id)a4 delay:(double)a5
{
  id v9;
  id v10;
  _CDSpotlightCoalescedDeletionManager *v11;
  _CDSpotlightCoalescedDeletionManager *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *deletionCoalescingQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_CDSpotlightCoalescedDeletionManager;
  v11 = -[_CDSpotlightCoalescedDeletionManager init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_delay = a5;
    objc_storeStrong((id *)&v11->_persistencePath, a4);
    objc_storeStrong((id *)&v12->_knowledgeStore, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("deletionCoalesingQueue", v13);
    deletionCoalescingQueue = v12->_deletionCoalescingQueue;
    v12->_deletionCoalescingQueue = (OS_dispatch_queue *)v14;

  }
  -[_CDSpotlightCoalescedDeletionManager setupCoalescingTimer](v12, "setupCoalescingTimer");

  return v12;
}

- (void)setupCoalescingTimer
{
  void *v3;
  _CDPersistedCoalescingTimer *v4;
  _CDPersistedCoalescingTimer *deletionCoalescingTimer;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_9;
  v6[3] = &unk_1E26E6AD0;
  v6[4] = self;
  v3 = (void *)MEMORY[0x193FEEAF4](v6, a2);
  v4 = -[_CDPersistedCoalescingTimer initWithDelay:coalesceData:operation:persistencePath:dataClass:timerName:]([_CDPersistedCoalescingTimer alloc], "initWithDelay:coalesceData:operation:persistencePath:dataClass:timerName:", &__block_literal_global_74, v3, self->_persistencePath, objc_opt_class(), CFSTR("_CDPersistedCoalescingTimer"), self->_delay);
  deletionCoalescingTimer = self->_deletionCoalescingTimer;
  self->_deletionCoalescingTimer = v4;

}

- (void)deleteKnowledgeEventsMatchingPredicate:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, BOOL, id);
  _DKKnowledgeEventStreamDeleting *knowledgeStore;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, BOOL, id))a4;
  knowledgeStore = self->_knowledgeStore;
  v16 = 0;
  v8 = -[_DKKnowledgeEventStreamDeleting deleteAllEventsMatchingPredicate:error:](knowledgeStore, "deleteAllEventsMatchingPredicate:error:", a3, &v16);
  v9 = v16;
  if (v9)
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_CDSpotlightCoalescedDeletionManager deleteKnowledgeEventsMatchingPredicate:withCompletion:].cold.1((uint64_t)v9, v10);
  }
  else
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v8)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_DWORD *)buf = 134217984;
      v18 = v8;
      v12 = "_CDSpotlightCoalescedDeletionManager Successfully deleted %tu knowledge events.";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v12 = "_CDSpotlightCoalescedDeletionManager No knowledge events were deleted because none of them matched the coale"
            "sced deletion operations.";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
      v15 = 2;
    }
    _os_log_impl(&dword_18DDBE000, v13, v14, v12, buf, v15);
  }
LABEL_10:

  if (v6)
    v6[2](v6, v9 == 0, v9);

}

- (void)processDeletionForOperation:(id)a3
{
  -[_CDPersistedCoalescingTimer processData:](self->_deletionCoalescingTimer, "processData:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_deletionCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
  objc_storeStrong((id *)&self->_deletionCoalescingQueue, 0);
}

- (void)deleteKnowledgeEventsMatchingPredicate:(uint64_t)a1 withCompletion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "_CDSpotlightCoalescedDeletionManager Failed to delete knowledge events. Error = %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end
