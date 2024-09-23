@implementation CUFileClient

- (CUFileClient)init
{
  CUFileClient *v2;
  CUFileClient *v3;
  CUFileClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUFileClient;
  v2 = -[CUFileClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUFileClient;
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
  v4.super_class = (Class)CUFileClient;
  -[CUFileClient dealloc](&v4, sel_dealloc);
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
  v7 = qword_1EE066B60;
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
  v7[2] = __39__CUFileClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  id activateCompletion;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD aBlock[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2986;
  v24 = __Block_byref_object_dispose__2987;
  v25 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CUFileClient__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E25DE160;
  v19 = &v20;
  aBlock[4] = self;
  v5 = v4;
  v18 = v5;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!self->_destinationID)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No destination ID", v6, v7, v8, v9, v10, v16);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = (void *)v21[5];
    v21[5] = v14;

    goto LABEL_5;
  }
  if (!self->_serviceType)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No service type", v6, v7, v8, v9, v10, v16);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (self->_activateCalled)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960575, (uint64_t)"Activate already called", v6, v7, v8, v9, v10, v16);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  self->_activateCalled = 1;
  v12 = _Block_copy(v5);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = v12;

  -[CUFileClient _run](self, "_run");
LABEL_5:
  v11[2](v11);

  _Block_object_dispose(&v20, 8);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CUFileClient_invalidate__block_invoke;
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
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSMutableArray *queryArray;
  OS_dispatch_source *sessionTimer;
  NSObject *v23;
  OS_dispatch_source *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _invalidate]", 0x1Eu, (uint64_t)"Invalidate", v2, v3, v4, v5, v25);
  }
LABEL_6:
  if (self->_sessionID)
    -[CUFileClient _sendSessionStop](self, "_sendSessionStop");
  else
    -[RPCompanionLinkClient invalidate](self->_clinkClient, "invalidate");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_queryArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v15 = v9;
    v16 = *(_QWORD *)v26;
    v17 = (void *)*MEMORY[0x1E0CB2F90];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v8);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        NSErrorF_safe(v17, 4294896148, (uint64_t)"Invalidated", v10, v11, v12, v13, v14, v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUFileClient _completeQuery:response:error:](self, "_completeQuery:response:error:", v19, 0, v20);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  -[NSMutableArray removeAllObjects](self->_queryArray, "removeAllObjects");
  queryArray = self->_queryArray;
  self->_queryArray = 0;

  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    v23 = sessionTimer;
    dispatch_source_cancel(v23);
    v24 = self->_sessionTimer;
    self->_sessionTimer = 0;

  }
  -[CUFileClient _invalidated](self, "_invalidated", (_QWORD)v25);
}

- (void)_invalidated
{
  id invalidationHandler;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  LogCategory *ucat;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_clinkClient
    && !self->_queryArray
    && !self->_currentQuery
    && !self->_sessionID)
  {
    v12 = _Block_copy(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v8 = v12;
    if (v12)
    {
      (*((void (**)(void *))v12 + 2))(v12);
      v8 = v12;
    }
    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_14;
    if (ucat->var0 == -1)
    {
      v10 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
      v8 = v12;
      if (!v10)
        goto LABEL_14;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _invalidated]", 0x1Eu, (uint64_t)"Invalidated", v4, v5, v6, v7, v11);
    v8 = v12;
LABEL_14:

  }
}

- (void)performQuery:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CUFileClient *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__CUFileClient_performQuery___block_invoke;
  v7[3] = &unk_1E25DE628;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_completeQuery:(id)a3 response:(id)a4 error:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  LogCategory *ucat;
  int var0;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  CUFileQuery *v19;

  v19 = (CUFileQuery *)a3;
  v8 = a4;
  v13 = a5;
  ucat = self->_ucat;
  var0 = ucat->var0;
  if (v13)
  {
    if (var0 > 90)
      goto LABEL_12;
    v16 = (uint64_t)v19;
    if (var0 != -1)
      goto LABEL_4;
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      v16 = (uint64_t)v19;
LABEL_4:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _completeQuery:response:error:]", 0x5Au, (uint64_t)"### Query failed: %@, %{error}", v9, v10, v11, v12, v16);
    }
  }
  else
  {
    if (var0 > 30)
      goto LABEL_12;
    v17 = (uint64_t)v19;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_12;
      ucat = self->_ucat;
      v17 = (uint64_t)v19;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _completeQuery:response:error:]", 0x1Eu, (uint64_t)"Query completed: %@, %@", v9, v10, v11, v12, v17);
  }
