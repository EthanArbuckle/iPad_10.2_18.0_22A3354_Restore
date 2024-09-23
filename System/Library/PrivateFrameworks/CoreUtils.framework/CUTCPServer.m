@implementation CUTCPServer

- (CUTCPServer)init
{
  CUTCPServer *v2;
  CUTCPServer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUTCPServer;
  v2 = -[CUTCPServer init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUTCPServer;
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
  v4.super_class = (Class)CUTCPServer;
  -[CUTCPServer dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t tcpListeningPort;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t flags;
  __CFString *v19;
  CFMutableStringRef v21;
  CFMutableStringRef v22;

  v22 = 0;
  tcpListeningPort = self->_tcpListeningPort;
  -[NSMutableSet count](self->_connections, "count");
  NSAppendPrintF(&v22, (uint64_t)"CUTCPServer port %d, %d connection(s)", v4, v5, v6, v7, v8, v9, tcpListeningPort);
  v10 = v22;
  v17 = v10;
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    v21 = v10;
    NSAppendPrintF(&v21, (uint64_t)", Flags 0x%X", v11, v12, v13, v14, v15, v16, flags);
    v19 = v21;

    v17 = v19;
  }
  return v17;
}

- (id)detailedDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v23;
  CFMutableStringRef v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CFMutableStringRef v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  NSAppendPrintF(&v29, (uint64_t)"%@\n", v2, v3, v4, v5, v6, v7, (uint64_t)self);
  v9 = v29;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_connections;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v18 = v11;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      v21 = v9;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v10);
        v23 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20);
        v24 = v21;
        NSAppendPrintF(&v24, (uint64_t)"    %@\n", v12, v13, v14, v15, v16, v17, v23);
        v9 = v24;

        ++v20;
        v21 = v9;
      }
      while (v18 != v20);
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v18);
  }

  return v9;
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
  v7 = qword_1EE067CF8;
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
  v7[2] = __38__CUTCPServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  int sa_family;
  __uint32_t sin6_scope_id;
  in6_addr *p_sin6_addr;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  OS_dispatch_source *v26;
  OS_dispatch_source *listenerSourceV4;
  NSObject *v28;
  int v29;
  OS_dispatch_source *v30;
  OS_dispatch_source *listenerSourceV6;
  NSObject *v32;
  LogCategory *v33;
  CUBonjourAdvertiser *bonjourAdvertiser;
  void *v35;
  void *v36;
  LogCategory *v37;
  OS_dispatch_source *v38;
  NSObject *v39;
  OS_dispatch_source *v40;
  OS_dispatch_source *v41;
  NSObject *v42;
  OS_dispatch_source *v43;
  const char *v45;
  uint64_t v46;
  _QWORD v47[5];
  int v48;
  _QWORD v49[5];
  int v50;
  _QWORD v51[5];
  int v52;
  _QWORD handler[5];
  int v54;
  int v55;
  int v56;

  v55 = -1;
  v56 = -1;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPServer activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate\n", v5, v6, v7, v8, v46);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  sa_family = self->_interfaceAddress.sa.sa_family;
  if (sa_family == 30)
  {
    p_sin6_addr = &self->_interfaceAddress.v6.sin6_addr;
    sin6_scope_id = self->_interfaceAddress.v6.sin6_scope_id;
    v13 = &v55;
LABEL_9:
    v14 = ServerSocketOpenEx2(sa_family, 1, 6, (__int128 *)p_sin6_addr, sin6_scope_id, self->_tcpListenPort, (unsigned int *)&self->_tcpListeningPort, -1, 0, v13);
    if ((_DWORD)v14)
    {
      NSErrorWithOSStatusF(v14, (uint64_t)"Open server socket failed (%##a)", v15, v16, v17, v18, v19, v20, (uint64_t)&self->_interfaceAddress);
LABEL_57:
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_12;
  }
  if (sa_family == 2)
  {
    sin6_scope_id = 0;
    p_sin6_addr = (in6_addr *)&self->_interfaceAddress.v6.sin6_flowinfo;
    v13 = &v56;
    goto LABEL_9;
  }
  v21 = ServerSocketPairOpen(1, 6, self->_tcpListenPort, &self->_tcpListeningPort, -1, &v56, &v55);
  if ((_DWORD)v21)
  {
    v45 = "Open server sockets failed";
    goto LABEL_56;
  }
LABEL_12:
  v24 = v56;
  v25 = MEMORY[0x1E0C809B0];
  if ((v56 & 0x80000000) == 0)
  {
    if ((self->_flags & 1) != 0)
      SocketSetP2P(v56, 1);
    v26 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], v24, 0, (dispatch_queue_t)self->_dispatchQueue);
    if (!v26)
    {
      v45 = "Create V4 dispatch source failed";
LABEL_54:
      v21 = 4294960596;
LABEL_56:
      NSErrorWithOSStatusF(v21, (uint64_t)v45, v22, v23, v17, v18, v19, v20, v46);
      goto LABEL_57;
    }
    listenerSourceV4 = self->_listenerSourceV4;
    self->_listenerSourceV4 = v26;
    v28 = v26;

    handler[0] = v25;
    handler[1] = 3221225472;
    handler[2] = __44__CUTCPServer_activateDirectAndReturnError___block_invoke;
    handler[3] = &unk_1E25DE500;
    handler[4] = self;
    v54 = v24;
    dispatch_source_set_event_handler(v28, handler);
    v51[0] = v25;
    v51[1] = 3221225472;
    v51[2] = __44__CUTCPServer_activateDirectAndReturnError___block_invoke_2;
    v51[3] = &unk_1E25DE500;
    v52 = v24;
    v51[4] = self;
    dispatch_source_set_cancel_handler(v28, v51);
    dispatch_activate(v28);
    v56 = -1;

  }
  v29 = v55;
  if (v55 < 0)
    goto LABEL_22;
  if ((self->_flags & 1) != 0)
    SocketSetP2P(v55, 1);
  v30 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], v29, 0, (dispatch_queue_t)self->_dispatchQueue);
  if (!v30)
  {
    v45 = "Create V6 dispatch source failed";
    goto LABEL_54;
  }
  listenerSourceV6 = self->_listenerSourceV6;
  self->_listenerSourceV6 = v30;
  v32 = v30;

  v49[0] = v25;
  v49[1] = 3221225472;
  v49[2] = __44__CUTCPServer_activateDirectAndReturnError___block_invoke_3;
  v49[3] = &unk_1E25DE500;
  v49[4] = self;
  v50 = v29;
  dispatch_source_set_event_handler(v32, v49);
  v47[0] = v25;
  v47[1] = 3221225472;
  v47[2] = __44__CUTCPServer_activateDirectAndReturnError___block_invoke_4;
  v47[3] = &unk_1E25DE500;
  v48 = v29;
  v47[4] = self;
  dispatch_source_set_cancel_handler(v32, v47);
  dispatch_activate(v32);
  v55 = -1;

