@implementation HMDSecureRemoteStreamInternal

- (HMDSecureRemoteStreamInternal)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-init is not a valid initializer for HMDSecureRemoteStream"));

  return 0;
}

- (HMDSecureRemoteStreamInternal)initWithType:(int64_t)a3 commitTimeout:(unint64_t)a4 clientIdleTimeout:(unint64_t)a5 serverIdleTimeout:(unint64_t)a6 sendInternalTimeout:(unint64_t)a7 sendUserTimeout:(unint64_t)a8
{
  HMDSecureRemoteStreamInternal *v14;
  HMDSecureRemoteStreamInternal *v15;
  int v16;
  void *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v24;
  HMDSecureRemoteStreamInternal *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)HMDSecureRemoteStreamInternal;
  v14 = -[HMDSecureRemoteStreamInternal init](&v27, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_10;
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      v16 = 10;
      goto LABEL_6;
    }
LABEL_10:
    v25 = 0;
    goto LABEL_11;
  }
  v16 = 0;
LABEL_6:
  v14->_state = v16;
  v14->_type = a3;
  if (initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_t0 != -1)
    dispatch_once(&initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_t0, &__block_literal_global_176993);
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = (id)initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_v1;
  objc_msgSend(v17, "stringWithFormat:", CFSTR("HMDSecureRemoteStream.Internal.%tu"), -[HMDSecureRemoteStreamInternal hash](v15, "hash"));
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (const char *)objc_msgSend(v19, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = dispatch_queue_create_with_target_V2(v20, v21, v18);
  internalQueue = v15->_internalQueue;
  v15->_internalQueue = (OS_dispatch_queue *)v22;

  v24 = v15->_internalQueue;
  if (!v24)
    goto LABEL_10;
  objc_storeStrong((id *)&v15->_userQueue, MEMORY[0x1E0C80D38]);
  v15->_commitTimeoutNanos = a4;
  v15->_clientIdleTimeoutNanos = a5;
  v15->_serverIdleTimeoutNanos = a6;
  v15->_sendInternalTimeoutNanos = a7;
  v15->_sendUserTimeoutNanos = a8;
  v25 = v15;
LABEL_11:

  return v25;
}

- (void)dealloc
{
  OS_dispatch_queue *internalQueue;
  id requestHandler;
  id startedHandler;
  id stoppedHandler;
  id transportSendMessage;
  OS_dispatch_queue *userQueue;
  objc_super v9;

  internalQueue = self->_internalQueue;
  if (internalQueue)
  {
    self->_internalQueue = 0;

  }
  requestHandler = self->_requestHandler;
  self->_requestHandler = 0;

  startedHandler = self->_startedHandler;
  self->_startedHandler = 0;

  stoppedHandler = self->_stoppedHandler;
  self->_stoppedHandler = 0;

  transportSendMessage = self->_transportSendMessage;
  self->_transportSendMessage = 0;

  userQueue = self->_userQueue;
  if (userQueue)
  {
    self->_userQueue = 0;

  }
  v9.receiver = self;
  v9.super_class = (Class)HMDSecureRemoteStreamInternal;
  -[HMDSecureRemoteStreamInternal dealloc](&v9, sel_dealloc);
}

- (double)requestTimeout
{
  return (double)self->_sendInternalTimeoutNanos / 1000000000.0;
}

- (void)start
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HMDSecureRemoteStreamInternal_start__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_start
{
  _BOOL4 started;
  void *v4;
  HMDSecureRemoteStreamInternal *v5;
  NSObject *v6;
  void *v7;
  int state;
  void *v10;
  HMDSecureRemoteStreamInternal *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDSecureRemoteStreamInternal *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  NSString *sessionID;
  int64_t type;
  void *v28;
  NSString *v29;
  NSString *v30;
  int v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *prepareRequests;
  NSMutableDictionary *v34;
  NSMutableDictionary *transactions;
  NSMutableArray *v36;
  NSMutableArray *userTransactions;
  void *v38;
  HMDSecureRemoteStreamInternal *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  started = self->_started;
  if (!self->_started)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Starting", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    self->_started = 1;
  }
  state = self->_state;
  if (state == 11 || state == 1)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Start failed, attempt to restart session", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 4294960593;
    goto LABEL_13;
  }
  if (!self->_transportSendMessage)
    goto LABEL_38;
  sessionID = self->_sessionID;
  self->_sessionID = 0;

  type = self->_type;
  if (type == 2)
  {
    if (self->_requestHandler)
    {
      v31 = 10;
      goto LABEL_25;
    }
LABEL_38:
    v14 = 4294960551;
    goto LABEL_13;
  }
  if (type != 1)
  {
    v14 = 4294960591;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  v30 = self->_sessionID;
  self->_sessionID = v29;

  v31 = 0;
LABEL_25:
  self->_state = v31;
  if (!self->_prepareRequests)
  {
    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    prepareRequests = self->_prepareRequests;
    self->_prepareRequests = v32;

  }
  if (!self->_transactions)
  {
    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transactions = self->_transactions;
    self->_transactions = v34;

  }
  if (!self->_userTransactions)
  {
    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    userTransactions = self->_userTransactions;
    self->_userTransactions = v36;

  }
  v14 = -[HMDSecureRemoteStreamInternal _updateIdleTimer](self, "_updateIdleTimer");
  if (!(_DWORD)v14)
  {
    if (!started)
    {
      v38 = (void *)MEMORY[0x1D17BA0A0]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v41;
        _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Started", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
    }
    -[HMDSecureRemoteStreamInternal _runStateMachine](self, "_runStateMachine");
    return;
  }
LABEL_13:
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2F90];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString(), *MEMORY[0x1E0CB2D50]);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = CFSTR("?");
    if (v21)
      v23 = (const __CFString *)v21;
    v43 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, (int)v14, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v18;
    v46 = 2112;
    v47 = v25;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Start failed: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDSecureRemoteStreamInternal _stop:](v16, "_stop:", v14);
}

- (void)stop
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HMDSecureRemoteStreamInternal_stop__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_stop:(int)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  HMDSecureRemoteStreamInternal *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  int v14;
  NSObject *userQueue;
  uint64_t v16;
  NSObject *v17;
  OS_dispatch_source *idleTimer;
  NSObject *v19;
  OS_dispatch_source *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSMutableDictionary *prepareRequests;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  NSMutableDictionary *transactions;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSMutableArray *userTransactions;
  id internalRequestHandler;
  PairingSessionPrivate *pairVerifySession;
  NSString *sessionID;
  void *v44;
  HMDSecureRemoteStreamInternal *v45;
  NSObject *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  _BOOL4 started;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  int v65;
  _QWORD block[5];
  int v67;
  uint64_t v68;
  const __CFString *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  const __CFString *v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v5 = *(_QWORD *)&a3;
  v78 = *MEMORY[0x1E0C80C00];
  started = self->_started;
  if (self->_started)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v5)
      {
        v54 = (void *)MEMORY[0x1E0CB35C8];
        v53 = *MEMORY[0x1E0CB2F90];
        v72 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v11 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v11;
        v12 = CFSTR("?");
        if (v11)
          v12 = (const __CFString *)v11;
        v73 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "errorWithDomain:code:userInfo:", v53, (int)v5, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      *(_DWORD *)buf = 138543618;
      v75 = v10;
      v76 = 2112;
      v77 = v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Stopping: %@", buf, 0x16u);
      if ((_DWORD)v5)
      {

      }
    }

    objc_autoreleasePoolPop(v7);
  }
  self->_started = 0;
  if (self->_type == 1)
    v14 = 1;
  else
    v14 = 11;
  self->_state = v14;
  userQueue = self->_userQueue;
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HMDSecureRemoteStreamInternal__stop___block_invoke;
  block[3] = &unk_1E89C0400;
  block[4] = self;
  v67 = v5;
  dispatch_async(userQueue, block);
  v17 = self->_userQueue;
  v64[0] = v16;
  v64[1] = 3221225472;
  v64[2] = __39__HMDSecureRemoteStreamInternal__stop___block_invoke_2;
  v64[3] = &unk_1E89C0400;
  v64[4] = self;
  v65 = v5;
  dispatch_async(v17, v64);
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    v19 = idleTimer;
    dispatch_source_cancel(v19);
    v20 = self->_idleTimer;
    self->_idleTimer = 0;

  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[NSMutableDictionary allKeys](self->_prepareRequests, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v3 = *(void **)v61;
    do
    {
      v25 = 0;
      v26 = v24;
      do
      {
        if (*(void **)v61 != v3)
          objc_enumerationMutation(v21);
        v24 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * v25);

        -[HMDSecureRemoteStreamInternal _serverCompletePrepareRequest:](self, "_serverCompletePrepareRequest:", v24);
        ++v25;
        v26 = v24;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    }
    while (v23);

  }
  prepareRequests = self->_prepareRequests;
  self->_prepareRequests = 0;

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[NSMutableDictionary allKeys](self->_transactions, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
  if (v29)
  {
    v30 = v29;
    v31 = 0;
    v3 = *(void **)v57;
    do
    {
      v32 = 0;
      v33 = v31;
      do
      {
        if (*(void **)v57 != v3)
          objc_enumerationMutation(v28);
        v31 = *(id *)(*((_QWORD *)&v56 + 1) + 8 * v32);

        -[HMDSecureRemoteStreamInternal _completeTransaction:response:options:status:](self, "_completeTransaction:response:options:status:", v31, 0, 0, 4294960544);
        ++v32;
        v33 = v31;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    }
    while (v30);

  }
  transactions = self->_transactions;
  self->_transactions = 0;

  v35 = 176;
  -[NSMutableArray firstObject](self->_userTransactions, "firstObject");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    do
    {
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("utid"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSecureRemoteStreamInternal _completeUserTransaction:response:options:status:](self, "_completeUserTransaction:response:options:status:", v38, 0, 0, v5);

      -[NSMutableArray firstObject](self->_userTransactions, "firstObject");
      v39 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v39;
    }
    while (v39);
  }
  userTransactions = self->_userTransactions;
  self->_userTransactions = 0;

  memset_s(self->_cipherReadKey, 0x20uLL, 0, 0x20uLL);
  memset_s(self->_cipherWriteKey, 0x20uLL, 0, 0x20uLL);
  internalRequestHandler = self->_internalRequestHandler;
  self->_internalRequestHandler = 0;

  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  self->_pairVerifyDone = 0;
  sessionID = self->_sessionID;
  self->_sessionID = 0;

  if (started)
  {
    v44 = (void *)MEMORY[0x1D17BA0A0]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v47 = (id)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v5)
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v49 = *MEMORY[0x1E0CB2F90];
        v68 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v50 = objc_claimAutoreleasedReturnValue();
        v35 = v50;
        v51 = CFSTR("?");
        if (v50)
          v51 = (const __CFString *)v50;
        v69 = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, (int)v5, v3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = 0;
      }
      *(_DWORD *)buf = 138543618;
      v75 = v47;
      v76 = 2112;
      v77 = v52;
      _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Stopped: %@", buf, 0x16u);
      if ((_DWORD)v5)
      {

      }
    }

    objc_autoreleasePoolPop(v44);
  }
}

