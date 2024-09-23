@implementation SYSession

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("SYSession is an abstract class. Please instantiate the correct subclass for your use case."));
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SYSession;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (SYSession)initWithService:(id)a3
{
  id v4;
  SYSession *v5;
  SYSession *v6;
  uint64_t v7;
  NSMutableSet *pendingMessageIDs;
  uint64_t v9;
  NSMutableDictionary *peerGenerationIDs;
  void *v11;
  id v12;
  NSObject *v13;
  dispatch_qos_class_t qos_class;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  OS_dispatch_queue *delegateQueue;
  SYSession *v22;
  objc_super v24;
  char __str[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SYSession;
  v5 = -[SYSession init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_service, v4);
    v6->_priority = objc_msgSend(v4, "priority");
    *(_OWORD *)&v6->_perMessageTimeout = xmmword_2117AA590;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 16);
    pendingMessageIDs = v6->_pendingMessageIDs;
    v6->_pendingMessageIDs = (NSMutableSet *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    peerGenerationIDs = v6->_peerGenerationIDs;
    v6->_peerGenerationIDs = (NSMutableDictionary *)v9;

    v6->_setDelegateLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    snprintf(__str, 0x80uLL, "%s Session Queue", (const char *)objc_msgSend(v12, "UTF8String"));

    objc_msgSend(v4, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    qos_class = dispatch_queue_get_qos_class(v13, 0);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (qos_class)
    {
      dispatch_queue_attr_make_with_qos_class(v15, qos_class, 0);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = v17;
    }
    v18 = dispatch_queue_create(__str, v16);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v18;

    +[SYQueueDumper registerQueue:](SYQueueDumper, "registerQueue:", v6->_queue);
    MakeDefaultDelegateQueue(v4);
    v20 = objc_claimAutoreleasedReturnValue();
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v20;

    +[SYQueueDumper registerQueue:](SYQueueDumper, "registerQueue:", v6->_delegateQueue);
    v6->_birthDate = CFAbsoluteTimeGetCurrent();
    -[SYSession _beginTransaction](v6, "_beginTransaction");
    v22 = v6;

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_211704000, v1, (os_log_type_t)0x90u, "-[%{public}@ dealloc]: XPC transaction wasn't ended prior to -dealloc", (uint8_t *)&v4, 0xCu);

}

- (BOOL)_beginTransaction
{
  BOOL *p_inTransaction;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  OS_os_transaction *v13;
  OS_os_transaction *transaction;

  p_inTransaction = &self->_inTransaction;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_inTransaction))
    {
      v5 = 0;
      __clrex();
      return v5;
    }
    v5 = 1;
  }
  while (__stlxr(1u, (unsigned __int8 *)p_inTransaction));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYSession _beginTransaction].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
  v13 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v13;

  return v5;
}

- (BOOL)_endTransaction
{
  BOOL *p_inTransaction;
  int v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  OS_os_transaction *transaction;

  p_inTransaction = &self->_inTransaction;
  do
  {
    v4 = __ldaxr((unsigned __int8 *)p_inTransaction);
    if (v4 != 1)
    {
      v5 = 0;
      __clrex();
      return v5;
    }
  }
  while (__stlxr(0, (unsigned __int8 *)p_inTransaction));
  v5 = 1;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYSession _endTransaction].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
  transaction = self->_transaction;
  self->_transaction = 0;

  return v5;
}

- (void)_recordOutgoingMessageUUID:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (!-[SYSession wasCancelled](self, "wasCancelled"))
  {
    if (v4)
    {
      -[NSMutableSet addObject:](self->_pendingMessageIDs, "addObject:", v4);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v5 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYSession _recordOutgoingMessageUUID:].cold.1(v5);
    }
  }

}

- (void)_clearOutgoingMessageUUID:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SYSession wasCancelled](self, "wasCancelled"))
    -[NSMutableSet removeObject:](self->_pendingMessageIDs, "removeObject:", v4);

}