LABEL_22:
  v33 = self->_ucat;
  if (v33->var0 <= 30)
  {
    if (v33->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v33, 0x1Eu))
        goto LABEL_26;
      v33 = self->_ucat;
    }
    LogPrintF((uint64_t)v33, (uint64_t)"-[CUTCPServer activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activated on port %d\n", v17, v18, v19, v20, self->_tcpListeningPort);
  }
LABEL_26:
  bonjourAdvertiser = self->_bonjourAdvertiser;
  if (bonjourAdvertiser)
  {
    -[CUBonjourAdvertiser label](bonjourAdvertiser, "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {

    }
    else if (self->_label)
    {
      -[CUBonjourAdvertiser setLabel:](self->_bonjourAdvertiser, "setLabel:");
    }
    -[CUBonjourAdvertiser setPort:](self->_bonjourAdvertiser, "setPort:", self->_tcpListeningPort);
    -[CUBonjourAdvertiser activate](self->_bonjourAdvertiser, "activate");
  }
  v36 = 0;
LABEL_33:
  if ((v56 & 0x80000000) == 0 && close(v56) && *__error())
    __error();
  if ((v55 & 0x80000000) == 0 && close(v55) && *__error())
    __error();
  if (v36)
  {
    v37 = self->_ucat;
    if (v37->var0 > 60)
      goto LABEL_46;
    if (v37->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x3Cu))
      {
LABEL_46:
        v38 = self->_listenerSourceV4;
        if (v38)
        {
          v39 = v38;
          dispatch_source_cancel(v39);
          v40 = self->_listenerSourceV4;
          self->_listenerSourceV4 = 0;

          v41 = self->_listenerSourceV4;
          if (v41)
          {
            v42 = v41;
            dispatch_source_cancel(v42);
            v43 = self->_listenerSourceV4;
            self->_listenerSourceV4 = 0;

          }
        }
        if (a3)
          *a3 = objc_retainAutorelease(v36);
        goto LABEL_51;
      }
      v37 = self->_ucat;
    }
    LogPrintF((uint64_t)v37, (uint64_t)"-[CUTCPServer activateDirectAndReturnError:]", 0x3Cu, (uint64_t)"### Activate failed: %{error}\n", v17, v18, v19, v20, (uint64_t)v36);
    goto LABEL_46;
  }
