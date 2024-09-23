@implementation NFCHardwareManager

+ (id)sharedHardwareManager
{
  if (sharedHardwareManager_onceToken[0] != -1)
    dispatch_once(sharedHardwareManager_onceToken, &__block_literal_global_2);
  return (id)sharedHardwareManager__singleton;
}

void __43__NFCHardwareManager_sharedHardwareManager__block_invoke()
{
  NFCHardwareManager *v0;
  void *v1;

  v0 = objc_alloc_init(NFCHardwareManager);
  v1 = (void *)sharedHardwareManager__singleton;
  sharedHardwareManager__singleton = (uint64_t)v0;

}

- (NFCHardwareManager)init
{
  NFCHardwareManager *v2;
  uint64_t v3;
  NSHashTable *delegates;
  NFCSession *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NFCSession *xpcSession;
  uint64_t v10;
  NSMutableDictionary *queuedCoreNFCSessions;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NFCHardwareManager;
  v2 = -[NFCHardwareManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v3;

    v5 = [NFCSession alloc];
    +[NFCHardwareManagerInterface interface](NFCHardwareManagerInterface, "interface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCHardwareManagerCallbacks interface](NFCHardwareManagerCallbacks, "interface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NFCSession initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:delegate:](v5, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:delegate:", CFSTR("com.apple.nfcd.service.corenfc"), v6, v7, v2, v2);
    xpcSession = v2->_xpcSession;
    v2->_xpcSession = (NFCSession *)v8;

    v10 = objc_opt_new();
    queuedCoreNFCSessions = v2->_queuedCoreNFCSessions;
    v2->_queuedCoreNFCSessions = (NSMutableDictionary *)v10;

    *(_QWORD *)&v2->_readerSessionLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)_queueSession:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_readerSessionLock;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", arc4random());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_readerSessionLock = &self->_readerSessionLock;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __36__NFCHardwareManager__queueSession___block_invoke;
  v12[3] = &unk_24D450128;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  os_unfair_lock_lock(p_readerSessionLock);
  __36__NFCHardwareManager__queueSession___block_invoke(v12);
  os_unfair_lock_unlock(p_readerSessionLock);
  v9 = v14;
  v10 = v7;

  return v10;
}

uint64_t __36__NFCHardwareManager__queueSession___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
}

- (void)queueReaderSession:(id)a3 sessionConfig:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  NFCSession *xpcSession;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;
  _QWORD v22[4];
  id v23;

  v9 = a3;
  v10 = a5;
  xpcSession = self->_xpcSession;
  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __73__NFCHardwareManager_queueReaderSession_sessionConfig_completionHandler___block_invoke;
  v22[3] = &unk_24D450150;
  v13 = v10;
  v23 = v13;
  v14 = a4;
  -[NFCSession synchronousRemoteObjectProxyWithErrorHandler:](xpcSession, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __73__NFCHardwareManager_queueReaderSession_sessionConfig_completionHandler___block_invoke_2;
  v18[3] = &unk_24D450178;
  v18[4] = self;
  v19 = v9;
  v20 = v13;
  v21 = a2;
  v16 = v13;
  v17 = v9;
  objc_msgSend(v15, "queueReaderSession:sessionConfig:completion:", v17, v14, v18);

}

void __73__NFCHardwareManager_queueReaderSession_sessionConfig_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id, id))(v2 + 16))(v2, 0, 0, v5, v4);

}

void __73__NFCHardwareManager_queueReaderSession_sessionConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    if (objc_msgSend(v7, "code") == 36)
    {
      objc_msgSend(v7, "localizedDescription");
      v24 = objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __CRASHING_DUE_TO_PRIVACY_VIOLATION__(v24);
    }
    if (objc_msgSend(v7, "code") == 14)
    {
      v11 = 1;
    }
    else
    {
      if (objc_msgSend(v7, "code") != 58 && objc_msgSend(v7, "code") != 47)
      {
        if (objc_msgSend(v7, "code") == 10)
        {
          v11 = 3;
          goto LABEL_8;
        }
        if (objc_msgSend(v7, "code") == 50)
        {
          v11 = 6;
          goto LABEL_8;
        }
        if (objc_msgSend(v7, "code") != 2)
        {
          if (objc_msgSend(v7, "code") == 8)
          {
            v11 = 2;
          }
          else if (objc_msgSend(v7, "code") == 32)
          {
            v11 = 2;
          }
          else
          {
            v11 = 202;
          }
          goto LABEL_8;
        }
      }
      v11 = 203;
    }
