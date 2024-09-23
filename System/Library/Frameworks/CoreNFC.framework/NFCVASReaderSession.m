@implementation NFCVASReaderSession

- (NFCVASReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Unavailable initializer"), CFSTR("Not available"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

- (NFCVASReaderSession)initWithVASCommandConfigurations:(NSArray *)commandConfigurations delegate:(id)delegate queue:(dispatch_queue_t)queue
{
  NSArray *v8;
  id v9;
  NSObject *v10;
  NFCVASReaderSession *v11;
  void *v12;
  uint64_t v13;
  NSArray *vasConfig;
  id v15;
  void *v16;
  uint64_t v17;
  NFTimer *presenceCheckTimer;
  uint64_t v20;
  id v21;
  id location;
  objc_super v23;

  v8 = commandConfigurations;
  v9 = delegate;
  v10 = queue;
  v23.receiver = self;
  v23.super_class = (Class)NFCVASReaderSession;
  v11 = -[NFCReaderSession initWithDelegate:sessionDelegateType:queue:pollMethod:sessionConfig:](&v23, sel_initWithDelegate_sessionDelegateType_queue_pollMethod_sessionConfig_, v9, 6, v10, 8, 8);
  if (v11)
  {
    objc_initWeak(&location, v11);
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](v8, "filteredArrayUsingPredicate:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    vasConfig = v11->_vasConfig;
    v11->_vasConfig = (NSArray *)v13;

    v15 = objc_alloc(MEMORY[0x24BEDCD88]);
    v20 = MEMORY[0x24BDAC760];
    objc_copyWeak(&v21, &location);
    -[NFCReaderSession sessionQueue](v11, "sessionQueue", v20, 3221225472, __71__NFCVASReaderSession_initWithVASCommandConfigurations_delegate_queue___block_invoke_2, &unk_24D44F988);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithCallback:queue:", &v20, v16);
    presenceCheckTimer = v11->_presenceCheckTimer;
    v11->_presenceCheckTimer = (NFTimer *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v11;
}

BOOL __71__NFCVASReaderSession_initWithVASCommandConfigurations_delegate_queue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mode") == 1;
}

void __71__NFCVASReaderSession_initWithVASCommandConfigurations_delegate_queue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  int v5;
  id v6;
  id v7;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_215BBD000, "com.apple.nfcd.vas.presenceCheckTimer", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v7 = 0;
    v5 = objc_msgSend(WeakRetained, "checkPresenceWithError:", &v7);
    v6 = v7;
    if (v5)
    {
      objc_msgSend(v4[16], "startTimer:", 0.5);
    }
    else
    {
      objc_msgSend(v4, "disconnectTagWithError:", 0);
      objc_msgSend(v4, "restartPolling");
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NFTimer stopTimer](self->_presenceCheckTimer, "stopTimer");
  v3.receiver = self;
  v3.super_class = (Class)NFCVASReaderSession;
  -[NFCReaderSession dealloc](&v3, sel_dealloc);
}

- (void)beginSession
{
  NSObject *v3;
  NFCVASReaderSession *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  os_activity_scope_state_s state;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = _os_activity_create(&dword_215BBD000, "NFCVASReaderSession beginSessionWithConfig:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4->_vasConfig;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BEDCD90];
        v12 = objc_msgSend(v10, "mode");
        objc_msgSend(v10, "passTypeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "passConfigWithMode:passIdentifier:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v15 = (void *)MEMORY[0x24BEDCD78];
  -[NFCReaderSession alertMessage](v4, "alertMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sessionConfigWithUIMode:sessionType:initialScanText:vasPass:", 3, 3, v16, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = v4;
  v18.super_class = (Class)NFCVASReaderSession;
  -[NFCReaderSession beginSessionWithConfig:](&v18, sel_beginSessionWithConfig_, v17);

  objc_sync_exit(v4);
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:](NFCReaderSession, "featureAvailable:", 32);
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
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  objc_class *v25;
  int v26;
  const char *v27;
  int64_t v28;
  _QWORD v29[5];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (-[NFCReaderSession delegateType](self, "delegateType") != 6)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v28 = -[NFCReaderSession delegateType](self, "delegateType");
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v7(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v12, ClassName, Name, 181, v28);
    }
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67110146;
    v31 = v15;
    v32 = 2082;
    v33 = object_getClassName(self);
    v34 = 2082;
    v35 = sel_getName(a2);
    v36 = 1024;
    v37 = 181;
    v38 = 2048;
    v39 = -[NFCReaderSession delegateType](self, "delegateType");
    v16 = "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld";
    v17 = v13;
    v18 = 44;
    goto LABEL_22;
  }
  -[NFCReaderSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __47__NFCVASReaderSession__callbackDidBecomeActive__block_invoke;
    v29[3] = &unk_24D44FB90;
    v29[4] = self;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v29);
    return;
  }
  v19 = NFLogGetLogger();
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(self);
    v22 = class_isMetaClass(v21);
    v23 = object_getClassName(self);
    v27 = sel_getName(a2);
    v24 = 45;
    if (v22)
      v24 = 43;
    v20(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSessionDidBecomeActive: method", v24, v23, v27, 178);
  }
  NFSharedLogGetLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    *(_DWORD *)buf = 67109890;
    v31 = v26;
    v32 = 2082;
    v33 = object_getClassName(self);
    v34 = 2082;
    v35 = sel_getName(a2);
    v36 = 1024;
    v37 = 178;
    v16 = "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSessionDidBecomeActive: method";
    v17 = v13;
    v18 = 34;
LABEL_22:
    _os_log_impl(&dword_215BBD000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
  }
LABEL_23:

}

