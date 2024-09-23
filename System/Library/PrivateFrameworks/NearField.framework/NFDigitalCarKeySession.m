@implementation NFDigitalCarKeySession

- (NFDigitalCarKeySession)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NFDigitalCarKeySession;
  return -[NFSession init](&v3, sel_init);
}

- (id)allApplets
{
  void *v2;
  void *v3;

  -[NFDigitalCarKeySession appletsById](self, "appletsById");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appletWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NFDigitalCarKeySession appletsById](self, "appletsById");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_getAppletsFromNFCD
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__NFDigitalCarKeySession__getAppletsFromNFCD__block_invoke;
  v8[3] = &unk_1E3B51998;
  v8[5] = &v9;
  v8[6] = a2;
  v8[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __45__NFDigitalCarKeySession__getAppletsFromNFCD__block_invoke_29;
  v7[3] = &unk_1E3B519C0;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "getAppletsWithCompletion:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __45__NFDigitalCarKeySession__getAppletsFromNFCD__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 107, v3);
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
    v26 = 107;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __45__NFDigitalCarKeySession__getAppletsFromNFCD__block_invoke_29(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }
  else
  {
    v19 = v8;
    v10 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v17 = *(id *)(a1 + 32);
    objc_sync_enter(v17);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v11, v10);
    objc_msgSend(*(id *)(a1 + 32), "setAppletsById:", v18);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), a3);
    objc_sync_exit(v17);

    v8 = v19;
  }

}

- (void)didStartSession:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[NFSession callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NFDigitalCarKeySession_didStartSession___block_invoke;
  block[3] = &unk_1E3B51A10;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __42__NFDigitalCarKeySession_didStartSession___block_invoke(uint64_t a1)
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
  const void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  objc_super v38;
  _QWORD v39[4];
  id v40[2];
  id location;
  objc_super v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
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
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 135, *(_QWORD *)(a1 + 40));
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
      v44 = v12;
      v45 = 2082;
      v46 = v13;
      v47 = 2082;
      v48 = v14;
      v49 = 1024;
      v50 = 135;
      v51 = 2114;
      v52 = v15;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", buf, 0x2Cu);
    }

  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v42.receiver = *(id *)(a1 + 32);
    v42.super_class = (Class)NFDigitalCarKeySession;
    objc_msgSendSuper2(&v42, sel_didStartSessionWithoutQueue_);
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v18 = NFLogGetLogger();
      if (v18)
      {
        v19 = (void (*)(uint64_t, const char *, ...))v18;
        v20 = object_getClass(*(id *)(a1 + 32));
        v21 = class_isMetaClass(v20);
        v22 = object_getClassName(*(id *)(a1 + 32));
        v37 = sel_getName(*(SEL *)(a1 + 48));
        v23 = 45;
        if (v21)
          v23 = 43;
        v19(4, "%c[%{public}s %{public}s]:%i Unexpected state; previous session exist!!!", v23, v22, v37, 145);
      }
      dispatch_get_specific(*v17);
      NFSharedLogGetLogger();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v25))
          v26 = 43;
        else
          v26 = 45;
        v27 = object_getClassName(*(id *)(a1 + 32));
        v28 = sel_getName(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 67109890;
        v44 = v26;
        v45 = 2082;
        v46 = v27;
        v47 = 2082;
        v48 = v28;
        v49 = 1024;
        v50 = 145;
        _os_log_impl(&dword_19B5EB000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; previous session exist!!!",
          buf,
          0x22u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D89670], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __42__NFDigitalCarKeySession_didStartSession___block_invoke_37;
    v39[3] = &unk_1E3B519E8;
    objc_copyWeak(v40, &location);
    v40[1] = *(id *)(a1 + 48);
    objc_msgSend(v29, "startDigitalCarKeySessionWithOptions:startCallback:", 0, v39);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSesdSession:", v30);

    v31 = *(void **)(a1 + 32);
    objc_msgSend(v31, "sesdSession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDelegate:", v31);

    v33 = *(void **)(a1 + 32);
    objc_msgSend(v33, "sesdSession");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPassthroughDelegate:", v33);

    v35 = *(void **)(a1 + 32);
    objc_msgSend(v35, "_getAppletsFromNFCD");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38.receiver = v35;
    v38.super_class = (Class)NFDigitalCarKeySession;
    objc_msgSendSuper2(&v38, sel_didStartSessionWithoutQueue_, v36);

    objc_destroyWeak(v40);
    objc_destroyWeak(&location);
  }
}

void __42__NFDigitalCarKeySession_didStartSession___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
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
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  const char *Name;
  uint8_t buf[4];
  _BYTE v27[14];
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to start SESDCKSession.  Error - %{public}@", "-[NFDigitalCarKeySession didStartSession:]_block_invoke", 151, v4);
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v27 = "-[NFDigitalCarKeySession didStartSession:]_block_invoke";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = 151;
      v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_19B5EB000, WeakRetained, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to start SESDCKSession.  Error - %{public}@", buf, 0x1Cu);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
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
        Name = sel_getName(*(SEL *)(a1 + 40));
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v10(6, "%c[%{public}s %{public}s]:%i Started SESDCKSession", v14, ClassName, Name, 160);
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
        v19 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v27 = v17;
        *(_WORD *)&v27[4] = 2082;
        *(_QWORD *)&v27[6] = v18;
        v28 = 2082;
        v29 = v19;
        v30 = 1024;
        v31 = 160;
        _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Started SESDCKSession", buf, 0x22u);
      }

      -[NSObject sesdSession](WeakRetained, "sesdSession");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject activeKey](WeakRetained, "activeKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v20, "setActiveKey:", v21);

      if (-[NSObject cardEmulationStarted](WeakRetained, "cardEmulationStarted"))
      {
        -[NSObject sesdSession](WeakRetained, "sesdSession");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v23, "disableBluetooth:", 1);

      }
    }
  }

}

