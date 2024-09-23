@implementation NFCTagReaderSession

- (NFCTagReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
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

- (NFCTagReaderSession)initWithPollingOption:(int64_t)a3 delegate:(id)a4 delegateType:(int64_t)a5 queue:(id)a6
{
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  NFCTagReaderSession *v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *ClassName;
  const char *Name;
  const char *v36;
  objc_super v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a6;
  if ((unint64_t)(a3 - 1) >= 0xF)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v19 = 45;
      if (isMetaClass)
        v19 = 43;
      v16(3, "%c[%{public}s %{public}s]:%i Invalid NFCPollingOption parameter: 0x%lx", v19, ClassName, Name, 46, a3);
    }
    NFSharedLogGetLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      *(_DWORD *)buf = 67110146;
      v39 = v22;
      v40 = 2082;
      v41 = object_getClassName(self);
      v42 = 2082;
      v43 = sel_getName(a2);
      v44 = 1024;
      v45 = 46;
      v46 = 2048;
      v47 = a3;
      _os_log_impl(&dword_215BBD000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid NFCPollingOption parameter: 0x%lx", buf, 0x2Cu);
    }

    v23 = 0;
  }
  else
  {
    if ((a3 & 8) != 0)
    {
      v24 = NFLogGetLogger();
      if (v24)
      {
        v25 = (void (*)(uint64_t, const char *, ...))v24;
        v26 = object_getClass(self);
        v27 = class_isMetaClass(v26);
        v28 = object_getClassName(self);
        v36 = sel_getName(a2);
        v29 = 45;
        if (v27)
          v29 = 43;
        v25(6, "%c[%{public}s %{public}s]:%i PACE-polling enabled", v29, v28, v36, 57);
      }
      NFSharedLogGetLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = object_getClass(self);
        if (class_isMetaClass(v31))
          v32 = 43;
        else
          v32 = 45;
        *(_DWORD *)buf = 67109890;
        v39 = v32;
        v40 = 2082;
        v41 = object_getClassName(self);
        v42 = 2082;
        v43 = sel_getName(a2);
        v44 = 1024;
        v45 = 57;
        _os_log_impl(&dword_215BBD000, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE-polling enabled", buf, 0x22u);
      }

      v14 = 1030;
      v13 = 8;
    }
    else
    {
      v13 = (__rbit32(a3) >> 28) & 0xCLL | (16 * (((unint64_t)a3 >> 2) & 1));
      v14 = 6;
    }
    v37.receiver = self;
    v37.super_class = (Class)NFCTagReaderSession;
    self = -[NFCReaderSession initWithDelegate:sessionDelegateType:queue:pollMethod:sessionConfig:](&v37, sel_initWithDelegate_sessionDelegateType_queue_pollMethod_sessionConfig_, v11, a5, v12, v13, v14);
    v23 = self;
  }

  return v23;
}

- (NFCTagReaderSession)initWithPollingOption:(NFCPollingOption)pollingOption delegate:(id)delegate queue:(dispatch_queue_t)queue
{
  return -[NFCTagReaderSession initWithPollingOption:delegate:delegateType:queue:](self, "initWithPollingOption:delegate:delegateType:queue:", pollingOption, delegate, 2, queue);
}

- (NFCTagReaderSession)initWithPollingOption:(int64_t)a3 swiftDelegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  NFCTagReaderSession *v11;

  objc_storeStrong(&self->_swiftDelegateWrapper, a4);
  v9 = a4;
  v10 = a5;
  v11 = -[NFCTagReaderSession initWithPollingOption:delegate:delegateType:queue:](self, "initWithPollingOption:delegate:delegateType:queue:", a3, v9, 3, v10);

  return v11;
}

- (void)restartPolling
{
  NSObject *v3;
  NFCTagReaderSession *v4;
  NFCTag *connectedTag;
  objc_super v6;
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_215BBD000, "NFCTagReaderSession restartPolling", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = self;
  objc_sync_enter(v4);
  connectedTag = v4->_connectedTag;
  v4->_connectedTag = 0;

  objc_sync_exit(v4);
  v6.receiver = v4;
  v6.super_class = (Class)NFCTagReaderSession;
  -[NFCReaderSession restartPolling](&v6, sel_restartPolling);
}

