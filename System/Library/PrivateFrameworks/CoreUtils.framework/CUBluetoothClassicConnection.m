@implementation CUBluetoothClassicConnection

- (CUBluetoothClassicConnection)init
{
  CUBluetoothClassicConnection *v2;
  CUBluetoothClassicConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUBluetoothClassicConnection;
  v2 = -[CUBluetoothClassicConnection init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUBluetoothClassicConnection;
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
  v4.super_class = (Class)CUBluetoothClassicConnection;
  -[CUBluetoothClassicConnection dealloc](&v4, sel_dealloc);
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
  v7 = qword_1EE066830;
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
  v7[2] = __55__CUBluetoothClassicConnection_activateWithCompletion___block_invoke;
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *writeRequests;
  void (**v25)(void *, _QWORD);
  id activateCompletion;
  LogCategory *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *v33;
  NSMutableArray *readRequests;
  NSMutableArray *v35;
  BOOL v36;
  LogCategory *v37;
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
        v19 = -[CUBluetoothClassicConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v40);
        writeRequests = (NSMutableArray *)v40;
        if (v19)
        {
          v25 = (void (**)(void *, _QWORD))_Block_copy(self->_activateCompletion);
          activateCompletion = self->_activateCompletion;
          self->_activateCompletion = 0;

          if (v25)
            v25[2](v25, 0);

          goto LABEL_18;
        }
        v27 = self->_ucat;
        if (v27->var0 <= 90)
        {
          if (v27->var0 != -1)
          {
LABEL_15:
            LogPrintF((uint64_t)v27, (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v20, v21, v22, v23, (uint64_t)writeRequests);
            goto LABEL_23;
          }
          if (_LogCategory_Initialize((uint64_t)v27, 0x5Au))
          {
            v27 = self->_ucat;
            goto LABEL_15;
          }
        }
LABEL_23:
        if (a3)
        {
LABEL_24:
          writeRequests = objc_retainAutorelease(writeRequests);
          v36 = 0;
          *a3 = writeRequests;
          goto LABEL_28;
        }
LABEL_27:
        v36 = 0;
        goto LABEL_28;
      }
      ucat = self->_ucat;
      l2capChannel = self->_l2capChannel;
    }
    v12 = -[CBL2CAPChannel PSM](l2capChannel, "PSM");
    -[CBL2CAPChannel peer](self->_l2capChannel, "peer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate incoming PSM 0x%04X, peer %@, CF %#{flags}\n", v15, v16, v17, v18, v12);

    goto LABEL_9;
  }
  if (var0 <= 30)
  {
    if (var0 != -1)
    {
LABEL_7:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate outgoing peer %@, service %@, CF %#{flags}, RS %#{flags}\n", v3, v4, v5, v6, (uint64_t)self->_destinationPeer);
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
  v28 = -[CUBluetoothClassicConnection _startConnectingAndReturnError:](self, "_startConnectingAndReturnError:", &v39);
  writeRequests = (NSMutableArray *)v39;
  if (!v28)
  {
    v37 = self->_ucat;
    if (v37->var0 > 90)
      goto LABEL_26;
    if (v37->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x5Au))
      {
LABEL_26:
        if (a3)
          goto LABEL_24;
        goto LABEL_27;
      }
      v37 = self->_ucat;
    }
    LogPrintF((uint64_t)v37, (uint64_t)"-[CUBluetoothClassicConnection activateDirectAndReturnError:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v29, v30, v31, v32, (uint64_t)writeRequests);
    goto LABEL_26;
  }
LABEL_18:

  v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  readRequests = self->_readRequests;
  self->_readRequests = v33;

  v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  writeRequests = self->_writeRequests;
  self->_writeRequests = v35;
  v36 = 1;
LABEL_28:

  return v36;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CUBluetoothClassicConnection_invalidate__block_invoke;
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
  id errorHandler;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  OS_dispatch_source *timeoutTimer;
  NSObject *v15;
  OS_dispatch_source *v16;
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v2, v3, v4, v5, v20);
  }
