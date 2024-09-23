@implementation _DKKnowledgeStore

- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  -[_DKKnowledgeStore saveObjects:tracker:responseQueue:withCompletion:](self, "saveObjects:tracker:responseQueue:withCompletion:", a3, 0, a4, a5);
}

- (id)executeQuery:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  void *v9;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: executeQuery sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  os_activity_scope_leave(&v11);

  if (self)
    knowledgeStoreHandle = self->_knowledgeStoreHandle;
  else
    knowledgeStoreHandle = 0;
  -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStoreHandle, "executeQuery:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)userKnowledgeStore
{
  void *v3;
  void *v4;

  +[_DKXPCKnowledgeStore XPCUserKnowledgeStore](_DKXPCKnowledgeStore, "XPCUserKnowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKnowledgeStoreHandle:readOnly:", v3, 0);

  return v4;
}

- (_DKKnowledgeStore)initWithKnowledgeStoreHandle:(id)a3 readOnly:(BOOL)a4
{
  id v7;
  _DKKnowledgeStore *v8;
  uint64_t v9;
  _DKRateLimitPolicyEnforcer *rateLimitEnforcer;
  uint64_t v11;
  _DKPrivacyPolicyEnforcer *privacyEnforcer;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *defaultQueue;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DKKnowledgeStore;
  v8 = -[_DKKnowledgeStore init](&v17, sel_init);
  if (v8)
  {
    if (!a4)
    {
      +[_DKRateLimitPolicyEnforcer rateLimitPolicyEnforcer](_DKRateLimitPolicyEnforcer, "rateLimitPolicyEnforcer");
      v9 = objc_claimAutoreleasedReturnValue();
      rateLimitEnforcer = v8->_rateLimitEnforcer;
      v8->_rateLimitEnforcer = (_DKRateLimitPolicyEnforcer *)v9;

      +[_DKPrivacyPolicyEnforcer privacyPolicyEnforcer](_DKPrivacyPolicyEnforcer, "privacyPolicyEnforcer");
      v11 = objc_claimAutoreleasedReturnValue();
      privacyEnforcer = v8->_privacyEnforcer;
      v8->_privacyEnforcer = (_DKPrivacyPolicyEnforcer *)v11;

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.coreduet.knowledgestore", v13);
    defaultQueue = v8->_defaultQueue;
    v8->_defaultQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v8->_knowledgeStoreHandle, a3);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultQueue, 0);
  objc_storeStrong((id *)&self->_privacyEnforcer, 0);
  objc_storeStrong((id *)&self->_rateLimitEnforcer, 0);
  objc_storeStrong((id *)&self->_knowledgeStoreHandle, 0);
}

- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  OS_dispatch_queue *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  OS_dispatch_queue *defaultQueue;
  OS_dispatch_queue *v19;
  uint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  os_activity_scope_state_s state;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = (OS_dispatch_queue *)a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_18DDBE000, "Duet: saveObjects async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  v15 = (void *)MEMORY[0x193FEE914]();
  -[_DKKnowledgeStore _sanitizeObjectsBeforeSaving:]((id *)&self->super.isa, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {

    objc_autoreleasePoolPop(v15);
    if (self)
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    else
      knowledgeStoreHandle = 0;
    defaultQueue = v12;
    if (!v12)
      defaultQueue = self->_defaultQueue;
    -[_DKKnowledgeQuerying saveObjects:tracker:responseQueue:withCompletion:](knowledgeStoreHandle, "saveObjects:tracker:responseQueue:withCompletion:", v16, v11, defaultQueue, v13);
  }
  else
  {
    if (v13)
    {
      v19 = v12;
      if (!v12)
        v19 = self->_defaultQueue;
      v20 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __70___DKKnowledgeStore_saveObjects_tracker_responseQueue_withCompletion___block_invoke;
      v25[3] = &unk_1E26E3358;
      v26 = v13;
      v21 = v25;
      v22 = v19;
      v23 = (void *)os_transaction_create();
      state.opaque[0] = v20;
      state.opaque[1] = 3221225472;
      v28 = __cd_dispatch_async_capture_tx_block_invoke;
      v29 = &unk_1E26E3380;
      v30 = v23;
      v31 = v21;
      v24 = v23;
      dispatch_async(v22, &state);

    }
    objc_autoreleasePoolPop(v15);

  }
}