LABEL_12:
  -[CUFileQuery completionHandler](v19, "completionHandler");
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[CUFileQuery setCompletionHandler:](v19, "setCompletionHandler:", 0);
    ((void (**)(_QWORD, id, id))v18)[2](v18, v8, v13);
  }

  if (self->_currentQuery == v19)
  {
    self->_currentQuery = 0;

    -[CUFileClient _run](self, "_run");
  }

}

- (void)_reportError:(id)a3 where:(const char *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LogCategory *ucat;
  void (**v11)(void *, id);
  id activateCompletion;
  id v13;

  v13 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _reportError:where:]", 0x5Au, (uint64_t)"### Error: %s, %{error}", v6, v7, v8, v9, (uint64_t)a4);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  self->_state = 3;
  v11 = (void (**)(void *, id))_Block_copy(self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v11)
    v11[2](v11, v13);

}

- (void)_sendKeepAlive:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  void *v12;
  NSNumber *sessionID;
  void *v14;
  RPCompanionLinkClient *clinkClient;
  _QWORD v16[5];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _sendKeepAlive:]", 0x14u, (uint64_t)"Keep alive request: %.3f delta seconds", v5, v6, v7, v8, *(uint64_t *)&a3);
  }
LABEL_5:
  NSPrintF((uint64_t)"FSKA:%@", (uint64_t)a2, v3, v4, v5, v6, v7, v8, (uint64_t)self->_serviceType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sessionID = self->_sessionID;
  v17 = CFSTR("sid");
  v18[0] = sessionID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  clinkClient = self->_clinkClient;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __31__CUFileClient__sendKeepAlive___block_invoke;
  v16[3] = &unk_1E25DC7D0;
  v16[4] = self;
  -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](clinkClient, "sendRequestID:request:options:responseHandler:", v12, v14, 0, v16);
  self->_lastRequestTicks = mach_absolute_time();

}

- (void)_sendSessionStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RPCompanionLinkClient *clinkClient;
  uint64_t v15;
  _QWORD v16[5];
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _sendSessionStop]", 0x1Eu, (uint64_t)"Session stop", v4, v5, v6, v7, v15);
  }
LABEL_5:
  NSPrintF((uint64_t)"FSSp:%@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_serviceType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("sid");
  v20[0] = self->_sessionID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  getRPOptionTimeoutSeconds[0]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  v18 = &unk_1E25FD1A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  clinkClient = self->_clinkClient;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __32__CUFileClient__sendSessionStop__block_invoke;
  v16[3] = &unk_1E25DC7D0;
  v16[4] = self;
  -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](clinkClient, "sendRequestID:request:options:responseHandler:", v10, v11, v13, v16);
  self->_lastRequestTicks = mach_absolute_time();

}

- (void)_sessionTimerFired
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  LogCategory *ucat;
  NSObject *sessionTimer;
  dispatch_time_t v11;

  v7 = mach_absolute_time() - self->_lastRequestTicks;
  if (sUpTicksToSecondsOnce != -1)
    dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
  v8 = 15.0 - *(double *)&sUpTicksToSecondsMultiplier * (double)v7;
  if (v8 <= 45.0)
  {
    -[CUFileClient _sendKeepAlive:](self, "_sendKeepAlive:");
    v8 = 15.0;
  }
  else
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 20)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u))
          goto LABEL_8;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _sessionTimerFired]", 0x14u, (uint64_t)"Keep alive deferred: %.3f seconds", v3, v4, v5, v6, *(uint64_t *)&v8);
    }
  }