LABEL_6:
  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v15 = timeoutTimer;
    dispatch_source_cancel(v15);
    v16 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960573, (uint64_t)"Invalidated (I)", v9, v10, v11, v12, v13, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUBluetoothClassicConnection _reportError:](self, "_reportError:", v17);

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
  -[CUBluetoothClassicConnection _btEnsureStopped](self, "_btEnsureStopped");
  -[CUBluetoothClassicConnection _invalidated](self, "_invalidated");
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

  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_btSession
    && !self->_btSessionAttaching
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
LABEL_17:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v8, v9, v10, v11, v13);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_17;
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
  NSString *destinationPeer;
  uint64_t v11;

  destinationPeer = self->_destinationPeer;
  if (destinationPeer)
  {
    -[CUBluetoothClassicConnection _run](self, "_run", a3);
  }
  else if (a3)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No destination peer", v3, v4, v5, v6, v7, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return destinationPeer != 0;
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OS_dispatch_source *v19;
  OS_dispatch_source *readSource;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  OS_dispatch_source *v24;
  OS_dispatch_source *writeSource;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  BOOL v32;
  NSObject *v33;
  void *v35;
  const char *v36;
  id v37;
  uint64_t v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD handler[5];
  int v43;

  v5 = -[CBL2CAPChannel socketFD](self->_l2capChannel, "socketFD");
  if (v5 < 0)
  {
    if (a3)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"No socket for L2CAP channel: %@", v6, v7, v8, v9, v10, (uint64_t)self->_l2capChannel);
      goto LABEL_14;
    }
    return 0;
  }
  v11 = v5;
  self->_socketFD = v5;
  v43 = 1;
  if (setsockopt(v5, 0xFFFF, 4130, &v43, 4u))
  {
    if (*__error())
    {
      v17 = *__error();
      if (!(_DWORD)v17)
        goto LABEL_5;
    }
    else
    {
      v17 = 4294960596;
    }
    if (!a3)
      return 0;
    v35 = (void *)*MEMORY[0x1E0CB2F90];
    v36 = "Set SO_NOSIGPIPE failed";
LABEL_13:
    NSErrorF_safe(v35, v17, (uint64_t)v36, v12, v13, v14, v15, v16, v38);
LABEL_14:
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0;
LABEL_15:
    *a3 = v37;
    return v32;
  }
LABEL_5:
  v18 = SocketSetNonBlocking(v11, 1);
  if ((_DWORD)v18)
  {
    if (!a3)
      return 0;
    v17 = v18;
    v35 = (void *)*MEMORY[0x1E0CB2F90];
    v36 = "Make non-blocking failed";
    goto LABEL_13;
  }
  v19 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], v11, 0, (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v19;

  v21 = self->_readSource;
  if (!v21)
  {
    if (a3)
    {
      v35 = (void *)*MEMORY[0x1E0CB2F90];
      v36 = "Create read source failed";
      v17 = 4294960550;
      goto LABEL_13;
    }
    return 0;
  }
  v22 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke;
  handler[3] = &unk_1E25DF2A0;
  handler[4] = self;
  dispatch_source_set_event_handler(v21, handler);
  v23 = self->_readSource;
  v41[0] = v22;
  v41[1] = 3221225472;
  v41[2] = __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_2;
  v41[3] = &unk_1E25DF2A0;
  v41[4] = self;
  dispatch_source_set_cancel_handler(v23, v41);
  dispatch_resume((dispatch_object_t)self->_readSource);
  v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DF0], v11, 0, (dispatch_queue_t)self->_dispatchQueue);
  writeSource = self->_writeSource;
  self->_writeSource = v24;

  v31 = self->_writeSource;
  v32 = v31 != 0;
  if (!v31)
  {
    if (!a3)
      return v32;
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960549, (uint64_t)"Create write source failed", v26, v27, v28, v29, v30, v38);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v40[0] = v22;
  v40[1] = 3221225472;
  v40[2] = __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_3;
  v40[3] = &unk_1E25DF2A0;
  v40[4] = self;
  dispatch_source_set_event_handler(v31, v40);
  v33 = self->_writeSource;
  v39[0] = v22;
  v39[1] = 3221225472;
  v39[2] = __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_4;
  v39[3] = &unk_1E25DF2A0;
  v39[4] = self;
  dispatch_source_set_cancel_handler(v33, v39);
  self->_writeSuspended = 1;
  return v32;
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _reportError:]", 0x5Au, (uint64_t)"Error: %{error}\n", v4, v5, v6, v7, v9);
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
  -[CUBluetoothClassicConnection _abortReadsWithError:](self, "_abortReadsWithError:", v14);
  -[CUBluetoothClassicConnection _abortWritesWithError:](self, "_abortWritesWithError:", v14);

}