- (void)_runStateMachine
{
  if (self->_type == 1)
    -[HMDSecureRemoteStreamInternal _clientRunStateMachine](self, "_clientRunStateMachine");
  else
    -[HMDSecureRemoteStreamInternal _serverRunStateMachine](self, "_serverRunStateMachine");
}

- (int)_setupEncryption
{
  int v3;
  PairingSessionPrivate *pairVerifySession;

  if (!self->_pairVerifySession)
    return -6745;
  v3 = PairingSessionDeriveKey();
  if (!v3)
  {
    v3 = PairingSessionDeriveKey();
    if (!v3)
    {
      *(_QWORD *)self->_cipherReadNonce = 0;
      *(_QWORD *)self->_cipherWriteNonce = 0;
    }
  }
  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  return v3;
}

- (int)_updateIdleTimer
{
  OS_dispatch_source *idleTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  int *v8;
  unint64_t v9;
  dispatch_time_t v10;
  void *v12;
  HMDSecureRemoteStreamInternal *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  _QWORD handler[5];
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  idleTimer = self->_idleTimer;
  v4 = idleTimer;
  if (idleTimer)
  {
LABEL_4:
    if (self->_type == 1)
      v8 = &OBJC_IVAR___HMDSecureRemoteStreamInternal__clientIdleTimeoutNanos;
    else
      v8 = &OBJC_IVAR___HMDSecureRemoteStreamInternal__serverIdleTimeoutNanos;
    v9 = *(unint64_t *)((char *)&self->super.super.isa + *v8);
    v10 = dispatch_walltime(0, v9);
    dispatch_source_set_timer(v4, v10, 0xFFFFFFFFFFFFFFFFLL, v9 / 0xA);
    if (!idleTimer)
      dispatch_resume((dispatch_object_t)self->_idleTimer);
    return 0;
  }
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internalQueue);
  v6 = self->_idleTimer;
  self->_idleTimer = v5;

  v7 = self->_idleTimer;
  if (v7)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__HMDSecureRemoteStreamInternal__updateIdleTimer__block_invoke;
    handler[3] = &unk_1E89C2730;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_cancel_handler((dispatch_source_t)self->_idleTimer, &__block_literal_global_44_176978);
    v4 = self->_idleTimer;
    goto LABEL_4;
  }
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2F90];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("?");
    if (v18)
      v20 = (const __CFString *)v18;
    v25 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -6700, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v15;
    v28 = 2112;
    v29 = v22;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@idle timer failed: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  return -6700;
}

- (void)sendRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
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
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__HMDSecureRemoteStreamInternal_sendRequest_options_responseHandler___block_invoke;
  v15[3] = &unk_1E89C0448;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

- (void)_sendUserRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  NSMutableArray *userTransactions;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  HMDSecureRemoteStreamInternal *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  HMDSecureRemoteStreamInternal *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  NSObject *userQueue;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  _QWORD block[4];
  NSObject *v43;
  int v44;
  _QWORD handler[5];
  uint64_t v46;
  const __CFString *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  _QWORD v54[5];
  _QWORD v55[7];

  v55[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_started)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internalQueue);
    if (v13)
    {
      v14 = v13;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __74__HMDSecureRemoteStreamInternal__sendUserRequest_options_responseHandler___block_invoke;
      handler[3] = &unk_1E89C2730;
      handler[4] = self;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_source_set_cancel_handler(v14, &__block_literal_global_45_176975);
      v15 = dispatch_walltime(0, self->_sendUserTimeoutNanos);
      dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, self->_sendUserTimeoutNanos / 0xA);
      dispatch_resume(v14);
      v16 = (void *)objc_msgSend(v10, "copy");
      v17 = v16;
      userTransactions = self->_userTransactions;
      v54[0] = CFSTR("options");
      v54[1] = CFSTR("request");
      v19 = (id)MEMORY[0x1E0C9AA70];
      if (v9)
        v19 = v9;
      v55[0] = v19;
      v55[1] = v8;
      v54[2] = CFSTR("responseHandler");
      v20 = _Block_copy(v16);
      v55[2] = v20;
      v55[3] = v14;
      v54[3] = CFSTR("timer");
      v54[4] = CFSTR("utid");
      v55[4] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](userTransactions, "addObject:", v21);

      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v25;
        v50 = 2112;
        v51 = v12;
        v52 = 2112;
        v53 = v8;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Scheduled user request, utid %@\n%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDSecureRemoteStreamInternal _runStateMachine](v23, "_runStateMachine");

      goto LABEL_8;
    }
    v26 = -6700;
  }
  else
  {
    v12 = 0;
    v26 = -6703;
  }
  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2F90];
    v41 = v27;
    v31 = v26;
    v46 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    v34 = CFSTR("?");
    if (v32)
      v34 = (const __CFString *)v32;
    v47 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v40 = v26;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", v38, v31, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v30;
    v50 = 2112;
    v51 = v36;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Send user request failed: %@", buf, 0x16u);

    v27 = v41;
    v26 = v40;

  }
  objc_autoreleasePoolPop(v27);
  userQueue = v28->_userQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HMDSecureRemoteStreamInternal__sendUserRequest_options_responseHandler___block_invoke_54;
  block[3] = &unk_1E89C0490;
  v43 = v10;
  v44 = v26;
  dispatch_async(userQueue, block);
  v14 = v43;
LABEL_8:

}

