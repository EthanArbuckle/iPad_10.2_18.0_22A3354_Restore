@implementation NFReaderSession

- (id)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a4;
  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__NFReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke;
  v13[3] = &unk_1E3B51488;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __73__NFReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke_9;
  v12[3] = &unk_1E3B51488;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = a2;
  objc_msgSend(v9, "enableContinuousWave:withFrequencySweep:completion:", v5, v4, v12);

  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __73__NFReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 20, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 20;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __73__NFReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke_9(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 24, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 24;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
}

- (NFReaderSession)initWithUIType:(int64_t)a3
{
  NFReaderSession *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NFReaderSession;
  result = -[NFSession init](&v5, sel_init);
  if (result)
    result->_actionSheetUI = a3;
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NFReaderSession *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFReaderSessionDelegate)delegate
{
  NFReaderSession *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFReaderSessionDelegate *)WeakRetained;
}

- (void)endSession
{
  objc_super v3;

  -[NFReaderSession setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NFReaderSession;
  -[NFSession endSession](&v3, sel_endSession);
}

- (void)didTerminate:(id)a3
{
  id v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  void *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v8(5, "%c[%{public}s %{public}s]:%i Session has terminated due to: %{public}@", v11, ClassName, Name, 115, v5);
  }
  dispatch_get_specific(*v6);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    *(_DWORD *)buf = 67110146;
    v19 = v14;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 115;
    v26 = 2114;
    v27 = v5;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session has terminated due to: %{public}@", buf, 0x2Cu);
  }

  -[NFReaderSession delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFReaderSession endSession](self, "endSession");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "readerSessionDidEndUnexpectedly:reason:", self, v5);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "readerSessionDidEndUnexpectedly:", self);
  }

}

- (void)didUIControllerInvalidate:(id)a3
{
  id v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[NFReaderSession actionSheetUI](self, "actionSheetUI") == 1)
  {
    -[NFReaderSession didTerminate:](self, "didTerminate:", v5);
  }
  else
  {
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(5, "%c[%{public}s %{public}s]:%i Not supported", v12, ClassName, Name, 134);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      *(_DWORD *)buf = 67109890;
      v18 = v15;
      v19 = 2082;
      v20 = object_getClassName(self);
      v21 = 2082;
      v22 = sel_getName(a2);
      v23 = 1024;
      v24 = 134;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not supported", buf, 0x22u);
    }

  }
}

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  NFReaderSession *v17;
  unint64_t v18;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__NFReaderSession_didDetectTags_connectedTagIndex___block_invoke;
  v15[3] = &unk_1E3B53410;
  v9 = v7;
  v17 = self;
  v18 = a4;
  v16 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);

  v14.receiver = self;
  v14.super_class = (Class)NFReaderSession;
  -[NFSession callbackQueue](&v14, sel_callbackQueue);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __51__NFReaderSession_didDetectTags_connectedTagIndex___block_invoke_2;
  block[3] = &unk_1E3B51E70;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(v10, block);

}

void __51__NFReaderSession_didDetectTags_connectedTagIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  NFTag *obj;

  v5 = a2;
  obj = -[NFTag initWithNFTag:]([NFTag alloc], "initWithNFTag:", v5);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", obj);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v6 == a3)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 72), obj);

}

void __51__NFReaderSession_didDetectTags_connectedTagIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readerSession:didDetectTags:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)didDetectNDEFMessages:(id)a3 fromTags:(id)a4 connectedTagIndex:(unint64_t)a5 updateUICallback:(id)a6
{
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
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

  v27 = *MEMORY[0x1E0C80C00];
  v8 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(5, "%c[%{public}s %{public}s]:%i Not supported", v14, ClassName, Name, 161);
  }
  dispatch_get_specific(*v8);
  NFSharedLogGetLogger();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v20 = v17;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 161;
    _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not supported", buf, 0x22u);
  }

}

- (void)didDetectExternalReaderWithNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFReaderSession;
  -[NFSession callbackQueue](&v9, sel_callbackQueue);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__NFReaderSession_didDetectExternalReaderWithNotification___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__NFReaderSession_didDetectExternalReaderWithNotification___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readerSession:externalReaderFieldNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)didEndUnexpectedly
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NFReaderSession;
  -[NFSession callbackQueue](&v5, sel_callbackQueue);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NFReaderSession_didEndUnexpectedly__block_invoke;
  block[3] = &unk_1E3B51A60;
  block[4] = self;
  dispatch_async(v3, block);

}

id __37__NFReaderSession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 7, v9);
    objc_msgSend(v4, "readerSessionDidEndUnexpectedly:reason:", v5, v10);

LABEL_5:
    goto LABEL_6;
  }
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readerSessionDidEndUnexpectedly:", *(_QWORD *)(a1 + 32));
    goto LABEL_5;
  }
LABEL_6:
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)NFReaderSession;
  return objc_msgSendSuper2(&v13, sel_didEndUnexpectedly);
}

