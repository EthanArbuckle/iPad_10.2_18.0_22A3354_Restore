@implementation CUSystemMonitorImp

BOOL __51__CUSystemMonitorImp__systemUIMonitorChangedFlags___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "systemUIChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__systemUIMonitorChangedFlags___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "systemUIChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

- (void)_invokeBlock:(id)a3 passingTest:(id)a4
{
  id v6;
  unsigned int (**v7)(id, _QWORD);
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _BYTE *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(id, _QWORD))a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_monitors;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_BYTE **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v13[9] && v7[2](v7, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)))
        {
          objc_msgSend(v13, "dispatchQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __47__CUSystemMonitorImp__invokeBlock_passingTest___block_invoke;
          v15[3] = &unk_1E25DE600;
          v15[4] = v13;
          v16 = v6;
          dispatch_async(v14, v15);

        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

void __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD block[5];
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a3, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = v12 != 0;
          if (v12)
            v7 |= objc_msgSend(v12, "unsignedIntValue");

        }
        else
        {
          v14 = 0;
        }
        objc_msgSend(v10, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19
          && (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v19),
              (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v21 = v20;
          v7 |= objc_msgSend(v20, "unsignedIntValue");

        }
        else if (!v14
               && gLogCategory_CUSystemMonitor <= 30
               && (gLogCategory_CUSystemMonitor != -1
                || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStart]_block_invoke", 0x1Eu, (uint64_t)"SystemUI unknown identifier: '%@' / '%@'", v15, v16, v17, v18, (uint64_t)v11);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v22 = *(_QWORD *)(a1 + 40);
  v23 = *(NSObject **)(v22 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_2;
  block[3] = &unk_1E25DE500;
  block[4] = v22;
  v25 = v7;
  dispatch_async(v23, block);
}

- (void)_systemUIMonitorChangedFlags:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
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
  uint64_t v21;
  unsigned int systemUIFlags;
  void *v23;

  v8 = *(_QWORD *)&a3;
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    NSPrintF((uint64_t)"%#{flags}", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrintF((uint64_t)"%#{flags}", v11, v12, v13, v14, v15, v16, v17, self->_systemUIFlags ^ v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorChangedFlags:]", 0x1Eu, (uint64_t)"SystemUI changed: %@, diff %@", v18, v19, v20, v21, (uint64_t)v10);

  }
  systemUIFlags = self->_systemUIFlags;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  self->_systemUIFlags = v8;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (systemUIFlags != (_DWORD)v8)
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_379, &__block_literal_global_380);
}

uint64_t __47__CUSystemMonitorImp__invokeBlock_passingTest___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

uint64_t __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_systemUIMonitorChangedFlags:", *(_DWORD *)(*(_QWORD *)(a1 + 32) + 596) & 0x40000u | *(_DWORD *)(a1 + 40));
}

uint64_t __48__CUSystemMonitorImp__manatreeUpdateRetryTimer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manatreeUpdateRetryTimer:]_block_invoke", 0x1Eu, (uint64_t)"Manatee retry timer fired", a5, a6, a7, a8, v14);
  }
  result = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(result + 160);
  if (v10)
  {
    v11 = v10;
    dispatch_source_cancel(v11);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 160);
    *(_QWORD *)(v12 + 160) = 0;

    result = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(result + 156))
    return objc_msgSend((id)result, "_manateeRead");
  return result;
}

uint64_t __34__CUSystemMonitorImp__manateeRead__block_invoke_4(uint64_t a1)
{
  _BYTE *v2;
  _BOOL8 v3;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[156])
    v3 = *(_QWORD *)(a1 + 40) != 0;
  else
    v3 = 0;
  return objc_msgSend(v2, "_manatreeUpdateRetryTimer:", v3);
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  _QWORD aBlock[5];
  id v30;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_4;
  aBlock[3] = &unk_1E25DE628;
  v2 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v30 = v2;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v10 + 156))
  {
    v11 = *(unsigned __int8 *)(a1 + 48);
    if (*(_BYTE *)(a1 + 48))
      v12 = 2;
    else
      v12 = 1;
    if (*(_DWORD *)(v10 + 152) == v12)
    {
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        v14 = 30;
      else
        v14 = 10;
      if ((int)v14 >= gLogCategory_CUSystemMonitor)
      {
        if (gLogCategory_CUSystemMonitor == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, v14))
            goto LABEL_31;
          v13 = *(_QWORD *)(a1 + 40);
        }
        NSPrintF((uint64_t)"%{error}", v14, v3, v4, v5, v6, v7, v8, v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = "Available";
        if (!v11)
          v20 = "Unavailable";
        if (v13)
          v21 = 30;
        else
          v21 = 10;
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manateeRead]_block_invoke_3", v21, (uint64_t)"Manatee State unchanged: %s, error=%@", v15, v16, v17, v18, (uint64_t)v20);

      }
    }
    else
    {
      pthread_mutex_lock(&gCUSystemMonitorLock);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 148) = *(_BYTE *)(a1 + 48);
      if (*(_BYTE *)(a1 + 48))
        v22 = 2;
      else
        v22 = 1;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 152) = v22;
      pthread_mutex_unlock(&gCUSystemMonitorLock);
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        v27 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 152);
        if (v27 > 2)
          v28 = "?";
        else
          v28 = off_1E25DE060[v27];
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manateeRead]_block_invoke_3", 0x1Eu, (uint64_t)"Manatee read: %s, %{error}\n", v23, v24, v25, v26, (uint64_t)v28);
      }
      objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_127, &__block_literal_global_128);
    }
  }
LABEL_31:
  v9[2](v9);

}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  char v11;
  id v12;

  v2 = objc_alloc((Class)getCDPStateControllerClass[0]());
  objc_msgSend((Class)getCDPContextClass[0](), "contextForPrimaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContext:", v3);

  v12 = 0;
  LOBYTE(v3) = objc_msgSend(v4, "isManateeAvailable:", &v12);
  v5 = v12;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_3;
  v9[3] = &unk_1E25DD868;
  v9[4] = v6;
  v10 = v5;
  v11 = (char)v3;
  v8 = v5;
  dispatch_async(v7, v9);

}

- (void)_manatreeUpdateRetryTimer:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  OS_dispatch_source *manateeRetryTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  OS_dispatch_source *v18;
  OS_dispatch_source *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_time_t v22;
  uint64_t v23;
  _QWORD handler[5];

  v8 = a3;
  manateeRetryTimer = self->_manateeRetryTimer;
  if (manateeRetryTimer)
  {
    if (gLogCategory_CUSystemMonitor >= 31)
    {
      v11 = manateeRetryTimer;
LABEL_8:
      dispatch_source_cancel(v11);
      v12 = self->_manateeRetryTimer;
      self->_manateeRetryTimer = 0;

      goto LABEL_9;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manatreeUpdateRetryTimer:]", 0x1Eu, (uint64_t)"Manatee retry timer cancel", v4, v5, v6, v7, v23);
    v11 = self->_manateeRetryTimer;
    if (v11)
      goto LABEL_8;
  }
LABEL_9:
  if (v8)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      NSPrintF((uint64_t)"%{dur}", (uint64_t)a2, a3, v3, v4, v5, v6, v7, 300);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manatreeUpdateRetryTimer:]", 0x1Eu, (uint64_t)"Manatee retry timer start: %@", v14, v15, v16, v17, (uint64_t)v13);

    }
    v18 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v19 = self->_manateeRetryTimer;
    self->_manateeRetryTimer = v18;

    v20 = self->_manateeRetryTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __48__CUSystemMonitorImp__manatreeUpdateRetryTimer___block_invoke;
    handler[3] = &unk_1E25DF2A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    v21 = self->_manateeRetryTimer;
    v22 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)self->_manateeRetryTimer);
  }
}

- (void)_manateeRead
{
  _QWORD block[5];

  if (_manateeRead_sOnce != -1)
    dispatch_once(&_manateeRead_sOnce, &__block_literal_global_123_8145);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_2;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)_manateeRead_cdpQueue, block);
}

- (CUSystemMonitorImp)init
{
  char *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;
  void *v7;
  char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUSystemMonitorImp;
  v2 = -[CUSystemMonitorImp init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("CUSystemMonitor", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v6;

    *((_DWORD *)v2 + 24) = -1;
    *((_DWORD *)v2 + 32) = -1;
    *(_QWORD *)(v2 + 212) = -1;
    *((_DWORD *)v2 + 58) = -1;
    *((_DWORD *)v2 + 90) = -1;
    *((_DWORD *)v2 + 95) = -1;
    *((_DWORD *)v2 + 110) = -1;
    v2[480] = 1;
    *((_DWORD *)v2 + 121) = -1;
    *((_DWORD *)v2 + 123) = -1;
    *(_QWORD *)(v2 + 588) = -1;
    *((_DWORD *)v2 + 155) = -1;
    v8 = v2;
  }

  return (CUSystemMonitorImp *)v2;
}

- (void)addMonitor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CUSystemMonitorImp_addMonitor_completion___block_invoke;
  block[3] = &unk_1E25DD410;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)removeMonitor:(id)a3
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
  v7[2] = __36__CUSystemMonitorImp_removeMonitor___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (BOOL)_hasMonitorPassingTest:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_monitors;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke;
  block[3] = &unk_1E25DD410;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)_update
{
  _BOOL4 v3;
  BOOL v4;
  char v5;
  _BOOL8 v6;

  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_8208))
    -[CUSystemMonitorImp _bluetoothAddressMonitorStart](self, "_bluetoothAddressMonitorStart");
  else
    -[CUSystemMonitorImp _bluetoothAddressMonitorStop](self, "_bluetoothAddressMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_20))
    -[CUSystemMonitorImp _callMonitorStart](self, "_callMonitorStart");
  else
    -[CUSystemMonitorImp _callMonitorStop](self, "_callMonitorStop");
  v3 = -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_21);
  v4 = v3;
  if (!v3)
  {
    -[CUSystemMonitorImp _familyMonitorStop](self, "_familyMonitorStop");
    goto LABEL_11;
  }
  if (self->_firstUnlocked)
  {
    -[CUSystemMonitorImp _familyMonitorStart](self, "_familyMonitorStart");
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = 1;
LABEL_12:
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_22))
    -[CUSystemMonitorImp _locationVisitsMonitorStart](self, "_locationVisitsMonitorStart");
  else
    -[CUSystemMonitorImp _locationVisitsMonitorStop](self, "_locationVisitsMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_23))
    -[CUSystemMonitorImp _manateeMonitorStart](self, "_manateeMonitorStart");
  else
    -[CUSystemMonitorImp _manateeMonitorStop](self, "_manateeMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_24))
    -[CUSystemMonitorImp _meDeviceMonitorStart](self, "_meDeviceMonitorStart");
  else
    -[CUSystemMonitorImp _meDeviceMonitorStop](self, "_meDeviceMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_25))
    -[CUSystemMonitorImp _motionMonitorStart](self, "_motionMonitorStart");
  else
    -[CUSystemMonitorImp _motionMonitorStop](self, "_motionMonitorStop");
  v6 = -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_26);
  -[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:](self, "_systemConfigUpdateKeyPtr:name:enabled:creator:", &self->_scPatternNetInterfaceIPv4, CFSTR("NetIfIPv4"), v6, &__block_literal_global_30);
  -[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:](self, "_systemConfigUpdateKeyPtr:name:enabled:creator:", &self->_scPatternNetInterfaceIPv6, CFSTR("NetIfIPv6"), v6, &__block_literal_global_33);
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_34_8210)
    || -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_35)
    || -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_36_8211))
  {
    -[CUSystemMonitorImp _netInterfaceMonitorStart](self, "_netInterfaceMonitorStart");
  }
  else
  {
    -[CUSystemMonitorImp _netInterfaceMonitorStop](self, "_netInterfaceMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_37))
  {
    -[CUSystemMonitorImp _powerUnlimitedMonitorStart](self, "_powerUnlimitedMonitorStart");
    if (v4)
      goto LABEL_33;
  }
  else
  {
    -[CUSystemMonitorImp _powerUnlimitedMonitorStop](self, "_powerUnlimitedMonitorStop");
    if (v4)
    {
LABEL_33:
      -[CUSystemMonitorImp _primaryAppleIDMonitorStart](self, "_primaryAppleIDMonitorStart");
      goto LABEL_35;
    }
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_38_8212))
    goto LABEL_33;
  -[CUSystemMonitorImp _primaryAppleIDMonitorStop](self, "_primaryAppleIDMonitorStop");
LABEL_35:
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_39))
    -[CUSystemMonitorImp _regionMonitorStart](self, "_regionMonitorStart");
  else
    -[CUSystemMonitorImp _regionMonitorStop](self, "_regionMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_40))
    -[CUSystemMonitorImp _rotatingIdentifierMonitorStart](self, "_rotatingIdentifierMonitorStart");
  else
    -[CUSystemMonitorImp _rotatingIdentifierMonitorStop](self, "_rotatingIdentifierMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_41))
    -[CUSystemMonitorImp _screenLockedMonitorStart](self, "_screenLockedMonitorStart");
  else
    -[CUSystemMonitorImp _screenLockedMonitorStop](self, "_screenLockedMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_42_8213))
    -[CUSystemMonitorImp _screenOnMonitorStart](self, "_screenOnMonitorStart");
  else
    -[CUSystemMonitorImp _screenOnMonitorStop](self, "_screenOnMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_43))
    -[CUSystemMonitorImp _screenSaverMonitorStart](self, "_screenSaverMonitorStart");
  else
    -[CUSystemMonitorImp _screenSaverMonitorStop](self, "_screenSaverMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_44))
    -[CUSystemMonitorImp _screenStateMonitorStart](self, "_screenStateMonitorStart");
  else
    -[CUSystemMonitorImp _screenStateMonitorStop](self, "_screenStateMonitorStop");
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_45))
    -[CUSystemMonitorImp _systemLockStateMonitorStart](self, "_systemLockStateMonitorStart");
  else
    -[CUSystemMonitorImp _systemLockStateMonitorStop](self, "_systemLockStateMonitorStop");
  -[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:](self, "_systemConfigUpdateKeyPtr:name:enabled:creator:", &self->_scKeySystemName, CFSTR("SystemName"), -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_46), &__block_literal_global_49);
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_50))
  {
    -[CUSystemMonitorImp _systemUIMonitorStart](self, "_systemUIMonitorStart");
    if ((v5 & 1) != 0)
      goto LABEL_61;
  }
  else
  {
    -[CUSystemMonitorImp _systemUIMonitorStop](self, "_systemUIMonitorStop");
    if ((v5 & 1) != 0)
    {
LABEL_61:
      -[CUSystemMonitorImp _firstUnlockMonitorStart](self, "_firstUnlockMonitorStart");
      goto LABEL_63;
    }
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_51))
    goto LABEL_61;
  -[CUSystemMonitorImp _firstUnlockMonitorStop](self, "_firstUnlockMonitorStop");
LABEL_63:
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_52_8214))
    -[CUSystemMonitorImp _wifiMonitorStart](self, "_wifiMonitorStart");
  else
    -[CUSystemMonitorImp _wifiMonitorStop](self, "_wifiMonitorStop");
  if (self->_scChangesPending)
    -[CUSystemMonitorImp _systemConfigUpdateNotifications](self, "_systemConfigUpdateNotifications");
}

- (void)_bluetoothAddressMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CUBluetoothClient *v7;
  CUBluetoothClient *bluetoothClient;
  uint64_t v9;
  _QWORD v10[5];

  if (!self->_bluetoothClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]", 0x1Eu, (uint64_t)"Bluetooth address monitor start\n", v2, v3, v4, v5, v9);
    }
    v7 = objc_alloc_init(CUBluetoothClient);
    bluetoothClient = self->_bluetoothClient;
    self->_bluetoothClient = v7;

    -[CUBluetoothClient setDispatchQueue:](self->_bluetoothClient, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBluetoothClient setLabel:](self->_bluetoothClient, "setLabel:", CFSTR("SysMon"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke;
    v10[3] = &unk_1E25DD738;
    v10[4] = self;
    -[CUBluetoothClient setBluetoothAddressChangedHandler:](self->_bluetoothClient, "setBluetoothAddressChangedHandler:", v10);
    -[CUBluetoothClient activate](self->_bluetoothClient, "activate");
  }
}

- (void)_bluetoothAddressMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CUBluetoothClient *bluetoothClient;
  uint64_t v8;

  if (self->_bluetoothClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStop]", 0x1Eu, (uint64_t)"Bluetooth address monitor stop\n", v2, v3, v4, v5, v8);
    }
    -[CUBluetoothClient invalidate](self->_bluetoothClient, "invalidate");
    bluetoothClient = self->_bluetoothClient;
    self->_bluetoothClient = 0;

  }
}

- (void)_callMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  TUCallCenter *v7;
  TUCallCenter *callCenter;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CXCallObserver *v17;
  CXCallObserver *callObserver;
  uint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (self->_callObserver)
    return;
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callMonitorStart]", 0x1Eu, (uint64_t)"Call monitoring start\n", v2, v3, v4, v5, v29);
  }
  objc_msgSend((Class)getTUCallCenterClass[0](), "callCenterWithQueue:", self->_dispatchQueue);
  v7 = (TUCallCenter *)objc_claimAutoreleasedReturnValue();
  callCenter = self->_callCenter;
  self->_callCenter = v7;

  getTUCallCenterCallStatusChangedNotification[0]();
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    getTUCallCenterCallConnectedNotification[0]();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_10:

      goto LABEL_11;
    }
    v12 = (void *)v11;
    getTUCallCenterVideoCallStatusChangedNotification();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      getTUCallCenterCallStatusChangedNotification[0]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__callCenterStatusChanged_, v14, 0);

      getTUCallCenterCallConnectedNotification[0]();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__callCenterStatusChanged_, v15, 0);

      getTUCallCenterVideoCallStatusChangedNotification();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__callCenterStatusChanged_, v16, 0);

      self->_callStatusObserving = 1;
      goto LABEL_10;
    }
  }
