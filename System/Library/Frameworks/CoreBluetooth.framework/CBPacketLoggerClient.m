@implementation CBPacketLoggerClient

- (CBPacketLoggerClient)init
{
  CBPacketLoggerClient *v2;
  CBPacketLoggerClient *v3;
  CBPacketLoggerClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBPacketLoggerClient;
  v2 = -[CBPacketLoggerClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CBPacketLoggerClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __47__CBPacketLoggerClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __48__CBPacketLoggerClient__activateWithCompletion___block_invoke;
  v12 = &unk_1E53FF7D0;
  v14 = &v15;
  v5 = v4;
  v13 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](&v9);
  if (*(_WORD *)&self->_activateCalled)
  {
    NSErrorF_safe();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v16[5];
    v16[5] = v7;

  }
  else
  {
    self->_activateCalled = 1;
    -[CBPacketLoggerClient _activateXPC:completion:](self, "_activateXPC:completion:", 0, v5, v9, v10, v11, v12);
  }
  v6[2](v6);

  _Block_object_dispose(&v15, 8);
}

uint64_t __48__CBPacketLoggerClient__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (void)_activateXPC:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  NSObject *dispatchQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_CBPacketLoggerClient <= 30
         && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v7 = xpc_dictionary_create(0, 0, 0);
  -[CBPacketLoggerClient _ensureXPCStarted](self, "_ensureXPCStarted");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__CBPacketLoggerClient__activateXPC_completion___block_invoke;
  v11[3] = &unk_1E5401F98;
  v13 = v4;
  v12 = v6;
  v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, v11);

}

void __48__CBPacketLoggerClient__activateXPC_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_CBPacketLoggerClient <= 30
         && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v3 = MEMORY[0x1A85D1CE4](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CBPacketLoggerClient_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__CBPacketLoggerClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _xpc_connection_s *v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_CBPacketLoggerClient <= 30
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v3 = *(_xpc_connection_s **)(*(_QWORD *)(v2 + 32) + 16);
    if (v3)
      xpc_connection_cancel(v3);
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_interrupted
{
  uint64_t v3;
  void *v4;

  if (!self->_invalidateCalled)
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v3 = MEMORY[0x1A85D1CE4](self->_interruptionHandler);
    v4 = (void *)v3;
    if (v3)
      (*(void (**)(uint64_t))(v3 + 16))(v3);

    -[CBPacketLoggerClient _activateXPC:completion:](self, "_activateXPC:completion:", 1, 0);
  }
}

- (void)_invalidated
{
  id errorHandler;
  id interruptionHandler;
  id invalidationHandler;
  id rawPacketHandler;
  void *v7;
  int v8;
  uint64_t v9;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    v9 = MEMORY[0x1A85D1CE4](self->_invalidationHandler, a2);
    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    rawPacketHandler = self->_rawPacketHandler;
    self->_rawPacketHandler = 0;

    v7 = (void *)v9;
    if (v9)
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      v7 = (void *)v9;
    }
    self->_invalidateDone = 1;
    if (gLogCategory_CBPacketLoggerClient <= 30)
    {
      if (gLogCategory_CBPacketLoggerClient != -1 || (v8 = _LogCategory_Initialize(), v7 = (void *)v9, v8))
      {
        LogPrintF_safe();
        v7 = (void *)v9;
      }
    }

  }
}

- (id)_ensureXPCStarted
{
  OS_xpc_object **p_xpcCnx;
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  xpc_connection_t mach_service;
  _xpc_connection_s *v7;
  _QWORD v9[5];
  _xpc_connection_s *v10;

  p_xpcCnx = &self->_xpcCnx;
  v4 = self->_xpcCnx;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.BTPacketLogger.ios", (dispatch_queue_t)self->_dispatchQueue, 0);
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__CBPacketLoggerClient__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E53FFB68;
    v9[4] = self;
    v7 = mach_service;
    v10 = v7;
    xpc_connection_set_event_handler(v7, v9);
    xpc_connection_activate(v7);
    v5 = v7;

  }
  return v5;
}

_QWORD *__41__CBPacketLoggerClient__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[2] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "_xpcReceivedEvent:", a2);
  return result;
}

- (void)_xpcReceivedEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  OS_xpc_object *xpcCnx;
  void *v13;
  id v14;

  v14 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    -[CBPacketLoggerClient _xpcReceivedPacket:](self, "_xpcReceivedPacket:", v14);

  }
  else if (v14 == (id)MEMORY[0x1E0C81258])
  {
    -[CBPacketLoggerClient _interrupted](self, "_interrupted");

  }
  else if (v14 == (id)MEMORY[0x1E0C81260])
  {
    if (!self->_invalidateCalled
      && gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    -[CBPacketLoggerClient _invalidated](self, "_invalidated");
  }
  else
  {
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintXPC();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_errorHandler);
    if (v10)
    {
      CBErrorF(-6700, (uint64_t)"XPC error", v4, v5, v6, v7, v8, v9, (uint64_t)v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v11);

    }
  }
}

- (void)_xpcReceivedPacket:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  xpc_dictionary_get_value(a3, "packet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812E8])
    {
      v4 = MEMORY[0x1A85D1CE4](self->_rawPacketHandler);
      v5 = (void *)v4;
      if (v4)
        (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

      goto LABEL_6;
    }
    if (gLogCategory_CBPacketLoggerClient <= 90
      && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
    {
LABEL_13:
      LogPrintF_safe();

      return;
    }
  }
  else if (gLogCategory_CBPacketLoggerClient <= 90
         && (gLogCategory_CBPacketLoggerClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_13;
  }
LABEL_6:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)rawPacketHandler
{
  return self->_rawPacketHandler;
}

- (void)setRawPacketHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rawPacketHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