LABEL_8:
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v12;
  }
  if (v7)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v17, ClassName, Name, 129, v7);
    }
    NFSharedLogGetLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      v21 = object_getClassName(*(id *)(a1 + 32));
      v22 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v28 = v20;
      v29 = 2082;
      v30 = v21;
      v31 = 2082;
      v32 = v22;
      v33 = 1024;
      v34 = 129;
      v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_215BBD000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }

    v23 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queueSession:", *(_QWORD *)(a1 + 40));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)queueCardSession:(id)a3 sessionConfig:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  NFCSession *xpcSession;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;
  _QWORD v22[4];
  id v23;

  v9 = a3;
  v10 = a5;
  xpcSession = self->_xpcSession;
  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __71__NFCHardwareManager_queueCardSession_sessionConfig_completionHandler___block_invoke;
  v22[3] = &unk_24D450150;
  v13 = v10;
  v23 = v13;
  v14 = a4;
  -[NFCSession synchronousRemoteObjectProxyWithErrorHandler:](xpcSession, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __71__NFCHardwareManager_queueCardSession_sessionConfig_completionHandler___block_invoke_2;
  v18[3] = &unk_24D4501A0;
  v18[4] = self;
  v19 = v9;
  v20 = v13;
  v21 = a2;
  v16 = v13;
  v17 = v9;
  objc_msgSend(v15, "queueCardSession:sessionConfig:completion:", v17, v14, v18);

}

void __71__NFCHardwareManager_queueCardSession_sessionConfig_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id, id))(v2 + 16))(v2, 0, 0, v5, v4);

}

void __71__NFCHardwareManager_queueCardSession_sessionConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
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
  void *v21;
  uint64_t v22;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10 && objc_msgSend(v7, "code") == 36)
  {
    objc_msgSend(v7, "localizedDescription");
    v22 = objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __CRASHING_DUE_TO_PRIVACY_VIOLATION__(v22);
  }
  if (v7)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v15, ClassName, Name, 161, v7);
    }
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
      v20 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v26 = v18;
      v27 = 2082;
      v28 = v19;
      v29 = 2082;
      v30 = v20;
      v31 = 1024;
      v32 = 161;
      v33 = 2114;
      v34 = v7;
      _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }

    v21 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queueSession:", *(_QWORD *)(a1 + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)queueCardFieldDetectSession:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NFCSession *xpcSession;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  xpcSession = self->_xpcSession;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __68__NFCHardwareManager_queueCardFieldDetectSession_completionHandler___block_invoke;
  v19[3] = &unk_24D450150;
  v11 = v8;
  v20 = v11;
  -[NFCSession synchronousRemoteObjectProxyWithErrorHandler:](xpcSession, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __68__NFCHardwareManager_queueCardFieldDetectSession_completionHandler___block_invoke_2;
  v15[3] = &unk_24D4501C8;
  v15[4] = self;
  v16 = v7;
  v17 = v11;
  v18 = a2;
  v13 = v11;
  v14 = v7;
  objc_msgSend(v12, "queueCardFieldDetectSession:completion:", v14, v15);

}

