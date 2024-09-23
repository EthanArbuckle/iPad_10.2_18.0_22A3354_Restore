@implementation CUBLEConnection

- (CUBLEConnection)init
{
  CUBLEConnection *v2;
  CUBLEConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUBLEConnection;
  v2 = -[CUBLEConnection init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUBLEConnection;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUBLEConnection;
  -[CUBLEConnection dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  const char *v9;
  id v10;
  NSUUID *destinationUUID;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUUID *v17;
  void *v18;
  id v19;
  uint64_t destinationPSM;
  id v21;
  id v22;
  id v24;
  id v25;
  id v26;
  int v27;

  v27 = 12;
  v8 = self->_label;
  v9 = "-";
  v26 = 0;
  if (!v8)
    v9 = "";
  CUAppendF(&v26, &v27, (uint64_t)"CUBLEConnection%s%@", v3, v4, v5, v6, v7, (uint64_t)v9);
  v10 = v26;
  destinationUUID = self->_destinationUUID;
  if (destinationUUID)
  {
    v17 = destinationUUID;
LABEL_6:
    v25 = v10;
    CUAppendF(&v25, &v27, (uint64_t)"Peer %@", v12, v13, v14, v15, v16, (uint64_t)v17);
    v19 = v25;

    v10 = v19;
    goto LABEL_7;
  }
  -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v17 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  if (v17)
    goto LABEL_6;
LABEL_7:
  destinationPSM = self->_destinationPSM;
  if (self->_destinationPSM
    || (destinationPSM = -[CBL2CAPChannel PSM](self->_l2capChannel, "PSM"), (_DWORD)destinationPSM))
  {
    v24 = v10;
    CUAppendF(&v24, &v27, (uint64_t)"PSM 0x%X", v12, v13, v14, v15, v16, destinationPSM);
    v21 = v24;

    v10 = v21;
  }
  v22 = v10;

  return (NSString *)v22;
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE066660;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

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
  v7[2] = __42__CUBLEConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CBL2CAPChannel *l2capChannel;
  LogCategory *ucat;
  int var0;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *writeRequests;
  void (**v24)(void *, _QWORD);
  id activateCompletion;
  LogCategory *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *v32;
  NSMutableArray *readRequests;
  NSMutableArray *v34;
  BOOL v35;
  LogCategory *v36;
  void *v38;
  id v39;
  id v40;

  l2capChannel = self->_l2capChannel;
  ucat = self->_ucat;
  var0 = ucat->var0;
  if (l2capChannel)
  {
    if (var0 > 30)
      goto LABEL_9;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_9:
        v40 = 0;
        v18 = -[CUBLEConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v40);
        writeRequests = (NSMutableArray *)v40;
        if (v18)
        {
          v24 = (void (**)(void *, _QWORD))_Block_copy(self->_activateCompletion);
          activateCompletion = self->_activateCompletion;
          self->_activateCompletion = 0;

          if (v24)
            v24[2](v24, 0);

          goto LABEL_18;
        }
        v26 = self->_ucat;
        if (v26->var0 <= 90)
        {
          if (v26->var0 != -1)
          {
LABEL_15:
            LogPrintF((uint64_t)v26, (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v19, v20, v21, v22, (uint64_t)writeRequests);
            goto LABEL_23;
          }
          if (_LogCategory_Initialize((uint64_t)v26, 0x5Au))
          {
            v26 = self->_ucat;
            goto LABEL_15;
          }
        }
LABEL_23:
        if (a3)
        {
LABEL_24:
          writeRequests = objc_retainAutorelease(writeRequests);
          v35 = 0;
          *a3 = writeRequests;
          goto LABEL_28;
        }
LABEL_27:
        v35 = 0;
        goto LABEL_28;
      }
      ucat = self->_ucat;
      l2capChannel = self->_l2capChannel;
    }
    v12 = -[CBL2CAPChannel PSM](l2capChannel, "PSM");
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate incoming PSM 0x%04X, peer %@\n", v14, v15, v16, v17, v12);

    goto LABEL_9;
  }
  if (var0 <= 30)
  {
    if (var0 != -1)
    {
LABEL_7:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate outgoing PSM 0x%04X, peer %@\n", v3, v4, v5, v6, self->_destinationPSM);
      goto LABEL_17;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_7;
    }
  }
LABEL_17:
  v39 = 0;
  v27 = -[CUBLEConnection _startConnectingAndReturnError:](self, "_startConnectingAndReturnError:", &v39);
  writeRequests = (NSMutableArray *)v39;
  if (!v27)
  {
    v36 = self->_ucat;
    if (v36->var0 > 90)
      goto LABEL_26;
    if (v36->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v36, 0x5Au))
      {
LABEL_26:
        if (a3)
          goto LABEL_24;
        goto LABEL_27;
      }
      v36 = self->_ucat;
    }
    LogPrintF((uint64_t)v36, (uint64_t)"-[CUBLEConnection activateDirectAndReturnError:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v28, v29, v30, v31, (uint64_t)writeRequests);
    goto LABEL_26;
  }
LABEL_18:

  v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  readRequests = self->_readRequests;
  self->_readRequests = v32;

  v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  writeRequests = self->_writeRequests;
  self->_writeRequests = v34;
  v35 = 1;
LABEL_28:

  return v35;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CUBLEConnection_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  CBCentralManager *centralManager;
  id errorHandler;
  CBPeripheral *peripheral;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *readSource;
  NSObject *writeSource;
  uint64_t v20;

  if (self->_invalidateCalled)
    return;
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_6;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v2, v3, v4, v5, v20);
  }
