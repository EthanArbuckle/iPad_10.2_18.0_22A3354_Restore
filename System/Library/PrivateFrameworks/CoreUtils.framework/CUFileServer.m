@implementation CUFileServer

- (CUFileServer)init
{
  CUFileServer *v2;
  CUFileServer *v3;
  CUFileServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUFileServer;
  v2 = -[CUFileServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUFileServer;
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
  v4.super_class = (Class)CUFileServer;
  -[CUFileServer dealloc](&v4, sel_dealloc);
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
  v7 = qword_1EE066BD0;
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
  v7[2] = __39__CUFileServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  LogCategory *ucat;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSURL *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  int *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[6];
  _QWORD aBlock[5];
  id v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;

  v4 = a3;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__2986;
  v83 = __Block_byref_object_dispose__2987;
  v84 = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CUFileServer__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E25DE160;
  v78 = &v79;
  aBlock[4] = self;
  v6 = v4;
  v77 = v6;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate", v7, v8, v9, v10, v67);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v18 = self->_rootDirectoryURL;
  if (!v18)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No root directory URL", v13, v14, v15, v16, v17, v67);
    v60 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v19 = (id)v80[5];
    v80[5] = v60;
    goto LABEL_8;
  }
  *__error() = 0;
  if (!realpath_DARWIN_EXTSN(-[NSURL fileSystemRepresentation](objc_retainAutorelease(v18), "fileSystemRepresentation"), self->_rootPath))
  {
    v61 = __error();
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960592, (uint64_t)"Bad root directory: error %d", v62, v63, v64, v65, v66, *v61);
    v60 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[RPCompanionLinkClient invalidate](self->_clinkClient, "invalidate");
  v19 = objc_alloc_init((Class)getRPCompanionLinkClientClass[0]());
  objc_storeStrong((id *)&self->_clinkClient, v19);
  objc_msgSend(v19, "setDispatchQueue:", self->_dispatchQueue);
  v75[0] = v5;
  v75[1] = 3221225472;
  v75[2] = __40__CUFileServer__activateWithCompletion___block_invoke_2;
  v75[3] = &unk_1E25DE628;
  v75[4] = v19;
  v75[5] = self;
  objc_msgSend(v19, "setInvalidationHandler:", v75);
  NSPrintF((uint64_t)"FSSr:%@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)self->_serviceType);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v5;
  v74[1] = 3221225472;
  v74[2] = __40__CUFileServer__activateWithCompletion___block_invoke_3;
  v74[3] = &unk_1E25DC820;
  v74[4] = self;
  objc_msgSend(v19, "registerRequestID:options:handler:", v27, 0, v74);

  NSPrintF((uint64_t)"FSSp:%@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)self->_serviceType);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v5;
  v73[1] = 3221225472;
  v73[2] = __40__CUFileServer__activateWithCompletion___block_invoke_4;
  v73[3] = &unk_1E25DC820;
  v73[4] = self;
  objc_msgSend(v19, "registerRequestID:options:handler:", v35, 0, v73);

  NSPrintF((uint64_t)"FSQy:%@", v36, v37, v38, v39, v40, v41, v42, (uint64_t)self->_serviceType);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v5;
  v72[1] = 3221225472;
  v72[2] = __40__CUFileServer__activateWithCompletion___block_invoke_5;
  v72[3] = &unk_1E25DC820;
  v72[4] = self;
  objc_msgSend(v19, "registerRequestID:options:handler:", v43, 0, v72);

  NSPrintF((uint64_t)"FSRF:%@", v44, v45, v46, v47, v48, v49, v50, (uint64_t)self->_serviceType);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v5;
  v71[1] = 3221225472;
  v71[2] = __40__CUFileServer__activateWithCompletion___block_invoke_6;
  v71[3] = &unk_1E25DC820;
  v71[4] = self;
  objc_msgSend(v19, "registerRequestID:options:handler:", v51, 0, v71);

  NSPrintF((uint64_t)"FSKA:%@", v52, v53, v54, v55, v56, v57, v58, (uint64_t)self->_serviceType);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v5;
  v70[1] = 3221225472;
  v70[2] = __40__CUFileServer__activateWithCompletion___block_invoke_7;
  v70[3] = &unk_1E25DC820;
  v70[4] = self;
  objc_msgSend(v19, "registerRequestID:options:handler:", v59, 0, v70);

  v68[0] = v5;
  v68[1] = 3221225472;
  v68[2] = __40__CUFileServer__activateWithCompletion___block_invoke_8;
  v68[3] = &unk_1E25DC848;
  v68[4] = self;
  v69 = v6;
  objc_msgSend(v19, "activateWithCompletion:", v68);

LABEL_8:
  v11[2](v11);

  _Block_object_dispose(&v79, 8);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CUFileServer_invalidate__block_invoke;
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
  OS_dispatch_source *sessionTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  NSMutableDictionary *sessionMap;
  NSMutableDictionary *v12;
  uint64_t v13;
  _QWORD v14[5];

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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _invalidate]", 0x1Eu, (uint64_t)"Invalidate", v2, v3, v4, v5, v13);
  }
LABEL_6:
  -[RPCompanionLinkClient invalidate](self->_clinkClient, "invalidate");
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    v9 = sessionTimer;
    dispatch_source_cancel(v9);
    v10 = self->_sessionTimer;
    self->_sessionTimer = 0;

  }
  sessionMap = self->_sessionMap;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __27__CUFileServer__invalidate__block_invoke;
  v14[3] = &unk_1E25DC870;
  v14[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessionMap, "enumerateKeysAndObjectsUsingBlock:", v14);
  -[NSMutableDictionary removeAllObjects](self->_sessionMap, "removeAllObjects");
  v12 = self->_sessionMap;
  self->_sessionMap = 0;

  -[CUFileServer _invalidated](self, "_invalidated");
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
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_clinkClient)
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
      goto LABEL_11;
    if (ucat->var0 == -1)
    {
      v10 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
      v8 = v12;
      if (!v10)
        goto LABEL_11;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _invalidated]", 0x1Eu, (uint64_t)"Invalidated", v4, v5, v6, v7, v11);
    v8 = v12;