- (void)didEndUnexpectedly
{
  NSObject *v4;
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v6, sel_callbackQueue);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__NFDigitalCarKeySession_didEndUnexpectedly__block_invoke;
  v5[3] = &unk_1E3B51460;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __44__NFDigitalCarKeySession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  objc_super v17;
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
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "disableBluetooth:", 0);

    objc_msgSend(*(id *)(a1 + 32), "releaseSesdSession");
    objc_msgSend(*(id *)(a1 + 32), "setCardEmulationStarted:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject sessionDidEndUnexpectedly:](v4, "sessionDidEndUnexpectedly:", *(_QWORD *)(a1 + 32));
    v17.receiver = *(id *)(a1 + 32);
    v17.super_class = (Class)NFDigitalCarKeySession;
    objc_msgSendSuper2(&v17, sel_didEndUnexpectedly);
  }
  else
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
      Name = sel_getName(*(SEL *)(a1 + 40));
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 192);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
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
      v25 = 192;
      _os_log_impl(&dword_19B5EB000, v4, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }

}

- (BOOL)setActiveApplet:(id)a3 key:(id)a4 outError:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  const void **v12;
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
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NFDigitalCarKeySession *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  const char *Name;
  _QWORD v43[7];
  _QWORD v44[7];
  uint64_t state;
  _BYTE state_8[32];
  id v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = _os_activity_create(&dword_19B5EB000, "seActiveApplet:key:outError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state = 0;
  *(_QWORD *)state_8 = 0;
  os_activity_scope_enter(v11, (os_activity_scope_state_t)&state);
  os_activity_scope_leave((os_activity_scope_state_t)&state);

  if (-[NFDigitalCarKeySession cardEmulationStarted](self, "cardEmulationStarted"))
  {
    v12 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
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
      v14(4, "%c[%{public}s %{public}s]:%i Cannot set active applet while card emulation is in progress.", v18, ClassName, Name, 204);
    }
    dispatch_get_specific(*v12);
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
      LODWORD(state) = 67109890;
      HIDWORD(state) = v21;
      *(_WORD *)state_8 = 2082;
      *(_QWORD *)&state_8[2] = v22;
      *(_WORD *)&state_8[10] = 2082;
      *(_QWORD *)&state_8[12] = v23;
      *(_WORD *)&state_8[20] = 1024;
      *(_DWORD *)&state_8[22] = 204;
      _os_log_impl(&dword_19B5EB000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Cannot set active applet while card emulation is in progress.", (uint8_t *)&state, 0x22u);
    }

    if (a5)
    {
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nf.fwk");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *MEMORY[0x1E0CB2D50];
      v51[0] = CFSTR("Card emulation currently in progress");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v24;
      v28 = v25;
      v29 = 2;
LABEL_18:
      *a5 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, v29, v26);

      LOBYTE(a5) = 0;
    }
  }
  else
  {
    v30 = self;
    objc_sync_enter(v30);
    objc_storeStrong((id *)&v30->_activeKey, a4);
    objc_sync_exit(v30);

    -[NFDigitalCarKeySession sesdSession](v30, "sesdSession");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v31, "setActiveKey:", v10);

    objc_msgSend(v9, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_PURPLE_TRUST_AIR_CCC, 13);
    objc_msgSend(v34, "NF_asHexString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v33, "isEqualToString:", v35);

    if ((v36 & 1) != 0)
    {
      state = 0;
      *(_QWORD *)state_8 = &state;
      *(_QWORD *)&state_8[8] = 0x3032000000;
      *(_QWORD *)&state_8[16] = __Block_byref_object_copy__0;
      *(_QWORD *)&state_8[24] = __Block_byref_object_dispose__0;
      v47 = 0;
      if (v10)
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v10, 0);
      else
        v37 = 0;
      v39 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __55__NFDigitalCarKeySession_setActiveApplet_key_outError___block_invoke;
      v44[3] = &unk_1E3B51998;
      v44[5] = &state;
      v44[6] = a2;
      v44[4] = v30;
      -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](v30, "synchronousRemoteObjectProxyWithErrorHandler:", v44);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v39;
      v43[1] = 3221225472;
      v43[2] = __55__NFDigitalCarKeySession_setActiveApplet_key_outError___block_invoke_59;
      v43[3] = &unk_1E3B51A38;
      v43[5] = &state;
      v43[6] = a2;
      v43[4] = v30;
      objc_msgSend(v40, "setActivePaymentApplet:keys:authorization:completion:", v9, v37, 0, v43);

      if (a5)
        *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)state_8 + 40));
      LOBYTE(a5) = *(_QWORD *)(*(_QWORD *)state_8 + 40) == 0;

      _Block_object_dispose(&state, 8);
    }
    else if (a5)
    {
      v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nf.fwk");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = *MEMORY[0x1E0CB2D50];
      v49 = CFSTR("Bad applet provided.  Expected PTA");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v38;
      v28 = v25;
      v29 = 10;
      goto LABEL_18;
    }
  }

  return (char)a5;
}

void __55__NFDigitalCarKeySession_setActiveApplet_key_outError___block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 232, v3);
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
    v26 = 232;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __55__NFDigitalCarKeySession_setActiveApplet_key_outError___block_invoke_59(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const void **v10;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
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
  v7 = a2;
  v8 = a4;
  v9 = *(id *)(a1 + 32);
  objc_sync_enter(v9);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), a2);
  objc_sync_exit(v9);

  if (v8)
  {
    v10 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i %{public}@", v15, ClassName, Name, 242, v8);
    }
    dispatch_get_specific(*v10);
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
      *(_DWORD *)buf = 67110146;
      v24 = v18;
      v25 = 2082;
      v26 = v19;
      v27 = 2082;
      v28 = v20;
      v29 = 1024;
      v30 = 242;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }

}

