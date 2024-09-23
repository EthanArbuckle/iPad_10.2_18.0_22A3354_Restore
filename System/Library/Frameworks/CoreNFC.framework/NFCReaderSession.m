@implementation NFCReaderSession

- (void)dealloc
{
  objc_super v3;

  if (self->_sessionId)
    -[NFCReaderSession cleanupNFCHardwareManagerRegistration](self, "cleanupNFCHardwareManagerRegistration");
  v3.receiver = self;
  v3.super_class = (Class)NFCReaderSession;
  -[NFCReaderSession dealloc](&v3, sel_dealloc);
}

- (BOOL)isReady
{
  NFCReaderSession *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (unint64_t)(v2->_sessionState - 2) < 3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isInvalidated
{
  NFCReaderSession *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (unint64_t)(v2->_sessionState - 5) < 3;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)alertMessage
{
  NFCReaderSession *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_alertMessage;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAlertMessage:(id)a3
{
  id v5;
  NSObject *v6;
  NFCReaderSession *v7;
  uint64_t v8;
  NSString *alertMessage;
  NFReaderSessionInterface *proxy;
  uint64_t v11;
  void *v12;
  NSString *v13;
  _QWORD v14[6];
  _QWORD v15[6];
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_215BBD000, "NFCReaderSession setAlertMessage:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v7 = self;
  objc_sync_enter(v7);
  v8 = objc_msgSend(v5, "copy");
  alertMessage = v7->_alertMessage;
  v7->_alertMessage = (NSString *)v8;

  proxy = v7->_proxy;
  v11 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __36__NFCReaderSession_setAlertMessage___block_invoke;
  v15[3] = &unk_24D44FF30;
  v15[4] = v7;
  v15[5] = a2;
  -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](proxy, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7->_alertMessage;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __36__NFCReaderSession_setAlertMessage___block_invoke_9;
  v14[3] = &unk_24D44FF30;
  v14[4] = v7;
  v14[5] = a2;
  objc_msgSend(v12, "updateSharingUIScanText:completion:", v13, v14);

  objc_sync_exit(v7);
}

void __36__NFCReaderSession_setAlertMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    v8 = 45;
    if (isMetaClass)
      v8 = 43;
    v5(4, "%c[%{public}s %{public}s]:%i XPC error: %@", v8, ClassName, Name, 99, v3);
  }
  NFSharedLogGetLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10))
      v11 = 43;
    else
      v11 = 45;
    v12 = object_getClassName(*(id *)(a1 + 32));
    v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v17 = v11;
    v18 = 2082;
    v19 = v12;
    v20 = 2082;
    v21 = v13;
    v22 = 1024;
    v23 = 99;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC error: %@", buf, 0x2Cu);
  }

}

void __36__NFCReaderSession_setAlertMessage___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  const __CFString *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    if (v3)
      v10 = CFSTR("no error");
    else
      v10 = 0;
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i %@", v11, ClassName, Name, 101, v10);
  }
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    if (v3)
      v17 = CFSTR("no error");
    else
      v17 = 0;
    v19 = v14;
    v20 = 2082;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 1024;
    v25 = 101;
    v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_215BBD000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

}

- (void)invalidateSession
{
  NSObject *v3;
  os_activity_scope_state_s v4;

  v3 = _os_activity_create(&dword_215BBD000, "NFCReaderSession invalidateSession", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  os_activity_scope_leave(&v4);

  -[NFCReaderSession invalidateSessionWithReason:](self, "invalidateSessionWithReason:", 200);
}

- (void)invalidateSessionWithErrorMessage:(id)a3
{
  id v4;
  NSObject *v5;
  os_activity_scope_state_s v6;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCReaderSession invalidateSessionWithErrorMessage:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  os_activity_scope_leave(&v6);

  -[NFCReaderSession _invalidateSessionWithCode:message:finalUIState:activateCallback:](self, "_invalidateSessionWithCode:message:finalUIState:activateCallback:", 200, v4, 2, 0);
}

- (void)_callbackDidBecomeActive
{
  void *v4;
  char v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  int64_t v16;
  _QWORD v17[5];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (self->_delegateType == 1
    && (-[NFCReaderSession delegate](self, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __44__NFCReaderSession__callbackDidBecomeActive__block_invoke;
    v17[3] = &unk_24D44FB90;
    v17[4] = self;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v17);
  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = -[NFCReaderSession delegateType](self, "delegateType");
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v7(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v12, ClassName, Name, 145, v16);
    }
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      *(_DWORD *)buf = 67110146;
      v19 = v15;
      v20 = 2082;
      v21 = object_getClassName(self);
      v22 = 2082;
      v23 = sel_getName(a2);
      v24 = 1024;
      v25 = 145;
      v26 = 2048;
      v27 = -[NFCReaderSession delegateType](self, "delegateType");
      _os_log_impl(&dword_215BBD000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", buf, 0x2Cu);
    }

  }
}

void __44__NFCReaderSession__callbackDidBecomeActive__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readerSessionDidBecomeActive:", *(_QWORD *)(a1 + 32));

}

- (void)didStartSession:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, id);
  NFCReaderSession *v8;
  _QWORD v9[5];
  void (**v10)(void *, id);
  _QWORD aBlock[4];
  id v12;
  NFCReaderSession *v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__NFCReaderSession_didStartSession___block_invoke;
  aBlock[3] = &unk_24D44FF58;
  v6 = v4;
  v12 = v6;
  v13 = self;
  v7 = (void (**)(void *, id))_Block_copy(aBlock);
  v8 = self;
  objc_sync_enter(v8);
  if (v6)
  {
    v7[2](v7, v6);
  }
  else
  {
    v8->_sessionState = 2;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __36__NFCReaderSession_didStartSession___block_invoke_2;
    v9[3] = &unk_24D44FA50;
    v9[4] = v8;
    v10 = v7;
    -[NFCReaderSession submitBlockOnSessionQueue:](v8, "submitBlockOnSessionQueue:", v9);

  }
  objc_sync_exit(v8);

}

uint64_t __36__NFCReaderSession_didStartSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "code");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (v4 <= 0x20 && ((1 << v4) & 0x100000500) != 0)
    {
      v4 = 2;
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "code") == 2)
    {
      v4 = 203;
    }
    else
    {
      v4 = 202;
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateSessionWithCode:message:finalUIState:activateCallback:", v4, 0, 0, 1);
}

void __36__NFCReaderSession_didStartSession___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[11];
  v5 = v3[12];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__NFCReaderSession_didStartSession___block_invoke_3;
  v7[3] = &unk_24D44FF80;
  v6 = v2;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v3, "_startPollingWithMethod:sessionConfig:completionHandler:", v4, v5, v7);

}

uint64_t __36__NFCReaderSession_didStartSession___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;

  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 40) == 2)
    *(_QWORD *)(v5 + 40) = 3;
  objc_sync_exit(v4);

  return objc_msgSend(*(id *)(a1 + 32), "_callbackDidBecomeActive");
}

- (void)handleSessionResumed
{
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *Name;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(4, "%c[%{public}s %{public}s]:%i Not implemented", v9, ClassName, Name, 197);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(self);
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    *(_DWORD *)buf = 67109890;
    v15 = v12;
    v16 = 2082;
    v17 = object_getClassName(self);
    v18 = 2082;
    v19 = sel_getName(a2);
    v20 = 1024;
    v21 = 197;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not implemented", buf, 0x22u);
  }

}

- (void)handleSessionSuspended:(id)a3
{
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *Name;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(4, "%c[%{public}s %{public}s]:%i Not implemented", v10, ClassName, Name, 203);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    *(_DWORD *)buf = 67109890;
    v16 = v13;
    v17 = 2082;
    v18 = object_getClassName(self);
    v19 = 2082;
    v20 = sel_getName(a2);
    v21 = 1024;
    v22 = 203;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not implemented", buf, 0x22u);
  }

}

- (void)didTerminate:(id)a3
{
  id v5;
  NFCReaderSession *v6;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  const __CFString *v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  int64_t sessionState;
  const __CFString *v19;
  uint64_t v20;
  NFReaderSessionInterface *proxy;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v6);
    if (class_isMetaClass(Class))
      v9 = 43;
    else
      v9 = 45;
    ClassName = object_getClassName(v6);
    Name = sel_getName(a2);
    if (v6->_proxy)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    Logger(5, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@, error=%@", v9, ClassName, Name, 209, v6->_sessionState, v12, v5);
  }
  NFSharedLogGetLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(v6);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(v6);
    v17 = sel_getName(a2);
    sessionState = v6->_sessionState;
    if (v6->_proxy)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    *(_DWORD *)buf = 67110658;
    v23 = v15;
    v24 = 2082;
    v25 = v16;
    v26 = 2082;
    v27 = v17;
    v28 = 1024;
    v29 = 209;
    v30 = 2048;
    v31 = sessionState;
    v32 = 2112;
    v33 = v19;
    v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_215BBD000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@, error=%@", buf, 0x40u);
  }

  if (objc_msgSend(v5, "code") == 64)
  {
    v20 = 203;
  }
  else if (objc_msgSend(v5, "code") == 5)
  {
    v20 = 201;
  }
  else
  {
    v20 = 202;
  }
  v6->_invalidationCode = v20;
  proxy = v6->_proxy;
  v6->_proxy = 0;
  v6->_sessionState = 7;

  -[NFCReaderSession cleanupNFCHardwareManagerRegistration](v6, "cleanupNFCHardwareManagerRegistration");
  objc_sync_exit(v6);

}

