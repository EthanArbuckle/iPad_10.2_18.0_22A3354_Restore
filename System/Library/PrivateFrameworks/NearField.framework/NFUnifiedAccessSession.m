@implementation NFUnifiedAccessSession

- (void)setDelegate:(id)a3
{
  id v4;
  NFUnifiedAccessSession *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFUnifiedAccessSessionDelegate)delegate
{
  NFUnifiedAccessSession *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFUnifiedAccessSessionDelegate *)WeakRetained;
}

- (void)didStartSession:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NFUnifiedAccessSession_didStartSession___block_invoke;
  block[3] = &unk_1E3B51A10;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __42__NFUnifiedAccessSession_didStartSession___block_invoke(uint64_t a1)
{
  const void **v2;
  uint64_t Logger;
  void (*v4)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  objc_super v21;
  _QWORD v22[6];
  _QWORD v23[7];
  objc_super v24;
  uint8_t buf[8];
  _BYTE v26[40];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "didEnd"))
  {
    v2 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 65, *(_QWORD *)(a1 + 40));
    }
    dispatch_get_specific(*v2);
    NFSharedLogGetLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11))
        v12 = 43;
      else
        v12 = 45;
      v13 = object_getClassName(*(id *)(a1 + 32));
      v14 = sel_getName(*(SEL *)(a1 + 48));
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v12;
      *(_WORD *)v26 = 2082;
      *(_QWORD *)&v26[2] = v13;
      *(_WORD *)&v26[10] = 2082;
      *(_QWORD *)&v26[12] = v14;
      *(_WORD *)&v26[20] = 1024;
      *(_DWORD *)&v26[22] = 65;
      *(_WORD *)&v26[26] = 2114;
      *(_QWORD *)&v26[28] = v15;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", buf, 0x2Cu);
    }

  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v24.receiver = *(id *)(a1 + 32);
    v24.super_class = (Class)NFUnifiedAccessSession;
    objc_msgSendSuper2(&v24, sel_didStartSession_);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)v26 = buf;
    *(_QWORD *)&v26[8] = 0x3032000000;
    *(_QWORD *)&v26[16] = __Block_byref_object_copy__21;
    *(_QWORD *)&v26[24] = __Block_byref_object_dispose__21;
    *(_QWORD *)&v26[32] = 0;
    v16 = *(void **)(a1 + 32);
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __42__NFUnifiedAccessSession_didStartSession___block_invoke_10;
    v23[3] = &unk_1E3B51998;
    v18 = *(_QWORD *)(a1 + 48);
    v23[5] = buf;
    v23[6] = v18;
    v23[4] = v16;
    objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __42__NFUnifiedAccessSession_didStartSession___block_invoke_13;
    v22[3] = &unk_1E3B519C0;
    v22[4] = *(_QWORD *)(a1 + 32);
    v22[5] = buf;
    objc_msgSend(v19, "getAppletsWithCompletion:", v22);

    if (objc_msgSend(*(id *)(a1 + 32), "isACWG"))
      objc_msgSend(*(id *)(a1 + 32), "_createSesdSession");
    v20 = *(_QWORD *)(*(_QWORD *)v26 + 40);
    v21.receiver = *(id *)(a1 + 32);
    v21.super_class = (Class)NFUnifiedAccessSession;
    objc_msgSendSuper2(&v21, sel_didStartSessionWithoutQueue_, v20);
    _Block_object_dispose(buf, 8);

  }
}

void __42__NFUnifiedAccessSession_didStartSession___block_invoke_10(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 74, v3);
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
    v26 = 74;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __42__NFUnifiedAccessSession_didStartSession___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v21 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  v9 = *(id *)(a1 + 32);
  objc_sync_enter(v9);
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __42__NFUnifiedAccessSession_didStartSession___block_invoke_2;
  v22[3] = &unk_1E3B51E48;
  v23 = v11;
  v24 = v10;
  v12 = v10;
  v13 = v11;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v22);
  objc_msgSend(v12, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = objc_msgSend(v14, "count");

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v21, v13);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 88);
  *(_QWORD *)(v16 + 88) = v15;

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 112);
  *(_QWORD *)(v18 + 112) = v7;
  v20 = v7;

  objc_sync_exit(v9);
}

void __42__NFUnifiedAccessSession_didStartSession___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v12, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(v12, "seIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v12, "seIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v12, "seIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E3B69408, v11);

    }
  }

}