- (BOOL)startCardEmulationAuthorization:(id)a3 deferred:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  _QWORD v28[7];
  _QWORD v29[7];
  os_activity_scope_state_s state;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v6 = a4;
  v36[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = _os_activity_create(&dword_19B5EB000, "startCardEmulationAuthorization:deferred:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if (-[NFDigitalCarKeySession cardEmulationStarted](self, "cardEmulationStarted"))
    -[NFDigitalCarKeySession stopCardEmulation:](self, "stopCardEmulation:", 0);
  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "disableBluetooth:", 1);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __73__NFDigitalCarKeySession_startCardEmulationAuthorization_deferred_error___block_invoke;
  v29[3] = &unk_1E3B51998;
  v29[5] = &state;
  v29[6] = a2;
  v29[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __73__NFDigitalCarKeySession_startCardEmulationAuthorization_deferred_error___block_invoke_61;
    v28[3] = &unk_1E3B51998;
    v28[4] = self;
    v28[5] = &state;
    v28[6] = a2;
    v15 = (void *)MEMORY[0x1A1AC40C8](v28);
    if (v6)
      objc_msgSend(v14, "startDeferredCardEmulationWithAuthorization:completion:", v9, v15);
    else
      objc_msgSend(v14, "startCardEmulationWithAuthorization:completion:", v9, v15);

  }
  else if (!*(_QWORD *)(state.opaque[1] + 40))
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpected Result");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v18;
    v35[1] = *MEMORY[0x1E0CB2D68];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to get sync proxy."));
    v36[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 13, v20);
    v22 = *(void **)(state.opaque[1] + 40);
    *(_QWORD *)(state.opaque[1] + 40) = v21;

  }
  v23 = state.opaque[1];
  if (a5)
  {
    *a5 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
    v23 = state.opaque[1];
  }
  v24 = *(_QWORD *)(v23 + 40);
  if (v24)
  {
    -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "disableBluetooth:", 0);

  }
  else
  {
    -[NFDigitalCarKeySession setCardEmulationStarted:](self, "setCardEmulationStarted:", 1);
  }

  _Block_object_dispose(&state, 8);
  return v24 == 0;
}

void __73__NFDigitalCarKeySession_startCardEmulationAuthorization_deferred_error___block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 272, v3);
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
    v26 = 272;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __73__NFDigitalCarKeySession_startCardEmulationAuthorization_deferred_error___block_invoke_61(uint64_t a1, void *a2)
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 279, v4);
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
      v25 = 279;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (BOOL)stopCardEmulation:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[7];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = _os_activity_create(&dword_19B5EB000, "stopCardEmulation:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__NFDigitalCarKeySession_stopCardEmulation___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __44__NFDigitalCarKeySession_stopCardEmulation___block_invoke_65;
  v11[3] = &unk_1E3B51998;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  objc_msgSend(v8, "stopCardEmulationWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *(_QWORD *)(state.opaque[1] + 40) == 0;
  _Block_object_dispose(&state, 8);

  return v9;
}

void __44__NFDigitalCarKeySession_stopCardEmulation___block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 323, v3);
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
    v26 = 323;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __44__NFDigitalCarKeySession_stopCardEmulation___block_invoke_65(uint64_t a1, void *a2)
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
  void *v16;
  id v17;
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 327, v4);
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
      v21 = v13;
      v22 = 2082;
      v23 = v14;
      v24 = 2082;
      v25 = v15;
      v26 = 1024;
      v27 = 327;
      v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "disableBluetooth:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setCardEmulationStarted:", 0);
  }

}

- (void)endSession
{
  -[NFDigitalCarKeySession endSessionWithCompletion:](self, "endSessionWithCompletion:", 0);
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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 358);
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
    v25 = 358;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", 0);

  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPassthroughDelegate:", 0);

  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endSession");

  -[NFDigitalCarKeySession setSesdSession:](self, "setSesdSession:", 0);
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_super v7;
  _QWORD block[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "endSessionWithCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFSession callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NFDigitalCarKeySession_endSessionWithCompletion___block_invoke;
  block[3] = &unk_1E3B51A60;
  block[4] = self;
  dispatch_async(v6, block);

  v7.receiver = self;
  v7.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession endSessionWithCompletion:](&v7, sel_endSessionWithCompletion_, v4);

}

uint64_t __51__NFDigitalCarKeySession_endSessionWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "releaseSesdSession");
  return objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
}