LABEL_11:

  }
}

- (void)_sessionInvalidate:(id)a3
{
  DIR *v3;
  id v4;

  v4 = a3;
  v3 = (DIR *)objc_msgSend(v4, "dirStream");
  if (v3)
  {
    closedir(v3);
    objc_msgSend(v4, "setDirStream:", 0);
  }

}

- (void)_sessionTimerFired
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  LogCategory *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  ucat = self->_ucat;
  if (ucat->var0 > 20)
    goto LABEL_5;
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u))
      goto LABEL_5;
    ucat = self->_ucat;
  }
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _sessionTimerFired]", 0x14u, (uint64_t)"Session timer fired", v2, v3, v4, v5, v22);
LABEL_5:
  v8 = mach_absolute_time();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableDictionary allKeys](self->_sessionMap, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v10)
    goto LABEL_20;
  v11 = v10;
  v12 = *(_QWORD *)v24;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (UpTicksToSeconds(v8 - objc_msgSend(v15, "lastRequestTicks")) >= 0x1E)
      {
        v20 = self->_ucat;
        if (v20->var0 <= 30)
        {
          if (v20->var0 != -1)
            goto LABEL_13;
          if (_LogCategory_Initialize((uint64_t)v20, 0x1Eu))
          {
            v20 = self->_ucat;
LABEL_13:
            LogPrintF((uint64_t)v20, (uint64_t)"-[CUFileServer _sessionTimerFired]", 0x1Eu, (uint64_t)"Session stale: ID %@, %llu seconds", v16, v17, v18, v19, v14);
          }
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionMap, "setObject:forKeyedSubscript:", 0, v14);
        -[CUFileServer _sessionInvalidate:](self, "_sessionInvalidate:", v15);
      }

      ++v13;
    }
    while (v11 != v13);
    v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v11 = v21;
  }
  while (v21);
LABEL_20:

}