LABEL_6:
  if (self->_peripheral)
  {
    self->_guardConnected = 0;
    -[CBCentralManager cancelPeripheralConnection:](self->_centralManager, "cancelPeripheralConnection:");
  }
  -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", 0);
  peripheral = self->_peripheral;
  self->_peripheral = 0;

  NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (I)", v11, v12, v13, v14, v15, v16, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUBLEConnection _reportError:](self, "_reportError:", v17);

  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    if (self->_readSuspended)
    {
      self->_readSuspended = 0;
      dispatch_resume((dispatch_object_t)self->_readSource);
    }
  }
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_source_cancel(writeSource);
    if (self->_writeSuspended)
    {
      self->_writeSuspended = 0;
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
  }
  -[CUBLEConnection _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void (**serverInvalidationHandler)(void);
  void (**invalidationHandler)(void);
  id errorHandler;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  LogCategory *ucat;
  uint64_t v13;

  if (!self->_invalidateDone
    && !self->_readSource
    && !self->_writeSource
    && !self->_readRequestCurrent
    && !-[NSMutableArray count](self->_readRequests, "count")
    && !self->_writeRequestCurrent
    && !-[NSMutableArray count](self->_writeRequests, "count"))
  {
    serverInvalidationHandler = (void (**)(void))self->_serverInvalidationHandler;
    if (serverInvalidationHandler)
      serverInvalidationHandler[2]();
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v7 = self->_serverInvalidationHandler;
    self->_serverInvalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_14:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v8, v9, v10, v11, v13);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_14;
      }
    }
  }
}

- (BOOL)_startConnectingAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v10;
  OS_dispatch_queue *dispatchQueue;
  void *v12;
  void *v13;
  CBCentralManager *v14;
  CBCentralManager *centralManager;
  BOOL result;
  const char *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (!self->_destinationUUID)
  {
    if (!a3)
      return 0;
    v17 = "No destination UUID";
LABEL_9:
    v18 = 4294960591;
LABEL_10:
    NSErrorWithOSStatusF(v18, (uint64_t)v17, (uint64_t)a3, v3, v4, v5, v6, v7, v20);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v19;
    return result;
  }
  if (!self->_destinationPSM)
  {
    if (!a3)
      return 0;
    v17 = "No destination PSM";
    goto LABEL_9;
  }
  v10 = objc_alloc((Class)getCBCentralManagerClass[0]());
  dispatchQueue = self->_dispatchQueue;
  getCBManagerNeedsRestrictedStateOperation[0]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v12;
  v22[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (CBCentralManager *)objc_msgSend(v10, "initWithDelegate:queue:options:", self, dispatchQueue, v13);
  centralManager = self->_centralManager;
  self->_centralManager = v14;

  if (self->_centralManager)
  {
    -[CUBLEConnection _run](self, "_run");
    return 1;
  }
  if (a3)
  {
    v17 = "Create CBCentralManager failed";
    v18 = 4294960596;
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  id v21;
  BOOL v22;
  OS_dispatch_source *v23;
  OS_dispatch_source *readSource;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  OS_dispatch_source *v28;
  OS_dispatch_source *writeSource;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD handler[5];
  int v44;

  v5 = -[CBL2CAPChannel socketFD](self->_l2capChannel, "socketFD");
  if (v5 < 0)
  {
    if (a3)
    {
      NSErrorWithOSStatusF(4294960596, (uint64_t)"No socket for L2CAP channel: %@", v6, v7, v8, v9, v10, v11, (uint64_t)self->_l2capChannel);
LABEL_15:
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      goto LABEL_16;
    }
    return 0;
  }
  v12 = v5;
  self->_socketFD = v5;
  v44 = 1;
  if (setsockopt(v5, 0xFFFF, 4130, &v44, 4u))
  {
    if (!*__error())
    {
      v19 = 4294960596;
      if (a3)
      {
LABEL_13:
        v20 = "Set SO_NOSIGPIPE failed";
        goto LABEL_14;
      }
      return 0;
    }
    v19 = *__error();
    if ((_DWORD)v19)
    {
      if (!a3)
        return 0;
      goto LABEL_13;
    }
  }
  v19 = SocketSetNonBlocking(v12, 1);
  if ((_DWORD)v19)
  {
    if (a3)
    {
      v20 = "Make non-blocking failed";
LABEL_14:
      NSErrorWithOSStatusF(v19, (uint64_t)v20, v13, v14, v15, v16, v17, v18, v39);
      goto LABEL_15;
    }
    return 0;
  }
  v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], v12, 0, (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v23;

  v25 = self->_readSource;
  if (!v25)
  {
    if (a3)
    {
      v20 = "Create read source failed";
      v19 = 4294960550;
      goto LABEL_14;
    }
    return 0;
  }
  v26 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__CUBLEConnection__setupIOAndReturnError___block_invoke;
  handler[3] = &unk_1E25DF2A0;
  handler[4] = self;
  dispatch_source_set_event_handler(v25, handler);
  v27 = self->_readSource;
  v42[0] = v26;
  v42[1] = 3221225472;
  v42[2] = __42__CUBLEConnection__setupIOAndReturnError___block_invoke_2;
  v42[3] = &unk_1E25DF2A0;
  v42[4] = self;
  dispatch_source_set_cancel_handler(v27, v42);
  dispatch_resume((dispatch_object_t)self->_readSource);
  v28 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DF0], v12, 0, (dispatch_queue_t)self->_dispatchQueue);
  writeSource = self->_writeSource;
  self->_writeSource = v28;

  v36 = self->_writeSource;
  v22 = v36 != 0;
  if (v36)
  {
    v41[0] = v26;
    v41[1] = 3221225472;
    v41[2] = __42__CUBLEConnection__setupIOAndReturnError___block_invoke_3;
    v41[3] = &unk_1E25DF2A0;
    v41[4] = self;
    dispatch_source_set_event_handler(v36, v41);
    v37 = self->_writeSource;
    v40[0] = v26;
    v40[1] = 3221225472;
    v40[2] = __42__CUBLEConnection__setupIOAndReturnError___block_invoke_4;
    v40[3] = &unk_1E25DF2A0;
    v40[4] = self;
    dispatch_source_set_cancel_handler(v37, v40);
    self->_writeSuspended = 1;
    return v22;
  }
  if (!a3)
    return v22;
  NSErrorWithOSStatusF(4294960549, (uint64_t)"Create write source failed", v30, v31, v32, v33, v34, v35, v39);
  v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  *a3 = v21;
  return v22;
}