- (void)_completeUserTransaction:(id)a3 response:(id)a4 options:(id)a5 status:(int)a6
{
  void *v6;
  id v11;
  __CFString *v12;
  void *v13;
  HMDSecureRemoteStreamInternal *v14;
  NSObject *v15;
  const __CFString *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  __CFString *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *userQueue;
  void *v36;
  HMDSecureRemoteStreamInternal *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  id v43;
  _QWORD block[4];
  __CFString *v45;
  id v46;
  id v47;
  int v48;
  uint64_t v49;
  const __CFString *v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (__CFString *)a4;
  v43 = a5;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = v12;
    HMFGetLogIdentifier();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      v41 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2F90];
      v49 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v18 = objc_claimAutoreleasedReturnValue();
      v12 = (__CFString *)v18;
      v19 = CFSTR("?");
      if (v18)
        v19 = (const __CFString *)v18;
      v50 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", v40, a6, v6);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v21 = &stru_1E89C3E38;
    *(_DWORD *)buf = 138544130;
    if (v16)
      v21 = v16;
    v52 = v17;
    v53 = 2112;
    v54 = v11;
    v55 = 2112;
    v56 = v20;
    v57 = 2112;
    v58 = v21;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Completed user request, utid %@, status %@\n%@", buf, 0x2Au);
    if (a6)
    {

    }
    v12 = (__CFString *)v16;
  }

  objc_autoreleasePoolPop(v13);
  v22 = -[NSMutableArray count](v14->_userTransactions, "count");
  if (!v22)
  {
    v25 = 0;
LABEL_24:
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = v14;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v39;
      v53 = 2112;
      v54 = v11;
      v55 = 2112;
      v56 = v12;
      _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Missing, utid %@ for response %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v36);
    goto LABEL_27;
  }
  v23 = v22;
  v42 = a6;
  v24 = 0;
  v25 = 0;
  while (1)
  {
    v26 = v25;
    -[NSMutableArray objectAtIndexedSubscript:](v14->_userTransactions, "objectAtIndexedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("utid"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqual:", v11);

    if ((v28 & 1) != 0)
      break;
    if (v23 == ++v24)
      goto LABEL_24;
  }
  v29 = v25;
  v25 = v29;
  if (!v29)
    goto LABEL_24;
  v30 = v12;
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("timer"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
    dispatch_source_cancel(v31);
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("responseHandler"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    userQueue = v14->_userQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__HMDSecureRemoteStreamInternal__completeUserTransaction_response_options_status___block_invoke;
    block[3] = &unk_1E89C04B8;
    v47 = v33;
    v45 = v30;
    v46 = v43;
    v48 = v42;
    dispatch_async(userQueue, block);

  }
  -[NSMutableArray removeObjectAtIndex:](v14->_userTransactions, "removeObjectAtIndex:", v24);

  v12 = v30;
LABEL_27:

}

- (void)_sendRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  dispatch_source_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  dispatch_time_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HMDSecureRemoteStreamInternal *v23;
  NSObject *v24;
  void *v25;
  NSObject *userQueue;
  id v27;
  void *v28;
  NSObject *internalQueue;
  id v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  int v36;
  _QWORD block[5];
  id v38;
  id v39;
  _QWORD handler[5];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  _QWORD v48[3];
  _QWORD v49[6];

  v49[3] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internalQueue);
  if (v12)
  {
    v13 = v12;
    v14 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke;
    handler[3] = &unk_1E89C2328;
    handler[4] = self;
    v15 = v11;
    v41 = v15;
    dispatch_source_set_event_handler(v13, handler);

    dispatch_source_set_cancel_handler(v13, &__block_literal_global_57_176971);
    v16 = dispatch_walltime(0, self->_sendInternalTimeoutNanos);
    dispatch_source_set_timer(v13, v16, 0xFFFFFFFFFFFFFFFFLL, self->_sendInternalTimeoutNanos / 0xA);
    dispatch_resume(v13);
    v17 = (void *)objc_msgSend(v9, "copy");
    v18 = (id)MEMORY[0x1E0C9AA70];
    if (v8)
      v18 = v8;
    v49[0] = v18;
    v48[0] = CFSTR("options");
    v48[1] = CFSTR("responseHandler");
    v32 = v17;
    v19 = _Block_copy(v17);
    v48[2] = CFSTR("timer");
    v49[1] = v19;
    v49[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
    v20 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v20;
    -[NSMutableDictionary setObject:forKey:](self->_transactions, "setObject:forKey:", v20, v15);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v33);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_sessionID, CFSTR("sid"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("tid"));
    v22 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("request"), CFSTR("type")));
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v30 = v8;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v25;
      v44 = 2112;
      v45 = v15;
      v14 = MEMORY[0x1E0C809B0];
      v46 = 2112;
      v47 = v21;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Sending request, tid %@\n%@", buf, 0x20u);

      v8 = v30;
    }

    objc_autoreleasePoolPop(v22);
    userQueue = v23->_userQueue;
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke_64;
    block[3] = &unk_1E89C20C8;
    block[4] = v23;
    v38 = v21;
    v39 = v8;
    v27 = v21;
    dispatch_async(userQueue, block);

    -[HMDSecureRemoteStreamInternal _updateIdleTimer](v23, "_updateIdleTimer");
    v28 = v32;
  }
  else
  {
    internalQueue = self->_internalQueue;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke_2_65;
    v34[3] = &unk_1E89C0490;
    v35 = v9;
    v36 = -6700;
    dispatch_async(internalQueue, v34);
    v28 = v35;
  }

}

- (void)_completeTransaction:(id)a3 response:(id)a4 options:(id)a5 status:(int)a6
{
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  HMDSecureRemoteStreamInternal *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  const __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_transactions, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v44 = v14;
      v46 = v11;
      v48 = v12;
      HMFGetLogIdentifier();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        v42 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2F90];
        v52 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v19 = objc_claimAutoreleasedReturnValue();
        v11 = (__CFString *)v19;
        v20 = CFSTR("?");
        if (v19)
          v20 = (const __CFString *)v19;
        v53 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v42;
        v41 = (void *)v21;
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v40, a6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      v26 = &stru_1E89C3E38;
      *(_DWORD *)buf = 138544130;
      if (v46)
        v26 = v46;
      v55 = v18;
      v56 = 2112;
      v57 = v10;
      v58 = 2112;
      v59 = v23;
      v60 = 2112;
      v61 = v26;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Completed request, tid %@, status %@\n%@", buf, 0x2Au);
      if (a6)
      {

      }
      v11 = (__CFString *)v46;
      v12 = v48;
      v14 = v44;
    }

    objc_autoreleasePoolPop(v14);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("timer"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      dispatch_source_cancel(v27);
    -[NSMutableDictionary removeObjectForKey:](self->_transactions, "removeObjectForKey:", v10);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("responseHandler"));
    v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v13, "hmf_dictionaryForKey:", CFSTR("options"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "hmf_stringForKey:", CFSTR("kRemoteMessageAttributedMessageNameKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      augmentResponseOptions(v12, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        v45 = (void *)MEMORY[0x1E0CB35C8];
        v43 = *MEMORY[0x1E0CB2F90];
        v49 = v12;
        v33 = a6;
        v50 = *MEMORY[0x1E0CB2D50];
        v47 = v30;
        v34 = v11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        v37 = CFSTR("?");
        if (v35)
          v37 = (const __CFString *)v35;
        v51 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", v43, v33, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, __CFString *, void *, void *))v29)[2](v29, v34, v32, v39);

        v12 = v49;
        v11 = v34;
        v30 = v47;
      }
      else
      {
        ((void (**)(_QWORD, __CFString *, void *, _QWORD))v29)[2](v29, v11, v32, 0);
      }

    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = v12;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v25;
      v56 = 2112;
      v57 = v10;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing, tid %@", buf, 0x16u);

      v12 = v24;
    }

    objc_autoreleasePoolPop(v14);
  }

}

- (void)transportReceivedMessage:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HMDSecureRemoteStreamInternal_transportReceivedMessage_options___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

- (void)_transportReceivedMessage:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSecureRemoteStreamInternal *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**internalRequestHandler)(id, id, id);
  void *v17;
  HMDSecureRemoteStreamInternal *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  HMDSecureRemoteStreamInternal *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v11;
    v41 = 2112;
    v42 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Transport received message %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (!v9->_started)
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v21 = -6703;
    goto LABEL_19;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v9->_sessionID && !objc_msgSend(v12, "isEqual:"))
  {
    v14 = 0;
    v13 = 0;
LABEL_28:
    v21 = -6708;
    goto LABEL_19;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqual:", CFSTR("request")))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v9->_transactions, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_24;
    internalRequestHandler = (void (**)(id, id, id))v9->_internalRequestHandler;
    if (internalRequestHandler)
    {
      internalRequestHandler[2](internalRequestHandler, v6, v7);
LABEL_17:
      -[HMDSecureRemoteStreamInternal _runStateMachine](v9, "_runStateMachine");
      goto LABEL_24;
    }
    v21 = -6714;
  }
  else if (objc_msgSend(v14, "isEqual:", CFSTR("response")))
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v9;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v35 = v7;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v20;
      v41 = 2112;
      v42 = v13;
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Received response, tid %@, %@", buf, 0x20u);

      v7 = v35;
    }

    objc_autoreleasePoolPop(v17);
    if (v9->_sessionID)
    {
      -[HMDSecureRemoteStreamInternal _completeTransaction:response:options:status:](v18, "_completeTransaction:response:options:status:", v13, v6, v7, 0);
      goto LABEL_17;
    }
    v21 = -6736;
  }
  else
  {
    v21 = -6702;
  }
LABEL_19:
  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v9;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v25 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = (void *)v25;
    v31 = *MEMORY[0x1E0CB2F90];
    v36 = v22;
    v37 = *MEMORY[0x1E0CB2D50];
    v26 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v27 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v27;
    v28 = CFSTR("?");
    if (v27)
      v28 = (const __CFString *)v27;
    v38 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v31, v21, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v33;
    v41 = 2112;
    v42 = v30;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Transport message error: %@, %@", buf, 0x20u);

    v7 = v26;
    v22 = v36;

  }
  objc_autoreleasePoolPop(v22);