- (void)didUIControllerInvalidate:(id)a3
{
  id v5;
  NFCReaderSession *v6;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  const __CFString *v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  int64_t sessionState;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  NFReaderSessionInterface *proxy;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v6);
    if (class_isMetaClass(Class))
      v9 = 43;
    else
      v9 = 45;
    ClassName = object_getClassName(v6);
    Name = sel_getName(a2);
    if (v6->_proxy)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    Logger(5, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@", v9, ClassName, Name, 230, v6->_sessionState, v12);
  }
  NFSharedLogGetLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(v6);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(v6);
    v17 = sel_getName(a2);
    sessionState = v6->_sessionState;
    if (v6->_proxy)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    *(_DWORD *)buf = 67110402;
    v24 = v15;
    v25 = 2082;
    v26 = v16;
    v27 = 2082;
    v28 = v17;
    v29 = 1024;
    v30 = 230;
    v31 = 2048;
    v32 = sessionState;
    v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_215BBD000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@", buf, 0x36u);
  }

  if ((v6->_sessionState | 2) != 7)
  {
    v20 = objc_msgSend(v5, "code");
    v21 = 202;
    if (v20 == 48)
      v21 = 200;
    v6->_invalidationCode = v21;
  }
  -[NFCReaderSession _invalidateSessionAndActivateCallbackWithCode:](v6, "_invalidateSessionAndActivateCallbackWithCode:", v6->_invalidationCode);
  -[NFCReaderSession cleanupNFCHardwareManagerRegistration](v6, "cleanupNFCHardwareManagerRegistration");
  proxy = v6->_proxy;
  v6->_proxy = 0;

  objc_sync_exit(v6);
}

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  id v7;
  NFCReaderSession *v8;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v11;
  const char *ClassName;
  const char *Name;
  NFTag *currentTag;
  __CFString *v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  NFTag *v21;
  __CFString *v22;
  uint64_t v23;
  NFTag *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  NFTag *v35;
  const char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint32_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  NFTag *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(v8);
    v11 = class_isMetaClass(Class) ? 43 : 45;
    ClassName = object_getClassName(v8);
    Name = sel_getName(a2);
    currentTag = v8->_currentTag;
    if (currentTag)
    {
      -[NFTag description](v8->_currentTag, "description");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("None");
    }
    Logger(6, "%c[%{public}s %{public}s]:%i Current connectedTag: %@", v11, ClassName, Name, 251, v15);
    if (currentTag)

  }
  NFSharedLogGetLogger();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(v8);
    v18 = class_isMetaClass(v17) ? 43 : 45;
    v19 = object_getClassName(v8);
    v20 = sel_getName(a2);
    v21 = v8->_currentTag;
    if (v21)
    {
      -[NFTag description](v8->_currentTag, "description");
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = CFSTR("None");
    }
    *(_DWORD *)buf = 67110146;
    v50 = v18;
    v51 = 2082;
    v52 = v19;
    v53 = 2082;
    v54 = v20;
    v55 = 1024;
    v56 = 251;
    v57 = 2112;
    v58 = (unint64_t)v22;
    _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Current connectedTag: %@", buf, 0x2Cu);
    if (v21)

  }
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v7, "count") <= a4)
    {
      v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v40)
      {
        v41 = object_getClass(v8);
        if (class_isMetaClass(v41))
          v42 = 43;
        else
          v42 = 45;
        v43 = object_getClassName(v8);
        v44 = sel_getName(a2);
        v40(3, "%c[%{public}s %{public}s]:%i Invalid tag index: %ld", v42, v43, v44, 257, a4);
      }
      NFSharedLogGetLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      v45 = object_getClass(v8);
      if (class_isMetaClass(v45))
        v46 = 43;
      else
        v46 = 45;
      v47 = object_getClassName(v8);
      v48 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v50 = v46;
      v51 = 2082;
      v52 = v47;
      v53 = 2082;
      v54 = v48;
      v55 = 1024;
      v56 = 257;
      v57 = 2048;
      v58 = a4;
      v36 = "%c[%{public}s %{public}s]:%i Invalid tag index: %ld";
      v37 = v30;
      v38 = OS_LOG_TYPE_ERROR;
      v39 = 44;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndex:", a4);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v8->_currentTag;
      v8->_currentTag = (NFTag *)v23;

      v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25)
      {
        v26 = object_getClass(v8);
        if (class_isMetaClass(v26))
          v27 = 43;
        else
          v27 = 45;
        v28 = object_getClassName(v8);
        v29 = sel_getName(a2);
        v25(6, "%c[%{public}s %{public}s]:%i ConnectedTag[%ld]: %@", v27, v28, v29, 255, a4, v8->_currentTag);
      }
      NFSharedLogGetLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        goto LABEL_42;
      v31 = object_getClass(v8);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(v8);
      v34 = sel_getName(a2);
      v35 = v8->_currentTag;
      *(_DWORD *)buf = 67110402;
      v50 = v32;
      v51 = 2082;
      v52 = v33;
      v53 = 2082;
      v54 = v34;
      v55 = 1024;
      v56 = 255;
      v57 = 2048;
      v58 = a4;
      v59 = 2112;
      v60 = v35;
      v36 = "%c[%{public}s %{public}s]:%i ConnectedTag[%ld]: %@";
      v37 = v30;
      v38 = OS_LOG_TYPE_DEFAULT;
      v39 = 54;
    }
    _os_log_impl(&dword_215BBD000, v37, v38, v36, buf, v39);
LABEL_42:

  }
  v8->_sessionState = 4;
  objc_sync_exit(v8);

}

- (void)didDetectExternalReaderWithNotification:(id)a3
{
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *Name;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(5, "%c[%{public}s %{public}s]:%i External reader detected", v10, ClassName, Name, 274);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    *(_DWORD *)buf = 67109890;
    v16 = v13;
    v17 = 2082;
    v18 = object_getClassName(self);
    v19 = 2082;
    v20 = sel_getName(a2);
    v21 = 1024;
    v22 = 274;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i External reader detected", buf, 0x22u);
  }

  -[NFCReaderSession _invalidateSessionWithCode:](self, "_invalidateSessionWithCode:", 203);
}

- (void)hwStateDidChange:(unsigned int)a3
{
  NFCReaderSession *obj;

  obj = self;
  objc_sync_enter(obj);
  if (a3 == 4)
    -[NFCReaderSession _invalidateSessionWithCode:](obj, "_invalidateSessionWithCode:", 1);
  objc_sync_exit(obj);

}