LABEL_8:
  sessionTimer = self->_sessionTimer;
  v11 = dispatch_time(0, (unint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(sessionTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
}

- (void)_run
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t state;
  int v8;
  LogCategory *ucat;
  const char *v10;

  if (self->_activateCalled && !self->_invalidateCalled)
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
              break;
            case 10:
              self->_state = 11;
              -[CUFileClient _runCLinkActivate](self, "_runCLinkActivate");
              goto LABEL_15;
            case 11:
              if (!self->_clinkActivated)
                goto LABEL_15;
              v8 = 12;
              break;
            case 12:
              self->_state = 13;
              -[CUFileClient _runSessionStartRequest](self, "_runSessionStartRequest");
              goto LABEL_15;
            case 13:
              if (!self->_sessionID)
                goto LABEL_15;
              v8 = 14;
              break;
            case 14:
              self->_state = 15;
              -[CUFileClient _runPrepare](self, "_runPrepare");
              goto LABEL_15;
            case 15:
              -[CUFileClient _runQueries](self, "_runQueries");
              goto LABEL_15;
            default:
              goto LABEL_15;
          }
          self->_state = v8;
LABEL_15:
          if (self->_state == state)
            return;
          ucat = self->_ucat;
        }
        while (ucat->var0 > 30);
        if (ucat->var0 == -1)
          break;
LABEL_18:
        v10 = "?";
        if (state <= 0xF)
          v10 = off_1E25DC928[state];
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _run]", 0x1Eu, (uint64_t)"State: %s -> %s", v2, v3, v4, v5, (uint64_t)v10);
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_18;
      }
    }
  }
}

- (void)_runCLinkActivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  RPCompanionLinkClient *v8;
  RPCompanionLinkClient *clinkClient;
  RPCompanionLinkClient *v10;
  id v11;
  uint64_t v12;
  uint64_t v13[6];
  _QWORD v14[6];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _runCLinkActivate]", 0x1Eu, (uint64_t)"CLink activate start", v2, v3, v4, v5, v13[0]);
  }
LABEL_5:
  self->_clinkActivated = 0;
  -[RPCompanionLinkClient invalidate](self->_clinkClient, "invalidate");
  v8 = (RPCompanionLinkClient *)objc_alloc_init((Class)getRPCompanionLinkClientClass[0]());
  clinkClient = self->_clinkClient;
  self->_clinkClient = v8;
  v10 = v8;

  -[RPCompanionLinkClient setDispatchQueue:](v10, "setDispatchQueue:", self->_dispatchQueue);
  v11 = objc_alloc_init((Class)getRPCompanionLinkDeviceClass[0]());
  objc_msgSend(v11, "setIdentifier:", self->_destinationID);
  -[RPCompanionLinkClient setDestinationDevice:](v10, "setDestinationDevice:", v11);
  v12 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__CUFileClient__runCLinkActivate__block_invoke;
  v14[3] = &unk_1E25DE628;
  v14[4] = v10;
  v14[5] = self;
  -[RPCompanionLinkClient setInvalidationHandler:](v10, "setInvalidationHandler:", v14);
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = (uint64_t)__33__CUFileClient__runCLinkActivate__block_invoke_2;
  v13[3] = (uint64_t)&unk_1E25DCCA8;
  v13[4] = (uint64_t)v10;
  v13[5] = (uint64_t)self;
  -[RPCompanionLinkClient activateWithCompletion:](v10, "activateWithCompletion:", v13);

}

- (void)_runSessionStartRequest
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  NSNumber *sessionID;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  RPCompanionLinkClient *clinkClient;
  uint64_t v18;
  _QWORD v19[5];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _runSessionStartRequest]", 0x1Eu, (uint64_t)"Session start request", v2, v3, v4, v5, v18);
  }
LABEL_5:
  sessionID = self->_sessionID;
  self->_sessionID = 0;

  NSPrintF((uint64_t)"FSSr:%@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)self->_serviceType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  clinkClient = self->_clinkClient;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __39__CUFileClient__runSessionStartRequest__block_invoke;
  v19[3] = &unk_1E25DC7D0;
  v19[4] = self;
  -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](clinkClient, "sendRequestID:request:options:responseHandler:", v16, MEMORY[0x1E0C9AA70], 0, v19);
  self->_lastRequestTicks = mach_absolute_time();

}