- (id)activateWithToken:(id)a3
{
  const void **v6;
  id v7;
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
  objc_super v20;
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
  v6 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v7 = a3;
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
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 383);
  }
  dispatch_get_specific(*v6);
  NFSharedLogGetLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67109890;
    v22 = v16;
    v23 = 2082;
    v24 = object_getClassName(self);
    v25 = 2082;
    v26 = sel_getName(a2);
    v27 = 1024;
    v28 = 383;
    _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v20.receiver = self;
  v20.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession activateWithToken:](&v20, sel_activateWithToken_, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)createSessionHandoffToken:(id *)a3
{
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
  objc_super v18;
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
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 389);
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
    v26 = 389;
    _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v18.receiver = self;
  v18.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession createSessionHandoffToken:](&v18, sel_createSessionHandoffToken_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)handleSessionResumed
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
  id v16;
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  const char *Name;
  objc_super v40;
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
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
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
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 397);
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
    v42 = v13;
    v43 = 2082;
    v44 = object_getClassName(self);
    v45 = 2082;
    v46 = sel_getName(a2);
    v47 = 1024;
    v48 = 397;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  -[NFDigitalCarKeySession activeApplet](self, "activeApplet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[NFDigitalCarKeySession _getAppletsFromNFCD](self, "_getAppletsFromNFCD");
  dispatch_get_specific(*v4);
  v17 = NFLogGetLogger();
  if (v17)
  {
    v18 = (void (*)(uint64_t, const char *, ...))v17;
    v19 = object_getClass(self);
    v20 = class_isMetaClass(v19);
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    -[NFDigitalCarKeySession activeApplet](self, "activeApplet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 45;
    if (v20)
      v25 = 43;
    v18(6, "%c[%{public}s %{public}s]:%i here - Orig AID:%{public}@   current AID:%{public}@", v25, v21, v22, 408, v15, v24);

  }
  dispatch_get_specific(*v4);
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
    -[NFDigitalCarKeySession activeApplet](self, "activeApplet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110402;
    v42 = v28;
    v43 = 2082;
    v44 = v29;
    v45 = 2082;
    v46 = v30;
    v47 = 1024;
    v48 = 408;
    v49 = 2114;
    v50 = v15;
    v51 = 2114;
    v52 = v32;
    _os_log_impl(&dword_19B5EB000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i here - Orig AID:%{public}@   current AID:%{public}@", buf, 0x36u);

  }
  if (v15)
  {
    -[NFDigitalCarKeySession activeApplet](self, "activeApplet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v15, "isEqualToString:", v34);

    if ((v35 & 1) == 0)
    {
      -[NFDigitalCarKeySession appletsById](self, "appletsById");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKey:", v15);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[NFDigitalCarKeySession activeKey](self, "activeKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NFDigitalCarKeySession setActiveApplet:key:outError:](self, "setActiveApplet:key:outError:", v37, v38, 0);

    }
  }
  v40.receiver = self;
  v40.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession handleSessionResumed](&v40, sel_handleSessionResumed);

}

- (void)handleSessionSuspended:(id)a3
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
  uint64_t v16;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  const char *Name;
  const char *v28;
  objc_super v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
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
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 421);
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
    v31 = v15;
    v32 = 2082;
    v33 = object_getClassName(self);
    v34 = 2082;
    v35 = sel_getName(a2);
    v36 = 1024;
    v37 = 421;
    _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if (-[NFDigitalCarKeySession cardEmulationStarted](self, "cardEmulationStarted"))
  {
    dispatch_get_specific(*v6);
    v16 = NFLogGetLogger();
    if (v16)
    {
      v17 = (void (*)(uint64_t, const char *, ...))v16;
      v18 = object_getClass(self);
      v19 = class_isMetaClass(v18);
      v20 = object_getClassName(self);
      v28 = sel_getName(a2);
      v21 = 45;
      if (v19)
        v21 = 43;
      v17(4, "%c[%{public}s %{public}s]:%i Card Emulation had started and yet this session has been suspended.", v21, v20, v28, 426);
    }
    dispatch_get_specific(*v6);
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
      *(_DWORD *)buf = 67109890;
      v31 = v24;
      v32 = 2082;
      v33 = v25;
      v34 = 2082;
      v35 = v26;
      v36 = 1024;
      v37 = 426;
      _os_log_impl(&dword_19B5EB000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Card Emulation had started and yet this session has been suspended.", buf, 0x22u);
    }

    -[NFDigitalCarKeySession stopCardEmulation:](self, "stopCardEmulation:", 0);
  }
  v29.receiver = self;
  v29.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession handleSessionSuspended:](&v29, sel_handleSessionSuspended_, v5);

}

+ (id)getVehicleReports:(id *)a3
{
  return +[NFDigitalCarKeySession vehicleReports:](NFDigitalCarKeySession, "vehicleReports:", a3);
}

+ (id)vehicleReports:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = _os_activity_create(&dword_19B5EB000, "vehicleReports:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  objc_msgSend(MEMORY[0x1E0D89650], "getVehicleReports:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__NFDigitalCarKeySession_vehicleReports___block_invoke;
    v9[3] = &unk_1E3B51A88;
    v7 = v6;
    v10 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __41__NFDigitalCarKeySession_vehicleReports___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NFVehicleReport *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[NFVehicleReport initWithSESVehicleReport:]([NFVehicleReport alloc], "initWithSESVehicleReport:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, v6);
}

- (BOOL)supportsSecureRanging
{
  void *v3;
  void *v4;
  char v5;

  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsSecureRanging");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)setAuthorization:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  os_activity_scope_state_s state;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "setAuthorization:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v21[1] = *MEMORY[0x1E0CB2D68];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SESSession not available."));
    v22[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v14 = v7;
    v15 = 12;
LABEL_6:
    v8 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, v15, v12);

    goto LABEL_7;
  }
  if (!v4)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Missing Parameter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v19[1] = *MEMORY[0x1E0CB2D68];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Bad parameter"));
    v20[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    v14 = v7;
    v15 = 9;
    goto LABEL_6;
  }
  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAuthorization:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)cancelRKEFunction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  os_activity_scope_state_s state;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "cancelRKEFunction:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelRKEFunction:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v15[1] = *MEMORY[0x1E0CB2D68];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SESSession not available."));
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", v7, 12, v12);

  }
  return v8;
}

