@implementation DSMotionSession

- (DSMotionSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DSMotionSession *v7;
  uint64_t uint64;
  unsigned __int8 v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  DSMotionSession *v15;
  id v16;
  NSObject *v18;
  const char *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DSMotionSession;
  v7 = -[DSMotionSession init](&v20, sel_init);
  if (!v7)
  {
    DSLogObjectForCategory_DSMotionSession();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v19 = "Allocation failed";
    goto LABEL_26;
  }
  if (MEMORY[0x219A18A58](v6) != MEMORY[0x24BDACFA0])
  {
    DSLogObjectForCategory_DSMotionSession();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v19 = "init with invalid dictionary";
    goto LABEL_26;
  }
  uint64 = xpc_dictionary_get_uint64(v6, "kDSVehicleState");
  if (uint64 >= 0x100)
  {
    DSLogObjectForCategory_DSMotionSession();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v19 = "Error decoding vehicle state";
    goto LABEL_26;
  }
  v9 = uint64;
  if (onceTokenDSMotionSession != -1)
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  v10 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 > 2u)
      v11 = "?";
    else
      v11 = off_24D9110D0[(char)v9];
    *(_DWORD *)buf = 136315138;
    v22 = v11;
    _os_log_impl(&dword_217E3C000, v10, OS_LOG_TYPE_DEFAULT, "Vehicle state : %s", buf, 0xCu);
  }
  v7->_vehicleState = v9;
  v12 = xpc_dictionary_get_uint64(v6, "kDSVehicleConfidence");
  if (v12 >= 0x100)
  {
    DSLogObjectForCategory_DSMotionSession();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v19 = "Error decoding coordination status";
LABEL_26:
    _os_log_impl(&dword_217E3C000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
LABEL_27:

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v16 = objc_retainAutorelease(v16);
      v15 = 0;
      *a4 = v16;
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_17;
  }
  v13 = v12;
  if (onceTokenDSMotionSession != -1)
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  v14 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = (const char *)v13;
    _os_log_impl(&dword_217E3C000, v14, OS_LOG_TYPE_DEFAULT, "Vehicle confidence: %llu", buf, 0xCu);
  }
  v7->_vehicleConfidence = v13;
  v15 = v7;
  v16 = 0;
LABEL_17:

  return v15;
}

- (void)encodeSelf:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  xdict = v4;
  if (self->_vehicleState)
  {
    xpc_dictionary_set_uint64(v4, "kDSVehicleState", self->_vehicleState);
    v4 = xdict;
  }
  if (self->_vehicleConfidence)
  {
    xpc_dictionary_set_uint64(xdict, "kDSVehicleConfidence", self->_vehicleConfidence);
    v4 = xdict;
  }

}

- (void)activateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  DSMotionSession *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id activateCompletionHandler;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (v5->_dispatchQueue)
    {
      if (!v5->_shouldActivate)
      {
        v5->_shouldActivate = 1;
        v12 = MEMORY[0x219A18818](v4);
        activateCompletionHandler = v5->_activateCompletionHandler;
        v5->_activateCompletionHandler = (id)v12;

        dispatchQueue = v5->_dispatchQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __42__DSMotionSession_activateWithCompletion___block_invoke;
        block[3] = &unk_24D9109C0;
        block[4] = v5;
        dispatch_async(dispatchQueue, block);
        goto LABEL_21;
      }
      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v6 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Activate already called";
LABEL_19:
        _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      }
    }
    else
    {
      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v6 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Dispatch queue not set";
        goto LABEL_19;
      }
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("Unsupported feature");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v11 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v11, OS_LOG_TYPE_DEFAULT, "feature flag not enabled", buf, 2u);
    }
    if (v4)
      v4[2](v4, v10);

  }
LABEL_21:
  objc_sync_exit(v5);

}

uint64_t __42__DSMotionSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  NSObject *v3;
  NSObject *v4;
  void (**v5)(_QWORD, _QWORD);
  id activateCompletionHandler;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSMotionSession != -1)
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  v3 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }
  if (self->_shouldInvalidate)
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v4 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "Activate called after invalidate", v8, 2u);
    }
    v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A18818](self->_activateCompletionHandler);
    activateCompletionHandler = self->_activateCompletionHandler;
    self->_activateCompletionHandler = 0;

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v5)[2](v5, v7);

    }
  }
  else
  {
    -[DSMotionSession _activateXPC](self, "_activateXPC");
  }
}