- (BOOL)setECPPayload:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v13[8];
  _QWORD v14[7];
  os_activity_scope_state_s state;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "setECPPayload:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__NFReaderSession_setECPPayload_error___block_invoke;
  v14[3] = &unk_1E3B51998;
  v14[5] = &state;
  v14[6] = a2;
  v14[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __39__NFReaderSession_setECPPayload_error___block_invoke_91;
  v13[3] = &unk_1E3B517E0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  v13[7] = a2;
  objc_msgSend(v10, "setECPPayload:completion:", v7, v13);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v11 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __39__NFReaderSession_setECPPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 197, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 197;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __39__NFReaderSession_setECPPayload_error___block_invoke_91(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 202, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 202;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)startPolling
{
  return -[NFReaderSession startPollingWithError:](self, "startPollingWithError:", 0);
}

- (BOOL)startPollingWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = _os_activity_create(&dword_19B5EB000, "startPollingWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__NFReaderSession_startPollingWithError___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __41__NFReaderSession_startPollingWithError___block_invoke_92;
  v11[3] = &unk_1E3B517E0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = &v18;
  v11[7] = a2;
  objc_msgSend(v8, "startPollingForTags:sessionConfig:completion:", 1, 0, v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __41__NFReaderSession_startPollingWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 228, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 228;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __41__NFReaderSession_startPollingWithError___block_invoke_92(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 233, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 233;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)startLPCDPollingWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = _os_activity_create(&dword_19B5EB000, "startPollingWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__NFReaderSession_startLPCDPollingWithError___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __45__NFReaderSession_startLPCDPollingWithError___block_invoke_93;
  v11[3] = &unk_1E3B517E0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = &v18;
  v11[7] = a2;
  objc_msgSend(v8, "startPollingForTags:sessionConfig:completion:", 1, 2048, v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __45__NFReaderSession_startLPCDPollingWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 253, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 253;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __45__NFReaderSession_startLPCDPollingWithError___block_invoke_93(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 258, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 258;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)startPollingForTechnology:(unsigned int)a3
{
  return -[NFReaderSession startPollingForTechnology:error:](self, "startPollingForTechnology:error:", *(_QWORD *)&a3, 0);
}

- (BOOL)startPollingForTechnology:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD v15[8];
  _QWORD v16[7];
  os_activity_scope_state_s state;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  const __CFString *v26;
  _QWORD v27[2];

  v5 = *(_QWORD *)&a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_19B5EB000, "startPollingForTechnology:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = 0;
  v26 = CFSTR("tech");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__NFReaderSession_startPollingForTechnology_error___block_invoke;
  v16[3] = &unk_1E3B51488;
  v16[4] = self;
  v16[5] = &state;
  v16[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __51__NFReaderSession_startPollingForTechnology_error___block_invoke_94;
  v15[3] = &unk_1E3B517E0;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = &v22;
  v15[7] = a2;
  objc_msgSend(v12, "startPollingWithConfig:completion:", v10, v15);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v13 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

void __51__NFReaderSession_startPollingForTechnology_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 289, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 289;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __51__NFReaderSession_startPollingForTechnology_error___block_invoke_94(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 293, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 293;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)startPollingWithConfig:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[8];
  _QWORD v15[7];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "startPollingWithConfig:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__NFReaderSession_startPollingWithConfig_error___block_invoke;
  v15[3] = &unk_1E3B51488;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __48__NFReaderSession_startPollingWithConfig_error___block_invoke_95;
  v14[3] = &unk_1E3B517E0;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = &v21;
  v14[7] = a2;
  objc_msgSend(v10, "startPollingWithConfig:completion:", v11, v14);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v12 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __48__NFReaderSession_startPollingWithConfig_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 316, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 316;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __48__NFReaderSession_startPollingWithConfig_error___block_invoke_95(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 320, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 320;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)stopPolling
{
  return -[NFReaderSession stopPollingWithError:](self, "stopPollingWithError:", 0);
}

- (BOOL)stopPollingWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = _os_activity_create(&dword_19B5EB000, "stopPollingWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__NFReaderSession_stopPollingWithError___block_invoke;
  v12[3] = &unk_1E3B51488;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __40__NFReaderSession_stopPollingWithError___block_invoke_96;
  v11[3] = &unk_1E3B517E0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = &v18;
  v11[7] = a2;
  objc_msgSend(v8, "stopPollingWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __40__NFReaderSession_stopPollingWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 347, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 347;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __40__NFReaderSession_stopPollingWithError___block_invoke_96(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 351, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 351;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)restartPollingWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = _os_activity_create(&dword_19B5EB000, "restartPollingWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__NFReaderSession_restartPollingWithError___block_invoke;
  v12[3] = &unk_1E3B51488;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __43__NFReaderSession_restartPollingWithError___block_invoke_97;
  v11[3] = &unk_1E3B517E0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = &v18;
  v11[7] = a2;
  objc_msgSend(v8, "restartPollingWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __43__NFReaderSession_restartPollingWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 373, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 373;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __43__NFReaderSession_restartPollingWithError___block_invoke_97(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 377, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 377;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)connectTag:(id)a3
{
  id v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  BOOL v16;
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

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToNFTag:", self->_connectedTag))
  {
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i Tag is in connected state", v12, ClassName, Name, 393);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      *(_DWORD *)buf = 67109890;
      v20 = v15;
      v21 = 2082;
      v22 = object_getClassName(self);
      v23 = 2082;
      v24 = sel_getName(a2);
      v25 = 1024;
      v26 = 393;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag is in connected state", buf, 0x22u);
    }

    v16 = 1;
  }
  else
  {
    v16 = -[NFReaderSession connectTag:error:](self, "connectTag:error:", v5, 0);
  }

  return v16;
}

- (BOOL)connectTag:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  _QWORD v15[5];
  id v16;
  os_activity_scope_state_s *p_state;
  uint64_t *v18;
  SEL v19;
  _QWORD v20[7];
  os_activity_scope_state_s state;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "connectTag:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__15;
  v24 = __Block_byref_object_dispose__15;
  v25 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DE78F0]), "initWithNFTag:", v7);
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __36__NFReaderSession_connectTag_error___block_invoke;
  v20[3] = &unk_1E3B51488;
  v20[4] = self;
  v20[5] = &state;
  v20[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __36__NFReaderSession_connectTag_error___block_invoke_100;
  v15[3] = &unk_1E3B53438;
  p_state = &state;
  v18 = &v26;
  v15[4] = self;
  v19 = a2;
  v12 = v7;
  v16 = v12;
  objc_msgSend(v11, "connect:completion:", v9, v15);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __36__NFReaderSession_connectTag_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 410, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 410;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __36__NFReaderSession_connectTag_error___block_invoke_100(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 414, v5);
    }
    dispatch_get_specific(*v6);
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
      v16 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      v22 = v14;
      v23 = 2082;
      v24 = v15;
      v25 = 2082;
      v26 = v16;
      v27 = 1024;
      v28 = 414;
      v29 = 2114;
      v30 = v5;
      _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 72);
    *(_QWORD *)(v17 + 72) = 0;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  }

}

- (BOOL)disconnectTag
{
  return -[NFReaderSession disconnectTagWithError:](self, "disconnectTagWithError:", 0);
}

- (BOOL)disconnectTagWithError:(id *)a3
{
  return -[NFReaderSession _disconnectTagWithCardRemoval:outError:](self, "_disconnectTagWithCardRemoval:outError:", 0, a3);
}

- (BOOL)disconnectTagWithCardRemoval:(id *)a3
{
  return -[NFReaderSession _disconnectTagWithCardRemoval:outError:](self, "_disconnectTagWithCardRemoval:outError:", 1, a3);
}

- (BOOL)_disconnectTagWithCardRemoval:(BOOL)a3 outError:(id *)a4
{
  _BOOL8 v5;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[8];
  _QWORD v15[7];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a3;
  if (a3)
    v8 = "_disconnectTagWithCardRemoval:Y outError:";
  else
    v8 = "_disconnectTagWithCardRemoval:N outError:";
  v9 = _os_activity_create(&dword_19B5EB000, v8, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__NFReaderSession__disconnectTagWithCardRemoval_outError___block_invoke;
  v15[3] = &unk_1E3B51488;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __58__NFReaderSession__disconnectTagWithCardRemoval_outError___block_invoke_102;
  v14[3] = &unk_1E3B517E0;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = &v21;
  v14[7] = a2;
  objc_msgSend(v11, "disconnectWithCardRemoval:completion:", v5, v14);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v12 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __58__NFReaderSession__disconnectTagWithCardRemoval_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 458, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 458;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __58__NFReaderSession__disconnectTagWithCardRemoval_outError___block_invoke_102(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *ClassName;
  const char *Name;
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
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 462, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v21 = v13;
      v22 = 2082;
      v23 = v14;
      v24 = 2082;
      v25 = v15;
      v26 = 1024;
      v27 = 462;
      v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 72);
  *(_QWORD *)(v16 + 72) = 0;

}

- (BOOL)checkNdefSupportsRead:(BOOL *)a3 andWrite:(BOOL *)a4
{
  return -[NFReaderSession checkNdefSupportsRead:andWrite:error:](self, "checkNdefSupportsRead:andWrite:error:", a3, a4, 0);
}

- (BOOL)checkNdefSupportsRead:(BOOL *)a3 andWrite:(BOOL *)a4 error:(id *)a5
{
  NSObject *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD v15[10];
  _QWORD v16[7];
  os_activity_scope_state_s state;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v10 = _os_activity_create(&dword_19B5EB000, "checkNdefSupportsRead:andWrite:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__NFReaderSession_checkNdefSupportsRead_andWrite_error___block_invoke;
  v16[3] = &unk_1E3B51488;
  v16[4] = self;
  v16[5] = &state;
  v16[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __56__NFReaderSession_checkNdefSupportsRead_andWrite_error___block_invoke_103;
  v15[3] = &unk_1E3B53460;
  v15[4] = self;
  v15[5] = &state;
  v15[8] = a3;
  v15[9] = a4;
  v15[6] = &v22;
  v15[7] = a2;
  objc_msgSend(v12, "checkNdefSupportWithCompletion:", v15);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v13 = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __56__NFReaderSession_checkNdefSupportsRead_andWrite_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 492, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 492;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __56__NFReaderSession_checkNdefSupportsRead_andWrite_error___block_invoke_103(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  _BYTE *v19;
  _BYTE *v20;
  _BYTE *v21;
  _BYTE *v22;
  _BYTE *v23;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 496, v7);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v27 = v16;
      v28 = 2082;
      v29 = v17;
      v30 = 2082;
      v31 = v18;
      v32 = 1024;
      v33 = 496;
      v34 = 2114;
      v35 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    switch(a2)
    {
      case 0:
      case 1:
        v19 = *(_BYTE **)(a1 + 64);
        if (v19)
          *v19 = 0;
        goto LABEL_21;
      case 2:
      case 4:
        v20 = *(_BYTE **)(a1 + 64);
        if (v20)
          *v20 = 1;
        v21 = *(_BYTE **)(a1 + 72);
        if (v21)
          *v21 = 1;
        break;
      case 3:
        v22 = *(_BYTE **)(a1 + 64);
        if (v22)
          *v22 = 1;
LABEL_21:
        v23 = *(_BYTE **)(a1 + 72);
        if (v23)
          *v23 = 0;
        break;
      default:
        break;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)checkPresence
{
  return -[NFReaderSession checkPresenceWithError:](self, "checkPresenceWithError:", 0);
}

- (BOOL)checkPresenceWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = _os_activity_create(&dword_19B5EB000, "checkPresenceWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__NFReaderSession_checkPresenceWithError___block_invoke;
  v12[3] = &unk_1E3B51488;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __42__NFReaderSession_checkPresenceWithError___block_invoke_105;
  v11[3] = &unk_1E3B53488;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = &v18;
  v11[7] = a2;
  objc_msgSend(v8, "checkPresenceWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __42__NFReaderSession_checkPresenceWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 539, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 539;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __42__NFReaderSession_checkPresenceWithError___block_invoke_105(uint64_t a1, void *a2, char a3)
{
  id v6;
  const void **v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  const char *ClassName;
  const char *Name;
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
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v7 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 543, v6);
    }
    dispatch_get_specific(*v7);
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
      v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v21 = v15;
      v22 = 2082;
      v23 = v16;
      v24 = 2082;
      v25 = v17;
      v26 = 1024;
      v27 = 543;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }

}

- (BOOL)formatNdefWithKey:(id)a3
{
  return -[NFReaderSession formatNdefWithKey:error:](self, "formatNdefWithKey:error:", a3, 0);
}

- (BOOL)formatNdefWithKey:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v13[8];
  _QWORD v14[7];
  os_activity_scope_state_s state;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "formatNdefWithKey:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__NFReaderSession_formatNdefWithKey_error___block_invoke;
  v14[3] = &unk_1E3B51488;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __43__NFReaderSession_formatNdefWithKey_error___block_invoke_107;
  v13[3] = &unk_1E3B517E0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  v13[7] = a2;
  objc_msgSend(v10, "formatNdefWithKey:completion:", v7, v13);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v11 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __43__NFReaderSession_formatNdefWithKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 570, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 570;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __43__NFReaderSession_formatNdefWithKey_error___block_invoke_107(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 574, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 574;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)ndefWrite:(id)a3
{
  return -[NFReaderSession ndefWrite:error:](self, "ndefWrite:error:", a3, 0);
}

- (BOOL)ndefWrite:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[8];
  _QWORD v15[7];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "ndefWrite:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DE78C8]), "initWithNDEFMessage:", v7);

  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__NFReaderSession_ndefWrite_error___block_invoke;
  v15[3] = &unk_1E3B51488;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __35__NFReaderSession_ndefWrite_error___block_invoke_109;
  v14[3] = &unk_1E3B517E0;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = &v21;
  v14[7] = a2;
  objc_msgSend(v11, "ndefWrite:completion:", v9, v14);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v12 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

void __35__NFReaderSession_ndefWrite_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 603, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 603;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __35__NFReaderSession_ndefWrite_error___block_invoke_109(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 607, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 607;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (id)ndefRead
{
  return -[NFReaderSession ndefReadWithError:](self, "ndefReadWithError:", 0);
}

- (id)ndefReadWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NFNdefMessage *v9;
  NFNdefMessage *v10;
  _QWORD v12[8];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  os_activity_scope_state_s state;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = _os_activity_create(&dword_19B5EB000, "ndefReadWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v24 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__NFReaderSession_ndefReadWithError___block_invoke;
  v13[3] = &unk_1E3B51488;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __37__NFReaderSession_ndefReadWithError___block_invoke_110;
  v12[3] = &unk_1E3B534B0;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &state;
  v12[7] = a2;
  objc_msgSend(v8, "ndefReadWithCompletion:", v12);

  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v9 = [NFNdefMessage alloc];
  v10 = -[NFNdefMessage initWithNDEFMessage:](v9, "initWithNDEFMessage:", *(_QWORD *)(state.opaque[1] + 40));
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __37__NFReaderSession_ndefReadWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 635, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 635;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __37__NFReaderSession_ndefReadWithError___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 639, v6);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 639;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }

}

- (id)transceive:(id)a3
{
  return -[NFReaderSession transceive:error:](self, "transceive:error:", a3, 0);
}

- (id)transceive:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  os_activity_scope_state_s state;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "transceive:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__15;
  v24 = __Block_byref_object_dispose__15;
  v25 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__NFReaderSession_transceive_error___block_invoke;
  v14[3] = &unk_1E3B51488;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __36__NFReaderSession_transceive_error___block_invoke_113;
  v13[3] = &unk_1E3B534D8;
  v13[4] = self;
  v13[5] = &v15;
  v13[6] = &state;
  v13[7] = a2;
  objc_msgSend(v10, "transceive:completion:", v7, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v11 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&state, 8);
  return v11;
}

void __36__NFReaderSession_transceive_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 666, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 666;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __36__NFReaderSession_transceive_error___block_invoke_113(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
    v9 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 670, v8);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(*(id *)(a1 + 32));
      v19 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v23 = v17;
      v24 = 2082;
      v25 = v18;
      v26 = 2082;
      v27 = v19;
      v28 = 1024;
      v29 = 670;
      v30 = 2114;
      v31 = v8;
      _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }

}

- (id)felicaState
{
  return -[NFReaderSession felicaStateWithError:](self, "felicaStateWithError:", 0);
}

- (id)felicaStateWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = _os_activity_create(&dword_19B5EB000, "felicaStateWithError", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__NFReaderSession_felicaStateWithError___block_invoke;
  v12[3] = &unk_1E3B51488;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __40__NFReaderSession_felicaStateWithError___block_invoke_115;
  v11[3] = &unk_1E3B51808;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  v11[7] = a2;
  objc_msgSend(v8, "felicaStateForSystemCode:withRequestService:performSearchServiceCode:completion:", 0, MEMORY[0x1E0C9AA60], 1, v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __40__NFReaderSession_felicaStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 697, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 697;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __40__NFReaderSession_felicaStateWithError___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 701, v7);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 701;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

- (id)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 withBlockReadList:(id)a5 performSearchServiceCode:(BOOL)a6
{
  return -[NFReaderSession felicaStateForSystemCode:withRequestService:withBlockReadList:performSearchServiceCode:error:](self, "felicaStateForSystemCode:withRequestService:withBlockReadList:performSearchServiceCode:error:", a3, a4, a5, a6, 0);
}

- (id)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 withBlockReadList:(id)a5 performSearchServiceCode:(BOOL)a6 error:(id *)a7
{
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t Logger;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *ClassName;
  const char *Name;
  _BOOL4 v37;
  id v39;
  _QWORD v42[8];
  _QWORD v43[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t state;
  _BYTE state_8[40];
  _BYTE v56[128];
  uint64_t v57;

  v37 = a6;
  v57 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_19B5EB000, "felicaStateForSystemCode:withRequestService:withBlockReadList:performSearchServiceCode:error", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state = 0;
  *(_QWORD *)state_8 = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)&state);
  os_activity_scope_leave((os_activity_scope_state_t)&state);

  v10 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v51;
    v15 = 0x1E0C99000uLL;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(v15 + 3408), "NF_dataWithHexString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v10, "addObject:", v18);
          }
          else
          {
            v19 = v11;
            v20 = v10;
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            Logger = NFLogGetLogger();
            if (Logger)
            {
              v22 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v25 = 45;
              if (isMetaClass)
                v25 = 43;
              v22(5, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", v25, ClassName, Name, 731, v17);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            NFSharedLogGetLogger();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = object_getClass(self);
              if (class_isMetaClass(v27))
                v28 = 43;
              else
                v28 = 45;
              v29 = object_getClassName(self);
              v30 = sel_getName(a2);
              LODWORD(state) = 67110146;
              HIDWORD(state) = v28;
              *(_WORD *)state_8 = 2082;
              *(_QWORD *)&state_8[2] = v29;
              *(_WORD *)&state_8[10] = 2082;
              *(_QWORD *)&state_8[12] = v30;
              *(_WORD *)&state_8[20] = 1024;
              *(_DWORD *)&state_8[22] = 731;
              *(_WORD *)&state_8[26] = 2114;
              *(_QWORD *)&state_8[28] = v17;
              _os_log_impl(&dword_19B5EB000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", (uint8_t *)&state, 0x2Cu);
            }

            v10 = v20;
            v11 = v19;
            v15 = 0x1E0C99000;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "addObject:", v17);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v13);
  }

  state = 0;
  *(_QWORD *)state_8 = &state;
  *(_QWORD *)&state_8[8] = 0x3032000000;
  *(_QWORD *)&state_8[16] = __Block_byref_object_copy__15;
  *(_QWORD *)&state_8[24] = __Block_byref_object_dispose__15;
  *(_QWORD *)&state_8[32] = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__15;
  v48 = __Block_byref_object_dispose__15;
  v49 = 0;
  v31 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __112__NFReaderSession_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_error___block_invoke;
  v43[3] = &unk_1E3B51488;
  v43[4] = self;
  v43[5] = &v44;
  v43[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v31;
  v42[1] = 3221225472;
  v42[2] = __112__NFReaderSession_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_error___block_invoke_119;
  v42[3] = &unk_1E3B51808;
  v42[4] = self;
  v42[5] = &v44;
  v42[6] = &state;
  v42[7] = a2;
  objc_msgSend(v32, "felicaStateForSystemCode:withRequestService:performSearchServiceCode:completion:", v39, v10, v37, v42);

  if (a7)
    *a7 = objc_retainAutorelease((id)v45[5]);
  v33 = *(id *)(*(_QWORD *)state_8 + 40);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&state, 8);
  return v33;
}

