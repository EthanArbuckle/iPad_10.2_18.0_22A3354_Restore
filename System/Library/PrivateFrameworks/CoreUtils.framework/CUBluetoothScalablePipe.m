@implementation CUBluetoothScalablePipe

- (CUBluetoothScalablePipe)init
{
  CUBluetoothScalablePipe *v2;
  CUBluetoothScalablePipe *v3;
  CUBluetoothScalablePipe *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUBluetoothScalablePipe;
  v2 = -[CUBluetoothScalablePipe init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_channelFD = -1;
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_priority = 2;
    v3->_ucat = (LogCategory *)&gLogCategory_CUBluetoothScalablePipe;
    v4 = v3;
  }

  return v3;
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
  v4.super_class = (Class)CUBluetoothScalablePipe;
  -[CUBluetoothScalablePipe dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return (NSString *)NSPrintF((uint64_t)"CUBluetoothScalablePipe '%@', Registered %s, State %s, Priority %s, PeerState %s, Peer %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
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
  v7 = qword_1EE0669B0;
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
  v7[2] = __50__CUBluetoothScalablePipe_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CUBluetoothScalablePipe_invalidate__block_invoke;
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
  id peerHostStateChangedHandler;
  id stateChangedHandler;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CBScalablePipeManager *btPipeManager;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *v22;
  void (**invalidationHandler)(void);
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;

  if (self->_invalidateCalled || self->_invalidateDone)
    return;
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v2, v3, v4, v5, v26);
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }
LABEL_7:
  peerHostStateChangedHandler = self->_peerHostStateChangedHandler;
  self->_peerHostStateChangedHandler = 0;

  stateChangedHandler = self->_stateChangedHandler;
  self->_stateChangedHandler = 0;

  NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (I)", v10, v11, v12, v13, v14, v15, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUBluetoothScalablePipe _ensureStopped:](self, "_ensureStopped:", v16);

  -[CBScalablePipeManager setDelegate:](self->_btPipeManager, "setDelegate:", 0);
  btPipeManager = self->_btPipeManager;
  self->_btPipeManager = 0;

  v22 = self->_ucat;
  if (v22->var0 <= 30)
  {
    if (v22->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v22, 0x1Eu))
        goto LABEL_11;
      v22 = self->_ucat;
    }
    LogPrintF((uint64_t)v22, (uint64_t)"-[CUBluetoothScalablePipe _invalidate]", 0x1Eu, (uint64_t)"Invalidated\n", v18, v19, v20, v21, v27);
  }
LABEL_11:
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    v24 = self->_invalidationHandler;
  }
  else
  {
    v24 = 0;
  }
  self->_invalidationHandler = 0;

  v25 = self->_stateChangedHandler;
  self->_stateChangedHandler = 0;

  self->_invalidateDone = 1;
}

- (void)_ensureStarted
{
  CBScalablePipeManager *btPipeManager;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  LogCategory *v10;
  const char *v11;
  CBScalablePipeManager *v12;
  CBScalablePipeManager *v13;
  CBScalablePipeManager *v14;
  LogCategory *ucat;
  const char *v16;
  CBScalablePipe **p_btPipe;
  void *v18;
  void *v19;
  unsigned int v20;
  NSString *v21;
  int var0;
  uint64_t v23;
  int priority;
  uint64_t v25;
  CBScalablePipeManager *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  uint64_t v31;

  v30[1] = *MEMORY[0x1E0C80C00];
  if (self->_invalidateCalled)
    return;
  btPipeManager = self->_btPipeManager;
  if (!btPipeManager)
  {
    v12 = (CBScalablePipeManager *)objc_msgSend(objc_alloc((Class)getCBScalablePipeManagerClass[0]()), "initWithDelegate:queue:", self, self->_dispatchQueue);
    v13 = self->_btPipeManager;
    self->_btPipeManager = v12;

    v14 = self->_btPipeManager;
    if (!v14)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90)
        return;
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          return;
        ucat = self->_ucat;
      }
      v16 = "### Create CBScalablePipeManager failed\n";
      goto LABEL_28;
    }
    if (-[CBScalablePipeManager state](v14, "state") != 5)
      return;
LABEL_11:
    if (self->_btEndpointRegistering)
    {
      if (!self->_btEndpointRegistered)
      {
        if (!btPipeManager)
          return;
        ucat = self->_ucat;
        if (ucat->var0 > 20)
          return;
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u))
            return;
          ucat = self->_ucat;
        }
        v16 = "Waiting until endpoint registered\n";
LABEL_33:
        v20 = 20;
        goto LABEL_34;
      }
      goto LABEL_18;
    }
    if (self->_btEndpointRegistered)
    {
LABEL_18:
      p_btPipe = &self->_btPipe;
      if (!self->_btPipe)
      {
        if (!btPipeManager)
          return;
        ucat = self->_ucat;
        if (ucat->var0 > 20)
          return;
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u))
            return;
          ucat = self->_ucat;
        }
        v16 = "Waiting until pipe connected\n";
        goto LABEL_33;
      }
