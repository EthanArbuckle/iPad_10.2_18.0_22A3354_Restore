@implementation CURangingSession

- (CURangingSession)init
{
  CURangingSession *v2;
  CURangingSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CURangingSession;
  v2 = -[CURangingSession init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CURangingSession;
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
  v4.super_class = (Class)CURangingSession;
  -[CURangingSession dealloc](&v4, sel_dealloc);
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
  v7 = qword_1EE067700;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)setPeers:(id)a3
{
  id v4;
  void *v5;
  CURangingSession *v6;
  NSArray *peers;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  char v11;
  LogCategory *ucat;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  peers = v6->_peers;
  v8 = v5;
  v9 = peers;
  if (v8 == v9)
  {

    goto LABEL_14;
  }
  v10 = v9;
  if ((v8 == 0) != (v9 != 0))
  {
    v11 = -[NSArray isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  ucat = v6->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v6->_ucat, 0x1Eu))
        goto LABEL_11;
      ucat = v6->_ucat;
    }
    v13 = -[NSArray count](v6->_peers, "count");
    -[NSArray count](v8, "count");
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession setPeers:]", 0x1Eu, (uint64_t)"Update peers: %d -> %d total\n", v14, v15, v16, v17, v13);
  }
LABEL_11:
  objc_storeStrong((id *)&v6->_peers, v5);
  if (!v6->_peersChanged)
  {
    v6->_peersChanged = 1;
    if (v6->_activateCalled)
    {
      dispatchQueue = v6->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__CURangingSession_setPeers___block_invoke;
      block[3] = &unk_1E25DF2A0;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_14:
  objc_sync_exit(v6);

}

- (void)addSample:(id)a3
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
  v7[2] = __30__CURangingSession_addSample___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CURangingSession_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CURangingSession_invalidate__block_invoke;
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
  PRSharingSession *prRangingSession;
  NSArray *v9;
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
  void *v20;
  LogCategory *v21;
  PRContactAllowlist *prResponder;
  uint64_t v23;
  PRContactAllowlist *v24;
  NSArray *peersRanging;
  uint64_t v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_prRangingInitiated)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession _invalidate]", 0x1Eu, (uint64_t)"PR ranging initiator stop\n", v2, v3, v4, v5, v26);
    }
LABEL_6:
    -[PRSharingSession stopInitiating](self->_prRangingSession, "stopInitiating");
    self->_prRangingInitiated = 0;
  }
  prRangingSession = self->_prRangingSession;
  self->_prRangingSession = 0;

  if (self->_prResponder)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = self->_peersRanging;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v10)
      goto LABEL_21;
    v11 = v10;
    v12 = *(_QWORD *)v29;
    v13 = MEMORY[0x1E0C809B0];
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
        objc_msgSend(v15, "contactKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = self->_ucat;
        if (v21->var0 <= 30)
        {
          if (v21->var0 != -1)
            goto LABEL_15;
          if (_LogCategory_Initialize((uint64_t)v21, 0x1Eu))
          {
            v21 = self->_ucat;
LABEL_15:
            LogPrintF((uint64_t)v21, (uint64_t)"-[CURangingSession _invalidate]", 0x1Eu, (uint64_t)"Responder remove peer on invalidate: %@\n", v16, v17, v18, v19, (uint64_t)v20);
          }
        }
        prResponder = self->_prResponder;
        v27[0] = v13;
        v27[1] = 3221225472;
        v27[2] = __31__CURangingSession__invalidate__block_invoke;
        v27[3] = &unk_1E25DE278;
        v27[4] = self;
        v27[5] = v20;
        -[PRContactAllowlist removeTrustedContact:withCompletionHandler:](prResponder, "removeTrustedContact:withCompletionHandler:", v15, v27);

        ++v14;
      }
      while (v11 != v14);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v11 = v23;
      if (!v23)
      {
LABEL_21:

        v24 = self->_prResponder;
        self->_prResponder = 0;

        break;
      }
    }
  }
  peersRanging = self->_peersRanging;
  self->_peersRanging = 0;

  -[CURangingSession _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id errorHandler;
  id v5;
  id measurementHandler;
  id measurementHandlerEx;
  id statusChangedHandler;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *ucat;
  uint64_t v14;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    measurementHandler = self->_measurementHandler;
    self->_measurementHandler = 0;

    measurementHandlerEx = self->_measurementHandlerEx;
    self->_measurementHandlerEx = 0;

    statusChangedHandler = self->_statusChangedHandler;
    self->_statusChangedHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_7:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v14);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_7;
      }
    }
  }
}

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    if ((self->_flags & 1) != 0)
      -[CURangingSession _updateResponder](self, "_updateResponder");
    else
      -[CURangingSession _updateInitiator](self, "_updateInitiator");
  }
}