- (void)_reportError:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  uint64_t v9;
  void (**v10)(void *, id);
  id activateCompletion;
  void (**v12)(void *, id);
  id errorHandler;
  id v14;

  v14 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    v9 = (uint64_t)v14;
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _reportError:]", 0x5Au, (uint64_t)"Error: %{error}\n", v4, v5, v6, v7, v9);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      v9 = (uint64_t)v14;
      goto LABEL_3;
    }
  }
LABEL_5:
  self->_state = 3;
  v10 = (void (**)(void *, id))_Block_copy(self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v10)
  {
    v10[2](v10, v14);
  }
  else
  {
    v12 = (void (**)(void *, id))_Block_copy(self->_errorHandler);
    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    if (v12)
      v12[2](v12, v14);

  }
  -[CUBLEConnection _abortReadsWithError:](self, "_abortReadsWithError:", v14);
  -[CUBLEConnection _abortWritesWithError:](self, "_abortWritesWithError:", v14);

}

- (void)_run
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t state;
  uint64_t v8;
  int v10;
  LogCategory *ucat;
  const char *v12;

  while (1)
  {
    state = self->_state;
    switch((int)state)
    {
      case 0:
        self->_state = 10;
        goto LABEL_21;
      case 10:
        v8 = -[CBCentralManager state](self->_centralManager, "state");
        if (v8 == 10 || v8 == 5)
          goto LABEL_18;
        goto LABEL_21;
      case 11:
        if (-[CUBLEConnection _runConnectStart](self, "_runConnectStart"))
          goto LABEL_18;
        goto LABEL_21;
      case 12:
        if (self->_guardConnected)
        {
          v10 = 13;
          break;
        }
        goto LABEL_21;
      case 13:
        self->_state = 14;
        goto LABEL_21;
      case 14:
        -[CBPeripheral openL2CAPChannel:](self->_peripheral, "openL2CAPChannel:", self->_destinationPSM);
        goto LABEL_18;
      case 15:
        if (!self->_l2capChannel)
          goto LABEL_21;
        v10 = 16;
        break;
      case 16:
        self->_state = 17;
        goto LABEL_21;
      case 17:
        if (!-[CUBLEConnection _runSetupChannel](self, "_runSetupChannel"))
          goto LABEL_21;
LABEL_18:
        v10 = self->_state + 1;
        break;
      case 18:
        -[CUBLEConnection _processReads:](self, "_processReads:", 0);
        -[CUBLEConnection _processWrites](self, "_processWrites");
        goto LABEL_21;
      default:
        goto LABEL_21;
    }
    self->_state = v10;
LABEL_21:
    if (self->_state == (_DWORD)state)
      break;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
        goto LABEL_24;
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
LABEL_24:
        v12 = "?";
        if (state <= 0x12)
          v12 = off_1E25DC0B0[state];
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _run]", 0x1Eu, (uint64_t)"State: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v12);
      }
    }
  }
}

- (BOOL)_runConnectStart
{
  NSUUID *v3;
  CBCentralManager *centralManager;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSString *clientBundleID;
  void (__cdecl *v17)();
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  LogCategory *ucat;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_destinationUUID;
  centralManager = self->_centralManager;
  v29[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_storeStrong((id *)&self->_peripheral, v13);
    -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", self);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    getCBConnectPeripheralOptionClientBundleID[0]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      clientBundleID = self->_clientBundleID;
      if (clientBundleID)
      {
        v17 = (void (__cdecl *)())getCBConnectPeripheralOptionClientBundleID[0];
        v18 = clientBundleID;
        v17();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v19);

      }
    }
    getCBConnectPeripheralOptionConnectionUseCase[0]();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && self->_clientUseCase)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      getCBConnectPeripheralOptionConnectionUseCase[0]();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, v26);

    }
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_13;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_13;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _runConnectStart]", 0x1Eu, (uint64_t)"Connecting to %@, %##@\n", v21, v22, v23, v24, (uint64_t)v3);
LABEL_13:
    -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", v13, v14);
    goto LABEL_14;
  }
  NSErrorWithOSStatusF(4294960569, (uint64_t)"No peripheral %@", v7, v8, v9, v10, v11, v12, (uint64_t)v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CUBLEConnection _reportError:](self, "_reportError:", v14);
LABEL_14:

  return v13 != 0;
}