- (void)didInvalidate
{
  NFCReaderSession *v3;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v6;
  const char *ClassName;
  const char *Name;
  NSObject *v9;
  objc_class *v10;
  int v11;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const __CFString *v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  int64_t sessionState;
  const __CFString *v24;
  NFReaderSessionInterface *proxy;
  uint64_t invalidationCode;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_sessionState == 6)
  {
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v3);
      if (class_isMetaClass(Class))
        v6 = 43;
      else
        v6 = 45;
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      Logger(5, "%c[%{public}s %{public}s]:%i Drop XPC interrupt callback", v6, ClassName, Name, 303);
    }
    NFSharedLogGetLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = object_getClass(v3);
      if (class_isMetaClass(v10))
        v11 = 43;
      else
        v11 = 45;
      *(_DWORD *)buf = 67109890;
      v28 = v11;
      v29 = 2082;
      v30 = object_getClassName(v3);
      v31 = 2082;
      v32 = sel_getName(a2);
      v33 = 1024;
      v34 = 303;
      _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Drop XPC interrupt callback", buf, 0x22u);
    }

  }
  else
  {
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
    {
      v13 = object_getClass(v3);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(v3);
      v16 = sel_getName(a2);
      if (v3->_proxy)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v12(5, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@", v14, v15, v16, 307, v3->_sessionState, v17);
    }
    NFSharedLogGetLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = object_getClass(v3);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      v21 = object_getClassName(v3);
      v22 = sel_getName(a2);
      sessionState = v3->_sessionState;
      if (v3->_proxy)
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      *(_DWORD *)buf = 67110402;
      v28 = v20;
      v29 = 2082;
      v30 = v21;
      v31 = 2082;
      v32 = v22;
      v33 = 1024;
      v34 = 307;
      v35 = 2048;
      v36 = sessionState;
      v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_215BBD000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sessionState=%ld, proxy=%@", buf, 0x36u);
    }

    proxy = v3->_proxy;
    v3->_proxy = 0;

    if (v3->_invalidationCode)
      invalidationCode = v3->_invalidationCode;
    else
      invalidationCode = 202;
    -[NFCReaderSession _invalidateSessionAndActivateCallbackWithCode:](v3, "_invalidateSessionAndActivateCallbackWithCode:", invalidationCode);
    v3->_sessionState = 6;
    -[NFCReaderSession cleanupNFCHardwareManagerRegistration](v3, "cleanupNFCHardwareManagerRegistration");
  }
  objc_sync_exit(v3);

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (dispatch_queue_t)sessionQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (void)submitBlockOnSessionQueue:(id)a3
{
  id v5;
  NSObject *sessionQueue;
  void *v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  void *v17;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sessionQueue = self->_sessionQueue;
  if (sessionQueue
    || (objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCReaderSession.m"), 333, CFSTR("Session queue is nil")), v7, (sessionQueue = self->_sessionQueue) != 0))
  {
    dispatch_async(sessionQueue, v5);
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
      v9(3, "%c[%{public}s %{public}s]:%i Session queue is nil", v13, ClassName, Name, 335);
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
      v20 = v16;
      v21 = 2082;
      v22 = object_getClassName(self);
      v23 = 2082;
      v24 = sel_getName(a2);
      v25 = 1024;
      v26 = 335;
      _os_log_impl(&dword_215BBD000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is nil", buf, 0x22u);
    }

    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCReaderSession.m"), 336, CFSTR("Session queue is nil"));

  }
}

- (void)submitBlockOnSessionQueueWithDelay:(unint64_t)a3 block:(id)a4
{
  id v7;
  NSObject *sessionQueue;
  void *v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  void *v19;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  sessionQueue = self->_sessionQueue;
  if (sessionQueue
    || (objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCReaderSession.m"), 344, CFSTR("Session queue is nil")), v9, (sessionQueue = self->_sessionQueue) != 0))
  {
    dispatch_after(a3, sessionQueue, v7);
  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Session queue is nil", v15, ClassName, Name, 346);
    }
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v22 = v18;
      v23 = 2082;
      v24 = object_getClassName(self);
      v25 = 2082;
      v26 = sel_getName(a2);
      v27 = 1024;
      v28 = 346;
      _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is nil", buf, 0x22u);
    }

    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCReaderSession.m"), 347, CFSTR("Session queue is nil"));

  }
}

- (void)submitBlockOnDelegateQueue:(id)a3
{
  id v5;
  NSObject *delegateQueue;
  void *v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  void *v17;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  delegateQueue = self->_delegateQueue;
  if (delegateQueue
    || (objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCReaderSession.m"), 355, CFSTR("Delegate queue is nil")), v7, (delegateQueue = self->_delegateQueue) != 0))
  {
    dispatch_group_notify((dispatch_group_t)self->_sessionStartInProgress, delegateQueue, v5);
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
      v9(3, "%c[%{public}s %{public}s]:%i Session queue is nil", v13, ClassName, Name, 357);
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
      v20 = v16;
      v21 = 2082;
      v22 = object_getClassName(self);
      v23 = 2082;
      v24 = sel_getName(a2);
      v25 = 1024;
      v26 = 357;
      _os_log_impl(&dword_215BBD000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session queue is nil", buf, 0x22u);
    }

    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFCReaderSession.m"), 358, CFSTR("Session queue is nil"));

  }
}

- (void)beginSession
{
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  NFCReaderSession *v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  unint64_t pollMethod;
  uint64_t v27;
  unint64_t sessionConfig;
  uint64_t v29;
  void *v30;
  const char *Name;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 367);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = object_getClass(self);
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    *(_DWORD *)buf = 67109890;
    v33 = v12;
    v34 = 2082;
    v35 = object_getClassName(self);
    v36 = 2082;
    v37 = sel_getName(a2);
    v38 = 1024;
    v39 = 367;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v13 = self;
  objc_sync_enter(v13);
  v14 = v13->_delegateType - 1;
  if (v14 >= 6)
  {
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
    {
      v17 = object_getClass(v13);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(v13);
      v20 = sel_getName(a2);
      v16(4, "%c[%{public}s %{public}s]:%i Defaulting to CoreNFCSessionTypeUnknown", v18, v19, v20, 386);
    }
    NFSharedLogGetLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(v13);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(v13);
      v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v33 = v23;
      v34 = 2082;
      v35 = v24;
      v36 = 2082;
      v37 = v25;
      v38 = 1024;
      v39 = 386;
      _os_log_impl(&dword_215BBD000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Defaulting to CoreNFCSessionTypeUnknown", buf, 0x22u);
    }

    v15 = 4;
  }
  else
  {
    v15 = qword_215BFCE88[v14];
  }
  pollMethod = v13->_pollMethod;
  if ((pollMethod & 2) != 0)
  {
    sessionConfig = v13->_sessionConfig;
    v29 = 1;
    if ((sessionConfig & 0x40) == 0)
      v29 = 2;
    if ((sessionConfig & 0x10) != 0)
      v27 = 3;
    else
      v27 = v29;
  }
  else if ((pollMethod & 0x1C) != 0)
  {
    v27 = 3;
  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(MEMORY[0x24BEDCD78], "sessionConfigWithUIMode:sessionType:initialScanText:vasPass:", v27, v15, v13->_alertMessage, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFCReaderSession beginSessionWithConfig:](v13, "beginSessionWithConfig:", v30);

  objc_sync_exit(v13);
}

- (void)beginSessionWithConfig:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t pollMethod;
  _QWORD v9[5];
  id v10;
  SEL v11;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_215BBD000, "NFCReaderSession beginSessionWithConfig:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)(self->_sessionState - 5) > 1)
  {
    pollMethod = self->_pollMethod;
    if ((pollMethod & 0xFFFFFFFFFFFFFFE1) != 0 || (pollMethod & 0x1C) != 0 && (pollMethod & 2) != 0)
    {
      -[NFCReaderSession _resumeDelegateQueue](self, "_resumeDelegateQueue");
      -[NFCReaderSession _invalidateSessionAndActivateCallbackWithCode:](self, "_invalidateSessionAndActivateCallbackWithCode:", 1);
    }
    else if (!self->_proxy)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __43__NFCReaderSession_beginSessionWithConfig___block_invoke;
      v9[3] = &unk_24D44FDD8;
      v9[4] = self;
      v11 = a2;
      v10 = v5;
      -[NFCReaderSession submitBlockOnSessionQueue:](self, "submitBlockOnSessionQueue:", v9);

    }
  }
  else
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", self->_invalidationCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFCReaderSession _callbackDidInvalidateWithError:](self, "_callbackDidInvalidateWithError:", v7);

  }
}

void __43__NFCReaderSession_beginSessionWithConfig___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "hardwareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__NFCReaderSession_beginSessionWithConfig___block_invoke_2;
  v5[3] = &unk_24D44FFD0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "areFeaturesSupported:expiry:completion:", 1, v5, 30.0);

}

void __43__NFCReaderSession_beginSessionWithConfig___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    v5[5] = 1;
    objc_msgSend(*(id *)(a1 + 32), "_resumeDelegateQueue");
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v19 = objc_msgSend(v4, "code");
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i error:%@, errorCode: 0x%lx", v12, ClassName, Name, 447, v4, v19);
    }
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      v16 = object_getClassName(*(id *)(a1 + 32));
      v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110402;
      v21 = v15;
      v22 = 2082;
      v23 = v16;
      v24 = 2082;
      v25 = v17;
      v26 = 1024;
      v27 = 447;
      v28 = 2112;
      v29 = v4;
      v30 = 2048;
      v31 = objc_msgSend(v4, "code");
      _os_log_impl(&dword_215BBD000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error:%@, errorCode: 0x%lx", buf, 0x36u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_invalidateSessionAndActivateCallbackWithCode:", objc_msgSend(v4, "code"));
  }
  else
  {
    objc_msgSend(v5, "hardwareManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "queueReaderSession:sessionConfig:completionHandler:");

  }
}

void __43__NFCReaderSession_beginSessionWithConfig___block_invoke_45(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  const char *Name;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_resumeDelegateQueue");
  if (v11)
  {
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("NFCError"));

    if (v13)
    {
      v14 = objc_msgSend(v11, "code");
    }
    else
    {
      objc_msgSend(v11, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD0B88]);

      if ((v18 & 1) != 0)
      {
        v14 = 202;
      }
      else
      {
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v20 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 40));
          v24 = 45;
          if (isMetaClass)
            v24 = 43;
          v20(4, "%c[%{public}s %{public}s]:%i Unexpected error type", v24, ClassName, Name, 466);
        }
        NFSharedLogGetLogger();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v26))
            v27 = 43;
          else
            v27 = 45;
          v28 = object_getClassName(*(id *)(a1 + 32));
          v29 = sel_getName(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 67109890;
          v42 = v27;
          v43 = 2082;
          v44 = v28;
          v45 = 2082;
          v46 = v29;
          v47 = 1024;
          v48 = 466;
          _os_log_impl(&dword_215BBD000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected error type", buf, 0x22u);
        }

        v14 = 1;
      }
    }
    v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30)
    {
      v31 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(*(id *)(a1 + 32));
      v34 = sel_getName(*(SEL *)(a1 + 40));
      v30(3, "%c[%{public}s %{public}s]:%i error:%@, errorCode: 0x%lx", v32, v33, v34, 468, v11, v14);
    }
    NFSharedLogGetLogger();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      v38 = object_getClassName(*(id *)(a1 + 32));
      v39 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110402;
      v42 = v37;
      v43 = 2082;
      v44 = v38;
      v45 = 2082;
      v46 = v39;
      v47 = 1024;
      v48 = 468;
      v49 = 2112;
      v50 = v11;
      v51 = 2048;
      v52 = v14;
      _os_log_impl(&dword_215BBD000, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error:%@, errorCode: 0x%lx", buf, 0x36u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_invalidateSessionAndActivateCallbackWithCode:", v14);
  }
  else
  {
    v15 = *(id *)(a1 + 32);
    objc_sync_enter(v15);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), a4);
    objc_msgSend(*(id *)(a1 + 32), "hardwareManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addNFCHardwareManagerCallbacksListener:", *(_QWORD *)(a1 + 32));

    objc_sync_exit(v15);
  }

}