- (void)_updateInitiator
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  PRSharingSession *prRangingSession;
  LogCategory *ucat;
  PRSharingSession *v9;
  PRSharingSession *v10;
  LogCategory *v11;
  uint64_t v12;

  prRangingSession = self->_prRangingSession;
  if (!prRangingSession)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession _updateInitiator]", 0x1Eu, (uint64_t)"PR ranging initiator start\n", v2, v3, v4, v5, v12);
    }
LABEL_6:
    v9 = (PRSharingSession *)objc_msgSend(objc_alloc((Class)getPRSharingSessionClass[0]()), "initWithDelegate:delegateQueue:", self, self->_dispatchQueue);
    v10 = self->_prRangingSession;
    self->_prRangingSession = v9;

  }
  if ((self->_flags & 1) == 0 && !self->_prRangingInitiated)
  {
    if (!prRangingSession)
      goto LABEL_14;
    v11 = self->_ucat;
    if (v11->var0 > 30)
      goto LABEL_14;
    if (v11->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v11, 0x1Eu))
        goto LABEL_14;
      v11 = self->_ucat;
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CURangingSession _updateInitiator]", 0x1Eu, (uint64_t)"PR ranging initiator restart\n", v2, v3, v4, v5, v12);
LABEL_14:
    -[PRSharingSession startInitiating](self->_prRangingSession, "startInitiating");
    self->_prRangingInitiated = 1;
  }
}

- (void)_updateResponder
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  PRContactAllowlist *v8;
  PRContactAllowlist *prResponder;
  uint64_t v10;

  if (self->_prResponder)
    goto LABEL_7;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_6;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession _updateResponder]", 0x1Eu, (uint64_t)"PR ranging responder start\n", v2, v3, v4, v5, v10);
  }
LABEL_6:
  v8 = (PRContactAllowlist *)objc_alloc_init((Class)getPRContactAllowlistClass[0]());
  prResponder = self->_prResponder;
  self->_prResponder = v8;

LABEL_7:
  if (self->_peersChanged)
  {
    self->_peersChanged = 0;
    -[CURangingSession _updatePeers](self, "_updatePeers");
  }
}

- (void)_updatePeers
{
  CURangingSession *v2;
  uint64_t v3;
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t k;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  void *v24;
  char v25;
  id v26;
  NSArray *peersRanging;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  int *p_var0;
  PRContactAllowlist *prResponder;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  int *v53;
  PRContactAllowlist *v54;
  uint64_t v55;
  void *v56;
  NSArray *v57;
  NSArray *obj;
  NSArray *obja;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  CURangingSession *v64;
  _QWORD v65[6];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[6];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v64 = v2;
  obj = v2->_peersRanging;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  v4 = 0;
  if (v3)
  {
    v60 = *(_QWORD *)v88;
    do
    {
      v62 = v3;
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v88 != v60)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        objc_msgSend(v6, "contactKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v8 = v64->_peers;
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v84;
            while (2)
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v84 != v10)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "deviceAddress");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "isEqual:", v7);

                if ((v13 & 1) != 0)
                {

                  goto LABEL_19;
                }
              }
              v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
              if (v9)
                continue;
              break;
            }
          }

          v14 = v4;
          if (!v4)
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v4 = v14;
          objc_msgSend(v14, "addObject:", v6);
        }