- (BOOL)_runSetupChannel
{
  BOOL v3;
  id v4;
  void (**v5)(void *, _QWORD);
  id activateCompletion;
  id v8;

  v8 = 0;
  v3 = -[CUBLEConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v8);
  v4 = v8;
  if (v3)
  {
    v5 = (void (**)(void *, _QWORD))_Block_copy(self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v5)
      v5[2](v5, 0);

  }
  else
  {
    -[CUBLEConnection _reportError:](self, "_reportError:", v4);
  }

  return v3;
}

- (void)readWithRequest:(id)a3
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
  v7[2] = __35__CUBLEConnection_readWithRequest___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_processReads:(BOOL)a3
{
  int v4;
  CUReadRequest **p_readRequestCurrent;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t Data;
  LogCategory *ucat;
  uint64_t socketFD;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CUReadRequest *readRequestCurrent;
  const char *v22;
  void *v23;
  uint64_t *v24;
  int readSuspended;
  _BOOL4 v26;
  uint64_t v27;
  _BOOL4 v28;
  id obja;
  uint64_t *obj;

  v28 = a3;
  v4 = 0;
  p_readRequestCurrent = &self->_readRequestCurrent;
  do
  {
    v6 = *p_readRequestCurrent;
    if (v6)
      goto LABEL_5;
    -[NSMutableArray firstObject](self->_readRequests, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if (v28)
      {
        if (v4)
        {
          readSuspended = self->_readSuspended;
        }
        else
        {
          v26 = -[CUBLEConnection _processReadStatus](self, "_processReadStatus");
          readSuspended = self->_readSuspended;
          if (v26)
          {
            if (!self->_readSuspended)
            {
              self->_readSuspended = 1;
              dispatch_suspend((dispatch_object_t)self->_readSource);
            }
            goto LABEL_33;
          }
        }
        if (readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
LABEL_33:
      v24 = 0;
LABEL_21:

      return;
    }
    obja = (id)v7;
    -[NSMutableArray removeObjectAtIndex:](self->_readRequests, "removeObjectAtIndex:", 0);
    -[CUBLEConnection _prepareReadRequest:](self, "_prepareReadRequest:", obja);
    objc_storeStrong((id *)p_readRequestCurrent, obja);
    v6 = (uint64_t *)obja;
LABEL_5:
    obj = v6;
    Data = SocketReadDataEx(self->_socketFD, v6[1], objc_msgSend(v6, "minLength"), objc_msgSend(v6, "maxLength"), v6 + 3);
    ucat = self->_ucat;
    if (ucat->var0 > 20)
      goto LABEL_9;
    if (ucat->var0 != -1)
      goto LABEL_7;
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u))
    {
      ucat = self->_ucat;
LABEL_7:
      socketFD = self->_socketFD;
      objc_msgSend(obj, "minLength");
      objc_msgSend(obj, "maxLength");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _processReads:]", 0x14u, (uint64_t)"Read socket %d, %zu min, %zu max, %zu offset, %zu nread, %#m\n", v17, v18, v19, v20, socketFD);
    }
LABEL_9:
    if ((_DWORD)Data)
    {
      if ((_DWORD)Data == 35)
      {
        if (self->_readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
      else
      {
        if ((_DWORD)Data == -6753)
          v22 = "Read EOF";
        else
          v22 = "Read error";
        NSErrorWithOSStatusF(Data, (uint64_t)v22, v8, v9, v10, v11, v12, v13, v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBLEConnection _abortReadsWithError:](self, "_abortReadsWithError:", v23);

      }
      v24 = obj;
      goto LABEL_21;
    }
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    -[CUBLEConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", obj, 0);
    ++v4;
  }
  while (v4 != 4);
  if (self->_readSuspended)
  {
    self->_readSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_readSource);
  }
}

- (void)_prepareReadRequest:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  LogCategory *ucat;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v21 = a3;
  if (objc_msgSend(v21, "bufferBytes"))
  {
    v21[1] = objc_msgSend(v21, "bufferBytes");
    objc_msgSend(v21, "setData:", 0);
  }
  else
  {
    objc_msgSend(v21, "bufferData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v21, "bufferData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");
      v7 = objc_msgSend(v21, "maxLength");

      if (v6 < v7)
      {
        v8 = objc_msgSend(v21, "maxLength");
        objc_msgSend(v21, "bufferData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLength:", v8);

      }
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v21, "maxLength"));
      objc_msgSend(v21, "setBufferData:", v10);

    }
    objc_msgSend(v21, "bufferData");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[1] = objc_msgSend(v11, "mutableBytes");

    objc_msgSend(v21, "bufferData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setData:", v12);

  }
  v13 = (void *)v21[2];
  v21[2] = 0;
  v21[3] = 0;

  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    v15 = v21;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
        goto LABEL_12;
      ucat = self->_ucat;
      v15 = v21;
    }
    v16 = objc_msgSend(v15, "minLength");
    objc_msgSend(v21, "maxLength");
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _prepareReadRequest:]", 0xAu, (uint64_t)"Read prepared (%zu min, %zu max)\n", v17, v18, v19, v20, v16);
  }
LABEL_12:

}

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  LogCategory *ucat;
  CUReadRequest *v10;
  CUReadRequest *readRequestCurrent;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CUReadRequest *v17;
  NSObject *readSource;
  void (**v19)(void *, id);
  id errorHandler;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_readRequestCurrent || -[NSMutableArray count](self->_readRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _abortReadsWithError:]", 0x1Eu, (uint64_t)"Abort reads: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  v10 = self->_readRequestCurrent;
  if (v10)
  {
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    -[CUBLEConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v10, v8);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_readRequests;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      v17 = v10;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v10 = (CUReadRequest *)*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16);

        -[CUBLEConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v10, v8);
        ++v16;
        v17 = v10;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  -[NSMutableArray removeAllObjects](self->_readRequests, "removeAllObjects");
  readSource = self->_readSource;
  if (readSource && !self->_readSuspended)
  {
    self->_readSuspended = 1;
    dispatch_suspend(readSource);
  }
  v19 = (void (**)(void *, id))_Block_copy(self->_errorHandler);
  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  if (v19)
    v19[2](v19, v8);
  -[CUBLEConnection _invalidated](self, "_invalidated");

}