LABEL_24:

}

- (void)_clientRunStateMachine
{
  HMDSecureRemoteStreamInternal *v2;
  NSObject *userQueue;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMDSecureRemoteStreamInternal *v8;
  NSObject *v9;
  void *v10;
  int state;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v2 = self;
  v17 = *MEMORY[0x1E0C80C00];
  while (2)
  {
    switch(v2->_state)
    {
      case 0:
        v2->_state = 2;
        continue;
      case 1:
        return;
      case 2:
        self = (HMDSecureRemoteStreamInternal *)-[HMDSecureRemoteStreamInternal _clientPairVerifyExchange:](v2, "_clientPairVerifyExchange:", 0);
        if ((_DWORD)self)
          goto LABEL_20;
        v2->_state = 3;
        continue;
      case 3:
        if (!v2->_pairVerifyDone)
          return;
        v2->_state = 4;
        continue;
      case 4:
        self = (HMDSecureRemoteStreamInternal *)-[HMDSecureRemoteStreamInternal _setupEncryption](v2, "_setupEncryption");
        if (!(_DWORD)self)
        {
          userQueue = v2->_userQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __55__HMDSecureRemoteStreamInternal__clientRunStateMachine__block_invoke;
          block[3] = &unk_1E89C2730;
          block[4] = v2;
          dispatch_async(userQueue, block);
LABEL_19:
          v2->_state = 5;
          continue;
        }
LABEL_20:
        v5 = (uint64_t)self;
LABEL_24:
        -[HMDSecureRemoteStreamInternal _stop:](v2, "_stop:", v5);
        return;
      case 5:
        self = (HMDSecureRemoteStreamInternal *)-[NSMutableArray count](v2->_userTransactions, "count");
        if (!self)
          return;
        v2->_state = 6;
        continue;
      case 6:
        v2->_prepareResponded = 0;
        -[NSMutableArray firstObject](v2->_userTransactions, "firstObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[HMDSecureRemoteStreamInternal _clientSendPrepareRequest:](v2, "_clientSendPrepareRequest:", v4);

        if ((_DWORD)v5)
          goto LABEL_24;
        v2->_state = 7;
        continue;
      case 7:
        if (!v2->_prepareResponded)
          return;
        v2->_state = 8;
        continue;
      case 8:
        v2->_commitResponded = 0;
        -[NSMutableArray firstObject](v2->_userTransactions, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[HMDSecureRemoteStreamInternal _clientSendCommitRequest:](v2, "_clientSendCommitRequest:", v6);

        if ((_DWORD)v5)
          goto LABEL_24;
        v2->_state = 9;
        continue;
      case 9:
        if (v2->_commitResponded)
          goto LABEL_19;
        return;
      default:
        v7 = (void *)MEMORY[0x1D17BA0A0](self, a2);
        v8 = v2;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          state = v2->_state;
          *(_DWORD *)buf = 138543618;
          v14 = v10;
          v15 = 1024;
          v16 = state;
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Bad state: %d", buf, 0x12u);

        }
        objc_autoreleasePoolPop(v7);
        v5 = 4294960587;
        goto LABEL_24;
    }
  }
}

- (int)_clientPairVerifyExchange:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDSecureRemoteStreamInternal *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE buf[24];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0;
  v26 = 0;
  if (!self->_pairVerifySession)
  {
    v34 = 0u;
    v33 = 0u;
    v32 = 0u;
    *(_OWORD *)&buf[8] = 0u;
    *(_QWORD *)buf = self;
    if (self->_findPeerHandler)
      *(_QWORD *)&v33 = _pairingFindPeer;
    *((_QWORD *)&v32 + 1) = _pairingCopyIdentity;
    v9 = PairingSessionCreate();
    if (v9)
    {
      v6 = v9;
      goto LABEL_10;
    }
    PairingSessionSetLogging();
  }
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");
  v6 = PairingSessionExchange();
  if (!v6)
  {
    if (!self->_pairVerifyDone)
    {
      v29[0] = CFSTR("data");
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26, v25);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = CFSTR("op");
      v30[0] = v7;
      v30[1] = CFSTR("pv");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __59__HMDSecureRemoteStreamInternal__clientPairVerifyExchange___block_invoke;
      v24[3] = &unk_1E89C0500;
      v24[4] = self;
      -[HMDSecureRemoteStreamInternal _sendRequest:options:responseHandler:](self, "_sendRequest:options:responseHandler:", v8, 0, v24);

    }
    v6 = 0;
  }
LABEL_10:
  if (v26)
    free(v26);
  if (v6)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2F90];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("?");
      if (v15)
        v17 = (const __CFString *)v15;
      v28 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v22);
      v18 = v4;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v14, v6, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Pair-verify failed: %@", buf, 0x16u);

      v4 = v18;
    }

    objc_autoreleasePoolPop(v10);
  }

  return v6;
}

- (int)_clientSendPrepareRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned __int8 *cipherWriteNonce;
  uint64_t v15;
  uint64_t v16;
  BOOL v18;
  void *v19;
  HMDSecureRemoteStreamInternal *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  HMDSecureRemoteStreamInternal *v28;
  NSObject *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  uint64_t v42;
  const __CFString *v43;
  const __CFString *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _QWORD v52[3];
  _QWORD v53[5];

  v53[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v10 = 0;
    v8 = 0;
    v7 = 0;
LABEL_17:
    v25 = -6762;
    goto LABEL_20;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("request"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    v10 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  v52[0] = CFSTR("op");
  v52[1] = CFSTR("request");
  v53[0] = CFSTR("prepare");
  v53[1] = v6;
  v52[2] = CFSTR("utid");
  v53[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteStreamInternal _encodeBinaryPlist:](self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "length");
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v11 + 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_retainAutorelease(v12);
      objc_msgSend(v13, "mutableBytes");
      cipherWriteNonce = self->_cipherWriteNonce;
      v10 = objc_retainAutorelease(v10);
      objc_msgSend(v10, "bytes");
      v15 = chacha20_poly1305_encrypt_all_64x64();
      v16 = 0;
      do
      {
        if (++cipherWriteNonce[v16])
          v18 = 1;
        else
          v18 = v16 == 7;
        ++v16;
      }
      while (!v18);
      v19 = (void *)MEMORY[0x1D17BA0A0](v15);
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v22;
        v48 = 2112;
        v49 = v5;
        v50 = 2112;
        v51 = v8;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Sending prepare request, utid %@ %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      v44 = CFSTR("edata");
      v45 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __59__HMDSecureRemoteStreamInternal__clientSendPrepareRequest___block_invoke;
      v41[3] = &unk_1E89C0500;
      v41[4] = v20;
      -[HMDSecureRemoteStreamInternal _sendRequest:options:responseHandler:](v20, "_sendRequest:options:responseHandler:", v23, v24, v41);

      v25 = 0;
      goto LABEL_14;
    }
    v25 = -6728;
  }
  else
  {
    v25 = -6732;
  }
LABEL_20:
  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2F90];
    v39 = v27;
    v42 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v30 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v30;
    v31 = CFSTR("?");
    if (v30)
      v31 = (const __CFString *)v30;
    v43 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v40 = v7;
    v32 = v8;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v35, v25, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v38;
    v48 = 2112;
    v49 = v34;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Send prepare request failed: %@", buf, 0x16u);

    v27 = v39;
    v8 = v32;
    v7 = v40;

  }
  objc_autoreleasePoolPop(v27);
LABEL_14:

  return v25;
}

- (int)_clientHandlePrepareResponse:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  int v13;
  unsigned __int8 *cipherReadNonce;
  int v15;
  uint64_t v16;
  BOOL v18;
  void *v19;
  HMDSecureRemoteStreamInternal *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("edata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    v13 = -6756;
    goto LABEL_18;
  }
  v9 = objc_msgSend(v8, "length");
  if (v9 < 0x10)
  {
    v12 = 0;
    v13 = -6743;
    goto LABEL_18;
  }
  v10 = v9;
  objc_msgSend(objc_retainAutorelease(v8), "bytes");
  if (v10 == 16)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v10 - 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = 0;
      v13 = -6728;
      goto LABEL_18;
    }
  }
  cipherReadNonce = self->_cipherReadNonce;
  v12 = objc_retainAutorelease(v11);
  objc_msgSend(v12, "mutableBytes");
  v15 = chacha20_poly1305_decrypt_all_64x64();
  if (v15)
  {
    v13 = v15;
  }
  else
  {
    v16 = 0;
    do
    {
      if (++cipherReadNonce[v16])
        v18 = 1;
      else
        v18 = v16 == 7;
      ++v16;
    }
    while (!v18);
    self->_prepareResponded = 1;
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Received prepare response", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("kIDSMessageRequestTransactionIDKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    logRemoteMessageEvent(v6, v7, v23);

    v13 = 0;
  }