LABEL_19:

      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    }
    while (v3);
  }
  v56 = v4;

  v57 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obja = v64->_peers;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
  v16 = 0;
  if (v15)
  {
    v61 = *(_QWORD *)v80;
    do
    {
      v63 = v15;
      for (k = 0; k != v63; ++k)
      {
        if (*(_QWORD *)v80 != v61)
          objc_enumerationMutation(obja);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * k), "deviceAddress");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)objc_msgSend(objc_alloc((Class)getPRTrustedContactClass[0]()), "initWithContactKey:", v18);
          if (v19)
          {
            -[NSArray addObject:](v57, "addObject:", v19);
            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            v20 = v64->_peersRanging;
            v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
            if (v21)
            {
              v22 = *(_QWORD *)v76;
              while (2)
              {
                for (m = 0; m != v21; ++m)
                {
                  if (*(_QWORD *)v76 != v22)
                    objc_enumerationMutation(v20);
                  objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * m), "contactKey");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "isEqual:", v18);

                  if ((v25 & 1) != 0)
                  {

                    goto LABEL_40;
                  }
                }
                v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
                if (v21)
                  continue;
                break;
              }
            }

            v26 = v16;
            if (!v16)
              v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v16 = v26;
            objc_msgSend(v26, "addObject:", v19);
          }
LABEL_40:

        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
    }
    while (v15);
  }

  peersRanging = v64->_peersRanging;
  v64->_peersRanging = v57;

  v28 = v16;
  objc_sync_exit(v64);

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v29 = v56;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
  v31 = MEMORY[0x1E0C809B0];
  if (!v30)
    goto LABEL_56;
  v32 = *(_QWORD *)v72;
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v72 != v32)
        objc_enumerationMutation(v29);
      v34 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v33);
      objc_msgSend(v34, "contactKey");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      p_var0 = &v64->_ucat->var0;
      if (*p_var0 <= 30)
      {
        if (*p_var0 != -1)
          goto LABEL_50;
        if (_LogCategory_Initialize((uint64_t)p_var0, 0x1Eu))
        {
          p_var0 = &v64->_ucat->var0;
LABEL_50:
          LogPrintF((uint64_t)p_var0, (uint64_t)"-[CURangingSession _updatePeers]", 0x1Eu, (uint64_t)"Responder remove peer: %@\n", v35, v36, v37, v38, (uint64_t)v39);
        }
      }
      prResponder = v64->_prResponder;
      v70[0] = v31;
      v70[1] = 3221225472;
      v70[2] = __32__CURangingSession__updatePeers__block_invoke;
      v70[3] = &unk_1E25DE278;
      v70[4] = v64;
      v70[5] = v39;
      -[PRContactAllowlist removeTrustedContact:withCompletionHandler:](prResponder, "removeTrustedContact:withCompletionHandler:", v34, v70);

      ++v33;
    }
    while (v30 != v33);
    v42 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
    v30 = v42;
  }
  while (v42);
LABEL_56:

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v43 = v28;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v91, 16);
  if (!v44)
    goto LABEL_69;
  v45 = *(_QWORD *)v67;
  while (2)
  {
    v46 = 0;
    while (2)
    {
      if (*(_QWORD *)v67 != v45)
        objc_enumerationMutation(v43);
      v47 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v46);
      objc_msgSend(v47, "contactKey");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = &v64->_ucat->var0;
      if (*v53 <= 30)
      {
        if (*v53 != -1)
          goto LABEL_63;
        if (_LogCategory_Initialize((uint64_t)v53, 0x1Eu))
        {
          v53 = &v64->_ucat->var0;
LABEL_63:
          LogPrintF((uint64_t)v53, (uint64_t)"-[CURangingSession _updatePeers]", 0x1Eu, (uint64_t)"Responder add peer: %@\n", v48, v49, v50, v51, (uint64_t)v52);
        }
      }
      v54 = v64->_prResponder;
      v65[0] = v31;
      v65[1] = 3221225472;
      v65[2] = __32__CURangingSession__updatePeers__block_invoke_2;
      v65[3] = &unk_1E25DE278;
      v65[4] = v64;
      v65[5] = v52;
      -[PRContactAllowlist addTrustedContact:withCompletionHandler:](v54, "addTrustedContact:withCompletionHandler:", v47, v65);

      if (v44 != ++v46)
        continue;
      break;
    }
    v55 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v91, 16);
    v44 = v55;
    if (v55)
      continue;
    break;
  }