LABEL_11:
  v17 = (CXCallObserver *)objc_alloc_init((Class)getCXCallObserverClass[0]());
  callObserver = self->_callObserver;
  self->_callObserver = v17;

  -[CXCallObserver setDelegate:queue:](self->_callObserver, "setDelegate:queue:", self, self->_dispatchQueue);
  v19 = -[CUSystemMonitorImp _activeCallCountUnached](self, "_activeCallCountUnached");
  v20 = -[CUSystemMonitorImp _connectedCallCountUnached](self, "_connectedCallCountUnached");
  v21 = -[CUSystemMonitorImp _callFlagsUncached](self, "_callFlagsUncached");
  v22 = -[CUSystemMonitorImp _callInfoUncached](self, "_callInfoUncached");
  v24 = v23;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  self->_connectedCallCount = v20;
  self->_activeCallCount = v19;
  self->_callFlags = v21;
  *(_QWORD *)&self->_callInfo.callCountIncomingConnected = v22;
  *(_QWORD *)&self->_callInfo.callCountOutgoingConnected = v24;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callMonitorStart]", 0x1Eu, (uint64_t)"Calls initial: active %d, connected %d, call flags %#{flags}\n", v25, v26, v27, v28, v19);
  }
}

- (void)_callMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CXCallObserver *callObserver;
  TUCallCenter *callCenter;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  if (self->_callObserver
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callMonitorStop]", 0x1Eu, (uint64_t)"Call monitoring stop\n", v2, v3, v4, v5, v16);
  }
  -[CXCallObserver setDelegate:queue:](self->_callObserver, "setDelegate:queue:", 0, self->_dispatchQueue);
  callObserver = self->_callObserver;
  self->_callObserver = 0;

  callCenter = self->_callCenter;
  self->_callCenter = 0;

  if (self->_callStatusObserving)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    getTUCallCenterCallStatusChangedNotification[0]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      getTUCallCenterCallStatusChangedNotification[0]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObserver:name:object:", self, v10, 0);

    }
    getTUCallCenterCallConnectedNotification[0]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      getTUCallCenterCallConnectedNotification[0]();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObserver:name:object:", self, v12, 0);

    }
    getTUCallCenterVideoCallStatusChangedNotification();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v17;
    if (v13)
    {
      getTUCallCenterVideoCallStatusChangedNotification();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObserver:name:object:", self, v15, 0);

      v14 = v17;
    }
    self->_callStatusObserving = 0;

  }
}

- (void)_callCenterStatusChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CUSystemMonitorImp__callCenterStatusChanged___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v10 = a4;
  if (self->_callObserver)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp callObserver:callChanged:]", 0x1Eu, (uint64_t)"CallKit changed\n", v6, v7, v8, v9, v11);
    }
    -[CUSystemMonitorImp _callInfoChanged](self, "_callInfoChanged");
  }

}

- (void)_callInfoChanged
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int callCountIncomingUnconnected;
  int callCountOutgoingUnconnected;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t activeCallCount;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  _BOOL4 v25;
  int callCountOutgoingConnected;
  uint64_t callCountIncomingConnected;
  uint64_t v28;
  uint64_t callFlags;
  uint64_t connectedCallCount;
  uint64_t v31;

  v3 = -[CUSystemMonitorImp _activeCallCountUnached](self, "_activeCallCountUnached");
  v4 = -[CUSystemMonitorImp _connectedCallCountUnached](self, "_connectedCallCountUnached");
  v5 = -[CUSystemMonitorImp _callFlagsUncached](self, "_callFlagsUncached");
  callCountIncomingUnconnected = self->_callInfo.callCountIncomingUnconnected;
  callCountOutgoingUnconnected = self->_callInfo.callCountOutgoingUnconnected;
  callCountOutgoingConnected = self->_callInfo.callCountOutgoingConnected;
  callCountIncomingConnected = self->_callInfo.callCountIncomingConnected;
  v8 = -[CUSystemMonitorImp _callInfoUncached](self, "_callInfoUncached");
  v10 = v9;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  connectedCallCount = self->_connectedCallCount;
  activeCallCount = self->_activeCallCount;
  v28 = v4;
  callFlags = self->_callFlags;
  self->_connectedCallCount = v4;
  self->_activeCallCount = v3;
  self->_callFlags = v5;
  v31 = v5;
  *(_QWORD *)&self->_callInfo.callCountIncomingConnected = v8;
  *(_QWORD *)&self->_callInfo.callCountOutgoingConnected = v10;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  v25 = v3 != activeCallCount;
  if ((_DWORD)v3 == (_DWORD)activeCallCount)
  {
    v16 = callCountIncomingUnconnected;
    v18 = callCountOutgoingConnected;
    v17 = callCountIncomingConnected;
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0xAu, (uint64_t)"Active calls unchanged (%d)\n", v12, v13, v14, v15, v3);
    }
  }
  else
  {
    v16 = callCountIncomingUnconnected;
    v18 = callCountOutgoingConnected;
    v17 = callCountIncomingConnected;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0x1Eu, (uint64_t)"Active calls changed: %d -> %d\n", v12, v13, v14, v15, activeCallCount);
    }
  }
  v19 = gLogCategory_CUSystemMonitor;
  if (__PAIR64__(v16, v17) == v8 && __PAIR64__(callCountOutgoingUnconnected, v18) == v10)
  {
    v21 = v28;
    v20 = callFlags;
    if (gLogCategory_CUSystemMonitor > 10)
    {
      v23 = v31;
      v22 = connectedCallCount;
      v24 = v25;
      goto LABEL_26;
    }
    v22 = connectedCallCount;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0xAu, (uint64_t)"Call info unchanged: incoming connected %d, incoming unconnected %d, outcoming connected %d, outcoming unconnected %d", v12, v13, v14, v15, v17);
    v23 = v31;
    v24 = v25;
  }
  else
  {
    if (gLogCategory_CUSystemMonitor > 30)
    {
      v24 = 1;
      v23 = v31;
      v21 = v28;
      v20 = callFlags;
      v22 = connectedCallCount;
      goto LABEL_26;
    }
    v22 = connectedCallCount;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0x1Eu, (uint64_t)"Call info changed: incoming connected %d -> %d, incoming unconnected %d -> %d, outcoming connected %d -> %d, outcoming unconnected %d -> %d", v12, v13, v14, v15, v17);
    v24 = 1;
    v23 = v31;
    v21 = v28;
    v20 = callFlags;
  }
  v19 = gLogCategory_CUSystemMonitor;
LABEL_26:
  if ((_DWORD)v21 == (_DWORD)v22)
  {
    if (v19 <= 10 && (v19 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0xAu, (uint64_t)"Connected calls unchanged (%d)\n", v12, v13, v14, v15, v21);
  }
  else
  {
    if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0x1Eu, (uint64_t)"Connected calls changed: %d -> %d\n", v12, v13, v14, v15, v22);
    v24 = 1;
  }
  if ((_DWORD)v23 != (_DWORD)v20)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0x1Eu, (uint64_t)"Call flags changed: %#{flags} -> %#{flags}\n", v12, v13, v14, v15, v20);
    }
    goto LABEL_48;
  }
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0xAu, (uint64_t)"Call flags unchanged: %#{flags}\n", v12, v13, v14, v15, v23);
  }
  if (v24)
LABEL_48:
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_81, &__block_literal_global_82);
}

- ($A3B2E143E1A03423F9FC703C010436DC)_callInfoUncached
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  $A3B2E143E1A03423F9FC703C010436DC result;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TUCallCenter currentAudioAndVideoCalls](self->_callCenter, "currentAudioAndVideoCalls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v4 = 0;
  if (v3)
  {
    LODWORD(v5) = 0;
    LODWORD(v6) = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "isConnected");
        v11 = objc_msgSend(v9, "isOutgoing");
        v6 = v6 + (v10 & (v11 ^ 1));
        v5 = v5 + ((v10 | v11) ^ 1);
        v12 = (v4 + 1) | v4 & 0xFFFFFFFF00000000;
        if ((v10 & v11) == 0)
          v12 = v4;
        v13 = v4 & 0xFFFFFFFF00000000 | v12;
        if (v10 | v11 ^ 1)
          v4 = v12;
        else
          v4 = v13 + 0x100000000;
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
    v3 = v5 << 32;
  }
  else
  {
    v6 = 0;
  }

  v14 = v3 | v6;
  v15 = v4;
  result.var2 = v15;
  result.var3 = HIDWORD(v15);
  result.var0 = v14;
  result.var1 = HIDWORD(v14);
  return result;
}

- (int)_activeCallCountUnached
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CXCallObserver calls](self->_callObserver, "calls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hasEnded") ^ 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unsigned)_callFlagsUncached
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUCallCenter currentAudioAndVideoCalls](self->_callCenter, "currentAudioAndVideoCalls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "service");
        switch(v8)
        {
          case 3:
            v5 |= 4u;
            break;
          case 2:
            v5 |= 2u;
            break;
          case 1:
            v5 |= 1u;
            break;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)_connectedCallCountUnached
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CXCallObserver calls](self->_callObserver, "calls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasConnected"))
          v5 += objc_msgSend(v8, "hasEnded") ^ 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_familyMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CUSystemMonitor *v7;
  CUSystemMonitor *familyPrimaryIPMonitor;
  uint64_t v9;
  CUSystemMonitor *v10;
  const char *v11;
  NSObject *dispatchQueue;
  NSObject *v13;
  uint64_t v14[5];
  _QWORD handler[5];
  _QWORD v16[5];
  _QWORD v17[5];

  if (!self->_familyPrimaryIPMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]", 0x1Eu, (uint64_t)"Family monitoring start\n", v2, v3, v4, v5, v14[0]);
    }
    v7 = objc_alloc_init(CUSystemMonitor);
    familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
    self->_familyPrimaryIPMonitor = v7;

    -[CUSystemMonitor setDispatchQueue:](self->_familyPrimaryIPMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke;
    v17[3] = &unk_1E25DF2A0;
    v17[4] = self;
    -[CUSystemMonitor setPrimaryIPChangedHandler:](self->_familyPrimaryIPMonitor, "setPrimaryIPChangedHandler:", v17);
    v10 = self->_familyPrimaryIPMonitor;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_2;
    v16[3] = &unk_1E25DF2A0;
    v16[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v10, "activateWithCompletion:", v16);
  }
  if (self->_familyBuddyToken == -1)
  {
    v11 = (const char *)objc_msgSend(objc_retainAutorelease((id)getBYSetupAssistantFinishedDarwinNotification[0]()), "UTF8String");
    if (v11)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_3;
      handler[3] = &unk_1E25DE468;
      handler[4] = self;
      notify_register_dispatch(v11, &self->_familyBuddyToken, dispatchQueue, handler);
    }
  }
  if (self->_familyUpdatedToken == -1)
  {
    v13 = self->_dispatchQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = (uint64_t)__41__CUSystemMonitorImp__familyMonitorStart__block_invoke_4;
    v14[3] = (uint64_t)&unk_1E25DE468;
    v14[4] = (uint64_t)self;
    notify_register_dispatch("com.apple.family.family_updated", &self->_familyUpdatedToken, v13, v14);
    -[CUSystemMonitorImp _familyGetMembers:](self, "_familyGetMembers:", 1);
  }
}

- (void)_familyMonitorStop
{
  CUSystemMonitor *familyPrimaryIPMonitor;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int familyBuddyToken;
  int familyUpdatedToken;
  uint64_t v10;

  self->_familyFailed = 0;
  -[CUSystemMonitor invalidate](self->_familyPrimaryIPMonitor, "invalidate");
  familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
  self->_familyPrimaryIPMonitor = 0;

  familyBuddyToken = self->_familyBuddyToken;
  if (familyBuddyToken != -1)
  {
    notify_cancel(familyBuddyToken);
    self->_familyBuddyToken = -1;
  }
  familyUpdatedToken = self->_familyUpdatedToken;
  if (familyUpdatedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30)
      goto LABEL_9;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyMonitorStop]", 0x1Eu, (uint64_t)"Family monitoring stop\n", v4, v5, v6, v7, v10);
    familyUpdatedToken = self->_familyUpdatedToken;
    if (familyUpdatedToken != -1)
    {
LABEL_9:
      notify_cancel(familyUpdatedToken);
      self->_familyUpdatedToken = -1;
    }
  }
}

- (void)_familyGetMembers:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  const char *v9;
  id v10;
  _QWORD v11[5];
  BOOL v12;
  uint64_t v13;

  v7 = a3;
  if (SetupAssistantLibrary_sOnce != -1)
    dispatch_once(&SetupAssistantLibrary_sOnce, &__block_literal_global_1044);
  if (SetupAssistantLibrary_sLib
    && dlsym((void *)SetupAssistantLibrary_sLib, "BYSetupAssistantNeedsToRun")
    && softLinkBYSetupAssistantNeedsToRun[0]())
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]", 0x1Eu, (uint64_t)"Family get members skipped when setup needs to run\n", v3, v4, v5, v6, v13);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v9 = "";
      if (v7)
        v9 = "(first)";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]", 0x1Eu, (uint64_t)"Family get members %s\n", v3, v4, v5, v6, (uint64_t)v9);
    }
    self->_familyFailed = 0;
    v10 = objc_alloc_init((Class)getFAFetchFamilyCircleRequestClass[0]());
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__CUSystemMonitorImp__familyGetMembers___block_invoke;
    v11[3] = &unk_1E25DD7C0;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v10, "startRequestWithCompletionHandler:", v11);

  }
}

- (void)_familyNetworkChanged
{
  CUSystemMonitor *familyPrimaryIPMonitor;
  CUSystemMonitor *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  int v11;

  familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
  if (familyPrimaryIPMonitor && self->_familyFailed)
  {
    memset(v10, 0, sizeof(v10));
    v11 = 0;
    -[CUSystemMonitor primaryIPv4Addr](familyPrimaryIPMonitor, "primaryIPv4Addr");
    v4 = self->_familyPrimaryIPMonitor;
    if (v4)
      -[CUSystemMonitor primaryIPv6Addr](v4, "primaryIPv6Addr");
    if (BYTE1(v10[0]) == 2)
    {
      -[CUSystemMonitorImp _primaryAppleIDAccount](self, "_primaryAppleIDAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyNetworkChanged]", 0x1Eu, (uint64_t)"Family retry on network change: IPv4 %##a, IPv6 %##a\n", v6, v7, v8, v9, (uint64_t)v10);
        }
        -[CUSystemMonitorImp _familyGetMembers:](self, "_familyGetMembers:", 0);
      }
    }
  }
}

- (void)_familyUpdated:(id)a3
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
  v7[2] = __37__CUSystemMonitorImp__familyUpdated___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_locationVisitsMonitorStart
{
  CLLocationManager **p_locationManager;
  CLLocationManager *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_locationManager = &self->_locationManager;
  v4 = self->_locationManager;
  if (!v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_monitors;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "locationVisitsBundle");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v15 = (void *)v10;

            if (gLogCategory_CUSystemMonitor <= 30
              && (gLogCategory_CUSystemMonitor != -1
               || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
            {
              getkCLLocationAccuracyHundredMeters[0]();
              LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStart]", 0x1Eu, (uint64_t)"Location visit monitoring start: %f", v16, v17, v18, v19, v20);
            }
            v4 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)getCLLocationManagerClass[0]()), "initWithEffectiveBundle:delegate:onQueue:", v15, self, self->_dispatchQueue);
            objc_storeStrong((id *)p_locationManager, v4);
            getkCLLocationAccuracyHundredMeters[0]();
            -[CLLocationManager setDesiredAccuracy:](v4, "setDesiredAccuracy:");
            -[CLLocationManager startMonitoringVisits](v4, "startMonitoringVisits");

            goto LABEL_20;
          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v7)
          continue;
        break;
      }
    }

    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStart]", 0x5Au, (uint64_t)"### Location visit no bundle", v11, v12, v13, v14, v21);
    }
    v4 = 0;
  }
LABEL_20:

}

- (void)_locationVisitsMonitorStop
{
  CLLocationManager *v3;
  CLLocationManager *locationManager;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CLLocationManager *v10;

  v3 = self->_locationManager;
  if (v3)
  {
    v10 = v3;
    locationManager = self->_locationManager;
    self->_locationManager = 0;

    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStop]", 0x1Eu, (uint64_t)"Location visit monitoring stop", v5, v6, v7, v8, v9);
    }
    -[CLLocationManager stopMonitoringVisits](v10, "stopMonitoringVisits");
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_locationVisitsFlags = 0;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    v3 = v10;
  }

}

- (void)_locationVisitUpdate:(id)a3 arrived:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t locationVisitsFlags;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v4 = a4;
  objc_msgSend(a3, "_placeInference");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v20, "userType");
  if ((unint64_t)(v6 - 1) > 3)
    v11 = 0;
  else
    v11 = dword_18D51D4E0[v6 - 1];
  locationVisitsFlags = self->_locationVisitsFlags;
  v13 = locationVisitsFlags | v11;
  v14 = locationVisitsFlags & ~v11;
  if (v4)
    v15 = v13;
  else
    v15 = v14;
  if (v15 == (_DWORD)locationVisitsFlags)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitUpdate:arrived:]", 0xAu, (uint64_t)"Location visit unchanged: %#{flags}", v7, v8, v9, v10, locationVisitsFlags);
    }
  }
  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_locationVisitsFlags = v15;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitUpdate:arrived:]", 0x1Eu, (uint64_t)"Location visit changed: %#{flags} -> %#{flags}\n", v16, v17, v18, v19, locationVisitsFlags);
    }
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_109, &__block_literal_global_110);
  }

}