- (void)_createSesdSession
{
  void *v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *Name;
  _QWORD v20[5];
  id v21[2];
  id location;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[NFUnifiedAccessSession sesdSession](self, "sesdSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(4, "%c[%{public}s %{public}s]:%i Unexpected state; previous session exist!!!", v11, ClassName, Name, 112);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(self);
      v16 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v24 = v14;
      v25 = 2082;
      v26 = v15;
      v27 = 2082;
      v28 = v16;
      v29 = 1024;
      v30 = 112;
      _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; previous session exist!!!",
        buf,
        0x22u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D89670], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __44__NFUnifiedAccessSession__createSesdSession__block_invoke;
  v20[3] = &unk_1E3B53928;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a2;
  v20[4] = self;
  objc_msgSend(v17, "startACWGSessionWithOptions:startCallback:", 0, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFUnifiedAccessSession setSesdSession:](self, "setSesdSession:", v18);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __44__NFUnifiedAccessSession__createSesdSession__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char *v4;
  const void **v5;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *WeakRetained;
  const void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  const char *Name;
  uint8_t buf[4];
  _BYTE v30[14];
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to start SESACWGSession.  Error - %{public}@", "-[NFUnifiedAccessSession _createSesdSession]_block_invoke", 117, v4);
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v30 = "-[NFUnifiedAccessSession _createSesdSession]_block_invoke";
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = 117;
      v31 = 2114;
      v32 = v4;
      _os_log_impl(&dword_19B5EB000, WeakRetained, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to start SESACWGSession.  Error - %{public}@", buf, 0x1Cu);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v8 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v9 = NFLogGetLogger();
      if (v9)
      {
        v10 = (void (*)(uint64_t, const char *, ...))v9;
        Class = object_getClass(WeakRetained);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(WeakRetained);
        Name = sel_getName(*(SEL *)(a1 + 48));
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v10(6, "%c[%{public}s %{public}s]:%i Started SESACWGSession", v14, ClassName, Name, 126);
      }
      dispatch_get_specific(*v8);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = object_getClass(WeakRetained);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(WeakRetained);
        v19 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v30 = v17;
        *(_WORD *)&v30[4] = 2082;
        *(_QWORD *)&v30[6] = v18;
        v31 = 2082;
        v32 = v19;
        v33 = 1024;
        v34 = 126;
        _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Started SESACWGSession", buf, 0x22u);
      }

      v20 = *(_QWORD *)(a1 + 32);
      -[NSObject sesdSession](WeakRetained, "sesdSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDelegate:", v20);

      -[NSObject activeKeys](WeakRetained, "activeKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "anyObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[NSObject sesdSession](WeakRetained, "sesdSession");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v24, "setActiveKey:", v23);

        if (-[NSObject cardEmulationStarted](WeakRetained, "cardEmulationStarted"))
        {
          -[NSObject sesdSession](WeakRetained, "sesdSession");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (id)objc_msgSend(v26, "disableBluetooth:", 1);

        }
      }

    }
  }

}

- (void)endSession
{
  -[NFUnifiedAccessSession endSessionWithCompletion:](self, "endSessionWithCompletion:", 0);
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[NFUnifiedAccessSession releaseSesdSession](self, "releaseSesdSession");
  -[NFUnifiedAccessSession setDelegate:](self, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession endSessionWithCompletion:](&v5, sel_endSessionWithCompletion_, v4);

}

- (void)didEndUnexpectedly
{
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[6];
  objc_super v8;

  -[NFUnifiedAccessSession sesdSession](self, "sesdSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "disableBluetooth:", 0);

  -[NFUnifiedAccessSession releaseSesdSession](self, "releaseSesdSession");
  v8.receiver = self;
  v8.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v8, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__NFUnifiedAccessSession_didEndUnexpectedly__block_invoke;
  v7[3] = &unk_1E3B51460;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(v6, v7);

}

id __44__NFUnifiedAccessSession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  const void **v2;
  uint64_t Logger;
  void (*v4)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
  void *v14;
  char v15;
  void *v16;
  const char *Name;
  objc_super v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) == 0)
  {
    v2 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 165);
    }
    dispatch_get_specific(*v2);
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
      *(_DWORD *)buf = 67109890;
      v21 = v11;
      v22 = 2082;
      v23 = v12;
      v24 = 2082;
      v25 = v13;
      v26 = 1024;
      v27 = 165;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setCardEmulationStarted:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unifiedAccessSessionDidEndUnexpectedly:", *(_QWORD *)(a1 + 32));

  }
  v19.receiver = *(id *)(a1 + 32);
  v19.super_class = (Class)NFUnifiedAccessSession;
  return objc_msgSendSuper2(&v19, sel_didEndUnexpectedly);
}