- (NFCReaderSession)initWithDelegate:(id)a3 queue:(id)a4 pollMethod:(unint64_t)a5
{
  return -[NFCReaderSession initWithDelegate:sessionDelegateType:queue:pollMethod:sessionConfig:](self, "initWithDelegate:sessionDelegateType:queue:pollMethod:sessionConfig:", a3, 0, a4, a5, 0);
}

- (NFCReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
{
  id v13;
  id v14;
  NFCReaderSession *v15;
  NFCReaderSession *v16;
  uint64_t v17;
  NFCHardwareManager *hardwareManager;
  const void **v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *delegateQueue;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *sessionQueue;
  dispatch_group_t v26;
  OS_dispatch_group *sessionStartInProgress;
  NSObject *v28;
  NFCReaderSession *v29;
  uint64_t Logger;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  const char *Name;
  objc_super v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v43.receiver = self;
  v43.super_class = (Class)NFCReaderSession;
  v15 = -[NFCReaderSession init](&v43, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_10;
  if (!-[NFCReaderSession validateDelegate:expectedType:](v15, "validateDelegate:expectedType:", v13, a4))
  {
LABEL_21:
    v29 = 0;
    goto LABEL_22;
  }
  +[NFCHardwareManager sharedHardwareManager](NFCHardwareManager, "sharedHardwareManager");
  v17 = objc_claimAutoreleasedReturnValue();
  hardwareManager = v16->_hardwareManager;
  v16->_hardwareManager = (NFCHardwareManager *)v17;

  v16->_delegateType = a4;
  objc_storeWeak(&v16->_delegate, v13);
  v19 = (const void **)MEMORY[0x24BEDCDB0];
  if (v14)
  {
    objc_storeStrong((id *)&v16->_delegateQueue, a5);
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.corenfc.readersession.delegate", v20);
    delegateQueue = v16->_delegateQueue;
    v16->_delegateQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_set_specific((dispatch_queue_t)v16->_delegateQueue, *v19, (void *)1, 0);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = dispatch_queue_create("com.apple.corenfc.readersession", v23);
  sessionQueue = v16->_sessionQueue;
  v16->_sessionQueue = (OS_dispatch_queue *)v24;

  dispatch_queue_set_specific((dispatch_queue_t)v16->_sessionQueue, *v19, (void *)1, 0);
  v16->_pollMethod = a6;
  v16->_sessionConfig = a7;
  v26 = dispatch_group_create();
  sessionStartInProgress = v16->_sessionStartInProgress;
  v16->_sessionStartInProgress = (OS_dispatch_group *)v26;

  if (!v16->_delegateQueue || !v16->_sessionQueue || (v28 = v16->_sessionStartInProgress) == 0)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v31 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v16);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v16);
      Name = sel_getName(a2);
      v35 = 45;
      if (isMetaClass)
        v35 = 43;
      v31(3, "%c[%{public}s %{public}s]:%i Dispatch resource init failed", v35, ClassName, Name, 535);
    }
    NFSharedLogGetLogger();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = object_getClass(v16);
      if (class_isMetaClass(v37))
        v38 = 43;
      else
        v38 = 45;
      v39 = object_getClassName(v16);
      v40 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v45 = v38;
      v46 = 2082;
      v47 = v39;
      v48 = 2082;
      v49 = v40;
      v50 = 1024;
      v51 = 535;
      _os_log_impl(&dword_215BBD000, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Dispatch resource init failed", buf, 0x22u);
    }

    goto LABEL_21;
  }
  dispatch_group_enter(v28);
  v16->_sessionState = 0;
LABEL_10:
  v29 = v16;
LABEL_22:

  return v29;
}

- (void)_resumeDelegateQueue
{
  NFCReaderSession *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_delegateQueueStarted)
  {
    dispatch_group_leave((dispatch_group_t)obj->_sessionStartInProgress);
    obj->_delegateQueueStarted = 1;
  }
  objc_sync_exit(obj);

}

- (void)cleanupNFCHardwareManagerRegistration
{
  id v3;

  -[NFCReaderSession hardwareManager](self, "hardwareManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueSession:", self);

}

- (BOOL)validateDelegate:(id)a3 expectedType:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  const __CFString *v11;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (a4 == 1)
  {
    v9 = &unk_254E042F8;
  }
  else
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
      goto LABEL_7;
    v9 = &unk_254E01F38;
  }
  if ((objc_msgSend(v7, "conformsToProtocol:", v9) & 1) != 0)
  {
LABEL_6:
    v10 = 1;
    goto LABEL_27;
  }
LABEL_7:
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_254E04238))
  {
    v10 = 1;
    switch(a4)
    {
      case 0:
        goto LABEL_13;
      case 1:
        goto LABEL_14;
      case 2:
      case 3:
        goto LABEL_10;
      case 4:
      case 5:
        break;
      case 6:
        goto LABEL_15;
      default:
        goto LABEL_11;
    }
  }
  else
  {
    switch(a4)
    {
      case 0:
LABEL_13:
        v11 = CFSTR("UNKNOWN");
        break;
      case 1:
LABEL_14:
        v11 = CFSTR("NFCReaderSessionDelegate");
        break;
      case 2:
      case 3:
LABEL_10:
        v11 = CFSTR("NFCTagReaderSessionDelegate");
        break;
      case 4:
      case 5:
        v11 = CFSTR("NFCNDEFReaderSessionDelegate");
        break;
      case 6:
LABEL_15:
        if ((objc_msgSend(v8, "conformsToProtocol:", &unk_254E04358) & 1) != 0)
          goto LABEL_6;
        v11 = CFSTR("NFCVASReaderSessionDelegate");
        break;
      default:
LABEL_11:
        v11 = 0;
        break;
    }
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Delegate object does not conform to %@ protocol", v16, ClassName, Name, 604, v11);
    }
    NFSharedLogGetLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      *(_DWORD *)buf = 67110146;
      v24 = v19;
      v25 = 2082;
      v26 = object_getClassName(self);
      v27 = 2082;
      v28 = sel_getName(a2);
      v29 = 1024;
      v30 = 604;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_215BBD000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Delegate object does not conform to %@ protocol", buf, 0x2Cu);
    }

    v10 = 0;
  }
LABEL_27:

  return v10;
}

- (void)_startPollingWithMethod:(unint64_t)a3 sessionConfig:(unint64_t)a4 completionHandler:(id)a5
{
  NFCReaderSession *v9;
  NFReaderSessionInterface *proxy;
  NFCReaderSession *v11;
  NFReaderSessionInterface *v12;
  void *v13;
  void (**v14)(id, NFCReaderSession *);

  v14 = (void (**)(id, NFCReaderSession *))a5;
  v9 = self;
  objc_sync_enter(v9);
  proxy = v9->_proxy;
  if (!v14 || proxy)
  {
    v12 = proxy;
    objc_sync_exit(v9);

    if ((a3 & 0x1C) != 0)
    {
      -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v12, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
      v9 = (NFCReaderSession *)objc_claimAutoreleasedReturnValue();
      -[NFCReaderSession startPollingForTags:sessionConfig:completion:](v9, "startPollingForTags:sessionConfig:completion:", a3, a4, v14);
    }
    else if ((a3 & 2) != 0)
    {
      -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v12, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
      v9 = (NFCReaderSession *)objc_claimAutoreleasedReturnValue();
      -[NFCReaderSession startPollingForNDEFMessagesWithSessionConfig:completion:](v9, "startPollingForNDEFMessagesWithSessionConfig:completion:", a4, v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("NFCReaderSession.m"), 625, CFSTR("Unsupported poll mode"));

      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
      v9 = (NFCReaderSession *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v9);
    }
  }
  else
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 202);
    v11 = (NFCReaderSession *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v11);

    objc_sync_exit(v9);
  }

}

- (void)_stopPollingWithCompletionHandler:(id)a3
{
  NFCReaderSession *v4;
  NFReaderSessionInterface *proxy;
  void *v6;
  NFReaderSessionInterface *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v4 = self;
  objc_sync_enter(v4);
  proxy = v4->_proxy;
  if (!v8 || proxy)
  {
    v7 = proxy;
    objc_sync_exit(v4);

    -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v4 = (NFCReaderSession *)objc_claimAutoreleasedReturnValue();
    -[NFCReaderSession stopPollingWithCompletion:](v4, "stopPollingWithCompletion:", v8);
  }
  else
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 202);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v6);

    objc_sync_exit(v4);
  }

}

- (void)_restartPollingWithCompletionHandler:(id)a3
{
  NFCReaderSession *v4;
  NFReaderSessionInterface *proxy;
  void *v6;
  NFReaderSessionInterface *v7;
  NFTag *currentTag;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  v4 = self;
  objc_sync_enter(v4);
  proxy = v4->_proxy;
  if (!v9 || proxy)
  {
    v7 = proxy;
    currentTag = v4->_currentTag;
    v4->_currentTag = 0;

    v4->_sessionState = 3;
    objc_sync_exit(v4);

    -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v4 = (NFCReaderSession *)objc_claimAutoreleasedReturnValue();
    -[NFCReaderSession restartPollingWithCompletion:](v4, "restartPollingWithCompletion:", v9);
  }
  else
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 202);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v6);

    objc_sync_exit(v4);
  }

}