uint64_t __68__NFCHardwareManager_queueCardFieldDetectSession_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__NFCHardwareManager_queueCardFieldDetectSession_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  void *v17;
  uint64_t v18;
  id v19;
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

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = a2;
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v11, ClassName, Name, 184, v5);
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
      v16 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v23 = v14;
      v24 = 2082;
      v25 = v15;
      v26 = 2082;
      v27 = v16;
      v28 = 1024;
      v29 = 184;
      v30 = 2114;
      v31 = v5;
      _os_log_impl(&dword_215BBD000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    v17 = *(void **)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    v19 = a2;
    objc_msgSend(v17, "_queueSession:", v18);
    v12 = objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)requestPresentmentSuppressionWithDelegate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  uint64_t v9;
  _QWORD *v10;
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NFCSession *xpcSession;
  void (**v29)(id, _QWORD, void *);
  void *v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(id, _QWORD, void *);
  SEL v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[2];
  uint64_t (*v38)(uint64_t);
  void *v39;
  NFCHardwareManager *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _QWORD v46[4];
  _QWORD v47[4];
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v9 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v38 = __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke;
  v39 = &unk_24D44FAA0;
  v40 = self;
  v41 = &v42;
  v10 = v37;
  os_unfair_lock_lock(&self->_presentmentSuppressionLock);
  v38((uint64_t)v10);
  os_unfair_lock_unlock(&self->_presentmentSuppressionLock);

  if (*((_BYTE *)v43 + 24))
  {
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v13 = 43;
      else
        v13 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Resource unavailable", v13, ClassName, Name, 205);
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
      v19 = object_getClassName(self);
      v20 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v49 = v18;
      v50 = 2082;
      v51 = v19;
      v52 = 2082;
      v53 = v20;
      v54 = 1024;
      v55 = 205;
      _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Resource unavailable", buf, 0x22u);
    }

    v21 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "No resources");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v23;
    v47[1] = &unk_24D45FFA0;
    v46[1] = CFSTR("Line");
    v46[2] = CFSTR("Method");
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v47[2] = v24;
    v46[3] = *MEMORY[0x24BDD0BA0];
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 206);
    v47[3] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 34, v26);
    v8[2](v8, 0, v27);

  }
  else
  {
    xpcSession = self->_xpcSession;
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_36;
    v35[3] = &unk_24D450150;
    v29 = v8;
    v36 = v29;
    -[NFCSession remoteObjectProxyWithErrorHandler:](xpcSession, "remoteObjectProxyWithErrorHandler:", v35);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v9;
    v31[1] = 3221225472;
    v31[2] = __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_2;
    v31[3] = &unk_24D4501F0;
    v31[4] = self;
    v34 = a2;
    v32 = v7;
    v33 = v29;
    objc_msgSend(v30, "requestSuppressPresentmentWithCompletion:", v31);

    v22 = v36;
  }

  _Block_object_dispose(&v42, 8);
}

uint64_t __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48) != 0;
  return result;
}

uint64_t __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
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
  id v16;
  void *v17;
  os_unfair_lock_s *v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  void *v21;
  const char *ClassName;
  const char *Name;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
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
      v7(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v10, ClassName, Name, 217, v5);
    }
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
      v28 = v13;
      v29 = 2082;
      v30 = v14;
      v31 = 2082;
      v32 = v15;
      v33 = 1024;
      v34 = 217;
      v35 = 2114;
      v36 = v5;
      _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }

    v16 = 0;
  }
  else
  {
    +[NFCPresentmentSuppression assertionWithAssertion:delegate:](NFCPresentmentSuppression, "assertionWithAssertion:delegate:", a2, *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(os_unfair_lock_s **)(a1 + 32);
    v19 = v18 + 11;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_38;
    v24[3] = &unk_24D450128;
    v24[4] = v18;
    v16 = v17;
    v25 = v16;
    v26 = *(id *)(a1 + 40);
    os_unfair_lock_lock(v19);
    __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_38((uint64_t)v24);
    os_unfair_lock_unlock(v19);

  }
  v20 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v16, "externalHandle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v20 + 16))(v20, v21, v5);

}

uint64_t __75__NFCHardwareManager_requestPresentmentSuppressionWithDelegate_completion___block_invoke_38(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "startAssertion:", 15.0);
}