- (void)_run
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t state;
  int v8;
  _BOOL4 v9;
  LogCategory *ucat;
  OS_dispatch_source *timeoutTimer;
  NSObject *v12;
  OS_dispatch_source *v13;
  void (**v14)(void *, _QWORD);
  id activateCompletion;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          state = self->_state;
          switch((int)state)
          {
            case 0:
              v8 = 10;
              goto LABEL_20;
            case 10:
              v9 = -[CUBluetoothClassicConnection _runBTSessionStart](self, "_runBTSessionStart");
              goto LABEL_18;
            case 11:
              if (self->_btSession)
              {
                v8 = 12;
                goto LABEL_20;
              }
              v8 = 11;
              break;
            case 12:
              v9 = -[CUBluetoothClassicConnection _runConnectStart](self, "_runConnectStart");
              goto LABEL_18;
            case 13:
              if (self->_btConnected)
              {
                v8 = 14;
                goto LABEL_20;
              }
              v8 = 13;
              break;
            case 14:
              if ((self->_connectionFlags & 2) != 0)
                v8 = 19;
              else
                v8 = 15;
              goto LABEL_20;
            case 15:
              v9 = -[CUBluetoothClassicConnection _runOpenChannelStart](self, "_runOpenChannelStart");
              goto LABEL_18;
            case 16:
              if (self->_l2capChannel)
              {
                v8 = 17;
LABEL_20:
                self->_state = v8;
              }
              else
              {
                v8 = 16;
              }
              break;
            case 17:
              v8 = 18;
              goto LABEL_20;
            case 18:
              v9 = -[CUBluetoothClassicConnection _runSetupChannel](self, "_runSetupChannel");
LABEL_18:
              v8 = self->_state;
              if (!v9)
                break;
              ++v8;
              goto LABEL_20;
            case 19:
              timeoutTimer = self->_timeoutTimer;
              if (timeoutTimer)
              {
                v12 = timeoutTimer;
                dispatch_source_cancel(v12);
                v13 = self->_timeoutTimer;
                self->_timeoutTimer = 0;

              }
              v14 = (void (**)(void *, _QWORD))_Block_copy(self->_activateCompletion);
              activateCompletion = self->_activateCompletion;
              self->_activateCompletion = 0;

              if (v14)
                v14[2](v14, 0);
              if ((self->_connectionFlags & 2) == 0)
              {
                -[CUBluetoothClassicConnection _processReads:](self, "_processReads:", 0);
                -[CUBluetoothClassicConnection _processWrites](self, "_processWrites");
              }

              v8 = self->_state;
              break;
            default:
              return;
          }
          if (v8 == (_DWORD)state)
            return;
          ucat = self->_ucat;
        }
        while (ucat->var0 > 30);
        if (ucat->var0 == -1)
          break;
LABEL_24:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _run]", 0x1Eu, (uint64_t)"State: %s -> %s\n", v2, v3, v4, v5, (uint64_t)off_1E25DC338[state]);
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_24;
      }
    }
  }
  -[CUBluetoothClassicConnection _invalidated](self, "_invalidated");
}