void __112__NFReaderSession_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 743, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 743;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __112__NFReaderSession_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_error___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 747, v7);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 747;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

- (id)felicaRequestService:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *ClassName;
  const char *Name;
  void *v32;
  _QWORD v35[8];
  _QWORD v36[7];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  os_activity_scope_state_s state;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "felicaRequestService:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__15;
  v50 = __Block_byref_object_dispose__15;
  v51 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__15;
  v45 = __Block_byref_object_dispose__15;
  v46 = 0;
  v6 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v62, 16);
  v32 = v6;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v6, "addObject:", v13);
          }
          else
          {
            v14 = v7;
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
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
              v16(5, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", v19, ClassName, Name, 775, v12);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            NFSharedLogGetLogger();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = object_getClass(self);
              if (class_isMetaClass(v21))
                v22 = 43;
              else
                v22 = 45;
              v23 = object_getClassName(self);
              v24 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v53 = v22;
              v54 = 2082;
              v55 = v23;
              v56 = 2082;
              v57 = v24;
              v58 = 1024;
              v59 = 775;
              v60 = 2114;
              v61 = v12;
              _os_log_impl(&dword_19B5EB000, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", buf, 0x2Cu);
            }

            v7 = v14;
            v6 = v32;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v62, 16);
    }
    while (v9);
  }

  v25 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __46__NFReaderSession_felicaRequestService_error___block_invoke;
  v36[3] = &unk_1E3B51998;
  v36[4] = self;
  v36[5] = &v41;
  v36[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __46__NFReaderSession_felicaRequestService_error___block_invoke_120;
  v35[3] = &unk_1E3B53500;
  v35[4] = self;
  v35[5] = &v41;
  v35[6] = &state;
  v35[7] = a2;
  objc_msgSend(v26, "felicaRequestService:completion:", v32, v35);

  if (a4)
    *a4 = objc_retainAutorelease((id)v42[5]);
  v27 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&state, 8);

  return v27;
}