LABEL_19:
      if (self->_channelFD < 0)
        -[CUBluetoothScalablePipe _setupPipe](self, "_setupPipe");
      if (!self->_btPeerKVORegistered)
      {
        -[CBScalablePipe peer](*p_btPipe, "peer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "addObserver:forKeyPath:options:context:", self, CFSTR("hostState"), 0, 0);
          self->_btPeerKVORegistered = 1;
          -[CUBluetoothScalablePipe _handleBTPeerHostStateChanged](self, "_handleBTPeerHostStateChanged");
        }

      }
      return;
    }
    v21 = self->_identifier;
    ucat = self->_ucat;
    var0 = ucat->var0;
    if (v21)
    {
      if (var0 > 30)
        goto LABEL_53;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        {
LABEL_53:
          v23 = 1;
          self->_btEndpointRegistering = 1;
          priority = self->_priority;
          if (priority == 3)
            v23 = 2;
          if (priority == 1)
            v25 = 0;
          else
            v25 = v23;
          v26 = self->_btPipeManager;
          getCBScalablePipeOptionTransport[0]();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v27;
          v30[0] = &unk_1E25FD188;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[CBScalablePipeManager registerEndpoint:type:priority:options:](v26, "registerEndpoint:type:priority:options:", v21, 0, v25, v28);

          if (!self->_btEndpointRegistered)
            return;
          p_btPipe = &self->_btPipe;
          if (!self->_btPipe)
            return;
          goto LABEL_19;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _ensureStarted]", 0x1Eu, (uint64_t)"Register endpoint '%@'\n", v5, v6, v7, v8, (uint64_t)v21);
      goto LABEL_53;
    }
    if (var0 > 90)
      return;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        return;
      ucat = self->_ucat;
    }
    v16 = "### No identifier to register endpoint\n";
LABEL_28:
    v20 = 90;
LABEL_34:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _ensureStarted]", v20, (uint64_t)v16, v5, v6, v7, v8, v31);
    return;
  }
  v4 = -[CBScalablePipeManager state](self->_btPipeManager, "state");
  if (v4 == 5)
    goto LABEL_11;
  v9 = v4;
  v10 = self->_ucat;
  if (v10->var0 > 20)
    return;
  if (v10->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v10, 0x14u))
      return;
    v10 = self->_ucat;
  }
  if (v9 > 0xA)
    v11 = "?";
  else
    v11 = off_1E25DC5B8[v9];
  LogPrintF((uint64_t)v10, (uint64_t)"-[CUBluetoothScalablePipe _ensureStarted]", 0x14u, (uint64_t)"Waiting until Bluetooth ready (%s)\n", v5, v6, v7, v8, (uint64_t)v11);
}

- (void)_ensureStopped:(id)a3
{
  id v4;
  CBScalablePipe *btPipe;
  NSString *v6;
  NSString *v7;

  v4 = a3;
  -[CUBluetoothScalablePipe _abortReadsWithError:](self, "_abortReadsWithError:", v4);
  -[CUBluetoothScalablePipe _abortWritesWithError:](self, "_abortWritesWithError:", v4);

  -[CUBluetoothScalablePipe _tearDownPipe](self, "_tearDownPipe");
  btPipe = self->_btPipe;
  self->_btPipe = 0;

  v6 = self->_identifier;
  if (v6 && (self->_btEndpointRegistered || self->_btEndpointRegistering))
  {
    v7 = v6;
    -[CBScalablePipeManager unregisterEndpoint:](self->_btPipeManager, "unregisterEndpoint:", v6);
    v6 = v7;
  }
  *(_WORD *)&self->_btEndpointRegistering = 0;

}

- (void)_setupPipe
{
  CBScalablePipe *v3;
  channel *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  channel_ring_desc *v9;
  channel_ring_desc *v10;
  uint64_t attr;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  LogCategory *ucat;
  const char *v22;
  uint64_t v23;
  LogCategory *v24;
  LogCategory *v25;
  LogCategory *v26;
  uint64_t v27;
  LogCategory *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = self->_btPipe;
  v4 = (channel *)-[CBScalablePipe channel](v3, "channel");
  self->_btChannel = v4;
  if (!v4)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_21;
        ucat = self->_ucat;
      }
      v22 = "### No channel\n";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  os_channel_ring_id();
  v9 = (channel_ring_desc *)os_channel_rx_ring();
  self->_btReadRing = v9;
  if (!v9)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_21;
        ucat = self->_ucat;
      }
      v22 = "### No rx ring\n";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  os_channel_ring_id();
  v10 = (channel_ring_desc *)os_channel_tx_ring();
  self->_btWriteRing = v10;
  if (!v10)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_21;
        ucat = self->_ucat;
      }
      v22 = "### No tx ring\n";
      goto LABEL_20;
    }
LABEL_21:
    v23 = 4294960596;
    goto LABEL_47;
  }
  if (!os_channel_attr_create())
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_21;
        ucat = self->_ucat;
      }
      v22 = "### Create channel attr failed\n";