- (void)releaseSesdSession
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
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

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 179);
  }
  dispatch_get_specific(*v4);
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
    v19 = v13;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 179;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  -[NFUnifiedAccessSession sesdSession](self, "sesdSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NFUnifiedAccessSession sesdSession](self, "sesdSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", 0);

    -[NFUnifiedAccessSession sesdSession](self, "sesdSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endSession");

    -[NFUnifiedAccessSession setSesdSession:](self, "setSesdSession:", 0);
  }
}

- (BOOL)isACWG
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_LYON_0, 9);
  objc_msgSend(v3, "NF_asHexString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NFApplet identifier](self->_activeApplet, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "hasPrefix:", v4);

  return (char)v3;
}

- (BOOL)isUnifiedAccessOrAcwg:(id)a3 secondaryIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  const void **v16;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *Name;
  const char *sel;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_LYON_0, 9);
  objc_msgSend(v9, "NF_asHexString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_HYDRA_HOME_SE, 7);
  objc_msgSend(v11, "NF_asHexString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_HYDRA_CORPORATE_SE, 7);
  objc_msgSend(v13, "NF_asHexString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !v8)
  {
    sel = a2;
    v16 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(sel);
      v22 = 45;
      if (isMetaClass)
        v22 = 43;
      v18(3, "%c[%{public}s %{public}s]:%i Invalid  primaryIdentifier %@, secondaryIdentifier = %@ ", v22, ClassName, Name, 204, v7, v8);
    }
    dispatch_get_specific(*v16);
    NFSharedLogGetLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      *(_DWORD *)buf = 67110402;
      v30 = v25;
      v31 = 2082;
      v32 = object_getClassName(self);
      v33 = 2082;
      v34 = sel_getName(sel);
      v35 = 1024;
      v36 = 204;
      v37 = 2112;
      v38 = v7;
      v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_19B5EB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid  primaryIdentifier %@, secondaryIdentifier = %@ ", buf, 0x36u);
    }

    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "hasPrefix:", v10) & 1) == 0
    && (objc_msgSend(v7, "hasPrefix:", v12) & 1) == 0
    && !objc_msgSend(v7, "hasPrefix:", v14)
    || (objc_msgSend(v8, "hasPrefix:", v10) & 1) == 0
    && (objc_msgSend(v8, "hasPrefix:", v12) & 1) == 0
    && (objc_msgSend(v8, "hasPrefix:", v14) & 1) == 0)
  {
LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  v15 = 1;
LABEL_21:

  return v15;
}

- (BOOL)validateAidsAndKeys:(id)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  const void **v11;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  uint64_t v26;
  objc_class *v27;
  int v28;
  const char *v30;
  const char *Name;
  const char *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[NSObject count](v5, "count") == 2)
  {
    -[NSObject allKeys](v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject allKeys](v5, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[NFUnifiedAccessSession isUnifiedAccessOrAcwg:secondaryIdentifier:](self, "isUnifiedAccessOrAcwg:secondaryIdentifier:", v7, v9);
    if (!v10)
    {
      v11 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v17 = 45;
        if (isMetaClass)
          v17 = 43;
        v13(3, "%c[%{public}s %{public}s]:%i Invalid AIDs provided primaryAID %@, secondaryAID = %@ ", v17, ClassName, Name, 234, v7, v9);
      }
      dispatch_get_specific(*v11);
      NFSharedLogGetLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = object_getClass(self);
        if (class_isMetaClass(v19))
          v20 = 43;
        else
          v20 = 45;
        *(_DWORD *)buf = 67110402;
        v34 = v20;
        v35 = 2082;
        v36 = object_getClassName(self);
        v37 = 2082;
        v38 = sel_getName(a2);
        v39 = 1024;
        v40 = 234;
        v41 = 2112;
        v42 = v7;
        v43 = 2112;
        v44 = v9;
        _os_log_impl(&dword_19B5EB000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AIDs provided primaryAID %@, secondaryAID = %@ ", buf, 0x36u);
      }

    }
  }
  else
  {
    v21 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v22 = NFLogGetLogger();
    if (v22)
    {
      v23 = (void (*)(uint64_t, const char *, ...))v22;
      v24 = object_getClass(self);
      v25 = class_isMetaClass(v24);
      v30 = object_getClassName(self);
      v32 = sel_getName(a2);
      v26 = 45;
      if (v25)
        v26 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Invalid number of applets %{public}@", v26, v30, v32, 226, v5);
    }
    dispatch_get_specific(*v21);
    NFSharedLogGetLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      *(_DWORD *)buf = 67110146;
      v34 = v28;
      v35 = 2082;
      v36 = object_getClassName(self);
      v37 = 2082;
      v38 = sel_getName(a2);
      v39 = 1024;
      v40 = 226;
      v41 = 2114;
      v42 = v5;
      _os_log_impl(&dword_19B5EB000, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid number of applets %{public}@", buf, 0x2Cu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)didDetectField:(BOOL)a3
{
  NSObject *v6;
  _QWORD block[6];
  BOOL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v9, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NFUnifiedAccessSession_didDetectField___block_invoke;
  block[3] = &unk_1E3B51B50;
  block[4] = self;
  block[5] = a2;
  v8 = a3;
  dispatch_async(v6, block);

}

void __41__NFUnifiedAccessSession_didDetectField___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "unifiedAccessSession:didDetectField:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

    }
  }
  else
  {
    v4 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 249);
    }
    dispatch_get_specific(*v4);
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
      v15 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 249;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didDetectFieldNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NFUnifiedAccessSession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E3B51A10;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __53__NFUnifiedAccessSession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 1;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "unifiedAccessSession:didEnterFieldWithNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
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
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 262);
    }
    dispatch_get_specific(*v4);
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
      *(_DWORD *)buf = 67109890;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 262;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didSelectApplet:(id)a3
{
  NSObject *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v7, sel_callbackQueue, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__NFUnifiedAccessSession_didSelectApplet___block_invoke;
  v6[3] = &unk_1E3B51460;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(v5, v6);

}