- (void)_update
{
  uint64_t v3;
  OS_dispatch_source *sessionTimer;
  dispatch_source_t v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  NSObject *v12;
  OS_dispatch_source *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  LogCategory *v18;
  uint64_t v19[6];
  uint64_t v20;

  v3 = -[NSMutableDictionary count](self->_sessionMap, "count");
  sessionTimer = self->_sessionTimer;
  if (v3)
  {
    if (sessionTimer)
      return;
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_sessionTimer, v5);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__23__CUFileServer__update__block_invoke;
    v19[3] = (uint64_t)&unk_1E25DE628;
    v19[4] = (uint64_t)v5;
    v19[5] = (uint64_t)self;
    dispatch_source_set_event_handler(v5, v19);
    v6 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v5, v6, 0x37E11D600uLL, 0x3B9ACA00uLL);
    dispatch_activate(v5);
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_11;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_11;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _update]", 0x1Eu, (uint64_t)"Session timer started", v7, v8, v9, v10, v19[0]);
LABEL_11:

    return;
  }
  if (sessionTimer)
  {
    v12 = sessionTimer;
    dispatch_source_cancel(v12);
    v13 = self->_sessionTimer;
    self->_sessionTimer = 0;

    v18 = self->_ucat;
    if (v18->var0 <= 30)
    {
      if (v18->var0 != -1)
      {
LABEL_9:
        LogPrintF((uint64_t)v18, (uint64_t)"-[CUFileServer _update]", 0x1Eu, (uint64_t)"Session timer stopped", v14, v15, v16, v17, v20);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v18, 0x1Eu))
      {
        v18 = self->_ucat;
        goto LABEL_9;
      }
    }
  }
}

- (void)_handleSessionStart:(id)a3 responseHandler:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CUFileServerSession *v16;
  LogCategory *v17;
  unint64_t v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *sessionMap;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  LogCategory *ucat;
  void *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[NSMutableDictionary count](self->_sessionMap, "count");
  if (v6 < 0x1E)
  {
    v16 = objc_alloc_init(CUFileServerSession);
    -[CUFileServerSession setLastRequestTicks:](v16, "setLastRequestTicks:", mach_absolute_time());
    v18 = self->_lastSessionID + 1;
    self->_lastSessionID = v18;
    -[CUFileServerSession setSessionID:](v16, "setSessionID:", v18);
    if (!self->_sessionMap)
    {
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      sessionMap = self->_sessionMap;
      self->_sessionMap = v19;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionMap, "setObject:forKeyedSubscript:", v16, v21);
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_13;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_13;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleSessionStart:responseHandler:]", 0x1Eu, (uint64_t)"Session start: ID %llu", v22, v23, v24, v25, v18);
LABEL_13:
    -[CUFileServer _update](self, "_update");
    v28 = CFSTR("sid");
    v29[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, v27, 0, 0);

    goto LABEL_14;
  }
  NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294896146, (uint64_t)"Too many sessions: %d", v7, v8, v9, v10, v11, v6);
  v16 = (CUFileServerSession *)objc_claimAutoreleasedReturnValue();
  v17 = self->_ucat;
  if (v17->var0 <= 90)
  {
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0x5Au))
        goto LABEL_11;
      v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CUFileServer _handleSessionStart:responseHandler:]", 0x5Au, (uint64_t)"### Session start failed: %{error}", v12, v13, v14, v15, (uint64_t)v16);
  }
LABEL_11:
  (*((void (**)(id, _QWORD, _QWORD, CUFileServerSession *))v5 + 2))(v5, 0, 0, v16);
LABEL_14:

}

- (void)_handleSessionStop:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  LogCategory *ucat;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD aBlock[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2986;
  v34 = __Block_byref_object_dispose__2987;
  v35 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CUFileServer__handleSessionStop_responseHandler___block_invoke;
  aBlock[3] = &unk_1E25DE160;
  v29 = &v30;
  aBlock[4] = self;
  v8 = v7;
  v28 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  NSDictionaryGetNSNumber(v6, (uint64_t)CFSTR("sid"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No session ID", v10, v11, v12, v13, v14, v26);
    v23 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v31[5];
    v31[5] = v23;
    goto LABEL_8;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960569, (uint64_t)"Session not found: ID %@", v16, v17, v18, v19, v20, (uint64_t)v15);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v31[5];
    v31[5] = v24;

    v21 = 0;
    goto LABEL_8;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_7;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleSessionStop:responseHandler:]", 0x1Eu, (uint64_t)"Session stop: ID %@", v17, v18, v19, v20, (uint64_t)v15);
  }