void __46__NFReaderSession_felicaRequestService_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 783, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 783;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __46__NFReaderSession_felicaRequestService_error___block_invoke_120(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  id *v19;
  void *v20;
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
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 787, v7);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 787;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a3;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a2;
  }
  objc_storeStrong(v19, v20);

}

- (id)felicaRequestService:(id)a3 forSystemCode:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *ClassName;
  const char *Name;
  id v34;
  void *v35;
  _QWORD v38[8];
  _QWORD v39[7];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  os_activity_scope_state_s state;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  v7 = _os_activity_create(&dword_19B5EB000, "felicaRequestService:forSystemCode:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__15;
  v53 = __Block_byref_object_dispose__15;
  v54 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__15;
  v48 = __Block_byref_object_dispose__15;
  v49 = 0;
  v8 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v65, 16);
  v35 = v8;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v8, "addObject:", v15);
          }
          else
          {
            v16 = v9;
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            Logger = NFLogGetLogger();
            if (Logger)
            {
              v18 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v21 = 45;
              if (isMetaClass)
                v21 = 43;
              v18(5, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", v21, ClassName, Name, 817, v14);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            NFSharedLogGetLogger();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = object_getClass(self);
              if (class_isMetaClass(v23))
                v24 = 43;
              else
                v24 = 45;
              v25 = object_getClassName(self);
              v26 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v56 = v24;
              v57 = 2082;
              v58 = v25;
              v59 = 2082;
              v60 = v26;
              v61 = 1024;
              v62 = 817;
              v63 = 2114;
              v64 = v14;
              _os_log_impl(&dword_19B5EB000, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", buf, 0x2Cu);
            }

            v9 = v16;
            v8 = v35;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v65, 16);
    }
    while (v11);
  }

  v27 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __60__NFReaderSession_felicaRequestService_forSystemCode_error___block_invoke;
  v39[3] = &unk_1E3B51998;
  v39[4] = self;
  v39[5] = &v44;
  v39[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v27;
  v38[1] = 3221225472;
  v38[2] = __60__NFReaderSession_felicaRequestService_forSystemCode_error___block_invoke_122;
  v38[3] = &unk_1E3B53500;
  v38[4] = self;
  v38[5] = &v44;
  v38[6] = &state;
  v38[7] = a2;
  objc_msgSend(v28, "felicaRequestService:forSystemCode:completion:", v35, v34, v38);

  if (a5)
    *a5 = objc_retainAutorelease((id)v45[5]);
  v29 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&state, 8);

  return v29;
}