LABEL_18:

  return v13;
}

- (int)_clientSendCommitRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  unsigned __int8 *cipherWriteNonce;
  uint64_t v14;
  uint64_t v15;
  BOOL v17;
  void *v18;
  HMDSecureRemoteStreamInternal *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v26;
  HMDSecureRemoteStreamInternal *v27;
  NSObject *v28;
  uint64_t v29;
  const __CFString *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _QWORD v53[3];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_sendInternalTimeoutNanos / 1000000000.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = CFSTR("op");
    v53[1] = CFSTR("utid");
    v54[0] = CFSTR("commit");
    v54[1] = v5;
    v53[2] = CFSTR("timeout");
    v54[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSecureRemoteStreamInternal _encodeBinaryPlist:](self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "length");
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v10 + 16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v40 = v6;
        v12 = objc_retainAutorelease(v11);
        objc_msgSend(v12, "mutableBytes");
        cipherWriteNonce = self->_cipherWriteNonce;
        v9 = objc_retainAutorelease(v9);
        objc_msgSend(v9, "bytes");
        v14 = chacha20_poly1305_encrypt_all_64x64();
        v15 = 0;
        do
        {
          if (++cipherWriteNonce[v15])
            v17 = 1;
          else
            v17 = v15 == 7;
          ++v15;
        }
        while (!v17);
        v18 = (void *)MEMORY[0x1D17BA0A0](v14);
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = v21;
          v49 = 2112;
          v50 = v5;
          v51 = 2112;
          v52 = v7;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Sending commit request, utid %@ %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        v45 = CFSTR("edata");
        v46 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __58__HMDSecureRemoteStreamInternal__clientSendCommitRequest___block_invoke;
        v42[3] = &unk_1E89C0500;
        v42[4] = v19;
        -[HMDSecureRemoteStreamInternal _sendRequest:options:responseHandler:](v19, "_sendRequest:options:responseHandler:", v22, v23, v42);

        v24 = 0;
        v6 = v40;
        goto LABEL_13;
      }
      v24 = -6728;
    }
    else
    {
      v24 = -6732;
    }
  }
  else
  {
    v9 = 0;
    v6 = 0;
    v7 = 0;
    v24 = -6762;
  }
  v26 = (void *)MEMORY[0x1D17BA0A0]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2F90];
    v41 = v6;
    v43 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v29 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v29;
    v30 = CFSTR("?");
    if (v29)
      v30 = (const __CFString *)v29;
    v44 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v39 = v26;
    v31 = v4;
    v32 = v7;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v35, v24, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v38;
    v49 = 2112;
    v50 = v34;
    _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Send commit request failed: %@", buf, 0x16u);

    v6 = v41;
    v7 = v32;
    v4 = v31;
    v26 = v39;

  }
  objc_autoreleasePoolPop(v26);
LABEL_13:

  return v24;
}

- (int)_clientHandleCommitResponse:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  unsigned __int8 *cipherReadNonce;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v21;
  void *v22;
  void *v23;
  HMDSecureRemoteStreamInternal *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("edata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_24;
  }
  v9 = objc_msgSend(v8, "length");
  v10 = v9 - 16;
  if (v9 < 0x10)
  {
    v12 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v15 = -6743;
    goto LABEL_18;
  }
  objc_msgSend(objc_retainAutorelease(v8), "bytes");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v15 = -6728;
    goto LABEL_18;
  }
  v12 = objc_retainAutorelease(v11);
  objc_msgSend(v12, "mutableBytes");
  cipherReadNonce = self->_cipherReadNonce;
  v14 = chacha20_poly1305_decrypt_all_64x64();
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_18;
  }
  v19 = 0;
  do
  {
    if (++cipherReadNonce[v19])
      v21 = 1;
    else
      v21 = v19 == 7;
    ++v19;
  }
  while (!v21);
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  if (!v22)
  {
    v17 = 0;
    v18 = 0;
    v15 = -6732;
    goto LABEL_18;
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("utid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("response"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_24:
    v15 = -6756;
    goto LABEL_18;
  }
  v29 = v7;
  self->_commitResponded = 1;
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v26;
    v32 = 2112;
    v33 = v18;
    v34 = 2112;
    v35 = v16;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Received commit response, utid %@ %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v23);
  v7 = v29;
  -[HMDSecureRemoteStreamInternal _completeUserTransaction:response:options:status:](v24, "_completeUserTransaction:response:options:status:", v18, v17, v29, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v18);
  logRemoteMessageEvent(v6, v29, v27);

  v15 = 0;
LABEL_18:

  return v15;
}

- (void)_serverRunStateMachine
{
  uint64_t v3;
  HMDSecureRemoteStreamInternal *v4;
  HMDSecureRemoteStreamInternal *v5;
  HMDSecureRemoteStreamInternal *v6;
  uint64_t v7;
  HMDSecureRemoteStreamInternal *v8;
  NSObject *userQueue;
  void *v10;
  HMDSecureRemoteStreamInternal *v11;
  NSObject *v12;
  void *v13;
  int state;
  uint64_t v15;
  _QWORD block[5];
  _QWORD v17[4];
  HMDSecureRemoteStreamInternal *v18;
  _QWORD v19[4];
  HMDSecureRemoteStreamInternal *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  while (2)
  {
    switch(self->_state)
    {
      case 0xA:
        self->_state = 12;
        continue;
      case 0xB:
      case 0xF:
        return;
      case 0xC:
        v4 = self;
        v19[0] = v3;
        v19[1] = 3221225472;
        v19[2] = __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke;
        v19[3] = &unk_1E89C0528;
        v20 = v4;
        v5 = v4;
        -[HMDSecureRemoteStreamInternal setInternalRequestHandler:](v5, "setInternalRequestHandler:", v19);
        self->_state = 13;
        v6 = v20;
        goto LABEL_9;
      case 0xD:
        if (!self->_pairVerifyDone)
          return;
        self->_state = 14;
        continue;
      case 0xE:
        v7 = -[HMDSecureRemoteStreamInternal _setupEncryption](self, "_setupEncryption");
        if (!(_DWORD)v7)
        {
          v8 = self;
          v17[0] = v3;
          v17[1] = 3221225472;
          v17[2] = __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke_2;
          v17[3] = &unk_1E89C0528;
          v18 = v8;
          v5 = v8;
          -[HMDSecureRemoteStreamInternal setInternalRequestHandler:](v5, "setInternalRequestHandler:", v17);
          self->_state = 15;
          userQueue = v5->_userQueue;
          block[0] = v3;
          block[1] = 3221225472;
          block[2] = __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke_3;
          block[3] = &unk_1E89C2730;
          block[4] = v5;
          dispatch_async(userQueue, block);
          v6 = v18;
LABEL_9:

          continue;
        }
        v15 = v7;
LABEL_14:
        -[HMDSecureRemoteStreamInternal _stop:](self, "_stop:", v15);
        return;
      default:
        v10 = (void *)MEMORY[0x1D17BA0A0](self, a2);
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          state = self->_state;
          *(_DWORD *)buf = 138543618;
          v22 = v13;
          v23 = 1024;
          v24 = state;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Bad state: %d", buf, 0x12u);

        }
        objc_autoreleasePoolPop(v10);
        v15 = 4294960587;
        goto LABEL_14;
    }
  }
}

- (void)_serverPairVerifyExchange:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t isKindOfClass;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDSecureRemoteStreamInternal *v18;
  NSObject *v19;
  void *v20;
  NSObject *userQueue;
  id v22;
  void *v23;
  HMDSecureRemoteStreamInternal *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD block[5];
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _BYTE buf[24];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41 = 0;
  v42 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("op"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("pv"));

  v36 = v6;
  if (!v9)
  {
    v22 = 0;
    v35 = 0;
    v12 = 0;
    v37 = 0;
    v14 = 4294960560;
    goto LABEL_20;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tid"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v37 = (void *)v11;
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v22 = 0;
    v35 = 0;
    v12 = 0;
    v14 = 4294960588;
    goto LABEL_20;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v22 = 0;
    v35 = 0;
LABEL_32:
    v14 = 4294960540;
    goto LABEL_20;
  }
  if (self->_sessionID)
  {
    v35 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v35 = v13;
  if ((isKindOfClass & 1) == 0)
  {
    v22 = 0;
    goto LABEL_32;
  }
  objc_storeStrong((id *)&self->_sessionID, v13);
LABEL_8:
  if (self->_pairVerifySession)
    goto LABEL_9;
  v50 = 0u;
  v49 = 0u;
  v48 = 0u;
  *(_OWORD *)&buf[8] = 0u;
  *(_QWORD *)buf = self;
  if (self->_findPeerHandler)
    *(_QWORD *)&v49 = _pairingFindPeer;
  *((_QWORD *)&v48 + 1) = _pairingCopyIdentity;
  isKindOfClass = PairingSessionCreate();
  if ((_DWORD)isKindOfClass)
  {
    v14 = isKindOfClass;
    v22 = 0;
LABEL_20:
    v23 = (void *)MEMORY[0x1D17BA0A0](isKindOfClass);
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v34 = v7;
      v27 = *MEMORY[0x1E0CB2F90];
      v43 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = CFSTR("?");
      if (v28)
        v30 = (const __CFString *)v28;
      v44 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, (int)v14, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&v48 = v36;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Pair-verify failed: %@, %@", buf, 0x20u);

      v7 = v34;
    }

    objc_autoreleasePoolPop(v23);
    -[HMDSecureRemoteStreamInternal _stop:](v24, "_stop:", v14);
    goto LABEL_25;
  }
  PairingSessionSetLogging();