LABEL_51:

  return v36 == 0;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CUTCPServer_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  void (**invalidationHandler)(void);
  id connectionAcceptHandler;
  id connectionStartedHandler;
  id connectionEndedHandler;
  id connectionPrepareHandler;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  LogCategory *v18;
  uint64_t v19;
  uint64_t v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone)
    return;
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPServer _invalidated]", 0x3Cu, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v19);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  if (!self->_bonjourAdvertiser
    && !self->_listenerSourceV4
    && !self->_listenerSourceV6
    && !-[NSMutableSet count](self->_connections, "count"))
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    connectionAcceptHandler = self->_connectionAcceptHandler;
    self->_connectionAcceptHandler = 0;

    connectionStartedHandler = self->_connectionStartedHandler;
    self->_connectionStartedHandler = 0;

    connectionEndedHandler = self->_connectionEndedHandler;
    self->_connectionEndedHandler = 0;

    connectionPrepareHandler = self->_connectionPrepareHandler;
    self->_connectionPrepareHandler = 0;

    v13 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    v18 = self->_ucat;
    if (v18->var0 <= 30)
    {
      if (v18->var0 != -1)
      {
LABEL_15:
        LogPrintF((uint64_t)v18, (uint64_t)"-[CUTCPServer _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v14, v15, v16, v17, v20);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v18, 0x1Eu))
      {
        v18 = self->_ucat;
        goto LABEL_15;
      }
    }
  }
}

- (void)_handleConnectionAccept:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LogCategory *v10;
  void *v11;
  void *v12;
  CUTCPConnection *v13;
  void (**connectionPrepareHandler)(id, CUTCPConnection *);
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSMutableSet *connections;
  NSMutableSet *v22;
  NSMutableSet *v23;
  void (**connectionStartedHandler)(id, CUTCPConnection *);
  LogCategory *ucat;
  LogCategory *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  LogCategory *v31;
  id v32;
  _QWORD v33[5];
  CUTCPConnection *v34;
  _BYTE v35[28];
  socklen_t v36;
  sockaddr v37[2];

  memset(v37, 0, 28);
  v36 = 28;
  v8 = accept(a3, v37, &v36);
  if ((v8 & 0x80000000) != 0)
  {
    if (*__error())
    {
      v9 = *__error();
      if (!(_DWORD)v9)
        goto LABEL_4;
    }
    else
    {
      v9 = 4294960596;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_31;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPServer _handleConnectionAccept:]", 0x1Eu, (uint64_t)"### accept() failed: %#m\n", v4, v5, v6, v7, v9);
    }
LABEL_31:
    v20 = 0;
    goto LABEL_32;
  }
LABEL_4:
  v10 = self->_ucat;
  if (v10->var0 <= 30)
  {
    if (v10->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x1Eu))
        goto LABEL_8;
      v10 = self->_ucat;
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUTCPServer _handleConnectionAccept:]", 0x1Eu, (uint64_t)"Connection started from %##a\n", v4, v5, v6, v7, (uint64_t)v37);
  }