- (NFTag)currentTag
{
  NFCReaderSession *v2;
  NFTag *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentTag;
  objc_sync_exit(v2);

  return v3;
}

- (void)connectTag:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  if (-[NFCReaderSession isInvalidated](self, "isInvalidated"))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__NFCReaderSession_connectTag_completionHandler___block_invoke;
    v14[3] = &unk_24D44F8B0;
    v15 = v7;
    v8 = v7;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v14);
    v9 = v15;
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__NFCReaderSession_connectTag_completionHandler___block_invoke_2;
    v11[3] = &unk_24D44FA78;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    v10 = v7;
    -[NFCReaderSession submitBlockOnSessionQueue:](self, "submitBlockOnSessionQueue:", v11);

    v9 = v12;
  }

}

void __49__NFCReaderSession_connectTag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __49__NFCReaderSession_connectTag_completionHandler___block_invoke_2(uint64_t a1)
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
  objc_msgSend(v2, "connectTag:error:", v3, &v11);
  v4 = v11;
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__NFCReaderSession_connectTag_completionHandler___block_invoke_3;
  v8[3] = &unk_24D44F9D8;
  v6 = *(id *)(a1 + 48);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  objc_msgSend(v5, "submitBlockOnDelegateQueue:", v8);

}

uint64_t __49__NFCReaderSession_connectTag_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)connectTag:(id)a3 error:(id *)a4
{
  id v7;
  NFCReaderSession *v8;
  int64_t sessionState;
  id v10;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v13;
  const char *ClassName;
  const char *Name;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  int64_t v21;
  id v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  BOOL v31;
  id v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  sessionState = v8->_sessionState;
  if (sessionState != 4)
  {
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v8);
      if (class_isMetaClass(Class))
        v13 = 43;
      else
        v13 = 45;
      ClassName = object_getClassName(v8);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Invalid state, %ld", v13, ClassName, Name, 690, v8->_sessionState);
    }
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(v8);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(v8);
      v20 = sel_getName(a2);
      v21 = v8->_sessionState;
      *(_DWORD *)buf = 67110146;
      v35 = v18;
      v36 = 2082;
      v37 = v19;
      v38 = 2082;
      v39 = v20;
      v40 = 1024;
      v41 = 690;
      v42 = 2048;
      v43 = v21;
      _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid state, %ld", buf, 0x2Cu);
    }

    if (!a4)
    {
      v10 = 0;
      goto LABEL_33;
    }
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 100);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
LABEL_31:
    *a4 = v22;
    goto LABEL_33;
  }
  if ((objc_msgSend(v7, "isEqualToNFTag:", v8->_currentTag) & 1) != 0)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_33;
    goto LABEL_30;
  }
  if (v8->_currentTag)
  {
    v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
    {
      v24 = object_getClass(v8);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(v8);
      v27 = sel_getName(a2);
      v23(6, "%c[%{public}s %{public}s]:%i Disconnecting previous tag", v25, v26, v27, 697);
    }
    NFSharedLogGetLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = object_getClass(v8);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      *(_DWORD *)buf = 67109890;
      v35 = v30;
      v36 = 2082;
      v37 = object_getClassName(v8);
      v38 = 2082;
      v39 = sel_getName(a2);
      v40 = 1024;
      v41 = 697;
      _os_log_impl(&dword_215BBD000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disconnecting previous tag", buf, 0x22u);
    }

    -[NFCReaderSession disconnectTagWithError:](v8, "disconnectTagWithError:", 0);
  }
  v33 = 0;
  -[NFCReaderSession _connectTag:error:](v8, "_connectTag:error:", v7, &v33);
  v10 = v33;
  if (a4)
  {
LABEL_30:
    v22 = objc_retainAutorelease(v10);
    v10 = v22;
    goto LABEL_31;
  }
LABEL_33:
  objc_sync_exit(v8);

  if (v10)
    v31 = 0;
  else
    v31 = sessionState == 4;

  return v31;
}

- (BOOL)_connectTag:(id)a3 error:(id *)a4
{
  id v7;
  NFCReaderSession *v8;
  NFReaderSessionInterface *proxy;
  NFReaderSessionInterface *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  int v17;
  id *v18;
  void *v19;
  void *v20;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v23;
  const char *ClassName;
  const char *Name;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  _QWORD v32[6];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  id *v55;
  _QWORD v56[2];
  _QWORD v57[5];

  v57[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  proxy = v8->_proxy;
  if (proxy)
  {
    v10 = proxy;
    objc_sync_exit(v8);

    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__0;
    v44 = __Block_byref_object_dispose__0;
    v45 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__0;
    v38 = __Block_byref_object_dispose__0;
    v39 = 0;
    if (a4)
      *a4 = 0;
    v11 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __38__NFCReaderSession__connectTag_error___block_invoke;
    v33[3] = &unk_24D44FD88;
    v33[4] = &v40;
    -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v10, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __38__NFCReaderSession__connectTag_error___block_invoke_2;
    v32[3] = &unk_24D44FFF8;
    v32[4] = &v40;
    v32[5] = &v34;
    objc_msgSend(v12, "connect:completion:", v7, v32);

    v13 = (void *)v41[5];
    v14 = v13 == 0;
    if (v13)
    {
      objc_msgSend(v13, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
      {
        +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v41[5], 100);
        v18 = (id *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "code") == 203)
          -[NFCReaderSession _invalidateSessionWithCode:](v8, "_invalidateSessionWithCode:", objc_msgSend(v18, "code"));
      }
      else
      {
        -[NFCReaderSession _invalidateSessionWithCode:](v8, "_invalidateSessionWithCode:", 202);
        v56[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = *MEMORY[0x24BDD1398];
        v57[0] = v19;
        v57[1] = v41[5];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 202, v20);
        v18 = (id *)objc_claimAutoreleasedReturnValue();

      }
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v8);
        if (class_isMetaClass(Class))
          v23 = 43;
        else
          v23 = 45;
        ClassName = object_getClassName(v8);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i %@", v23, ClassName, Name, 748, v18);
      }
      NFSharedLogGetLogger();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = object_getClass(v8);
        if (class_isMetaClass(v27))
          v28 = 43;
        else
          v28 = 45;
        v29 = object_getClassName(v8);
        v30 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v47 = v28;
        v48 = 2082;
        v49 = v29;
        v50 = 2082;
        v51 = v30;
        v52 = 1024;
        v53 = 748;
        v54 = 2112;
        v55 = v18;
        _os_log_impl(&dword_215BBD000, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
      }

      if (a4)
      {
        v18 = objc_retainAutorelease(v18);
        *a4 = v18;
      }
    }
    else
    {
      v18 = v8;
      objc_sync_enter(v18);
      objc_storeStrong(v18 + 8, (id)v35[5]);
      objc_sync_exit(v18);
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    if (a4)
    {
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_sync_exit(v8);

    v14 = 0;
  }

  return v14;
}

void __38__NFCReaderSession__connectTag_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __38__NFCReaderSession__connectTag_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)disconnectTagWithError:(id *)a3
{
  NFCReaderSession *v5;
  NFReaderSessionInterface *proxy;
  NFReaderSessionInterface *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NFTag *v17;
  void *v18;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v21;
  const char *ClassName;
  const char *Name;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  NFCReaderSession *v29;
  NFTag *currentTag;
  _QWORD v32[5];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v5 = self;
  objc_sync_enter(v5);
  proxy = v5->_proxy;
  if (proxy)
  {
    v7 = proxy;
    objc_sync_exit(v5);

    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__0;
    v38 = __Block_byref_object_dispose__0;
    v39 = 0;
    if (a3)
      *a3 = 0;
    v8 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __43__NFCReaderSession_disconnectTagWithError___block_invoke;
    v33[3] = &unk_24D44FD88;
    v33[4] = &v34;
    -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __43__NFCReaderSession_disconnectTagWithError___block_invoke_2;
    v32[3] = &unk_24D44FD88;
    v32[4] = &v34;
    objc_msgSend(v9, "disconnectWithCardRemoval:completion:", 0, v32);

    v10 = (void *)v35[5];
    v11 = v10 == 0;
    if (v10)
    {
      objc_msgSend(v10, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v14)
      {
        v52[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Stack Error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = *MEMORY[0x24BDD1398];
        v53[0] = v15;
        v53[1] = v35[5];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 100, v16);
      }
      else
      {
        -[NFCReaderSession _invalidateSessionWithCode:](v5, "_invalidateSessionWithCode:", 202);
        v50[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = *MEMORY[0x24BDD1398];
        v51[0] = v15;
        v51[1] = v35[5];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 202, v16);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v5);
        if (class_isMetaClass(Class))
          v21 = 43;
        else
          v21 = 45;
        ClassName = object_getClassName(v5);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i %@", v21, ClassName, Name, 796, v18);
      }
      NFSharedLogGetLogger();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = object_getClass(v5);
        if (class_isMetaClass(v25))
          v26 = 43;
        else
          v26 = 45;
        v27 = object_getClassName(v5);
        v28 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v41 = v26;
        v42 = 2082;
        v43 = v27;
        v44 = 2082;
        v45 = v28;
        v46 = 1024;
        v47 = 796;
        v48 = 2112;
        v49 = v18;
        _os_log_impl(&dword_215BBD000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
      }

      if (a3)
        *a3 = objc_retainAutorelease(v18);

    }
    v29 = v5;
    objc_sync_enter(v29);
    currentTag = v29->_currentTag;
    v29->_currentTag = 0;

    objc_sync_exit(v29);
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    if (a3)
    {
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v5->_currentTag;
    v5->_currentTag = 0;

    objc_sync_exit(v5);
    v11 = 0;
  }

  return v11;
}