- (id)sendRKEFunction:(id)a3 rkeAction:(id)a4 authorization:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  const void **v15;
  uint64_t Logger;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  const char *Name;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  dispatch_semaphore_t v43;
  os_activity_scope_state_s state;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = _os_activity_create(&dword_19B5EB000, "sendRKEFunction:action:authorization:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = dispatch_semaphore_create(0);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __66__NFDigitalCarKeySession_sendRKEFunction_rkeAction_authorization___block_invoke;
  v37[3] = &unk_1E3B51AB0;
  v37[4] = &state;
  v37[5] = &v38;
  -[NFDigitalCarKeySession sendRKEFunction:action:authorization:completion:](self, "sendRKEFunction:action:authorization:completion:", v11, v10, v9, v37);

  v13 = v39[5];
  v14 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    v15 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v17 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v21 = 45;
      if (isMetaClass)
        v21 = 43;
      v17(4, "%c[%{public}s %{public}s]:%i Timed out waiting for rkeFunction response.!", v21, ClassName, Name, 524);
    }
    dispatch_get_specific(*v15);
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
      *(_DWORD *)buf = 67109890;
      v52 = v24;
      v53 = 2082;
      v54 = v25;
      v55 = 2082;
      v56 = v26;
      v57 = 1024;
      v58 = 524;
      _os_log_impl(&dword_19B5EB000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Timed out waiting for rkeFunction response.!", buf, 0x22u);
    }

    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Timeout");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v29;
    v49[1] = *MEMORY[0x1E0CB2D68];
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Timed out waitng for response to sendRKEFunction:action:authorization:completion:"));
    v50[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 5, v31);
    v33 = *(void **)(state.opaque[1] + 40);
    *(_QWORD *)(state.opaque[1] + 40) = v32;

  }
  v34 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&state, 8);
  return v34;
}

void __66__NFDigitalCarKeySession_sendRKEFunction_rkeAction_authorization___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v5 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
    dispatch_semaphore_signal(v5);

}

- (void)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[4];
  id v23;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  objc_super v27;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_19B5EB000, "sendRKEFunction:action:authorization:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (-[NFDigitalCarKeySession cardEmulationStarted](self, "cardEmulationStarted"))
    {
      v24.receiver = self;
      v24.super_class = (Class)NFDigitalCarKeySession;
      -[NFSession callbackQueue](&v24, sel_callbackQueue);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_2;
      block[3] = &unk_1E3B51AD8;
      v23 = v13;
      dispatch_async(v16, block);

      v17 = v23;
    }
    else
    {
      -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_3;
      v20[3] = &unk_1E3B51B28;
      v20[4] = self;
      v21 = v13;
      objc_msgSend(v19, "sendRKEFunction:action:authorization:completion:", v10, v11, v12, v20);

      v17 = v21;
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)NFDigitalCarKeySession;
    -[NFSession callbackQueue](&v27, sel_callbackQueue);
    v18 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke;
    v25[3] = &unk_1E3B51AD8;
    v26 = v13;
    dispatch_async(v18, v25);

    v17 = v26;
  }

}

void __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E0CB2D68];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SESSession not yet allocated."));
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", v3, 12, v6);
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v7);

}

void __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E0CB2D68];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Card Emulation In Progress"));
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", v3, 12, v6);
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v7);

}

void __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  objc_super v15;

  v5 = a2;
  v6 = a3;
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)NFDigitalCarKeySession;
  objc_msgSendSuper2(&v15, sel_callbackQueue);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_4;
  block[3] = &unk_1E3B51B00;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __74__NFDigitalCarKeySession_sendRKEFunction_action_authorization_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)sendPassthroughMessage:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  os_activity_scope_state_s state;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19B5EB000, "sendPassthroughMessage:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!-[NFDigitalCarKeySession cardEmulationStarted](self, "cardEmulationStarted"))
    {
      -[NFDigitalCarKeySession sesdSession](self, "sesdSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a4) = objc_msgSend(v10, "sendPassthroughMessage:error:", v6, a4);
      goto LABEL_9;
    }
    if (a4)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v11;
      v19[1] = *MEMORY[0x1E0CB2D68];
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Card Emulation In Progress"));
      v20[1] = v12;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = v20;
      v15 = v19;
LABEL_7:
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 12, v16);

      LOBYTE(a4) = 0;
LABEL_9:

    }
  }
  else if (a4)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid State");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v21[1] = *MEMORY[0x1E0CB2D68];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SESSession not yet allocated."));
    v22[1] = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v22;
    v15 = v21;
    goto LABEL_7;
  }

  return (char)a4;
}