- (void)locationManager:(id)a3 didArrive:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  NSObject *dispatchQueue;
  CLLocationManager *v10;
  CLLocationManager *locationManager;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a4;
  v8 = (void (**)(_QWORD))a5;
  dispatchQueue = self->_dispatchQueue;
  v10 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v10)
  {
    objc_msgSend(v20, "_placeInference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userType");
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      v14 = v13;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v14 > 4)
          v15 = "?";
        else
          v15 = off_1E25DE038[v14];
        objc_msgSend(v12, "confidence");
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didArrive:completion:]", 0x1Eu, (uint64_t)"Location visit arrived: %s, confidence %f", v16, v17, v18, v19, (uint64_t)v15);
      }
    }
    -[CUSystemMonitorImp _locationVisitUpdate:arrived:](self, "_locationVisitUpdate:arrived:", v20, 1);
    v8[2](v8);

  }
  else
  {
    v8[2](v8);
  }

}

- (void)locationManager:(id)a3 didDepart:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  NSObject *dispatchQueue;
  CLLocationManager *v10;
  CLLocationManager *locationManager;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a4;
  v8 = (void (**)(_QWORD))a5;
  dispatchQueue = self->_dispatchQueue;
  v10 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v10)
  {
    objc_msgSend(v20, "_placeInference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userType");
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      v14 = v13;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v14 > 4)
          v15 = "?";
        else
          v15 = off_1E25DE038[v14];
        objc_msgSend(v12, "confidence");
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didDepart:completion:]", 0x1Eu, (uint64_t)"Location visit departed: %s, confidence %f", v16, v17, v18, v19, (uint64_t)v15);
      }
    }
    -[CUSystemMonitorImp _locationVisitUpdate:arrived:](self, "_locationVisitUpdate:arrived:", v20, 0);
    v8[2](v8);

  }
  else
  {
    v8[2](v8);
  }

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  CLLocationManager *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  CLLocationManager *v11;

  v11 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = v11;
  if (self->_locationManager == v11 && gLogCategory_CUSystemMonitor <= 30)
  {
    if (gLogCategory_CUSystemMonitor != -1
      || (v10 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu), v4 = v11, v10))
    {
      v5 = -[CLLocationManager authorizationStatus](v4, "authorizationStatus");
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManagerDidChangeAuthorization:]", 0x1Eu, (uint64_t)"Location authorization changed: %d", v6, v7, v8, v9, v5);
      v4 = v11;
    }
  }

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    v5 = objc_msgSend(v10, "count");
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didUpdateLocations:]", 0x1Eu, (uint64_t)"Location updated locations: %d", v6, v7, v8, v9, v5);
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSObject *dispatchQueue;
  CLLocationManager *v7;
  CLLocationManager *locationManager;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  dispatchQueue = self->_dispatchQueue;
  v7 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v7
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didFailWithError:]", 0x1Eu, (uint64_t)"Location visit failed: %{error}", v9, v10, v11, v12, (uint64_t)v13);
  }

}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  NSObject *dispatchQueue;
  CLLocationManager *v7;
  CLLocationManager *locationManager;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a4;
  dispatchQueue = self->_dispatchQueue;
  v7 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v7)
  {
    objc_msgSend(v17, "_placeInference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userType");
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      v11 = v10;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v11 > 4)
          v12 = "?";
        else
          v12 = off_1E25DE038[v11];
        objc_msgSend(v9, "confidence");
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didVisit:]", 0x1Eu, (uint64_t)"Location visited: %s, confidence %f", v13, v14, v15, v16, (uint64_t)v12);
      }
    }
    -[CUSystemMonitorImp _locationVisitUpdate:arrived:](self, "_locationVisitUpdate:arrived:", v17, 1);

  }
}

- (void)_manateeMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  id v9;

  if (!self->_manateeObserving)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manateeMonitorStart]", 0x1Eu, (uint64_t)"Manatee monitoring start\n", v2, v3, v4, v5, v8);
    }
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", getCDPManateeAvailabilityNotification[0]());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__manateeChanged_, v7, 0);
    self->_manateeObserving = 1;
    -[CUSystemMonitorImp _manateeRead](self, "_manateeRead");

  }
}

- (void)_manateeMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  OS_dispatch_source *manateeRetryTimer;
  OS_dispatch_source *v10;
  uint64_t v11;
  NSObject *v12;

  if (self->_manateeObserving)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manateeMonitorStop]", 0x1Eu, (uint64_t)"Manatee monitoring stop\n", v2, v3, v4, v5, v11);
    }
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", getCDPManateeAvailabilityNotification[0]());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, v8, 0);
    self->_manateeObserving = 0;

  }
  manateeRetryTimer = self->_manateeRetryTimer;
  if (manateeRetryTimer)
  {
    v12 = manateeRetryTimer;
    dispatch_source_cancel(v12);
    v10 = self->_manateeRetryTimer;
    self->_manateeRetryTimer = 0;

  }
}

- (void)_forceManateeStateRefresh
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CUSystemMonitorImp__forceManateeStateRefresh__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_meDeviceMonitorStart
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CUFindMyLocateMeDeviceMonitor *v14;
  CUFindMyLocateMeDeviceMonitor *meDeviceFindMyLocateMonitor;
  NSObject *dispatchQueue;
  id v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21[5];
  _QWORD v22[5];
  _QWORD handler[5];
  _QWORD v24[5];

  if ((self->_meDeviceUseFindMyLocate
     || (v3 = -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_132), self->_meDeviceUseFindMyLocate = v3, v3))&& objc_msgSend((Class)getCUFindMyLocateMeDeviceMonitorClass[0](), "supported"))
  {
    -[CUSystemMonitorImp _meDeviceMonitorStopFMF](self, "_meDeviceMonitorStopFMF");
    if (!self->_meDeviceFindMyLocateMonitor)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]", 0x1Eu, (uint64_t)"MeDevice monitoring start (FML)", v4, v5, v6, v7, v21[0]);
      }
      v14 = (CUFindMyLocateMeDeviceMonitor *)objc_msgSend(objc_alloc((Class)getCUFindMyLocateMeDeviceMonitorClass[0]()), "initWithDispatchQueue:", self->_dispatchQueue);
      meDeviceFindMyLocateMonitor = self->_meDeviceFindMyLocateMonitor;
      self->_meDeviceFindMyLocateMonitor = v14;

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_2;
      v24[3] = &unk_1E25DD8B0;
      v24[4] = self;
      -[CUFindMyLocateMeDeviceMonitor setMeDeviceUpdatedHandler:](self->_meDeviceFindMyLocateMonitor, "setMeDeviceUpdatedHandler:", v24);
      -[CUFindMyLocateMeDeviceMonitor activate](self->_meDeviceFindMyLocateMonitor, "activate");
    }
  }
  else
  {
    if (self->_meDeviceChangedToken == -1)
    {
      getFMFMeDeviceChangedNotification();
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = (const char *)objc_msgSend(v8, "UTF8String");

      if (!v9)
        return;
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]", 0x1Eu, (uint64_t)"MeDevice monitoring start\n", v10, v11, v12, v13, v21[0]);
      }
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_3;
      handler[3] = &unk_1E25DE468;
      handler[4] = self;
      notify_register_dispatch(v9, &self->_meDeviceChangedToken, dispatchQueue, handler);
      -[CUSystemMonitorImp _meDeviceCheckStart:](self, "_meDeviceCheckStart:", 1);
    }
    if (self->_fmfDevicesChangedToken == -1)
    {
      getFMFDevicesChangedNotification[0]();
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend(v17, "UTF8String");

      if (!v18)
        return;
      v19 = self->_dispatchQueue;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_4;
      v22[3] = &unk_1E25DE468;
      v22[4] = self;
      notify_register_dispatch(v18, &self->_fmfDevicesChangedToken, v19, v22);
    }
    if (self->_meDeviceRetryToken == -1)
    {
      v20 = self->_dispatchQueue;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = (uint64_t)__43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_5;
      v21[3] = (uint64_t)&unk_1E25DE468;
      v21[4] = (uint64_t)self;
      notify_register_dispatch("com.apple.siri.personal.requests.companion.update", &self->_meDeviceRetryToken, v20, v21);
    }
  }
}

- (void)_meDeviceMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CUFindMyLocateMeDeviceMonitor *meDeviceFindMyLocateMonitor;
  NSString *meDeviceFMFDeviceID;
  NSString *meDeviceIDSDeviceID;
  NSString *meDeviceName;
  uint64_t v11;

  if (self->_meDeviceFindMyLocateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStop]", 0x1Eu, (uint64_t)"MeDevice monitoring stop (FML)", v2, v3, v4, v5, v11);
    }
    -[CUFindMyLocateMeDeviceMonitor invalidate](self->_meDeviceFindMyLocateMonitor, "invalidate");
    meDeviceFindMyLocateMonitor = self->_meDeviceFindMyLocateMonitor;
    self->_meDeviceFindMyLocateMonitor = 0;

  }
  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  self->_meDeviceFMFDeviceID = 0;

  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  self->_meDeviceIDSDeviceID = 0;

  meDeviceName = self->_meDeviceName;
  self->_meDeviceName = 0;

  *(_WORD *)&self->_meDeviceIsMe = 0;
  -[CUSystemMonitorImp _meDeviceMonitorStopFMF](self, "_meDeviceMonitorStopFMF");
}

- (void)_meDeviceMonitorStopFMF
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int meDeviceChangedToken;
  int fmfDevicesChangedToken;
  OS_dispatch_source *meDeviceRetryTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  int meDeviceRetryToken;
  uint64_t v13;

  meDeviceChangedToken = self->_meDeviceChangedToken;
  if (meDeviceChangedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30)
      goto LABEL_7;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStopFMF]", 0x1Eu, (uint64_t)"MeDevice monitoring stop\n", v2, v3, v4, v5, v13);
    meDeviceChangedToken = self->_meDeviceChangedToken;
    if (meDeviceChangedToken != -1)
    {
LABEL_7:
      notify_cancel(meDeviceChangedToken);
      self->_meDeviceChangedToken = -1;
    }
  }
  fmfDevicesChangedToken = self->_fmfDevicesChangedToken;
  if (fmfDevicesChangedToken != -1)
  {
    notify_cancel(fmfDevicesChangedToken);
    self->_fmfDevicesChangedToken = -1;
  }
  meDeviceRetryTimer = self->_meDeviceRetryTimer;
  if (meDeviceRetryTimer)
  {
    v10 = meDeviceRetryTimer;
    dispatch_source_cancel(v10);
    v11 = self->_meDeviceRetryTimer;
    self->_meDeviceRetryTimer = 0;

  }
  meDeviceRetryToken = self->_meDeviceRetryToken;
  if (meDeviceRetryToken != -1)
  {
    notify_cancel(meDeviceRetryToken);
    self->_meDeviceRetryToken = -1;
  }
}

- (void)_meDeviceCheckStart:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckStart:]", 0xAu, (uint64_t)"MeDevice check\n", v3, v4, v5, v6, v12);
  }
  v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v9, "setUnderlyingQueue:", self->_dispatchQueue);
  v10 = (void *)objc_msgSend(objc_alloc((Class)getFMFSessionClass[0]()), "initWithDelegate:delegateQueue:", self, v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__CUSystemMonitorImp__meDeviceCheckStart___block_invoke;
  v13[3] = &unk_1E25DD8D8;
  v15 = a3;
  v13[4] = self;
  v14 = v10;
  v11 = v10;
  objc_msgSend(v11, "getActiveLocationSharingDevice:", v13);

}

- (void)_meDeviceCheckCompletion:(id)a3 error:(id)a4 firstCheck:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *meDeviceFMFDeviceID;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *meDeviceIDSDeviceID;
  NSString *v27;
  NSString *v28;
  NSString *meDeviceName;
  NSString *v30;
  NSString *v31;
  BOOL v32;
  const char *v33;
  int v34;
  int v35;
  void *v36;
  _BOOL4 v37;
  id v38;

  v5 = a5;
  v38 = a4;
  v8 = a3;
  objc_msgSend(v8, "deviceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idsDeviceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isThisDevice");

  if (v38)
  {
    if (!v9 || !v10 || !v11)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0x5Au, (uint64_t)"### MeDevice check failed: %{error}\n", v13, v14, v15, v16, (uint64_t)v38);
      }
      -[CUSystemMonitorImp _meDeviceRetryTimerUpdate:](self, "_meDeviceRetryTimerUpdate:", 1);
      goto LABEL_49;
    }
    if (gLogCategory_CUSystemMonitor <= 50
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x32u)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0x32u, (uint64_t)"MeDevice provided device info, but reported an error? : %{error}\n", v13, v14, v15, v16, (uint64_t)v38);
    }
  }
  -[CUSystemMonitorImp _meDeviceRetryTimerUpdate:](self, "_meDeviceRetryTimerUpdate:", 0);
  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  v18 = v9;
  v19 = meDeviceFMFDeviceID;
  v37 = v12;
  if (v18 == v19)
  {

  }
  else
  {
    v20 = v19;
    if ((v18 == 0) == (v19 != 0))
    {
      v27 = v18;
      goto LABEL_34;
    }
    v21 = -[NSString isEqual:](v18, "isEqual:", v19);

    if (!v21)
      goto LABEL_35;
  }
  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  v27 = v10;
  v28 = meDeviceIDSDeviceID;
  if (v27 == v28)
  {

  }
  else
  {
    v20 = v28;
    if ((v27 == 0) == (v28 != 0))
      goto LABEL_34;
    v35 = -[NSString isEqual:](v27, "isEqual:", v28);

    if (!v35)
      goto LABEL_35;
  }
  meDeviceName = self->_meDeviceName;
  v36 = v11;
  v30 = v11;
  v31 = meDeviceName;
  if (v30 != v31)
  {
    v20 = v31;
    if ((v30 == 0) != (v31 != 0))
    {
      v34 = -[NSString isEqual:](v30, "isEqual:", v31);

      v11 = v36;
      if (!v34)
      {
LABEL_35:
        if (v5)
        {
          v32 = v37;
          if (gLogCategory_CUSystemMonitor > 30
            || gLogCategory_CUSystemMonitor == -1
            && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
          {
            goto LABEL_46;
          }
          v33 = "MeDevice initial: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n";
        }
        else
        {
          v32 = v37;
          if (gLogCategory_CUSystemMonitor > 30
            || gLogCategory_CUSystemMonitor == -1
            && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
          {
            goto LABEL_46;
          }
          v33 = "MeDevice changed: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n";
        }
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0x1Eu, (uint64_t)v33, v22, v23, v24, v25, (uint64_t)v18);
LABEL_46:
        pthread_mutex_lock(&gCUSystemMonitorLock);
        objc_storeStrong((id *)&self->_meDeviceFMFDeviceID, v9);
        objc_storeStrong((id *)&self->_meDeviceIDSDeviceID, v10);
        objc_storeStrong((id *)&self->_meDeviceName, v11);
        self->_meDeviceIsMe = v32;
        self->_meDeviceValid = 1;
        pthread_mutex_unlock(&gCUSystemMonitorLock);
        -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_152_8130, &__block_literal_global_153);
        goto LABEL_49;
      }
      goto LABEL_28;
    }
    v27 = v30;
    v11 = v36;
LABEL_34:

    goto LABEL_35;
  }

  v11 = v36;
LABEL_28:
  if (self->_meDeviceIsMe != v37)
    goto LABEL_35;
  if (v5)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0x1Eu, (uint64_t)"MeDevice initial: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n", v22, v23, v24, v25, (uint64_t)v18);
    }
  }
  else if (gLogCategory_CUSystemMonitor <= 10
         && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0xAu, (uint64_t)"MeDevice unchanged: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n", v22, v23, v24, v25, (uint64_t)v18);
  }
LABEL_49:

}

- (void)_meDeviceRetryTimerUpdate:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *meDeviceRetryTimer;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  OS_dispatch_source *v14;
  NSObject *v15;
  OS_dispatch_source *v16;
  id v17;
  NSObject *v18;
  _QWORD handler[5];

  if (a3)
  {
    if (GestaltGetDeviceClass_sOnce != -1)
      dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13066);
    v8 = GestaltGetDeviceClass_deviceClass > 7 || ((1 << GestaltGetDeviceClass_deviceClass) & 0x8A) == 0;
    if (!v8 || GestaltGetDeviceClass_deviceClass == 100)
    {
      if (!self->_meDeviceRetryTimer)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]", 0x1Eu, (uint64_t)"MeDevice retry timer start", v3, v4, v5, v6, (uint64_t)v17);
        }
        v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        meDeviceRetryTimer = self->_meDeviceRetryTimer;
        self->_meDeviceRetryTimer = v9;

        v11 = self->_meDeviceRetryTimer;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __48__CUSystemMonitorImp__meDeviceRetryTimerUpdate___block_invoke;
        handler[3] = &unk_1E25DF2A0;
        handler[4] = self;
        dispatch_source_set_event_handler(v11, handler);
        v12 = self->_meDeviceRetryTimer;
        v13 = dispatch_time(0, 30000000000);
        dispatch_source_set_timer(v12, v13, 0x6FC23AC00uLL, 0x12A05F200uLL);
        dispatch_activate((dispatch_object_t)self->_meDeviceRetryTimer);
      }
      return;
    }
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]", 0x1Eu, (uint64_t)"MeDevice retry timer disabled on unsupported device", v3, v4, v5, v6, (uint64_t)v17);
    }
  }
  v14 = self->_meDeviceRetryTimer;
  if (!v14)
    return;
  if (gLogCategory_CUSystemMonitor >= 31)
  {
    v15 = v14;
LABEL_27:
    v18 = v15;
    dispatch_source_cancel(v15);
    v16 = self->_meDeviceRetryTimer;
    self->_meDeviceRetryTimer = 0;

    return;
  }
  if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]", 0x1Eu, (uint64_t)"MeDevice retry timer stop", v3, v4, v5, v6, (uint64_t)v17);
  v15 = self->_meDeviceRetryTimer;
  if (v15)
    goto LABEL_27;
}