- (BOOL)_runBTSessionStart
{
  CUBluetoothClassicConnection *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, int, void *);

  v12 = _btSessionEventCallback;
  v2 = self;
  v3 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue[0])((uint64_t)v2->_ucat->var4, (uint64_t)&v12, (uint64_t)v2, v2->_dispatchQueue);
  if (v3)
  {
    CFRelease(v2);
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], (v3 + 310000), (uint64_t)"BTSessionAttachWithQueue failed", v4, v5, v6, v7, v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBluetoothClassicConnection _reportError:](v2, "_reportError:", v9);

  }
  else
  {
    v2->_btSessionAttaching = 1;
    v2->_btSessionStarted = 1;
  }
  return v3 == 0;
}

- (BOOL)_runConnectStart
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  BTDeviceImpl *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  LogCategory *ucat;
  int v22;
  LogCategory *v23;
  OS_dispatch_source *timeoutTimer;
  NSObject *v25;
  OS_dispatch_source *v26;
  OS_dispatch_source *v27;
  OS_dispatch_source *v28;
  NSObject *v29;
  dispatch_time_t v30;
  BOOL v31;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  _QWORD handler[6];
  id v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v8 = self->_destinationPeer;
  if (!v8)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No destination peer", v3, v4, v5, v6, v7, v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBluetoothClassicConnection _reportError:](self, "_reportError:", v33);

    v31 = 0;
    goto LABEL_29;
  }
  v39 = 0;
  v9 = -[CUBluetoothClassicConnection _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v8, &v39);
  v10 = v39;
  v16 = v10;
  if (v9)
  {
    v17 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])((uint64_t)v9, (uint64_t)self->_btDeviceAddrStr, 32);
    v18 = (v17 + 310000);
    if (v17)
      v19 = (_DWORD)v18 == 0;
    else
      v19 = 1;
    if (!v19)
    {
      v34 = (void *)*MEMORY[0x1E0CB2F90];
      v35 = "BTDeviceGetAddressString failed";
LABEL_36:
      NSErrorF_safe(v34, v18, (uint64_t)v35, v11, v12, v13, v14, v15, v37);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBluetoothClassicConnection _reportError:](self, "_reportError:", v36);

      goto LABEL_37;
    }
    if (!self->_btServiceAddCallbacks)
    {
      v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTServiceAddCallbacks[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler, (uint64_t)self);
      if (v20)
      {
        v18 = (v20 + 310000);
        if (v20 != -310000)
        {
          v34 = (void *)*MEMORY[0x1E0CB2F90];
          v35 = "BTServiceAddCallbacks failed";
          goto LABEL_36;
        }
      }
      self->_btServiceAddCallbacks = 1;
    }
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_16;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_16;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _runConnectStart]", 0x1Eu, (uint64_t)"Connect: %@\n", v12, v13, v14, v15, (uint64_t)v8);
LABEL_16:
    if ((self->_connectionFlags & 4) != 0)
    {
      v40[0] = 0;
      v40[1] = 0;
      v22 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConnectServicesWithParameters[0])((uint64_t)v9, 4294956991, 32, (uint64_t)v40);
      if (v22 != 2)
        goto LABEL_23;
      v23 = self->_ucat;
      if (v23->var0 <= 30)
      {
        if (v23->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v23, 0x1Eu))
            goto LABEL_22;
          v23 = self->_ucat;
        }
        LogPrintF((uint64_t)v23, (uint64_t)"-[CUBluetoothClassicConnection _runConnectStart]", 0x1Eu, (uint64_t)"Connect Tipi failed, retrying in normal mode", v12, v13, v14, v15, v37);
      }
    }
LABEL_22:
    v22 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceConnectServices[0])((uint64_t)v9, 4294956991);