- (id)_cancelPendingMessagesReturningFailures
{
  void *v3;
  void *v4;
  void *v5;

  -[SYSession service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelMessagesReturningFailures:", self->_pendingMessageIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataFromChange:(id)a3
{
  id v4;
  SYChangeSerializer *serializer;
  uint64_t v6;
  void *v7;

  v4 = a3;
  serializer = self->_serializer;
  if (serializer)
  {
    -[SYChangeSerializer dataFromChange:](serializer, "dataFromChange:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "conformsToProtocol:", &unk_254AC3710))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("SYSession cannot encode change objects of type '%@'"), objc_opt_class());
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v6;
  SYChangeSerializer *serializer;
  void *v8;
  id v10;

  v6 = a3;
  serializer = self->_serializer;
  if (!serializer)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCE88]);
    objc_exception_throw((id)objc_msgSend(v10, "initWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("SYSession does not have a serializer. You must set a serializer before starting a session."), 0));
  }
  -[SYChangeSerializer changeFromData:ofType:](serializer, "changeFromData:ofType:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if (self->_serializer && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SYChangeSerializer encodeSYChangeForBackwardCompatibility:protocolVersion:](self->_serializer, "encodeSYChangeForBackwardCompatibility:protocolVersion:", v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 2)
  {
    -[SYSession dataFromChange:](self, "dataFromChange:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (self->_serializer && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SYChangeSerializer dataWithSYObject:](self->_serializer, "dataWithSYObject:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "conformsToProtocol:", &unk_254AC3710))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("SYSession cannot encode change objects of type '%@' for protocol version %ld"), objc_opt_class(), a4);
      v8 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_12:

  return v8;
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v8 = a3;
  if (self->_serializer && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SYChangeSerializer decodeChangeData:fromProtocolVersion:ofType:](self->_serializer, "decodeChangeData:fromProtocolVersion:ofType:", v8, a4, a5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 2)
  {
    -[SYSession changeFromData:ofType:](self, "changeFromData:ofType:", v8, a5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_serializer || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v12 = objc_alloc(MEMORY[0x24BDBCE88]);
      objc_exception_throw((id)objc_msgSend(v12, "initWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("SYSession does not have a serializer. You must set a serializer before starting a session."), 0));
    }
    -[SYChangeSerializer SYObjectWithData:](self->_serializer, "SYObjectWithData:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  id obj;

  obj = a3;
  os_unfair_lock_lock(&self->_setDelegateLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = obj;
    if (obj)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 && -[SYSession isSending](self, "isSending"))
        -[SYSession setCanRestart:](self, "setCanRestart:", 0);
      v6 = objc_opt_respondsToSelector();
      v5 = obj;
      if ((v6 & 1) == 0)
      {
        -[SYSession setCanRollback:](self, "setCanRollback:", 0);
        v5 = obj;
      }
    }
    objc_storeWeak((id *)&self->_delegate, v5);
  }
  os_unfair_lock_unlock(&self->_setDelegateLock);

}

- (OS_dispatch_queue)targetQueue
{
  return self->_delegateQueue;
}

- (void)setTargetQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue **p_delegateQueue;
  void *v6;
  OS_dispatch_queue *obj;
  OS_dispatch_queue *obja;

  v4 = (OS_dispatch_queue *)a3;
  p_delegateQueue = &self->_delegateQueue;
  if (self->_delegateQueue != v4)
  {
    if (!v4)
    {
      -[SYSession service](self, "service");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MakeDefaultDelegateQueue(v6);
      obj = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();

      v4 = obj;
    }
    obja = v4;
    objc_storeStrong((id *)p_delegateQueue, v4);
    v4 = obja;
  }

}

- (unint64_t)protocolVersion
{
  return 2;
}

- (BOOL)wasCancelled
{
  return -[SYSession state](self, "state") == 3;
}

- (double)remainingSessionTime
{
  double v3;
  double v5;

  -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
  if (v3 == 0.0)
    return 1.79769313e308;
  v5 = v3 + self->_birthDate;
  return v5 - CFAbsoluteTimeGetCurrent();
}

- (NSDictionary)wrappedUserContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SYSession userContext](self, "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[SYSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("AssociatedSessionIdentifier"));

    v7 = v4;
  }
  else
  {
    UserInfoDictionaryWithAssociatedSessionID(v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSDictionary *)v7;
}

- (unint64_t)sentChangeByteCount
{
  return 0;
}

- (unint64_t)sentChangeCount
{
  return 0;
}

- (void)cancel
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
  -[SYSession cancelWithError:](self, "cancelWithError:", v3);

}

- (void)_pause
{
  BOOL *p_paused;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_paused = &self->_paused;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_paused))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_paused));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    _SYObfuscate(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Pausing %{public}@ ...", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__SYSession__pause__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_barrier_sync(queue, block);
}

void __19__SYSession__pause__block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 176));
}