- (BOOL)_processReadStatus
{
  ssize_t v3;
  uint64_t v4;
  void (**v6)(void *, void *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void (**v15)(void *, void *);
  id errorHandler;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;

  while (1)
  {
    v3 = recv(self->_socketFD, &v25, 1uLL, 2);
    if ((v3 & 0x8000000000000000) == 0)
      break;
    if (!*__error())
    {
      v4 = 4294960596;
LABEL_12:
      v15 = (void (**)(void *, void *))_Block_copy(self->_errorHandler);
      errorHandler = self->_errorHandler;
      self->_errorHandler = 0;

      if (v15)
      {
        NSErrorWithOSStatusF(v4, (uint64_t)"Read status error", v17, v18, v19, v20, v21, v22, v24);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, v23);

      }
      return 1;
    }
    v4 = *__error();
    if ((_DWORD)v4 != 4)
    {
      if (!(_DWORD)v4)
        return 1;
      if ((_DWORD)v4 == 35)
        return 0;
      goto LABEL_12;
    }
  }
  if (!v3)
  {
    v6 = (void (**)(void *, void *))_Block_copy(self->_errorHandler);
    v7 = self->_errorHandler;
    self->_errorHandler = 0;

    if (v6)
    {
      NSErrorWithOSStatusF(4294960543, (uint64_t)"Read status EOF", v8, v9, v10, v11, v12, v13, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v14);

    }
  }
  return 1;
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  id v6;
  LogCategory *ucat;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void (**v15)(_QWORD);
  _QWORD *v16;

  v16 = a3;
  v6 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    v8 = v16;
    if (ucat->var0 != -1)
    {
LABEL_3:
      v9 = objc_msgSend(v8, "length");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _completeReadRequest:error:]", 0xAu, (uint64_t)"Read completed: %zu byte(s), %{error}\n", v10, v11, v12, v13, v9);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
    {
      ucat = self->_ucat;
      v8 = v16;
      goto LABEL_3;
    }
  }
LABEL_5:
  v14 = (void *)v16[2];
  v16[2] = v6;

  objc_msgSend(v16, "completion");
  v15 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompletion:", 0);
  if (v15)
    v15[2](v15);

}

- (void)writeWithRequest:(id)a3
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
  v7[2] = __36__CUBLEConnection_writeWithRequest___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)writeEndOfDataWithCompletion:(id)a3
{
  id v4;
  CUWriteRequest *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  CUWriteRequest *v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(CUWriteRequest);
  -[CUWriteRequest setEndOfData:](v5, "setEndOfData:", 1);
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __48__CUBLEConnection_writeEndOfDataWithCompletion___block_invoke;
    v9 = &unk_1E25DE600;
    v11 = v4;
    v10 = v5;
    -[CUWriteRequest setCompletion:](v10, "setCompletion:", &v6);

  }
  -[CUBLEConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);

}

- (void)_processWrites
{
  CUWriteRequest **p_writeRequestCurrent;
  int v4;
  CUWriteRequest *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *ucat;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  LogCategory *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CUWriteRequest *writeRequestCurrent;
  void *v30;
  uint64_t v31;
  id v32;

  p_writeRequestCurrent = &self->_writeRequestCurrent;
  v4 = 4;
  do
  {
    v5 = *p_writeRequestCurrent;
    if (!v5)
    {
      -[NSMutableArray firstObject](self->_writeRequests, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        v5 = 0;
        goto LABEL_37;
      }
      v5 = (CUWriteRequest *)v14;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0);
      v32 = 0;
      -[CUBLEConnection _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v5, &v32);
      v15 = v32;
      if (v15)
      {
        v16 = v15;
        goto LABEL_24;
      }
      objc_storeStrong((id *)p_writeRequestCurrent, v5);
    }
    v12 = SocketWriteData(self->_socketFD, (const iovec **)&v5->_iop, &v5->_ion);
    ucat = self->_ucat;
    if (ucat->var0 <= 20)
    {
      if (ucat->var0 != -1)
        goto LABEL_5;
      if (_LogCategory_Initialize((uint64_t)ucat, 0x14u))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _processWrites]", 0x14u, (uint64_t)"Write socket %d, pre-ion %d, post-ion %d, %#m\n", v8, v9, v10, v11, self->_socketFD);
      }
    }
    if ((_DWORD)v12)
    {
      if ((_DWORD)v12 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }
      else
      {
        NSErrorWithOSStatusF(v12, (uint64_t)"Write failed", v6, v7, v8, v9, v10, v11, v31);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBLEConnection _abortWritesWithError:](self, "_abortWritesWithError:", v30);

      }