- (void)_runSessionStartResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  LogCategory *ucat;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _QWORD aBlock[6];
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2986;
  v33 = __Block_byref_object_dispose__2987;
  v34 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__CUFileClient__runSessionStartResponse_error___block_invoke;
  aBlock[3] = &unk_1E25DC8C0;
  aBlock[4] = self;
  aBlock[5] = &v29;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v6 && !v7)
  {
    NSDictionaryGetNSNumber(v6, (uint64_t)CFSTR("sid"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No session ID", v14, v15, v16, v17, v18, v27);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v30[5];
      v30[5] = (id)v25;

      v19 = 0;
      goto LABEL_9;
    }
    objc_storeStrong((id *)&self->_sessionID, v19);
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_8;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _runSessionStartResponse:error:]", 0x1Eu, (uint64_t)"Session started: ID %@", v20, v21, v22, v23, (uint64_t)v19);
    }
LABEL_8:
    -[CUFileClient _run](self, "_run");
LABEL_9:

    goto LABEL_10;
  }
  v19 = v7;
  if (!v7)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"No response, no error", v8, v9, v10, v11, v12, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong(v30 + 5, v19);
  if (!v7)
    goto LABEL_9;
LABEL_10:
  v13[2](v13);

  _Block_object_dispose(&v29, 8);
}

- (void)_runPrepare
{
  OS_dispatch_source *sessionTimer;
  id *p_sessionTimer;
  NSObject *v5;
  id v6;
  dispatch_source_t v7;
  dispatch_time_t v8;
  void (**v9)(void *, _QWORD);
  id activateCompletion;
  _QWORD v11[6];

  p_sessionTimer = (id *)&self->_sessionTimer;
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    v5 = sessionTimer;
    dispatch_source_cancel(v5);
    v6 = *p_sessionTimer;
    *p_sessionTimer = 0;

  }
  v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong(p_sessionTimer, v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__CUFileClient__runPrepare__block_invoke;
  v11[3] = &unk_1E25DE628;
  v11[4] = v7;
  v11[5] = self;
  dispatch_source_set_event_handler(v7, v11);
  v8 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
  dispatch_activate(v7);
  v9 = (void (**)(void *, _QWORD))_Block_copy(self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v9)
    v9[2](v9, 0);

}

- (void)_runQueries
{
  CUFileQuery **p_currentQuery;
  void *v4;
  void *v5;

  p_currentQuery = &self->_currentQuery;
  if (!self->_currentQuery)
  {
    -[NSMutableArray popFirstObject](self->_queryArray, "popFirstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_storeStrong((id *)p_currentQuery, v4);
      -[CUFileClient _runSendQuery:](self, "_runSendQuery:", v5);
      v4 = v5;
    }

  }
}

- (void)_runSendQuery:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  LogCategory *ucat;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSNumber *sessionID;
  void *v20;
  RPCompanionLinkClient *clinkClient;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileClient _runSendQuery:]", 0x1Eu, (uint64_t)"Query start: %@", v4, v5, v6, v7, (uint64_t)v8);
  }
LABEL_5:
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "encodeWithDictionary:", v10);
  NSPrintF((uint64_t)"FSQy:%@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)self->_serviceType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = CFSTR("fQry");
  v25[1] = CFSTR("sid");
  sessionID = self->_sessionID;
  v26[0] = v10;
  v26[1] = sessionID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  clinkClient = self->_clinkClient;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __30__CUFileClient__runSendQuery___block_invoke;
  v23[3] = &unk_1E25DC7F8;
  v23[4] = self;
  v24 = v8;
  v22 = v8;
  -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](clinkClient, "sendRequestID:request:options:responseHandler:", v18, v20, 0, v23);
  self->_lastRequestTicks = mach_absolute_time();

}