+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  os_activity_scope_state_s v10;

  v5 = a4;
  v6 = a3;
  v7 = _os_activity_create(&dword_19B5EB000, "pauseRangingForReaderIdentifier:durationInSec:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v7, &v10);
  os_activity_scope_leave(&v10);

  objc_msgSend(MEMORY[0x1E0D89650], "pauseRangingForReaderIdentifier:durationInSec:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)resumeRangingForReaderIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  os_activity_scope_state_s v7;

  v3 = a3;
  v4 = _os_activity_create(&dword_19B5EB000, "resumeRangingForReaderIdentifier:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);
  os_activity_scope_leave(&v7);

  objc_msgSend(MEMORY[0x1E0D89650], "resumeRangingForReaderIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 outError:(id *)a5
{
  void *v7;
  NFDCKAssertion *v8;
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

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D89650], "requestAssertionForKeyID:withOptions:error:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[NFDCKAssertion initWithSESAssertion:]([NFDCKAssertion alloc], "initWithSESAssertion:", v7);
  }
  else
  {
    v9 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v11(4, "%c[%{public}s %{public}s]:%i Failed to get DCK assertion", v15, ClassName, Name, 627);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(a1);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v22 = v18;
      v23 = 2082;
      v24 = object_getClassName(a1);
      v25 = 2082;
      v26 = sel_getName(a2);
      v27 = 1024;
      v28 = 627;
      _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get DCK assertion", buf, 0x22u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)didDetectField:(BOOL)a3
{
  NSObject *v6;
  _QWORD block[6];
  BOOL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v9, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NFDigitalCarKeySession_didDetectField___block_invoke;
  block[3] = &unk_1E3B51B50;
  v8 = a3;
  block[4] = self;
  block[5] = a2;
  dispatch_async(v6, block);

}

void __41__NFDigitalCarKeySession_didDetectField___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  char v4;
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
  const char *Name;
  void *v18;
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
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(a1 + 48))
    {
      v18 = v2;
      v3 = objc_msgSend(*(id *)(a1 + 32), "fieldNotificationSent");
      v2 = v18;
      if (v3)
      {
        v4 = objc_opt_respondsToSelector();
        v2 = v18;
        if ((v4 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setFieldNotificationSent:", 0);
          objc_msgSend(v18, "sessionDidExitField:", *(_QWORD *)(a1 + 32));
          v2 = v18;
        }
      }
    }

  }
  else
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
      Name = sel_getName(*(SEL *)(a1 + 40));
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i Session not active", v11, ClassName, Name, 652);
    }
    dispatch_get_specific(*v5);
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
      *(_DWORD *)buf = 67109890;
      v20 = v14;
      v21 = 2082;
      v22 = v15;
      v23 = 2082;
      v24 = v16;
      v25 = 1024;
      v26 = 652;
      _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
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
  v11.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NFDigitalCarKeySession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E3B51A10;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __53__NFDigitalCarKeySession_didDetectFieldNotification___block_invoke(uint64_t a1)
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
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setFieldNotificationSent:", 1);
      objc_msgSend(v15, "session:didEnterFieldWithNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }

  }
  else
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
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 669);
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
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v17 = v11;
      v18 = 2082;
      v19 = v12;
      v20 = 2082;
      v21 = v13;
      v22 = 1024;
      v23 = 669;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didSelectApplet:(id)a3
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
  v11.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NFDigitalCarKeySession_didSelectApplet___block_invoke;
  block[3] = &unk_1E3B51A10;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __42__NFDigitalCarKeySession_didSelectApplet___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NFApplet *v4;
  const void **v5;
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
  uint64_t v18;
  NFApplet *v19;
  void *v20;
  void *v21;
  const void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "appletsById");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
      v4 = (NFApplet *)objc_claimAutoreleasedReturnValue();

      if (!v4)
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
          v12 = 45;
          if (isMetaClass)
            v12 = 43;
          v7(4, "%c[%{public}s %{public}s]:%i Applet ID [%{public}@] was not preexisting in array of applets.", v12, ClassName, Name, 686, *(_QWORD *)(a1 + 40));
        }
        dispatch_get_specific(*v5);
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
          v18 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 67110146;
          v37 = v15;
          v38 = 2082;
          v39 = v16;
          v40 = 2082;
          v41 = v17;
          v42 = 1024;
          v43 = 686;
          v44 = 2114;
          v45 = v18;
          _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet ID [%{public}@] was not preexisting in array of applets.", buf, 0x2Cu);
        }

        v19 = [NFApplet alloc];
        v34 = CFSTR("identifier");
        objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", *(_QWORD *)(a1 + 40));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = -[NFApplet initWithDictionary:](v19, "initWithDictionary:", v21);

      }
      -[NSObject session:didSelectApplet:](v2, "session:didSelectApplet:", *(_QWORD *)(a1 + 32), v4);

    }
  }
  else
  {
    v22 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v23 = NFLogGetLogger();
    if (v23)
    {
      v24 = (void (*)(uint64_t, const char *, ...))v23;
      v25 = object_getClass(*(id *)(a1 + 32));
      v26 = class_isMetaClass(v25);
      v27 = object_getClassName(*(id *)(a1 + 32));
      v33 = sel_getName(*(SEL *)(a1 + 48));
      v28 = 45;
      if (v26)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Session not active", v28, v27, v33, 693);
    }
    dispatch_get_specific(*v22);
    NFSharedLogGetLogger();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(*(id *)(a1 + 32));
      v32 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v37 = v30;
      v38 = 2082;
      v39 = v31;
      v40 = 2082;
      v41 = v32;
      v42 = 1024;
      v43 = 693;
      _os_log_impl(&dword_19B5EB000, v2, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
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
  v11.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NFDigitalCarKeySession_didStartTransaction___block_invoke;
  block[3] = &unk_1E3B51A10;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __46__NFDigitalCarKeySession_didStartTransaction___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
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
  const char *v16;
  const char *v17;
  const char *Name;
  id v19;
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
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = -[NFDigitalCarKeyStartEvent initFromContactlessPaymentStartEvent:]([NFDigitalCarKeyStartEvent alloc], "initFromContactlessPaymentStartEvent:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "appletsById");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "appletIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_setApplet:", v5);

      objc_msgSend(v19, "session:didStartTransaction:", *(_QWORD *)(a1 + 32), v2);
    }

  }
  else
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
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 711);
    }
    dispatch_get_specific(*v6);
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
      *(_DWORD *)buf = 67109890;
      v21 = v15;
      v22 = 2082;
      v23 = v16;
      v24 = 2082;
      v25 = v17;
      v26 = 1024;
      v27 = 711;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
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
  v11.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NFDigitalCarKeySession_didEndTransaction___block_invoke;
  block[3] = &unk_1E3B51A10;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __44__NFDigitalCarKeySession_didEndTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  const char *v18;
  const char *v19;
  const char *Name;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "disableBluetooth:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setCardEmulationStarted:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = -[NFDigitalCarKeyEndEvent initFromContactlessPaymentEndEvent:]([NFDigitalCarKeyEndEvent alloc], "initFromContactlessPaymentEndEvent:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "appletsById");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "appletIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setApplet:", v7);

      objc_msgSend(v21, "session:didEndTransaction:", *(_QWORD *)(a1 + 32), v4);
    }

  }
  else
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
      Name = sel_getName(*(SEL *)(a1 + 48));
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Session not active", v14, ClassName, Name, 732);
    }
    dispatch_get_specific(*v8);
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
      v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v23 = v17;
      v24 = 2082;
      v25 = v18;
      v26 = 2082;
      v27 = v19;
      v28 = 1024;
      v29 = 732;
      _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didExpireTransactionForApplet:(id)a3
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
  v11.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NFDigitalCarKeySession_didExpireTransactionForApplet___block_invoke;
  block[3] = &unk_1E3B51A10;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __56__NFDigitalCarKeySession_didExpireTransactionForApplet___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
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
  const char *v16;
  const char *v17;
  const char *Name;
  id v19;
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
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "disableBluetooth:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setCardEmulationStarted:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "appletsById");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "session:didExpireTransactionForApplet:", *(_QWORD *)(a1 + 32), v5);
    }

  }
  else
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
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 752);
    }
    dispatch_get_specific(*v6);
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
      *(_DWORD *)buf = 67109890;
      v21 = v15;
      v22 = 2082;
      v23 = v16;
      v24 = 2082;
      v25 = v17;
      v26 = 1024;
      v27 = 752;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didFailDeferredAuthorization
{
  NSObject *v4;
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v6, sel_callbackQueue);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__NFDigitalCarKeySession_didFailDeferredAuthorization__block_invoke;
  v5[3] = &unk_1E3B51460;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __54__NFDigitalCarKeySession_didFailDeferredAuthorization__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
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
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sesdSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "disableBluetooth:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setCardEmulationStarted:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "sessionDidFailDeferredAuthorization:", *(_QWORD *)(a1 + 32));

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
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 770);
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
      v25 = 770;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
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
  v14.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v14, sel_callbackQueue);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__NFDigitalCarKeySession_didExpressModeStateChange_withObject___block_invoke;
  v10[3] = &unk_1E3B51B78;
  v13 = a3;
  v10[4] = self;
  v11 = v7;
  v12 = a2;
  v9 = v7;
  dispatch_async(v8, v10);

}