LABEL_9:
  v12 = objc_retainAutorelease(v12);
  objc_msgSend(v12, "bytes");
  objc_msgSend(v12, "length");
  isKindOfClass = PairingSessionExchange();
  v14 = isKindOfClass;
  if ((_DWORD)isKindOfClass)
  {
    v22 = 0;
  }
  else
  {
    v45[0] = CFSTR("data");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v42, v41);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v15;
    v46[1] = CFSTR("pv");
    v45[1] = CFSTR("op");
    v45[2] = CFSTR("sid");
    v46[2] = self->_sessionID;
    v46[3] = v37;
    v45[3] = CFSTR("tid");
    v45[4] = CFSTR("type");
    v46[4] = CFSTR("response");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Sending pair-verify response %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    userQueue = v18->_userQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HMDSecureRemoteStreamInternal__serverPairVerifyExchange_options___block_invoke;
    block[3] = &unk_1E89C20C8;
    block[4] = v18;
    v22 = v16;
    v39 = v22;
    v40 = v7;
    dispatch_async(userQueue, block);

    isKindOfClass = -[HMDSecureRemoteStreamInternal _updateIdleTimer](v18, "_updateIdleTimer");
    if (v42)
      free(v42);
  }
  if ((_DWORD)v14)
    goto LABEL_20;
LABEL_25:

}

- (void)_serverHandleEncryptedRequest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDSecureRemoteStreamInternal *v10;
  NSObject *v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unsigned __int8 *cipherReadNonce;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v23;
  void *v24;
  HMDSecureRemoteStreamInternal *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  const __CFString *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_sessionID)
  {
    v8 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tid"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_25:
    v13 = 0;
    v42 = 0;
    v20 = 0;
    v19 = 4294960534;
    goto LABEL_18;
  }
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v12;
    v49 = 2112;
    v50 = v8;
    v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received request, tid %@ %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("edata"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v13, "length");
    v15 = v14 - 16;
    if (v14 < 0x10)
    {
      v42 = 0;
      v20 = 0;
      v19 = 4294960553;
    }
    else
    {
      v13 = objc_retainAutorelease(v13);
      objc_msgSend(v13, "bytes");
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v42 = objc_retainAutorelease(v16);
        objc_msgSend(v42, "mutableBytes");
        cipherReadNonce = v10->_cipherReadNonce;
        v18 = chacha20_poly1305_decrypt_all_64x64();
        if ((_DWORD)v18)
        {
          v19 = v18;
          v20 = 0;
        }
        else
        {
          v21 = 0;
          do
          {
            if (++cipherReadNonce[v21])
              v23 = 1;
            else
              v23 = v21 == 7;
            ++v21;
          }
          while (!v23);
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v42, 0, 0, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __71__HMDSecureRemoteStreamInternal__serverHandleEncryptedRequest_options___block_invoke;
            v43[3] = &unk_1E89C0550;
            v43[4] = v10;
            v8 = v8;
            v44 = v8;
            v19 = -[HMDSecureRemoteStreamInternal _serverHandleDecryptedRequest:options:responseHandler:](v10, "_serverHandleDecryptedRequest:options:responseHandler:", v20, v7, v43);

            if (!(_DWORD)v19)
              goto LABEL_23;
          }
          else
          {
            v19 = 4294960564;
          }
        }
      }
      else
      {
        v42 = 0;
        v20 = 0;
        v19 = 4294960568;
      }
    }
  }
  else
  {
    v42 = 0;
    v20 = 0;
    v19 = 4294960540;
  }
LABEL_18:
  v41 = v8;
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v36 = objc_claimAutoreleasedReturnValue();
    v40 = v7;
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v39 = v20;
    v28 = v6;
    v29 = *MEMORY[0x1E0CB2F90];
    v45 = *MEMORY[0x1E0CB2D50];
    v38 = v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = CFSTR("?");
    if (v30)
      v32 = (const __CFString *)v30;
    v46 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v29;
    v6 = v28;
    v20 = v39;
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v34, (int)v19, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v37;
    v49 = 2112;
    v50 = v35;
    v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Request failed: %@, %@", buf, 0x20u);

    v7 = v40;
    v24 = v38;

  }
  objc_autoreleasePoolPop(v24);
  -[HMDSecureRemoteStreamInternal _stop:](v25, "_stop:", v19);
  v8 = v41;
LABEL_23:

}

- (int)_serverHandleDecryptedRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("op"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", CFSTR("prepare")))
  {
    v12 = -[HMDSecureRemoteStreamInternal _serverHandlePrepareRequest:options:responseHandler:](self, "_serverHandlePrepareRequest:options:responseHandler:", v8, v9, v10);
  }
  else
  {
    if (!objc_msgSend(v11, "isEqual:", CFSTR("commit")))
    {
      v13 = -6714;
      goto LABEL_7;
    }
    v12 = -[HMDSecureRemoteStreamInternal _serverHandleCommitRequest:options:responseHandler:](self, "_serverHandleCommitRequest:options:responseHandler:", v8, v9, v10);
  }
  v13 = v12;
LABEL_7:

  return v13;
}

- (int)_serverHandlePrepareRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  HMDSecureRemoteStreamInternal *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  dispatch_source_t v18;
  NSObject *v19;
  id v20;
  dispatch_time_t v21;
  void *v22;
  NSObject *internalQueue;
  int v24;
  _QWORD block[4];
  id v27;
  id v28;
  HMDSecureRemoteStreamInternal *v29;
  id v30;
  id v31;
  _QWORD handler[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("utid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("request"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    v24 = -6756;
    goto LABEL_7;
  }
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v16;
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = v8;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Received prepare request, utid %@ %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
  logRemoteMessageEvent(v12, v9, v17);

  v18 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v14->_internalQueue);
  if (v18)
  {
    v19 = v18;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __85__HMDSecureRemoteStreamInternal__serverHandlePrepareRequest_options_responseHandler___block_invoke;
    handler[3] = &unk_1E89C2328;
    handler[4] = v14;
    v20 = v11;
    v33 = v20;
    dispatch_source_set_event_handler(v19, handler);

    dispatch_source_set_cancel_handler(v19, &__block_literal_global_89_176911);
    v21 = dispatch_walltime(0, v14->_commitTimeoutNanos);
    dispatch_source_set_timer(v19, v21, 0xFFFFFFFFFFFFFFFFLL, v14->_commitTimeoutNanos / 0xA);
    dispatch_resume(v19);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("request"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, CFSTR("timer"));
    -[NSMutableDictionary setObject:forKey:](v14->_prepareRequests, "setObject:forKey:", v22, v20);
    internalQueue = v14->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HMDSecureRemoteStreamInternal__serverHandlePrepareRequest_options_responseHandler___block_invoke_3;
    block[3] = &unk_1E89C0598;
    v12 = v12;
    v27 = v12;
    v28 = v9;
    v29 = v14;
    v30 = v20;
    v31 = v10;
    dispatch_async(internalQueue, block);

    v24 = 0;
  }
  else
  {
    v24 = -6700;
  }
LABEL_7:

  return v24;
}