- (void)_meDeviceUpdate:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *meDeviceFMFDeviceID;
  NSString *v14;
  NSString *meDeviceIDSDeviceID;
  NSString *v16;
  NSString *meDeviceName;

  v4 = a3;
  objc_msgSend(v4, "findMyIdentifier");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isThisDevice");

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceUpdate:]", 0x1Eu, (uint64_t)"MeDevice updated: fml=<%.8@>, ids=<%.8@>, name='%@', isThisDevice=%s", v9, v10, v11, v12, (uint64_t)v5);
  }
  pthread_mutex_lock(&gCUSystemMonitorLock);
  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  self->_meDeviceFMFDeviceID = v5;
  v14 = v5;

  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  self->_meDeviceIDSDeviceID = v6;
  v16 = v6;

  meDeviceName = self->_meDeviceName;
  self->_meDeviceName = v7;

  self->_meDeviceIsMe = v8;
  self->_meDeviceValid = 1;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_159, &__block_literal_global_160_8120);
}

- (void)_motionMonitorStart
{
  CMMotionActivityManager **p_motionActivityManager;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CMMotionActivityManager *v8;
  id v9;
  id v10;
  CMMotionActivityManager *motionActivityManager;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15[4];
  id v16;
  CUSystemMonitorImp *v17;
  _QWORD v18[4];
  CMMotionActivityManager *v19;
  CUSystemMonitorImp *v20;

  p_motionActivityManager = &self->_motionActivityManager;
  v8 = self->_motionActivityManager;
  if (!*p_motionActivityManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorStart]", 0x1Eu, (uint64_t)"Motion monitor start", v4, v5, v6, v7, v15[0]);
    }
    v9 = objc_alloc_init((Class)getCMMotionActivityManagerClass[0]());

    objc_storeStrong((id *)p_motionActivityManager, v9);
    v10 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v10, "setUnderlyingQueue:", self->_dispatchQueue);
    motionActivityManager = self->_motionActivityManager;
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __41__CUSystemMonitorImp__motionMonitorStart__block_invoke;
    v18[3] = &unk_1E25DD960;
    v8 = (CMMotionActivityManager *)v9;
    v19 = v8;
    v20 = self;
    -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](motionActivityManager, "startActivityUpdatesToQueue:withHandler:", v10, v18);
    v13 = objc_alloc_init((Class)getCMDeviceOrientationManagerClass[0]());
    objc_storeStrong((id *)&self->_orientationManager, v13);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = (uint64_t)__41__CUSystemMonitorImp__motionMonitorStart__block_invoke_2;
    v15[3] = (uint64_t)&unk_1E25DD988;
    v16 = v13;
    v17 = self;
    v14 = v13;
    objc_msgSend(v14, "startDeviceOrientationUpdatesToQueue:withHandler:", v10, v15);

  }
}

- (void)_motionMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CMMotionActivityManager *motionActivityManager;
  CMDeviceOrientationManager *orientationManager;
  uint64_t v9;

  if (self->_motionActivityManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorStop]", 0x1Eu, (uint64_t)"Motion monitor stop", v2, v3, v4, v5, v9);
    }
    -[CMMotionActivityManager stopActivityUpdates](self->_motionActivityManager, "stopActivityUpdates");
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = 0;

    self->_motionFlags = 0;
    -[CMDeviceOrientationManager stopDeviceOrientationUpdates](self->_orientationManager, "stopDeviceOrientationUpdates");
    orientationManager = self->_orientationManager;
    self->_orientationManager = 0;

    self->_motionOrientation = 0;
  }
}

- (void)_motionMonitorHandleActivity:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t motionFlags;
  uint64_t v14;
  uint64_t v15;
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
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;

  v39 = a3;
  v4 = objc_msgSend(v39, "stationary");
  if (objc_msgSend(v39, "walking"))
    v4 |= 2u;
  if (objc_msgSend(v39, "running"))
    v4 |= 4u;
  if (objc_msgSend(v39, "automotive"))
    v4 |= 8u;
  if (objc_msgSend(v39, "cycling"))
    v12 = v4 | 0x10;
  else
    v12 = v4;
  motionFlags = self->_motionFlags;
  if ((_DWORD)v12 == (_DWORD)motionFlags)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      NSPrintF((uint64_t)"%#{flags}", v5, v6, v7, v8, v9, v10, v11, v12);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "confidence");
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorHandleActivity:]", 0xAu, (uint64_t)"Motion unchanged: %@, confidence %s", v35, v36, v37, v38, (uint64_t)v34);

    }
  }
  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_motionFlags = v12;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      NSPrintF((uint64_t)"%#{flags}", v14, v15, v16, v17, v18, v19, v20, motionFlags);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF((uint64_t)"%#{flags}", v22, v23, v24, v25, v26, v27, v28, v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "confidence");
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorHandleActivity:]", 0x1Eu, (uint64_t)"Motion changed: %@ -> %@, confidence %s", v30, v31, v32, v33, (uint64_t)v21);

    }
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_169, &__block_literal_global_170);
  }

}

- (void)_motionMonitorOrientationChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t motionOrientation;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;

  v8 = objc_msgSend(a3, "orientation");
  motionOrientation = self->_motionOrientation;
  if (v8 == (_DWORD)motionOrientation)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      if (v8 > 6)
        v15 = "?";
      else
        v15 = off_1E25DE090[v8];
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorOrientationChanged:]", 0xAu, (uint64_t)"Motion orientation unchanged: %s", v4, v5, v6, v7, (uint64_t)v15);
    }
  }
  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_motionOrientation = v8;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (motionOrientation > 6)
        v14 = "?";
      else
        v14 = off_1E25DE090[motionOrientation];
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorOrientationChanged:]", 0x1Eu, (uint64_t)"Motion orientation: %s -> %s", v10, v11, v12, v13, (uint64_t)v14);
    }
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_173, &__block_literal_global_174);
  }
}

- (void)_netInterfaceMonitorStart
{
  NSObject *v3;
  CUNetInterfaceMonitor *v4;
  CUNetInterfaceMonitor *netInterfaceMonitor;
  uint64_t v6;
  CUNetInterfaceMonitor *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[16];

  if (!self->_netInterfaceMonitor)
  {
    logger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D40C000, v3, OS_LOG_TYPE_DEFAULT, "NetInterface monitoring start", buf, 2u);
    }

    v4 = objc_alloc_init(CUNetInterfaceMonitor);
    netInterfaceMonitor = self->_netInterfaceMonitor;
    self->_netInterfaceMonitor = v4;

    -[CUNetInterfaceMonitor setDispatchQueue:](self->_netInterfaceMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke;
    v11[3] = &unk_1E25DF2A0;
    v11[4] = self;
    -[CUNetInterfaceMonitor setFlagsChangedHandler:](self->_netInterfaceMonitor, "setFlagsChangedHandler:", v11);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3;
    v10[3] = &unk_1E25DF2A0;
    v10[4] = self;
    -[CUNetInterfaceMonitor setPrimaryIPChangedHandler:](self->_netInterfaceMonitor, "setPrimaryIPChangedHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_184;
    v9[3] = &unk_1E25DF2A0;
    v9[4] = self;
    -[CUNetInterfaceMonitor setPrimaryNetworkChangedHandler:](self->_netInterfaceMonitor, "setPrimaryNetworkChangedHandler:", v9);
    v7 = self->_netInterfaceMonitor;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_189;
    v8[3] = &unk_1E25DF2A0;
    v8[4] = self;
    -[CUNetInterfaceMonitor activateWithCompletion:](v7, "activateWithCompletion:", v8);
  }
}

- (void)_netInterfaceMonitorStop
{
  NSObject *v3;
  CUNetInterfaceMonitor *netInterfaceMonitor;
  NSString *primaryNetworkSignature;
  uint8_t v6[16];

  if (self->_netInterfaceMonitor)
  {
    logger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18D40C000, v3, OS_LOG_TYPE_DEFAULT, "NetInterface monitoring stop", v6, 2u);
    }

    -[CUNetInterfaceMonitor invalidate](self->_netInterfaceMonitor, "invalidate");
    netInterfaceMonitor = self->_netInterfaceMonitor;
    self->_netInterfaceMonitor = 0;

    self->_netFlags = 0;
    self->_primaryIPv4Addr.sa.sa_family = 0;
    self->_primaryIPv6Addr.sa.sa_family = 0;
    primaryNetworkSignature = self->_primaryNetworkSignature;
    self->_primaryNetworkSignature = 0;

  }
}

- (void)_powerUnlimitedMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *p_powerSourceToken;
  NSObject *dispatchQueue;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  _QWORD handler[5];

  if (self->_powerSourceToken == -1)
  {
    p_powerSourceToken = &self->_powerSourceToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]", 0x1Eu, (uint64_t)"PowerUnlimited monitoring start\n", v2, v3, v4, v5, v15);
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke;
    handler[3] = &unk_1E25DE468;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.powersources.source", p_powerSourceToken, dispatchQueue, handler);
    v9 = IOPSDrawingUnlimitedPower();
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_powerUnlimited = v9;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v14 = "no";
      if (v9)
        v14 = "yes";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]", 0x1Eu, (uint64_t)"PowerUnlimited initial: %s\n", v10, v11, v12, v13, (uint64_t)v14);
    }
  }
}

- (void)_powerUnlimitedMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int powerSourceToken;
  uint64_t v8;

  powerSourceToken = self->_powerSourceToken;
  if (powerSourceToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30)
      goto LABEL_7;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStop]", 0x1Eu, (uint64_t)"PowerUnlimited monitoring stop\n", v2, v3, v4, v5, v8);
    powerSourceToken = self->_powerSourceToken;
    if (powerSourceToken != -1)
    {
LABEL_7:
      notify_cancel(powerSourceToken);
      self->_powerSourceToken = -1;
    }
  }
}

- (void)_primaryAppleIDMonitorStart
{
  void *v3;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  if (!self->_primaryAppleIDObserving)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__primaryAppleIDChanged_, CFSTR("com.apple.authkit.user-info-changed"), 0);
    if (self->_primaryAppleIDNotifyToken == -1)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __49__CUSystemMonitorImp__primaryAppleIDMonitorStart__block_invoke;
      handler[3] = &unk_1E25DE468;
      handler[4] = self;
      notify_register_dispatch("com.apple.rapport.primaryAccountChanged", &self->_primaryAppleIDNotifyToken, dispatchQueue, handler);
    }
    self->_primaryAppleIDObserving = 1;
    -[CUSystemMonitorImp _primaryAppleIDChanged2:](self, "_primaryAppleIDChanged2:", 1);

  }
}

- (void)_primaryAppleIDMonitorStop
{
  int primaryAppleIDNotifyToken;
  NSString *primaryAppleID;
  id v5;

  if (self->_primaryAppleIDObserving)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.authkit.user-info-changed"), 0);
    primaryAppleIDNotifyToken = self->_primaryAppleIDNotifyToken;
    if (primaryAppleIDNotifyToken != -1)
    {
      notify_cancel(primaryAppleIDNotifyToken);
      self->_primaryAppleIDNotifyToken = -1;
    }
    self->_primaryAppleIDObserving = 0;
    primaryAppleID = self->_primaryAppleID;
    self->_primaryAppleID = 0;

    *(_WORD *)&self->_primaryAppleIDActive = 0;
  }
}

- (id)_primaryAppleIDAccount
{
  void *v2;
  void *v3;

  if (AppleAccountLibrary_sOnce_8090 != -1)
    dispatch_once(&AppleAccountLibrary_sOnce_8090, &__block_literal_global_1089);
  -[objc_class defaultStore](getACAccountStoreClass_8091(), "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_primaryAppleIDChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CUSystemMonitorImp__primaryAppleIDChanged___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_primaryAppleIDChanged2:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 primaryAppleIDActive;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  NSString *v21;
  int primaryAppleIDIsHSA2;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v7 = a3;
  if (!a3
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0x1Eu, (uint64_t)"PrimaryAppleID change notification\n", v3, v4, v5, v6, v27);
  }
  -[CUSystemMonitorImp _primaryAppleIDAccount](self, "_primaryAppleIDAccount");
  v9 = objc_claimAutoreleasedReturnValue();
  primaryAppleIDActive = self->_primaryAppleIDActive;
  self->_primaryAppleIDActive = v9 != 0;
  v28 = (id)v9;
  if (v9 && !primaryAppleIDActive && self->_familyFailed)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0x1Eu, (uint64_t)"Family re-check on PrimaryAppleID active\n", v10, v11, v12, v13, v27);
    }
    -[CUSystemMonitorImp _familyGetMembers:](self, "_familyGetMembers:", 0);
  }
  -[objc_class sharedInstance](getAKAccountManagerClass_8079(), "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "accountPropertyForKey:", CFSTR("altDSID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    && (objc_msgSend(v15, "authKitAccountWithAltDSID:error:", v16, 0), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = (void *)v17;
    v19 = objc_msgSend(v15, "securityLevelForAccount:", v17) == 4;

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v28, "username");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  v21 = self->_primaryAppleID;
  objc_storeStrong((id *)&self->_primaryAppleID, v20);
  primaryAppleIDIsHSA2 = self->_primaryAppleIDIsHSA2;
  self->_primaryAppleIDIsHSA2 = v19;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v7)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0x1Eu, (uint64_t)"PrimaryAppleID initial: %@, HSA2 %s\n", v23, v24, v25, v26, (uint64_t)v20);
    }
  }
  else if (primaryAppleIDIsHSA2 == v19)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0xAu, (uint64_t)"PrimaryAppleID unchanged (%@, HSA2 %s)\n", v23, v24, v25, v26, (uint64_t)v20);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0x1Eu, (uint64_t)"PrimaryAppleID changed: %@, HSA2 %s -> %@, HSA2 %s\n", v23, v24, v25, v26, (uint64_t)v21);
    }
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_219, &__block_literal_global_220);
  }

}

- (void)_regionMonitorStart
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CoreTelephonyClient *v7;
  RTRoutineManager *v8;
  NSObject *dispatchQueue;
  uint64_t v10;
  _QWORD handler[5];

  v7 = self->_regionCTClient;
  if (!v7)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorStart]", 0x1Eu, (uint64_t)"Region monitor start", v3, v4, v5, v6, v10);
    }
    v7 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)getCoreTelephonyClientClass[0]()), "initWithQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_regionCTClient, v7);
    -[CoreTelephonyClient setDelegate:](v7, "setDelegate:", self);
    -[CUSystemMonitorImp _regionMonitorGet](self, "_regionMonitorGet");
  }
  v8 = self->_regionRoutineManager;
  if (!v8)
  {
    objc_msgSend((Class)getRTRoutineManagerClass[0](), "defaultManager");
    v8 = (RTRoutineManager *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_regionRoutineManager, v8);
    if (self->_regionRoutineNotifyToken == -1)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __41__CUSystemMonitorImp__regionMonitorStart__block_invoke;
      handler[3] = &unk_1E25DE468;
      handler[4] = self;
      notify_register_dispatch("RTLocationsOfInterestDidChangeNotification", &self->_regionRoutineNotifyToken, dispatchQueue, handler);
    }
    -[CUSystemMonitorImp _locationsOfInterestDidChange:](self, "_locationsOfInterestDidChange:", 0);
  }

}

- (void)_regionMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CoreTelephonyClient *regionCTClient;
  __CTServerConnection *regionCTServerCnx;
  RTRoutineManager *regionRoutineManager;
  int regionRoutineNotifyToken;
  NSString *regionISOCountryCode;
  NSString *regionMobileCountryCode;
  NSString *regionRoutineCountry;
  NSString *regionRoutineState;
  uint64_t v15;

  if (self->_regionCTClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorStop]", 0x1Eu, (uint64_t)"Region monitor stop", v2, v3, v4, v5, v15);
    }
    regionCTClient = self->_regionCTClient;
    self->_regionCTClient = 0;

  }
  regionCTServerCnx = self->_regionCTServerCnx;
  if (regionCTServerCnx)
  {
    CFRelease(regionCTServerCnx);
    self->_regionCTServerCnx = 0;
  }
  regionRoutineManager = self->_regionRoutineManager;
  if (regionRoutineManager)
  {
    self->_regionRoutineManager = 0;

  }
  regionRoutineNotifyToken = self->_regionRoutineNotifyToken;
  if (regionRoutineNotifyToken != -1)
  {
    notify_cancel(regionRoutineNotifyToken);
    self->_regionRoutineNotifyToken = -1;
  }
  pthread_mutex_lock(&gCUSystemMonitorLock);
  regionISOCountryCode = self->_regionISOCountryCode;
  self->_regionISOCountryCode = 0;

  regionMobileCountryCode = self->_regionMobileCountryCode;
  self->_regionMobileCountryCode = 0;

  regionRoutineCountry = self->_regionRoutineCountry;
  self->_regionRoutineCountry = 0;

  regionRoutineState = self->_regionRoutineState;
  self->_regionRoutineState = 0;

  pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- (void)_regionMonitorGet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CoreTelephonyClient *regionCTClient;
  CoreTelephonyClient *v8;
  uint64_t v9[6];

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]", 0x1Eu, (uint64_t)"Region monitor get CT subscription context", v2, v3, v4, v5, v9[0]);
  }
  regionCTClient = self->_regionCTClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = (uint64_t)__39__CUSystemMonitorImp__regionMonitorGet__block_invoke;
  v9[3] = (uint64_t)&unk_1E25DDBB8;
  v9[4] = (uint64_t)self;
  v9[5] = (uint64_t)regionCTClient;
  v8 = regionCTClient;
  -[CoreTelephonyClient getCurrentDataSubscriptionContext:](v8, "getCurrentDataSubscriptionContext:", v9);

}