void __60__NFReaderSession_felicaRequestService_forSystemCode_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 825, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 825;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __60__NFReaderSession_felicaRequestService_forSystemCode_error___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  id *v19;
  void *v20;
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
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 829, v7);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 829;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a3;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a2;
  }
  objc_storeStrong(v19, v20);

}

- (id)updateUIAlertMessage:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const void **v10;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  const char *Name;
  _QWORD v24[7];
  _QWORD v25[7];
  uint64_t state;
  _BYTE state_8[32];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "updateUIAlertMessage:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state = 0;
  *(_QWORD *)state_8 = 0;
  os_activity_scope_enter(v6, (os_activity_scope_state_t)&state);
  os_activity_scope_leave((os_activity_scope_state_t)&state);

  if (self->_actionSheetUI)
  {
    state = 0;
    *(_QWORD *)state_8 = &state;
    *(_QWORD *)&state_8[8] = 0x3032000000;
    *(_QWORD *)&state_8[16] = __Block_byref_object_copy__15;
    *(_QWORD *)&state_8[24] = __Block_byref_object_dispose__15;
    v28 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __40__NFReaderSession_updateUIAlertMessage___block_invoke;
    v25[3] = &unk_1E3B51998;
    v25[5] = &state;
    v25[6] = a2;
    v25[4] = self;
    -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __40__NFReaderSession_updateUIAlertMessage___block_invoke_124;
    v24[3] = &unk_1E3B51998;
    v24[5] = &state;
    v24[6] = a2;
    v24[4] = self;
    objc_msgSend(v8, "updateSharingUIScanText:completion:", v5, v24);

    v9 = *(id *)(*(_QWORD *)state_8 + 40);
    _Block_object_dispose(&state, 8);

  }
  else
  {
    v10 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v12(5, "%c[%{public}s %{public}s]:%i Session does not support UI", v16, ClassName, Name, 849);
    }
    dispatch_get_specific(*v10);
    NFSharedLogGetLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      LODWORD(state) = 67109890;
      HIDWORD(state) = v19;
      *(_WORD *)state_8 = 2082;
      *(_QWORD *)&state_8[2] = v20;
      *(_WORD *)&state_8[10] = 2082;
      *(_QWORD *)&state_8[12] = v21;
      *(_WORD *)&state_8[20] = 1024;
      *(_DWORD *)&state_8[22] = 849;
      _os_log_impl(&dword_19B5EB000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session does not support UI", (uint8_t *)&state, 0x22u);
    }

    v9 = 0;
  }

  return v9;
}