LABEL_20:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)v22, v5, v6, v7, v8, v29);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  attr = os_channel_read_attr();
  if ((_DWORD)attr)
  {
    v23 = attr;
    v24 = self->_ucat;
    if (v24->var0 <= 90)
    {
      if (v24->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v24, 0x5Au))
          goto LABEL_46;
        v24 = self->_ucat;
      }
      LogPrintF((uint64_t)v24, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)"### Read channel attr failed: %#m\n", v12, v13, v14, v15, v23);
    }
  }
  else
  {
    v30 = 0;
    v16 = os_channel_attr_get();
    if (!(_DWORD)v16)
    {
      v26 = self->_ucat;
      if (v26->var0 <= 90)
      {
        if (v26->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v26, 0x5Au))
            goto LABEL_45;
          v26 = self->_ucat;
          v27 = v30;
        }
        else
        {
          v27 = 0;
        }
        LogPrintF((uint64_t)v26, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)"### Bad channel slot size: %llu\n", v17, v18, v19, v20, v27);
      }
LABEL_45:
      v23 = 4294960553;
      goto LABEL_46;
    }
    v23 = v16;
    v25 = self->_ucat;
    if (v25->var0 <= 90)
    {
      if (v25->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v25, 0x5Au))
          goto LABEL_46;
        v25 = self->_ucat;
      }
      LogPrintF((uint64_t)v25, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)"### Get channel slot size failed: %#m\n", v17, v18, v19, v20, v23);
    }
  }
LABEL_46:
  os_channel_attr_destroy();
LABEL_47:
  v28 = self->_ucat;
  if (v28->var0 <= 90)
  {
    if (v28->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v28, 0x5Au))
        goto LABEL_51;
      v28 = self->_ucat;
    }
    LogPrintF((uint64_t)v28, (uint64_t)"-[CUBluetoothScalablePipe _setupPipe]", 0x5Au, (uint64_t)"### Setup pipe failed: %#m\n", v5, v6, v7, v8, v23);
  }
LABEL_51:
  -[CUBluetoothScalablePipe _tearDownPipe](self, "_tearDownPipe");

}

- (void)_tearDownPipe
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  NSObject *readSource;
  OS_dispatch_source *v9;
  NSObject *writeSource;
  OS_dispatch_source *v11;
  char *btReadLeftoverBuf;
  void *v13;
  void (**v14)(void);
  uint64_t v15;
  void (**v16)(void);

  if ((self->_channelFD & 0x80000000) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _tearDownPipe]", 0x1Eu, (uint64_t)"Tear down pipe\n", v2, v3, v4, v5, v15);
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
LABEL_6:
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    if (self->_readSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_readSource);
      self->_readSuspended = 0;
    }
    v9 = self->_readSource;
    self->_readSource = 0;

  }
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_source_cancel(writeSource);
    if (self->_writeSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_writeSource);
      self->_writeSuspended = 0;
    }
    v11 = self->_writeSource;
    self->_writeSource = 0;

  }
  self->_btChannel = 0;
  self->_channelFD = -1;
  self->_btReadRing = 0;
  btReadLeftoverBuf = self->_btReadLeftoverBuf;
  if (btReadLeftoverBuf)
  {
    free(btReadLeftoverBuf);
    self->_btReadLeftoverBuf = 0;
  }
  self->_btReadLeftoverMaxLen = 0;
  self->_btWriteRing = 0;
  if (self->_btPeerKVORegistered)
  {
    self->_btPeerKVORegistered = 0;
    -[CBScalablePipe peer](self->_btPipe, "peer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObserver:forKeyPath:context:", self, CFSTR("hostState"), 0);

    -[CUBluetoothScalablePipe _handleBTPeerHostStateChanged](self, "_handleBTPeerHostStateChanged");
  }
  if (self->_state != 2)
  {
    self->_state = 2;
    v14 = (void (**)(void))_Block_copy(self->_stateChangedHandler);
    if (v14)
    {
      v16 = v14;
      v14[2]();
      v14 = v16;
    }

  }
}

- (void)_handleBTPeerHostStateChanged
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  int v9;
  unsigned int peerHostState;
  LogCategory *ucat;
  const char *v12;
  void (**v13)(void);
  void (**v14)(void);

  if (self->_btPeerKVORegistered)
  {
    -[CBScalablePipe peer](self->_btPipe, "peer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hostState");

    if (v8 == 1)
      v9 = 1;
    else
      v9 = 2 * (v8 == 2);
  }
  else
  {
    v9 = 0;
  }
  peerHostState = self->_peerHostState;
  if (v9 == peerHostState)
    return;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_9:
      if (peerHostState > 2)
        v12 = "?";
      else
        v12 = off_1E25DC610[peerHostState];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _handleBTPeerHostStateChanged]", 0x1Eu, (uint64_t)"Peer host state changed: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v12);
      goto LABEL_15;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      peerHostState = self->_peerHostState;
      goto LABEL_9;
    }
  }