- (void)releasePresentmentSuppression:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v15;
  const char *ClassName;
  const char *Name;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  NFCSession *xpcSession;
  void (**v25)(id, void *);
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  void (**v36)(id, void *);
  SEL v37;
  _QWORD v38[4];
  void (**v39)(id, void *);
  _QWORD v40[2];
  id (*v41)(uint64_t);
  void *v42;
  NFCHardwareManager *v43;
  id v44;
  uint64_t *v45;
  SEL v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  uint64_t v62;
  _QWORD v63[4];
  _QWORD v64[7];

  v64[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = 0;
  v9 = MEMORY[0x24BDAC760];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v41 = __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke;
  v42 = &unk_24D450218;
  v43 = self;
  v10 = v7;
  v45 = &v47;
  v46 = a2;
  v44 = v10;
  v11 = v40;
  os_unfair_lock_lock(&self->_presentmentSuppressionLock);
  v41((uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_presentmentSuppressionLock);

  if (v12)
  {
    v8[2](v8, v12);
  }
  else
  {
    if (v48[5])
    {
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v15 = 43;
        else
          v15 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(6, "%c[%{public}s %{public}s]:%i handle=%lu", v15, ClassName, Name, 257, objc_msgSend(v10, "unsignedIntegerValue"));
      }
      NFSharedLogGetLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = object_getClass(self);
        if (class_isMetaClass(v19))
          v20 = 43;
        else
          v20 = 45;
        v21 = object_getClassName(self);
        v22 = sel_getName(a2);
        v23 = objc_msgSend(v10, "unsignedIntegerValue");
        *(_DWORD *)buf = 67110146;
        v54 = v20;
        v55 = 2082;
        v56 = v21;
        v57 = 2082;
        v58 = v22;
        v59 = 1024;
        v60 = 257;
        v61 = 2048;
        v62 = v23;
        _os_log_impl(&dword_215BBD000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handle=%lu", buf, 0x2Cu);
      }

      xpcSession = self->_xpcSession;
      v38[0] = v9;
      v38[1] = 3221225472;
      v38[2] = __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_45;
      v38[3] = &unk_24D450150;
      v25 = v8;
      v39 = v25;
      -[NFCSession remoteObjectProxyWithErrorHandler:](xpcSession, "remoteObjectProxyWithErrorHandler:", v38);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v48[5];
      v35[0] = v9;
      v35[1] = 3221225472;
      v35[2] = __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_2;
      v35[3] = &unk_24D450240;
      v35[4] = self;
      v37 = a2;
      v36 = v25;
      objc_msgSend(v26, "releaseSuppressPresentmentAssertion:completion:", v27, v35);

      v28 = v39;
    }
    else
    {
      v29 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v30;
      v64[1] = &unk_24D45FFD0;
      v63[1] = CFSTR("Line");
      v63[2] = CFSTR("Method");
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v64[2] = v31;
      v63[3] = *MEMORY[0x24BDD0BA0];
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 253);
      v64[3] = v32;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", v28, 10, v33);
      v8[2](v8, v34);

    }
  }

  _Block_object_dispose(&v47, 8);
}

id __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *Name;
  _QWORD v27[4];
  _QWORD v28[4];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "externalHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToNumber:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "assertion");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    return 0;
  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Invalid handle", v13, ClassName, Name, 242);
    }
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
      *(_DWORD *)buf = 67109890;
      v30 = v16;
      v31 = 2082;
      v32 = v17;
      v33 = 2082;
      v34 = v18;
      v35 = 1024;
      v36 = 242;
      _os_log_impl(&dword_215BBD000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid handle", buf, 0x22u);
    }

    v19 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v21;
    v28[1] = &unk_24D45FFB8;
    v27[1] = CFSTR("Line");
    v27[2] = CFSTR("Method");
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v28[2] = v22;
    v27[3] = *MEMORY[0x24BDD0BA0];
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 243);
    v28[3] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 10, v24);

    return v25;
  }
}

uint64_t __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_2(uint64_t a1, void *a2)
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
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;
  const char *ClassName;
  const char *Name;
  _QWORD v18[5];
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

  v29 = *MEMORY[0x24BDAC8D0];
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
      Name = sel_getName(*(SEL *)(a1 + 48));
      v8 = 45;
      if (isMetaClass)
        v8 = 43;
      v5(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v8, ClassName, Name, 262, v3);
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
      v13 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v20 = v11;
      v21 = 2082;
      v22 = v12;
      v23 = 2082;
      v24 = v13;
      v25 = 1024;
      v26 = 262;
      v27 = 2114;
      v28 = v3;
      _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    v14 = *(os_unfair_lock_s **)(a1 + 32);
    v15 = v14 + 11;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_46;
    v18[3] = &unk_24D44FB90;
    v18[4] = v14;
    os_unfair_lock_lock(v14 + 11);
    __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_46((uint64_t)v18);
    os_unfair_lock_unlock(v15);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __63__NFCHardwareManager_releasePresentmentSuppression_completion___block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "startCooldown:", 15.0);
}

