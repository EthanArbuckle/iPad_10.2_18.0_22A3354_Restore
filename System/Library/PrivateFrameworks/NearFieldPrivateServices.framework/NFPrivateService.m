@implementation NFPrivateService

+ (BOOL)isResultSuccessful:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("Error"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)serviceName
{
  return CFSTR("com.apple.stockholm.services.ERROR");
}

- (id)connectToService:(id)a3
{
  id v5;
  NFPrivateService *v6;
  void *v7;
  uint64_t v8;
  NSXPCConnection *xpcConnection;
  void *v10;
  void *v11;
  void *v12;
  const void **v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  void *v22;
  const void **v23;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v26;
  const char *ClassName;
  const char *Name;
  NSObject *v29;
  objc_class *v30;
  int v31;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_xpcConnection)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", v5);
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v8;

    if (v6->_xpcConnection)
    {
      +[NFPrivateServiceInterface interface](NFPrivateServiceInterface, "interface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v6->_xpcConnection, "setRemoteObjectInterface:", v10);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25720BDC0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v6->_xpcConnection, "setExportedInterface:", v11);

      -[NSXPCConnection setExportedObject:](v6->_xpcConnection, "setExportedObject:", v6);
      NFCreateWorkLoop();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[NSXPCConnection _setQueue:](v6->_xpcConnection, "_setQueue:", v12);
      }
      else
      {
        v23 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(v6);
          if (class_isMetaClass(Class))
            v26 = 43;
          else
            v26 = 45;
          ClassName = object_getClassName(v6);
          Name = sel_getName(a2);
          Logger(3, "%c[%{public}s %{public}s]:%i Failed to create root queue", v26, ClassName, Name, 52);
        }
        dispatch_get_specific(*v23);
        NFSharedLogGetLogger();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = object_getClass(v6);
          if (class_isMetaClass(v30))
            v31 = 43;
          else
            v31 = 45;
          *(_DWORD *)buf = 67109890;
          v36 = v31;
          v37 = 2082;
          v38 = object_getClassName(v6);
          v39 = 2082;
          v40 = sel_getName(a2);
          v41 = 1024;
          v42 = 52;
          _os_log_impl(&dword_242978000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create root queue", buf, 0x22u);
        }

      }
      -[NSXPCConnection resume](v6->_xpcConnection, "resume");
      v7 = 0;
    }
    else
    {
      v13 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v14)
      {
        v15 = object_getClass(v6);
        if (class_isMetaClass(v15))
          v16 = 43;
        else
          v16 = 45;
        v17 = object_getClassName(v6);
        v18 = sel_getName(a2);
        v14(3, "%c[%{public}s %{public}s]:%i Failed to connect to restore service", v16, v17, v18, 40);
      }
      dispatch_get_specific(*v13);
      NFSharedLogGetLogger();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = object_getClass(v6);
        if (class_isMetaClass(v20))
          v21 = 43;
        else
          v21 = 45;
        *(_DWORD *)buf = 67109890;
        v36 = v21;
        v37 = 2082;
        v38 = object_getClassName(v6);
        v39 = 2082;
        v40 = sel_getName(a2);
        v41 = 1024;
        v42 = 40;
        _os_log_impl(&dword_242978000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect to restore service", buf, 0x22u);
      }

      v22 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      v34 = CFSTR("XPC Connection error");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("NearFieldPrivateServices"), 4096, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_sync_exit(v6);

  return v7;
}

- (BOOL)canRun
{
  return 0;
}