LABEL_15:
  self->_peerHostState = v9;
  v13 = (void (**)(void))_Block_copy(self->_peerHostStateChangedHandler);
  if (v13)
  {
    v14 = v13;
    v13[2]();
    v13 = v14;
  }

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
  v7[2] = __43__CUBluetoothScalablePipe_readWithRequest___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_processReads
{
  CUReadRequest **p_readRequestCurrent;
  int v4;
  CUReadRequest *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LogCategory *ucat;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CUReadRequest *readRequestCurrent;
  void *v21;
  CUReadRequest *v22;
  uint64_t v23;
  CUReadRequest *obja;
  CUReadRequest *obj;

  p_readRequestCurrent = &self->_readRequestCurrent;
  v4 = 4;
  do
  {
    v5 = *p_readRequestCurrent;
    if (!v5)
    {
      -[NSMutableArray firstObject](self->_readRequests, "firstObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        if (!self->_readSuspended)
        {
          self->_readSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_readSource);
        }
        v22 = 0;
        goto LABEL_18;
      }
      obja = (CUReadRequest *)v6;
      -[NSMutableArray removeObjectAtIndex:](self->_readRequests, "removeObjectAtIndex:", 0);
      -[CUBluetoothScalablePipe _prepareReadRequest:](self, "_prepareReadRequest:", obja);
      objc_storeStrong((id *)p_readRequestCurrent, obja);
      v5 = obja;
    }
    obj = v5;
    v13 = -[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:](self, "_readBytes:minLen:maxLen:offset:", v5->_bufferPtr, -[CUReadRequest minLength](v5, "minLength"), -[CUReadRequest maxLength](v5, "maxLength"), &v5->_length);
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 != -1)
        goto LABEL_7;
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
      {
        ucat = self->_ucat;
LABEL_7:
        v15 = -[CUReadRequest minLength](obj, "minLength");
        -[CUReadRequest maxLength](obj, "maxLength");
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _processReads]", 9u, (uint64_t)"Read channel, %zu min, %zu max, %zu offset, %zu nread, %#m\n", v16, v17, v18, v19, v15);
      }
    }
    if ((_DWORD)v13)
    {
      if ((_DWORD)v13 == 35)
      {
        if (self->_readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
      else
      {
        NSErrorWithOSStatusF(v13, (uint64_t)"Read failed", v7, v8, v9, v10, v11, v12, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothScalablePipe _abortReadsWithError:](self, "_abortReadsWithError:", v21);

      }
      v22 = obj;
LABEL_18:

      return;
    }
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    -[CUBluetoothScalablePipe _completeReadRequest:error:](self, "_completeReadRequest:error:", obj, 0);
    --v4;
  }
  while (v4);
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _prepareReadRequest:]", 9u, (uint64_t)"Read prepared (%zu min, %zu max)\n", v17, v18, v19, v20, v16);
  }
LABEL_12:

}

- (int)_readBytes:(char *)a3 minLen:(unint64_t)a4 maxLen:(unint64_t)a5 offset:(unint64_t *)a6
{
  unint64_t v7;
  char *v8;
  char *v9;
  unint64_t v10;
  char *btReadLeftoverPtr;
  char *v13;
  size_t v14;
  uint64_t i;
  uint64_t next_slot;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *ucat;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  LogCategory *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  LogCategory *v36;

  v7 = a4;
  v8 = a3;
  v9 = &a3[*a6];
  v10 = a5 - *a6;
  if (a5 == *a6)
    goto LABEL_26;
  btReadLeftoverPtr = self->_btReadLeftoverPtr;
  v13 = (char *)(self->_btReadLeftoverEnd - btReadLeftoverPtr);
  if (v13)
  {
    v14 = (unint64_t)v13 >= v10 ? a5 - *a6 : self->_btReadLeftoverEnd - btReadLeftoverPtr;
    memcpy(v9, btReadLeftoverPtr, v14);
    self->_btReadLeftoverPtr += v14;
    v9 += v14;
    if (v10 == v14)
      goto LABEL_26;
  }
  for (i = 0; ; i = v21)
  {
    next_slot = os_channel_get_next_slot();
    if (!next_slot)
      break;
    v21 = next_slot;
    ucat = self->_ucat;
    if (ucat->var0 > 8)
      continue;
    if (ucat->var0 != -1)
      goto LABEL_11;
    if (_LogCategory_Initialize((uint64_t)ucat, 8u))
    {
      ucat = self->_ucat;
LABEL_11:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:]", 8u, (uint64_t)"Read channel slot %p, remain %zu, slotLen %u\n", v17, v18, v19, v20, v21);
      continue;
    }
  }
  v8 = a3;
  v7 = a4;
  if (i)
  {
    v23 = os_channel_advance_slot();
    if ((_DWORD)v23)
    {
      v28 = v23;
      v29 = self->_ucat;
      if (v29->var0 <= 90)
      {
        if (v29->var0 != -1)
          goto LABEL_19;
        if (_LogCategory_Initialize((uint64_t)v29, 0x5Au))
        {
          v29 = self->_ucat;
LABEL_19:
          LogPrintF((uint64_t)v29, (uint64_t)"-[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:]", 0x5Au, (uint64_t)"### Advance rx slot failed: %#m\n", v24, v25, v26, v27, v28);
        }
      }
    }
    v30 = os_channel_sync();
    if ((_DWORD)v30)
    {
      v35 = v30;
      v36 = self->_ucat;
      if (v36->var0 <= 90)
      {
        if (v36->var0 != -1)
          goto LABEL_24;
        if (_LogCategory_Initialize((uint64_t)v36, 0x5Au))
        {
          v36 = self->_ucat;
LABEL_24:
          LogPrintF((uint64_t)v36, (uint64_t)"-[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:]", 0x5Au, (uint64_t)"### Sync rx failed: %#m\n", v31, v32, v33, v34, v35);
        }
      }
    }
  }