- (void)isCardSessionEligibleWithCompletionHandler:(id)a3
{
  id v4;
  NFCSession *xpcSession;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  xpcSession = self->_xpcSession;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__NFCHardwareManager_isCardSessionEligibleWithCompletionHandler___block_invoke;
  v12[3] = &unk_24D450150;
  v7 = v4;
  v13 = v7;
  -[NFCSession remoteObjectProxyWithErrorHandler:](xpcSession, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __65__NFCHardwareManager_isCardSessionEligibleWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_24D450268;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "isCardSessionEligibleWithCompletion:", v10);

}

uint64_t __65__NFCHardwareManager_isCardSessionEligibleWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__NFCHardwareManager_isCardSessionEligibleWithCompletionHandler___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  void (*v5)(void);
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_7:
    v5();
    v6 = v7;
    goto LABEL_8;
  }
  if (a2 < 3)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  v6 = 0;
  if (a2 == 3)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)dequeueSession:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerSessionLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_readerSessionLock = &self->_readerSessionLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__NFCHardwareManager_dequeueSession___block_invoke;
  v7[3] = &unk_24D44FAF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_readerSessionLock);
  __37__NFCHardwareManager_dequeueSession___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_readerSessionLock);

}

void __37__NFCHardwareManager_dequeueSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeysForObject:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectsForKeys:", v2);

}

- (NSArray)getDelegates
{
  NFCHardwareManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSHashTable allObjects](v2->_delegates, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addNFCHardwareManagerCallbacksListener:(id)a3
{
  NFCHardwareManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_delegates, "addObject:", v5);
  objc_sync_exit(v4);

}

- (BOOL)areFeaturesSupported:(unint64_t)a3 outError:(id *)a4
{
  uint64_t v8;
  NFCSession *xpcSession;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v17;
  const char *ClassName;
  const char *Name;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  BOOL v38;
  void *v40;
  void *v41;
  _QWORD v42[6];
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__1;
  v48 = __Block_byref_object_dispose__1;
  v49 = 0;
  if (a4)
    *a4 = 0;
  v8 = MEMORY[0x24BDAC760];
  xpcSession = self->_xpcSession;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __52__NFCHardwareManager_areFeaturesSupported_outError___block_invoke;
  v43[3] = &unk_24D44FD88;
  v43[4] = &v44;
  -[NFCSession synchronousRemoteObjectProxyWithErrorHandler:](xpcSession, "synchronousRemoteObjectProxyWithErrorHandler:", v43);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v8;
  v42[1] = 3221225472;
  v42[2] = __52__NFCHardwareManager_areFeaturesSupported_outError___block_invoke_2;
  v42[3] = &unk_24D450290;
  v42[4] = &v44;
  v42[5] = &v50;
  objc_msgSend(v10, "areFeaturesSupported:completion:", a3, v42);

  v11 = (void *)v45[5];
  if (v11)
  {
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v17 = 43;
        else
          v17 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(4, "%c[%{public}s %{public}s]:%i Stack error: %@", v17, ClassName, Name, 345, v45[5]);
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
        v23 = object_getClassName(self);
        v24 = sel_getName(a2);
        v25 = v45[5];
        *(_DWORD *)buf = 67110146;
        v57 = v22;
        v58 = 2082;
        v59 = v23;
        v60 = 2082;
        v61 = v24;
        v62 = 1024;
        v63 = 345;
        v64 = 2112;
        v65 = v25;
        _os_log_impl(&dword_215BBD000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Stack error: %@", buf, 0x2Cu);
      }

      if (a4)
      {
        if (objc_msgSend((id)v45[5], "code") == 57)
        {
          +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
          v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend((id)v45[5], "code") != 58)
          {
            v54[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Stack Error");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v54[1] = *MEMORY[0x24BDD1398];
            v55[0] = v40;
            v55[1] = v45[5];
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 202, v41);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_31;
          }
          +[NFCError errorWithCode:](NFCError, "errorWithCode:", 203);
          v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_30;
      }
    }
    else
    {
      v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v27)
      {
        v28 = object_getClass(self);
        if (class_isMetaClass(v28))
          v29 = 43;
        else
          v29 = 45;
        v30 = object_getClassName(self);
        v31 = sel_getName(a2);
        v27(4, "%c[%{public}s %{public}s]:%i XPC Error: %@", v29, v30, v31, 358, v45[5]);
      }
      NFSharedLogGetLogger();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = object_getClass(self);
        if (class_isMetaClass(v33))
          v34 = 43;
        else
          v34 = 45;
        v35 = object_getClassName(self);
        v36 = sel_getName(a2);
        v37 = v45[5];
        *(_DWORD *)buf = 67110146;
        v57 = v34;
        v58 = 2082;
        v59 = v35;
        v60 = 2082;
        v61 = v36;
        v62 = 1024;
        v63 = 358;
        v64 = 2112;
        v65 = v37;
        _os_log_impl(&dword_215BBD000, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Error: %@", buf, 0x2Cu);
      }

      if (a4)
      {
        v26 = objc_retainAutorelease((id)v45[5]);
LABEL_30:
        *a4 = v26;
      }
    }
  }