LABEL_7:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionMap, "setObject:forKeyedSubscript:", 0, v15);
  -[CUFileServer _sessionInvalidate:](self, "_sessionInvalidate:", v21);
  -[CUFileServer _update](self, "_update");
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA70], 0, 0);
LABEL_8:

  v9[2](v9);
  _Block_object_dispose(&v30, 8);

}

- (void)_handleKeepAlive:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  LogCategory *ucat;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD aBlock[5];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v6 = a3;
  v7 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2986;
  v39 = __Block_byref_object_dispose__2987;
  v40 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CUFileServer__handleKeepAlive_responseHandler___block_invoke;
  aBlock[3] = &unk_1E25DE160;
  v34 = &v35;
  aBlock[4] = self;
  v8 = v7;
  v33 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  NSDictionaryGetNSNumber(v6, (uint64_t)CFSTR("sid"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No session ID", v10, v11, v12, v13, v14, v31);
    v28 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v36[5];
    v36[5] = v28;
    goto LABEL_8;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960569, (uint64_t)"Session not found: ID %@", v16, v17, v18, v19, v20, (uint64_t)v15);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v36[5];
    v36[5] = v29;

    v21 = 0;
    goto LABEL_8;
  }
  v22 = mach_absolute_time();
  UpTicksToSeconds(v22 - objc_msgSend(v21, "lastRequestTicks"));
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u))
        goto LABEL_7;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleKeepAlive:responseHandler:]", 0x14u, (uint64_t)"Keep alive: ID %@, %llu seconds", v23, v24, v25, v26, (uint64_t)v15);
  }
LABEL_7:
  objc_msgSend(v21, "setLastRequestTicks:", mach_absolute_time());
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA70], 0, 0);
LABEL_8:

  v9[2](v9);
  _Block_object_dispose(&v35, 8);

}

- (void)_handleQuery:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  CFTypeID TypeID;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  CUFileQuery *v30;
  id *v31;
  CUFileQuery *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  LogCategory *ucat;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  OS_dispatch_queue *v47;
  id v48;
  const char *v49;
  NSObject *v50;
  NSObject *ioQueue;
  CUFileQuery *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (**v57)(_QWORD);
  _QWORD block[5];
  CUFileQuery *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id obj;
  _QWORD aBlock[5];
  id v65;
  uint64_t *v66;
  uint64_t v67;
  id *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;

  v6 = a3;
  v7 = a4;
  v67 = 0;
  v68 = (id *)&v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__2986;
  v71 = __Block_byref_object_dispose__2987;
  v72 = 0;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__CUFileServer__handleQuery_responseHandler___block_invoke;
  aBlock[3] = &unk_1E25DE160;
  v66 = &v67;
  aBlock[4] = self;
  v9 = v7;
  v65 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v57 = v10;
  NSDictionaryGetNSNumber(v6, (uint64_t)CFSTR("sid"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No session ID", v11, v12, v13, v14, v15, v56);
    v53 = objc_claimAutoreleasedReturnValue();
    v22 = v68[5];
    v68[5] = (id)v53;
    goto LABEL_14;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v16);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960569, (uint64_t)"Session not found: ID %@", v17, v18, v19, v20, v21, (uint64_t)v16);
    v54 = objc_claimAutoreleasedReturnValue();
    v29 = v68[5];
    v68[5] = (id)v54;
    goto LABEL_13;
  }
  TypeID = CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue((const __CFDictionary *)v6, CFSTR("fQry"), TypeID, 0);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = [CUFileQuery alloc];
    v31 = v68;
    obj = v68[5];
    v32 = -[CUFileQuery initWithDictionary:error:](v30, "initWithDictionary:error:", v29, &obj);
    objc_storeStrong(v31 + 5, obj);
    if (v32)
    {
      objc_msgSend(v22, "setLastRequestTicks:", mach_absolute_time());
      v61[0] = v8;
      v61[1] = 3221225472;
      v61[2] = __45__CUFileServer__handleQuery_responseHandler___block_invoke_2;
      v61[3] = &unk_1E25DC898;
      v62 = v9;
      -[CUFileQuery setCompletionHandler:](v32, "setCompletionHandler:", v61);
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
            goto LABEL_9;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleQuery:responseHandler:]", 0x1Eu, (uint64_t)"Query start: ID %@, %@", v33, v34, v35, v36, (uint64_t)v16);
      }