- (int)_serverHandleCommitRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  HMDSecureRemoteStreamInternal *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t sendInternalTimeoutNanos;
  void *v20;
  HMDSecureRemoteStreamInternal *v21;
  int64_t v22;
  NSObject *v23;
  void *v24;
  dispatch_source_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  dispatch_time_t v32;
  NSObject *userQueue;
  int v34;
  HMDSecureRemoteStreamInternal *v36;
  NSObject *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  double v44;
  void *context;
  id v46;
  dispatch_source_t source;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  double v52;
  _QWORD block[5];
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD *v58;
  _QWORD handler[5];
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD *v64;
  _QWORD v65[3];
  char v66;
  uint64_t v67;
  const __CFString *v68;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v49 = a4;
  v46 = a5;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = 0;
  v48 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("utid"));
  v52 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    v50 = 0;
    v51 = 0;
    source = 0;
    goto LABEL_19;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_prepareRequests, "objectForKeyedSubscript:", *(_QWORD *)&v52);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v9;
  if (!v9)
  {
    v12 = 0;
    v50 = 0;
    v51 = 0;
    source = 0;
    v34 = -6727;
    goto LABEL_24;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("processing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
    v50 = 0;
    source = 0;
    v34 = -6730;
    goto LABEL_24;
  }
  objc_msgSend(v51, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("processing"));
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("request"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v50 = 0;
    source = 0;
    v34 = -6762;
    goto LABEL_24;
  }
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v70 = v16;
    v71 = 2112;
    v72 = v52;
    v73 = 2112;
    v74 = *(double *)&v48;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Received commit request, utid %@ %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)&v52);
  logRemoteMessageEvent(v12, v49, v17);

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("timer"));
  v18 = objc_claimAutoreleasedReturnValue();
  source = v18;
  if (v18)
    dispatch_source_cancel(v18);
  objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("timeout"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50)
  {
    sendInternalTimeoutNanos = v14->_sendInternalTimeoutNanos;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    v34 = -6756;
    goto LABEL_24;
  }
  sendInternalTimeoutNanos = 1000000000 * objc_msgSend(v50, "longLongValue");
LABEL_13:
  v20 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = v14;
  HMFGetOSLogHandle();
  v22 = sendInternalTimeoutNanos - 5000000000;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v70 = v24;
    v71 = 2048;
    v72 = (float)((float)v22 / 1000000000.0);
    v73 = 2112;
    v74 = v52;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Starting commit response timeout of %.03f seconds for transaction: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  v25 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v21->_internalQueue);
  if (v25)
  {
    v26 = v25;
    v27 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke;
    handler[3] = &unk_1E89C0608;
    v64 = v65;
    handler[4] = v21;
    v28 = *(id *)&v52;
    v60 = v28;
    v29 = v12;
    v61 = v29;
    v30 = v49;
    v62 = v30;
    v31 = v46;
    v63 = v31;
    dispatch_source_set_event_handler(v26, handler);

    dispatch_source_set_cancel_handler(v26, &__block_literal_global_94_176884);
    v32 = dispatch_walltime(0, v22);
    dispatch_source_set_timer(v26, v32, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(v26);
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v26, CFSTR("timer"));
    userQueue = v21->_userQueue;
    block[0] = v27;
    block[1] = 3221225472;
    block[2] = __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke_2;
    block[3] = &unk_1E89C0608;
    block[4] = v21;
    v12 = v29;
    v54 = v12;
    v55 = v30;
    v58 = v65;
    v56 = v28;
    v57 = v31;
    dispatch_async(userQueue, block);

    v34 = 0;
    goto LABEL_17;
  }
  v34 = -6700;
LABEL_24:
  context = (void *)MEMORY[0x1D17BA0A0]();
  v36 = self;
  HMFGetOSLogHandle();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v67 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString(), context);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    v42 = CFSTR("?");
    if (v40)
      v42 = (const __CFString *)v40;
    v68 = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v34, v43);
    v44 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543874;
    v70 = v38;
    v71 = 2112;
    v72 = v44;
    v73 = 2112;
    v74 = *(double *)&v48;
    _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Commit failed: %@ %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(context);
LABEL_17:

  _Block_object_dispose(v65, 8);
  return v34;
}

- (void)_serverCompletePrepareRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  HMDSecureRemoteStreamInternal *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_prepareRequests, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timer"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      dispatch_source_cancel(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_prepareRequests, "removeObjectForKey:", v4);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing prepare request, tid %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (id)logIdentifier
{
  int64_t type;
  NSString *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  type = self->_type;
  if (type == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("S(%@)"), self->_sessionID);
  }
  else
  {
    if (type != 1)
    {
      v4 = self->_sessionID;
      return v4;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("C(%@)"), self->_sessionID);
  }
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (id)internalRequestHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setInternalRequestHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (id)getLocalIdentityHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setGetLocalIdentityHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (id)findPeerHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setFindPeerHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (id)requestHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setRequestHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (id)startedHandler
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setStartedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (id)stoppedHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setStoppedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (id)transportSendMessage
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setTransportSendMessage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQueue, 0);
  objc_storeStrong(&self->_transportSendMessage, 0);
  objc_storeStrong(&self->_stoppedHandler, 0);
  objc_storeStrong(&self->_startedHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong(&self->_findPeerHandler, 0);
  objc_storeStrong(&self->_getLocalIdentityHandler, 0);
  objc_storeStrong((id *)&self->_userTransactions, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_prepareRequests, 0);
  objc_storeStrong(&self->_internalRequestHandler, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
}

void __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v5;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Transaction, %@, timed out, sending cancelled error", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "_serverCompletePrepareRequest:", *(_QWORD *)(a1 + 40));
    v24[0] = CFSTR("response");
    v22 = CFSTR("kIDSMessageResponseErrorDataKey");
    v7 = (void *)MEMORY[0x1E0CB36F8];
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2F90];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString(), *MEMORY[0x1E0CB2D50]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("?");
    if (v10)
      v12 = (const __CFString *)v10;
    v21 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -6723, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("utid");
    v25[0] = v16;
    v25[1] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "hmf_stringForKey:", CFSTR("kIDSMessageNameKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    augmentResponseOptions(*(void **)(a1 + 56), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

  }
}

void __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v2 + 200);
  v5 = *(_QWORD *)(v2 + 104);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke_3;
  v8[3] = &unk_1E89C05E0;
  v6 = *(_QWORD *)(a1 + 72);
  v8[4] = v2;
  v12 = v6;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(v4 + 16))(v4, v3, v5, v7, v8);

}

void __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 104));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Transaction, %@, has already been completed", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_serverCompletePrepareRequest:", *(_QWORD *)(a1 + 40));
    v31[0] = CFSTR("response");
    v31[1] = CFSTR("utid");
    v15 = *(_QWORD *)(a1 + 40);
    v32[0] = v7;
    v32[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "hmf_stringForKey:", CFSTR("kIDSMessageNameKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    augmentResponseOptions(v8, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEBUG, "%{public}@sending commit response, utid %@ %@", buf, 0x20u);

      v16 = v24;
    }

    objc_autoreleasePoolPop(v19);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  }
}

uint64_t __85__HMDSecureRemoteStreamInternal__serverHandlePrepareRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverCompletePrepareRequest:", *(_QWORD *)(a1 + 40));
}

void __85__HMDSecureRemoteStreamInternal__serverHandlePrepareRequest_options_responseHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hmf_stringForKey:", CFSTR("kIDSMessageNameKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  augmentResponseOptions(*(void **)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Sending prepare response options %@, utid %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __71__HMDSecureRemoteStreamInternal__serverHandleEncryptedRequest_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  _QWORD block[5];
  id v48;
  id v49;
  uint64_t v50;
  const __CFString *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _QWORD v58[4];
  _QWORD v59[6];

  v59[4] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 104));
  v46 = v7;
  if (v9)
  {
    if (objc_msgSend(v9, "code"))
    {
      v31 = objc_msgSend(v9, "code");
      if (!(_DWORD)v31)
        goto LABEL_20;
      v12 = 0;
    }
    else
    {
      v12 = 0;
      v31 = 4294960596;
    }
    goto LABEL_29;
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v10 + 160))
  {
    v12 = 0;
    v31 = 4294960576;
    goto LABEL_29;
  }
  if (!*(_QWORD *)(v10 + 152) || !*(_QWORD *)(v10 + 224))
  {
    v12 = 0;
LABEL_22:
    v31 = 4294960534;
LABEL_29:
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2F90];
      v45 = v31;
      v50 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      v38 = CFSTR("?");
      if (v36)
        v38 = (const __CFString *)v36;
      v51 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v44 = v32;
      v39 = v8;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", v42, (int)v31, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v35;
      v54 = 2112;
      v55 = v41;
      v56 = 2112;
      v57 = v46;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Response failed: %@, %@", buf, 0x20u);

      v31 = v45;
      v8 = v39;
      v32 = v44;

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(*(id *)(a1 + 32), "_stop:", v31);
    goto LABEL_19;
  }
  if (v7)
  {
    -[HMDSecureRemoteStreamInternal _encodeBinaryPlist:]((void *)v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "length");
      goto LABEL_9;
    }
    goto LABEL_22;
  }
  v13 = 0;
  v12 = 0;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v13 + 16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v31 = 4294960568;
    goto LABEL_29;
  }
  v15 = v8;
  v16 = objc_retainAutorelease(v14);
  objc_msgSend(v16, "mutableBytes");
  v12 = objc_retainAutorelease(v12);
  objc_msgSend(v12, "bytes");
  chacha20_poly1305_encrypt_all_64x64();
  v17 = 0;
  v18 = *(_QWORD *)(a1 + 32) + 80;
  do
  {
    if (++*(_BYTE *)(v18 + v17))
      v20 = 1;
    else
      v20 = v17 == 7;
    ++v17;
  }
  while (!v20);
  v59[0] = v16;
  v58[0] = CFSTR("edata");
  v58[1] = CFSTR("sid");
  v21 = *(_QWORD *)(a1 + 40);
  v59[1] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  v59[2] = v21;
  v58[2] = CFSTR("tid");
  v58[3] = CFSTR("type");
  v59[3] = CFSTR("response");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v53 = v26;
    v54 = 2112;
    v55 = v27;
    v56 = 2112;
    v57 = v22;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Sending response, tid %@ %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v23);
  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(NSObject **)(v28 + 240);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HMDSecureRemoteStreamInternal__serverHandleEncryptedRequest_options___block_invoke_88;
  block[3] = &unk_1E89C20C8;
  block[4] = v28;
  v48 = v22;
  v8 = v15;
  v49 = v15;
  v30 = v22;
  dispatch_async(v29, block);

  objc_msgSend(*(id *)(a1 + 32), "_updateIdleTimer");