void __42__NFUnifiedAccessSession_didSelectApplet___block_invoke(uint64_t a1)
{
  const void **v2;
  uint64_t Logger;
  void (*v4)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
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

  v23 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) == 0)
  {
    v2 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 278);
    }
    dispatch_get_specific(*v2);
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
      *(_DWORD *)buf = 67109890;
      v16 = v11;
      v17 = 2082;
      v18 = v12;
      v19 = 2082;
      v20 = v13;
      v21 = 1024;
      v22 = 278;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didStartTransaction:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NFUnifiedAccessSession_didStartTransaction___block_invoke;
  block[3] = &unk_1E3B51A10;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __46__NFUnifiedAccessSession_didStartTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const void **v7;
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
  const char *v18;
  const char *Name;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(v2, "appletIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setApplet:", v5);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "unifiedAccessSession:didStartTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    v7 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 289);
    }
    dispatch_get_specific(*v7);
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
      v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 289;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didEndTransaction:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NFUnifiedAccessSession_didEndTransaction___block_invoke;
  block[3] = &unk_1E3B51A10;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __44__NFUnifiedAccessSession_didEndTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  const char *Name;
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "disableBluetooth:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setCardEmulationStarted:", 0);
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(v4, "appletIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setApplet:", v7);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "unifiedAccessSession:didEndTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    v9 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i Session not active", v15, ClassName, Name, 303);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(*(id *)(a1 + 32));
      v20 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v24 = v18;
      v25 = 2082;
      v26 = v19;
      v27 = 2082;
      v28 = v20;
      v29 = 1024;
      v30 = 303;
      _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didExpireTransactionForApplet:(id)a3
{
  NSObject *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v7, sel_callbackQueue, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__NFUnifiedAccessSession_didExpireTransactionForApplet___block_invoke;
  v6[3] = &unk_1E3B51460;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(v5, v6);

}

void __56__NFUnifiedAccessSession_didExpireTransactionForApplet___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  void *v6;
  const void **v7;
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
  const char *v18;
  const char *Name;
  id obj;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "disableBluetooth:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setCardEmulationStarted:", 0);
    obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unifiedAccessSession:didExpireTransactionForApplet:", *(_QWORD *)(a1 + 32), 0);

    }
    objc_sync_exit(obj);

  }
  else
  {
    v7 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Session not active", v13, ClassName, Name, 320);
    }
    dispatch_get_specific(*v7);
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
      v18 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 320;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didExpressModeStateChange:(unsigned int)a3 withObject:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  unsigned int v13;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v14, sel_callbackQueue);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__NFUnifiedAccessSession_didExpressModeStateChange_withObject___block_invoke;
  v10[3] = &unk_1E3B51B78;
  v11 = v7;
  v12 = a2;
  v13 = a3;
  v10[4] = self;
  v9 = v7;
  dispatch_async(v8, v10);

}