LABEL_37:

      return;
    }
    if (!-[CUWriteRequest endOfData](v5, "endOfData"))
      goto LABEL_20;
    v21 = self->_ucat;
    if (v21->var0 <= 20)
    {
      if (v21->var0 != -1)
        goto LABEL_14;
      if (_LogCategory_Initialize((uint64_t)v21, 0x14u))
      {
        v21 = self->_ucat;
LABEL_14:
        LogPrintF((uint64_t)v21, (uint64_t)"-[CUBLEConnection _processWrites]", 0x14u, (uint64_t)"Shutdown socket %d\n", v17, v18, v19, v20, self->_socketFD);
      }
    }
    if (shutdown(self->_socketFD, 1))
    {
      if (!*__error())
      {
        v28 = 4294960596;
LABEL_22:
        NSErrorWithOSStatusF(v28, (uint64_t)"shutdown() failed", v22, v23, v24, v25, v26, v27, v31);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      v28 = *__error();
      if ((_DWORD)v28)
        goto LABEL_22;
    }
LABEL_20:
    v16 = 0;
LABEL_23:
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

LABEL_24:
    -[CUBLEConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v5, v16);

    --v4;
  }
  while (v4);
  if (self->_writeSuspended)
  {
    self->_writeSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_writeSource);
  }
}

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  char *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  LogCategory *ucat;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  objc_msgSend(v6, "dataArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    *((_QWORD *)v6 + 34) = v6 + 16;
    LODWORD(v18) = objc_msgSend(v6, "bytesIOCount");
    goto LABEL_14;
  }
  v9 = objc_msgSend(v7, "count");
  if (v9 <= objc_msgSend(v6, "bytesIOMaxCount"))
  {
    v19 = v6 + 16;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    v22 = v6 + 16;
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v40;
      v22 = v6 + 16;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v20);
          v26 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i));
          *(_QWORD *)v22 = objc_msgSend(v26, "bytes");
          *((_QWORD *)v22 + 1) = objc_msgSend(v26, "length");
          v22 += 16;
        }
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v23);
    }

    *((_QWORD *)v6 + 34) = v19;
    v18 = (unint64_t)(v22 - v19) >> 4;
LABEL_14:
    *((_DWORD *)v6 + 70) = v18;
    *((_QWORD *)v6 + 36) = 0;
    v27 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = 0;

    if (gLogCategory_CUBLEConnection > 10
      || gLogCategory_CUBLEConnection == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBLEConnection, 0xAu))
    {
      goto LABEL_27;
    }
    v32 = *((unsigned int *)v6 + 70);
    if ((_DWORD)v32)
    {
      v33 = 0;
      v34 = 16 * (int)v32;
      v35 = (uint64_t *)(*((_QWORD *)v6 + 34) + 8);
      do
      {
        v36 = *v35;
        v35 += 2;
        v33 += v36;
        v34 -= 16;
      }
      while (v34);
    }
    ucat = self->_ucat;
    if (ucat->var0 > 10)
      goto LABEL_27;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0xAu))
        goto LABEL_27;
      ucat = self->_ucat;
      v32 = *((unsigned int *)v6 + 70);
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _prepareWriteRequest:error:]", 0xAu, (uint64_t)"Write prepared (%d iov, %zu total)\n", v28, v29, v30, v31, v32);
LABEL_27:
    v17 = 1;
    goto LABEL_28;
  }
  if (a4)
  {
    v10 = objc_msgSend(v6, "bytesIOMaxCount");
    NSErrorWithOSStatusF(4294960532, (uint64_t)"Too many write elements (%zu max)", v11, v12, v13, v14, v15, v16, v10);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_28:

  return v17;
}

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  LogCategory *ucat;
  CUWriteRequest *v10;
  CUWriteRequest *writeRequestCurrent;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CUWriteRequest *v17;
  NSObject *writeSource;
  void (**v19)(void *, id);
  id errorHandler;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_writeRequestCurrent || -[NSMutableArray count](self->_writeRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _abortWritesWithError:]", 0x1Eu, (uint64_t)"Abort writes: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  v10 = self->_writeRequestCurrent;
  if (v10)
  {
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

    -[CUBLEConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v10, v8);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_writeRequests;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      v17 = v10;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v10 = (CUWriteRequest *)*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16);

        -[CUBLEConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v10, v8);
        ++v16;
        v17 = v10;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  -[NSMutableArray removeAllObjects](self->_writeRequests, "removeAllObjects");
  writeSource = self->_writeSource;
  if (writeSource && !self->_writeSuspended)
  {
    self->_writeSuspended = 1;
    dispatch_suspend(writeSource);
  }
  v19 = (void (**)(void *, id))_Block_copy(self->_errorHandler);
  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  if (v19)
    v19[2](v19, v8);
  -[CUBLEConnection _invalidated](self, "_invalidated");

}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  LogCategory *ucat;
  void *v12;
  void (**v13)(_QWORD);
  _QWORD *v14;

  v14 = a3;
  v10 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection _completeWriteRequest:error:]", 0xAu, (uint64_t)"Write completed: %{error}\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0xAu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v12 = (void *)v14[1];
  v14[1] = v10;

  objc_msgSend(v14, "completion");
  v13 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCompletion:", 0);
  if (v13)
    v13[2](v13);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  LogCategory *ucat;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    goto LABEL_2;
  v10 = objc_msgSend(v17, "state");
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_11;
      ucat = self->_ucat;
    }
    if (v10 > 0xA)
      v12 = "?";
    else
      v12 = off_1E25DC628[v10];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection centralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth state changed: %s\n", v6, v7, v8, v9, (uint64_t)v12);
  }
LABEL_11:
  switch(v10)
  {
    case 1uLL:
      v13 = 4294896145;
      v14 = "Bluetooth reset";
      goto LABEL_15;
    case 4uLL:
      v14 = "Bluetooth powered off";
      v13 = 4294896144;
LABEL_15:
      NSErrorWithOSStatusF(v13, (uint64_t)v14, v4, v5, v6, v7, v8, v9, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBLEConnection _reportError:](self, "_reportError:", v15);

      break;
    case 5uLL:
    case 0xAuLL:
      -[CUBLEConnection _run](self, "_run");
      break;
    default:
      break;
  }
