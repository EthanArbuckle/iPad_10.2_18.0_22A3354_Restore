@implementation NFCNDEFTag

- (NFCNDEFTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NFCNDEFTag *v12;
  uint64_t v13;
  NSNumber *sessionKey;
  uint64_t v15;
  OS_dispatch_queue *delegateQueue;
  uint64_t v17;
  NFCHardwareManager *hardwareManager;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCNDEFTag.m"), 28, CFSTR("Nil session"));

  }
  objc_msgSend(v8, "sessionQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCNDEFTag.m"), 29, CFSTR("Nil session queue"));

  }
  objc_msgSend(v8, "hardwareManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCNDEFTag.m"), 30, CFSTR("Nil hardwareManager"));

  }
  v23.receiver = self;
  v23.super_class = (Class)NFCNDEFTag;
  v12 = -[NFCNDEFTag init](&v23, sel_init);
  if (v12)
  {
    objc_msgSend(v8, "sessionId");
    v13 = objc_claimAutoreleasedReturnValue();
    sessionKey = v12->_sessionKey;
    v12->_sessionKey = (NSNumber *)v13;

    objc_storeStrong((id *)&v12->_tag, a4);
    objc_msgSend(v8, "sessionQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v15;

    objc_msgSend(v8, "hardwareManager");
    v17 = objc_claimAutoreleasedReturnValue();
    hardwareManager = v12->_hardwareManager;
    v12->_hardwareManager = (NFCHardwareManager *)v17;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCNDEFTag)initWithCoder:(id)a3
{
  id v5;
  NFCNDEFTag *v6;
  uint64_t v7;
  NFTag *tag;
  uint64_t v9;
  NSNumber *sessionKey;
  uint64_t v11;
  NFCHardwareManager *hardwareManager;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *delegateQueue;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v28;
  const char *Name;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NFCNDEFTag;
  v6 = -[NFCNDEFTag init](&v30, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v7 = objc_claimAutoreleasedReturnValue();
    tag = v6->_tag;
    v6->_tag = (NFTag *)v7;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    sessionKey = v6->_sessionKey;
    v6->_sessionKey = (NSNumber *)v9;

    if (!v6->_sessionKey)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("NFCNDEFTag.m"), 64, CFSTR("Missing session key"));

    }
    +[NFCHardwareManager sharedHardwareManager](NFCHardwareManager, "sharedHardwareManager");
    v11 = objc_claimAutoreleasedReturnValue();
    hardwareManager = v6->_hardwareManager;
    v6->_hardwareManager = (NFCHardwareManager *)v11;

    -[NFCHardwareManager getReaderSessionWithKey:](v6->_hardwareManager, "getReaderSessionWithKey:", v6->_sessionKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "sessionQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      delegateQueue = v6->_delegateQueue;
      v6->_delegateQueue = (OS_dispatch_queue *)v15;
    }
    else
    {
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v18 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v6);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        v22 = 45;
        if (isMetaClass)
          v22 = 43;
        v18(3, "%c[%{public}s %{public}s]:%i Session has been invalidated", v22, ClassName, Name, 69);
      }
      NFSharedLogGetLogger();
      delegateQueue = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(delegateQueue, OS_LOG_TYPE_ERROR))
      {
        v23 = object_getClass(v6);
        if (class_isMetaClass(v23))
          v24 = 43;
        else
          v24 = 45;
        v25 = object_getClassName(v6);
        v26 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v32 = v24;
        v33 = 2082;
        v34 = v25;
        v35 = 2082;
        v36 = v26;
        v37 = 1024;
        v38 = 69;
        _os_log_impl(&dword_215BBD000, delegateQueue, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session has been invalidated", buf, 0x22u);
      }
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NFTag *tag;
  id v5;

  tag = self->_tag;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tag, CFSTR("tag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionKey, CFSTR("sessionKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v8;
  void *v9;

  if (!self->_delegateQueue)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCNDEFTag.m"), 86, CFSTR("Nil delegateQueue"));

  }
  if (!self->_hardwareManager)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCNDEFTag.m"), 87, CFSTR("Nil hardwareManager"));

  }
  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v5, "_setTag:", self->_tag);
  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSession:", v6);

  objc_msgSend(v5, "_setDelegateQueue:", self->_delegateQueue);
  return v5;
}