LABEL_8:
  if (!self->_maxConnectionCount
    || -[NSMutableSet count](self->_connections, "count") < (unint64_t)self->_maxConnectionCount)
  {
    v11 = _Block_copy(self->_connectionAcceptHandler);
    if (v11)
    {
      v12 = v11;
      (*((void (**)(void *, uint64_t))v11 + 2))(v11, v8);

      return;
    }
    v13 = objc_alloc_init(CUTCPConnection);
    -[CUTCPConnection setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
    -[CUTCPConnection setFlags:](v13, "setFlags:", self->_flags);
    if (self->_label)
      -[CUTCPConnection setLabel:](v13, "setLabel:");
    -[CUTCPConnection setNetLinkManager:](v13, "setNetLinkManager:", self->_netLinkManager);
    -[CUTCPConnection setSocketFD:](v13, "setSocketFD:", v8);
    if ((self->_flags & 0x40) == 0)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __39__CUTCPServer__handleConnectionAccept___block_invoke;
      v33[3] = &unk_1E25DE138;
      v33[4] = self;
      v34 = v13;
      *(sockaddr *)v35 = v37[0];
      *(sockaddr *)&v35[12] = *(sockaddr *)&v37[0].sa_data[10];
      -[CUTCPConnection setServerInvalidationHandler:](v34, "setServerInvalidationHandler:", v33);

    }
    connectionPrepareHandler = (void (**)(id, CUTCPConnection *))self->_connectionPrepareHandler;
    if (connectionPrepareHandler)
      connectionPrepareHandler[2](connectionPrepareHandler, v13);
    v32 = 0;
    v15 = -[CUTCPConnection activateDirectAndReturnError:](v13, "activateDirectAndReturnError:", &v32);
    v20 = v32;
    if (!v15)
    {
      v31 = self->_ucat;
      if (v31->var0 <= 30)
      {
        if (v31->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v31, 0x1Eu))
            goto LABEL_33;
          v31 = self->_ucat;
        }
        LogPrintF((uint64_t)v31, (uint64_t)"-[CUTCPServer _handleConnectionAccept:]", 0x1Eu, (uint64_t)"### Activate accepted connection failed: %{error}\n", v16, v17, v18, v19, (uint64_t)v20);
      }
LABEL_33:
      -[CUTCPConnection invalidate](v13, "invalidate");

      return;
    }
    if ((self->_flags & 0x40) == 0)
    {
      connections = self->_connections;
      if (!connections)
      {
        v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v23 = self->_connections;
        self->_connections = v22;

        connections = self->_connections;
      }
      -[NSMutableSet addObject:](connections, "addObject:", v13);
    }
    connectionStartedHandler = (void (**)(id, CUTCPConnection *))self->_connectionStartedHandler;
    if (connectionStartedHandler)
      connectionStartedHandler[2](connectionStartedHandler, v13);

LABEL_32:
    v13 = 0;
    goto LABEL_33;
  }
  v26 = self->_ucat;
  if (v26->var0 <= 60)
  {
    if (v26->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x3Cu))
        goto LABEL_43;
      v26 = self->_ucat;
    }
    -[NSMutableSet count](self->_connections, "count");
    LogPrintF((uint64_t)v26, (uint64_t)"-[CUTCPServer _handleConnectionAccept:]", 0x3Cu, (uint64_t)"### Rejecting connection from %##a when at limit of %d\n", v27, v28, v29, v30, (uint64_t)v37);
  }
LABEL_43:
  objc_msgSend(0, "invalidate");
  if ((v8 & 0x80000000) == 0 && close(v8) && *__error())
    __error();
}

- (void)_handleConnectionInvalidated:(id)a3 addr:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  _BOOL4 v12;
  void (**connectionEndedHandler)(id, id, _QWORD);
  id v14;

  v6 = a3;
  ucat = self->_ucat;
  v14 = v6;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPServer _handleConnectionInvalidated:addr:]", 0x1Eu, (uint64_t)"Connection ended from %##a\n", v7, v8, v9, v10, (uint64_t)a4);
      v6 = v14;
      goto LABEL_5;
    }
    v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    v6 = v14;
    if (v12)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v6);
  connectionEndedHandler = (void (**)(id, id, _QWORD))self->_connectionEndedHandler;
  if (connectionEndedHandler)
    connectionEndedHandler[2](connectionEndedHandler, v14, 0);

}