void __63__NFUnifiedAccessSession_didExpressModeStateChange_withObject___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  NSObject *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
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

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) == 0)
  {
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 345);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(*(id *)(a1 + 32));
      v16 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v19 = v14;
      v20 = 2082;
      v21 = v15;
      v22 = 2082;
      v23 = v16;
      v24 = 1024;
      v25 = 345;
      _os_log_impl(&dword_19B5EB000, v5, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject unifiedAccessSession:didExpressModeStateChange:withObject:](v5, "unifiedAccessSession:didExpressModeStateChange:withObject:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
LABEL_13:

  }
  objc_sync_exit(v2);

}

- (unint64_t)numberOfActiveSecureElements
{
  return self->_numActiveSEs;
}

- (id)allApplets
{
  return -[NSDictionary allValues](self->_appletsById, "allValues");
}

- (id)appletWithIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_appletsById, "objectForKey:", a3);
}

- (id)appletsWithIdentifiers:(id)a3 secondaryIdentifier:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  const void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *v16;
  _BOOL4 v17;
  const char *v18;
  uint64_t v19;
  objc_class *v20;
  int v21;
  id v22;
  const void **v23;
  uint64_t Logger;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  const char *ClassName;
  const char *v45;
  const char *v46;
  const char *Name;
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
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[NFUnifiedAccessSession isUnifiedAccessOrAcwg:secondaryIdentifier:](self, "isUnifiedAccessOrAcwg:secondaryIdentifier:", v7, v8))
  {
    -[NSDictionary objectForKey:](self->_appletsById, "objectForKey:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_appletsById, "objectForKey:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v22, "addObject:", v9);
      objc_msgSend(v22, "addObject:", v11);
LABEL_41:

      goto LABEL_42;
    }
    if (v9)
    {
      if (v10)
      {
LABEL_40:
        v22 = 0;
        goto LABEL_41;
      }
    }
    else
    {
      v23 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v25 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v28 = 45;
        if (isMetaClass)
          v28 = 43;
        v25(3, "%c[%{public}s %{public}s]:%i Unable to get applet for primaryIdentifier %@ ", v28, ClassName, Name, 432, v7);
      }
      dispatch_get_specific(*v23);
      NFSharedLogGetLogger();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = object_getClass(self);
        if (class_isMetaClass(v30))
          v31 = 43;
        else
          v31 = 45;
        *(_DWORD *)buf = 67110146;
        v50 = v31;
        v51 = 2082;
        v52 = object_getClassName(self);
        v53 = 2082;
        v54 = sel_getName(a2);
        v55 = 1024;
        v56 = 432;
        v57 = 2112;
        v58 = v7;
        _os_log_impl(&dword_19B5EB000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to get applet for primaryIdentifier %@ ", buf, 0x2Cu);
      }

      if (v11)
        goto LABEL_40;
    }
    v32 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v33 = NFLogGetLogger();
    if (v33)
    {
      v34 = (void (*)(uint64_t, const char *, ...))v33;
      v35 = object_getClass(self);
      v36 = class_isMetaClass(v35);
      v45 = object_getClassName(self);
      v48 = sel_getName(a2);
      v37 = 45;
      if (v36)
        v37 = 43;
      v34(3, "%c[%{public}s %{public}s]:%i Unable to get applet for secondaryIdentifier %@", v37, v45, v48, 435, v8);
    }
    dispatch_get_specific(*v32);
    NFSharedLogGetLogger();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = object_getClass(self);
      if (class_isMetaClass(v39))
        v40 = 43;
      else
        v40 = 45;
      v41 = object_getClassName(self);
      v42 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v50 = v40;
      v51 = 2082;
      v52 = v41;
      v53 = 2082;
      v54 = v42;
      v55 = 1024;
      v56 = 435;
      v57 = 2112;
      v58 = v8;
      _os_log_impl(&dword_19B5EB000, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to get applet for secondaryIdentifier %@", buf, 0x2Cu);
    }

    goto LABEL_40;
  }
  v13 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v14 = NFLogGetLogger();
  if (v14)
  {
    v15 = (void (*)(uint64_t, const char *, ...))v14;
    v16 = object_getClass(self);
    v17 = class_isMetaClass(v16);
    v18 = object_getClassName(self);
    v46 = sel_getName(a2);
    v19 = 45;
    if (v17)
      v19 = 43;
    v15(3, "%c[%{public}s %{public}s]:%i Invalid AIDs provided primaryIdentifier %@, secondaryIdentifier = %@ ", v19, v18, v46, 416, v7, v8);
  }
  dispatch_get_specific(*v13);
  NFSharedLogGetLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    *(_DWORD *)buf = 67110402;
    v50 = v21;
    v51 = 2082;
    v52 = object_getClassName(self);
    v53 = 2082;
    v54 = sel_getName(a2);
    v55 = 1024;
    v56 = 416;
    v57 = 2112;
    v58 = v7;
    v59 = 2112;
    v60 = v8;
    _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AIDs provided primaryIdentifier %@, secondaryIdentifier = %@ ", buf, 0x36u);
  }
  v22 = 0;