LABEL_69:

}

- (void)session:(id)a3 didEstimateScores:(id)a4
{
  PRSharingSession *v6;
  id v7;
  void (**v8)(void *, CURangingPeer *, CURangingMeasurement *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CURangingPeer *v13;
  void *v14;
  CURangingMeasurement *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  LogCategory *ucat;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  LogCategory *v34;
  uint64_t v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  CURangingSession *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = (PRSharingSession *)a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_prRangingSession != v6)
    goto LABEL_30;
  v8 = (void (**)(void *, CURangingPeer *, CURangingMeasurement *))_Block_copy(self->_measurementHandlerEx);
  if (!v8)
    goto LABEL_29;
  v40 = self;
  v39 = mach_absolute_time();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = v7;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v9)
    goto LABEL_24;
  v10 = v9;
  v38 = *(_QWORD *)v42;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v42 != v38)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
      v13 = objc_alloc_init(CURangingPeer);
      objc_msgSend(v12, "btAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CURangingPeer setDeviceAddress:](v13, "setDeviceAddress:", v14);

      v15 = objc_alloc_init(CURangingMeasurement);
      -[CURangingMeasurement setTimestampTicks:](v15, "setTimestampTicks:", v39);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = objc_msgSend(v12, "scoreId");
      else
        v16 = 0;
      v35 = v16;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"));
      -[CURangingMeasurement setIdentifier:](v15, "setIdentifier:", v17);

      objc_msgSend(v12, "range");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "measurement");
        -[CURangingMeasurement setDistanceMeters:](v15, "setDistanceMeters:");
        objc_msgSend(v19, "uncertainty");
        -[CURangingMeasurement setDistanceError:](v15, "setDistanceError:");
        v20 = 1;
      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(v12, "angle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "measurement");
        -[CURangingMeasurement setHorizontalAngle:](v15, "setHorizontalAngle:");
        objc_msgSend(v22, "uncertainty");
        -[CURangingMeasurement setHorizontalError:](v15, "setHorizontalError:");
        v20 |= 2u;
      }
      objc_msgSend(v12, "score");
      -[CURangingMeasurement setPtsScore:](v15, "setPtsScore:");
      -[CURangingMeasurement setFlags:](v15, "setFlags:", v20 | 8u);
      ucat = v40->_ucat;
      if (ucat->var0 <= 10)
      {
        if (ucat->var0 != -1)
          goto LABEL_18;
        if (_LogCategory_Initialize((uint64_t)v40->_ucat, 0xAu))
        {
          ucat = v40->_ucat;
LABEL_18:
          -[CURangingPeer deviceAddress](v13, "deviceAddress");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession session:didEstimateScores:]", 0xAu, (uint64_t)"Ranging measurement: peer %@, %@\n", v25, v26, v27, v28, (uint64_t)v24);

        }
      }
      v8[2](v8, v13, v15);

      ++v11;
    }
    while (v10 != v11);
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    v10 = v29;
  }
  while (v29);
LABEL_24:

  v7 = v36;
  if (!objc_msgSend(obj, "count"))
  {
    v34 = v40->_ucat;
    if (v34->var0 <= 10)
    {
      if (v34->var0 != -1)
        goto LABEL_27;
      if (_LogCategory_Initialize((uint64_t)v34, 0xAu))
      {
        v34 = v40->_ucat;
LABEL_27:
        LogPrintF((uint64_t)v34, (uint64_t)"-[CURangingSession session:didEstimateScores:]", 0xAu, (uint64_t)"Ranging measurement: no devices\n", v30, v31, v32, v33, v35);
      }
    }
  }