LABEL_2:

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  void *v7;
  NSUUID *destinationUUID;
  NSUUID *v9;
  NSUUID *v10;
  NSUUID *v11;
  char v12;
  LogCategory *ucat;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  LogCategory *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int connectionLatency;
  uint64_t v26;
  LogCategory *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  v35 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    goto LABEL_28;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  destinationUUID = self->_destinationUUID;
  v9 = v7;
  v10 = destinationUUID;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_11;
  }
  v12 = -[NSUUID isEqual:](v9, "isEqual:", v10);

  if ((v12 & 1) != 0)
  {
LABEL_7:
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_15;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_15:
        connectionLatency = self->_connectionLatency;
        if (!connectionLatency)
        {
LABEL_27:
          self->_guardConnected = 1;
          -[CUBLEConnection _run](self, "_run");
          goto LABEL_28;
        }
        if (connectionLatency == 3)
          v26 = 2;
        else
          v26 = connectionLatency == 2;
        v27 = self->_ucat;
        v28 = v35;
        if (v27->var0 <= 30)
        {
          if (v27->var0 == -1)
          {
            v30 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
            v28 = v35;
            if (!v30)
              goto LABEL_26;
            v27 = self->_ucat;
          }
          objc_msgSend(v6, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUBLEConnection centralManager:didConnectPeripheral:]", 0x1Eu, (uint64_t)"Setting connection latency %@, %s (BT %d)\n", v31, v32, v33, v34, (uint64_t)v29);

          v28 = v35;
        }
LABEL_26:
        objc_msgSend(v28, "setDesiredConnectionLatency:forPeripheral:", v26, v6);
        goto LABEL_27;
      }
      ucat = self->_ucat;
    }
    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection centralManager:didConnectPeripheral:]", 0x1Eu, (uint64_t)"DidConnectPeripheral %@\n", v15, v16, v17, v18, (uint64_t)v14);

    goto LABEL_15;
  }
LABEL_11:
  v19 = self->_ucat;
  if (v19->var0 <= 60)
  {
    if (v19->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu))
        goto LABEL_28;
      v19 = self->_ucat;
    }
    objc_msgSend(v6, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v19, (uint64_t)"-[CUBLEConnection centralManager:didConnectPeripheral:]", 0x3Cu, (uint64_t)"### DidConnectPeripheral wrong peripheral: %@ (not %@)\n", v21, v22, v23, v24, (uint64_t)v20);

  }
LABEL_28:

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  NSUUID *destinationUUID;
  NSUUID *v10;
  NSUUID *v11;
  NSUUID *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  LogCategory *ucat;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  LogCategory *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;

  v35 = a4;
  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    goto LABEL_2;
  objc_msgSend(v35, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  destinationUUID = self->_destinationUUID;
  v10 = v8;
  v11 = destinationUUID;
  if (v10 == v11)
  {

    goto LABEL_8;
  }
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_12;
  }
  v13 = -[NSUUID isEqual:](v10, "isEqual:", v11);

  if ((v13 & 1) != 0)
  {
LABEL_8:
    ucat = self->_ucat;
    if (ucat->var0 > 90)
      goto LABEL_16;
    v21 = v35;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
      {
LABEL_16:
        if (v7)
        {
          -[CUBLEConnection _reportError:](self, "_reportError:", v7);
        }
        else
        {
          NSErrorWithOSStatusF(4294960543, (uint64_t)"Connect failed without error", v14, v15, v16, v17, v18, v19, v34);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUBLEConnection _reportError:](self, "_reportError:", v33);

        }
        goto LABEL_2;
      }
      ucat = self->_ucat;
      v21 = v35;
    }
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection centralManager:didFailToConnectPeripheral:error:]", 0x5Au, (uint64_t)"### DidFailToConnectPeripheral %@, error %{error}\n", v23, v24, v25, v26, (uint64_t)v22);

    goto LABEL_16;
  }
LABEL_12:
  v27 = self->_ucat;
  if (v27->var0 <= 60)
  {
    if (v27->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu))
        goto LABEL_2;
      v27 = self->_ucat;
    }
    objc_msgSend(v35, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v27, (uint64_t)"-[CUBLEConnection centralManager:didFailToConnectPeripheral:error:]", 0x3Cu, (uint64_t)"### DidFailToConnectPeripheral wrong peripheral: %@ (not %@), error %{error}\n", v29, v30, v31, v32, (uint64_t)v28);

  }