LABEL_23:
    if (!v22 || (v18 = (v22 + 310000), v22 == -310000))
    {
      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        v25 = timeoutTimer;
        dispatch_source_cancel(v25);
        v26 = self->_timeoutTimer;
        self->_timeoutTimer = 0;

      }
      v27 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v28 = self->_timeoutTimer;
      self->_timeoutTimer = v27;
      v29 = v27;

      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __48__CUBluetoothClassicConnection__runConnectStart__block_invoke;
      handler[3] = &unk_1E25DE628;
      handler[4] = v29;
      handler[5] = self;
      dispatch_source_set_event_handler(v29, handler);
      v30 = dispatch_time(0, 15000000000);
      dispatch_source_set_timer(v29, v30, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_activate(v29);

      v31 = 1;
      goto LABEL_28;
    }
    v34 = (void *)*MEMORY[0x1E0CB2F90];
    v35 = "BTDeviceConnectServices failed";
    goto LABEL_36;
  }
  if (!v10)
  {
    v34 = (void *)*MEMORY[0x1E0CB2F90];
    v35 = "No device, no error";
    v18 = 4294960596;
    goto LABEL_36;
  }
  -[CUBluetoothClassicConnection _reportError:](self, "_reportError:", v10);
LABEL_37:
  v31 = 0;
LABEL_28:

LABEL_29:
  return v31;
}

- (BOOL)_runOpenChannelStart
{
  return 1;
}

- (BOOL)_runSetupChannel
{
  BOOL v3;
  id v4;
  id v6;

  v6 = 0;
  v3 = -[CUBluetoothClassicConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v6);
  v4 = v6;
  if (!v3)
    -[CUBluetoothClassicConnection _reportError:](self, "_reportError:", v4);

  return v3;
}

- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BTDeviceImpl *v31;
  uint64_t v33;
  int v34;
  __int16 v35;
  BTDeviceImpl *v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v6 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend(v6, "UTF8String");
  if (!v7)
  {
    if (!a4)
      goto LABEL_21;
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"Bad device ID UTF-8: '%@'", v8, v9, v10, v11, v12, (uint64_t)v6);
    goto LABEL_24;
  }
  v13 = v7;
  v37 = 0uLL;
  if (!StringToUUIDEx(v7, 0xFFFFFFFFFFFFFFFFLL, 0, 0, &v37, v10, v11, v12))
  {
    v24 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier[0])((uint64_t)self->_btSession, (uint64_t)&v37, (uint64_t)&v36);
    if (v24 == -310000)
      v30 = 4294960596;
    else
      v30 = (v24 + 310000);
    if (!v24)
      goto LABEL_14;
    if (!a4)
      goto LABEL_21;
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], v30, (uint64_t)"BTDeviceFromIdentifier failed", v25, v26, v27, v28, v29, v33);
LABEL_24:
    v31 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v35 = 0;
  v34 = 0;
  v14 = TextToHardwareAddress(v13, 0xFFFFFFFFFFFFFFFFLL, 6, &v34);
  if ((_DWORD)v14)
  {
    if (a4)
    {
      v21 = v14;
      v22 = (void *)*MEMORY[0x1E0CB2F90];
      v33 = (uint64_t)v13;
      v23 = "Bad device ID format: '%s'";
      goto LABEL_20;
    }
LABEL_21:
    v31 = 0;
    goto LABEL_15;
  }
  v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromAddress[0])((uint64_t)self->_btSession, (uint64_t)&v34, (uint64_t)&v36);
  if (v20 == -310000)
    v21 = 4294960596;
  else
    v21 = (v20 + 310000);
  if (v20)
  {
    if (a4)
    {
      v22 = (void *)*MEMORY[0x1E0CB2F90];
      v23 = "BTDeviceFromAddress failed";
LABEL_20:
      NSErrorF_safe(v22, v21, (uint64_t)v23, v15, v16, v17, v18, v19, v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_14:
  v31 = v36;
LABEL_15:

  return v31;
}

- (void)_btEnsureStopped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BTSessionImpl *btSession;
  LogCategory *ucat;
  uint64_t v9;

  if (self->_btServiceAddCallbacks)
  {
    self->_btServiceAddCallbacks = 0;
    btSession = self->_btSession;
    if (btSession)
      ((void (*)(uint64_t, uint64_t))softLinkBTServiceRemoveCallbacks[0])((uint64_t)btSession, (uint64_t)_btServiceEventHandler);
  }
  if (self->_btSession)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_9;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _btEnsureStopped]", 0x1Eu, (uint64_t)"BTSession detach\n", v2, v3, v4, v5, v9);
    }