- (void)_regionMonitorUpdateLocationsOfInterest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  int v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CUSystemMonitorImp *v47;
  id obj;
  uint64_t v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v6 = v4;
  v50 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v50)
  {
    v47 = self;
    obj = v6;
    v7 = 0;
    v49 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v49)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v9, "visits");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v53 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "entryDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "compare:", v5) <= 1)
              {
                v16 = v9;

                v17 = v15;
                v5 = v17;
                v7 = v16;
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          }
          while (v12);
        }

      }
      v6 = obj;
      v50 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v50);

    if (v7)
    {
      v22 = v47->_regionRoutineCountry;
      objc_msgSend(v7, "mapItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "address");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "country");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v22;
      v51 = v25;
      v27 = v25;
      v28 = v27;
      if (v26 == v27)
      {
        v29 = 1;
      }
      else if ((v26 == 0) == (v27 != 0))
      {
        v29 = 0;
      }
      else
      {
        v29 = -[NSString isEqual:](v26, "isEqual:", v27);
      }

      v30 = v47->_regionRoutineState;
      objc_msgSend(v7, "mapItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "address");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "administrativeAreaCode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v30;
      v35 = v33;
      v36 = v35;
      if (v34 == v35)
      {
        v37 = 1;
      }
      else
      {
        if ((v34 == 0) == (v35 != 0))
        {

          LOBYTE(v37) = 0;
          goto LABEL_36;
        }
        v37 = -[NSString isEqual:](v34, "isEqual:", v35);
      }

      if ((v29 & v37 & 1) != 0)
      {
        if (gLogCategory_CUSystemMonitor <= 10
          && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateLocationsOfInterest:]", 0xAu, (uint64_t)"Region routine unchanged: Country %@, State %@", v38, v39, v40, v41, (uint64_t)v28);
        }
LABEL_47:

        goto LABEL_48;
      }
LABEL_36:
      pthread_mutex_lock(&gCUSystemMonitorLock);
      if ((v29 & 1) == 0)
        objc_storeStrong((id *)&v47->_regionRoutineCountry, v51);
      if ((v37 & 1) == 0)
        objc_storeStrong((id *)&v47->_regionRoutineState, v33);
      pthread_mutex_unlock(&gCUSystemMonitorLock);
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateLocationsOfInterest:]", 0x1Eu, (uint64_t)"Region routine changed: Country %@, State %@", v42, v43, v44, v45, (uint64_t)v28);
      }
      -[CUSystemMonitorImp _invokeBlock:passingTest:](v47, "_invokeBlock:passingTest:", &__block_literal_global_234, &__block_literal_global_235);
      goto LABEL_47;
    }
  }
  else
  {

  }
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateLocationsOfInterest:]", 0x1Eu, (uint64_t)"Region monitor LOI none found", v18, v19, v20, v21, v46);
  }
  v7 = 0;
LABEL_48:

}

- (void)_regionMonitorUpdateMCC:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  __CTServerConnection *regionCTServerCnx;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __CTServerConnection *v25;
  uint64_t v26;
  uint64_t v27;
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
  NSString *v38;
  NSString *v39;
  NSString *v40;
  char v41;
  uint64_t v42;
  NSString *v43;

  v5 = a3;
  v6 = self->_regionMobileCountryCode;
  v7 = (NSString *)v5;
  v8 = v6;
  v9 = v8;
  if (v8 == v7)
  {
    v10 = 1;
  }
  else if ((v7 == 0) == (v8 != 0))
  {
    v10 = 0;
  }
  else
  {
    v10 = -[NSString isEqual:](v7, "isEqual:", v8);
  }

  v11 = self->_regionISOCountryCode;
  v12 = v11;
  if (v10)
  {
    if (v7)
      v13 = v11;
    else
      v13 = 0;
    v14 = v13;
    goto LABEL_26;
  }
  if (!v7)
    goto LABEL_25;
  regionCTServerCnx = self->_regionCTServerCnx;
  if (!regionCTServerCnx)
  {
    v16 = getprogname();
    NSPrintF((uint64_t)"com.apple.CUSystemMonitor.%s", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (__CTServerConnection *)((uint64_t (*)(uint64_t, uint64_t, void *, void *))softLink_CTServerConnectionCreateOnTargetQueue[0])(0, (uint64_t)v24, self->_dispatchQueue, 0);
    if (v25)
    {
      regionCTServerCnx = v25;
      self->_regionCTServerCnx = v25;

      goto LABEL_15;
    }
    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]", 0x5Au, (uint64_t)"### Region monitor CTServerConnectionCreate failed", v26, v27, v28, v29, v42);
    }
    self->_regionCTServerCnx = 0;

LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
LABEL_15:
  v43 = 0;
  ((void (*)(uint64_t, uint64_t, uint64_t))softLink_CTServerConnectionCopyISOForMCC[0])((uint64_t)regionCTServerCnx, (uint64_t)v7, (uint64_t)&v43);
  v14 = v43;
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]", 0x1Eu, (uint64_t)"Region monitor CopyISOForMCC: %@, ISO %@, error %d/%d", v30, v31, v32, v33, (uint64_t)v7);
  }
LABEL_26:
  pthread_mutex_lock(&gCUSystemMonitorLock);
  objc_storeStrong((id *)&self->_regionISOCountryCode, v14);
  objc_storeStrong((id *)&self->_regionMobileCountryCode, a3);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (!v10)
    goto LABEL_36;
  v38 = v14;
  v39 = v12;
  v40 = v39;
  if (v38 == v39)
  {

  }
  else
  {
    if ((v39 != 0) == (v38 == 0))
    {

      goto LABEL_36;
    }
    v41 = -[NSString isEqual:](v38, "isEqual:", v39);

    if ((v41 & 1) == 0)
    {
LABEL_36:
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]", 0x1Eu, (uint64_t)"Region changed: MCC %@, ISO %@", v34, v35, v36, v37, (uint64_t)v7);
      }
      -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_241, &__block_literal_global_242);
      goto LABEL_41;
    }
  }
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]", 0xAu, (uint64_t)"Region unchanged: MCC %@, ISO %@", v34, v35, v36, v37, (uint64_t)v7);
  }
LABEL_41:

}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  CUSystemMonitorImp *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_regionCTClient)
  {
    objc_msgSend(v5, "legacyInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v7 = objc_msgSend(v6, "count");
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp cellMonitorUpdate:info:]", 0x1Eu, (uint64_t)"Region monitor cell update: %d items", v8, v9, v10, v11, v7);
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v26 = self;
      v15 = 0;
      v16 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", getkCTCellMonitorMCC[0]());
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = objc_msgSend(v19, "integerValue");
              if (v20 >= 1)
              {
                if (v20 != 0xFFFF)
                {
                  objc_msgSend(v19, "stringValue");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CUSystemMonitorImp _regionMonitorUpdateMCC:](v26, "_regionMonitorUpdateMCC:", v25);

                  goto LABEL_24;
                }
                v15 = 1;
              }
            }

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v14)
          continue;
        break;
      }

      if ((v15 & 1) != 0)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp cellMonitorUpdate:info:]", 0x1Eu, (uint64_t)"Region monitor mapping %d -> null (update)", v21, v22, v23, v24, 0xFFFFLL);
        }
        -[CUSystemMonitorImp _regionMonitorUpdateMCC:](v26, "_regionMonitorUpdateMCC:", 0);
      }
    }
    else
    {
LABEL_24:

    }
  }

}

- (void)_locationsOfInterestDidChange:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  void *v11;
  RTRoutineManager *regionRoutineManager;
  _QWORD v13[5];

  if (gLogCategory_CUSystemMonitor <= 30)
  {
    v8 = a3;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      v9 = "(initial)";
      if (v8)
        v9 = "(changed)";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]", 0x1Eu, (uint64_t)"Region monitor LOI fetch start %s", v3, v4, v5, v6, (uint64_t)v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1209600.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  regionRoutineManager = self->_regionRoutineManager;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke;
  v13[3] = &unk_1E25DDC20;
  v13[4] = self;
  -[RTRoutineManager fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:](regionRoutineManager, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v10, v11, v13);

}

- (void)_rotatingIdentifierMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  id v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  OS_dispatch_source *v18;
  OS_dispatch_source *rotatingIdentifierTimer;
  NSObject *v20;
  NSObject *v21;
  dispatch_time_t v22;
  _QWORD handler[5];

  if (!self->_rotatingIdentifierTimer)
  {
    NSRandomData(6uLL, 0, v2, v3, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_storeStrong((id *)&self->_rotatingIdentifierData, v9);
    v10 = objc_retainAutorelease(v9);
    v11 = objc_msgSend(v10, "bytes");
    v12 = *(_WORD *)(v11 + 4);
    *(_DWORD *)self->_rotatingIdentifier48.bytes = *(_DWORD *)v11;
    *(_WORD *)&self->_rotatingIdentifier48.bytes[4] = v12;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v13 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierMonitorStart]", 0x1Eu, (uint64_t)"Rotating identifier monitor start: %.6a\n", v14, v15, v16, v17, v13);
    }
    v18 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    rotatingIdentifierTimer = self->_rotatingIdentifierTimer;
    self->_rotatingIdentifierTimer = v18;

    v20 = self->_rotatingIdentifierTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __53__CUSystemMonitorImp__rotatingIdentifierMonitorStart__block_invoke;
    handler[3] = &unk_1E25DF2A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    v21 = self->_rotatingIdentifierTimer;
    v22 = dispatch_time(0x8000000000000000, 1020000000000);
    dispatch_source_set_timer(v21, v22, 0xED7CBCD800uLL, 0xB2D05E00uLL);
    dispatch_activate((dispatch_object_t)self->_rotatingIdentifierTimer);

  }
}

- (void)_rotatingIdentifierMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  OS_dispatch_source *rotatingIdentifierTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  uint64_t v10;
  NSObject *v11;

  rotatingIdentifierTimer = self->_rotatingIdentifierTimer;
  if (rotatingIdentifierTimer)
  {
    if (gLogCategory_CUSystemMonitor >= 31)
    {
      v8 = rotatingIdentifierTimer;
LABEL_8:
      v11 = v8;
      dispatch_source_cancel(v8);
      v9 = self->_rotatingIdentifierTimer;
      self->_rotatingIdentifierTimer = 0;

      return;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierMonitorStop]", 0x1Eu, (uint64_t)"Rotating identifier monitor stop\n", v2, v3, v4, v5, v10);
    v8 = self->_rotatingIdentifierTimer;
    if (v8)
      goto LABEL_8;
  }
}

- (void)_rotatingIdentifierTimerFired
{
  NSData **p_rotatingIdentifierData;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSData *v19;

  p_rotatingIdentifierData = &self->_rotatingIdentifierData;
  v19 = self->_rotatingIdentifierData;
  NSRandomData(6uLL, 0, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  objc_storeStrong((id *)p_rotatingIdentifierData, v10);
  v11 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v11, "bytes");
  v13 = *(_WORD *)(v12 + 4);
  *(_DWORD *)self->_rotatingIdentifier48.bytes = *(_DWORD *)v12;
  *(_WORD *)&self->_rotatingIdentifier48.bytes[4] = v13;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    v14 = -[NSData bytes](objc_retainAutorelease(v19), "bytes");
    objc_msgSend(objc_retainAutorelease(v11), "bytes");
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierTimerFired]", 0x1Eu, (uint64_t)"Rotating identifier changed timer: %.6a -> %.6a\n", v15, v16, v17, v18, v14);
  }
  -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_257, &__block_literal_global_258);

}

- (void)_screenLockedMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *p_screenLockedToken;
  NSObject *dispatchQueue;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  _QWORD handler[5];

  if (self->_screenLockedToken == -1)
  {
    p_screenLockedToken = &self->_screenLockedToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStart]", 0x1Eu, (uint64_t)"ScreenLocked monitoring start\n", v2, v3, v4, v5, v15);
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47__CUSystemMonitorImp__screenLockedMonitorStart__block_invoke;
    handler[3] = &unk_1E25DE468;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.lockstate", p_screenLockedToken, dispatchQueue, handler);
    if (SpringBoardServicesLibrary_sOnce != -1)
      dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_1106);
    v9 = SpringBoardServicesLibrary_sLib
      && dlsym((void *)SpringBoardServicesLibrary_sLib, "SBSGetScreenLockStatus")
      && softLinkSBSGetScreenLockStatus(0) != 0;
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_screenLocked = v9;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v14 = "no";
      if (v9)
        v14 = "yes";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStart]", 0x1Eu, (uint64_t)"ScreenLocked initial: %s\n", v10, v11, v12, v13, (uint64_t)v14);
    }
  }
}

- (void)_screenLockedMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int screenLockedToken;
  uint64_t v8;

  screenLockedToken = self->_screenLockedToken;
  if (screenLockedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30)
      goto LABEL_7;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStop]", 0x1Eu, (uint64_t)"ScreenLocked monitoring stop\n", v2, v3, v4, v5, v8);
    screenLockedToken = self->_screenLockedToken;
    if (screenLockedToken != -1)
    {
LABEL_7:
      notify_cancel(screenLockedToken);
      self->_screenLockedToken = -1;
    }
  }
  self->_screenLocked = 1;
}

- (void)_screenLockedChanged
{
  int v3;
  int screenLocked;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;

  if (SpringBoardServicesLibrary_sOnce != -1)
    dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_1106);
  v3 = SpringBoardServicesLibrary_sLib
    && dlsym((void *)SpringBoardServicesLibrary_sLib, "SBSGetScreenLockStatus")
    && softLinkSBSGetScreenLockStatus(0) != 0;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  screenLocked = self->_screenLocked;
  self->_screenLocked = v3;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (screenLocked == v3)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      v9 = "no";
      if (v3)
        v9 = "yes";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedChanged]", 0xAu, (uint64_t)"ScreenLocked unchanged (%s)\n", v5, v6, v7, v8, (uint64_t)v9);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (screenLocked)
        v10 = "yes";
      else
        v10 = "no";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedChanged]", 0x1Eu, (uint64_t)"ScreenLocked changed: %s -> %s\n", v5, v6, v7, v8, (uint64_t)v10);
    }
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_266, &__block_literal_global_267);
  }
}

- (void)_screenOnMonitorStartiOS
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *p_screenBlankedToken;
  NSObject *dispatchQueue;
  int screenBlankedToken;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  _QWORD handler[5];
  uint64_t state64;

  if (self->_screenBlankedToken == -1)
  {
    p_screenBlankedToken = &self->_screenBlankedToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStartiOS]", 0x1Eu, (uint64_t)"ScreenOn monitoring start\n", v2, v3, v4, v5, v17);
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46__CUSystemMonitorImp__screenOnMonitorStartiOS__block_invoke;
    handler[3] = &unk_1E25DE468;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", p_screenBlankedToken, dispatchQueue, handler);
    screenBlankedToken = self->_screenBlankedToken;
    state64 = 0;
    notify_get_state(screenBlankedToken, &state64);
    v10 = state64;
    v11 = state64 == 0;
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_screenOn = v11;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v16 = "off";
      if (!v10)
        v16 = "on";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStartiOS]", 0x1Eu, (uint64_t)"ScreenOn initial: %s\n", v12, v13, v14, v15, (uint64_t)v16);
    }
  }
}

- (void)_screenOnMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int screenBlankedToken;
  uint64_t v8;

  screenBlankedToken = self->_screenBlankedToken;
  if (screenBlankedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30)
      goto LABEL_7;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStop]", 0x1Eu, (uint64_t)"ScreenOn monitoring stop\n", v2, v3, v4, v5, v8);
    screenBlankedToken = self->_screenBlankedToken;
    if (screenBlankedToken != -1)
    {
LABEL_7:
      notify_cancel(screenBlankedToken);
      self->_screenBlankedToken = -1;
    }
  }
}

- (void)_screenChanged:(BOOL)a3
{
  int v3;
  int screenOn;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;

  v3 = a3;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  screenOn = self->_screenOn;
  self->_screenOn = v3;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (screenOn == v3)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      v10 = "off";
      if (v3)
        v10 = "on";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenChanged:]", 0xAu, (uint64_t)"ScreenOn unchanged (%s)\n", v6, v7, v8, v9, (uint64_t)v10);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (screenOn)
        v11 = "on";
      else
        v11 = "off";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenChanged:]", 0x1Eu, (uint64_t)"ScreenOn changed: %s -> %s\n", v6, v7, v8, v9, (uint64_t)v11);
    }
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_276, &__block_literal_global_277);
  }
}

- (void)_screenStateMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];

  if (!self->_screenStateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]", 0x1Eu, (uint64_t)"ScreenState monitor start", v2, v3, v4, v5, v18);
    }
    objc_msgSend((Class)getFBSDisplayLayoutMonitorConfigurationClass[0](), "configurationForDefaultMainDisplayMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    if (v7)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke;
      v19[3] = &unk_1E25DDCA8;
      v19[4] = self;
      objc_msgSend(v7, "setTransitionHandler:", v19);
      objc_msgSend((Class)getFBSDisplayLayoutMonitorClass[0](), "monitorWithConfiguration:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_storeStrong((id *)&self->_screenStateMonitor, v17);
      }
      else if (gLogCategory_CUSystemMonitor <= 90
             && (gLogCategory_CUSystemMonitor != -1
              || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]", 0x5Au, (uint64_t)"### ScreenState no monitor", v13, v14, v15, v16, v18);
      }

    }
    else if (gLogCategory_CUSystemMonitor <= 90
           && (gLogCategory_CUSystemMonitor != -1
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]", 0x5Au, (uint64_t)"### ScreenState no monitor config", v8, v9, v10, v11, v18);
    }

  }
}

- (void)_screenStateMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  FBSDisplayLayoutMonitor *screenStateMonitor;
  uint64_t v8;

  if (self->_screenStateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStop]", 0x1Eu, (uint64_t)"ScreenState monitor stop", v2, v3, v4, v5, v8);
    }
    -[FBSDisplayLayoutMonitor invalidate](self->_screenStateMonitor, "invalidate");
    screenStateMonitor = self->_screenStateMonitor;
    self->_screenStateMonitor = 0;

    self->_screenState = 0;
  }
}

