@implementation CLIndoorXPCProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptReconnection, 0);
  if (self->_lastReconnectTime.m_initialized)
    self->_lastReconnectTime.m_initialized = 0;
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_frameworkQueue, 0);
}

- (void)invalidate
{
  NSObject *frameworkQueue;
  id v3;
  _QWORD block[4];
  id v5;

  frameworkQueue = self->_frameworkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_216457280;
  block[3] = &unk_24D56FD28;
  v5 = self;
  v3 = v5;
  dispatch_sync(frameworkQueue, block);

}

- (CLIndoorXPCProvider)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CLIndoorXPCProvider *v15;
  uint8_t v17[16];

  objc_msgSend_impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_newConnectionFor_(CLIndoorXPCProvider, v7, (uint64_t)v6, v8, v9);

  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
    v11 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_216456000, v11, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, init", v17, 2u);
  }
LABEL_4:
  v15 = (CLIndoorXPCProvider *)objc_msgSend_initWithConnection_(self, v12, (uint64_t)v10, v13, v14);

  return v15;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *frameworkQueue;
  CLIndoorXPCProvider *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  _QWORD block[4];
  CLIndoorXPCProvider *v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointName(v6, v7, v8, v9, v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = objc_msgSend_UTF8String(v11, v12, v13, v14, v15);

  if (dispatch_get_specific(&unk_2164BE598) == self || !self->_frameworkQueue)
  {
    if (qword_253E5C3A8 == -1)
    {
      v20 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      {
LABEL_10:
        objc_msgSend_withinQueueInvalidate(self, v21, v22, v23, v24);
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
      v20 = qword_253E5C3A0;
      if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
        goto LABEL_10;
    }
    *(_DWORD *)buf = 136446210;
    v29 = v16;
    _os_log_impl(&dword_216456000, v20, OS_LOG_TYPE_INFO, "dealloc connection to %{public}s", buf, 0xCu);
    goto LABEL_10;
  }
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
    v17 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_6;
    goto LABEL_5;
  }
  v17 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216456000, v17, OS_LOG_TYPE_DEBUG, "dealloc begins", buf, 2u);
  }
LABEL_6:
  frameworkQueue = self->_frameworkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_216468DE8;
  block[3] = &unk_24D56FCF8;
  v27 = self;
  v19 = v27;
  dispatch_sync(frameworkQueue, block);

LABEL_11:
  v25.receiver = self;
  v25.super_class = (Class)CLIndoorXPCProvider;
  -[CLIndoorXPCProvider dealloc](&v25, sel_dealloc);
}

+ (id)newConnectionFor:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint8_t v34[16];

  v3 = a3;
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD1988]);
  objc_msgSend_endpointName(v3, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_persistentDomainForName_(v8, v15, (uint64_t)CFSTR("com.apple.pipelined.framework"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("UnprivilegedDaemon"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_BOOLValue(v22, v23, v24, v25, v26);

  if (!v27)
  {
    v29 = 4096;
    goto LABEL_7;
  }
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
    v28 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      goto LABEL_5;
    goto LABEL_4;
  }
  v28 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_4:
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_216456000, v28, OS_LOG_TYPE_INFO, "UnprivilegedDaemon default found.  Connecting to service launched manually (i.e. not via launchd)", v34, 2u);
  }
LABEL_5:
  v29 = 0;
LABEL_7:

  v32 = (void *)objc_msgSend_initWithMachServiceName_options_(v9, v30, (uint64_t)v14, v29, v31);
  return v32;
}