- (void)_runQueryResponse:(id)a3 query:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  CUFileResponse *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = v8;
  if (!v16 || v10)
  {
    if (v10)
    {
      -[CUFileClient _completeQuery:response:error:](self, "_completeQuery:response:error:", v9, 0, v10);
    }
    else
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"No response, no error", v11, v12, v13, v14, v15, v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUFileClient _completeQuery:response:error:](self, "_completeQuery:response:error:", v9, 0, v19);

    }
  }
  else
  {
    v21 = 0;
    v17 = -[CUFileResponse initWithDictionary:error:]([CUFileResponse alloc], "initWithDictionary:error:", v16, &v21);
    v18 = v21;
    -[CUFileClient _completeQuery:response:error:](self, "_completeQuery:response:error:", v9, v17, v18);

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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_queryArray, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

uint64_t __30__CUFileClient__runSendQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runQueryResponse:query:error:", a2, *(_QWORD *)(a1 + 40), a4);
}

_QWORD *__27__CUFileClient__runPrepare__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[10])
    return (_QWORD *)objc_msgSend(result, "_sessionTimerFired");
  return result;
}

uint64_t __47__CUFileClient__runSessionStartResponse_error___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  int *v12;
  _BOOL4 v13;

  v8 = *(_QWORD *)(result + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(v8 + 8) + 40);
  if (v9)
  {
    v10 = result;
    v11 = *(uint64_t **)(result + 32);
    v12 = (int *)v11[12];
    if (*v12 <= 90)
    {
      if (*v12 == -1)
      {
        v13 = _LogCategory_Initialize(v11[12], 0x5Au);
        v11 = *(uint64_t **)(v10 + 32);
        v8 = *(_QWORD *)(v10 + 40);
        if (!v13)
          return objc_msgSend(v11, "_reportError:where:", *(_QWORD *)(*(_QWORD *)(v8 + 8) + 40), "Session start");
        v12 = (int *)v11[12];
        v9 = *(_QWORD *)(*(_QWORD *)(v8 + 8) + 40);
      }
      LogPrintF((uint64_t)v12, (uint64_t)"-[CUFileClient _runSessionStartResponse:error:]_block_invoke", 0x5Au, (uint64_t)"### Session start failed: %{error}", a5, a6, a7, a8, v9);
      v11 = *(uint64_t **)(v10 + 32);
      v8 = *(_QWORD *)(v10 + 40);
    }
    return objc_msgSend(v11, "_reportError:where:", *(_QWORD *)(*(_QWORD *)(v8 + 8) + 40), "Session start");
  }
  return result;
}

uint64_t __39__CUFileClient__runSessionStartRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runSessionStartResponse:error:", a2);
}

uint64_t __33__CUFileClient__runCLinkActivate__block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (v1 == *(void **)(v2 + 32))
  {
    v3 = result;
    *(_QWORD *)(v2 + 32) = 0;

    return objc_msgSend(*(id *)(v3 + 40), "_invalidated");
  }
  return result;
}

void __33__CUFileClient__runCLinkActivate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int *v10;
  _QWORD *v11;
  int *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
  {
    v16 = v3;
    v8 = v3;
    v9 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v10 = *(int **)(v9 + 96);
      if (*v10 <= 90)
      {
        if (*v10 == -1)
        {
          v13 = _LogCategory_Initialize((uint64_t)v10, 0x5Au);
          v9 = *(_QWORD *)(a1 + 40);
          if (!v13)
            goto LABEL_10;
          v10 = *(int **)(v9 + 96);
        }
        LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileClient _runCLinkActivate]_block_invoke_2", 0x5Au, (uint64_t)"### CLink activate failed: %{error}", v4, v5, v6, v7, (uint64_t)v8);
        v9 = *(_QWORD *)(a1 + 40);
      }
LABEL_10:
      objc_msgSend((id)v9, "_reportError:where:", v8, "CLink activate");
LABEL_13:

      v3 = v16;
      goto LABEL_14;
    }
    *(_BYTE *)(v9 + 24) = 1;
    v11 = *(_QWORD **)(a1 + 40);
    v12 = (int *)v11[12];
    if (*v12 <= 30)
    {
      if (*v12 == -1)
      {
        v14 = _LogCategory_Initialize((uint64_t)v12, 0x1Eu);
        v11 = *(_QWORD **)(a1 + 40);
        if (!v14)
          goto LABEL_12;
        v12 = (int *)v11[12];
      }
      LogPrintF((uint64_t)v12, (uint64_t)"-[CUFileClient _runCLinkActivate]_block_invoke_2", 0x1Eu, (uint64_t)"CLink activated", v4, v5, v6, v7, v15);
      v11 = *(_QWORD **)(a1 + 40);
    }