void __43__NFCReaderSession_disconnectTagWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__NFCReaderSession_disconnectTagWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)checkPresenceWithError:(id *)a3
{
  NFCReaderSession *v5;
  NFReaderSessionInterface *proxy;
  NFReaderSessionInterface *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v20;
  const char *ClassName;
  const char *Name;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  _QWORD v29[6];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v5 = self;
  objc_sync_enter(v5);
  proxy = v5->_proxy;
  if (proxy)
  {
    v7 = proxy;
    objc_sync_exit(v5);

    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__0;
    v39 = __Block_byref_object_dispose__0;
    v40 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    if (a3)
      *a3 = 0;
    v8 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __43__NFCReaderSession_checkPresenceWithError___block_invoke;
    v30[3] = &unk_24D44FD88;
    v30[4] = &v35;
    -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __43__NFCReaderSession_checkPresenceWithError___block_invoke_2;
    v29[3] = &unk_24D450020;
    v29[4] = &v31;
    v29[5] = &v35;
    objc_msgSend(v9, "checkPresenceWithCompletion:", v29);

    v10 = (void *)v36[5];
    if (v10)
    {
      objc_msgSend(v10, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v36[5], 100);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "code") == 203)
          -[NFCReaderSession _invalidateSessionWithCode:](v5, "_invalidateSessionWithCode:", objc_msgSend(v14, "code"));
      }
      else
      {
        -[NFCReaderSession _invalidateSessionWithCode:](v5, "_invalidateSessionWithCode:", 202);
        v51[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = *MEMORY[0x24BDD1398];
        v52[0] = v16;
        v52[1] = v36[5];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 202, v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v5);
        if (class_isMetaClass(Class))
          v20 = 43;
        else
          v20 = 45;
        ClassName = object_getClassName(v5);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i %@", v20, ClassName, Name, 845, v14);
      }
      NFSharedLogGetLogger();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = object_getClass(v5);
        if (class_isMetaClass(v24))
          v25 = 43;
        else
          v25 = 45;
        v26 = object_getClassName(v5);
        v27 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v42 = v25;
        v43 = 2082;
        v44 = v26;
        v45 = 2082;
        v46 = v27;
        v47 = 1024;
        v48 = 845;
        v49 = 2112;
        v50 = v14;
        _os_log_impl(&dword_215BBD000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
      }

      if (a3)
        *a3 = objc_retainAutorelease(v14);

    }
    v15 = *((_BYTE *)v32 + 24) != 0;
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

  }
  else
  {
    if (a3)
    {
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_sync_exit(v5);

    v15 = 0;
  }

  return v15;
}

void __43__NFCReaderSession_checkPresenceWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__NFCReaderSession_checkPresenceWithError___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)transceive:(id)a3 tagUpdate:(id *)a4 error:(id *)a5
{
  id v9;
  NFCReaderSession *v10;
  NFReaderSessionInterface *proxy;
  NFReaderSessionInterface *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v27;
  const char *ClassName;
  const char *Name;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  id *v35;
  _QWORD v37[7];
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  void *v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[5];

  v70[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = self;
  objc_sync_enter(v10);
  proxy = v10->_proxy;
  if (proxy)
  {
    v12 = proxy;
    objc_sync_exit(v10);

    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__0;
    v55 = __Block_byref_object_dispose__0;
    v56 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__0;
    v49 = __Block_byref_object_dispose__0;
    v50 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__0;
    v43 = __Block_byref_object_dispose__0;
    v44 = 0;
    if (a5)
      *a5 = 0;
    v13 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __47__NFCReaderSession_transceive_tagUpdate_error___block_invoke;
    v38[3] = &unk_24D44FD88;
    v38[4] = &v51;
    -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v12, "synchronousRemoteObjectProxyWithErrorHandler:", v38);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v13;
    v37[1] = 3221225472;
    v37[2] = __47__NFCReaderSession_transceive_tagUpdate_error___block_invoke_2;
    v37[3] = &unk_24D450048;
    v37[4] = &v45;
    v37[5] = &v51;
    v37[6] = &v39;
    objc_msgSend(v14, "transceive:completion:", v9, v37);

    v15 = (void *)v52[5];
    if (v15)
    {
      objc_msgSend(v15, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (v18)
      {
        if (objc_msgSend((id)v52[5], "code") == 10)
        {
          v69[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Stack Error");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v69[1] = *MEMORY[0x24BDD1398];
          v70[0] = v19;
          v70[1] = v52[5];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v52[5], 100);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v21, "code") == 203)
          -[NFCReaderSession _invalidateSessionWithCode:](v10, "_invalidateSessionWithCode:", objc_msgSend(v21, "code"));
      }
      else
      {
        -[NFCReaderSession _invalidateSessionWithCode:](v10, "_invalidateSessionWithCode:", 202);
        v67[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = *MEMORY[0x24BDD1398];
        v68[0] = v23;
        v68[1] = v52[5];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 202, v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(v10);
        if (class_isMetaClass(Class))
          v27 = 43;
        else
          v27 = 45;
        ClassName = object_getClassName(v10);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i %@", v27, ClassName, Name, 897, v21);
      }
      NFSharedLogGetLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = object_getClass(v10);
        if (class_isMetaClass(v31))
          v32 = 43;
        else
          v32 = 45;
        v33 = object_getClassName(v10);
        v34 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v58 = v32;
        v59 = 2082;
        v60 = v33;
        v61 = 2082;
        v62 = v34;
        v63 = 1024;
        v64 = 897;
        v65 = 2112;
        v66 = v21;
        _os_log_impl(&dword_215BBD000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v21);

    }
    v35 = v10;
    objc_sync_enter(v35);
    objc_storeStrong(v35 + 8, (id)v40[5]);
    objc_sync_exit(v35);

    if (a4)
      *a4 = objc_retainAutorelease((id)v40[5]);
    v22 = (id)v46[5];
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v51, 8);

  }
  else
  {
    if (a5)
    {
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_sync_exit(v10);

    v22 = 0;
  }

  return v22;
}

void __47__NFCReaderSession_transceive_tagUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47__NFCReaderSession_transceive_tagUpdate_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v17 = v8;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;
  v14 = v9;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v7;

}

- (void)restartPolling
{
  _QWORD v3[5];

  if (!-[NFCReaderSession isInvalidated](self, "isInvalidated"))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __34__NFCReaderSession_restartPolling__block_invoke;
    v3[3] = &unk_24D44FB90;
    v3[4] = self;
    -[NFCReaderSession submitBlockOnSessionQueue:](self, "submitBlockOnSessionQueue:", v3);
  }
}

uint64_t __34__NFCReaderSession_restartPolling__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__NFCReaderSession_restartPolling__block_invoke_2;
  v3[3] = &unk_24D450070;
  v3[4] = v1;
  return objc_msgSend(v1, "_restartPollingWithCompletionHandler:", v3);
}

uint64_t __34__NFCReaderSession_restartPolling__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_invalidateSessionWithCode:", 202);
  return result;
}

- (void)_callbackDidInvalidateWithError:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  int64_t delegateType;
  const char *Name;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!self->_sessionState)
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
      v9(5, "%c[%{public}s %{public}s]:%i Session has not begun", v13, ClassName, Name, 927);
    }
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67109890;
    v43 = v16;
    v44 = 2082;
    v45 = object_getClassName(self);
    v46 = 2082;
    v47 = sel_getName(a2);
    v48 = 1024;
    v49 = 927;
    v17 = "%c[%{public}s %{public}s]:%i Session has not begun";
    v18 = v14;
    v19 = OS_LOG_TYPE_DEFAULT;
    v20 = 34;
    goto LABEL_13;
  }
  if (self->_delegateType == 1)
  {
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke;
    v40[3] = &unk_24D44FAF0;
    v40[4] = self;
    v41 = v5;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v40);
    v7 = v41;