LABEL_26:
  *a6 = v9 - v8;
  if (v9 - v8 >= v7)
    return 0;
  else
    return 35;
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_readRequestCurrent || -[NSMutableArray count](self->_readRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _abortReadsWithError:]", 0x1Eu, (uint64_t)"Abort reads: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
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

    -[CUBluetoothScalablePipe _completeReadRequest:error:](self, "_completeReadRequest:error:", v10, v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_readRequests;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      v17 = v10;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v10 = (CUReadRequest *)*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16);

        -[CUBluetoothScalablePipe _completeReadRequest:error:](self, "_completeReadRequest:error:", v10, v8);
        ++v16;
        v17 = v10;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _completeReadRequest:error:]", 9u, (uint64_t)"Read completed: %zu byte(s), %{error}\n", v10, v11, v12, v13, v9);
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
  v7[2] = __44__CUBluetoothScalablePipe_writeWithRequest___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_processWrites
{
  CUWriteRequest **p_writeRequestCurrent;
  int v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LogCategory *ucat;
  uint64_t v15;
  id v16;
  void *v17;
  CUWriteRequest *writeRequestCurrent;
  void *v19;
  uint64_t v20;
  id v21;

  p_writeRequestCurrent = &self->_writeRequestCurrent;
  v4 = 4;
  do
  {
    v5 = *p_writeRequestCurrent;
    if (!v5)
    {
      -[NSMutableArray firstObject](self->_writeRequests, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        v5 = 0;
        goto LABEL_25;
      }
      v5 = (unsigned int *)v15;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0);
      v21 = 0;
      -[CUBluetoothScalablePipe _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v5, &v21);
      v16 = v21;
      if (v16)
      {
        v17 = v16;
        -[CUBluetoothScalablePipe _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v5, v16);
        goto LABEL_12;
      }
      objc_storeStrong((id *)p_writeRequestCurrent, v5);
    }
    v6 = v5[70];
    v13 = -[CUBluetoothScalablePipe _writeIOArray:ioCount:](self, "_writeIOArray:ioCount:", v5 + 68, v5 + 70);
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 != -1)
        goto LABEL_5;
      if (_LogCategory_Initialize((uint64_t)ucat, 9u))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _processWrites]", 9u, (uint64_t)"Write channel, pre-ion %d, post-ion %d, %#m\n", v9, v10, v11, v12, v6);
      }
    }
    if ((_DWORD)v13)
    {
      if ((_DWORD)v13 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }
      else
      {
        NSErrorWithOSStatusF(v13, (uint64_t)"Write failed", v7, v8, v9, v10, v11, v12, v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothScalablePipe _abortWritesWithError:](self, "_abortWritesWithError:", v19);

      }
LABEL_25:

      return;
    }
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

    -[CUBluetoothScalablePipe _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v5, 0);
    v17 = 0;
LABEL_12:

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

    if (gLogCategory_CUBluetoothScalablePipe > 9
      || gLogCategory_CUBluetoothScalablePipe == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBluetoothScalablePipe, 9u))
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _prepareWriteRequest:error:]", 9u, (uint64_t)"Write prepared (%d iov, %zu total)\n", v28, v29, v30, v31, v32);
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

- (int)_writeIOArray:(iovec *)a3 ioCount:(int *)a4
{
  uint64_t v4;
  iovec *v8;
  iovec *v9;
  uint64_t v10;
  unint64_t v11;
  size_t iov_len;
  BOOL v13;
  size_t v14;

  v4 = *a4;
  if (!(_DWORD)v4)
    return 0;
  v8 = *a3;
  v9 = &(*a3)[v4];
  v10 = 16 * v4;
  while (1)
  {
    v11 = -[CUBluetoothScalablePipe _writeBytes:length:](self, "_writeBytes:length:", v8->iov_base, v8->iov_len);
    iov_len = v8->iov_len;
    v13 = iov_len > v11;
    v14 = iov_len - v11;
    if (v13)
      break;
    ++v8;
    v10 -= 16;
    if (!v10)
      return 0;
  }
  v8->iov_base = (char *)v8->iov_base + v11;
  v8->iov_len = v14;
  *a3 = v8;
  *a4 = (unint64_t)((char *)v9 - (char *)v8) >> 4;
  return 35;
}

- (unint64_t)_writeBytes:(const char *)a3 length:(unint64_t)a4
{
  const char *v5;
  uint64_t v7;
  const char *v8;
  uint64_t next_slot;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LogCategory *ucat;
  uint64_t v15;
  uint64_t v16;
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
  LogCategory *v28;

  v5 = a3;
  if (!a4)
    return v5 - a3;
  v7 = 0;
  v8 = &a3[a4];
  v5 = a3;
  while (1)
  {
    next_slot = os_channel_get_next_slot();
    if (!next_slot)
      break;
    v7 = next_slot;
    ucat = self->_ucat;
    if (ucat->var0 <= 8)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 8u))
          goto LABEL_8;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _writeBytes:length:]", 8u, (uint64_t)"Write channel slot %p, remain %zu, slotLen %u\n", v10, v11, v12, v13, v7);
    }
LABEL_8:
    os_channel_set_slot_properties();
    if (v5 == v8)
    {
      v5 = v8;
      goto LABEL_12;
    }
  }
  if (!v7)
    return v5 - a3;