LABEL_42:

  return v22;
}

- (BOOL)setActivePaymentApplet:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  _QWORD v17[5];
  id v18;
  os_activity_scope_state_s *p_state;
  uint64_t *v20;
  SEL v21;
  _QWORD v22[7];
  os_activity_scope_state_s state;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v9 = a4;
  v10 = a3;
  v11 = _os_activity_create(&dword_19B5EB000, "setActivePaymentApplet:keys:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__21;
  v26 = __Block_byref_object_dispose__21;
  v27 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__NFUnifiedAccessSession_setActivePaymentApplet_keys_error___block_invoke;
  v22[3] = &unk_1E3B51488;
  v22[4] = self;
  v22[5] = &state;
  v22[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __60__NFUnifiedAccessSession_setActivePaymentApplet_keys_error___block_invoke_54;
  v17[3] = &unk_1E3B538B0;
  v17[4] = self;
  v14 = v9;
  v18 = v14;
  p_state = &state;
  v20 = &v28;
  v21 = a2;
  objc_msgSend(v13, "setActivePaymentApplet:keys:authorization:completion:", v10, v14, 0, v17);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v15 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __60__NFUnifiedAccessSession_setActivePaymentApplet_keys_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 451, v4);
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
    v25 = 451;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __60__NFUnifiedAccessSession_setActivePaymentApplet_keys_error___block_invoke_54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  const void **v17;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), a2);
  if (*(_QWORD *)(a1 + 40))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), a3);
  objc_sync_exit(v11);

  if (objc_msgSend(*(id *)(a1 + 32), "isACWG"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_createSesdSession");
      if (v10)
        goto LABEL_9;
LABEL_20:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_21;
    }
    v13 = v9;
    objc_msgSend(v13, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "sesdSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "setActiveKey:", v14);

    }
  }
  if (!v10)
    goto LABEL_20;
LABEL_9:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  v17 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 64));
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v19(3, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, Name, 477, v10);
  }
  dispatch_get_specific(*v17);
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
    v27 = sel_getName(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 67110146;
    v31 = v25;
    v32 = 2082;
    v33 = v26;
    v34 = 2082;
    v35 = v27;
    v36 = 1024;
    v37 = 477;
    v38 = 2114;
    v39 = v10;
    _os_log_impl(&dword_19B5EB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

LABEL_21:
}

- (BOOL)setActivePaymentApplets:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  os_activity_scope_state_s *p_state;
  uint64_t *v22;
  SEL v23;
  _QWORD v24[7];
  os_activity_scope_state_s state;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "setActivePaymentApplets:keys:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__21;
  v28 = __Block_byref_object_dispose__21;
  v29 = 0;
  if (-[NFUnifiedAccessSession validateAidsAndKeys:](self, "validateAidsAndKeys:", v7))
  {
    v9 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56__NFUnifiedAccessSession_setActivePaymentApplets_error___block_invoke;
    v24[3] = &unk_1E3B51488;
    v24[4] = self;
    v24[5] = &state;
    v24[6] = a2;
    -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __56__NFUnifiedAccessSession_setActivePaymentApplets_error___block_invoke_59;
    v19[3] = &unk_1E3B538B0;
    v19[4] = self;
    v20 = v7;
    p_state = &state;
    v22 = &v30;
    v23 = a2;
    objc_msgSend(v10, "setActivePaymentApplets:authorization:completion:", v20, 0, v19);

    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
    v11 = *((_BYTE *)v31 + 24) != 0;

  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nf.fwk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 10, v15);
    v17 = *(void **)(state.opaque[1] + 40);
    *(_QWORD *)(state.opaque[1] + 40) = v16;

    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  }
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

void __56__NFUnifiedAccessSession_setActivePaymentApplets_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 512, v4);
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
    v25 = 512;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __56__NFUnifiedAccessSession_setActivePaymentApplets_error___block_invoke_59(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  const void **v17;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), a2);
  if (*(_QWORD *)(a1 + 40))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), a3);
  objc_sync_exit(v11);

  if (objc_msgSend(*(id *)(a1 + 32), "isACWG"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_createSesdSession");
      if (v10)
        goto LABEL_9;
LABEL_20:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_21;
    }
    v13 = v9;
    objc_msgSend(v13, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "sesdSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "setActiveKey:", v14);

    }
  }
  if (!v10)
    goto LABEL_20;