- (BOOL)isAvailable
{
  void *v3;
  void *v4;
  char v5;

  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToNFTag:", self->_tag))
    v5 = objc_msgSend(v3, "checkPresenceWithError:", 0);
  else
    v5 = 0;

  return v5;
}

- (void)queryNDEFStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  NFCNDEFTag *v11;
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCNDEFTag queryNDEFStatusWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__NFCNDEFTag_queryNDEFStatusWithCompletionHandler___block_invoke;
  v9[3] = &unk_24D44FBB8;
  v11 = self;
  v12 = v4;
  v10 = v6;
  v7 = v4;
  v8 = v6;
  -[NFCNDEFTag dispatchBlockOnDelegateQueueAsync:](self, "dispatchBlockOnDelegateQueueAsync:", v9);

}

void __51__NFCNDEFTag_queryNDEFStatusWithCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  id v6;

  if (a1[4])
  {
    v2 = a1[5];
    if (*(_BYTE *)(v2 + 24))
    {
      v3 = 3;
    }
    else
    {
      v5 = objc_msgSend(*(id *)(v2 + 8), "ndefAvailability") - 2;
      if (v5 > 2)
        v3 = 1;
      else
        v3 = qword_215BFCE30[v5];
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1[6] + 16))(a1[6], v3, objc_msgSend(*(id *)(a1[5] + 8), "ndefContainerSize"), 0);
  }
  else
  {
    v4 = a1[6];
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v4 + 16))(v4, 1, 0, v6);

  }
}

- (void)readNDEFWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCNDEFTag readNDEFWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_24D44FA50;
    v8 = &v13;
    v9 = v6;
    v13 = v9;
    v14 = v4;
    v10 = v4;
    objc_msgSend(v9, "submitBlockOnSessionQueue:", v12);

  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke;
    v15[3] = &unk_24D44F8B0;
    v8 = &v16;
    v16 = v4;
    v11 = v4;
    -[NFCNDEFTag dispatchBlockOnDelegateQueueAsync:](self, "dispatchBlockOnDelegateQueueAsync:", v15);
  }

}

void __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v2, "readNdefMessageWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_24D44F8D8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v11 = v4;
  v12 = v6;
  v10 = v3;
  v7 = v4;
  v8 = v3;
  objc_msgSend(v5, "submitBlockOnDelegateQueue:", v9);

}

uint64_t __44__NFCNDEFTag_readNDEFWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)writeLockWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  _QWORD v13[2];
  id v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCNDEFTag writeLockWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_24D44FA78;
    v8 = (id *)v13;
    v9 = v6;
    v13[0] = v9;
    v13[1] = self;
    v14 = v4;
    v10 = v4;
    objc_msgSend(v9, "submitBlockOnSessionQueue:", v12);

  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke;
    v15[3] = &unk_24D44F8B0;
    v8 = &v16;
    v16 = v4;
    v11 = v4;
    -[NFCNDEFTag dispatchBlockOnDelegateQueueAsync:](self, "dispatchBlockOnDelegateQueueAsync:", v15);
  }

}

void __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "writeLockNdef");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_24D44F9D8;
  v4 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  objc_msgSend(v3, "submitBlockOnDelegateQueue:", v6);

}

uint64_t __45__NFCNDEFTag_writeLockWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)writeNDEF:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_215BBD000, "NFCNDEFTag writeNDEF:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke_2;
    v15[3] = &unk_24D44FA78;
    v11 = &v16;
    v12 = v9;
    v16 = v12;
    v17 = v6;
    v18 = v7;
    v13 = v7;
    objc_msgSend(v12, "submitBlockOnSessionQueue:", v15);

  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke;
    v19[3] = &unk_24D44F8B0;
    v11 = &v20;
    v20 = v7;
    v14 = v7;
    -[NFCNDEFTag dispatchBlockOnDelegateQueueAsync:](self, "dispatchBlockOnDelegateQueueAsync:", v19);
  }

}