LABEL_9:
      v38 = v9;
      v39 = v6;
      v47 = self->_ioQueue;
      if (!v47)
      {
        NSPrintF((uint64_t)"%s-IO", v40, v41, v42, v43, v44, v45, v46, (uint64_t)self->_ucat->var4);
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v49 = (const char *)objc_msgSend(v48, "UTF8String");

        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v50 = objc_claimAutoreleasedReturnValue();
        v47 = (OS_dispatch_queue *)dispatch_queue_create(v49, v50);

        objc_storeStrong((id *)&self->_ioQueue, v47);
      }
      ioQueue = self->_ioQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__CUFileServer__handleQuery_responseHandler___block_invoke_3;
      block[3] = &unk_1E25DCEE8;
      block[4] = self;
      v52 = v32;
      v59 = v52;
      v60 = v22;
      dispatch_async(ioQueue, block);

      v6 = v39;
      v10 = v57;
      v9 = v38;
      goto LABEL_12;
    }
    v52 = 0;
  }
  else
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No query", v24, v25, v26, v27, v28, v56);
    v55 = objc_claimAutoreleasedReturnValue();
    v52 = (CUFileQuery *)v68[5];
    v68[5] = (id)v55;
  }
LABEL_12:

LABEL_13:
LABEL_14:

  v10[2](v10);
  _Block_object_dispose(&v67, 8);

}

- (void)_handleQuery:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  int v18;
  char *v19;
  char *v20;
  int v21;
  DIR *v22;
  DIR *v23;
  DIR *v24;
  int v25;
  dirent *v26;
  const char *d_name;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  CUFileItem *v41;
  void *v42;
  uint64_t v43;
  CUFileServer *v44;
  int *p_var0;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CUFileResponse *v51;
  NSObject *dispatchQueue;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CUFileServer *v84;
  void *v85;
  void (**v86)(_QWORD);
  void *v87;
  char *v88;
  _QWORD block[4];
  id v90;
  CUFileResponse *v91;
  stat v92;
  char *v93;
  _QWORD aBlock[5];
  id v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;

  v6 = a3;
  v88 = (char *)a4;
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__2986;
  v101 = __Block_byref_object_dispose__2987;
  v102 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__CUFileServer__handleQuery_session___block_invoke;
  aBlock[3] = &unk_1E25DC8E8;
  v96 = &v97;
  aBlock[4] = self;
  v7 = v6;
  v95 = v7;
  v86 = (void (**)(_QWORD))_Block_copy(aBlock);
  v87 = v7;
  objc_msgSend(v7, "path");
  v8 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v8;
  if (v8)
  {
    -[NSURL URLByAppendingPathComponent:isDirectory:](self->_rootDirectoryURL, "URLByAppendingPathComponent:isDirectory:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *__error() = 0;
    v10 = objc_retainAutorelease(v9);
    v11 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v10, "fileSystemRepresentation"), v88 + 8);
    v17 = v11;
    if (!v11)
    {
      v57 = __error();
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960592, (uint64_t)"realpath failed: %d", v58, v59, v60, v61, v62, *v57);
      v55 = objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
    v18 = self->_rootPath[0];
    if (self->_rootPath[0])
    {
      v19 = &self->_rootPath[1];
      v20 = v11;
      while (*v20 == v18)
      {
        ++v20;
        v21 = *v19++;
        v18 = v21;
        if (!v21)
          goto LABEL_7;
      }
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960592, (uint64_t)"Path outside root", v12, v13, v14, v15, v16, v82);
      v55 = objc_claimAutoreleasedReturnValue();
LABEL_49:
      v56 = (void *)v98[5];
      v98[5] = v55;

      goto LABEL_44;
    }