LABEL_9:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  v17 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 64));
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v19(3, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, Name, 537, v10);
  }
  dispatch_get_specific(*v17);
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
    v27 = sel_getName(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 67110146;
    v31 = v25;
    v32 = 2082;
    v33 = v26;
    v34 = 2082;
    v35 = v27;
    v36 = 1024;
    v37 = 537;
    v38 = 2114;
    v39 = v10;
    _os_log_impl(&dword_19B5EB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

LABEL_21:
}

- (BOOL)_startCardEmulationWithAuthorization:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  _QWORD v17[8];
  _QWORD v18[7];
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "_startCardEmulationWithAuthorization:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__21;
  v22 = __Block_byref_object_dispose__21;
  v23 = 0;
  -[NFUnifiedAccessSession sesdSession](self, "sesdSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "disableBluetooth:", 1);

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__NFUnifiedAccessSession__startCardEmulationWithAuthorization_error___block_invoke;
  v18[3] = &unk_1E3B51488;
  v18[4] = self;
  v18[5] = &state;
  v18[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __69__NFUnifiedAccessSession__startCardEmulationWithAuthorization_error___block_invoke_60;
  v17[3] = &unk_1E3B517E0;
  v17[4] = self;
  v17[5] = &state;
  v17[6] = &v24;
  v17[7] = a2;
  objc_msgSend(v12, "startCardEmulationWithAuthorization:completion:", v7, v17);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  if (*(_QWORD *)(state.opaque[1] + 40))
  {
    -[NFUnifiedAccessSession sesdSession](self, "sesdSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "disableBluetooth:", 0);

  }
  else
  {
    -[NFUnifiedAccessSession setCardEmulationStarted:](self, "setCardEmulationStarted:", 1);
  }
  v15 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __69__NFUnifiedAccessSession__startCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 572, v4);
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
    v25 = 572;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __69__NFUnifiedAccessSession__startCardEmulationWithAuthorization_error___block_invoke_60(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 576, v4);
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
      v25 = 576;
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

- (BOOL)_startDeferredCardEmulationWithAuthorization:(id)a3 error:(id *)a4
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
  v8 = _os_activity_create(&dword_19B5EB000, "_startDeferredCardEmulationWithAuthorization:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__NFUnifiedAccessSession__startDeferredCardEmulationWithAuthorization_error___block_invoke;
  v14[3] = &unk_1E3B51488;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __77__NFUnifiedAccessSession__startDeferredCardEmulationWithAuthorization_error___block_invoke_61;
  v13[3] = &unk_1E3B517E0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  v13[7] = a2;
  objc_msgSend(v10, "startDeferredCardEmulationWithAuthorization:completion:", v7, v13);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v11 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __77__NFUnifiedAccessSession__startDeferredCardEmulationWithAuthorization_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 615, v4);
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
    v25 = 615;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __77__NFUnifiedAccessSession__startDeferredCardEmulationWithAuthorization_error___block_invoke_61(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 619, v4);
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
      v25 = 619;
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

- (BOOL)stopCardEmulation:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
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

  v6 = _os_activity_create(&dword_19B5EB000, "stopCardEmulation:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__NFUnifiedAccessSession_stopCardEmulation___block_invoke;
  v14[3] = &unk_1E3B51488;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __44__NFUnifiedAccessSession_stopCardEmulation___block_invoke_62;
  v13[3] = &unk_1E3B517E0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  v13[7] = a2;
  objc_msgSend(v8, "stopCardEmulationWithCompletion:", v13);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  -[NFUnifiedAccessSession sesdSession](self, "sesdSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "disableBluetooth:", 0);

  -[NFUnifiedAccessSession setCardEmulationStarted:](self, "setCardEmulationStarted:", 0);
  v11 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __44__NFUnifiedAccessSession_stopCardEmulation___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 648, v4);
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
    v25 = 648;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __44__NFUnifiedAccessSession_stopCardEmulation___block_invoke_62(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 652, v4);
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
      v25 = 652;
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

- (BOOL)startExpressMode:(id *)a3
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

  v6 = _os_activity_create(&dword_19B5EB000, "startExpressMode:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__NFUnifiedAccessSession_startExpressMode___block_invoke;
  v12[3] = &unk_1E3B51488;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __43__NFUnifiedAccessSession_startExpressMode___block_invoke_63;
  v11[3] = &unk_1E3B517E0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = &v18;
  v11[7] = a2;
  objc_msgSend(v8, "startExpressModeWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __43__NFUnifiedAccessSession_startExpressMode___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 683, v4);
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
    v25 = 683;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __43__NFUnifiedAccessSession_startExpressMode___block_invoke_63(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 687, v4);
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
      v25 = 687;
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

- (void)sesSession:(id)a3 event:(id)a4
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
  NSObject *v16;
  id v17;
  const char *ClassName;
  const char *Name;
  _QWORD block[5];
  id v21;
  SEL v22;
  objc_super v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i eventPayload = %@", v12, ClassName, Name, 708, v6);
  }
  dispatch_get_specific(*v7);
  NFSharedLogGetLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67110146;
    v25 = v15;
    v26 = 2082;
    v27 = object_getClassName(self);
    v28 = 2082;
    v29 = sel_getName(a2);
    v30 = 1024;
    v31 = 708;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i eventPayload = %@", buf, 0x2Cu);
  }

  v23.receiver = self;
  v23.super_class = (Class)NFUnifiedAccessSession;
  -[NFSession callbackQueue](&v23, sel_callbackQueue);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NFUnifiedAccessSession_sesSession_event___block_invoke;
  block[3] = &unk_1E3B51A10;
  block[4] = self;
  v21 = v6;
  v22 = a2;
  v17 = v6;
  dispatch_async(v16, block);

}

void __43__NFUnifiedAccessSession_sesSession_event___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const void **v3;
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
  void *v14;
  const void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  const char *ClassName;
  const char *Name;
  const char *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("xpcEventName"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v5(6, "%c[%{public}s %{public}s]:%i event = %@", v8, ClassName, Name, 713, v2);
    }
    dispatch_get_specific(*v3);
    NFSharedLogGetLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v10))
        v11 = 43;
      else
        v11 = 45;
      v12 = object_getClassName(*(id *)(a1 + 32));
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v30 = v11;
      v31 = 2082;
      v32 = v12;
      v33 = 2082;
      v34 = v13;
      v35 = 1024;
      v36 = 713;
      v37 = 2112;
      v38 = v2;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i event = %@", buf, 0x2Cu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "session:didReceiveEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v15 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v16 = NFLogGetLogger();
    if (v16)
    {
      v17 = (void (*)(uint64_t, const char *, ...))v16;
      v18 = object_getClass(*(id *)(a1 + 32));
      v19 = class_isMetaClass(v18);
      v20 = object_getClassName(*(id *)(a1 + 32));
      v28 = sel_getName(*(SEL *)(a1 + 48));
      v21 = 45;
      if (v19)
        v21 = 43;
      v17(3, "%c[%{public}s %{public}s]:%i Session not active", v21, v20, v28, 720);
    }
    dispatch_get_specific(*v15);
    NFSharedLogGetLogger();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(*(id *)(a1 + 32));
      v25 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v30 = v23;
      v31 = 2082;
      v32 = v24;
      v33 = 2082;
      v34 = v25;
      v35 = 1024;
      v36 = 720;
      _os_log_impl(&dword_19B5EB000, v2, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }

}