LABEL_31:
  v38 = *((_BYTE *)v51 + 24) != 0;
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v38;
}

void __52__NFCHardwareManager_areFeaturesSupported_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__NFCHardwareManager_areFeaturesSupported_outError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)areFeaturesSupported:(unint64_t)a3 expiry:(double)a4 completion:(id)a5
{
  void (**v9)(id, _QWORD, void *);
  _BOOL8 v10;
  id v11;
  void *v12;
  NFCHardwareManager *v13;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v16;
  const char *ClassName;
  const char *Name;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  dispatch_semaphore_t v25;
  OS_dispatch_semaphore *hwSupportStateUpdate;
  void **p_hwSupportStateUpdate;
  dispatch_time_t v28;
  intptr_t v29;
  NFCHardwareManager *v30;
  void *v31;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v9 = (void (**)(id, _QWORD, void *))a5;
  v45 = 0;
  v10 = -[NFCHardwareManager areFeaturesSupported:outError:](self, "areFeaturesSupported:outError:", a3, &v45);
  v11 = v45;
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(v11, "code") == 1 || objc_msgSend(v12, "code") == 202)
    {
      v9[2](v9, 0, v12);

    }
    else
    {
      v13 = self;
      objc_sync_enter(v13);
      if (v13->_hwSupportStateUpdate)
      {
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(v13);
          if (class_isMetaClass(Class))
            v16 = 43;
          else
            v16 = 45;
          ClassName = object_getClassName(v13);
          Name = sel_getName(a2);
          Logger(4, "%c[%{public}s %{public}s]:%i Previous operation in progress", v16, ClassName, Name, 383);
        }
        NFSharedLogGetLogger();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = object_getClass(v13);
          if (class_isMetaClass(v20))
            v21 = 43;
          else
            v21 = 45;
          v22 = object_getClassName(v13);
          v23 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v47 = v21;
          v48 = 2082;
          v49 = v22;
          v50 = 2082;
          v51 = v23;
          v52 = 1024;
          v53 = 383;
          _os_log_impl(&dword_215BBD000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Previous operation in progress", buf, 0x22u);
        }

        +[NFCError errorWithCode:](NFCError, "errorWithCode:", 203);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, 0, v24);

        objc_sync_exit(v13);
      }
      else
      {
        v25 = dispatch_semaphore_create(0);
        p_hwSupportStateUpdate = (void **)&v13->_hwSupportStateUpdate;
        hwSupportStateUpdate = v13->_hwSupportStateUpdate;
        v13->_hwSupportStateUpdate = (OS_dispatch_semaphore *)v25;

        objc_sync_exit(v13);
        v28 = dispatch_time(0, (uint64_t)(a4 * 1000000.0 * 1000.0));
        v29 = dispatch_semaphore_wait((dispatch_semaphore_t)v13->_hwSupportStateUpdate, v28);
        v30 = v13;
        objc_sync_enter(v30);
        v31 = *p_hwSupportStateUpdate;
        *p_hwSupportStateUpdate = 0;

        objc_sync_exit(v30);
        if (v29)
        {
          v32 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v32)
          {
            v33 = object_getClass(v30);
            if (class_isMetaClass(v33))
              v34 = 43;
            else
              v34 = 45;
            v35 = object_getClassName(v30);
            v36 = sel_getName(a2);
            v32(4, "%c[%{public}s %{public}s]:%i HW state query timeout", v34, v35, v36, 398);
          }
          NFSharedLogGetLogger();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = object_getClass(v30);
            if (class_isMetaClass(v38))
              v39 = 43;
            else
              v39 = 45;
            v40 = object_getClassName(v30);
            v41 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v47 = v39;
            v48 = 2082;
            v49 = v40;
            v50 = 2082;
            v51 = v41;
            v52 = 1024;
            v53 = 398;
            _os_log_impl(&dword_215BBD000, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i HW state query timeout", buf, 0x22u);
          }

        }
        v44 = v12;
        v42 = -[NFCHardwareManager areFeaturesSupported:outError:](v30, "areFeaturesSupported:outError:", a3, &v44);
        v43 = v44;

        v9[2](v9, v42, v43);
      }
    }
  }
  else
  {
    v9[2](v9, v10, 0);
  }

}

