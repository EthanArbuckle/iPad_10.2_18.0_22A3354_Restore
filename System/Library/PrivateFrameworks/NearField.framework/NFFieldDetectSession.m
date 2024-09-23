@implementation NFFieldDetectSession

- (BOOL)isTimeLimited
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NFFieldDetectSession *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  -[NFFieldDetectSession delegate](obj, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  obj->_detectFieldCallback = objc_opt_respondsToSelector() & 1;

  -[NFFieldDetectSession delegate](obj, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  obj->_exitFieldCallback = objc_opt_respondsToSelector() & 1;

  -[NFFieldDetectSession delegate](obj, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  obj->_enterFieldCallback = objc_opt_respondsToSelector() & 1;

  -[NFFieldDetectSession delegate](obj, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  obj->_detectTechnologyCallback = objc_opt_respondsToSelector() & 1;

  objc_sync_exit(obj);
}

- (NFFieldDetectSessionDelegate)delegate
{
  NFFieldDetectSession *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFFieldDetectSessionDelegate *)WeakRetained;
}

- (void)didDetectField:(BOOL)a3
{
  NSObject *v6;
  _QWORD block[6];
  BOOL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NFFieldDetectSession;
  -[NFSession callbackQueue](&v9, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__NFFieldDetectSession_didDetectField___block_invoke;
  block[3] = &unk_1E3B51B50;
  block[4] = self;
  block[5] = a2;
  v8 = a3;
  dispatch_async(v6, block);

}

void __39__NFFieldDetectSession_didDetectField___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  int v3;
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
  void *v16;
  _BYTE *v17;
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
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
  {
    v2 = *(_BYTE **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
    {
      v3 = 1;
    }
    else if (v2[80] && v2[83])
    {
      v2[80] = 0;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fieldDetectSessionDidExitField:", *(_QWORD *)(a1 + 32));

      v3 = *(unsigned __int8 *)(a1 + 48);
      v2 = *(_BYTE **)(a1 + 32);
    }
    else
    {
      v3 = 0;
    }
    if (v3 != v2[81])
    {
      v2[81] = v3;
      v17 = *(_BYTE **)(a1 + 32);
      if (v17[82])
      {
        objc_msgSend(v17, "delegate");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fieldDetectSession:didDetectField:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

      }
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
      v6(3, "%c[%{public}s %{public}s]:%i Session not active", v10, ClassName, Name, 54);
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
      v21 = v13;
      v22 = 2082;
      v23 = v14;
      v24 = 2082;
      v25 = v15;
      v26 = 1024;
      v27 = 54;
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
  v11.super_class = (Class)NFFieldDetectSession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NFFieldDetectSession_didDetectFieldNotification___block_invoke;
  block[3] = &unk_1E3B51A10;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __51__NFFieldDetectSession_didDetectFieldNotification___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  NFTechnologyEvent *v4;
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
  NFTechnologyEvent *v19;
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
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
  {
    v2 = *(_BYTE **)(a1 + 32);
    if (v2[84])
    {
      objc_msgSend(v2, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fieldDetectSession:didEnterFieldWithNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
      v2 = *(_BYTE **)(a1 + 32);
    }
    if (v2[85])
    {
      v4 = -[NFTechnologyEvent initWithFieldNotification:]([NFTechnologyEvent alloc], "initWithFieldNotification:", *(_QWORD *)(a1 + 40));
      if (v4)
      {
        v19 = v4;
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fieldDetectSession:didDetectTechnology:", *(_QWORD *)(a1 + 32), v19);

        v4 = v19;
      }

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
      v8(3, "%c[%{public}s %{public}s]:%i Session not active", v12, ClassName, Name, 77);
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
      v27 = 77;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
}

- (void)didEndUnexpectedly
{
  NSObject *v4;
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFFieldDetectSession;
  -[NFSession callbackQueue](&v6, sel_callbackQueue);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__NFFieldDetectSession_didEndUnexpectedly__block_invoke;
  v5[3] = &unk_1E3B51460;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

id __42__NFFieldDetectSession_didEndUnexpectedly__block_invoke(uint64_t a1)
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
      v4(3, "%c[%{public}s %{public}s]:%i Session not active", v8, ClassName, Name, 102);
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
      v27 = 102;
      _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not active", buf, 0x22u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fieldDetectSessionDidEndUnexpectedly:", *(_QWORD *)(a1 + 32));

  }
  v19.receiver = *(id *)(a1 + 32);
  v19.super_class = (Class)NFFieldDetectSession;
  return objc_msgSendSuper2(&v19, sel_didEndUnexpectedly);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