void __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  objc_msgSend(v2, "writeNdefMessage:error:", v3, &v11);
  v4 = v11;
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke_3;
  v8[3] = &unk_24D44F9D8;
  v6 = *(id *)(a1 + 48);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  objc_msgSend(v5, "submitBlockOnDelegateQueue:", v8);

}

uint64_t __42__NFCNDEFTag_writeNDEF_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (void)_setSession:(id)a3
{
  NSNumber *v4;
  NSNumber *sessionKey;

  objc_msgSend(a3, "sessionId");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sessionKey = self->_sessionKey;
  self->_sessionKey = v4;

}

- (void)_setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (id)_updateNdefStatusWithSession:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  objc_msgSend(a3, "ndefStatus:maxMessageLength:", &v8, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    if (v8 <= 4)
      -[NFTag _setNDEFAvailability:](self->_tag, "_setNDEFAvailability:");
    -[NFTag _setNDEFContainerSize:](self->_tag, "_setNDEFContainerSize:", v9);
  }

  return v5;
}

- (id)_getInternalReaderSession
{
  void *v3;
  void *v4;
  id v5;

  -[NFCNDEFTag hardwareManager](self, "hardwareManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getReaderSessionWithKey:", self->_sessionKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_connectWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;

  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "currentTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToNFTag:", self->_tag);

    v9 = objc_msgSend(v6, "connectTag:error:", self->_tag, a3);
    v10 = v9;
    if ((v8 & 1) == 0 && v9)
    {
      -[NFCNDEFTag _updateNdefStatusWithSession:](self, "_updateNdefStatusWithSession:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (a3)
        *a3 = objc_retainAutorelease(v11);

    }
  }
  else if (a3)
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_connectWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NFTag *tag;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  char v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "currentTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToNFTag:", self->_tag) ^ 1;

    tag = self->_tag;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __44__NFCNDEFTag__connectWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_24D44FBE0;
    v16 = v8;
    v13[4] = self;
    v14 = v6;
    v15 = v4;
    v10 = v4;
    objc_msgSend(v14, "connectTag:completionHandler:", tag, v13);

    v11 = v14;
  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __44__NFCNDEFTag__connectWithCompletionHandler___block_invoke;
    v17[3] = &unk_24D44F8B0;
    v18 = v4;
    v12 = v4;
    -[NFCNDEFTag dispatchBlockOnDelegateQueueAsync:](self, "dispatchBlockOnDelegateQueueAsync:", v17);
    v11 = v18;
  }

}

void __44__NFCNDEFTag__connectWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __44__NFCNDEFTag__connectWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (!v3 && *(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateNdefStatusWithSession:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)_disconnectWithError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;

  -[NFCNDEFTag _getInternalReaderSession](self, "_getInternalReaderSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "disconnectTagWithError:", a3);
  }
  else if (a3)
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isMatchingSession:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  NSNumber *sessionKey;
  void *v9;
  BOOL v10;

  v6 = a3;
  objc_msgSend(v6, "sessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!a4)
    {
      v10 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sessionKey = self->_sessionKey;
  objc_msgSend(v6, "sessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSNumber isEqualToNumber:](sessionKey, "isEqualToNumber:", v9);

  if (a4 && !v10)
  {
LABEL_6:
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v10;
}

- (void)dispatchBlockOnDelegateQueueAsync:(id)a3
{
  OS_dispatch_queue *delegateQueue;
  id v6;
  NSObject *v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  delegateQueue = self->_delegateQueue;
  v6 = a3;
  if (delegateQueue)
  {
    v7 = delegateQueue;
  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Session queue is not available; dispatching on main queue",
        v13,
        ClassName,
        Name,
        330);
    }
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v19 = v16;
      v20 = 2082;
      v21 = object_getClassName(self);
      v22 = 2082;
      v23 = sel_getName(a2);
      v24 = 1024;
      v25 = 330;
      _os_log_impl(&dword_215BBD000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is not available; dispatching on main queue",
        buf,
        0x22u);
    }

    v7 = MEMORY[0x24BDAC9B8];
  }
  dispatch_async(v7, v6);

}

- (NFCHardwareManager)hardwareManager
{
  return self->_hardwareManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareManager, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