- (id)getReaderSessionWithKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerSessionLock;
  id v6;
  _QWORD *v7;
  id v8;
  _QWORD v10[2];
  void (*v11)(_QWORD *);
  void *v12;
  NFCHardwareManager *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  p_readerSessionLock = &self->_readerSessionLock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v11 = __46__NFCHardwareManager_getReaderSessionWithKey___block_invoke;
  v12 = &unk_24D44FB18;
  v15 = &v16;
  v13 = self;
  v6 = v4;
  v14 = v6;
  v7 = v10;
  os_unfair_lock_lock(p_readerSessionLock);
  v11(v7);
  os_unfair_lock_unlock(p_readerSessionLock);

  v8 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __46__NFCHardwareManager_getReaderSessionWithKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)hwStateDidChange:(unsigned int)a3
{
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  NFCHardwareManager *v14;
  void *v15;
  NSObject *hwSupportStateUpdate;
  const char *ClassName;
  const char *Name;
  _QWORD v19[4];
  unsigned int v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i HW support state update: %lu", v10, ClassName, Name, 436, a3);
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
    *(_DWORD *)buf = 67110146;
    v22 = v13;
    v23 = 2082;
    v24 = object_getClassName(self);
    v25 = 2082;
    v26 = sel_getName(a2);
    v27 = 1024;
    v28 = 436;
    v29 = 2048;
    v30 = a3;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i HW support state update: %lu", buf, 0x2Cu);
  }

  v14 = self;
  objc_sync_enter(v14);
  -[NSHashTable allObjects](v14->_delegates, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  hwSupportStateUpdate = v14->_hwSupportStateUpdate;
  if (hwSupportStateUpdate)
    dispatch_semaphore_signal(hwSupportStateUpdate);
  objc_sync_exit(v14);

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __39__NFCHardwareManager_hwStateDidChange___block_invoke;
  v19[3] = &__block_descriptor_36_e46_v32__0___NFCHardwareManagerCallbacks__8Q16_B24l;
  v20 = a3;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v19);

}

uint64_t __39__NFCHardwareManager_hwStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hwStateDidChange:", *(unsigned int *)(a1 + 32));
}

- (void)_cleanupPresentmentAssertion
{
  os_unfair_lock_s *p_presentmentSuppressionLock;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  NFCHardwareManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  p_presentmentSuppressionLock = &self->_presentmentSuppressionLock;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke;
  v10 = &unk_24D4502D8;
  v11 = self;
  v12 = &v13;
  v5 = v8;
  os_unfair_lock_lock(p_presentmentSuppressionLock);
  v9((uint64_t)v5);
  os_unfair_lock_unlock(p_presentmentSuppressionLock);

  v6 = v14[5];
  if (v6)
  {
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_2;
    v7[3] = &unk_24D450070;
    v7[4] = self;
    -[NFCHardwareManager releasePresentmentSuppression:completion:](self, "releasePresentmentSuppression:completion:", v6, v7);
  }
  _Block_object_dispose(&v13, 8);

}

void __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "externalHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  _QWORD v3[5];

  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2 = v1 + 11;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_3;
  v3[3] = &unk_24D44FB90;
  v3[4] = v1;
  os_unfair_lock_lock(v1 + 11);
  __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_3((uint64_t)v3);
  os_unfair_lock_unlock(v2);
}

void __50__NFCHardwareManager__cleanupPresentmentAssertion__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

}

- (void)didInvalidate
{
  NFCHardwareManager *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSHashTable allObjects](v2->_delegates, "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_56);
  -[NFCHardwareManager _cleanupPresentmentAssertion](v2, "_cleanupPresentmentAssertion");

}

uint64_t __35__NFCHardwareManager_didInvalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didInvalidate");
}