LABEL_29:

LABEL_30:
}

- (void)session:(id)a3 didFailwithError:(id)a4
{
  NSObject *dispatchQueue;
  PRSharingSession *v7;
  PRSharingSession *prRangingSession;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  LogCategory *ucat;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  dispatchQueue = self->_dispatchQueue;
  v7 = (PRSharingSession *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  prRangingSession = self->_prRangingSession;

  v13 = v18;
  if (prRangingSession != v7)
    goto LABEL_9;
  self->_prRangingInitiated = 0;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    v15 = (uint64_t)v18;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        goto LABEL_6;
      ucat = self->_ucat;
      v15 = (uint64_t)v18;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession session:didFailwithError:]", 0x5Au, (uint64_t)"### PR Ranging failed: %{error}\n", v9, v10, v11, v12, v15);
  }
LABEL_6:
  v16 = _Block_copy(self->_errorHandler);
  v17 = v16;
  if (v16)
    (*((void (**)(void *, id))v16 + 2))(v16, v18);

  v13 = v18;
LABEL_9:

}

- (void)session:(id)a3 didChangeProximitySensorState:(unint64_t)a4
{
  NSObject *dispatchQueue;
  PRSharingSession *v7;
  PRSharingSession *prRangingSession;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *ucat;
  const char *v14;
  uint64_t statusFlags;
  unsigned int v16;
  LogCategory *v17;
  LogCategory *v18;
  void (**v19)(void);
  void (**v20)(void);

  dispatchQueue = self->_dispatchQueue;
  v7 = (PRSharingSession *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  prRangingSession = self->_prRangingSession;

  if (prRangingSession != v7)
    return;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_11;
      ucat = self->_ucat;
    }
    if (a4 > 3)
      v14 = "?";
    else
      v14 = off_1E25DD3A0[a4];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession session:didChangeProximitySensorState:]", 0x1Eu, (uint64_t)"PR sensor state changed: %s\n", v9, v10, v11, v12, (uint64_t)v14);
  }
LABEL_11:
  statusFlags = self->_statusFlags;
  v16 = statusFlags & 0xFFFFFFFE | (a4 == 3);
  if (v16 == (_DWORD)statusFlags)
  {
    v17 = self->_ucat;
    if (v17->var0 > 10)
      return;
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0xAu))
        return;
      v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CURangingSession session:didChangeProximitySensorState:]", 0xAu, (uint64_t)"Status unchanged: %#{flags}\n", v9, v10, v11, v12, statusFlags);
    return;
  }
  self->_statusFlags = v16;
  v18 = self->_ucat;
  if (v18->var0 > 30)
    goto LABEL_21;
  if (v18->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v18, 0x1Eu))
      goto LABEL_21;
    v18 = self->_ucat;
  }
  LogPrintF((uint64_t)v18, (uint64_t)"-[CURangingSession session:didChangeProximitySensorState:]", 0x1Eu, (uint64_t)"Status changed: %#{flags} -> %#{flags}\n", v9, v10, v11, v12, statusFlags);
LABEL_21:
  v19 = (void (**)(void))_Block_copy(self->_statusChangedHandler);
  if (v19)
  {
    v20 = v19;
    v19[2]();
    v19 = v20;
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

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)label
{
  return self->_label;
}

- (id)measurementHandler
{
  return self->_measurementHandler;
}

- (void)setMeasurementHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)measurementHandlerEx
{
  return self->_measurementHandlerEx;
}

- (void)setMeasurementHandlerEx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)peers
{
  return self->_peers;
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong(&self->_measurementHandlerEx, 0);
  objc_storeStrong(&self->_measurementHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_prRangingSession, 0);
  objc_storeStrong((id *)&self->_prResponder, 0);
  objc_storeStrong((id *)&self->_peersRanging, 0);
}