- (void)connectToTag:(id)tag completionHandler:(void *)completionHandler
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  char v12;
  id v13;
  NFCTagReaderSession *v14;
  id v15;
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
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v28;
  const char *ClassName;
  const char *Name;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  NFCTagReaderSession *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _BYTE state[18];
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = tag;
  v9 = completionHandler;
  v10 = _os_activity_create(&dword_215BBD000, "NFCTagReaderSession connectToTag:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v10, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    v42 = 0;
    v12 = objc_msgSend(v11, "isMatchingSession:outError:", self, &v42);
    v13 = v42;
    if ((v12 & 1) != 0)
    {
      v14 = self;
      objc_sync_enter(v14);
      objc_storeStrong((id *)&v14->_connectedTag, tag);
      v15 = v11;
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke_21;
      v36[3] = &unk_24D44FD20;
      v36[4] = v14;
      v38 = v9;
      v37 = v13;
      objc_msgSend(v15, "_connectWithCompletionHandler:", v36);

      objc_sync_exit(v14);
    }
    else
    {
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke_19;
      v39[3] = &unk_24D44F9D8;
      v41 = v9;
      v40 = v13;
      -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v39);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v28 = 43;
        else
          v28 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(3, "%c[%{public}s %{public}s]:%i Only tag from the current session is allowed", v28, ClassName, Name, 113);
      }
      NFSharedLogGetLogger();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = object_getClass(self);
        if (class_isMetaClass(v32))
          v33 = 43;
        else
          v33 = 45;
        v34 = object_getClassName(self);
        v35 = sel_getName(a2);
        *(_DWORD *)state = 67109890;
        *(_DWORD *)&state[4] = v33;
        *(_WORD *)&state[8] = 2082;
        *(_QWORD *)&state[10] = v34;
        v46 = 2082;
        v47 = v35;
        v48 = 1024;
        v49 = 113;
        _os_log_impl(&dword_215BBD000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Only tag from the current session is allowed", state, 0x22u);
      }

      v14 = v41;
    }

  }
  else
  {
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke;
    v43[3] = &unk_24D44F8B0;
    v44 = v9;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v43);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(self);
      v20 = sel_getName(a2);
      v16(3, "%c[%{public}s %{public}s]:%i Invalid tag object", v18, v19, v20, 103);
    }
    NFSharedLogGetLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v23;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v24;
      v46 = 2082;
      v47 = v25;
      v48 = 1024;
      v49 = 103;
      _os_log_impl(&dword_215BBD000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag object", state, 0x22u);
    }

    v11 = v44;
  }

}

void __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __54__NFCTagReaderSession_connectToTag_completionHandler___block_invoke_21(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = 0;

    objc_sync_exit(v3);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:](NFCReaderSession, "featureAvailable:", 16);
}

- (void)_callbackDidBecomeActive
{
  void *v4;
  char v5;
  uint64_t v6;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *v8;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
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
  if (-[NFCReaderSession delegateType](self, "delegateType") != 2
    && -[NFCReaderSession delegateType](self, "delegateType") != 3)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v28 = -[NFCReaderSession delegateType](self, "delegateType");
      v24 = 45;
      if (isMetaClass)
        v24 = 43;
      v19(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v24, ClassName, Name, 148, v28);
    }
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    *(_DWORD *)buf = 67110146;
    v31 = v26;
    v32 = 2082;
    v33 = object_getClassName(self);
    v34 = 2082;
    v35 = sel_getName(a2);
    v36 = 1024;
    v37 = 148;
    v38 = 2048;
    v39 = -[NFCReaderSession delegateType](self, "delegateType");
    v15 = "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld";
    v16 = v12;
    v17 = 44;
    goto LABEL_23;
  }
  -[NFCReaderSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __47__NFCTagReaderSession__callbackDidBecomeActive__block_invoke;
    v29[3] = &unk_24D44FB90;
    v29[4] = self;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v29);
    return;
  }
  v6 = NFLogGetLogger();
  if (v6)
  {
    v7 = (void (*)(uint64_t, const char *, ...))v6;
    v8 = object_getClass(self);
    v9 = class_isMetaClass(v8);
    v10 = object_getClassName(self);
    v27 = sel_getName(a2);
    v11 = 45;
    if (v9)
      v11 = 43;
    v7(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -tagReaderSessionDidBecomeActive: method", v11, v10, v27, 145);
  }
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    *(_DWORD *)buf = 67109890;
    v31 = v14;
    v32 = 2082;
    v33 = object_getClassName(self);
    v34 = 2082;
    v35 = sel_getName(a2);
    v36 = 1024;
    v37 = 145;
    v15 = "%c[%{public}s %{public}s]:%i Delegate does not implement -tagReaderSessionDidBecomeActive: method";
    v16 = v12;
    v17 = 34;
LABEL_23:
    _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
LABEL_24:

}