- (CUBonjourAdvertiser)bonjourAdvertiser
{
  return self->_bonjourAdvertiser;
}

- (void)setBonjourAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourAdvertiser, a3);
}

- (id)connectionAcceptHandler
{
  return self->_connectionAcceptHandler;
}

- (void)setConnectionAcceptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)connectionStartedHandler
{
  return self->_connectionStartedHandler;
}

- (void)setConnectionStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)connectionEndedHandler
{
  return self->_connectionEndedHandler;
}

- (void)setConnectionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)connectionPrepareHandler
{
  return self->_connectionPrepareHandler;
}

- (void)setConnectionPrepareHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)interfaceAddress
{
  retstr->var0 = *(sockaddr *)&self[4].var2.sin6_scope_id;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = self[5].var2.sin6_addr;
  return self;
}

- (void)setInterfaceAddress:(id *)a3
{
  sockaddr var0;

  var0 = a3->var0;
  *(in6_addr *)((char *)&self->_interfaceAddress.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_interfaceAddress.sa = var0;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)maxConnectionCount
{
  return self->_maxConnectionCount;
}

- (void)setMaxConnectionCount:(unsigned int)a3
{
  self->_maxConnectionCount = a3;
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setNetLinkManager:(id)a3
{
  objc_storeStrong((id *)&self->_netLinkManager, a3);
}

- (int)tcpListenPort
{
  return self->_tcpListenPort;
}

- (void)setTcpListenPort:(int)a3
{
  self->_tcpListenPort = a3;
}

- (int)tcpListeningPort
{
  return self->_tcpListeningPort;
}

- (void)setTcpListeningPort:(int)a3
{
  self->_tcpListeningPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netLinkManager, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectionPrepareHandler, 0);
  objc_storeStrong(&self->_connectionEndedHandler, 0);
  objc_storeStrong(&self->_connectionStartedHandler, 0);
  objc_storeStrong(&self->_connectionAcceptHandler, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
  objc_storeStrong((id *)&self->_listenerSourceV6, 0);
  objc_storeStrong((id *)&self->_listenerSourceV4, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

uint64_t __39__CUTCPServer__handleConnectionAccept___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionInvalidated:addr:", *(_QWORD *)(a1 + 40), a1 + 48);
}

uint64_t __25__CUTCPServer_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v8 + 16))
    return result;
  v9 = result;
  *(_BYTE *)(v8 + 16) = 1;
  v10 = *(_QWORD *)(result + 32);
  v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      v10 = *(_QWORD *)(v9 + 32);
      if (!v12)
        goto LABEL_6;
      v11 = *(int **)(v10 + 40);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUTCPServer invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v23);
    v10 = *(_QWORD *)(v9 + 32);
  }
LABEL_6:
  objc_msgSend(*(id *)(v10 + 64), "invalidate");
  v13 = *(_QWORD *)(v9 + 32);
  v14 = *(void **)(v13 + 64);
  *(_QWORD *)(v13 + 64) = 0;

  v15 = *(_QWORD *)(v9 + 32);
  v16 = *(NSObject **)(v15 + 24);
  if (v16)
  {
    dispatch_source_cancel(v16);
    v15 = *(_QWORD *)(v9 + 32);
  }
  v17 = *(NSObject **)(v15 + 32);
  if (v17)
  {
    dispatch_source_cancel(v17);
    v15 = *(_QWORD *)(v9 + 32);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = *(id *)(v15 + 8);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "invalidate", (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v20);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 8), "removeAllObjects");
  return objc_msgSend(*(id *)(v9 + 32), "_invalidated");
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionAccept:", *(unsigned int *)(a1 + 40));
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  close(*(_DWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionAccept:", *(unsigned int *)(a1 + 40));
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  close(*(_DWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __38__CUTCPServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "activateDirectAndReturnError:", &v5);
  v3 = v5;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

@end