LABEL_12:
    objc_msgSend(v11, "_run");
    goto LABEL_13;
  }
LABEL_14:

}

void __32__CUFileClient__sendSessionStop__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  int *v14;
  _BOOL4 v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v12 = a4;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(int **)(v13 + 96);
  if (*v14 <= 30)
  {
    if (*v14 == -1)
    {
      v15 = _LogCategory_Initialize((uint64_t)v14, 0x1Eu);
      v13 = *(_QWORD *)(a1 + 32);
      if (!v15)
        goto LABEL_5;
      v14 = *(int **)(v13 + 96);
    }
    LogPrintF((uint64_t)v14, (uint64_t)"-[CUFileClient _sendSessionStop]_block_invoke", 0x1Eu, (uint64_t)"Session stop response: %{error}", v8, v9, v10, v11, (uint64_t)v12);
    v13 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  v16 = *(void **)(v13 + 72);
  *(_QWORD *)(v13 + 72) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "_invalidated");

}

void __31__CUFileClient__sendKeepAlive___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v12 = a4;
  v13 = *(int **)(*(_QWORD *)(a1 + 32) + 96);
  if (*v13 <= 20)
  {
    if (*v13 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v13, (uint64_t)"-[CUFileClient _sendKeepAlive:]_block_invoke", 0x14u, (uint64_t)"Keep alive response: %##@, %{error}", v8, v9, v10, v11, (uint64_t)v14);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)v13, 0x14u))
    {
      v13 = *(int **)(*(_QWORD *)(a1 + 32) + 96);
      goto LABEL_3;
    }
  }
LABEL_5:
  if (v12)
    objc_msgSend(*(id *)(a1 + 32), "_reportError:where:", v12, "Keep alive response");

}

void __29__CUFileClient_performQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 40);
  if (!v10)
  {
    v18 = *(int **)(v16 + 96);
    if (*v18 > 90)
      return;
    if (*v18 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v18, 0x5Au))
        return;
      v18 = *(int **)(*(_QWORD *)(a1 + 40) + 96);
    }
    LogPrintF((uint64_t)v18, (uint64_t)"-[CUFileClient performQuery:]_block_invoke", 0x5Au, (uint64_t)"### Query without completion", v12, v13, v14, v15, a9);
    return;
  }
  if (*(_BYTE *)(v16 + 40))
  {
    v17 = *(_QWORD *)(a1 + 32);
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294896148, (uint64_t)"Query after invalidate", v11, v12, v13, v14, v15, v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "_completeQuery:response:error:", v17, 0, v24);

  }
  else
  {
    v19 = *(void **)(v16 + 56);
    if (!v19)
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(void **)(v21 + 56);
      *(_QWORD *)(v21 + 56) = v20;

      v19 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    }
    objc_msgSend(v19, "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_run");
  }
}

uint64_t __26__CUFileClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __40__CUFileClient__activateWithCompletion___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  int *v10;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = (_QWORD *)result;
    v10 = *(int **)(*(_QWORD *)(result + 32) + 96);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          return (*(uint64_t (**)(void))(v9[5] + 16))();
        v10 = *(int **)(v9[4] + 96);
        v8 = *(_QWORD *)(*(_QWORD *)(v9[6] + 8) + 40);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileClient _activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}", a5, a6, a7, a8, v8);
    }
    return (*(uint64_t (**)(void))(v9[5] + 16))();
  }
  return result;
}

uint64_t __39__CUFileClient_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v13;

  v9 = *(_QWORD **)(a1 + 32);
  v10 = (int *)v9[12];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD **)(a1 + 32);
      if (!v11)
        return objc_msgSend(v9, "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
      v10 = (int *)v9[12];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileClient activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate", a5, a6, a7, a8, v13);
    v9 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v9, "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