- (void)_screenStateMonitorUpdateWithLayout:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  int screenState;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v14, "backlightState");
    if (v8 >= 4)
      v9 = 0;
    else
      v9 = dword_18D51D4F0[v8];
  }
  else
  {
    if (gLogCategory_CUSystemMonitor > 30)
    {
      v9 = 0;
      goto LABEL_28;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorUpdateWithLayout:]", 0x1Eu, (uint64_t)"ScreenState update no layout/backlight", v4, v5, v6, v7, v13);
    v9 = 0;
  }
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    screenState = self->_screenState;
    if (screenState <= 19)
    {
      if (!screenState)
      {
        v11 = CFSTR("Unknown");
        goto LABEL_27;
      }
      if (screenState == 10)
      {
        v11 = CFSTR("Off");
        goto LABEL_27;
      }
    }
    else
    {
      switch(screenState)
      {
        case 20:
          v11 = CFSTR("InactiveOn");
          goto LABEL_27;
        case 30:
          v11 = CFSTR("ActiveDimmed");
          goto LABEL_27;
        case 40:
          v11 = CFSTR("ActiveOn");
LABEL_27:
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorUpdateWithLayout:]", 0x1Eu, (uint64_t)"ScreenState changed: %@ -> %@ (raw %d)", v4, v5, v6, v7, (uint64_t)v11);
          goto LABEL_28;
      }
    }
    v11 = CFSTR("?");
    goto LABEL_27;
  }
LABEL_28:
  v12 = self->_screenState;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  self->_screenState = v9;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v9 != v12)
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_287, &__block_literal_global_288);

}

- (void)_systemConfigUpdateKeyPtr:(id *)a3 name:(id)a4 enabled:(BOOL)a5 creator:(id)a6
{
  _BOOL4 v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  id v15;
  id v16;
  void *v17;
  NSMutableArray *scInitialKeys;
  NSMutableArray *v19;
  NSMutableArray *v20;
  id v21;

  v7 = a5;
  v21 = a4;
  v14 = (void (**)(_QWORD))a6;
  v15 = *a3;
  if (v7)
  {
    if (!v15)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]", 0x1Eu, (uint64_t)"SystemConfig monitoring add: %@\n", v10, v11, v12, v13, (uint64_t)v21);
      }
      v14[2](v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(a3, v17);
      self->_scChangesPending = 1;
      scInitialKeys = self->_scInitialKeys;
      if (!scInitialKeys)
      {
        v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v20 = self->_scInitialKeys;
        self->_scInitialKeys = v19;

        scInitialKeys = self->_scInitialKeys;
      }
      -[NSMutableArray addObject:](scInitialKeys, "addObject:", v17);

    }
  }
  else if (v15)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]", 0x1Eu, (uint64_t)"SystemConfig monitoring remove: %@\n", v10, v11, v12, v13, (uint64_t)v21);
    }
    v16 = *a3;
    *a3 = 0;

    self->_scChangesPending = 1;
  }

}

- (void)_systemConfigUpdateNotifications
{
  NSString *scPatternNetInterfaceIPv4;
  objc_class *v4;
  NSString *v5;
  id v6;
  NSString *v7;
  NSString *scKeySystemName;
  objc_class *v9;
  NSString *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __SCDynamicStore *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __SCDynamicStore *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __SCDynamicStore *scDynamicStore;
  NSArray *scNotificationKeys;
  NSArray *scNotificationPatterns;
  NSArray *v40;
  NSArray *v41;
  NSArray *v42;
  NSArray *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSArray *v49;
  NSArray *v50;
  NSArray *v51;
  char v52;
  NSMutableArray *scInitialKeys;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  SCDynamicStoreContext context;

  scPatternNetInterfaceIPv4 = self->_scPatternNetInterfaceIPv4;
  if (scPatternNetInterfaceIPv4)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99DE8];
    v5 = scPatternNetInterfaceIPv4;
    v6 = objc_alloc_init(v4);
    objc_msgSend(v6, "addObject:", v5);

    v7 = self->_scPatternNetInterfaceIPv6;
    if (!v7)
      goto LABEL_8;
    if (v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = self->_scPatternNetInterfaceIPv6;
  if (v7)
  {
LABEL_6:
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
LABEL_7:
    objc_msgSend(v6, "addObject:", v7);
    goto LABEL_8;
  }
  v6 = 0;
LABEL_8:

  scKeySystemName = self->_scKeySystemName;
  if (scKeySystemName)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99DE8];
    v10 = scKeySystemName;
    v11 = objc_alloc_init(v9);
    objc_msgSend(v11, "addObject:", v10);

  }
  else
  {
    v11 = 0;
  }
  if (!objc_msgSend(v11, "count") && !objc_msgSend(v6, "count"))
  {
    if (self->_scDynamicStore)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x1Eu, (uint64_t)"SystemConfig monitoring stop\n", v12, v13, v14, v15, v60);
      }
      SCDynamicStoreSetDispatchQueue(self->_scDynamicStore, 0);
      scDynamicStore = self->_scDynamicStore;
      if (scDynamicStore)
      {
        CFRelease(scDynamicStore);
        self->_scDynamicStore = 0;
      }
    }
    scNotificationKeys = self->_scNotificationKeys;
    self->_scNotificationKeys = 0;

    scNotificationPatterns = self->_scNotificationPatterns;
    self->_scNotificationPatterns = 0;

    goto LABEL_57;
  }
  v16 = self->_scDynamicStore;
  if (!v16)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x1Eu, (uint64_t)"SystemConfig monitoring start\n", v12, v13, v14, v15, v60);
    }
    v17 = getprogname();
    NSPrintF((uint64_t)"%s:CUSystemMonitor", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    v26 = SCDynamicStoreCreate(0, v25, (SCDynamicStoreCallBack)_systemConfigChanged, &context);
    if (!v26)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        v32 = SCError();
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x5Au, (uint64_t)"### SCDynamicStoreCreate failed: %#m\n", v33, v34, v35, v36, v32);
      }

      goto LABEL_61;
    }
    v16 = v26;
    self->_scDynamicStore = v26;
    if (!SCDynamicStoreSetDispatchQueue(v26, (dispatch_queue_t)self->_dispatchQueue)
      && gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      v27 = SCError();
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x5Au, (uint64_t)"### SCDynamicStoreSetDispatchQueue failed: %#m\n", v28, v29, v30, v31, v27);
    }

  }
  v40 = self->_scNotificationKeys;
  v41 = (NSArray *)v11;
  v42 = v40;
  if (v41 == v42)
  {

    goto LABEL_44;
  }
  v43 = v42;
  if ((v41 == 0) == (v42 != 0))
  {
    v50 = v41;
LABEL_49:

    goto LABEL_50;
  }
  v44 = -[NSArray isEqual:](v41, "isEqual:", v42);

  if (v44)
  {
LABEL_44:
    v49 = self->_scNotificationPatterns;
    v50 = (NSArray *)v6;
    v51 = v49;
    if (v50 == v51)
    {

LABEL_57:
      scInitialKeys = self->_scInitialKeys;
      if (scInitialKeys)
      {
        -[CUSystemMonitorImp _systemConfigChanged:initial:](self, "_systemConfigChanged:initial:", scInitialKeys, 1);
        v54 = self->_scInitialKeys;
      }
      else
      {
        v54 = 0;
      }
      self->_scInitialKeys = 0;

      self->_scChangesPending = 0;
      goto LABEL_61;
    }
    v43 = v51;
    if ((v50 == 0) != (v51 != 0))
    {
      v52 = -[NSArray isEqual:](v50, "isEqual:", v51);

      if ((v52 & 1) != 0)
        goto LABEL_57;
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_50:
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x1Eu, (uint64_t)"SystemConfig watch: Keys %##@, Patterns %##@\n", v45, v46, v47, v48, (uint64_t)v41);
  }
  if (SCDynamicStoreSetNotificationKeys(v16, (CFArrayRef)v41, (CFArrayRef)v6))
  {
    objc_storeStrong((id *)&self->_scNotificationKeys, v11);
    objc_storeStrong((id *)&self->_scNotificationPatterns, v6);
    goto LABEL_57;
  }
  if (gLogCategory_CUSystemMonitor <= 90
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
  {
    v55 = SCError();
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x5Au, (uint64_t)"### SCDynamicStoreSetNotificationKeys failed: %#m\n", v56, v57, v58, v59, v55);
  }
LABEL_61:

}

- (void)_systemConfigChanged:(id)a3 initial:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v19 = v4;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v13, "hasPrefix:", CFSTR("State:/Network/Interface/")) & 1) != 0)
        {
          v10 = 1;
        }
        else if ((-[NSString isEqual:](self->_scKeySystemName, "isEqual:", v13) & 1) != 0)
        {
          v9 = 1;
        }
        else if (gLogCategory_CUSystemMonitor <= 30
               && (gLogCategory_CUSystemMonitor != -1
                || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigChanged:initial:]", 0x1Eu, (uint64_t)"SystemConfig unknown key changed: '%@'\n", v14, v15, v16, v17, (uint64_t)v13);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
    if ((v10 & 1) != 0)
    {
      v18 = v19;
      -[CUSystemMonitorImp _systemConfigNetInterfaceChanged:initial:](self, "_systemConfigNetInterfaceChanged:initial:", v6, v19);
      if ((v9 & 1) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
    v18 = v19;
    if ((v9 & 1) != 0)
LABEL_20:
      -[CUSystemMonitorImp _systemConfigSystemNameChanged:](self, "_systemConfigSystemNameChanged:", v18);
  }
LABEL_21:

}

- (void)_systemConfigNetInterfaceChanged:(id)a3 initial:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v6 = a3;
  if (!a4)
  {
    v11 = v6;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigNetInterfaceChanged:initial:]", 0x1Eu, (uint64_t)"NetInterfaces changed: %##@\n", v7, v8, v9, v10, (uint64_t)v11);
    }
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_303, &__block_literal_global_304);
    v6 = v11;
  }

}

- (void)_systemConfigSystemNameChanged:(BOOL)a3
{
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *systemName;
  __CFString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *obj;

  v5 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
  obj = v5;
  if (a3)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigSystemNameChanged:]", 0x1Eu, (uint64_t)"SystemName initial: '%@'\n", v6, v7, v8, v9, (uint64_t)obj);
    }
LABEL_23:
    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_storeStrong((id *)&self->_systemName, obj);
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (!a3)
      -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_307, &__block_literal_global_308);
    goto LABEL_25;
  }
  systemName = self->_systemName;
  v11 = v5;
  v12 = systemName;
  if (v11 == (__CFString *)v12)
  {

  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

LABEL_14:
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigSystemNameChanged:]", 0x1Eu, (uint64_t)"SystemName changed: '%@' -> '%@'\n", v15, v16, v17, v18, (uint64_t)self->_systemName);
      }
      goto LABEL_23;
    }
    v14 = -[__CFString isEqual:](v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_14;
  }
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigSystemNameChanged:]", 0xAu, (uint64_t)"SystemName unchanged '%@'\n", v15, v16, v17, v18, (uint64_t)v11);
  }
LABEL_25:

}

- (void)_systemLockStateMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *p_systemLockStateToken;
  const char *v8;
  NSObject *dispatchQueue;
  uint64_t v10;
  _QWORD handler[5];

  if (self->_systemLockStateToken == -1)
  {
    p_systemLockStateToken = &self->_systemLockStateToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateMonitorStart]", 0x1Eu, (uint64_t)"SystemLockState monitoring start\n", v2, v3, v4, v5, v10);
    }
    v8 = (const char *)*MEMORY[0x1E0D4E600];
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __50__CUSystemMonitorImp__systemLockStateMonitorStart__block_invoke;
    handler[3] = &unk_1E25DE468;
    handler[4] = self;
    notify_register_dispatch(v8, p_systemLockStateToken, dispatchQueue, handler);
    -[CUSystemMonitorImp _systemLockStateUpdate:](self, "_systemLockStateUpdate:", 1);
  }
}

- (void)_systemLockStateMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int systemLockStateToken;
  uint64_t v8;

  systemLockStateToken = self->_systemLockStateToken;
  if (systemLockStateToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30)
      goto LABEL_7;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateMonitorStop]", 0x1Eu, (uint64_t)"SystemLockState monitoring stop\n", v2, v3, v4, v5, v8);
    systemLockStateToken = self->_systemLockStateToken;
    if (systemLockStateToken != -1)
    {
LABEL_7:
      notify_cancel(systemLockStateToken);
      self->_systemLockStateToken = -1;
    }
  }
}

- (void)_systemLockStateUpdate:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  int v6;
  uint64_t systemLockState;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v3 = a3;
  v5 = MKBGetDeviceLockState();
  if (v5 <= 4)
    v6 = 4 - v5;
  else
    v6 = 0;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  systemLockState = self->_systemLockState;
  self->_systemLockState = v6;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v3)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]", 0x1Eu, (uint64_t)"SystemLockState initial: %s\n", v8, v9, v10, v11, (uint64_t)off_1E25DE0C8[v6]);
    }
  }
  else if (v6 == (_DWORD)systemLockState)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]", 0xAu, (uint64_t)"SystemLockState unchanged: %s\n", v8, v9, v10, v11, (uint64_t)off_1E25DE0C8[v6]);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (systemLockState > 4)
        v12 = "?";
      else
        v12 = off_1E25DE0C8[systemLockState];
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]", 0x1Eu, (uint64_t)"SystemLockState changed: %s -> %s\n", v8, v9, v10, v11, (uint64_t)v12);
    }
    -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_315, &__block_literal_global_316);
  }
}

- (void)_systemUIMonitorStart
{
  NSDictionary *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  FBSDisplayLayoutMonitor *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *dispatchQueue;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD handler[5];
  _QWORD v52[4];
  NSDictionary *v53;
  CUSystemMonitorImp *v54;
  _QWORD v55[19];
  _QWORD v56[21];

  v56[19] = *MEMORY[0x1E0C80C00];
  v3 = self->_systemUIIdentifierMap;
  if (!v3)
  {
    getFBSDisplayLayoutElementControlCenterIdentifier[0]();
    v4 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v4;
    v5 = CFSTR("com.apple.control-center");
    if (v4)
      v5 = (const __CFString *)v4;
    v55[0] = v5;
    v56[0] = &unk_1E25FD218;
    getFBSDisplayLayoutElementLockScreenIdentifier[0]();
    v6 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v6;
    v7 = CFSTR("com.apple.lock-screen");
    if (v6)
      v7 = (const __CFString *)v6;
    v55[1] = v7;
    v56[1] = &unk_1E25FD230;
    getFBSDisplayLayoutElementNotificationCenterIdentifier[0]();
    v8 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v8;
    v9 = CFSTR("com.apple.notification-center");
    if (v8)
      v9 = (const __CFString *)v8;
    v55[2] = v9;
    v56[2] = &unk_1E25FD248;
    getFBSDisplayLayoutElementSiriIdentifier[0]();
    v10 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v10;
    v11 = CFSTR("com.apple.Siri");
    if (v10)
      v11 = (const __CFString *)v10;
    v55[3] = v11;
    v56[3] = &unk_1E25FD260;
    getSBSDisplayLayoutElementAppSwitcherIdentifier[0]();
    v12 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v12;
    v13 = CFSTR("com.apple.springboard.app-switcher");
    if (v12)
      v13 = (const __CFString *)v12;
    v55[4] = v13;
    v56[4] = &unk_1E25FD278;
    getSBSDisplayLayoutElementCarPlayOEMIdentifier[0]();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("com.apple.carplay.oem");
    if (v14)
      v16 = (const __CFString *)v14;
    v55[5] = v16;
    v56[5] = &unk_1E25FD290;
    getSBSDisplayLayoutElementHomeScreenIdentifier[0]();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("com.apple.springboard.home-screen");
    if (v17)
      v19 = (const __CFString *)v17;
    v55[6] = v19;
    v56[6] = &unk_1E25FD2A8;
    getSBSDisplayLayoutElementLockScreenNavigationIdentifier[0]();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("com.apple.springboard.lockscreen.navigation");
    if (v20)
      v22 = (const __CFString *)v20;
    v55[7] = v22;
    v56[7] = &unk_1E25FD2C0;
    getSBSDisplayLayoutElementLoginIdentifier[0]();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = CFSTR("com.apple.springboard.login");
    if (v23)
      v25 = (const __CFString *)v23;
    v55[8] = v25;
    v56[8] = &unk_1E25FD2D8;
    getSBSDisplayLayoutElementNowPlayingIdentifier[0]();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v28 = CFSTR("com.apple.now-playing");
    if (v26)
      v28 = (const __CFString *)v26;
    v55[9] = v28;
    v56[9] = &unk_1E25FD2F0;
    getSBSDisplayLayoutElementPasscodeIdentifier[0]();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = CFSTR("com.apple.springboard.passcode");
    if (v29)
      v31 = (const __CFString *)v29;
    v55[10] = v31;
    v56[10] = &unk_1E25FD308;
    getSBSDisplayLayoutElementSpotlightIdentifier[0]();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    v34 = CFSTR("com.apple.springboard.spotlight");
    if (v32)
      v34 = (const __CFString *)v32;
    v55[11] = v34;
    v56[11] = &unk_1E25FD320;
    getSBSDisplayLayoutElementTodayViewIdentifier[0]();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    v37 = CFSTR("com.apple.springboard.today-view");
    if (v35)
      v37 = (const __CFString *)v35;
    v55[12] = v37;
    v55[13] = CFSTR("com.apple.camera");
    v56[12] = &unk_1E25FD338;
    v56[13] = &unk_1E25FD350;
    v55[14] = CFSTR("com.apple.CoreAuthUI");
    v55[15] = CFSTR("com.apple.InCallService");
    v56[14] = &unk_1E25FD368;
    v56[15] = &unk_1E25FD380;
    v55[16] = CFSTR("com.apple.SharingViewService");
    v55[17] = CFSTR("SBSpotlightAlert");
    v56[16] = &unk_1E25FD398;
    v56[17] = &unk_1E25FD320;
    v55[18] = CFSTR("SBVoiceControlAlert");
    v56[18] = &unk_1E25FD3B0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 19);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_systemUIIdentifierMap, v3);
  }
  v38 = self->_systemUIMonitor;
  if (!v38)
  {
    if ((Class)getFBSDisplayLayoutMonitorConfigurationClass[0]() && (Class)getFBSDisplayLayoutMonitorClass[0]())
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStart]", 0x1Eu, (uint64_t)"SystemUI monitoring start", v39, v40, v41, v42, v45);
      }
      objc_msgSend((Class)getFBSDisplayLayoutMonitorConfigurationClass[0](), "configurationForDefaultMainDisplayMonitor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke;
      v52[3] = &unk_1E25DDD90;
      v53 = v3;
      v54 = self;
      objc_msgSend(v43, "setTransitionHandler:", v52);
      objc_msgSend((Class)getFBSDisplayLayoutMonitorClass[0](), "monitorWithConfiguration:", v43);
      v38 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_systemUIMonitor, v38);

    }
    else
    {
      v38 = 0;
    }
  }
  if (self->_systemUIBluetoothNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_3;
    handler[3] = &unk_1E25DE468;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.systemFlags", &self->_systemUIBluetoothNotifyToken, dispatchQueue, handler);
  }

}