LABEL_2:

}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LogCategory *v14;
  void *v15;
  NSUUID *destinationUUID;
  NSUUID *v17;
  NSUUID *v18;
  NSUUID *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  LogCategory *v25;
  LogCategory *ucat;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  LogCategory *v40;
  unsigned int v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  LogCategory *v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;

  v56 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    goto LABEL_2;
  if (!self->_l2capChannel)
  {
    objc_msgSend(v56, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    destinationUUID = self->_destinationUUID;
    v17 = v15;
    v18 = destinationUUID;
    if (v17 == v18)
    {

    }
    else
    {
      v19 = v18;
      if ((v17 == 0) == (v18 != 0))
      {

        goto LABEL_18;
      }
      v20 = -[NSUUID isEqual:](v17, "isEqual:", v18);

      if ((v20 & 1) == 0)
      {
LABEL_18:
        ucat = self->_ucat;
        if (ucat->var0 <= 60)
        {
          if (ucat->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu))
              goto LABEL_2;
            ucat = self->_ucat;
          }
          objc_msgSend(v56, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x3Cu, (uint64_t)"### DidOpenL2CAPChannel wrong peer: peer %@ (not %@), channel %@, error %{error}\n", v28, v29, v30, v31, (uint64_t)v27);

        }
        goto LABEL_2;
      }
    }
    v25 = self->_ucat;
    if (v25->var0 <= 30)
    {
      if (v25->var0 != -1)
      {
LABEL_14:
        LogPrintF((uint64_t)v25, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x1Eu, (uint64_t)"DidOpenL2CAPChannel %@, error %{error}\n", v21, v22, v23, v24, (uint64_t)v8);
        goto LABEL_22;
      }
      if (_LogCategory_Initialize((uint64_t)v25, 0x1Eu))
      {
        v25 = self->_ucat;
        goto LABEL_14;
      }
    }
LABEL_22:
    if (v9)
    {
      NSErrorNestedF((void *)*MEMORY[0x1E0CB2F90], 4294960541, v9, (uint64_t)"L2CAP open channel failed", v21, v22, v23, v24, v54);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBLEConnection _reportError:](self, "_reportError:", v32);
      goto LABEL_24;
    }
    v33 = v8;
    v32 = v33;
    if (!v33)
    {
      NSErrorWithOSStatusF(4294960596, (uint64_t)"L2CAP open channel null", v34, v35, v36, v37, v38, v39, v54);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBLEConnection _reportError:](self, "_reportError:", v47);

      goto LABEL_24;
    }
    if (objc_msgSend(v33, "PSM") != self->_destinationPSM)
    {
      v48 = self->_ucat;
      if (v48->var0 <= 60)
      {
        if (v48->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu))
            goto LABEL_24;
          v48 = self->_ucat;
        }
        v49 = objc_msgSend(v32, "PSM");
        LogPrintF((uint64_t)v48, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x3Cu, (uint64_t)"### DidOpenL2CAPChannel wrong PSM: 0x%04X (not 0x%04X)\n", v50, v51, v52, v53, v49);
      }
LABEL_24:

      goto LABEL_2;
    }
    objc_storeStrong((id *)&self->_l2capChannel, a4);
    v40 = self->_ucat;
    if (v40->var0 <= 30)
    {
      if (v40->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          goto LABEL_37;
        v40 = self->_ucat;
      }
      v41 = objc_msgSend(v32, "PSM");
      objc_msgSend(v32, "peer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "identifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v40, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x1Eu, (uint64_t)"Connection started PSM 0x%04X, peer %@\n", v43, v44, v45, v46, v41);

    }
LABEL_37:
    -[CUBLEConnection _run](self, "_run");
    goto LABEL_24;
  }
  v14 = self->_ucat;
  if (v14->var0 <= 60)
  {
    if (v14->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v14, 0x3Cu))
        goto LABEL_2;
      v14 = self->_ucat;
    }
    LogPrintF((uint64_t)v14, (uint64_t)"-[CUBLEConnection peripheral:didOpenL2CAPChannel:error:]", 0x3Cu, (uint64_t)"### DidOpenL2CAPChannel already open: channel %@, error %{error}\n", v10, v11, v12, v13, (uint64_t)v8);
  }
LABEL_2:

}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)clientUseCase
{
  return self->_clientUseCase;
}

- (void)setClientUseCase:(int64_t)a3
{
  self->_clientUseCase = a3;
}

- (int)connectionLatency
{
  return self->_connectionLatency;
}

- (void)setConnectionLatency:(int)a3
{
  self->_connectionLatency = a3;
}

- (unsigned)destinationPSM
{
  return self->_destinationPSM;
}

- (void)setDestinationPSM:(unsigned __int16)a3
{
  self->_destinationPSM = a3;
}

- (NSUUID)destinationUUID
{
  return self->_destinationUUID;
}

- (void)setDestinationUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)label
{
  return self->_label;
}

- (CBL2CAPChannel)l2capChannel
{
  return self->_l2capChannel;
}

- (void)setL2capChannel:(id)a3
{
  objc_storeStrong((id *)&self->_l2capChannel, a3);
}

- (id)serverInvalidationHandler
{
  return self->_serverInvalidationHandler;
}

- (void)setServerInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationUUID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

void __48__CUBLEConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __36__CUBLEConnection_writeWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 25))
  {
    v10 = *(_QWORD *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (W)", a3, a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_completeWriteRequest:error:", v10, v13);

  }
  else
  {
    objc_msgSend(*(id *)(v9 + 104), "addObject:", *(_QWORD *)(a1 + 40));
    v11 = *(_DWORD **)(a1 + 32);
    if ((v11[18] & 0x80000000) == 0)
      objc_msgSend(v11, "_processWrites");
  }
}

void __35__CUBLEConnection_readWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 25))
  {
    v10 = *(_QWORD *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (R)", a3, a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_completeReadRequest:error:", v10, v13);

  }
  else
  {
    objc_msgSend(*(id *)(v9 + 64), "addObject:", *(_QWORD *)(a1 + 40));
    v11 = *(_DWORD **)(a1 + 32);
    if ((v11[18] & 0x80000000) == 0)
      objc_msgSend(v11, "_processReads:", 0);
  }
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processReads:", 1);
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processWrites");
}

uint64_t __42__CUBLEConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __29__CUBLEConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __42__CUBLEConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v5, "activateDirectAndReturnError:", &v9);
  v6 = v9;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