void __40__NFReaderSession_updateUIAlertMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 856, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 856;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __40__NFReaderSession_updateUIAlertMessage___block_invoke_124(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 860, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 860;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)skipMifareClassification
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  _QWORD v10[7];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = _os_activity_create(&dword_19B5EB000, "skipMifareClassification:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__NFReaderSession_skipMifareClassification__block_invoke;
  v10[3] = &unk_1E3B51998;
  v10[5] = &state;
  v10[6] = a2;
  v10[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __43__NFReaderSession_skipMifareClassification__block_invoke_125;
  v9[3] = &unk_1E3B51998;
  v9[5] = &state;
  v9[6] = a2;
  v9[4] = self;
  objc_msgSend(v6, "skipMifareClassificationWithCompletion:", v9);

  v7 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v7;
}

void __43__NFReaderSession_skipMifareClassification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 875, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 875;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __43__NFReaderSession_skipMifareClassification__block_invoke_125(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 879, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 879;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)performVAS:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[8];
  _QWORD v21[7];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  os_activity_scope_state_s state;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "performVAS:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__15;
  v35 = __Block_byref_object_dispose__15;
  v36 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__15;
  v30 = __Block_byref_object_dispose__15;
  v31 = 0;
  v9 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "asDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v37, 16);
    }
    while (v12);
  }

  v16 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __36__NFReaderSession_performVAS_error___block_invoke;
  v21[3] = &unk_1E3B51998;
  v21[5] = &state;
  v21[6] = a2;
  v21[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __36__NFReaderSession_performVAS_error___block_invoke_126;
  v20[3] = &unk_1E3B52EA8;
  v20[4] = self;
  v20[5] = &state;
  v20[6] = &v26;
  v20[7] = a2;
  objc_msgSend(v17, "performVAS:completion:", v9, v20);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&state, 8);

  return v18;
}