- (void)_systemUIMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  FBSDisplayLayoutMonitor *systemUIMonitor;
  NSDictionary *systemUIIdentifierMap;
  int systemUIBluetoothNotifyToken;
  uint64_t v10;

  if (self->_systemUIMonitor
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStop]", 0x1Eu, (uint64_t)"SystemUI monitoring stop", v2, v3, v4, v5, v10);
  }
  -[FBSDisplayLayoutMonitor invalidate](self->_systemUIMonitor, "invalidate");
  systemUIMonitor = self->_systemUIMonitor;
  self->_systemUIMonitor = 0;

  systemUIIdentifierMap = self->_systemUIIdentifierMap;
  self->_systemUIIdentifierMap = 0;

  systemUIBluetoothNotifyToken = self->_systemUIBluetoothNotifyToken;
  if (systemUIBluetoothNotifyToken != -1)
  {
    notify_cancel(systemUIBluetoothNotifyToken);
    self->_systemUIBluetoothNotifyToken = -1;
  }
}

- (void)_firstUnlockMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  NSObject *dispatchQueue;
  uint64_t v9;
  _QWORD handler[5];

  if (!self->_firstUnlocked && self->_firstUnlockToken == -1)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorStart]", 0x1Eu, (uint64_t)"FirstUnlock monitoring start\n", v2, v3, v4, v5, v9);
    }
    v7 = (const char *)*MEMORY[0x1E0D4E600];
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46__CUSystemMonitorImp__firstUnlockMonitorStart__block_invoke;
    handler[3] = &unk_1E25DE468;
    handler[4] = self;
    notify_register_dispatch(v7, &self->_firstUnlockToken, dispatchQueue, handler);
    -[CUSystemMonitorImp _firstUnlockMonitorCheck:](self, "_firstUnlockMonitorCheck:", 1);
  }
}

- (void)_firstUnlockMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int firstUnlockToken;
  OS_dispatch_source *firstUnlockTimer;
  OS_dispatch_source *v9;
  uint64_t v10;
  NSObject *v11;

  firstUnlockToken = self->_firstUnlockToken;
  if (firstUnlockToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30)
      goto LABEL_7;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorStop]", 0x1Eu, (uint64_t)"FirstUnlock monitoring stop\n", v2, v3, v4, v5, v10);
    firstUnlockToken = self->_firstUnlockToken;
    if (firstUnlockToken != -1)
    {
LABEL_7:
      notify_cancel(firstUnlockToken);
      self->_firstUnlockToken = -1;
    }
  }
  firstUnlockTimer = self->_firstUnlockTimer;
  if (firstUnlockTimer)
  {
    v11 = firstUnlockTimer;
    dispatch_source_cancel(v11);
    v9 = self->_firstUnlockTimer;
    self->_firstUnlockTimer = 0;

  }
}

- (void)_firstUnlockMonitorCheck:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int firstUnlockToken;
  OS_dispatch_source *firstUnlockTimer;
  NSObject *v19;
  OS_dispatch_source *v20;
  NSObject *dispatchQueue;
  uint64_t v22;
  _QWORD block[5];
  uint64_t v24;

  v3 = a3;
  v5 = MKBDeviceUnlockedSinceBoot();
  v10 = v5 == 1;
  if (v3)
  {
    v11 = v5;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v12 = "no";
      if (v11 == 1)
        v12 = "yes";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]", 0x1Eu, (uint64_t)"FirstUnlock initial: %s\n", v6, v7, v8, v9, (uint64_t)v12);
    }
    if (v11 == 1)
      goto LABEL_13;
  }
  else
  {
    if (v5 == 1)
    {
LABEL_13:
      pthread_mutex_lock(&gCUSystemMonitorLock);
      self->_firstUnlocked = v10;
      pthread_mutex_unlock(&gCUSystemMonitorLock);
      if (!v3)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]", 0x1Eu, (uint64_t)"FirstUnlock changed: No -> Yes\n", v13, v14, v15, v16, v22);
        }
        -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_386, &__block_literal_global_387);
      }
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]", 0x1Eu, (uint64_t)"FirstUnlock monitoring stop after unlock\n", v13, v14, v15, v16, v22);
      }
      firstUnlockToken = self->_firstUnlockToken;
      if (firstUnlockToken != -1)
      {
        notify_cancel(firstUnlockToken);
        self->_firstUnlockToken = -1;
      }
      firstUnlockTimer = self->_firstUnlockTimer;
      if (firstUnlockTimer)
      {
        v19 = firstUnlockTimer;
        dispatch_source_cancel(v19);
        v20 = self->_firstUnlockTimer;
        self->_firstUnlockTimer = 0;

      }
      if (v3)
      {
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_3;
        block[3] = &unk_1E25DF2A0;
        block[4] = self;
        dispatch_async(dispatchQueue, block);
      }
      else
      {
        -[CUSystemMonitorImp _update](self, "_update");
      }
      return;
    }
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]", 0xAu, (uint64_t)"FirstUnlock unchanged (No)\n", v6, v7, v8, v9, v24);
    }
  }
}

- (void)_wifiMonitorStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CUWiFiManager *v7;
  CUWiFiManager *wifiManager;
  uint64_t v9;
  CUWiFiManager *v10;
  uint64_t v11[5];
  _QWORD v12[5];

  if (!self->_wifiManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStart]", 0x1Eu, (uint64_t)"WiFi monitoring start\n", v2, v3, v4, v5, v11[0]);
    }
    v7 = objc_alloc_init(CUWiFiManager);
    wifiManager = self->_wifiManager;
    self->_wifiManager = v7;

    -[CUWiFiManager setControlFlags:](self->_wifiManager, "setControlFlags:", -[CUWiFiManager controlFlags](self->_wifiManager, "controlFlags") | 0x100);
    -[CUWiFiManager setDispatchQueue:](self->_wifiManager, "setDispatchQueue:", self->_dispatchQueue);
    -[CUWiFiManager setLabel:](self->_wifiManager, "setLabel:", CFSTR("SysMon"));
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke;
    v12[3] = &unk_1E25DF2A0;
    v12[4] = self;
    -[CUWiFiManager setWifiStateChangedHandler:](self->_wifiManager, "setWifiStateChangedHandler:", v12);
    v10 = self->_wifiManager;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = (uint64_t)__39__CUSystemMonitorImp__wifiMonitorStart__block_invoke_2;
    v11[3] = (uint64_t)&unk_1E25DDDF8;
    v11[4] = (uint64_t)self;
    -[CUWiFiManager activateWithCompletion:](v10, "activateWithCompletion:", v11);
  }
}

- (void)_wifiMonitorStop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CUWiFiManager *wifiManager;
  uint64_t v8;

  if (self->_wifiManager
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStop]", 0x1Eu, (uint64_t)"WiFi monitoring stop\n", v2, v3, v4, v5, v8);
  }
  -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
  wifiManager = self->_wifiManager;
  self->_wifiManager = 0;

}

- (void)_wifiMonitorStateChanged:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  int v6;
  unsigned int wifiFlags;
  int wifiState;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;

  v3 = a3;
  v5 = -[CUWiFiManager wifiFlags](self->_wifiManager, "wifiFlags");
  v6 = -[CUWiFiManager wifiState](self->_wifiManager, "wifiState");
  pthread_mutex_lock(&gCUSystemMonitorLock);
  wifiFlags = self->_wifiFlags;
  wifiState = self->_wifiState;
  self->_wifiFlags = v5;
  self->_wifiState = v6;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v6 != wifiState || v5 != wifiFlags)
  {
    if (v3)
    {
      if (gLogCategory_CUSystemMonitor > 30
        || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        goto LABEL_76;
      }
      if (wifiState <= 19)
      {
        if (!wifiState)
        {
          v14 = "Unknown";
          goto LABEL_75;
        }
        if (wifiState == 10)
        {
          v14 = "Off";
          goto LABEL_75;
        }
      }
      else
      {
        switch(wifiState)
        {
          case 20:
            v14 = "NotConnected";
            goto LABEL_75;
          case 30:
            v14 = "Connecting";
            goto LABEL_75;
          case 40:
            v14 = "Connected";
LABEL_75:
            LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]", 0x1Eu, (uint64_t)"WiFi state changed: %s -> %s, %#{flags}\n", v9, v10, v11, v12, (uint64_t)v14);
            goto LABEL_76;
        }
      }
      v14 = "?";
      goto LABEL_75;
    }
    if (gLogCategory_CUSystemMonitor > 30
      || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      goto LABEL_76;
    }
    if (v6 <= 19)
    {
      if (!v6)
      {
        v16 = "Unknown";
        goto LABEL_70;
      }
      if (v6 == 10)
      {
        v16 = "Off";
        goto LABEL_70;
      }
    }
    else
    {
      switch(v6)
      {
        case 20:
          v16 = "NotConnected";
          goto LABEL_70;
        case 30:
          v16 = "Connecting";
          goto LABEL_70;
        case 40:
          v16 = "Connected";
LABEL_70:
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]", 0x1Eu, (uint64_t)"WiFi state initial: %s, %#{flags}\n", v9, v10, v11, v12, (uint64_t)v16);
LABEL_76:
          -[CUSystemMonitorImp _invokeBlock:passingTest:](self, "_invokeBlock:passingTest:", &__block_literal_global_399, &__block_literal_global_400);
          return;
      }
    }
    v16 = "?";
    goto LABEL_70;
  }
  if (!v3)
  {
    if (gLogCategory_CUSystemMonitor > 30
      || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      return;
    }
    if (v6 <= 19)
    {
      if (!v6)
      {
        v17 = "Unknown";
        goto LABEL_73;
      }
      if (v6 == 10)
      {
        v17 = "Off";
        goto LABEL_73;
      }
    }
    else
    {
      switch(v6)
      {
        case 20:
          v17 = "NotConnected";
          goto LABEL_73;
        case 30:
          v17 = "Connecting";
          goto LABEL_73;
        case 40:
          v17 = "Connected";
LABEL_73:
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]", 0x1Eu, (uint64_t)"WiFi state initial: %s\n", v9, v10, v11, v12, (uint64_t)v17);
          return;
      }
    }
    v17 = "?";
    goto LABEL_73;
  }
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    if (v6 <= 19)
    {
      if (!v6)
      {
        v15 = "Unknown";
        goto LABEL_67;
      }
      if (v6 == 10)
      {
        v15 = "Off";
        goto LABEL_67;
      }
    }
    else
    {
      switch(v6)
      {
        case 20:
          v15 = "NotConnected";
          goto LABEL_67;
        case 30:
          v15 = "Connecting";
          goto LABEL_67;
        case 40:
          v15 = "Connected";
LABEL_67:
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]", 0xAu, (uint64_t)"WiFi state unchanged: %s, %#{flags}\n", v9, v10, v11, v12, (uint64_t)v15);
          return;
      }
    }
    v15 = "?";
    goto LABEL_67;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_firstUnlockTimer, 0);
  objc_storeStrong((id *)&self->_systemUIMonitor, 0);
  objc_storeStrong((id *)&self->_systemUIIdentifierMap, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_scNotificationPatterns, 0);
  objc_storeStrong((id *)&self->_scNotificationKeys, 0);
  objc_storeStrong((id *)&self->_scPatternNetInterfaceIPv6, 0);
  objc_storeStrong((id *)&self->_scPatternNetInterfaceIPv4, 0);
  objc_storeStrong((id *)&self->_scKeySystemName, 0);
  objc_storeStrong((id *)&self->_scInitialKeys, 0);
  objc_storeStrong((id *)&self->_screenStateMonitor, 0);
  objc_storeStrong((id *)&self->_rotatingIdentifierTimer, 0);
  objc_storeStrong((id *)&self->_rotatingIdentifierData, 0);
  objc_storeStrong((id *)&self->_regionRoutineState, 0);
  objc_storeStrong((id *)&self->_regionRoutineCountry, 0);
  objc_storeStrong((id *)&self->_regionRoutineManager, 0);
  objc_storeStrong((id *)&self->_regionMobileCountryCode, 0);
  objc_storeStrong((id *)&self->_regionISOCountryCode, 0);
  objc_storeStrong((id *)&self->_regionCTClient, 0);
  objc_storeStrong((id *)&self->_primaryAppleID, 0);
  objc_storeStrong((id *)&self->_primaryNetworkSignature, 0);
  objc_storeStrong((id *)&self->_netInterfaceMonitor, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_meDeviceRetryTimer, 0);
  objc_storeStrong((id *)&self->_meDeviceName, 0);
  objc_storeStrong((id *)&self->_meDeviceIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_meDeviceFMFDeviceID, 0);
  objc_storeStrong((id *)&self->_meDeviceFindMyLocateMonitor, 0);
  objc_storeStrong((id *)&self->_manateeRetryTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_familyPrimaryIPMonitor, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_bluetoothClient, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressData, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

BOOL __47__CUSystemMonitorImp__wifiMonitorStateChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "wifiStateChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__wifiMonitorStateChanged___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "wifiStateChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wifiMonitorStateChanged:", 1);
}

void __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7
    && gLogCategory_CUSystemMonitor <= 90
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStart]_block_invoke_2", 0x5Au, (uint64_t)"### WiFi monitoring start failed: %{error}\n", v3, v4, v5, v6, (uint64_t)v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "_wifiMonitorStateChanged:", 0);

}

uint64_t __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

BOOL __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "firstUnlockHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "firstUnlockHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __46__CUSystemMonitorImp__firstUnlockMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_firstUnlockMonitorCheck:", 0);
}

uint64_t __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_3(uint64_t a1, int token)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  return objc_msgSend(*(id *)(a1 + 32), "_systemUIMonitorChangedFlags:", *(_DWORD *)(*(_QWORD *)(a1 + 32) + 596) & 0xFFFBFFFF | ((state64 & 1) << 18));
}

BOOL __45__CUSystemMonitorImp__systemLockStateUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "systemLockStateChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __45__CUSystemMonitorImp__systemLockStateUpdate___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "systemLockStateChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __50__CUSystemMonitorImp__systemLockStateMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_systemLockStateUpdate:", 0);
}

BOOL __53__CUSystemMonitorImp__systemConfigSystemNameChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "systemNameChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __53__CUSystemMonitorImp__systemConfigSystemNameChanged___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "systemNameChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __63__CUSystemMonitorImp__systemConfigNetInterfaceChanged_initial___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "netInterfacesChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __63__CUSystemMonitorImp__systemConfigNetInterfaceChanged_initial___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "netInterfacesChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __58__CUSystemMonitorImp__screenStateMonitorUpdateWithLayout___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "screenStateChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __58__CUSystemMonitorImp__screenStateMonitorUpdateWithLayout___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "screenStateChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

void __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke_2;
  v8[3] = &unk_1E25DE628;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

_QWORD *__46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[63])
    return (_QWORD *)objc_msgSend(result, "_screenStateMonitorUpdateWithLayout:", *(_QWORD *)(a1 + 40));
  return result;
}

BOOL __37__CUSystemMonitorImp__screenChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "screenOnChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __37__CUSystemMonitorImp__screenChanged___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "screenOnChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __46__CUSystemMonitorImp__screenOnMonitorStartiOS__block_invoke(uint64_t a1, int token)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  return objc_msgSend(*(id *)(a1 + 32), "_screenChanged:", state64 == 0);
}

BOOL __42__CUSystemMonitorImp__screenLockedChanged__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "screenLockedChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __42__CUSystemMonitorImp__screenLockedChanged__block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "screenLockedChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __47__CUSystemMonitorImp__screenLockedMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_screenLockedChanged");
}

BOOL __51__CUSystemMonitorImp__rotatingIdentifierTimerFired__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "rotatingIdentifierChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__rotatingIdentifierTimerFired__block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "rotatingIdentifierChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __53__CUSystemMonitorImp__rotatingIdentifierMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rotatingIdentifierTimerFired");
}

void __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[6];

  v5 = a2;
  v6 = a3;
  v11 = v5;
  if (!v11 || v6)
  {
    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]_block_invoke", 0x5Au, (uint64_t)"### Region monitor LOI fetch failed: %{error}", v7, v8, v9, v10, (uint64_t)v6);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v12 = objc_msgSend(v11, "count");
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]_block_invoke", 0x1Eu, (uint64_t)"Region monitor LOI fetch completed: %d total", v13, v14, v15, v16, v12);
    }
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(NSObject **)(v17 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke_2;
    block[3] = &unk_1E25DE628;
    block[4] = v17;
    block[5] = v11;
    dispatch_async(v18, block);
  }

}