LABEL_18:

    goto LABEL_19;
  }
  if (-[NFCReaderSession delegateType](self, "delegateType") == 2
    || -[NFCReaderSession delegateType](self, "delegateType") == 3)
  {
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_2;
    v38[3] = &unk_24D44FAF0;
    v38[4] = self;
    v39 = v6;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v38);
    v7 = v39;
    goto LABEL_18;
  }
  if (-[NFCReaderSession delegateType](self, "delegateType") == 4
    || -[NFCReaderSession delegateType](self, "delegateType") == 5)
  {
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_3;
    v36[3] = &unk_24D44FAF0;
    v36[4] = self;
    v37 = v6;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v36);
    v7 = v37;
    goto LABEL_18;
  }
  if (-[NFCReaderSession delegateType](self, "delegateType") == 6)
  {
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_4;
    v34[3] = &unk_24D44FAF0;
    v34[4] = self;
    v35 = v6;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v34);
    v7 = v35;
    goto LABEL_18;
  }
  v21 = NFLogGetLogger();
  if (v21)
  {
    v22 = (void (*)(uint64_t, const char *, ...))v21;
    v23 = object_getClass(self);
    v24 = class_isMetaClass(v23);
    v25 = object_getClassName(self);
    v26 = sel_getName(a2);
    v27 = 45;
    if (v24)
      v27 = 43;
    v22(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v27, v25, v26, 948, self->_delegateType);
  }
  NFSharedLogGetLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    v30 = object_getClassName(self);
    v31 = sel_getName(a2);
    delegateType = self->_delegateType;
    *(_DWORD *)buf = 67110146;
    v43 = v29;
    v44 = 2082;
    v45 = v30;
    v46 = 2082;
    v47 = v31;
    v48 = 1024;
    v49 = 948;
    v50 = 2048;
    v51 = delegateType;
    v17 = "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld";
    v18 = v14;
    v19 = OS_LOG_TYPE_ERROR;
    v20 = 44;
LABEL_13:
    _os_log_impl(&dword_215BBD000, v18, v19, v17, buf, v20);
  }
LABEL_14:

LABEL_19:
}

void __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readerSession:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagReaderSession:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readerSession:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__NFCReaderSession__callbackDidInvalidateWithError___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readerSession:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_invalidateSessionWithCode:(int64_t)a3
{
  -[NFCReaderSession _invalidateSessionWithCode:message:finalUIState:activateCallback:](self, "_invalidateSessionWithCode:message:finalUIState:activateCallback:", a3, 0, 1, 0);
}

- (void)_invalidateSessionAndActivateCallbackWithCode:(int64_t)a3
{
  -[NFCReaderSession _invalidateSessionWithCode:message:finalUIState:activateCallback:](self, "_invalidateSessionWithCode:message:finalUIState:activateCallback:", a3, 0, 0, 1);
}

- (void)_invalidateSessionWithCode:(int64_t)a3 message:(id)a4 finalUIState:(int64_t)a5 activateCallback:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  NFCReaderSession *v12;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
  const char *ClassName;
  const char *Name;
  NSObject *v18;
  objc_class *v19;
  int v20;
  NFReaderSessionInterface *proxy;
  uint64_t v22;
  void *v23;
  unint64_t delegateType;
  NFReaderSessionInterface *v25;
  uint64_t v26;
  void *v27;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  NSNumber *sessionId;
  NFTag *currentTag;
  void *v41;
  _QWORD v42[6];
  _QWORD v43[6];
  _QWORD v44[6];
  _QWORD v45[6];
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int64_t v55;
  __int16 v56;
  int64_t v57;
  __int16 v58;
  _BOOL8 v59;
  uint64_t v60;

  v6 = a6;
  v60 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = self;
  objc_sync_enter(v12);
  if ((unint64_t)(v12->_sessionState - 5) >= 2)
  {
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v12);
      if (class_isMetaClass(Class))
        v15 = 43;
      else
        v15 = 45;
      ClassName = object_getClassName(v12);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i code=%ld, finalUIState=%ld, activateCallback=%ld", v15, ClassName, Name, 975, a3, a5, v6);
    }
    NFSharedLogGetLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = object_getClass(v12);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      *(_DWORD *)buf = 67110658;
      v47 = v20;
      v48 = 2082;
      v49 = object_getClassName(v12);
      v50 = 2082;
      v51 = sel_getName(a2);
      v52 = 1024;
      v53 = 975;
      v54 = 2048;
      v55 = a3;
      v56 = 2048;
      v57 = a5;
      v58 = 2048;
      v59 = v6;
      _os_log_impl(&dword_215BBD000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i code=%ld, finalUIState=%ld, activateCallback=%ld", buf, 0x40u);
    }

    if (v12->_sessionState > 2uLL)
    {
      if (v11)
      {
        proxy = v12->_proxy;
        v22 = MEMORY[0x24BDAC760];
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke;
        v45[3] = &unk_24D44FF30;
        v45[4] = v12;
        v45[5] = a2;
        -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](proxy, "synchronousRemoteObjectProxyWithErrorHandler:", v45);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v22;
        v44[1] = 3221225472;
        v44[2] = __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_141;
        v44[3] = &unk_24D44FF30;
        v44[4] = v12;
        v44[5] = a2;
        objc_msgSend(v23, "updateSharingUIScanText:completion:", v11, v44);

      }
      if (a5 == 2)
      {
        delegateType = v12->_delegateType;
        if (delegateType <= 6)
        {
          if (((1 << delegateType) & 0x6C) != 0)
          {
            v25 = v12->_proxy;
            v26 = MEMORY[0x24BDAC760];
            v43[0] = MEMORY[0x24BDAC760];
            v43[1] = 3221225472;
            v43[2] = __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_142;
            v43[3] = &unk_24D44FF30;
            v43[4] = v12;
            v43[5] = a2;
            -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v25, "synchronousRemoteObjectProxyWithErrorHandler:", v43);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = v26;
            v42[1] = 3221225472;
            v42[2] = __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_143;
            v42[3] = &unk_24D44FF30;
            v42[4] = v12;
            v42[5] = a2;
            objc_msgSend(v27, "updateSharingUIStateOnInvalidation:completion:", 2, v42);

          }
          else
          {
            v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v28)
            {
              v29 = object_getClass(v12);
              if (class_isMetaClass(v29))
                v30 = 43;
              else
                v30 = 45;
              v31 = object_getClassName(v12);
              v32 = sel_getName(a2);
              v28(4, "%c[%{public}s %{public}s]:%i Session does not support invalidation with error", v30, v31, v32, 1002);
            }
            NFSharedLogGetLogger();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = object_getClass(v12);
              if (class_isMetaClass(v34))
                v35 = 43;
              else
                v35 = 45;
              v36 = object_getClassName(v12);
              v37 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v47 = v35;
              v48 = 2082;
              v49 = v36;
              v50 = 2082;
              v51 = v37;
              v52 = 1024;
              v53 = 1002;
              _os_log_impl(&dword_215BBD000, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session does not support invalidation with error", buf, 0x22u);
            }

          }
        }
      }
    }
    else
    {
      -[NFCReaderSession cleanupNFCHardwareManagerRegistration](v12, "cleanupNFCHardwareManagerRegistration");
    }
    -[NFReaderSessionInterface remoteObjectProxy](v12->_proxy, "remoteObjectProxy");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "endSession:", &__block_literal_global_1);

    sessionId = v12->_sessionId;
    v12->_sessionId = 0;

    currentTag = v12->_currentTag;
    v12->_currentTag = 0;

    v12->_sessionState = 5;
    v12->_invalidationCode = a3;
  }
  if (v6)
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", v12->_invalidationCode);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFCReaderSession _callbackDidInvalidateWithError:](v12, "_callbackDidInvalidateWithError:", v41);

  }
  objc_sync_exit(v12);

}

void __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    v8 = 45;
    if (isMetaClass)
      v8 = 43;
    v5(4, "%c[%{public}s %{public}s]:%i XPC error: %@", v8, ClassName, Name, 981, v3);
  }
  NFSharedLogGetLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10))
      v11 = 43;
    else
      v11 = 45;
    v12 = object_getClassName(*(id *)(a1 + 32));
    v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v17 = v11;
    v18 = 2082;
    v19 = v12;
    v20 = 2082;
    v21 = v13;
    v22 = 1024;
    v23 = 981;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC error: %@", buf, 0x2Cu);
  }

}

void __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v5(3, "%c[%{public}s %{public}s]:%i %@", v8, ClassName, Name, 983, v3);
    }
    NFSharedLogGetLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10))
        v11 = 43;
      else
        v11 = 45;
      v12 = object_getClassName(*(id *)(a1 + 32));
      v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      v17 = v11;
      v18 = 2082;
      v19 = v12;
      v20 = 2082;
      v21 = v13;
      v22 = 1024;
      v23 = 983;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

  }
}

void __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_142(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    v8 = 45;
    if (isMetaClass)
      v8 = 43;
    v5(4, "%c[%{public}s %{public}s]:%i XPC error: %@", v8, ClassName, Name, 994, v3);
  }
  NFSharedLogGetLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10))
      v11 = 43;
    else
      v11 = 45;
    v12 = object_getClassName(*(id *)(a1 + 32));
    v13 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v17 = v11;
    v18 = 2082;
    v19 = v12;
    v20 = 2082;
    v21 = v13;
    v22 = 1024;
    v23 = 994;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC error: %@", buf, 0x2Cu);
  }

}

void __85__NFCReaderSession__invalidateSessionWithCode_message_finalUIState_activateCallback___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v5(3, "%c[%{public}s %{public}s]:%i %@", v8, ClassName, Name, 996, v3);
    }
    NFSharedLogGetLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10))
        v11 = 43;
      else
        v11 = 45;
      v12 = object_getClassName(*(id *)(a1 + 32));
      v13 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      v17 = v11;
      v18 = 2082;
      v19 = v12;
      v20 = 2082;
      v21 = v13;
      v22 = 1024;
      v23 = 996;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

  }
}