LABEL_12:
  v15 = os_channel_advance_slot();
  if ((_DWORD)v15)
  {
    v20 = v15;
    v21 = self->_ucat;
    if (v21->var0 <= 60)
    {
      if (v21->var0 != -1)
        goto LABEL_15;
      if (_LogCategory_Initialize((uint64_t)v21, 0x3Cu))
      {
        v21 = self->_ucat;
LABEL_15:
        LogPrintF((uint64_t)v21, (uint64_t)"-[CUBluetoothScalablePipe _writeBytes:length:]", 0x3Cu, (uint64_t)"### Advance tx slot failed: %#m\n", v16, v17, v18, v19, v20);
      }
    }
  }
  v22 = os_channel_sync();
  if ((_DWORD)v22)
  {
    v27 = v22;
    v28 = self->_ucat;
    if (v28->var0 <= 60)
    {
      if (v28->var0 != -1)
        goto LABEL_20;
      if (_LogCategory_Initialize((uint64_t)v28, 0x3Cu))
      {
        v28 = self->_ucat;
LABEL_20:
        LogPrintF((uint64_t)v28, (uint64_t)"-[CUBluetoothScalablePipe _writeBytes:length:]", 0x3Cu, (uint64_t)"### Sync tx failed: %#m\n", v23, v24, v25, v26, v27);
      }
    }
  }
  return v5 - a3;
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_writeRequestCurrent || -[NSMutableArray count](self->_writeRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _abortWritesWithError:]", 0x1Eu, (uint64_t)"Abort writes: %{error}\n", v4, v5, v6, v7, (uint64_t)v8);
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

    -[CUBluetoothScalablePipe _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v10, v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_writeRequests;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      v17 = v10;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v10 = (CUWriteRequest *)*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16);

        -[CUBluetoothScalablePipe _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v10, v8);
        ++v16;
        v17 = v10;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe _completeWriteRequest:error:]", 9u, (uint64_t)"Write completed: %{error}\n", v6, v7, v8, v9, (uint64_t)v10);
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

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("hostState"), a4, a5, a6))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__CUBluetoothScalablePipe_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E25DF2A0;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  LogCategory *ucat;
  const char *v13;
  unint64_t v14;
  const char *v15;
  LogCategory *v16;
  void *v17;
  id v18;

  v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = v18;
  if (self->_invalidateCalled)
    goto LABEL_21;
  v11 = objc_msgSend(v18, "state");
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_10;
      ucat = self->_ucat;
    }
    if (v11 > 0xA)
      v13 = "?";
    else
      v13 = off_1E25DC628[v11];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth scalable pipe state changed: %s\n", v7, v8, v9, v10, (uint64_t)v13);
  }
LABEL_10:
  v14 = v11 - 1;
  v4 = v18;
  v15 = "Resetting";
  switch(v14)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      v15 = "Unsupported";
      goto LABEL_14;
    case 2uLL:
      v15 = "Unauthorized";
      goto LABEL_14;
    case 3uLL:
      v15 = "PoweredOff";
LABEL_14:
      v16 = self->_ucat;
      if (v16->var0 > 50)
        goto LABEL_19;
      if (v16->var0 != -1)
        goto LABEL_16;
      if (_LogCategory_Initialize((uint64_t)v16, 0x32u))
      {
        v16 = self->_ucat;
LABEL_16:
        LogPrintF((uint64_t)v16, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManagerDidUpdateState:]", 0x32u, (uint64_t)"Tear down due to %s state\n", v7, v8, v9, v10, (uint64_t)v15);
      }
LABEL_19:
      NSErrorWithOSStatusF(4294960543, (uint64_t)"Bluetooth down (%s)", v5, v6, v7, v8, v9, v10, (uint64_t)v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBluetoothScalablePipe _ensureStopped:](self, "_ensureStopped:", v17);

LABEL_20:
      v4 = v18;
      break;
    case 4uLL:
      -[CUBluetoothScalablePipe _ensureStarted](self, "_ensureStarted");
      goto LABEL_20;
    default:
      break;
  }
LABEL_21:

}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  LogCategory *ucat;
  int var0;
  LogCategory *v14;
  uint64_t v15;
  id v16;

  v16 = a4;
  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    goto LABEL_2;
  if ((objc_msgSend(v16, "isEqual:", self->_identifier) & 1) != 0)
  {
    ucat = self->_ucat;
    var0 = ucat->var0;
    if (v7)
    {
      if (var0 <= 90)
      {
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
            goto LABEL_2;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didRegisterEndpoint:error:]", 0x5Au, (uint64_t)"### didRegisterEndpoint error: %{error}\n", v8, v9, v10, v11, (uint64_t)v7);
      }
      goto LABEL_2;
    }
    if (var0 <= 30)
    {
      v15 = (uint64_t)v16;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_20;
        ucat = self->_ucat;
        v15 = (uint64_t)v16;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didRegisterEndpoint:error:]", 0x1Eu, (uint64_t)"Endpoint registered '%@'\n", v8, v9, v10, v11, v15);
    }