- (id)_sanitizeObjectsBeforeSaving:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1[2], "filterObjectsByEnforcingRateLimit:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[3], "enforcePrivacy:", v4);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a1, "count");
    if (v5 != objc_msgSend(v3, "count"))
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = 134218240;
        v10 = objc_msgSend(v3, "count");
        v11 = 2048;
        v12 = objc_msgSend(a1, "count");
        _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "Save of %lu objects filtered/sanitized to %lu objects.", (uint8_t *)&v9, 0x16u);
      }

    }
    if (!objc_msgSend(a1, "count"))
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_INFO, "Early out because no valid objects were provided.", (uint8_t *)&v9, 2u);
      }

    }
  }

  return a1;
}

+ (id)knowledgeStoreWithDirectReadOnlyAccess
{
  void *v3;
  void *v4;
  void *v5;

  +[_DKXPCKnowledgeStore XPCKnowledgeStore](_DKXPCKnowledgeStore, "XPCKnowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDPaths knowledgeDirectory](_CDPaths, "knowledgeDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "knowledgeStoreWithDirectReadOnlyAccessWithXPCStore:storeDirectory:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)knowledgeStoreWithDirectReadOnlyAccessWithXPCStore:(id)a3 storeDirectory:(id)a4
{
  return +[_DKKnowledgeStore _knowledgeStoreWithStoreDirectory:readOnly:]((uint64_t)a1, a4, 1);
}

+ (id)_knowledgeStoreWithStoreDirectory:(uint64_t)a3 readOnly:
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v4 = a2;
  v5 = (objc_class *)objc_opt_self();
  +[_DKKnowledgeStorage storageWithDirectory:readOnly:](_DKKnowledgeStorage, "storageWithDirectory:readOnly:", v4, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend([v5 alloc], "initWithKnowledgeStoreHandle:readOnly:", v6, a3);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[_DKKnowledgeStore _knowledgeStoreWithStoreDirectory:readOnly:].cold.1();
    v7 = 0;
  }

  return v7;
}

+ (id)knowledgeStore
{
  void *v3;
  void *v4;

  +[_DKXPCKnowledgeStore XPCKnowledgeStore](_DKXPCKnowledgeStore, "XPCKnowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKnowledgeStoreHandle:readOnly:", v3, 0);

  return v4;
}

+ (id)userKnowledgeStoreWithDirectReadOnlyAccess
{
  void *v3;
  void *v4;
  void *v5;

  +[_DKXPCKnowledgeStore XPCUserKnowledgeStore](_DKXPCKnowledgeStore, "XPCUserKnowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDPaths userKnowledgeDirectory](_CDPaths, "userKnowledgeDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "knowledgeStoreWithDirectReadOnlyAccessWithXPCStore:storeDirectory:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userKnowledgeStoreWithDirectReadWriteAccess
{
  void *v3;
  void *v4;

  +[_CDPaths userKnowledgeDirectory](_CDPaths, "userKnowledgeDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKKnowledgeStore _knowledgeStoreWithStoreDirectory:readOnly:]((uint64_t)a1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)knowledgeStoreWithDirectReadWriteAccess
{
  void *v3;
  void *v4;

  +[_CDPaths knowledgeDirectory](_CDPaths, "knowledgeDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKKnowledgeStore _knowledgeStoreWithStoreDirectory:readOnly:]((uint64_t)a1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_DKKnowledgeStore)init
{
  void *v3;
  _DKKnowledgeStore *v4;

  +[_DKXPCKnowledgeStore XPCKnowledgeStore](_DKXPCKnowledgeStore, "XPCKnowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DKKnowledgeStore initWithKnowledgeStoreHandle:readOnly:](self, "initWithKnowledgeStoreHandle:readOnly:", v3, 0);

  return v4;
}

- (BOOL)saveObjects:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  char v11;
  os_activity_scope_state_s v13;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: saveObjects sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  os_activity_scope_leave(&v13);

  v8 = (void *)MEMORY[0x193FEE914]();
  -[_DKKnowledgeStore _sanitizeObjectsBeforeSaving:]((id *)&self->super.isa, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

    objc_autoreleasePoolPop(v8);
    if (self)
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    else
      knowledgeStoreHandle = 0;
    v11 = -[_DKKnowledgeQuerying saveObjects:error:](knowledgeStoreHandle, "saveObjects:error:", v9, a4);
  }
  else
  {
    objc_autoreleasePoolPop(v8);

    v11 = 1;
  }

  return v11;
}

- (BOOL)deleteObjects:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: deleteObjects sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  os_activity_scope_leave(&v11);

  if (objc_msgSend(v6, "count"))
  {
    -[_DKRateLimitPolicyEnforcer creditForDeletion:](self->_rateLimitEnforcer, "creditForDeletion:", v6);
    v8 = -[_DKKnowledgeQuerying deleteObjects:error:](self->_knowledgeStoreHandle, "deleteObjects:error:", v6, a4);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11.opaque[0]) = 0;
      _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "Early out because no valid objects were provided.", (uint8_t *)&v11, 2u);
    }

    v8 = 1;
  }

  return v8;
}

- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  OS_dispatch_queue *v9;
  id v10;
  NSObject *v11;
  OS_dispatch_queue *defaultQueue;
  NSObject *v13;
  OS_dispatch_queue *v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  os_activity_scope_state_s state;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = (OS_dispatch_queue *)a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: deleteObjects async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v8, "count"))
  {
    -[_DKRateLimitPolicyEnforcer creditForDeletion:](self->_rateLimitEnforcer, "creditForDeletion:", v8);
    defaultQueue = v9;
    if (!v9)
      defaultQueue = self->_defaultQueue;
    -[_DKKnowledgeQuerying deleteObjects:responseQueue:withCompletion:](self->_knowledgeStoreHandle, "deleteObjects:responseQueue:withCompletion:", v8, defaultQueue, v10);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_INFO, "Early out because no valid objects were provided.", (uint8_t *)&state, 2u);
    }

    if (v10)
    {
      v14 = v9;
      if (!v9)
        v14 = self->_defaultQueue;
      v15 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __64___DKKnowledgeStore_deleteObjects_responseQueue_withCompletion___block_invoke;
      v20[3] = &unk_1E26E3358;
      v21 = v10;
      v16 = v20;
      v17 = v14;
      v18 = (void *)os_transaction_create();
      state.opaque[0] = v15;
      state.opaque[1] = 3221225472;
      v23 = __cd_dispatch_async_capture_tx_block_invoke;
      v24 = &unk_1E26E3380;
      v25 = v18;
      v26 = v16;
      v19 = v18;
      dispatch_async(v17, &state);

    }
  }

}

- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  OS_dispatch_queue *v9;
  id v10;
  NSObject *v11;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  OS_dispatch_queue *defaultQueue;
  os_activity_scope_state_s v14;

  v8 = a5;
  v9 = (OS_dispatch_queue *)a4;
  v10 = a3;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: executeQuery async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v11, &v14);
  os_activity_scope_leave(&v14);

  if (self)
    knowledgeStoreHandle = self->_knowledgeStoreHandle;
  else
    knowledgeStoreHandle = 0;
  defaultQueue = v9;
  if (!v9)
    defaultQueue = self->_defaultQueue;
  -[_DKKnowledgeQuerying executeQuery:responseQueue:withCompletion:](knowledgeStoreHandle, "executeQuery:responseQueue:withCompletion:", v10, defaultQueue, v8);

}

- (void)executeQuery:(id)a3 responseQueue:(id)a4
{
  OS_dispatch_queue *v6;
  id v7;
  NSObject *v8;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  OS_dispatch_queue *defaultQueue;
  os_activity_scope_state_s v11;

  v6 = (OS_dispatch_queue *)a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: executeQuery async no completion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  os_activity_scope_leave(&v11);

  if (self)
    knowledgeStoreHandle = self->_knowledgeStoreHandle;
  else
    knowledgeStoreHandle = 0;
  defaultQueue = v6;
  if (!v6)
    defaultQueue = self->_defaultQueue;
  -[_DKKnowledgeQuerying executeQuery:responseQueue:](knowledgeStoreHandle, "executeQuery:responseQueue:", v7, defaultQueue);

}

- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  unint64_t v9;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: deleteAllEventsInEventStream sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  os_activity_scope_leave(&v11);

  if (self)
    knowledgeStoreHandle = self->_knowledgeStoreHandle;
  else
    knowledgeStoreHandle = 0;
  v9 = -[_DKKnowledgeQuerying deleteAllEventsInEventStream:error:](knowledgeStoreHandle, "deleteAllEventsInEventStream:error:", v6, a4);

  return v9;
}

- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  OS_dispatch_queue *v9;
  id v10;
  NSObject *v11;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  OS_dispatch_queue *defaultQueue;
  os_activity_scope_state_s v14;

  v8 = a5;
  v9 = (OS_dispatch_queue *)a4;
  v10 = a3;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: deleteAllEventsInEventStream async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v11, &v14);
  os_activity_scope_leave(&v14);

  if (self)
    knowledgeStoreHandle = self->_knowledgeStoreHandle;
  else
    knowledgeStoreHandle = 0;
  defaultQueue = v9;
  if (!v9)
    defaultQueue = self->_defaultQueue;
  -[_DKKnowledgeQuerying deleteAllEventsInEventStream:responseQueue:withCompletion:](knowledgeStoreHandle, "deleteAllEventsInEventStream:responseQueue:withCompletion:", v10, defaultQueue, v8);

}

- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  unint64_t v9;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: deleteAllEventsMatchingPredicate sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  os_activity_scope_leave(&v11);

  if (self)
    knowledgeStoreHandle = self->_knowledgeStoreHandle;
  else
    knowledgeStoreHandle = 0;
  v9 = -[_DKKnowledgeQuerying deleteAllEventsMatchingPredicate:error:](knowledgeStoreHandle, "deleteAllEventsMatchingPredicate:error:", v6, a4);

  return v9;
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  OS_dispatch_queue *v9;
  id v10;
  NSObject *v11;
  _DKKnowledgeQuerying *knowledgeStoreHandle;
  OS_dispatch_queue *defaultQueue;
  os_activity_scope_state_s v14;

  v8 = a5;
  v9 = (OS_dispatch_queue *)a4;
  v10 = a3;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: deleteAllEventsMatchingPredicate async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v11, &v14);
  os_activity_scope_leave(&v14);

  if (self)
    knowledgeStoreHandle = self->_knowledgeStoreHandle;
  else
    knowledgeStoreHandle = 0;
  defaultQueue = v9;
  if (!v9)
    defaultQueue = self->_defaultQueue;
  -[_DKKnowledgeQuerying deleteAllEventsMatchingPredicate:responseQueue:withCompletion:](knowledgeStoreHandle, "deleteAllEventsMatchingPredicate:responseQueue:withCompletion:", v10, defaultQueue, v8);

}

- (id)knowledgeSynchronizingHandleWithError:(id *)a1
{
  id *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a1;
    if (objc_msgSend(a1[1], "conformsToProtocol:", &unk_1EE0DF618))
      return (id *)v3[1];
    if (a2)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2938];
      v8[0] = CFSTR("knowledge store does not implement knowledge synchronizing protocol");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 5, v6);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
    a1 = 0;
  }
  return a1;
}

- (BOOL)synchronizeWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  os_activity_scope_state_s v10;

  v5 = _os_activity_create(&dword_18DDBE000, "Duet: synchronizeWithError", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  os_activity_scope_leave(&v10);

  -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&self->super.isa, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "synchronizeWithError:", a3);
  else
    v8 = 0;

  return v8;
}