LABEL_7:
    v22 = (DIR *)objc_msgSend(v88, "dirStream");
    if (v22)
      closedir(v22);
    v23 = opendir(v17);
    if (!v23)
    {
      v63 = __error();
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960592, (uint64_t)"opendir failed: %d", v64, v65, v66, v67, v68, *v63);
      v55 = objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
    objc_msgSend(v88, "setDirStream:", v23);

  }
  v24 = (DIR *)objc_msgSend(v88, "dirStream");
  if (!v24)
  {
    v24 = opendir(self->_rootPath);
    if (!v24)
    {
      v75 = __error();
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960592, (uint64_t)"opendir failed: %d", v76, v77, v78, v79, v80, *v75);
      v81 = objc_claimAutoreleasedReturnValue();
      v10 = (id)v98[5];
      v98[5] = v81;
      goto LABEL_44;
    }
    objc_msgSend(v88, "setDirStream:", v24);
    strlcpy(v88 + 8, self->_rootPath, 0x400uLL);
  }
  v84 = self;
  v10 = 0;
  v25 = 500;
  while (1)
  {
    *__error() = 0;
    v26 = readdir(v24);
    if (!v26)
    {
      v44 = v84;
      if (*__error())
      {
        v69 = __error();
        NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"readdir failed: %d", v70, v71, v72, v73, v74, *v69);
        v53 = objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
      v43 = 1;
LABEL_39:
      p_var0 = &v44->_ucat->var0;
      if (*p_var0 <= 30)
      {
        if (*p_var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v44->_ucat, 0x1Eu))
            goto LABEL_43;
          p_var0 = &v44->_ucat->var0;
        }
        v46 = objc_msgSend(v10, "count");
        LogPrintF((uint64_t)p_var0, (uint64_t)"-[CUFileServer _handleQuery:session:]", 0x1Eu, (uint64_t)"Query response: %d item(s)", v47, v48, v49, v50, v46);
      }
LABEL_43:
      v51 = objc_alloc_init(CUFileResponse);
      -[CUFileResponse setFileItems:](v51, "setFileItems:", v10);
      -[CUFileResponse setFlags:](v51, "setFlags:", v43);
      dispatchQueue = v44->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__CUFileServer__handleQuery_session___block_invoke_3;
      block[3] = &unk_1E25DE628;
      v90 = v87;
      v91 = v51;
      dispatch_async(dispatchQueue, block);

      goto LABEL_44;
    }
    d_name = v26->d_name;
    if (!strcmp(v26->d_name, ".") || !strcmp(d_name, ".."))
      goto LABEL_35;
    v93 = 0;
    asprintf(&v93, "%s/%s", v88 + 8, d_name);
    if (!v93)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"entry path failed", v28, v29, v30, v31, v32, v83);
      v53 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
    memset(&v92, 0, sizeof(v92));
    if (lstat(v93, &v92))
      break;
    free(v93);
LABEL_24:
    v39 = v92.st_mode & 0xF000;
    switch(v39)
    {
      case 40960:
        v40 = 3;
        goto LABEL_30;
      case 32768:
        v40 = 1;
        goto LABEL_30;
      case 16384:
        v40 = 2;
LABEL_30:
        v41 = objc_alloc_init(CUFileItem);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", d_name);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUFileItem setName:](v41, "setName:", v42);

        -[CUFileItem setType:](v41, "setType:", v40);
        if ((v92.st_mode & 0xF000) == 0x8000)
          -[CUFileItem setSize:](v41, "setSize:", v92.st_size);
        if (!v10)
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v10, "addObject:", v41);

        break;
    }
LABEL_35:
    if (!--v25)
    {
      v43 = 0;
      v44 = v84;
      goto LABEL_39;
    }
  }
  if (*__error())
  {
    v33 = *__error();
    free(v93);
    if ((_DWORD)v33)
      goto LABEL_46;
    goto LABEL_24;
  }
  free(v93);
  v33 = 4294960596;
LABEL_46:
  NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"stat failed: %d", v34, v35, v36, v37, v38, v33);
  v53 = objc_claimAutoreleasedReturnValue();
LABEL_47:
  v54 = (void *)v98[5];
  v98[5] = v53;

LABEL_44:
  v86[2](v86);

  _Block_object_dispose(&v97, 8);
}