LABEL_19:

  v7 = v46;
LABEL_20:

}

- (id)_encodeBinaryPlist:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (!v4)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = a1;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode payload as binary PList: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __71__HMDSecureRemoteStreamInternal__serverHandleEncryptedRequest_options___block_invoke_88(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 224) + 16))(*(_QWORD *)(a1[4] + 224), a1[5], a1[6]);
}

uint64_t __67__HMDSecureRemoteStreamInternal__serverPairVerifyExchange_options___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 224) + 16))(*(_QWORD *)(a1[4] + 224), a1[5], a1[6]);
}

uint64_t __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverPairVerifyExchange:options:", a2, a3);
}

uint64_t __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverHandleEncryptedRequest:options:", a2, a3);
}

void __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 208));
  if (v4)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 208);
    *(_QWORD *)(v2 + 208) = 0;

    v4[2](v4, 0);
  }

}

void __58__HMDSecureRemoteStreamInternal__clientSendCommitRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  if (!objc_msgSend(v9, "code"))
  {
    v11 = 4294960596;
    goto LABEL_7;
  }
  v11 = objc_msgSend(v10, "code");
  if (!(_DWORD)v11)
  {
LABEL_4:
    v11 = objc_msgSend(*(id *)(a1 + 32), "_clientHandleCommitResponse:options:", v7, v8);
    if (!(_DWORD)v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "_runStateMachine");
      goto LABEL_13;
    }
  }
LABEL_7:
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2F90];
    v24 = v12;
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("?");
    if (v15)
      v17 = (const __CFString *)v15;
    v26 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v21, (int)v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v22;
    v29 = 2112;
    v30 = v19;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Commit response failed: %@", buf, 0x16u);

    v12 = v24;
  }

  objc_autoreleasePoolPop(v12);
  if ((_DWORD)v11 != -6752)
    objc_msgSend(*(id *)(a1 + 32), "_stop:", v11);
LABEL_13:

}

void __59__HMDSecureRemoteStreamInternal__clientSendPrepareRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  if (!objc_msgSend(v9, "code"))
  {
    v11 = 4294960596;
    goto LABEL_7;
  }
  v11 = objc_msgSend(v10, "code");
  if (!(_DWORD)v11)
  {
LABEL_4:
    v11 = objc_msgSend(*(id *)(a1 + 32), "_clientHandlePrepareResponse:options:", v7, v8);
    if (!(_DWORD)v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "_runStateMachine");
      goto LABEL_13;
    }
  }
LABEL_7:
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2F90];
    v24 = v12;
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("?");
    if (v15)
      v17 = (const __CFString *)v15;
    v26 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v21, (int)v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v22;
    v29 = 2112;
    v30 = v19;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Prepare response failed: %@", buf, 0x16u);

    v12 = v24;
  }

  objc_autoreleasePoolPop(v12);
  if ((_DWORD)v11 != -6752)
    objc_msgSend(*(id *)(a1 + 32), "_stop:", v11);
LABEL_13:

}

void __59__HMDSecureRemoteStreamInternal__clientPairVerifyExchange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "code"))
    {
      v13 = objc_msgSend(v10, "code");
      v11 = 0;
      if (!(_DWORD)v13)
        goto LABEL_12;
    }
    else
    {
      v11 = 0;
      v13 = 4294960596;
    }
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "_clientPairVerifyExchange:", v11);
      if (!(_DWORD)v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "_runStateMachine");
        goto LABEL_12;
      }
      v13 = v12;
    }
    else
    {
      v13 = 4294960540;
    }
  }
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2F90];
    v26 = v8;
    v27 = *MEMORY[0x1E0CB2D50];
    v25 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("?");
    if (v17)
      v19 = (const __CFString *)v17;
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v22, (int)v13, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v23;
    v31 = 2112;
    v32 = v21;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Pair-verify response failed: %@", buf, 0x16u);

    v8 = v26;
    v14 = v25;

  }
  objc_autoreleasePoolPop(v14);
  if ((_DWORD)v13 != -6752)
    objc_msgSend(*(id *)(a1 + 32), "_stop:", v13);
LABEL_12:

}

void __55__HMDSecureRemoteStreamInternal__clientRunStateMachine__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 208));
  if (v4)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 208);
    *(_QWORD *)(v2 + 208) = 0;

    v4[2](v4, 0);
  }

}

void __66__HMDSecureRemoteStreamInternal_transportReceivedMessage_options___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v1, "_transportReceivedMessage:options:", v2, v3);

}

uint64_t __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeTransaction:response:options:status:", *(_QWORD *)(a1 + 40), 0, 0, 4294960574);
}

uint64_t __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke_64(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 224) + 16))(*(_QWORD *)(a1[4] + 224), a1[5], a1[6]);
}

void __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke_2_65(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(int *)(a1 + 40);
  if ((_DWORD)v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CB2F90];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("?");
    if (v5)
      v7 = (const __CFString *)v5;
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v1 + 16))(v1, 0, 0, v9);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), 0, 0, 0);
  }
}

void __82__HMDSecureRemoteStreamInternal__completeUserTransaction_response_options_status___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(int *)(a1 + 56);
  if ((_DWORD)v4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2F90];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("?");
    if (v7)
      v9 = (const __CFString *)v7;
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v1 + 16))(v1, v3, v2, v11);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 48), v3, v2, 0);
  }
}

uint64_t __74__HMDSecureRemoteStreamInternal__sendUserRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop:", 4294960574);
}

void __74__HMDSecureRemoteStreamInternal__sendUserRequest_options_responseHandler___block_invoke_54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(int *)(a1 + 40);
  if ((_DWORD)v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CB2F90];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("?");
    if (v5)
      v7 = (const __CFString *)v5;
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v1 + 16))(v1, 0, 0, v9);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), 0, 0, 0);
  }
}

uint64_t __69__HMDSecureRemoteStreamInternal_sendRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendUserRequest:options:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __49__HMDSecureRemoteStreamInternal__updateIdleTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop:", 4294960574);
}

void __39__HMDSecureRemoteStreamInternal__stop___block_invoke(uint64_t a1)
{
  void (**v2)(void *, void *);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (void (**)(void *, void *))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 208));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 208);
    *(_QWORD *)(v3 + 208) = 0;

    v5 = *(int *)(a1 + 40);
    if ((_DWORD)v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2F90];
      v13 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("?");
      if (v8)
        v10 = (const __CFString *)v8;
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v2[2](v2, v12);

    }
    else
    {
      v2[2](v2, 0);
    }
  }

}

void __39__HMDSecureRemoteStreamInternal__stop___block_invoke_2(uint64_t a1)
{
  void (**v2)(void *, _QWORD);
  uint64_t v3;
  void *v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = (void (**)(void *, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 216));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 216);
    *(_QWORD *)(v3 + 216) = 0;

    v5 = *(_DWORD *)(a1 + 40);
    if (v5)
      v6 = v5 == -6752;
    else
      v6 = 1;
    if (v6)
    {
      v2[2](v2, 0);
    }
    else
    {
      v7 = v5;
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2F90];
      v15 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("?");
      if (v10)
        v12 = (const __CFString *)v10;
      v16[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v7, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, void *))v2)[2](v2, v14);

    }
  }

}

uint64_t __37__HMDSecureRemoteStreamInternal_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop:", 4294960544);
}

uint64_t __38__HMDSecureRemoteStreamInternal_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

void __132__HMDSecureRemoteStreamInternal_initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("HMDSecureRemoteStream.Internal");
  v1 = (void *)initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_v1;
  initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_v1 = (uint64_t)v0;

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t49_177001 != -1)
    dispatch_once(&logCategory__hmf_once_t49_177001, &__block_literal_global_95_177002);
  return (id)logCategory__hmf_once_v50_177003;
}

void __44__HMDSecureRemoteStreamInternal_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v50_177003;
  logCategory__hmf_once_v50_177003 = v0;

}

@end
