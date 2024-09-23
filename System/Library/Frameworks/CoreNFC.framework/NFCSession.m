@implementation NFCSession

- (NFCSession)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)NFCSession;
  v17 = -[NFCSession init](&v26, sel_init);
  if (v17)
  {
    v18 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v19 = (void *)*((_QWORD *)v17 + 1);
    *((_QWORD *)v17 + 1) = v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.corenfc.session.xpc", v20);
    v22 = (void *)*((_QWORD *)v17 + 3);
    *((_QWORD *)v17 + 3) = v21;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v17 + 3), (const void *)*MEMORY[0x24BEDCDB0], (void *)1, 0);
    objc_storeStrong((id *)v17 + 4, a4);
    objc_storeStrong((id *)v17 + 5, a5);
    objc_storeWeak((id *)v17 + 7, v15);
    v23 = objc_msgSend(v12, "copy");
    v24 = (void *)*((_QWORD *)v17 + 6);
    *((_QWORD *)v17 + 6) = v23;

    objc_storeWeak((id *)v17 + 8, v16);
  }

  return (NFCSession *)v17;
}

- (void)dealloc
{
  objc_super v3;

  -[NFCSession _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NFCSession;
  -[NFCSession dealloc](&v3, sel_dealloc);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[NFCSession _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 7, v11);
    v4[2](v4, v12);

    v7 = 0;
  }

  return v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[NFCSession _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nfcd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 7, v11);
    v4[2](v4, v12);

    v7 = 0;
  }

  return v7;
}

- (id)_connection
{
  -[NFCSession _connectIfNeeded](self, "_connectIfNeeded");
  return self->_connection;
}

- (void)_setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)_connectionLock
{
  return self->_connectionLock;
}

- (id)_exportedObjectClassName
{
  id WeakRetained;
  objc_class *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained(&self->_exportedObject);
  v3 = (objc_class *)objc_opt_class();
  if (!v3)
    v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_connectIfNeeded
{
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  id v10;
  BOOL v11;
  const void **v13;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *Name;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;
  id location;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_connectionLock, "lock");
  if (self->_connection)
    goto LABEL_4;
  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", self->_machServiceName, 4096);
  connection = self->_connection;
  self->_connection = v4;

  v6 = self->_connection;
  if (v6)
  {
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", self->_remoteObjectInterface);
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", self->_exportedObjectInterface);
    WeakRetained = objc_loadWeakRetained(&self->_exportedObject);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", WeakRetained);

    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__NFCSession__connectIfNeeded__block_invoke;
    aBlock[3] = &unk_24D44F988;
    objc_copyWeak(&v29, &location);
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __30__NFCSession__connectIfNeeded__block_invoke_2;
    v26[3] = &unk_24D44F8B0;
    v9 = _Block_copy(aBlock);
    v27 = v9;
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v26);
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __30__NFCSession__connectIfNeeded__block_invoke_3;
    v24[3] = &unk_24D44F8B0;
    v10 = v9;
    v25 = v10;
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v24);
    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_xpcQueue);
    -[NSXPCConnection resume](self->_connection, "resume");

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
LABEL_4:
    v11 = 1;
    goto LABEL_5;
  }
  v13 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v19 = 45;
    if (isMetaClass)
      v19 = 43;
    v15(3, "%c[%{public}s %{public}s]:%i Failed to connect to NFCD", v19, ClassName, Name, 115);
  }
  dispatch_get_specific(*v13);
  NFSharedLogGetLogger();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = object_getClass(self);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    LODWORD(location) = 67109890;
    HIDWORD(location) = v22;
    v31 = 2082;
    v32 = object_getClassName(self);
    v33 = 2082;
    v34 = sel_getName(a2);
    v35 = 1024;
    v36 = 115;
    _os_log_impl(&dword_215BBD000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect to NFCD", (uint8_t *)&location, 0x22u);
  }

  v11 = 0;
LABEL_5:
  -[NSLock unlock](self->_connectionLock, "unlock");
  return v11;
}

void __30__NFCSession__connectIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v2 = WeakRetained[2];
    objc_msgSend(v6, "_connectionLock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lock");

    objc_msgSend(v2, "invalidate");
    objc_msgSend(v2, "setRemoteObjectInterface:", 0);
    objc_msgSend(v2, "setExportedObject:", 0);
    objc_msgSend(v2, "setExportedInterface:", 0);

    objc_msgSend(v6, "_setConnection:", 0);
    objc_msgSend(v6, "_connectionLock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unlock");

    v5 = objc_loadWeakRetained(v6 + 8);
    objc_msgSend(v5, "didInvalidate");

    WeakRetained = v6;
  }

}

uint64_t __30__NFCSession__connectIfNeeded__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_activity_scope_state_s v4;

  v2 = _os_activity_create(&dword_215BBD000, "NFCSession xpcInvalidated", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __30__NFCSession__connectIfNeeded__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  os_activity_scope_state_s v4;

  v2 = _os_activity_create(&dword_215BBD000, "NFCSession xpcInterrupted", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_invalidate
{
  NSXPCConnection *connection;

  -[NSLock lock](self->_connectionLock, "lock");
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", 0);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", 0);
  connection = self->_connection;
  self->_connection = 0;

  -[NSLock unlock](self->_connectionLock, "unlock");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_exportedObject);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_exportedObjectInterface, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
}

@end