- (void)_activateXPC
{
  NSObject *v3;
  xpc_object_t v4;
  _xpc_connection_s *v5;
  NSObject *dispatchQueue;
  _QWORD handler[5];
  uint8_t buf[16];

  if (onceTokenDSMotionSession != -1)
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  v3 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Activate XPC", buf, 2u);
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  -[DSMotionSession encodeSelf:](self, "encodeSelf:", v4);
  xpc_dictionary_set_string(v4, "kDSXPCMsg", "kDSMotionActivate");
  -[DSMotionSession _getXPCConnection](self, "_getXPCConnection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __31__DSMotionSession__activateXPC__block_invoke;
  handler[3] = &unk_24D9109E8;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v5, v4, dispatchQueue, handler);

}

uint64_t __31__DSMotionSession__activateXPC__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCHandleReply:", a2);
}

- (void)printCohort
{
  DSMotionSession *v2;
  NSObject *dispatchQueue;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_shouldActivate)
  {
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__DSMotionSession_printCohort__block_invoke;
    block[3] = &unk_24D9109C0;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v4 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "Instance not activated", buf, 2u);
    }
  }
  objc_sync_exit(v2);

}

uint64_t __30__DSMotionSession_printCohort__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_printCohort");
}

- (void)_printCohort
{
  _xpc_connection_s *v3;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  -[DSMotionSession encodeSelf:](self, "encodeSelf:", xdict);
  xpc_dictionary_set_string(xdict, "kDSXPCMsg", "kDSCohortPrint");
  -[DSMotionSession _getXPCConnection](self, "_getXPCConnection");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v3, xdict);

}

- (void)_activateXPCHandleReply:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  id activateCompletionHandler;
  id v7;

  v7 = 0;
  -[DSMotionSession _xpcHandleCompletionBlockReply:error:](self, "_xpcHandleCompletionBlockReply:error:", a3, &v7);
  v4 = v7;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A18818](self->_activateCompletionHandler);
  activateCompletionHandler = self->_activateCompletionHandler;
  self->_activateCompletionHandler = 0;

  if (v5)
    ((void (**)(_QWORD, id))v5)[2](v5, v4);

}

- (void)_xpcHandleCompletionBlockReply:(id)a3 error:(id *)a4
{
  id v5;
  const char *string;
  id v7;
  NSObject *v8;
  void *v9;
  void *bytes_ptr;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  string = xpc_dictionary_get_string(v5, "kDSXPCMsg");
  if (!strcmp(string, "kDSXPCSuccess"))
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v8 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "Activated", (uint8_t *)&v15, 2u);
    }
    v7 = 0;
    goto LABEL_23;
  }
  if (strcmp(string, "kDSXPCError"))
  {
    v7 = 0;
    if (!a4)
      goto LABEL_23;
    goto LABEL_22;
  }
  xpc_dictionary_get_value(v5, "kDSXPCErrorData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x219A18A58]() == MEMORY[0x24BDACF90])
  {
    bytes_ptr = (void *)xpc_data_get_bytes_ptr(v9);
    if (bytes_ptr)
    {
      bytes_ptr = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v9));
      if (bytes_ptr)
      {
        v13 = (void *)MEMORY[0x24BDD1620];
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v14, bytes_ptr, 0);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_17;
      }
    }
  }
  else
  {
    bytes_ptr = 0;
  }
  if (onceTokenDSMotionSession != -1)
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  v11 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_217E3C000, v11, OS_LOG_TYPE_ERROR, "Error while unarchiving completion block error", (uint8_t *)&v15, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
  if (onceTokenDSMotionSession != -1)
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  v12 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "Failed to activate with error %@", (uint8_t *)&v15, 0xCu);
  }

  if (a4)
  {
LABEL_22:
    v7 = objc_retainAutorelease(v7);
    *a4 = v7;
  }
LABEL_23:

}