void __47__NFCTagReaderSession__callbackDidBecomeActive__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagReaderSessionDidBecomeActive:", *(_QWORD *)(a1 + 32));

}

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  __objc2_class **v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  NFCTagReaderSession *v33;
  uint64_t v34;
  NFCTag *connectedTag;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v38;
  const char *ClassName;
  const char *Name;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  int v46;
  void *v47;
  void *v48;
  _QWORD v50[5];
  id v51;
  int v52;
  objc_super v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NFCTagReaderSession;
  -[NFCReaderSession didDetectTags:connectedTagIndex:](&v53, sel_didDetectTags_connectedTagIndex_, v6, a4);
  -[NFCReaderSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v52 = 0;
    v9 = (void *)objc_opt_new();
    if (objc_msgSend(v6, "count"))
    {
      v10 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "type");
        v13 = off_24D44F1A0;
        if (v12 == 8)
          goto LABEL_49;
        v14 = objc_msgSend(v11, "type");
        v13 = off_24D44F198;
        if (v14 == 7)
          goto LABEL_49;
        v15 = objc_msgSend(v11, "type");
        v13 = off_24D44F1B0;
        if (v15 == 9)
          goto LABEL_49;
        v16 = objc_msgSend(v11, "type");
        v13 = off_24D44F1B0;
        if (v16 == 14)
          goto LABEL_49;
        v17 = objc_msgSend(v11, "type");
        v13 = off_24D44F1B0;
        if (v17 == 15)
          goto LABEL_49;
        v18 = objc_msgSend(v11, "type");
        v13 = off_24D44F1B0;
        if (v18 == 16)
          goto LABEL_49;
        v19 = objc_msgSend(v11, "type");
        v13 = off_24D44F1A8;
        if (v19 == 3)
          goto LABEL_49;
        v20 = objc_msgSend(v11, "type");
        v13 = off_24D44F1A8;
        if (v20 == 6)
          goto LABEL_49;
        if (objc_msgSend(v11, "type") == 5)
        {
          objc_msgSend(v11, "tagB");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "pupi");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v52, 4);
          v46 = objc_msgSend(v47, "isEqualToData:", v22);

          v13 = off_24D44F1A8;
          if (v46)
          {
LABEL_49:
            v21 = (void *)objc_msgSend(objc_alloc(*v13), "initWithSession:tag:startupConfig:", self, v11, 0);
            if (v21)
            {
              objc_msgSend(v9, "addObject:", v21);

            }
          }
        }

        ++v10;
      }
      while (v10 < objc_msgSend(v6, "count"));
    }
    if (objc_msgSend(v9, "count"))
    {
      if (a4 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v33 = self;
        objc_sync_enter(v33);
        objc_msgSend(v9, "objectAtIndex:", a4);
        v34 = objc_claimAutoreleasedReturnValue();
        connectedTag = v33->_connectedTag;
        v33->_connectedTag = (NFCTag *)v34;

        objc_sync_exit(v33);
      }
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __55__NFCTagReaderSession_didDetectTags_connectedTagIndex___block_invoke;
      v50[3] = &unk_24D44FAF0;
      v50[4] = self;
      v51 = v9;
      -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v50);

    }
    else
    {
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v38 = 43;
        else
          v38 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i No suitable tag found", v38, ClassName, Name, 193);
      }
      NFSharedLogGetLogger();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = object_getClass(self);
        if (class_isMetaClass(v42))
          v43 = 43;
        else
          v43 = 45;
        v44 = object_getClassName(self);
        v45 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v55 = v43;
        v56 = 2082;
        v57 = v44;
        v58 = 2082;
        v59 = v45;
        v60 = 1024;
        v61 = 193;
        _os_log_impl(&dword_215BBD000, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No suitable tag found", buf, 0x22u);
      }

    }
  }
  else
  {
    v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      v23(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -tagReaderSession:didDetectTags: method", v25, v26, v27, 159);
    }
    NFSharedLogGetLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(self);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v55 = v30;
      v56 = 2082;
      v57 = v31;
      v58 = 2082;
      v59 = v32;
      v60 = 1024;
      v61 = 159;
      _os_log_impl(&dword_215BBD000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Delegate does not implement -tagReaderSession:didDetectTags: method", buf, 0x22u);
    }

  }
}

void __55__NFCTagReaderSession_didDetectTags_connectedTagIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "tagReaderSession:didDetectTags:", v2, v3);

}

- (id)connectedTag
{
  return self->_connectedTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong(&self->_swiftDelegateWrapper, 0);
}

@end