void __63__NFDigitalCarKeySession_didExpressModeStateChange_withObject___block_invoke(uint64_t a1)
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
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "session:didExpressModeStateChange:withObject:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));

  }
  else
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
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 786);
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
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v17 = v11;
      v18 = 2082;
      v19 = v12;
      v20 = 2082;
      v21 = v13;
      v22 = 1024;
      v23 = 786;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didReceiveActivityTimeout:(id)a3
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
  v11.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NFDigitalCarKeySession_didReceiveActivityTimeout___block_invoke;
  block[3] = &unk_1E3B51A10;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __52__NFDigitalCarKeySession_didReceiveActivityTimeout___block_invoke(uint64_t a1)
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
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "sessionDidReceiveActivityTimeout:result:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
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
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 813);
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
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v17 = v11;
      v18 = 2082;
      v19 = v12;
      v20 = 2082;
      v21 = v13;
      v22 = 1024;
      v23 = 813;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)sesSession:(id)a3 didReceivePassthroughMessage:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v12, sel_callbackQueue);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NFDigitalCarKeySession_sesSession_didReceivePassthroughMessage___block_invoke;
  block[3] = &unk_1E3B51A10;
  v10 = v6;
  v11 = a2;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __66__NFDigitalCarKeySession_sesSession_didReceivePassthroughMessage___block_invoke(uint64_t a1)
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
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "passthroughDelegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "session:didReceivePassthroughMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
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
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v4(4, "%c[%{public}s %{public}s]:%i Ignoring message as session is no longer active.", v8, ClassName, Name, 826);
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
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67109890;
      v17 = v11;
      v18 = 2082;
      v19 = v12;
      v20 = 2082;
      v21 = v13;
      v22 = 1024;
      v23 = 826;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ignoring message as session is no longer active.", buf, 0x22u);
    }

  }
}