- (void)invalidate
{
  DSMotionSession *v2;
  NSObject *v3;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_shouldInvalidate)
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v3 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate already called", buf, 2u);
    }
  }
  else
  {
    v2->_shouldInvalidate = 1;
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__DSMotionSession_invalidate__block_invoke;
    block[3] = &unk_24D9109C0;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v2);

}

uint64_t __29__DSMotionSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSObject *v3;
  uint8_t v4[16];

  if (onceTokenDSMotionSession != -1)
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  v3 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate", v4, 2u);
  }
  -[DSMotionSession _invalidateXPC](self, "_invalidateXPC");
  -[DSMotionSession _invalidated](self, "_invalidated");
}

- (id)_getXPCConnection
{
  DSMotionSession *v2;
  xpc_connection_t mach_service;
  _QWORD handler[5];

  v2 = self;
  objc_sync_enter(v2);
  mach_service = v2->_xpcConnection;
  if (!mach_service)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.distributedsensingd", (dispatch_queue_t)v2->_dispatchQueue, 0);
    objc_storeStrong((id *)&v2->_xpcConnection, mach_service);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __36__DSMotionSession__getXPCConnection__block_invoke;
    handler[3] = &unk_24D9109E8;
    handler[4] = v2;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
  }
  objc_sync_exit(v2);

  return mach_service;
}

uint64_t __36__DSMotionSession__getXPCConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcEventHandler:", a2);
}

- (void)_invalidateXPC
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  OS_xpc_object *xpcConnection;
  DSMotionSession *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj->_xpcConnection;
  v3 = v2;
  if (v2)
    xpc_connection_cancel(v2);
  xpcConnection = obj->_xpcConnection;
  obj->_xpcConnection = 0;

  objc_sync_exit(obj);
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  DSMotionSession *v4;
  NSObject *v5;
  id interruptionHandler;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (!self->_invalidateFinished)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    v4 = self;
    objc_sync_enter(v4);
    if (v4->_xpcConnection)
    {
      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v5 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_ERROR, "XPC connection not cleaned", buf, 2u);
      }
      objc_sync_exit(v4);

    }
    else
    {
      objc_sync_exit(v4);

      v4->_shouldInvalidate = 1;
      interruptionHandler = v4->_interruptionHandler;
      v4->_interruptionHandler = 0;

      v7 = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v8 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "DSMotionSession Invalidated", v9, 2u);
      }
      self->_invalidateFinished = 1;
    }
  }
}

- (void)_interrupted
{
  NSObject *v2;
  uint8_t v3[16];

  if (onceTokenDSMotionSession != -1)
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  v2 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_217E3C000, v2, OS_LOG_TYPE_DEFAULT, "DSMotionSession Interrupted", v3, 2u);
  }
}

- (void)_xpcEventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  DSMotionSession *v10;
  OS_xpc_object *xpcConnection;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 == (id)MEMORY[0x24BDACF38])
  {
    if (!self->_shouldInvalidate)
    {
      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v8 = (void *)logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        v12 = 136315138;
        v13 = xpc_connection_copy_invalidation_reason();
        _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_ERROR, "XPC Connection Invalidated for reason: %s", (uint8_t *)&v12, 0xCu);

      }
    }
    v10 = self;
    objc_sync_enter(v10);
    xpcConnection = v10->_xpcConnection;
    v10->_xpcConnection = 0;

    objc_sync_exit(v10);
    -[DSMotionSession _invalidated](v10, "_invalidated");
  }
  else if (v4 == (id)MEMORY[0x24BDACF30])
  {
    -[DSMotionSession _interrupted](self, "_interrupted");
  }
  else if (MEMORY[0x219A18A58](v4) == MEMORY[0x24BDACFA0])
  {
    -[DSMotionSession _handleXPCMessage:](self, "_handleXPCMessage:", v5);
  }
  else
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v6 = (void *)logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v12 = 136315138;
      v13 = MEMORY[0x219A18998](v5);
      _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_ERROR, "Invalid XPC Message :%s", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (void)_handleXPCMessage:(id)a3
{
  id v4;
  const char *string;
  const char *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  __int16 v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[2];

  v4 = a3;
  string = xpc_dictionary_get_string(v4, "kDSXPCMsg");
  if (string)
  {
    v6 = string;
    if (!strcmp(string, "kDSXPCDeviceFound"))
    {
      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v10 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_217E3C000, v10, OS_LOG_TYPE_DEFAULT, "Device Found XPC Message", v16, 2u);
      }
      -[DSMotionSession _deviceFoundMessage:](self, "_deviceFoundMessage:", v4);
    }
    else if (!strcmp(v6, "kDSXPCDeviceChanged"))
    {
      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v11 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_217E3C000, v11, OS_LOG_TYPE_DEFAULT, "Device Changed XPC Message", v15, 2u);
      }
      -[DSMotionSession _deviceChangedMessage:](self, "_deviceChangedMessage:", v4);
    }
    else if (!strcmp(v6, "kDSXPCDeviceLost"))
    {
      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v12 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "Device Lost XPC Message", v14, 2u);
      }
      -[DSMotionSession _deviceLostMessage:](self, "_deviceLostMessage:", v4);
    }
    else
    {
      if (onceTokenDSMotionSession != -1)
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      v7 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
      {
        v13 = 0;
        v8 = "Unhandled message from distributedsensingd";
        v9 = (uint8_t *)&v13;
LABEL_13:
        _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
      }
    }
  }
  else
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v7 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "No Message type in XPC";
      v9 = buf;
      goto LABEL_13;
    }
  }

}