- (void)withinQueueInvalidate
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *interruptReconnection;
  NSXPCConnection *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  NSXPCConnection *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
  v3 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    objc_msgSend_impl(self, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endpointName(v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 134349314;
    v37 = connection;
    v38 = 2114;
    v39 = v14;
    _os_log_impl(&dword_216456000, v3, OS_LOG_TYPE_INFO, "About to invalidate connection %{public}p to %{public}@", (uint8_t *)&v36, 0x16u);

  }
  objc_msgSend_setInterruptionHandler_(self->_connection, v15, 0, v16, v17);
  objc_msgSend_setInvalidationHandler_(self->_connection, v18, 0, v19, v20);
  objc_msgSend_invalidate(self->_connection, v21, v22, v23, v24);
  interruptReconnection = self->_interruptReconnection;
  if (interruptReconnection)
    dispatch_source_cancel(interruptReconnection);
  v26 = self->_connection;
  self->_connection = 0;

  objc_msgSend_impl(self, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_withinQueueInvalidateState(v31, v32, v33, v34, v35);

}

- (void)withinQueueInitializeConnection
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id from;
  id to;
  id location;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;

  v6 = (void *)MEMORY[0x24BDD1990];
  objc_msgSend_impl(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectProtocol(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceWithProtocol_(v6, v13, (uint64_t)v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(self->_connection, v17, (uint64_t)v16, v18, v19);

  objc_initWeak(&location, self);
  objc_copyWeak(&to, &location);
  v20 = MEMORY[0x24BDAC760];
  v37 = MEMORY[0x24BDAC760];
  v38 = 3321888768;
  v39 = sub_21649E0D0;
  v40 = &unk_24D56FDC8;
  objc_copyWeak(&v41, &to);
  v21 = (void *)MEMORY[0x2199F9374](&v37);
  objc_destroyWeak(&v41);
  objc_msgSend_setInterruptionHandler_(self->_connection, v22, (uint64_t)v21, v23, v24);

  objc_destroyWeak(&to);
  objc_initWeak(&from, self);
  objc_copyWeak(&v33, &from);
  v37 = v20;
  v38 = 3321888768;
  v39 = sub_21649E158;
  v40 = &unk_24D56FE20;
  objc_copyWeak(&v41, &v33);
  v25 = (void *)MEMORY[0x2199F9374](&v37);
  objc_destroyWeak(&v41);
  objc_msgSend_setInvalidationHandler_(self->_connection, v26, (uint64_t)v25, v27, v28);

  objc_destroyWeak(&v33);
  objc_msgSend_resume(self->_connection, v29, v30, v31, v32);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (CLIndoorXPCProvider)initWithConnection:(id)a3
{
  id v5;
  CLIndoorXPCProvider *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CLIndoorXPCProvider *v10;
  CLIndoorXPCProvider *v11;
  const char *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *frameworkQueue;
  OS_dispatch_queue *v29;
  const char *v30;
  dispatch_source_t v31;
  OS_dispatch_source *interruptReconnection;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v40;
  id to[2];
  _QWORD handler[4];
  id v43;
  id location;
  objc_super v45;

  v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLIndoorXPCProvider;
  v6 = -[CLIndoorXPCProvider init](&v45, sel_init);
  v10 = v6;
  v11 = v6;
  if (v6)
  {
    if (objc_msgSend_conformsToProtocol_(v6, v7, (uint64_t)&unk_254E3F9A0, v8, v9))
    {
      v13 = (void *)MEMORY[0x2199F91F4]();
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v14, v17, (uint64_t)CFSTR("com.apple.CoreIndoor.%@"), v18, v19, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_retainAutorelease(v20);
      v26 = (const char *)objc_msgSend_UTF8String(v21, v22, v23, v24, v25);
      v27 = dispatch_queue_create(v26, 0);
      frameworkQueue = v11->_frameworkQueue;
      v11->_frameworkQueue = (OS_dispatch_queue *)v27;

      v29 = v11->_frameworkQueue;
      objc_autoreleasePoolPop(v13);
      if (!v29)
      {
        v10 = 0;
        goto LABEL_10;
      }
      objc_storeStrong((id *)&v10->_connection, a3);
      if (v11->_connection)
      {
        dispatch_queue_set_specific((dispatch_queue_t)v11->_frameworkQueue, &unk_2164BE598, v11, 0);
        v31 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v11->_frameworkQueue);
        interruptReconnection = v11->_interruptReconnection;
        v11->_interruptReconnection = (OS_dispatch_source *)v31;

        objc_initWeak(&location, v11);
        v33 = v11->_interruptReconnection;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3321888768;
        handler[2] = sub_21649D71C;
        handler[3] = &unk_24D56FCC8;
        objc_copyWeak(to, &location);
        objc_copyWeak(&v43, to);
        dispatch_source_set_event_handler(v33, handler);
        objc_destroyWeak(to);
        dispatch_resume((dispatch_object_t)v11->_interruptReconnection);
        if (qword_253E5C3A8 == -1)
        {
          v34 = qword_253E5C3A0;
          if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
          {
LABEL_8:
            objc_msgSend_withinQueueInitializeConnection(v11, v35, v36, v37, v38);
            v10 = v11;
            objc_destroyWeak(&v43);
            objc_destroyWeak(&location);
            goto LABEL_10;
          }
        }
        else
        {
          dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
          v34 = qword_253E5C3A0;
          if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
            goto LABEL_8;
        }
        LOWORD(to[0]) = 0;
        _os_log_impl(&dword_216456000, v34, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, initWithConnection, re-initializing", (uint8_t *)to, 2u);
        goto LABEL_8;
      }
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v30, *MEMORY[0x24BDBCAB8], (uint64_t)CFSTR("Must provide a connection"), 0);
    }
    else
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v12, *MEMORY[0x24BDBCAB8], (uint64_t)CFSTR("Concrete implementation of CLIndoorXPCProvider must conform to CLIndoorXPCProviderImplementation"), 0);
    }
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
LABEL_10:

  return v10;
}

- (id)_defaultErrHandlerForCaller:(id)a3
{
  uint64_t v3;

  objc_msgSend__defaultErrHandler_forCaller_(self, a2, (uint64_t)&unk_24D56FD58, (uint64_t)a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultErrHandler:(id)a3 forCaller:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3321888768;
  v12[2] = sub_21649DF58;
  v12[3] = &unk_24D56FD78;
  v6 = v5;
  v7 = (void *)MEMORY[0x2199F9374](a3);
  v8 = v6;
  v13 = v8;
  v14 = (id)MEMORY[0x2199F9374](v7);
  v9 = (void *)MEMORY[0x2199F9374](v12);

  v10 = (void *)MEMORY[0x2199F9374](v9);
  return v10;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 24) = 0;
  return self;
}

- (CLIndoorXPCProvider)initWithEndpoint:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CLIndoorXPCProvider *v14;
  uint8_t v16[16];

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD1988]);
  v9 = (void *)objc_msgSend_initWithListenerEndpoint_(v5, v6, (uint64_t)v4, v7, v8);
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
    v10 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_216456000, v10, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, initWithEndpoint", v16, 2u);
  }
