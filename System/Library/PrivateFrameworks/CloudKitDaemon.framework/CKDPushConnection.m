@implementation CKDPushConnection

+ (id)sharedConnectionForAPSEnvironmentString:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  CKDPushConnection *v9;
  const char *v10;
  const char *v11;

  v4 = a3;
  v5 = v4;
  if (qword_1ED7027D8 == -1)
  {
    if (v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_1ED7027D8, &unk_1E78328F0);
  if (!v5)
LABEL_3:
    v5 = (id)*MEMORY[0x1E0CFE130];
LABEL_4:
  v6 = a1;
  objc_sync_enter(v6);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_1ED7027D0, v7, (uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = [CKDPushConnection alloc];
    v8 = (void *)objc_msgSend_initWithEnvironment_(v9, v10, (uint64_t)v5);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_1ED7027D0, v11, (uint64_t)v8, v5);
  }
  objc_sync_exit(v6);

  return v8;
}

- (CKDPushConnection)initWithEnvironment:(id)a3
{
  id v5;
  CKDPushConnection *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSMutableArray *v15;
  NSMutableArray *completionBlocks;
  id v17;
  const char *v18;
  uint64_t v19;
  APSConnection *apsConnection;
  const char *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDPushConnection;
  v6 = -[CKDPushConnection init](&v26, sel_init);
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v6->_apsEnvironmentString, a3);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionBlocks = v6->_completionBlocks;
    v6->_completionBlocks = v15;

    v17 = objc_alloc(MEMORY[0x1E0CFE148]);
    v19 = objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v17, v18, (uint64_t)v5, *MEMORY[0x1E0CFE118], v6->_queue);
    apsConnection = v6->_apsConnection;
    v6->_apsConnection = (APSConnection *)v19;

    objc_msgSend_setDelegate_(v6->_apsConnection, v21, (uint64_t)v6);
    v24 = (id)objc_msgSend_publicToken(v6->_apsConnection, v22, v23);

  }
  return v6;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAA7BE0;
  block[3] = &unk_1E782EF38;
  objc_copyWeak(&v6, &location);
  dispatch_sync(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  v4.receiver = self;
  v4.super_class = (Class)CKDPushConnection;
  -[CKDPushConnection dealloc](&v4, sel_dealloc);
}

- (void)getToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_queue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEAA7CB0;
  v9[3] = &unk_1E782F4D0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD block[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1BE990000, "CKDPushConnection/didReceivePublicToken", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Received public token from connection %@: %{public}@", buf, 0x16u);
  }
  CKGetGlobalQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAA8060;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_async(v10, block);

  if (v7)
  {
    objc_msgSend_queue(self, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = sub_1BEAA80CC;
    v15[3] = &unk_1E782EE20;
    v15[4] = self;
    v16 = v7;
    dispatch_async(v14, v15);

  }
  os_activity_scope_leave(&state);

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    objc_msgSend_apsEnvironmentString(self, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("disconnected");
    if (v4)
      v13 = CFSTR("connected");
    v14 = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v13;
    _os_log_impl(&dword_1BE990000, v8, OS_LOG_TYPE_INFO, "Push connection for environment \"%{public}@\" changed status: %{public}@", (uint8_t *)&v14, 0x16u);

  }
}

- (void)connectionDidReconnect:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1BE990000, v4, OS_LOG_TYPE_DEBUG, "Did reconnect to push daemon", v5, 2u);
  }

}

- (NSString)apsEnvironmentString
{
  return self->_apsEnvironmentString;
}

- (void)setAPSEnvironmentString:(id)a3
{
  objc_storeStrong((id *)&self->_apsEnvironmentString, a3);
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
}

@end