- (void)_deviceFoundMessage:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  DSDeviceContext *v6;
  id v7;
  void (**deviceFoundHandler)(id, DSDeviceContext *);
  NSObject *v9;
  uint8_t v10[8];
  id v11;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v11 = 0;
  v6 = -[DSDeviceContext initWithXPCObject:error:]([DSDeviceContext alloc], "initWithXPCObject:error:", v5, &v11);

  v7 = v11;
  if (v6)
  {
    deviceFoundHandler = (void (**)(id, DSDeviceContext *))self->_deviceFoundHandler;
    if (deviceFoundHandler)
      deviceFoundHandler[2](deviceFoundHandler, v6);
  }
  else
  {
    DSLogObjectForCategory_DSMotionSession();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_ERROR, "Error decoding device context", v10, 2u);
    }

  }
}

- (void)_deviceChangedMessage:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  DSDeviceContext *v6;
  id v7;
  void (**deviceChangedHandler)(id, DSDeviceContext *);
  NSObject *v9;
  uint8_t v10[8];
  id v11;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v11 = 0;
  v6 = -[DSDeviceContext initWithXPCObject:error:]([DSDeviceContext alloc], "initWithXPCObject:error:", v5, &v11);

  v7 = v11;
  if (v6)
  {
    deviceChangedHandler = (void (**)(id, DSDeviceContext *))self->_deviceChangedHandler;
    if (deviceChangedHandler)
      deviceChangedHandler[2](deviceChangedHandler, v6);
  }
  else
  {
    DSLogObjectForCategory_DSMotionSession();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_ERROR, "Error decoding device context", v10, 2u);
    }

  }
}

- (void)_deviceLostMessage:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  DSDeviceContext *v6;
  id v7;
  void (**deviceLostHandler)(id, DSDeviceContext *);
  NSObject *v9;
  uint8_t v10[8];
  id v11;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v11 = 0;
  v6 = -[DSDeviceContext initWithXPCObject:error:]([DSDeviceContext alloc], "initWithXPCObject:error:", v5, &v11);

  v7 = v11;
  if (v6)
  {
    deviceLostHandler = (void (**)(id, DSDeviceContext *))self->_deviceLostHandler;
    if (deviceLostHandler)
      deviceLostHandler[2](deviceLostHandler, v6);
  }
  else
  {
    DSLogObjectForCategory_DSMotionSession();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_ERROR, "Error decoding winner context", v10, 2u);
    }

  }
}

- (void)updateVehicleState:(unsigned __int8)a3 confidence:(unsigned __int8)a4
{
  DSMotionSession *v6;
  NSObject *dispatchQueue;
  NSObject *v8;
  _QWORD block[6];
  unsigned __int8 v10;
  unsigned __int8 v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  char v15;

  v6 = self;
  objc_sync_enter(v6);
  if (v6->_shouldActivate)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x2020000000;
    v15 = 0;
    dispatchQueue = v6->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__DSMotionSession_updateVehicleState_confidence___block_invoke;
    block[3] = &unk_24D911090;
    v10 = a3;
    block[4] = v6;
    block[5] = buf;
    v11 = a4;
    dispatch_async(dispatchQueue, block);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v8 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "Instance not activated", buf, 2u);
    }
  }
  objc_sync_exit(v6);

}