- (void)sesSession:(id)a3 event:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NFDigitalCarKeySession;
  -[NFSession callbackQueue](&v16, sel_callbackQueue);
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__NFDigitalCarKeySession_sesSession_event___block_invoke;
  v12[3] = &unk_1E3B51BA0;
  v12[4] = self;
  v13 = v8;
  v14 = v7;
  v15 = a2;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __43__NFDigitalCarKeySession_sesSession_event___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const void **v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  const void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *v22;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  const void **v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *v33;
  _BOOL4 v34;
  const char *v35;
  uint64_t v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  const void **v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  const char *v51;
  const char *v52;
  NSObject *v53;
  const void **v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *Name;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  id v71;
  uint8_t buf[4];
  int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("xpcEventName"));
    v2 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.secureelementservice.dck.event.did.request.secure.element")))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "cardEmulationStarted"))
      {
        v3 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v5 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 56));
          v9 = 45;
          if (isMetaClass)
            v9 = 43;
          v5(4, "%c[%{public}s %{public}s]:%i SESD requested SE and session needs to stop card emulation first.", v9, ClassName, Name, 848);
        }
        dispatch_get_specific(*v3);
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
          v14 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67109890;
          v73 = v12;
          v74 = 2082;
          v75 = v13;
          v76 = 2082;
          v77 = v14;
          v78 = 1024;
          v79 = 848;
          _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SESD requested SE and session needs to stop card emulation first.", buf, 0x22u);
        }

        objc_msgSend(*(id *)(a1 + 32), "stopCardEmulation:", 0);
      }
      v15 = *(void **)(a1 + 32);
      v71 = 0;
      objc_msgSend(v15, "createSessionHandoffToken:", &v71);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v71;
      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 48), "setSecureElementToken:", v16);
        v18 = objc_claimAutoreleasedReturnValue();

        v17 = (id)v18;
      }
      if (v17)
      {
        v19 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v20 = NFLogGetLogger();
        if (v20)
        {
          v21 = (void (*)(uint64_t, const char *, ...))v20;
          v22 = object_getClass(*(id *)(a1 + 32));
          v23 = class_isMetaClass(v22);
          v65 = object_getClassName(*(id *)(a1 + 32));
          v67 = sel_getName(*(SEL *)(a1 + 56));
          v24 = 45;
          if (v23)
            v24 = 43;
          v21(3, "%c[%{public}s %{public}s]:%i Failed to create handoff token for sesd - %{public}@", v24, v65, v67, 859, v17);
        }
        dispatch_get_specific(*v19);
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
          v29 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67110146;
          v73 = v27;
          v74 = 2082;
          v75 = v28;
          v76 = 2082;
          v77 = v29;
          v78 = 1024;
          v79 = 859;
          v80 = 2114;
          v81 = v17;
          _os_log_impl(&dword_19B5EB000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create handoff token for sesd - %{public}@", buf, 0x2Cu);
        }

      }
    }
    else
    {
      if (-[NSObject isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.secureelementservice.dck.event.did.request.authorization")))
      {
        v41 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v42 = NFLogGetLogger();
        if (v42)
        {
          v43 = (void (*)(uint64_t, const char *, ...))v42;
          v44 = object_getClass(*(id *)(a1 + 32));
          v45 = class_isMetaClass(v44);
          v46 = object_getClassName(*(id *)(a1 + 32));
          v69 = sel_getName(*(SEL *)(a1 + 56));
          v47 = 45;
          if (v45)
            v47 = 43;
          v43(6, "%c[%{public}s %{public}s]:%i SES_DCK_EVENT_DID_REQUEST_AUTHORIZATION", v47, v46, v69, 863);
        }
        dispatch_get_specific(*v41);
        NFSharedLogGetLogger();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v49))
            v50 = 43;
          else
            v50 = 45;
          v51 = object_getClassName(*(id *)(a1 + 32));
          v52 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67109890;
          v73 = v50;
          v74 = 2082;
          v75 = v51;
          v76 = 2082;
          v77 = v52;
          v78 = 1024;
          v79 = 863;
          _os_log_impl(&dword_19B5EB000, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SES_DCK_EVENT_DID_REQUEST_AUTHORIZATION", buf, 0x22u);
        }

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v53 = objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[NSObject sessionRequestAuthorization:](v53, "sessionRequestAuthorization:", *(_QWORD *)(a1 + 32));
      }
      else if (-[NSObject isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.secureelementservice.dck.event.did.consume.authorization")))
      {
        v54 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v55 = NFLogGetLogger();
        if (v55)
        {
          v56 = (void (*)(uint64_t, const char *, ...))v55;
          v57 = object_getClass(*(id *)(a1 + 32));
          v58 = class_isMetaClass(v57);
          v59 = object_getClassName(*(id *)(a1 + 32));
          v70 = sel_getName(*(SEL *)(a1 + 56));
          v60 = 45;
          if (v58)
            v60 = 43;
          v56(6, "%c[%{public}s %{public}s]:%i SES_DCK_EVENT_DID_CONSUME_AUTHORIZATION", v60, v59, v70, 869);
        }
        dispatch_get_specific(*v54);
        NFSharedLogGetLogger();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v61 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v61))
            v62 = 43;
          else
            v62 = 45;
          v63 = object_getClassName(*(id *)(a1 + 32));
          v64 = sel_getName(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 67109890;
          v73 = v62;
          v74 = 2082;
          v75 = v63;
          v76 = 2082;
          v77 = v64;
          v78 = 1024;
          v79 = 869;
          _os_log_impl(&dword_19B5EB000, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SES_DCK_EVENT_DID_CONSUME_AUTHORIZATION", buf, 0x22u);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v53 = objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[NSObject session:event:](v53, "session:event:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }

    }
  }
  else
  {
    v30 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v31 = NFLogGetLogger();
    if (v31)
    {
      v32 = (void (*)(uint64_t, const char *, ...))v31;
      v33 = object_getClass(*(id *)(a1 + 32));
      v34 = class_isMetaClass(v33);
      v35 = object_getClassName(*(id *)(a1 + 32));
      v68 = sel_getName(*(SEL *)(a1 + 56));
      v36 = 45;
      if (v34)
        v36 = 43;
      v32(3, "%c[%{public}s %{public}s]:%i Session not active", v36, v35, v68, 886);
    }
    dispatch_get_specific(*v30);
    NFSharedLogGetLogger();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v37 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v37))
        v38 = 43;
      else
        v38 = 45;
      v39 = object_getClassName(*(id *)(a1 + 32));
      v40 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67109890;
      v73 = v38;
      v74 = 2082;
      v75 = v39;
      v76 = 2082;
      v77 = v40;
      v78 = 1024;
      v79 = 886;
      _os_log_impl(&dword_19B5EB000, v2, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }
  }

}

- (NFDigitalCarKeySessionPassthroughDelegate)passthroughDelegate
{
  return (NFDigitalCarKeySessionPassthroughDelegate *)objc_loadWeakRetained((id *)&self->_passthroughDelegate);
}

- (void)setPassthroughDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_passthroughDelegate, a3);
}

- (NFDigitalCarKeySessionDelegate)delegate
{
  return (NFDigitalCarKeySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)activeKey
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NFApplet)defaultApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)fieldNotificationSent
{
  return self->_fieldNotificationSent;
}

- (void)setFieldNotificationSent:(BOOL)a3
{
  self->_fieldNotificationSent = a3;
}

- (BOOL)cardEmulationStarted
{
  return self->_cardEmulationStarted;
}

- (void)setCardEmulationStarted:(BOOL)a3
{
  self->_cardEmulationStarted = a3;
}

- (NSDictionary)appletsById
{
  return self->_appletsById;
}

- (void)setAppletsById:(id)a3
{
  objc_storeStrong((id *)&self->_appletsById, a3);
}

- (SESDCKSession)sesdSession
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
  objc_storeStrong((id *)&self->_appletsById, 0);
  objc_storeStrong((id *)&self->_defaultApplet, 0);
  objc_storeStrong((id *)&self->_activeKey, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_passthroughDelegate);
}

@end