- (void)_continue
{
  BOOL *p_paused;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  p_paused = &self->_paused;
  do
  {
    v4 = __ldaxr((unsigned __int8 *)p_paused);
    if (v4 != 1)
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(0, (unsigned __int8 *)p_paused));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    _SYObfuscate(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "... Resuming %{public}@", (uint8_t *)&v8, 0xCu);

  }
  dispatch_resume((dispatch_object_t)self->_queue);
}

- (BOOL)_readyToProcessIncomingMessages
{
  unsigned int v3;
  BOOL result;

  v3 = -[SYSession state](self, "state");
  result = 0;
  switch(v3)
  {
    case 1u:
    case 0xAu:
      result = !-[SYSession isSending](self, "isSending");
      break;
    case 6u:
    case 7u:
      result = -[SYSession isSending](self, "isSending");
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_willAcquiesceToNewSessionFromPeer:(id)a3
{
  id v4;
  NSMutableDictionary *peerGenerationIDs;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  _BYTE v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  peerGenerationIDs = self->_peerGenerationIDs;
  objc_msgSend(v4, "peerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](peerGenerationIDs, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
  {
    v22 = v8;
    -[SYSession identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SYSession state](self, "state");
    objc_msgSend(v4, "generationID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138544130;
    v34 = v23;
    v35 = 1024;
    *(_DWORD *)v36 = v24;
    *(_WORD *)&v36[4] = 2114;
    *(_QWORD *)&v36[6] = v7;
    *(_WORD *)&v36[14] = 2114;
    *(_QWORD *)&v36[16] = v25;
    _os_log_debug_impl(&dword_211704000, v22, OS_LOG_TYPE_DEBUG, "Session acquiescense test: %{public}@, %{companionsync:SYSessionState}d, my generation %{public}@, new generation %{public}@", (uint8_t *)&v33, 0x26u);

    if (v7)
    {
LABEL_5:
      if ((objc_msgSend(v4, "hasGenerationID") & 1) == 0)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v16 = (void *)qword_253D84AB8;
        if (!os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        v17 = v16;
        -[SYSession identifier](self, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v18;
        v19 = "Session %{public}@ rejecting new session; no peer generation ID";
        goto LABEL_16;
      }
      objc_msgSend(v4, "generationID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v20 = (void *)qword_253D84AB8;
        v12 = 1;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
        {
          v13 = v20;
          -[SYSession identifier](self, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "generationID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543874;
          v34 = v14;
          v35 = 2114;
          *(_QWORD *)v36 = v21;
          *(_WORD *)&v36[8] = 2114;
          *(_QWORD *)&v36[10] = v7;
          _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_INFO, "Session %{public}@ acquiescing to new session; new generation ID %{public}@ does not match current %{public}@",
            (uint8_t *)&v33,
            0x20u);

LABEL_35:
          goto LABEL_36;
        }
        goto LABEL_36;
      }
      if (self->_rejectedNewSessionFromSamePeer)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v11 = (void *)qword_253D84AB8;
        v12 = 1;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
        {
          v13 = v11;
          -[SYSession identifier](self, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543362;
          v34 = v14;
          v15 = "Session %{public}@ acquiescing to new session; second strike";
LABEL_34:
          _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v33, 0xCu);
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      self->_rejectedNewSessionFromSamePeer = 1;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v31 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
      {
        v17 = v31;
        -[SYSession identifier](self, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v18;
        v19 = "Session %{public}@ rejecting new session: first strike";
LABEL_16:
        _os_log_impl(&dword_211704000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v33, 0xCu);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else if (v7)
  {
    goto LABEL_5;
  }
  if (-[SYSession isSending](self, "isSending"))
  {
    v26 = -[SYSession state](self, "state");
    if (v26 == 6)
    {
      if (self->_rejectedNewSessionFromSamePeer)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v30 = (void *)qword_253D84AB8;
        v12 = 1;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
        {
          v13 = v30;
          -[SYSession identifier](self, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543362;
          v34 = v14;
          v15 = "Session %{public}@ acquiescing to new session; sending, not started, already rejected";
          goto LABEL_34;
        }
        goto LABEL_36;
      }
      self->_rejectedNewSessionFromSamePeer = 1;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v32 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
      {
        v17 = v32;
        -[SYSession identifier](self, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v18;
        v19 = "Session %{public}@ rejecting new session; sending, not started, first strike";
        goto LABEL_16;
      }
LABEL_17:
      v12 = 0;
      goto LABEL_36;
    }
    if (!v26)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v27 = (void *)qword_253D84AB8;
      if (!os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      v17 = v27;
      -[SYSession identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v18;
      v19 = "Session %{public}@ rejecting new session; not yet sent out my own start-session message";
      goto LABEL_16;
    }
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v28 = (void *)qword_253D84AB8;
  v12 = 1;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    v13 = v28;
    -[SYSession identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v14;
    v15 = "Session %{public}@ acquiescing to new session; nil current generation";
    goto LABEL_34;
  }
LABEL_36:

  return v12;
}

- (BOOL)hasRejectedPeerSession
{
  return self->_rejectedNewSessionFromSamePeer;
}

- (void)setHasRejectedPeerSession:(BOOL)a3
{
  self->_rejectedNewSessionFromSamePeer = a3;
}

- (void)_onSessionStateChangedTo:(unsigned int)a3 do:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  unsigned int v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v7 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "-[SYSession _onSessionStateChangedTo:do:]";
    _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SYSession__onSessionStateChangedTo_do___block_invoke;
  block[3] = &unk_24CC673D8;
  v12 = a3;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_sync(queue, block);

}

void __41__SYSession__onSessionStateChangedTo_do___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = *(unsigned int *)(a1 + 48);
  if (v2 == (_DWORD)v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 56);
      *(_QWORD *)(v6 + 56) = v5;

      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v3 = *(unsigned int *)(a1 + 48);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      objc_msgSend(v13, "addObject:", v9);
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v11 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      v13 = (id)objc_msgSend(v10, "initWithObjects:", v11, 0);

      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v9);
    }

  }
}

- (id)stateResponders
{
  return self->_stateResponders;
}

- (void)_supercededWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[SYSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[SYSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v6);

  -[SYSession targetQueue](self, "targetQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTargetQueue:", v7);

  -[SYSession serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSerializer:", v8);

  -[SYSession options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v9);

  objc_msgSend(v4, "setMaxConcurrentMessages:", -[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"));
  objc_msgSend(v4, "setCanRestart:", -[SYSession canRestart](self, "canRestart"));
  objc_msgSend(v4, "setCanRollback:", -[SYSession canRollback](self, "canRollback"));
  -[SYSession userContext](self, "userContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserContext:", v10);

  -[SYSession sessionMetadata](self, "sessionMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionMetadata:", v11);

  -[SYSession peerGenerationIDs](self, "peerGenerationIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPeerGenerationIDs:", v12);

  -[SYSession reason](self, "reason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReason:", v13);

  -[SYSession _setStateQuietly:](self, "_setStateQuietly:", 0);
  -[SYSession _endTransaction](self, "_endTransaction");
}

- (void)_handleError:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SYSession state](self, "state") != 5)
  {
    -[SYSession setError:](self, "setError:", v4);
    -[SYSession setState:](self, "setState:", 5);
  }

}

- (id)CPSafeDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@> %@"), v5, v6);

  return v7;
}

- (PBCodable)stateForLogging
{
  void *v3;
  void *v4;
  SYLogErrorInfo *v5;
  void *v6;
  SYLogErrorInfo *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *peerGenerationIDs;
  id v11;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_opt_new();
  -[SYSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  objc_msgSend(v3, "setState:", -[SYSession state](self, "state"));
  objc_msgSend(v3, "setIsSending:", -[SYSession isSending](self, "isSending"));
  objc_msgSend(v3, "setIsReset:", -[SYSession isResetSync](self, "isResetSync"));
  -[SYSession perMessageTimeout](self, "perMessageTimeout");
  objc_msgSend(v3, "setPerMessageTimeout:");
  -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
  objc_msgSend(v3, "setFullSessionTimeout:");
  objc_msgSend(v3, "setMaxConcurrentMessages:", -[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"));
  v5 = [SYLogErrorInfo alloc];
  -[SYSession error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SYLogErrorInfo initWithCocoaError:](v5, "initWithCocoaError:", v6);
  objc_msgSend(v3, "setError:", v7);

  objc_msgSend(v3, "setCanRollback:", -[SYSession canRollback](self, "canRollback"));
  objc_msgSend(v3, "setCanRestart:", -[SYSession canRestart](self, "canRestart"));
  objc_msgSend(v3, "setCanceled:", -[SYSession wasCancelled](self, "wasCancelled"));
  -[SYSession options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCocoaTransportOptions:", v8);

  -[SYSession reason](self, "reason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReason:", v9);

  peerGenerationIDs = self->_peerGenerationIDs;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __28__SYSession_stateForLogging__block_invoke;
  v13[3] = &unk_24CC67400;
  v11 = v3;
  v14 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerGenerationIDs, "enumerateKeysAndObjectsUsingBlock:", v13);

  return (PBCodable *)v11;
}

void __28__SYSession_stateForLogging__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setPeerID:", v6);

  objc_msgSend(v7, "setGenerationID:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addPeer:", v7);

}

+ (id)unarchiveMetadata:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1620], "sy_unarchivedObjectFromData:", a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (SYSessionDelegate)delegate
{
  return (SYSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SYChangeSerializer)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (SYService)service
{
  return (SYService *)objc_loadWeakRetained((id *)&self->_service);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (double)perMessageTimeout
{
  return self->_perMessageTimeout;
}

- (void)setPerMessageTimeout:(double)a3
{
  self->_perMessageTimeout = a3;
}

- (double)fullSessionTimeout
{
  return self->_fullSessionTimeout;
}

- (void)setFullSessionTimeout:(double)a3
{
  self->_fullSessionTimeout = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)maxConcurrentMessages
{
  return self->_maxConcurrentMessages;
}

- (void)setMaxConcurrentMessages:(int64_t)a3
{
  self->_maxConcurrentMessages = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isSending
{
  return self->_isSending;
}

- (NSDictionary)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (NSDictionary)sessionMetadata
{
  return self->_sessionMetadata;
}

- (void)setSessionMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (double)birthDate
{
  return self->_birthDate;
}

- (void)setBirthDate:(double)a3
{
  self->_birthDate = a3;
}

- (unint64_t)sessionSignpost
{
  return self->_sessionSignpost;
}

- (void)setSessionSignpost:(unint64_t)a3
{
  self->_sessionSignpost = a3;
}

- (NSMutableDictionary)peerGenerationIDs
{
  return self->_peerGenerationIDs;
}

- (void)setPeerGenerationIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerGenerationIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionMetadata, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateResponders, 0);
  objc_storeStrong((id *)&self->_pendingMessageIDs, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)didStartSession
{
  self->_sessionStarted = 1;
}

- (id)combinedEngineOptions:(id)a3
{
  id v4;
  NSDictionary *options;
  NSDictionary *v6;
  NSDictionary *v7;

  v4 = a3;
  options = self->_options;
  if (!v4)
  {
    v7 = options;
LABEL_6:
    v6 = v7;
    goto LABEL_7;
  }
  if (!options)
  {
    v7 = (NSDictionary *)v4;
    goto LABEL_6;
  }
  v6 = (NSDictionary *)-[NSDictionary mutableCopy](options, "mutableCopy");
  -[NSDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v4);
LABEL_7:

  return v6;
}

- (unsigned)state
{
  unsigned int result;

  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_12_0();
  return result;
}

- (void)setState:(unsigned int)a3
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (BOOL)canRestart
{
  BOOL result;

  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_12_0();
  return result;
}

- (void)setCanRestart:(BOOL)a3
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (BOOL)canRollback
{
  BOOL result;

  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_12_0();
  return result;
}

- (void)setCanRollback:(BOOL)a3
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (BOOL)isResetSync
{
  BOOL result;

  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_12_0();
  return result;
}

- (void)start:(id)a3
{
  id v3;
  void (**v4)(id, _QWORD, id);
  id v5;

  OUTLINED_FUNCTION_2_3();
  v4 = (void (**)(id, _QWORD, id))v3;
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2008, 0);
  v4[2](v4, 0, v5);

}

- (void)cancelWithError:(id)a3
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (void)_handleSyncBatch:(id)a3 response:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (void)_handleRestartSession:(id)a3 response:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (void)_handleEndSession:(id)a3 response:(id)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
}

- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4
{
  BOOL result;

  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_12_0();
  return result;
}

- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4
{
  BOOL result;

  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_12_0();
  return result;
}

- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4
{
  BOOL result;

  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_12_0();
  return result;
}

- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4
{
  BOOL result;

  OUTLINED_FUNCTION_2_3();
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_12_0();
  return result;
}

- (void)_beginTransaction
{
  OUTLINED_FUNCTION_9(&dword_211704000, a2, a3, "%{public}@: beginning XPC transaction, to stop us being Jetsammed until it's done.", a5, a6, a7, a8, 2u);
}

- (void)_endTransaction
{
  OUTLINED_FUNCTION_9(&dword_211704000, a2, a3, "%{public}@: ending XPC transaction. We can now be jetsammed safely.", a5, a6, a7, a8, 2u);
}

- (void)_recordOutgoingMessageUUID:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Asked to record a nil IDS message identifier!", v1, 2u);
}

@end