void __49__DSMotionSession_updateVehicleState_confidence___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  unint64_t v4;
  const char *v5;
  unint64_t v6;
  const char *v7;
  NSObject *v8;
  unsigned int v9;
  const char *v10;
  unsigned int v11;
  const char *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v2 + 40) != *(unsigned __int8 *)(a1 + 48))
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v3 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(char *)(*(_QWORD *)(a1 + 32) + 40);
      if (v4 > 2)
        v5 = "?";
      else
        v5 = off_24D9110D0[v4];
      v6 = *(char *)(a1 + 48);
      if (v6 > 2)
        v7 = "?";
      else
        v7 = off_24D9110D0[v6];
      v14 = 136315394;
      v15 = v5;
      v16 = 2080;
      v17 = v7;
      _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Updating Vehicle State from %s to %s", (uint8_t *)&v14, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(unsigned __int8 *)(v2 + 41) != *(unsigned __int8 *)(a1 + 49))
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v8 = logObjDSMotionSession;
    if (!os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      goto LABEL_42;
    v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 41);
    if (v9 <= 6)
    {
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 41))
      {
        v10 = "lowest";
        goto LABEL_29;
      }
      if (v9 == 4)
      {
        v10 = "low-medium";
        goto LABEL_29;
      }
    }
    else
    {
      switch(v9)
      {
        case 7u:
          v10 = "medium";
          goto LABEL_29;
        case 0xBu:
          v10 = "medium-high";
          goto LABEL_29;
        case 0xFu:
          v10 = "highest";
          goto LABEL_29;
      }
    }
    v10 = "?";
LABEL_29:
    v11 = *(unsigned __int8 *)(a1 + 49);
    if (v11 <= 6)
    {
      if (!*(_BYTE *)(a1 + 49))
      {
        v12 = "lowest";
        goto LABEL_41;
      }
      if (v11 == 4)
      {
        v12 = "low-medium";
        goto LABEL_41;
      }
    }
    else
    {
      switch(v11)
      {
        case 7u:
          v12 = "medium";
          goto LABEL_41;
        case 0xBu:
          v12 = "medium-high";
          goto LABEL_41;
        case 0xFu:
          v12 = "highest";
LABEL_41:
          v14 = 136315394;
          v15 = v10;
          v16 = 2080;
          v17 = v12;
          _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "Updating Vehicle confidence from %s to %s", (uint8_t *)&v14, 0x16u);
LABEL_42:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_43;
      }
    }
    v12 = "?";
    goto LABEL_41;
  }
LABEL_43:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateVehicleState:confidence:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  }
  else
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v13 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_217E3C000, v13, OS_LOG_TYPE_DEFAULT, "States already updated", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)_updateVehicleState:(unsigned __int8)a3 confidence:(unsigned __int8)a4
{
  NSObject *v4;
  _xpc_connection_s *v6;
  xpc_object_t xdict;
  uint8_t buf[16];

  if (self->_shouldInvalidate)
  {
    if (onceTokenDSMotionSession != -1)
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    v4 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "Update called after invalidate", buf, 2u);
    }
  }
  else
  {
    self->_vehicleState = a3;
    self->_vehicleConfidence = a4;
    xdict = xpc_dictionary_create(0, 0, 0);
    -[DSMotionSession encodeSelf:](self, "encodeSelf:", xdict);
    xpc_dictionary_set_string(xdict, "kDSXPCMsg", "kDSMotionUpdate");
    -[DSMotionSession _getXPCConnection](self, "_getXPCConnection");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v6, xdict);

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)vehicleState
{
  return self->_vehicleState;
}

- (void)setVehicleState:(unsigned __int8)a3
{
  self->_vehicleState = a3;
}

- (unsigned)vehicleConfidence
{
  return self->_vehicleConfidence;
}

- (void)setVehicleConfidence:(unsigned __int8)a3
{
  self->_vehicleConfidence = a3;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong(&self->_activateCompletionHandler, 0);
}

@end