- (void)didExpire
{
  os_unfair_lock_s *p_presentmentSuppressionLock;
  uint64_t v5;
  _QWORD *v6;
  NFCSession *xpcSession;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[2];
  void (*v13)(_QWORD *);
  void *v14;
  NFCHardwareManager *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  p_presentmentSuppressionLock = &self->_presentmentSuppressionLock;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v13 = __31__NFCHardwareManager_didExpire__block_invoke;
  v14 = &unk_24D450340;
  v15 = self;
  v16 = &v24;
  v17 = &v18;
  v6 = v12;
  os_unfair_lock_lock(p_presentmentSuppressionLock);
  v13(v6);
  os_unfair_lock_unlock(p_presentmentSuppressionLock);

  if (v19[5])
  {
    xpcSession = self->_xpcSession;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __31__NFCHardwareManager_didExpire__block_invoke_2;
    v11[3] = &unk_24D44FF30;
    v11[4] = self;
    v11[5] = a2;
    -[NFCSession remoteObjectProxyWithErrorHandler:](xpcSession, "remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v19[5];
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __31__NFCHardwareManager_didExpire__block_invoke_58;
    v10[3] = &unk_24D44FF30;
    v10[4] = self;
    v10[5] = a2;
    objc_msgSend(v8, "releaseSuppressPresentmentAssertion:completion:", v9, v10);

  }
  objc_msgSend((id)v25[5], "didExpire");
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __31__NFCHardwareManager_didExpire__block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  objc_msgSend(*(id *)(a1[4] + 48), "startCooldown:", 15.0);
  objc_msgSend(*(id *)(a1[4] + 48), "assertion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __31__NFCHardwareManager_didExpire__block_invoke_2(uint64_t a1, void *a2)
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
    v5(3, "%c[%{public}s %{public}s]:%i XPC error=%@", v8, ClassName, Name, 508, v3);
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
    v23 = 508;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC error=%@", buf, 0x2Cu);
  }

}

void __31__NFCHardwareManager_didExpire__block_invoke_58(uint64_t a1, void *a2)
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
      v5(3, "%c[%{public}s %{public}s]:%i De-assert error=%@", v8, ClassName, Name, 511, v3);
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
      v23 = 511;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_215BBD000, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i De-assert error=%@", buf, 0x2Cu);
    }

  }
}

- (void)didFinishCooldown
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
  _QWORD *v13;
  const char *Name;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  NFCHardwareManager *v18;
  uint8_t *v19;
  uint8_t buf[8];
  _BYTE v21[32];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 522);
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
    *(_DWORD *)&buf[4] = v12;
    *(_WORD *)v21 = 2082;
    *(_QWORD *)&v21[2] = object_getClassName(self);
    *(_WORD *)&v21[10] = 2082;
    *(_QWORD *)&v21[12] = sel_getName(a2);
    *(_WORD *)&v21[20] = 1024;
    *(_DWORD *)&v21[22] = 522;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)v21 = buf;
  *(_QWORD *)&v21[8] = 0x3032000000;
  *(_QWORD *)&v21[16] = __Block_byref_object_copy__1;
  *(_QWORD *)&v21[24] = __Block_byref_object_dispose__1;
  v22 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v16 = __39__NFCHardwareManager_didFinishCooldown__block_invoke;
  v17 = &unk_24D44FAA0;
  v18 = self;
  v19 = buf;
  v13 = v15;
  os_unfair_lock_lock(&self->_presentmentSuppressionLock);
  v16((uint64_t)v13);
  os_unfair_lock_unlock(&self->_presentmentSuppressionLock);

  -[NFCHardwareManager _cleanupPresentmentAssertion](self, "_cleanupPresentmentAssertion");
  objc_msgSend(*(id *)(*(_QWORD *)v21 + 40), "didFinishCooldown");
  _Block_object_dispose(buf, 8);

}

void __39__NFCHardwareManager_didFinishCooldown__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentmentSuppressionDelegate);
  objc_storeStrong((id *)&self->_presentmentSuppression, 0);
  objc_storeStrong((id *)&self->_hwSupportStateUpdate, 0);
  objc_storeStrong((id *)&self->_queuedCoreNFCSessions, 0);
  objc_storeStrong((id *)&self->_xpcSession, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