void __36__NFReaderSession_performVAS_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 899, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 899;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __36__NFReaderSession_performVAS_error___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  NFVASResponse *v27;
  const char *ClassName;
  const char *Name;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 903, v6);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v36 = v16;
      v37 = 2082;
      v38 = v17;
      v39 = 2082;
      v40 = v18;
      v41 = 1024;
      v42 = 903;
      v43 = 2114;
      v44 = v6;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  if (objc_msgSend(v7, "count"))
  {
    v19 = objc_opt_new();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v7;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = -[NFVASResponse initWithDictionary:]([NFVASResponse alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v24);
    }

  }
}

- (BOOL)setPollingProfile:(int64_t)a3 error:(id *)a4
{
  int64_t v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  _QWORD v15[7];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  v7 = a3;
  switch(a3)
  {
    case 0:
      v8 = "setPollingProfile:Default error:";
      goto LABEL_8;
    case 1:
      v8 = "setPollingProfile:EMV error:";
      goto LABEL_8;
    case 2:
      v8 = "setPollingProfile:EMVTransB error:";
      goto LABEL_8;
    case 3:
      v8 = "setPollingProfile:EMVTransA error:";
      goto LABEL_8;
    case 4:
      v8 = "setPollingPorfile:NoECP error:";
LABEL_8:
      v9 = _os_activity_create(&dword_19B5EB000, v8, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v9, &state);
      os_activity_scope_leave(&state);

      break;
    default:
      v7 = 0;
      break;
  }
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__NFReaderSession_setPollingProfile_error___block_invoke;
  v15[3] = &unk_1E3B51998;
  v15[5] = &v17;
  v15[6] = a2;
  v15[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __43__NFReaderSession_setPollingProfile_error___block_invoke_129;
  v14[3] = &unk_1E3B51D20;
  v14[4] = &v17;
  objc_msgSend(v11, "configurePollingProfile:completion:", v7, v14);

  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v12 = v18[5] == 0;
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __43__NFReaderSession_setPollingProfile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 956, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 956;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __43__NFReaderSession_setPollingProfile_error___block_invoke_129(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)actionSheetUI
{
  return self->_actionSheetUI;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectedTag, 0);
}

- (unsigned)runScript:(id)a3 parameters:(id)a4 results:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const void **v14;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  unsigned int v28;
  _QWORD v30[4];
  id v31;
  os_activity_scope_state_s *p_state;
  uint64_t *v33;
  _QWORD v34[7];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  os_activity_scope_state_s state;
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
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = _os_activity_create(&dword_19B5EB000, "runScript:parameters:results:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (v10)
  {
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__15;
    v44 = __Block_byref_object_dispose__15;
    v45 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__15;
    v39 = __Block_byref_object_dispose__15;
    v40 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __57__NFReaderSession_Private__runScript_parameters_results___block_invoke;
    v34[3] = &unk_1E3B51998;
    v34[5] = &state;
    v34[6] = a2;
    v34[4] = self;
    -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __57__NFReaderSession_Private__runScript_parameters_results___block_invoke_259;
    v30[3] = &unk_1E3B53528;
    p_state = &state;
    v31 = v10;
    v33 = &v35;
    objc_msgSend(v13, "execRemoteAdminScript:completion:", v9, v30);

    if (a5)
      *a5 = objc_retainAutorelease((id)v36[5]);
    if (*(_QWORD *)(state.opaque[1] + 40))
    {
      v14 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v16 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v21 = 45;
        if (isMetaClass)
          v21 = 43;
        v16(3, "%c[%{public}s %{public}s]:%i %{public}@", v21, ClassName, Name, 998, *(_QWORD *)(state.opaque[1] + 40));
      }
      dispatch_get_specific(*v14);
      NFSharedLogGetLogger();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = object_getClass(self);
        if (class_isMetaClass(v23))
          v24 = 43;
        else
          v24 = 45;
        v25 = object_getClassName(self);
        v26 = sel_getName(a2);
        v27 = *(_QWORD *)(state.opaque[1] + 40);
        *(_DWORD *)buf = 67110146;
        v47 = v24;
        v48 = 2082;
        v49 = v25;
        v50 = 2082;
        v51 = v26;
        v52 = 1024;
        v53 = 998;
        v54 = 2114;
        v55 = v27;
        _os_log_impl(&dword_19B5EB000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      v28 = objc_msgSend(*(id *)(state.opaque[1] + 40), "code");
    }
    else
    {
      v28 = 0;
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&state, 8);

  }
  else
  {
    if (a5)
      *a5 = 0;
    v28 = 10;
  }

  return v28;
}

void __57__NFReaderSession_Private__runScript_parameters_results___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *ClassName;
  const char *Name;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 984, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v27 = v12;
    v28 = 2082;
    v29 = v13;
    v30 = 2082;
    v31 = v14;
    v32 = 1024;
    v33 = 984;
    v34 = 2114;
    v35 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v18);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void __57__NFReaderSession_Private__runScript_parameters_results___block_invoke_259(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v9 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  v12 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setOutTotalAPDUExecutionDuration:", a5);
  objc_msgSend(*(id *)(a1 + 32), "setOutFinalSWStatus:", a3);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

@end