LABEL_4:
  v14 = (CLIndoorXPCProvider *)objc_msgSend_initWithConnection_(self, v11, (uint64_t)v9, v12, v13);

  return v14;
}

- (void)withinQueueInterruptionHandler
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  std::chrono::steady_clock::time_point v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_withinQueuePermanentShutdownReason(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (qword_253E5C3A8 != -1)
      dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
    v12 = (id)qword_253E5C3A0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_impl(self, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_endpointName(v17, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v11, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v22;
      v49 = 2114;
      v50 = v27;
      _os_log_impl(&dword_216456000, v12, OS_LOG_TYPE_INFO, "XPC connection invalidated by daemon to %{public}@: %{public}@", (uint8_t *)&v47, 0x16u);

    }
    objc_msgSend_withinQueueInvalidate(self, v28, v29, v30, v31);
  }
  else
  {
    if (qword_253E5C3A8 != -1)
      dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
    v32 = (id)qword_253E5C3A0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_impl(self, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_endpointName(v37, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543362;
      v48 = v42;
      _os_log_impl(&dword_216456000, v32, OS_LOG_TYPE_INFO, "pipelined interruption handler for %{public}@", (uint8_t *)&v47, 0xCu);

    }
    v43.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    objc_msgSend_withinQueueHandleReconnect_(self, v44, v43.__d_.__rep_, v45, v46);
  }

}

- (void)withinQueueHandleReconnect:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  uint64_t v3;
  uint64_t v4;
  int ShouldReinitializeRemote;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  ShouldReinitializeRemote = objc_msgSend_withinQueueShouldReinitializeRemote_(self, a2, a3.var0.__rep_, v3, v4);
  if (ShouldReinitializeRemote == 1)
  {
    objc_msgSend_withinQueueReinitializeRemoteState(self, v8, v9, v10, v11);
    if (self->_lastReconnectTime.m_initialized)
    {
LABEL_5:
      *(time_point<std::chrono::steady_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) = a3;
      return;
    }
  }
  else
  {
    if (ShouldReinitializeRemote == 2)
      objc_msgSend_withinQueueScheduleReconnect_reason_(self, v8, *(_QWORD *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) - a3.var0.__rep_ + 10000000000, (uint64_t)CFSTR("deferred re-initialization"), v11);
    if (self->_lastReconnectTime.m_initialized)
      goto LABEL_5;
  }
  self->_lastReconnectTime.m_initialized = 1;
  *(time_point<std::chrono::steady_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) = a3;
}

- (int)withinQueueShouldReinitializeRemote:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char CanReinitializeRemoteState;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_impl(self, a2, a3.var0.__rep_, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CanReinitializeRemoteState = objc_msgSend_withinQueueCanReinitializeRemoteState(v7, v8, v9, v10, v11);

  if ((CanReinitializeRemoteState & 1) != 0)
  {
    if (self->_lastReconnectTime.m_initialized
      && a3.var0.__rep_ - *(_QWORD *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) < 10000000000)
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    if (qword_253E5C3A8 != -1)
      dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
    v14 = (id)qword_253E5C3A0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_impl(self, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_endpointName(v19, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v24;
      _os_log_impl(&dword_216456000, v14, OS_LOG_TYPE_INFO, "Already invalidated/no remote state - ignoring request to re-initialize %{public}@", (uint8_t *)&v25, 0xCu);

    }
    return 0;
  }
}

- (void)withinQueueReinitializeRemoteState
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
  v3 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_impl(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endpointName(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v13;
    _os_log_impl(&dword_216456000, v3, OS_LOG_TYPE_DEBUG, "re-initializing pipelined connection to %{public}@ with existing state", (uint8_t *)&v23, 0xCu);

  }
  objc_msgSend_impl(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_withinQueueReinitializeRemoteState(v18, v19, v20, v21, v22);

}

- (void)withinQueueScheduleReconnect:(duration<long)long reason:()std:(1000000000>>)a3 :(id)a4 ratio<1
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  dispatch_time_t v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D56FDA8);
  v7 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_impl(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endpointName(v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v17;
    v21 = 2114;
    v22 = v6;
    v23 = 2048;
    v24 = a3.__rep_ / 1000000;
    _os_log_impl(&dword_216456000, v7, OS_LOG_TYPE_INFO, "Connection to %{public}@ %{public}@ - retrying in %lld milliseconds", (uint8_t *)&v19, 0x20u);

  }
  v18 = dispatch_time(0, a3.__rep_);
  dispatch_source_set_timer((dispatch_source_t)self->_interruptReconnection, v18, 0xFFFFFFFFFFFFFFFFLL, 0x77359400uLL);

}

@end