LABEL_20:
    self->_btEndpointRegistered = 1;
    -[CUBluetoothScalablePipe _ensureStarted](self, "_ensureStarted");
    goto LABEL_2;
  }
  v14 = self->_ucat;
  if (v14->var0 <= 30)
  {
    if (v14->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v14, 0x1Eu))
        goto LABEL_2;
      v14 = self->_ucat;
    }
    LogPrintF((uint64_t)v14, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didRegisterEndpoint:error:]", 0x1Eu, (uint64_t)"Ignoring didRegisterEndpoint for unknown identifier ('%@' not '%@'): %{error}\n", v8, v9, v10, v11, (uint64_t)v16);
  }
LABEL_2:

}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  LogCategory *ucat;
  int var0;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  id v18;

  v18 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = v18;
  if (!self->_invalidateCalled)
  {
    v12 = objc_msgSend(v18, "isEqual:", self->_identifier);
    ucat = self->_ucat;
    var0 = ucat->var0;
    if ((v12 & 1) != 0)
    {
      if (var0 <= 30)
      {
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
            goto LABEL_10;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didUnregisterEndpoint:]", 0x1Eu, (uint64_t)"Endpoint unregistered '%@'\n", v8, v9, v10, v11, (uint64_t)v18);
      }
LABEL_10:
      *(_WORD *)&self->_btEndpointRegistering = 0;
      NSErrorWithOSStatusF(4294960543, (uint64_t)"Endpoint unregistered", v6, v7, v8, v9, v10, v11, v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBluetoothScalablePipe _ensureStopped:](self, "_ensureStopped:", v15);

LABEL_11:
      v5 = v18;
      goto LABEL_12;
    }
    v5 = v18;
    if (var0 <= 30)
    {
      if (var0 == -1)
      {
        v16 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
        v5 = v18;
        if (!v16)
          goto LABEL_12;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didUnregisterEndpoint:]", 0x1Eu, (uint64_t)"Ignoring didRegisterEndpoint for unknown identifier ('%@' not '%@')\n", v8, v9, v10, v11, (uint64_t)v5);
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CBScalablePipe *btPipe;
  LogCategory *ucat;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  LogCategory *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  void *v33;
  CBScalablePipe *v34;
  NSUUID *peerIdentifier;
  void *v36;
  NSUUID *v37;
  NSUUID *v38;
  LogCategory *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;

  v47 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = v47;
  if (!self->_invalidateCalled)
  {
    objc_msgSend(v47, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", self->_identifier);

    if ((v8 & 1) != 0)
    {
      btPipe = self->_btPipe;
      if (!btPipe)
        goto LABEL_14;
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
            goto LABEL_13;
          ucat = self->_ucat;
          btPipe = self->_btPipe;
        }
        -[CBScalablePipe name](btPipe, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBScalablePipe peer](self->_btPipe, "peer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "peer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidConnect:]", 0x5Au, (uint64_t)"Pipe connect when already connected: '%@', Peer %@ -> '%@', Peer %@\n", v22, v23, v24, v25, (uint64_t)v17);

      }
LABEL_13:
      NSErrorWithOSStatusF(4294960543, (uint64_t)"Pipe disconnect for re-connect", v9, v10, v11, v12, v13, v14, v45);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBluetoothScalablePipe _abortReadsWithError:](self, "_abortReadsWithError:", v33);
      -[CUBluetoothScalablePipe _abortWritesWithError:](self, "_abortWritesWithError:", v33);
      -[CUBluetoothScalablePipe _tearDownPipe](self, "_tearDownPipe");
      v34 = self->_btPipe;
      self->_btPipe = 0;

      peerIdentifier = self->_peerIdentifier;
      self->_peerIdentifier = 0;

LABEL_14:
      objc_msgSend(v47, "peer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "identifier");
      v37 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v38 = self->_peerIdentifier;
      self->_peerIdentifier = v37;

      v39 = self->_ucat;
      if (v39->var0 <= 30)
      {
        if (v39->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            goto LABEL_19;
          v39 = self->_ucat;
        }
        objc_msgSend(v47, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "type");
        objc_msgSend(v47, "priority");
        LogPrintF((uint64_t)v39, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidConnect:]", 0x1Eu, (uint64_t)"Pipe connected: ID '%@', Peer %@, Type %s, Priority %s\n", v41, v42, v43, v44, (uint64_t)v40);

      }
LABEL_19:
      objc_storeStrong((id *)&self->_btPipe, a4);
      -[CUBluetoothScalablePipe _ensureStarted](self, "_ensureStarted");
      goto LABEL_20;
    }
    v26 = self->_ucat;
    v6 = v47;
    if (v26->var0 <= 30)
    {
      if (v26->var0 != -1)
      {
LABEL_9:
        objc_msgSend(v6, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v26, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidConnect:]", 0x1Eu, (uint64_t)"Ignoring pipeDidConnect for unknown identifier ('%@' not '%@')\n", v28, v29, v30, v31, (uint64_t)v27);

LABEL_20:
        v6 = v47;
        goto LABEL_21;
      }
      v32 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
      v6 = v47;
      if (v32)
      {
        v26 = self->_ucat;
        goto LABEL_9;
      }
    }
  }