- (void)_handleRequestFiles:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  LogCategory *ucat;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD aBlock[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2986;
  v34 = __Block_byref_object_dispose__2987;
  v35 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CUFileServer__handleRequestFiles_responseHandler___block_invoke;
  aBlock[3] = &unk_1E25DE160;
  v29 = &v30;
  aBlock[4] = self;
  v8 = v7;
  v28 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  NSDictionaryGetNSNumber(v6, (uint64_t)CFSTR("sid"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No session ID", v10, v11, v12, v13, v14, v26);
    v23 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v31[5];
    v31[5] = v23;
    goto LABEL_8;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960569, (uint64_t)"Session not found: ID %@", v16, v17, v18, v19, v20, (uint64_t)v15);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v31[5];
    v31[5] = v24;

    v21 = 0;
    goto LABEL_8;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_7;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleRequestFiles:responseHandler:]", 0x1Eu, (uint64_t)"RequestFiles: ID %@", v17, v18, v19, v20, (uint64_t)v15);
  }
LABEL_7:
  objc_msgSend(v21, "setLastRequestTicks:", mach_absolute_time());
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA70], 0, 0);
LABEL_8:

  v9[2](v9);
  _Block_object_dispose(&v30, 8);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSString)label
{
  return self->_label;
}

- (NSURL)rootDirectoryURL
{
  return self->_rootDirectoryURL;
}

- (void)setRootDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_sessionMap, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
}

uint64_t __52__CUFileServer__handleRequestFiles_responseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  int *v10;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = (_QWORD *)result;
    v10 = *(int **)(*(_QWORD *)(result + 32) + 1088);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          return (*(uint64_t (**)(void))(v9[5] + 16))();
        v10 = *(int **)(v9[4] + 1088);
        v8 = *(_QWORD *)(*(_QWORD *)(v9[6] + 8) + 40);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _handleRequestFiles:responseHandler:]_block_invoke", 0x5Au, (uint64_t)"### Keep alive failed: %{error}", a5, a6, a7, a8, v8);
    }
    return (*(uint64_t (**)(void))(v9[5] + 16))();
  }
  return result;
}

void __37__CUFileServer__handleQuery_session___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v8)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(int **)(v10 + 1088);
    if (*v11 <= 90)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
        v10 = *(_QWORD *)(a1 + 32);
        if (!v12)
          goto LABEL_6;
        v11 = *(int **)(v10 + 1088);
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUFileServer _handleQuery:session:]_block_invoke", 0x5Au, (uint64_t)"### Query failed: %{error}", a5, a6, a7, a8, v8);
      v10 = *(_QWORD *)(a1 + 32);
    }
LABEL_6:
    v13 = *(NSObject **)(v10 + 1096);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__CUFileServer__handleQuery_session___block_invoke_2;
    block[3] = &unk_1E25DC8C0;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v17 = v14;
    v18 = v15;
    dispatch_async(v13, block);

  }
}

void __37__CUFileServer__handleQuery_session___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), 0);

}

void __37__CUFileServer__handleQuery_session___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

uint64_t __45__CUFileServer__handleQuery_responseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  int *v10;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = (_QWORD *)result;
    v10 = *(int **)(*(_QWORD *)(result + 32) + 1088);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          return (*(uint64_t (**)(void))(v9[5] + 16))();
        v10 = *(int **)(v9[4] + 1088);
        v8 = *(_QWORD *)(*(_QWORD *)(v9[6] + 8) + 40);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _handleQuery:responseHandler:]_block_invoke", 0x5Au, (uint64_t)"### Query failed: %{error}", a5, a6, a7, a8, v8);
    }
    return (*(uint64_t (**)(void))(v9[5] + 16))();
  }
  return result;
}

void __45__CUFileServer__handleQuery_responseHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "encodeWithDictionary:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __45__CUFileServer__handleQuery_responseHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQuery:session:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __49__CUFileServer__handleKeepAlive_responseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  int *v10;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = (_QWORD *)result;
    v10 = *(int **)(*(_QWORD *)(result + 32) + 1088);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          return (*(uint64_t (**)(void))(v9[5] + 16))();
        v10 = *(int **)(v9[4] + 1088);
        v8 = *(_QWORD *)(*(_QWORD *)(v9[6] + 8) + 40);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _handleKeepAlive:responseHandler:]_block_invoke", 0x5Au, (uint64_t)"### Keep alive failed: %{error}", a5, a6, a7, a8, v8);
    }
    return (*(uint64_t (**)(void))(v9[5] + 16))();
  }
  return result;
}