+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NFUnifiedAccessAssertion *v15;
  const void **v16;
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
  _BYTE state[18];
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a3;
  v11 = _os_activity_create(&dword_19B5EB000, "requestAssertionForKeyID:options:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v11, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_LYON_0, 9);
  objc_msgSend(v12, "NF_asHexString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D89670], "requestAssertionForKeyID:withAppletID:withOptions:error:", v10, v13, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[NFUnifiedAccessAssertion initWithSESAssertion:]([NFUnifiedAccessAssertion alloc], "initWithSESAssertion:", v14);
  }
  else
  {
    v16 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v22 = 45;
      if (isMetaClass)
        v22 = 43;
      v18(4, "%c[%{public}s %{public}s]:%i Failed to get SES assertion", v22, ClassName, Name, 737);
    }
    dispatch_get_specific(*v16);
    NFSharedLogGetLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(a1);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(a1);
      v27 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v25;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v26;
      v31 = 2082;
      v32 = v27;
      v33 = 1024;
      v34 = 737;
      _os_log_impl(&dword_19B5EB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get SES assertion", state, 0x22u);
    }

    v15 = 0;
  }

  return v15;
}

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 112, 1);
}

- (NSSet)activeKeys
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)cardEmulationStarted
{
  return self->_cardEmulationStarted;
}

- (void)setCardEmulationStarted:(BOOL)a3
{
  self->_cardEmulationStarted = a3;
}

- (SESACWGSession)sesdSession
{
  return self->_sesdSession;
}

- (void)setSesdSession:(id)a3
{
  objc_storeStrong((id *)&self->_sesdSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sesdSession, 0);
  objc_storeStrong((id *)&self->_activeKeys, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_storeStrong((id *)&self->_appletsById, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