LABEL_21:

}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  char v9;
  LogCategory *ucat;
  int var0;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CBScalablePipe *btPipe;
  NSUUID *peerIdentifier;
  uint64_t v32;
  void *v33;
  id v34;

  v34 = a4;
  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    objc_msgSend(v34, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self->_identifier);

    ucat = self->_ucat;
    var0 = ucat->var0;
    if ((v9 & 1) != 0)
    {
      if (var0 <= 30)
      {
        v12 = v34;
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            goto LABEL_10;
          ucat = self->_ucat;
          v12 = v34;
        }
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "peer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidDisconnect:error:]", 0x1Eu, (uint64_t)"Pipe disconnected: ID '%@', Peer %@, %{error}\n", v15, v16, v17, v18, (uint64_t)v13);

      }
LABEL_10:
      v19 = v7;
      if (!v19)
      {
        NSErrorWithOSStatusF(4294960543, (uint64_t)"Pipe disconnected", v24, v25, v26, v27, v28, v29, v32);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[CUBluetoothScalablePipe _abortReadsWithError:](self, "_abortReadsWithError:", v19);
      -[CUBluetoothScalablePipe _abortWritesWithError:](self, "_abortWritesWithError:", v19);
      -[CUBluetoothScalablePipe _tearDownPipe](self, "_tearDownPipe");
      btPipe = self->_btPipe;
      self->_btPipe = 0;

      peerIdentifier = self->_peerIdentifier;
      self->_peerIdentifier = 0;

LABEL_13:
      goto LABEL_14;
    }
    if (var0 <= 30)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          goto LABEL_14;
        ucat = self->_ucat;
      }
      objc_msgSend(v34, "name");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidDisconnect:error:]", 0x1Eu, (uint64_t)"Ignoring pipeDidDisconnect for unknown identifier ('%@' not '%@'): %{error}\n", v20, v21, v22, v23, (uint64_t)v19);
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)label
{
  return self->_label;
}

- (NSUUID)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (int)peerHostState
{
  return self->_peerHostState;
}

- (id)peerHostStateChangedHandler
{
  return self->_peerHostStateChangedHandler;
}

- (void)setPeerHostStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (int)state
{
  return self->_state;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong(&self->_peerHostStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_btPipeManager, 0);
  objc_storeStrong((id *)&self->_btPipe, 0);
}

_BYTE *__74__CUBluetoothScalablePipe_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[40])
    return (_BYTE *)objc_msgSend(result, "_handleBTPeerHostStateChanged");
  return result;
}

void __44__CUBluetoothScalablePipe_writeWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 8))
  {
    v10 = *(_QWORD *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (W)", a3, a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_completeWriteRequest:error:", v10, v13);

  }
  else
  {
    objc_msgSend(*(id *)(v9 + 160), "addObject:", *(_QWORD *)(a1 + 40));
    v11 = *(_DWORD **)(a1 + 32);
    if ((v11[28] & 0x80000000) == 0)
      objc_msgSend(v11, "_processWrites");
  }
}

void __43__CUBluetoothScalablePipe_readWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 8))
  {
    v10 = *(_QWORD *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (R)", a3, a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_completeReadRequest:error:", v10, v13);

  }
  else
  {
    objc_msgSend(*(id *)(v9 + 128), "addObject:", *(_QWORD *)(a1 + 40));
    v11 = *(_DWORD **)(a1 + 32);
    if ((v11[28] & 0x80000000) == 0)
      objc_msgSend(v11, "_processReads");
  }
}

uint64_t __37__CUBluetoothScalablePipe__setupPipe__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processReads");
}

uint64_t __37__CUBluetoothScalablePipe__setupPipe__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processWrites");
}

uint64_t __37__CUBluetoothScalablePipe_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __50__CUBluetoothScalablePipe_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = *(id *)(*(_QWORD *)(a1 + 32) + 200);
  if (v24)
  {
    v8 = *(int **)(*(_QWORD *)(a1 + 32) + 16);
    if (*v8 > 30)
      goto LABEL_9;
    if (*v8 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v8, 0x1Eu))
      {
LABEL_9:
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(v16 + 128);
        *(_QWORD *)(v16 + 128) = v15;

        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(void **)(v19 + 160);
        *(_QWORD *)(v19 + 160) = v18;

        objc_msgSend(*(id *)(a1 + 32), "_ensureStarted");
        v21 = *(_QWORD *)(a1 + 40);
        if (v21)
          (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
        goto LABEL_15;
      }
      v8 = *(int **)(*(_QWORD *)(a1 + 32) + 16);
    }
    LogPrintF((uint64_t)v8, (uint64_t)"-[CUBluetoothScalablePipe activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", v4, v5, v6, v7, v23);
    goto LABEL_9;
  }
  NSErrorWithOSStatusF(4294960591, (uint64_t)"No endpoint identifier", v2, v3, v4, v5, v6, v7, v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(int **)(*(_QWORD *)(a1 + 32) + 16);
  if (*v14 <= 90)
  {
    if (*v14 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v14, 0x5Au))
        goto LABEL_12;
      v14 = *(int **)(*(_QWORD *)(a1 + 32) + 16);
    }
    LogPrintF((uint64_t)v14, (uint64_t)"-[CUBluetoothScalablePipe activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v9, v10, v11, v12, (uint64_t)v13);
  }
LABEL_12:
  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v13);

LABEL_15:
}

@end