void __32__CURangingSession__updatePeers__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  id v12;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v10 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
    if (*v10 <= 90)
    {
      v12 = v5;
      if (*v10 == -1)
      {
        v11 = _LogCategory_Initialize((uint64_t)v10, 0x5Au);
        v5 = v12;
        if (!v11)
          goto LABEL_7;
        v10 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CURangingSession _updatePeers]_block_invoke", 0x5Au, (uint64_t)"### Responder remove peer failed: %@, %{error}\n", v6, v7, v8, v9, *(_QWORD *)(a1 + 40));
      v5 = v12;
    }
  }
LABEL_7:

}

void __32__CURangingSession__updatePeers__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  id v12;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v10 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
    if (*v10 <= 90)
    {
      v12 = v5;
      if (*v10 == -1)
      {
        v11 = _LogCategory_Initialize((uint64_t)v10, 0x5Au);
        v5 = v12;
        if (!v11)
          goto LABEL_7;
        v10 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CURangingSession _updatePeers]_block_invoke_2", 0x5Au, (uint64_t)"### Responder add peer failed: %@, %{error}\n", v6, v7, v8, v9, *(_QWORD *)(a1 + 40));
      v5 = v12;
    }
  }
LABEL_7:

}

void __31__CURangingSession__invalidate__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  id v12;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v10 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
    if (*v10 <= 90)
    {
      v12 = v5;
      if (*v10 == -1)
      {
        v11 = _LogCategory_Initialize((uint64_t)v10, 0x5Au);
        v5 = v12;
        if (!v11)
          goto LABEL_7;
        v10 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CURangingSession _invalidate]_block_invoke", 0x5Au, (uint64_t)"### Responder remove peer failed: %@, %{error}\n", v6, v7, v8, v9, *(_QWORD *)(a1 + 40));
      v5 = v12;
    }
  }
LABEL_7:

}

uint64_t __30__CURangingSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;

  v8 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v8 + 9))
  {
    v9 = result;
    *(_BYTE *)(v8 + 9) = 1;
    v10 = *(_QWORD **)(result + 32);
    v11 = (int *)v10[6];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        v10 = *(_QWORD **)(v9 + 32);
        if (!v12)
          return objc_msgSend(v10, "_invalidate");
        v11 = (int *)v10[6];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CURangingSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v13);
      v10 = *(_QWORD **)(v9 + 32);
    }
    return objc_msgSend(v10, "_invalidate");
  }
  return result;
}

uint64_t __28__CURangingSession_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v13;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_5;
      v10 = *(int **)(v9 + 48);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CURangingSession activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  *(_BYTE *)(v9 + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void __30__CURangingSession_addSample___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int *v21;
  id v22;

  v9 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
  if (*v9 <= 10)
  {
    if (*v9 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v9, (uint64_t)"-[CURangingSession addSample:]_block_invoke", 0xAu, (uint64_t)"Add sample: %@\n", a5, a6, a7, a8, *(_QWORD *)(a1 + 40));
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)v9, 0xAu))
    {
      v9 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(*(id *)(a1 + 40), "deviceAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "deviceModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_13:

      goto LABEL_14;
    }
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v13 = (double)(int)objc_msgSend(*(id *)(a1 + 40), "rawRSSI");
    v14 = objc_msgSend(*(id *)(a1 + 40), "channel");
    v22 = 0;
    v15 = objc_msgSend(v12, "addRssiSample:channel:forPeer:peerDeviceModel:withError:", v14, v10, v11, &v22, v13);
    v20 = v22;
    if ((v15 & 1) == 0)
    {
      v21 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
      if (*v21 <= 90)
      {
        if (*v21 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v21, 0x5Au))
            goto LABEL_12;
          v21 = *(int **)(*(_QWORD *)(a1 + 32) + 48);
        }
        LogPrintF((uint64_t)v21, (uint64_t)"-[CURangingSession addSample:]_block_invoke", 0x5Au, (uint64_t)"### Add sample failed: %@, %{error}\n", v16, v17, v18, v19, *(_QWORD *)(a1 + 40));
      }
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:

}

uint64_t __29__CURangingSession_setPeers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

@end
