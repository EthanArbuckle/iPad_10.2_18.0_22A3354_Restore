@implementation NFCISO15693ReaderSession

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NFCISO15693ReaderSessionTag *v16;
  NSObject *v17;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v23;
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
  objc_super v35;
  uint8_t v36[128];
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NFCISO15693ReaderSession;
  -[NFCReaderSession didDetectTags:connectedTagIndex:](&v35, sel_didDetectTags_connectedTagIndex_, v7, a4);
  -[NFCReaderSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = -[NFCTag initWithSession:tag:startupConfig:]([NFCISO15693ReaderSessionTag alloc], "initWithSession:tag:startupConfig:", self, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), 1);
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v13);
    }

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __60__NFCISO15693ReaderSession_didDetectTags_connectedTagIndex___block_invoke;
    v29[3] = &unk_24D44FAF0;
    v29[4] = self;
    v30 = v10;
    v17 = v10;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v29);

  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v23 = 45;
      if (isMetaClass)
        v23 = 43;
      v19(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSession:didDetectTags: method", v23, ClassName, Name, 36);
    }
    NFSharedLogGetLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v38 = v25;
      v39 = 2082;
      v40 = v26;
      v41 = 2082;
      v42 = v27;
      v43 = 1024;
      v44 = 36;
      _os_log_impl(&dword_215BBD000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSession:didDetectTags: method", buf, 0x22u);
    }
  }

}

void __60__NFCISO15693ReaderSession_didDetectTags_connectedTagIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v4, "readerSession:didDetectTags:", v2, v3);

}

- (NFCISO15693ReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
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

- (NFCISO15693ReaderSession)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NFCISO15693ReaderSession;
  return -[NFCReaderSession initWithDelegate:sessionDelegateType:queue:pollMethod:sessionConfig:](&v5, sel_initWithDelegate_sessionDelegateType_queue_pollMethod_sessionConfig_, delegate, 1, queue, 4, 32);
}

- (void)restartPolling
{
  NSObject *v3;
  objc_super v4;
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_215BBD000, "NFCISO15693ReaderSession restartPolling", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4.receiver = self;
  v4.super_class = (Class)NFCISO15693ReaderSession;
  -[NFCReaderSession restartPolling](&v4, sel_restartPolling);
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:](NFCReaderSession, "featureAvailable:", 8);
}

@end