void __47__NFCVASReaderSession__callbackDidBecomeActive__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readerSessionDidBecomeActive:", *(_QWORD *)(a1 + 32));

}

- (id)_sendVASRequests:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  -[NFCReaderSession readerProxy](self, "readerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__NFCVASReaderSession__sendVASRequests_error___block_invoke;
  v13[3] = &unk_24D44FD88;
  v13[4] = &v20;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __46__NFCVASReaderSession__sendVASRequests_error___block_invoke_2;
  v12[3] = &unk_24D44FDB0;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v9, "performVAS:completion:", v6, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __46__NFCVASReaderSession__sendVASRequests_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__NFCVASReaderSession__sendVASRequests_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_convertVASConfigToInternalRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "passTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("MerchantId"));

  objc_msgSend(v3, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SignupUrl"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("TerminalCap"));

  v8 = objc_msgSend(v3, "mode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("TerminalProtocol"));

  return v4;
}

- (id)_convertVASResponseToExternal:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NFCVASResponse *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PassData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Token"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StatusCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NFCVASResponse initWithStatus:data:mobileToken:]([NFCVASResponse alloc], "initWithStatus:data:mobileToken:", objc_msgSend(v6, "unsignedShortValue"), v4, v5);
  return v7;
}

- (void)didTerminate:(id)a3
{
  NFTimer *presenceCheckTimer;
  id v5;
  objc_super v6;

  presenceCheckTimer = self->_presenceCheckTimer;
  v5 = a3;
  -[NFTimer stopTimer](presenceCheckTimer, "stopTimer");
  v6.receiver = self;
  v6.super_class = (Class)NFCVASReaderSession;
  -[NFCReaderSession didTerminate:](&v6, sel_didTerminate_, v5);

}

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  const char *Name;
  _QWORD v25[5];
  id v26;
  SEL v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NFCVASReaderSession;
  -[NFCReaderSession didDetectTags:connectedTagIndex:](&v32, sel_didDetectTags_connectedTagIndex_, v7, a4);
  -[NFCReaderSession currentTag](self, "currentTag");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") != 3)
  {

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v7;
    v8 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v12, "type") == 3)
          {
            v8 = v12;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  if (v8)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __55__NFCVASReaderSession_didDetectTags_connectedTagIndex___block_invoke;
    v25[3] = &unk_24D44FDD8;
    v25[4] = self;
    v26 = v8;
    v27 = a2;
    -[NFCReaderSession submitBlockOnSessionQueue:](self, "submitBlockOnSessionQueue:", v25);

  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v14(4, "%c[%{public}s %{public}s]:%i Restart polling", v18, ClassName, Name, 295);
    }
    NFSharedLogGetLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(self);
      v23 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v34 = v21;
      v35 = 2082;
      v36 = v22;
      v37 = 2082;
      v38 = v23;
      v39 = 1024;
      v40 = 295;
      _os_log_impl(&dword_215BBD000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Restart polling", buf, 0x22u);
    }

    -[NFCReaderSession restartPolling](self, "restartPolling");
  }

}

void __55__NFCVASReaderSession_didDetectTags_connectedTagIndex___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  const char *Name;
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "connectTag:error:", *(_QWORD *)(a1 + 40), 0))
  {
    v2 = (void *)objc_opt_new();
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "count"))
    {
      v3 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "objectAtIndex:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_convertVASConfigToInternalRequest:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v5);

        ++v3;
      }
      while (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "count") > v3);
    }
    v6 = (void *)objc_opt_new();
    v7 = *(void **)(a1 + 32);
    v35 = 0;
    objc_msgSend(v7, "_sendVASRequests:error:", v2, &v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v35;
    if (v8)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(a1 + 32), "_convertVASResponseToExternal:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        }
        while (v12);
      }

    }
    if (objc_msgSend(v6, "count"))
    {
      v16 = *(void **)(a1 + 32);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __55__NFCVASReaderSession_didDetectTags_connectedTagIndex___block_invoke_2;
      v29[3] = &unk_24D44FAF0;
      v29[4] = v16;
      v30 = v6;
      objc_msgSend(v16, "submitBlockOnDelegateQueue:", v29);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "startTimer:", 0.5);

  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v22 = 45;
      if (isMetaClass)
        v22 = 43;
      v18(4, "%c[%{public}s %{public}s]:%i Restart polling", v22, ClassName, Name, 290);
    }
    NFSharedLogGetLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(*(id *)(a1 + 32));
      v27 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v37 = v25;
      v38 = 2082;
      v39 = v26;
      v40 = 2082;
      v41 = v27;
      v42 = 1024;
      v43 = 290;
      _os_log_impl(&dword_215BBD000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Restart polling", buf, 0x22u);
    }

    objc_msgSend(*(id *)(a1 + 32), "restartPolling");
  }
}

void __55__NFCVASReaderSession_didDetectTags_connectedTagIndex___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readerSession:didReceiveVASResponses:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vasConfig, 0);
  objc_storeStrong((id *)&self->_presenceCheckTimer, 0);
}

@end