uint64_t __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_regionMonitorUpdateLocationsOfInterest:", *(_QWORD *)(a1 + 40));
}

BOOL __46__CUSystemMonitorImp__regionMonitorUpdateMCC___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "regionChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __46__CUSystemMonitorImp__regionMonitorUpdateMCC___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "regionChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __62__CUSystemMonitorImp__regionMonitorUpdateLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "regionChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __62__CUSystemMonitorImp__regionMonitorUpdateLocationsOfInterest___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "regionChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

void __39__CUSystemMonitorImp__regionMonitorGet__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[6];

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392))
  {
    v11 = v5;
    if (!v11 || v6)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke", 0x5Au, (uint64_t)"### Region monitor get CT subscription context failed: %{error}", v7, v8, v9, v10, (uint64_t)v6);
      }
    }
    else
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke", 0x1Eu, (uint64_t)"Region monitor get MCC", v7, v8, v9, v10, v13);
      }
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __39__CUSystemMonitorImp__regionMonitorGet__block_invoke_2;
      v14[3] = &unk_1E25DDB90;
      v12 = *(void **)(a1 + 40);
      v14[4] = *(_QWORD *)(a1 + 32);
      v14[5] = v12;
      objc_msgSend(v12, "copyMobileCountryCode:completion:", v11, v14);
    }

  }
}

void __39__CUSystemMonitorImp__regionMonitorGet__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  v15 = a2;
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392))
  {
    if (v5)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke_2", 0x5Au, (uint64_t)"### Region monitor get MCC failed: MCC %@, %{error}", v6, v7, v8, v9, (uint64_t)v15);
      }
    }
    else
    {
      if (objc_msgSend(v15, "integerValue") == 0xFFFF)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke_2", 0x1Eu, (uint64_t)"Region monitor mapping %@ -> null (get)", v10, v11, v12, v13, (uint64_t)v15);
        }

        v14 = 0;
      }
      else
      {
        v14 = v15;
      }
      v15 = v14;
      objc_msgSend(*(id *)(a1 + 32), "_regionMonitorUpdateMCC:");
    }
  }

}

uint64_t __41__CUSystemMonitorImp__regionMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locationsOfInterestDidChange:", 1);
}

BOOL __46__CUSystemMonitorImp__primaryAppleIDChanged2___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "primaryAppleIDChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __46__CUSystemMonitorImp__primaryAppleIDChanged2___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "primaryAppleIDChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __45__CUSystemMonitorImp__primaryAppleIDChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDChanged2:", 0);
}

uint64_t __49__CUSystemMonitorImp__primaryAppleIDMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDChanged2:", 0);
}

uint64_t __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;

  v2 = IOPSDrawingUnlimitedPower();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned __int8 *)(v3 + 364);
  *(_BYTE *)(v3 + 364) = v2;
  result = pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v4 == v2)
  {
    if (gLogCategory_CUSystemMonitor <= 10)
    {
      if (gLogCategory_CUSystemMonitor != -1
        || (result = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu), (_DWORD)result))
      {
        v10 = "no";
        if (v2)
          v10 = "yes";
        return LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]_block_invoke", 0xAu, (uint64_t)"PowerUnlimited unchanged (%s)\n", v6, v7, v8, v9, (uint64_t)v10);
      }
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (v4)
        v11 = "yes";
      else
        v11 = "no";
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]_block_invoke", 0x1Eu, (uint64_t)"PowerUnlimited changed: %s -> %s\n", v6, v7, v8, v9, (uint64_t)v11);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_203, &__block_literal_global_204);
  }
  return result;
}

BOOL __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "powerUnlimitedChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "powerUnlimitedChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "flags");
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  logger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSPrintF((uint64_t)"%#{flags}", v3, v4, v5, v6, v7, v8, v9, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 288));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v10;
    _os_log_impl(&dword_18D40C000, v2, OS_LOG_TYPE_DEFAULT, "Network interface flags changed: %@", buf, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_178, &__block_literal_global_179);
}

uint64_t __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _OWORD *v3;
  void *v4;
  uint64_t v5;
  _OWORD *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[40];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (_OWORD *)(v2 + 292);
  v4 = *(void **)(v2 + 280);
  if (v4)
    objc_msgSend(v4, "primaryIPv4Addr");
  else
    memset(buf, 0, 28);
  *v3 = *(_OWORD *)buf;
  *(_OWORD *)((char *)v3 + 12) = *(_OWORD *)&buf[12];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (_OWORD *)(v5 + 320);
  v7 = *(void **)(v5 + 280);
  if (v7)
    objc_msgSend(v7, "primaryIPv6Addr");
  else
    memset(buf, 0, 28);
  *v6 = *(_OWORD *)buf;
  *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)&buf[12];
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  logger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSPrintF((uint64_t)"%##a", v9, v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 32) + 292);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrintF((uint64_t)"%##a", v17, v18, v19, v20, v21, v22, v23, *(_QWORD *)(a1 + 32) + 320);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v24;
    _os_log_impl(&dword_18D40C000, v8, OS_LOG_TYPE_DEFAULT, "PrimaryIP changed: IPv4 %@, IPv6 %@", buf, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_181, &__block_literal_global_183);
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_184(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "primaryNetworkSignature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 352), v2);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  logger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_18D40C000, v3, OS_LOG_TYPE_DEFAULT, "PrimaryNetwork changed: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_186, &__block_literal_global_188);
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_189(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  _OWORD *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _OWORD v43[2];
  _OWORD v44[2];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "flags");
  memset(v44, 0, 28);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  if (v3
    && (objc_msgSend(v3, "primaryIPv4Addr"), v4 = *(void **)(*(_QWORD *)(a1 + 32) + 280), memset(v43, 0, 28), v4))
  {
    objc_msgSend(v4, "primaryIPv6Addr");
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  }
  else
  {
    v5 = 0;
    memset(v43, 0, 28);
  }
  objc_msgSend(v5, "primaryNetworkSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_DWORD *)(v7 + 288);
  v9 = 1;
  v10 = SockAddrCompareAddrEx(v44, v7 + 292, 1);
  v11 = (SockAddrCompareAddrEx(v43, *(_QWORD *)(a1 + 32) + 320, 1) | v10) != 0;
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 352);
  v13 = v6;
  v14 = v12;
  v15 = v14;
  if (v13 != v14)
  {
    if ((v13 == 0) == (v14 != 0))
      v9 = 0;
    else
      v9 = objc_msgSend(v13, "isEqual:", v14);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288) = v2;
  v16 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(v16 + 304) = *(_OWORD *)((char *)v44 + 12);
  *(_OWORD *)(v16 + 292) = v44[0];
  v17 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 320);
  *v17 = v43[0];
  *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)((char *)v43 + 12);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 352), v6);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  logger();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSPrintF((uint64_t)"%#{flags}", v19, v20, v21, v22, v23, v24, v25, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 288));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrintF((uint64_t)"%##a", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v44);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrintF((uint64_t)"%##a", v35, v36, v37, v38, v39, v40, v41, (uint64_t)v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v46 = v26;
    v47 = 2112;
    v48 = v34;
    v49 = 2112;
    v50 = v42;
    v51 = 2112;
    v52 = v13;
    _os_log_impl(&dword_18D40C000, v18, OS_LOG_TYPE_DEFAULT, "NetInterface initial: Flags %@, IPv4 %@, IPv6 %@, Sig %@", buf, 0x2Au);

  }
  if (v2 == v8)
  {
    if (!v11)
      goto LABEL_13;
LABEL_17:
    objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_195, &__block_literal_global_196);
    if ((v9 & 1) != 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_191, &__block_literal_global_193);
  if (v11)
    goto LABEL_17;
LABEL_13:
  if ((v9 & 1) == 0)
LABEL_14:
    objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_197, &__block_literal_global_198);
LABEL_15:

}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "primaryNetworkChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_5(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "primaryNetworkChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "primaryIPChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_194(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "primaryIPChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_192(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "netFlagsChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_190(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "netFlagsChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_187(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "primaryNetworkChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_185(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "primaryNetworkChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_182(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "primaryIPChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_180(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "primaryIPChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "netFlagsChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_177(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "netFlagsChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __55__CUSystemMonitorImp__motionMonitorOrientationChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "motionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __55__CUSystemMonitorImp__motionMonitorOrientationChanged___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "motionHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __51__CUSystemMonitorImp__motionMonitorHandleActivity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "motionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__motionMonitorHandleActivity___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "motionHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

_QWORD *__41__CUSystemMonitorImp__motionMonitorStart__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[30])
    return (_QWORD *)objc_msgSend(result, "_motionMonitorHandleActivity:", a2);
  return result;
}

void __41__CUSystemMonitorImp__motionMonitorStart__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272))
  {
    v13 = v19;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "_motionMonitorOrientationChanged:", v13);
    }
    else if (gLogCategory_CUSystemMonitor <= 90
           && (gLogCategory_CUSystemMonitor != -1
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      NSPrintF((uint64_t)"%{error}", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorStart]_block_invoke_2", 0x5Au, (uint64_t)"### Motion orientation failed: %@", v15, v16, v17, v18, (uint64_t)v14);

    }
  }

}

BOOL __38__CUSystemMonitorImp__meDeviceUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "meDeviceChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __38__CUSystemMonitorImp__meDeviceUpdate___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "meDeviceChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __48__CUSystemMonitorImp__meDeviceRetryTimerUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]_block_invoke", 0x1Eu, (uint64_t)"MeDevice retry timer fired", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_meDeviceCheckStart:", 0);
}

BOOL __64__CUSystemMonitorImp__meDeviceCheckCompletion_error_firstCheck___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "meDeviceChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __64__CUSystemMonitorImp__meDeviceCheckCompletion_error_firstCheck___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "meDeviceChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __42__CUSystemMonitorImp__meDeviceCheckStart___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_meDeviceCheckCompletion:error:firstCheck:", a2, a3, *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setDelegate:", 0);
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_meDeviceUpdate:", a2);
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_3", 0x1Eu, (uint64_t)"MeDevice me device changed\n", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_meDeviceCheckStart:", 0);
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_4", 0x1Eu, (uint64_t)"MeDevice device list changed\n", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_meDeviceCheckStart:", 0);
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_5", 0x1Eu, (uint64_t)"MeDevice device retry notification\n", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_meDeviceCheckStart:", 0);
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "meDeviceUseFindMyLocate");
}

_BYTE *__47__CUSystemMonitorImp__forceManateeStateRefresh__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[156])
    return (_BYTE *)objc_msgSend(result, "_manateeRead");
  return result;
}

BOOL __34__CUSystemMonitorImp__manateeRead__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "manateeChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_5(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "manateeChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("CUSystemMonitor-CDP", 0);
  v1 = (void *)_manateeRead_cdpQueue;
  _manateeRead_cdpQueue = (uint64_t)v0;

}

BOOL __51__CUSystemMonitorImp__locationVisitUpdate_arrived___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "locationVisitsChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__locationVisitUpdate_arrived___block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "locationVisitsChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __37__CUSystemMonitorImp__familyUpdated___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 112))
  {
    v8 = result;
    if (*(_QWORD *)(result + 40)
      && gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyUpdated:]_block_invoke", 0x1Eu, (uint64_t)"Family updated\n", a5, a6, a7, a8, v9);
    }
    return objc_msgSend(*(id *)(v8 + 32), "_familyGetMembers:", 0);
  }
  return result;
}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__CUSystemMonitorImp__familyGetMembers___block_invoke_2;
  v11[3] = &unk_1E25DE250;
  v11[4] = v7;
  v12 = v6;
  v13 = v5;
  v14 = *(_BYTE *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v8 + 128) == -1)
    return;
  *(_BYTE *)(v8 + 100) = *(_QWORD *)(a1 + 40) != 0;
  v10 = *(_QWORD *)(a1 + 40);
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 48), "members");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          getFAFamilyMemberClass[0]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (gLogCategory_CUSystemMonitor <= 90
              && (gLogCategory_CUSystemMonitor != -1
               || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
            {
              LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2", 0x5Au, (uint64_t)"### Family bad member type: %@\n", v19, v20, v21, v22, v18);
            }

            goto LABEL_33;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v15)
          continue;
        break;
      }
    }

    if (*(_BYTE *)(a1 + 56))
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        v23 = "Family initial: %d family member(s)\n";
LABEL_26:
        v24 = objc_msgSend(v13, "count");
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2", 0x1Eu, (uint64_t)v23, v25, v26, v27, v28, v24);
      }
    }
    else if (gLogCategory_CUSystemMonitor <= 30
           && (gLogCategory_CUSystemMonitor != -1
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v23 = "Family updated: %d family member(s)\n";
      goto LABEL_26;
    }
    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v12);
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_99, &__block_literal_global_100);
LABEL_33:

    return;
  }
  if (gLogCategory_CUSystemMonitor > 90)
    return;
  if (gLogCategory_CUSystemMonitor != -1)
    goto LABEL_5;
  if (_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au))
  {
    v10 = *(_QWORD *)(a1 + 40);
LABEL_5:
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2", 0x5Au, (uint64_t)"### Family get members failed: %{error}\n", a5, a6, a7, a8, v10);
  }
}

BOOL __40__CUSystemMonitorImp__familyGetMembers___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "familyUpdatedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke_3(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "familyUpdatedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_familyNetworkChanged");
}

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_familyNetworkChanged");
}

_QWORD *__41__CUSystemMonitorImp__familyMonitorStart__block_invoke_3(uint64_t a1, int token)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t state64;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    state64 = 0;
    notify_get_state(token, &state64);
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]_block_invoke_3", 0x1Eu, (uint64_t)"Family setup state changed: %llu\n", v4, v5, v6, v7, state64);
  }
  result = *(_QWORD **)(a1 + 32);
  if (!result[13])
    return (_QWORD *)objc_msgSend(result, "_familyGetMembers:", 0);
  return result;
}

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]_block_invoke_4", 0x1Eu, (uint64_t)"Family updated\n", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_familyGetMembers:", 0);
}

BOOL __38__CUSystemMonitorImp__callInfoChanged__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "callChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __38__CUSystemMonitorImp__callInfoChanged__block_invoke(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "callChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __47__CUSystemMonitorImp__callCenterStatusChanged___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 88))
  {
    v8 = result;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callCenterStatusChanged:]_block_invoke", 0x1Eu, (uint64_t)"TUCallCenter changed\n", a5, a6, a7, a8, v9);
    }
    return objc_msgSend(*(id *)(v8 + 32), "_callInfoChanged");
  }
  return result;
}

void __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  id v24;
  void *v25;

  v4 = a2;
  v5 = v4;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v25 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v25;
    if (v6 == 6)
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v8 = v25;
      v9 = v7;
      if (v9 == v8)
      {

      }
      else
      {
        v10 = v9;
        if ((v8 == 0) == (v9 != 0))
        {

          goto LABEL_12;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
LABEL_12:
          if (gLogCategory_CUSystemMonitor <= 30
            && (gLogCategory_CUSystemMonitor != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
          {
            v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bytes");
            objc_msgSend(objc_retainAutorelease(v8), "bytes");
            LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]_block_invoke", 0x1Eu, (uint64_t)"Bluetooth address changed: %.6a -> %.6a\n", v18, v19, v20, v21, v17);
          }
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
          v23 = (void *)(*(_QWORD *)(a1 + 32) + 24);
          v24 = objc_retainAutorelease(v8);
          memcpy(v23, (const void *)objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"));
          objc_msgSend(*(id *)(a1 + 32), "_invokeBlock:passingTest:", &__block_literal_global_60, &__block_literal_global_61);
          goto LABEL_19;
        }
      }
      v5 = v25;
      if (gLogCategory_CUSystemMonitor <= 10)
      {
        if (gLogCategory_CUSystemMonitor != -1
          || (v22 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu), v5 = v25, v22))
        {
          v12 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]_block_invoke", 0xAu, (uint64_t)"Bluetooth address unchanged: %.6a\n", v13, v14, v15, v16, v12);
LABEL_19:
          v5 = v25;
        }
      }
    }
  }

}

BOOL __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "bluetoothAddressChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (!a2[24])
  {
    objc_msgSend(a2, "bluetoothAddressChangedHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_27(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "wifiStateChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_26(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "firstUnlockHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_25(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "systemUIChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

CFStringRef __29__CUSystemMonitorImp__update__block_invoke_24()
{
  return (id)SCDynamicStoreKeyCreateComputerName(0);
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "systemNameChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_22(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "systemLockStateChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_21(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "screenStateChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_20(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "screenSaverChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_19(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "screenOnChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "screenLockedChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_17(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "rotatingIdentifierChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "regionChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "primaryAppleIDChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "powerUnlimitedChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "primaryNetworkChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "primaryIPChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "netFlagsChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

CFStringRef __29__CUSystemMonitorImp__update__block_invoke_10()
{
  return (id)SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B80]);
}

CFStringRef __29__CUSystemMonitorImp__update__block_invoke_9()
{
  return (id)SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B78]);
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "netInterfacesChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "motionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "meDeviceChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "manateeChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "locationVisitsChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "familyUpdatedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "callChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "bluetoothAddressChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_update");
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke_2;
    block[3] = &unk_1E25DF300;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__CUSystemMonitorImp_removeMonitor___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void __44__CUSystemMonitorImp_addMonitor_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_update");
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__CUSystemMonitorImp_addMonitor_completion___block_invoke_2;
    block[3] = &unk_1E25DF300;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __44__CUSystemMonitorImp_addMonitor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