LABEL_9:
    ((void (*)(uint64_t))softLinkBTSessionDetachWithQueue[0])((uint64_t)&self->_btSession);
    self->_btSession = 0;
  }
  self->_btSessionStarted = 0;
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
  v7[2] = __48__CUBluetoothClassicConnection_readWithRequest___block_invoke;
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
  uint64_t Data;
  LogCategory *ucat;
  uint64_t socketFD;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CUReadRequest *readRequestCurrent;
  const char *v21;
  void *v22;
  uint64_t *v23;
  int readSuspended;
  _BOOL4 v25;
  uint64_t v26;
  _BOOL4 v27;
  id obja;
  uint64_t *obj;

  v27 = a3;
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
      if (v27)
      {
        if (v4)
        {
          readSuspended = self->_readSuspended;
        }
        else
        {
          v25 = -[CUBluetoothClassicConnection _processReadStatus](self, "_processReadStatus");
          readSuspended = self->_readSuspended;
          if (v25)
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
      v23 = 0;
LABEL_21:

      return;
    }
    obja = (id)v7;
    -[NSMutableArray removeObjectAtIndex:](self->_readRequests, "removeObjectAtIndex:", 0);
    -[CUBluetoothClassicConnection _prepareReadRequest:](self, "_prepareReadRequest:", obja);
    objc_storeStrong((id *)p_readRequestCurrent, obja);
    v6 = (uint64_t *)obja;
LABEL_5:
    obj = v6;
    Data = SocketReadDataEx(self->_socketFD, v6[1], objc_msgSend(v6, "minLength"), objc_msgSend(v6, "maxLength"), v6 + 3);
    ucat = self->_ucat;
    if (ucat->var0 > 9)
      goto LABEL_9;
    if (ucat->var0 != -1)
      goto LABEL_7;
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
LABEL_7:
      socketFD = self->_socketFD;
      objc_msgSend(obj, "minLength");
      objc_msgSend(obj, "maxLength");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _processReads:]", 9u, (uint64_t)"Read socket %d, %zu min, %zu max, %zu offset, %zu nread, %#m\n", v16, v17, v18, v19, socketFD);
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
          v21 = "Read EOF";
        else
          v21 = "Read error";
        NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], Data, (uint64_t)v21, v8, v9, v10, v11, v12, v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothClassicConnection _abortReadsWithError:](self, "_abortReadsWithError:", v22);

      }
      v23 = obj;
      goto LABEL_21;
    }
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    -[CUBluetoothClassicConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", obj, 0);
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
  if (ucat->var0 <= 9)
  {
    v15 = v21;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
        goto LABEL_12;
      ucat = self->_ucat;
      v15 = v21;
    }
    v16 = objc_msgSend(v15, "minLength");
    objc_msgSend(v21, "maxLength");
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _prepareReadRequest:]", 9u, (uint64_t)"Read prepared (%zu min, %zu max)\n", v17, v18, v19, v20, v16);
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
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _abortReadsWithError:]", 0x1Eu, (uint64_t)"Abort reads: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
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

    -[CUBluetoothClassicConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v10, v8);
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

        -[CUBluetoothClassicConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v10, v8);
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
  -[CUBluetoothClassicConnection _invalidated](self, "_invalidated");

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
  void *v13;
  void (**v14)(void *, void *);
  id errorHandler;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;

  while (1)
  {
    v3 = recv(self->_socketFD, &v23, 1uLL, 2);
    if ((v3 & 0x8000000000000000) == 0)
      break;
    if (!*__error())
    {
      v4 = 4294960596;
LABEL_12:
      v14 = (void (**)(void *, void *))_Block_copy(self->_errorHandler);
      errorHandler = self->_errorHandler;
      self->_errorHandler = 0;

      if (v14)
      {
        NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], v4, (uint64_t)"Read status error", v16, v17, v18, v19, v20, v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, v21);

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
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960543, (uint64_t)"Read status EOF", v8, v9, v10, v11, v12, v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v13);

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
  if (ucat->var0 <= 9)
  {
    v8 = v16;
    if (ucat->var0 != -1)
    {
LABEL_3:
      v9 = objc_msgSend(v8, "length");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _completeReadRequest:error:]", 9u, (uint64_t)"Read completed: %zu byte(s), %{error}\n", v10, v11, v12, v13, v9);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
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
  v7[2] = __49__CUBluetoothClassicConnection_writeWithRequest___block_invoke;
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
    v8 = __61__CUBluetoothClassicConnection_writeEndOfDataWithCompletion___block_invoke;
    v9 = &unk_1E25DE600;
    v10 = v5;
    v11 = v4;
    -[CUWriteRequest setCompletion:](v5, "setCompletion:", &v6);

  }
  -[CUBluetoothClassicConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);

}