- (BOOL)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  os_activity_scope_state_s v15;

  v8 = a4;
  v9 = _os_activity_create(&dword_18DDBE000, "Duet: synchronizeWithUrgency", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v9, &v15);
  os_activity_scope_leave(&v15);

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15.opaque[0]) = 0;
    _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "Starting synchronizeWithUrgency.", (uint8_t *)&v15, 2u);
  }

  -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&self->super.isa, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "synchronizeWithUrgency:client:error:", a3, v8, a5);
  else
    v13 = 0;

  return v13;
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 responseQueue:(id)a5 completion:(id)a6
{
  id v10;
  OS_dispatch_queue *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  OS_dispatch_queue *defaultQueue;
  OS_dispatch_queue *v17;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  os_activity_scope_state_s state;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;

  v10 = a4;
  v11 = (OS_dispatch_queue *)a5;
  v12 = a6;
  v13 = _os_activity_create(&dword_18DDBE000, "Duet: synchronizeWithUrgency async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v26 = 0;
  -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&self->super.isa, &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v26;
  if (v14)
  {
    defaultQueue = v11;
    if (!v11)
      defaultQueue = self->_defaultQueue;
    objc_msgSend(v14, "synchronizeWithUrgency:client:responseQueue:completion:", a3, v10, defaultQueue, v12);
  }
  else if (v12)
  {
    v17 = v11;
    if (!v11)
      v17 = self->_defaultQueue;
    v18 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76___DKKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke;
    v23[3] = &unk_1E26E3380;
    v25 = v12;
    v24 = v15;
    v19 = v23;
    v20 = v17;
    v21 = (void *)os_transaction_create();
    state.opaque[0] = v18;
    state.opaque[1] = 3221225472;
    v28 = __cd_dispatch_async_capture_tx_block_invoke;
    v29 = &unk_1E26E3380;
    v30 = v21;
    v31 = v19;
    v22 = v21;
    dispatch_async(v20, &state);

  }
}

- (BOOL)deleteRemoteState:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  os_activity_scope_state_s v10;

  v5 = _os_activity_create(&dword_18DDBE000, "Duet: deleteRemoteState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  os_activity_scope_leave(&v10);

  -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&self->super.isa, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "deleteRemoteState:", a3);
  else
    v8 = 0;

  return v8;
}

- (id)sourceDeviceIdentityFromObject:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sourceDeviceIdentityWithError:(id *)a3
{
  NSObject *v5;
  _DKKnowledgeStore *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  os_activity_scope_state_s v12;

  v5 = _os_activity_create(&dword_18DDBE000, "Duet: sourceDeviceIdentityFromObject", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  os_activity_scope_leave(&v12);

  v6 = self;
  objc_sync_enter(v6);
  if (!sourceDeviceIdentityWithError__sourceDeviceID)
  {
    -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&v6->super.isa, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "sourceDeviceIdentityWithError:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)sourceDeviceIdentityWithError__sourceDeviceID;
      sourceDeviceIdentityWithError__sourceDeviceID = v9;

    }
  }
  objc_sync_exit(v6);

  return (id)sourceDeviceIdentityWithError__sourceDeviceID;
}

- (id)deviceUUID
{
  NSObject *v3;
  _DKKnowledgeStore *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v10;
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_18DDBE000, "Duet: deviceUUID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = self;
  objc_sync_enter(v4);
  if (!deviceUUID_deviceUUID)
  {
    v10 = 0;
    -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&v4->super.isa, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v5)
    {
      objc_msgSend(v5, "deviceUUID");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)deviceUUID_deviceUUID;
      deviceUUID_deviceUUID = v7;

    }
  }
  objc_sync_exit(v4);

  return (id)deviceUUID_deviceUUID;
}

+ (void)_knowledgeStoreWithStoreDirectory:readOnly:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create knowledge store connection.", v0, 2u);
}

@end