uint64_t __51__CUFileServer__handleSessionStop_responseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  int *v10;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = (_QWORD *)result;
    v10 = *(int **)(*(_QWORD *)(result + 32) + 1088);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          return (*(uint64_t (**)(void))(v9[5] + 16))();
        v10 = *(int **)(v9[4] + 1088);
        v8 = *(_QWORD *)(*(_QWORD *)(v9[6] + 8) + 40);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _handleSessionStop:responseHandler:]_block_invoke", 0x5Au, (uint64_t)"### Session stop failed: %{error}", a5, a6, a7, a8, v8);
    }
    return (*(uint64_t (**)(void))(v9[5] + 16))();
  }
  return result;
}

_QWORD *__23__CUFileServer__update__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[135])
    return (_QWORD *)objc_msgSend(result, "_sessionTimerFired");
  return result;
}

uint64_t __27__CUFileServer__invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionInvalidate:");
}

uint64_t __26__CUFileServer_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  int *v10;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = (_QWORD *)result;
    v10 = *(int **)(*(_QWORD *)(result + 32) + 1088);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          return (*(uint64_t (**)(void))(v9[5] + 16))();
        v10 = *(int **)(v9[4] + 1088);
        v8 = *(_QWORD *)(*(_QWORD *)(v9[6] + 8) + 40);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}", a5, a6, a7, a8, v8);
    }
    return (*(uint64_t (**)(void))(v9[5] + 16))();
  }
  return result;
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_2(uint64_t result)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (v1 == *(void **)(v2 + 16))
  {
    v3 = result;
    *(_QWORD *)(v2 + 16) = 0;

    return objc_msgSend(*(id *)(v3 + 40), "_invalidated");
  }
  return result;
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStart:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStop:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQuery:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestFiles:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeepAlive:responseHandler:", a2);
}

void __40__CUFileServer__activateWithCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v8 = *(int **)(*(_QWORD *)(a1 + 32) + 1088);
  v9 = *v8;
  v12 = v3;
  if (v3)
  {
    if (v9 <= 90)
    {
      if (v9 == -1)
      {
        v10 = _LogCategory_Initialize((uint64_t)v8, 0x5Au);
        v3 = v12;
        if (!v10)
          goto LABEL_11;
        v8 = *(int **)(*(_QWORD *)(a1 + 32) + 1088);
      }
      LogPrintF((uint64_t)v8, (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke_8", 0x5Au, (uint64_t)"### CLink activate failed: %{error}", v4, v5, v6, v7, (uint64_t)v3);
    }
  }
  else if (v9 <= 30)
  {
    if (v9 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v8, 0x1Eu))
        goto LABEL_11;
      v8 = *(int **)(*(_QWORD *)(a1 + 32) + 1088);
    }
    LogPrintF((uint64_t)v8, (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke_8", 0x1Eu, (uint64_t)"CLink activated", v4, v5, v6, v7, v11);
  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __39__CUFileServer_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  _BOOL4 v16;
  uint64_t v17;
  id v18;

  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v9 + 8))
  {
    *(_BYTE *)(v9 + 8) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
    return;
  }
  NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960575, (uint64_t)"Activate already called", a4, a5, a6, a7, a8, v17);
  v10 = objc_claimAutoreleasedReturnValue();
  v15 = *(int **)(*(_QWORD *)(a1 + 32) + 1088);
  v18 = (id)v10;
  if (*v15 <= 90)
  {
    if (*v15 == -1)
    {
      v16 = _LogCategory_Initialize((uint64_t)v15, 0x5Au);
      v10 = (uint64_t)v18;
      if (!v16)
        goto LABEL_7;
      v15 = *(int **)(*(_QWORD *)(a1 + 32) + 1088);
    }
    LogPrintF((uint64_t)v15, (uint64_t)"-[CUFileServer activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}", v11, v12, v13, v14, v10);
  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