- (void)_processWrites
{
  CUWriteRequest **p_writeRequestCurrent;
  int v4;
  void *v5;
  CUWriteRequest *v6;
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
  CUWriteRequest *writeRequestCurrent;
  void *v29;
  uint64_t v30;
  id v31;

  p_writeRequestCurrent = &self->_writeRequestCurrent;
  v4 = 4;
  v5 = (void *)*MEMORY[0x1E0CB2F90];
  do
  {
    v6 = *p_writeRequestCurrent;
    if (!v6)
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
        v6 = 0;
        goto LABEL_37;
      }
      v6 = (CUWriteRequest *)v14;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0);
      v31 = 0;
      -[CUBluetoothClassicConnection _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v6, &v31);
      v15 = v31;
      if (v15)
      {
        v16 = v15;
        goto LABEL_24;
      }
      objc_storeStrong((id *)p_writeRequestCurrent, v6);
    }
    v12 = SocketWriteData(self->_socketFD, (const iovec **)&v6->_iop, &v6->_ion);
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 != -1)
        goto LABEL_5;
      if (_LogCategory_Initialize((uint64_t)ucat, 9u))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _processWrites]", 9u, (uint64_t)"Write socket %d, pre-ion %d, post-ion %d, %#m\n", v8, v9, v10, v11, self->_socketFD);
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
        NSErrorF_safe(v5, v12, (uint64_t)"Write failed", v7, v8, v9, v10, v11, v30);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothClassicConnection _abortWritesWithError:](self, "_abortWritesWithError:", v29);

      }