- (id)runService:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSXPCConnection *xpcConnection;
  uint64_t v16;
  void *v17;
  const void **v18;
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
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[6];
  _QWORD v33[7];
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
  const __CFString *v46;
  uint64_t v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  uint64_t v60;
  const __CFString *v61;
  const __CFString *v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  if (-[NFPrivateService canRun](self, "canRun"))
  {
    -[NFPrivateService serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFPrivateService connectToService:](self, "connectToService:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v35[5];
    v35[5] = v7;

    v9 = v35[5];
    if (v9)
    {
      v58 = CFSTR("Error");
      v59 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      xpcConnection = self->_xpcConnection;
      v16 = MEMORY[0x24BDAC760];
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __31__NFPrivateService_runService___block_invoke;
      v33[3] = &unk_25136D620;
      v33[4] = self;
      v33[5] = &v34;
      v33[6] = a2;
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v16;
      v32[1] = 3221225472;
      v32[2] = __31__NFPrivateService_runService___block_invoke_61;
      v32[3] = &unk_25136D648;
      v32[4] = &v40;
      v32[5] = &v34;
      objc_msgSend(v17, "runService:callback:", v5, v32);

      if (v35[5])
      {
        v18 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(self);
          if (class_isMetaClass(Class))
            v21 = 43;
          else
            v21 = 45;
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          Logger(3, "%c[%{public}s %{public}s]:%i Failed running command : %@", v21, ClassName, Name, 91, v35[5]);
        }
        dispatch_get_specific(*v18);
        NFSharedLogGetLogger();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = object_getClass(self);
          if (class_isMetaClass(v25))
            v26 = 43;
          else
            v26 = 45;
          v27 = object_getClassName(self);
          v28 = sel_getName(a2);
          v29 = v35[5];
          *(_DWORD *)buf = 67110146;
          v49 = v26;
          v50 = 2082;
          v51 = v27;
          v52 = 2082;
          v53 = v28;
          v54 = 1024;
          v55 = 91;
          v56 = 2112;
          v57 = v29;
          _os_log_impl(&dword_242978000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed running command : %@", buf, 0x2Cu);
        }

        v30 = v35[5];
        v46 = CFSTR("Error");
        v47 = v30;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v41[5])
        {
          v14 = (void *)MEMORY[0x24BDBD1B8];
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:");
        v10 = objc_claimAutoreleasedReturnValue();
      }
    }
    v14 = (void *)v10;
  }
  else
  {
    v62 = CFSTR("Error");
    v11 = (void *)MEMORY[0x24BDD1540];
    v60 = *MEMORY[0x24BDD0FC8];
    v61 = CFSTR("Service cannot run right now");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NearFieldPrivateServices"), 4098, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_20:
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v14;
}

void __31__NFPrivateService_runService___block_invoke(uint64_t a1, void *a2)
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

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 83, v3);
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
    v26 = 83;
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_242978000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __31__NFPrivateService_runService___block_invoke_61(uint64_t a1, void *a2, void *a3)
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

- (void)runService:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSXPCConnection *xpcConnection;
  uint64_t v17;
  void (**v18)(id, void *);
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, void *);
  _QWORD v22[5];
  void (**v23)(id, void *);
  SEL v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (-[NFPrivateService canRun](self, "canRun"))
  {
    -[NFPrivateService serviceName](self, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFPrivateService connectToService:](self, "connectToService:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v25 = CFSTR("Error");
      v26 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v11);

    }
    else
    {
      xpcConnection = self->_xpcConnection;
      v17 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __46__NFPrivateService_runService_withCompletion___block_invoke;
      v22[3] = &unk_25136D670;
      v22[4] = self;
      v24 = a2;
      v18 = v8;
      v23 = v18;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v17;
      v20[1] = 3221225472;
      v20[2] = __46__NFPrivateService_runService_withCompletion___block_invoke_64;
      v20[3] = &unk_25136D698;
      v21 = v18;
      objc_msgSend(v19, "runService:callback:", v7, v20);

    }
  }
  else
  {
    v29 = CFSTR("Error");
    v12 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28 = CFSTR("Service cannot run right now");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("NearFieldPrivateServices"), 4098, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v15);

  }
}

void __46__NFPrivateService_runService_withCompletion___block_invoke(uint64_t a1, void *a2)
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
  const __CFString *v19;
  id v20;
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

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 118, v3);
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
    v22 = v12;
    v23 = 2082;
    v24 = v13;
    v25 = 2082;
    v26 = v14;
    v27 = 1024;
    v28 = 118;
    v29 = 2112;
    v30 = v3;
    _os_log_impl(&dword_242978000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(a1 + 40);
  v19 = CFSTR("Error");
  v20 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

}

void __46__NFPrivateService_runService_withCompletion___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = CFSTR("Error");
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (!v5)
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, MEMORY[0x24BDBD1B8]);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);

LABEL_6:
}

- (void)disconnect
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)serviceNotificationReceived:(id)a3
{
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
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
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
    v7(4, "%c[%{public}s %{public}s]:%i Warning un-implemented notification handler.", v11, ClassName, Name, 144);
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
    *(_DWORD *)buf = 67109890;
    v17 = v14;
    v18 = 2082;
    v19 = object_getClassName(self);
    v20 = 2082;
    v21 = sel_getName(a2);
    v22 = 1024;
    v23 = 144;
    _os_log_impl(&dword_242978000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Warning un-implemented notification handler.", buf, 0x22u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