- (NFReaderSessionInterface)readerProxy
{
  NFCReaderSession *v2;
  NFReaderSessionInterface *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:](NFCReaderSession, "featureAvailable:", 1);
}

+ (BOOL)featureAvailable:(unint64_t)a3
{
  id v4;
  int v5;
  useconds_t v6;
  void *v7;
  void *v8;
  char v9;
  id v11;

  v4 = 0;
  v5 = 5;
  v6 = 100000;
  while (1)
  {
    v7 = v4;
    +[NFCHardwareManager sharedHardwareManager](NFCHardwareManager, "sharedHardwareManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v9 = objc_msgSend(v8, "areFeaturesSupported:outError:", a3, &v11);
    v4 = v11;

    if (!v4 || objc_msgSend(v4, "code") == 1)
      break;
    usleep(v6);
    v6 += 100000;
    if (!--v5)
    {
      v9 = 0;
      break;
    }
  }

  return v9;
}

- (id)ndefStatus:(int64_t *)a3 maxMessageLength:(unint64_t *)a4
{
  NFCReaderSession *v6;
  NFReaderSessionInterface *proxy;
  NFReaderSessionInterface *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[7];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = self;
  objc_sync_enter(v6);
  proxy = v6->_proxy;
  if (proxy)
  {
    v8 = proxy;
    objc_sync_exit(v6);

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    v9 = MEMORY[0x24BDAC760];
    v25 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __48__NFCReaderSession_ndefStatus_maxMessageLength___block_invoke;
    v19[3] = &unk_24D44FD88;
    v19[4] = &v20;
    -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __48__NFCReaderSession_ndefStatus_maxMessageLength___block_invoke_2;
    v18[3] = &unk_24D4500B8;
    v18[4] = &v20;
    v18[5] = &v26;
    v18[6] = a4;
    objc_msgSend(v10, "checkNdefSupportWithCompletion:", v18);

    if (a3)
      *a3 = v27[3];
    +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v21[5], 104);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v21[5];
    v21[5] = v11;

    v13 = v21;
    v14 = (void *)v21[5];
    if (v14)
    {
      v15 = objc_msgSend(v14, "code");
      v13 = v21;
      if (v15 == 203)
      {
        -[NFCReaderSession _invalidateSessionWithCode:](v6, "_invalidateSessionWithCode:", objc_msgSend((id)v21[5], "code"));
        v13 = v21;
      }
    }
    v16 = (id)v13[5];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    if (a3)
      *a3 = 0;
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v6);

  }
  return v16;
}

void __48__NFCReaderSession_ndefStatus_maxMessageLength___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__NFCReaderSession_ndefStatus_maxMessageLength___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  _QWORD *v8;
  id v9;

  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a4);
  if (!v9)
  {
    if ((unint64_t)(a2 - 1) <= 3)
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
    v8 = (_QWORD *)a1[6];
    if (v8)
      *v8 = a3;
  }

}

- (id)readNdefMessageWithError:(id *)a3
{
  NFCReaderSession *v4;
  NFReaderSessionInterface *proxy;
  NFReaderSessionInterface *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_currentTag)
  {
    if (a3)
    {
      v11 = 104;
LABEL_13:
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    objc_sync_exit(v4);

    v10 = 0;
    return v10;
  }
  proxy = v4->_proxy;
  if (!proxy)
  {
    if (a3)
    {
      v11 = 103;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v6 = proxy;
  objc_sync_exit(v4);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v7 = MEMORY[0x24BDAC760];
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__NFCReaderSession_readNdefMessageWithError___block_invoke;
  v14[3] = &unk_24D44FD88;
  v14[4] = &v15;
  -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __45__NFCReaderSession_readNdefMessageWithError___block_invoke_2;
  v13[3] = &unk_24D4500E0;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v8, "ndefReadWithCompletion:", v13);

  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v9 = (void *)v16[5];
  if (v9 && objc_msgSend(v9, "code") == 203)
    -[NFCReaderSession _invalidateSessionWithCode:](v4, "_invalidateSessionWithCode:", objc_msgSend((id)v16[5], "code"));
  v10 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __45__NFCReaderSession_readNdefMessageWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __45__NFCReaderSession_readNdefMessageWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NFCNDEFMessage *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v11)
  {
    +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v11, 104);
    v7 = (NFCNDEFMessage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v7 = -[NFCNDEFMessage initWithNFNdefMessage:]([NFCNDEFMessage alloc], "initWithNFNdefMessage:", v5);
      v8 = *(_QWORD *)(a1 + 40);
      goto LABEL_6;
    }
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 403);
    v7 = (NFCNDEFMessage *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(_QWORD *)(a1 + 32);
LABEL_6:
  v9 = *(_QWORD *)(v8 + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

}

- (id)_convertMessageToInternal:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  id obj;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = objc_alloc_init(MEMORY[0x24BEDCD68]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v15, "records");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v18 = 0;
        v8 = (void *)MEMORY[0x24BEDCD70];
        v9 = objc_msgSend(v7, "typeNameFormat");
        objc_msgSend(v7, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "payload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordsWithTNF:type:identifier:payload:chunkSize:outError:", v9, v10, v11, v12, objc_msgSend(v7, "chunkSize"), &v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          objc_msgSend(v16, "addRecordArray:", v13);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  return v16;
}

- (BOOL)writeNdefMessage:(id)a3 error:(id *)a4
{
  id v6;
  NFCReaderSession *v7;
  NFReaderSessionInterface *proxy;
  NFReaderSessionInterface *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  if (!v6)
  {
    if (a4)
    {
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 403);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v7 = self;
  objc_sync_enter(v7);
  if (!v7->_currentTag)
  {
    if (a4)
    {
      v15 = 104;
LABEL_16:
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_17:
    objc_sync_exit(v7);

    goto LABEL_18;
  }
  proxy = v7->_proxy;
  if (!proxy)
  {
    if (a4)
    {
      v15 = 103;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v9 = proxy;
  objc_sync_exit(v7);

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  -[NFCReaderSession _convertMessageToInternal:](v7, "_convertMessageToInternal:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __43__NFCReaderSession_writeNdefMessage_error___block_invoke;
  v18[3] = &unk_24D44FD88;
  v18[4] = &v19;
  -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v9, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __43__NFCReaderSession_writeNdefMessage_error___block_invoke_2;
  v17[3] = &unk_24D44FD88;
  v17[4] = &v19;
  objc_msgSend(v12, "ndefWrite:completion:", v10, v17);

  v13 = a4 == 0;
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v14 = (void *)v20[5];
  if (v14 && objc_msgSend(v14, "code") == 203)
    -[NFCReaderSession _invalidateSessionWithCode:](v7, "_invalidateSessionWithCode:", objc_msgSend((id)v20[5], "code"));

  _Block_object_dispose(&v19, 8);
LABEL_19:

  return v13;
}

void __43__NFCReaderSession_writeNdefMessage_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__NFCReaderSession_writeNdefMessage_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", a2, 401);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)writeLockNdef
{
  NFCReaderSession *v2;
  NFReaderSessionInterface *proxy;
  NFReaderSessionInterface *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_currentTag)
  {
    v13 = 104;
LABEL_9:
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v2);

    return v12;
  }
  proxy = v2->_proxy;
  if (!proxy)
  {
    v13 = 103;
    goto LABEL_9;
  }
  v4 = proxy;
  objc_sync_exit(v2);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v5 = MEMORY[0x24BDAC760];
  v22 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __33__NFCReaderSession_writeLockNdef__block_invoke;
  v16[3] = &unk_24D44FD88;
  v16[4] = &v17;
  -[NFReaderSessionInterface synchronousRemoteObjectProxyWithErrorHandler:](v4, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __33__NFCReaderSession_writeLockNdef__block_invoke_2;
  v15[3] = &unk_24D44FD88;
  v15[4] = &v17;
  objc_msgSend(v6, "writeProtectNDEFTagWithCompletion:", v15);

  +[NFCError errorWithNFCDError:defaultNFCErrorCode:](NFCError, "errorWithNFCDError:defaultNFCErrorCode:", v18[5], 401);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v18[5];
  v18[5] = v7;

  v9 = v18;
  v10 = (void *)v18[5];
  if (v10)
  {
    v11 = objc_msgSend(v10, "code");
    v9 = v18;
    if (v11 == 203)
    {
      -[NFCReaderSession _invalidateSessionWithCode:](v2, "_invalidateSessionWithCode:", objc_msgSend((id)v18[5], "code"));
      v9 = v18;
    }
  }
  v12 = (id)v9[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __33__NFCReaderSession_writeLockNdef__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __33__NFCReaderSession_writeLockNdef__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (unint64_t)pollMethod
{
  return self->_pollMethod;
}

- (void)setPollMethod:(unint64_t)a3
{
  self->_pollMethod = a3;
}

- (unint64_t)sessionConfig
{
  return self->_sessionConfig;
}

- (void)setSessionConfig:(unint64_t)a3
{
  self->_sessionConfig = a3;
}

- (NSNumber)sessionId
{
  return self->_sessionId;
}

- (int64_t)delegateType
{
  return self->_delegateType;
}

- (NFCHardwareManager)hardwareManager
{
  return self->_hardwareManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareManager, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_sessionStartInProgress, 0);
  objc_storeStrong((id *)&self->_currentTag, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