LABEL_37:

      return;
    }
    if (!-[CUWriteRequest endOfData](v6, "endOfData"))
      goto LABEL_20;
    v21 = self->_ucat;
    if (v21->var0 <= 9)
    {
      if (v21->var0 != -1)
        goto LABEL_14;
      if (_LogCategory_Initialize((uint64_t)v21, 9u))
      {
        v21 = self->_ucat;
LABEL_14:
        LogPrintF((uint64_t)v21, (uint64_t)"-[CUBluetoothClassicConnection _processWrites]", 9u, (uint64_t)"Shutdown socket %d\n", v17, v18, v19, v20, self->_socketFD);
      }
    }
    if (shutdown(self->_socketFD, 1))
    {
      if (!*__error())
      {
        v27 = 4294960596;
LABEL_22:
        NSErrorF_safe(v5, v27, (uint64_t)"shutdown() failed", v22, v23, v24, v25, v26, v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      v27 = *__error();
      if ((_DWORD)v27)
        goto LABEL_22;
    }
LABEL_20:
    v16 = 0;
LABEL_23:
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

LABEL_24:
    -[CUBluetoothClassicConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v6, v16);

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
  void *v10;
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

    if (gLogCategory_CUBluetoothClassicConnection > 9
      || gLogCategory_CUBluetoothClassicConnection == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBluetoothClassicConnection, 9u))
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
    if (ucat->var0 > 9)
      goto LABEL_27;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 9u))
        goto LABEL_27;
      ucat = self->_ucat;
      v32 = *((unsigned int *)v6 + 70);
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _prepareWriteRequest:error:]", 9u, (uint64_t)"Write prepared (%d iov, %zu total)\n", v28, v29, v30, v31, v32);
LABEL_27:
    v17 = 1;
    goto LABEL_28;
  }
  if (a4)
  {
    v10 = (void *)*MEMORY[0x1E0CB2F90];
    v11 = objc_msgSend(v6, "bytesIOMaxCount");
    NSErrorF_safe(v10, 4294960532, (uint64_t)"Too many write elements (%zu max)", v12, v13, v14, v15, v16, v11);
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
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _abortWritesWithError:]", 0x1Eu, (uint64_t)"Abort writes: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
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

    -[CUBluetoothClassicConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v10, v8);
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

        -[CUBluetoothClassicConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v10, v8);
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
  -[CUBluetoothClassicConnection _invalidated](self, "_invalidated");

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
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClassicConnection _completeWriteRequest:error:]", 9u, (uint64_t)"Write completed: %{error}\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
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

- (unsigned)connectionFlags
{
  return self->_connectionFlags;
}

- (void)setConnectionFlags:(unsigned int)a3
{
  self->_connectionFlags = a3;
}

- (NSString)destinationPeer
{
  return self->_destinationPeer;
}

- (void)setDestinationPeer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)destinationService
{
  return self->_destinationService;
}

- (void)setDestinationService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)requiredServices
{
  return self->_requiredServices;
}

- (void)setRequiredServices:(unsigned int)a3
{
  self->_requiredServices = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationService, 0);
  objc_storeStrong((id *)&self->_destinationPeer, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

void __61__CUBluetoothClassicConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __49__CUBluetoothClassicConnection_writeWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 68))
  {
    v10 = *(_QWORD *)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960573, (uint64_t)"Invalidated (W)", a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_completeWriteRequest:error:", v10, v13);

  }
  else
  {
    objc_msgSend(*(id *)(v9 + 144), "addObject:", *(_QWORD *)(a1 + 40));
    v11 = *(_DWORD **)(a1 + 32);
    if ((v11[26] & 0x80000000) == 0)
      objc_msgSend(v11, "_processWrites");
  }
}

void __48__CUBluetoothClassicConnection_readWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 68))
  {
    v10 = *(_QWORD *)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960573, (uint64_t)"Invalidated (R)", a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_completeReadRequest:error:", v10, v13);

  }
  else
  {
    objc_msgSend(*(id *)(v9 + 96), "addObject:", *(_QWORD *)(a1 + 40));
    v11 = *(_DWORD **)(a1 + 32);
    if ((v11[26] & 0x80000000) == 0)
      objc_msgSend(v11, "_processReads:", 0);
  }
}

void __48__CUBluetoothClassicConnection__runConnectStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  _QWORD *v9;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD **)(a1 + 40);
  if (v8 == (void *)v9[14])
  {
    if (v8)
    {
      v11 = v8;
      dispatch_source_cancel(v11);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(v12 + 112);
      *(_QWORD *)(v12 + 112) = 0;

      v9 = *(_QWORD **)(a1 + 40);
    }
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960574, (uint64_t)"Connection timeout", a4, a5, a6, a7, a8, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_reportError:", v15);

  }
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processReads:", 1);
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processWrites");
}

uint64_t __55__CUBluetoothClassicConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __42__CUBluetoothClassicConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __55__CUBluetoothClassicConnection_activateWithCompletion___block_invoke(uint64_t a1)
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
