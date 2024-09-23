@implementation NRLaunchEventMonitor

- (NRLaunchEventMonitor)init
{
  NRLaunchEventMonitor *v2;
  NRLaunchEventMonitor *v3;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NRLaunchEventMonitor;
  v2 = -[NRLaunchEventMonitor init](&v16, sel_init);
  if (!v2)
  {
    v5 = nrCopyLogObj_25();
    v6 = v5;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (!v7)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v14 = _os_log_pack_fill();
        *(_DWORD *)v14 = 136446210;
        *(_QWORD *)(v14 + 4) = "-[NRLaunchEventMonitor init]";
        v15 = nrCopyLogObj_25();
        _NRLogAbortWithPack(v15);
      }
    }
    v8 = nrCopyLogObj_25();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v9, v10, v11, v12, v13, (uint64_t)");

    goto LABEL_10;
  }
  v3 = v2;
  if (NRLaunchEventMonitorCopyQueue_onceToken != -1)
    dispatch_once(&NRLaunchEventMonitorCopyQueue_onceToken, &__block_literal_global_56);
  objc_storeStrong((id *)&v3->_queue, (id)NRLaunchEventMonitorCopyQueue_queue);
  return v3;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__NRLaunchEventMonitor_start__block_invoke;
  block[3] = &unk_1EA3F72A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__NRLaunchEventMonitor_cancel__block_invoke;
  block[3] = &unk_1EA3F72A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scdKeyIR, 0);
  objc_storeStrong((id *)&self->_coreWiFiHandle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __30__NRLaunchEventMonitor_cancel__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (*(_BYTE *)(v8 + 9))
      return;
    *(_BYTE *)(v8 + 9) = 1;
  }
  if (nrCopyLogObj_onceToken_13 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_14, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_14, 0, (uint64_t)"%s%.30s:%-4d cancelled launch event monitor", a4, a5, a6, a7, a8, (uint64_t)");
}

void __29__NRLaunchEventMonitor_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  CFStringRef NetworkInterfaceEntity;
  void *v30;
  id v31;
  const __CFArray *v32;
  const __SCDynamicStore *v33;
  NSObject *v34;
  NSObject *v35;
  const __CFArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD block[5];
  const __CFArray *v51;
  SCDynamicStoreContext context;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD handler[4];
  id v57;
  id location;
  int out_token;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 && !*(_BYTE *)(v8 + 8))
  {
    if (nrSupportsPHSProxyClient_onceToken != -1)
      dispatch_once(&nrSupportsPHSProxyClient_onceToken, &__block_literal_global_375);
    if (nrSupportsPHSProxyClient_supported)
    {
      out_token = -1;
      objc_initWeak(&location, (id)v8);
      v10 = *(id *)(v8 + 24);
      v11 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __34__NRLaunchEventMonitor_startInner__block_invoke;
      handler[3] = &unk_1EA3F6C60;
      objc_copyWeak(&v57, &location);
      v12 = notify_register_dispatch("com.apple.networkrelay.launch", &out_token, v10, handler);

      if ((_DWORD)v12)
      {
        if (nrCopyLogObj_onceToken_13 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
        v13 = (id)nrCopyLogObj_sNRLogObj_14;
        v14 = v13;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v22 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);

          if (!v22)
          {
            objc_destroyWeak(&v57);
            objc_destroyWeak(&location);
            return;
          }
        }
        if (nrCopyLogObj_onceToken_13 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
        v19 = (id)nrCopyLogObj_sNRLogObj_14;
        _NRLogWithArgs((uint64_t)v19, 17, (uint64_t)"notify_register_dispatch(%u) failed", v23, v24, v25, v26, v27, v12);
        goto LABEL_37;
      }
      *(_DWORD *)(v8 + 12) = out_token;
      v15 = objc_alloc_init(MEMORY[0x1E0D1BA50]);
      v16 = *(void **)(v8 + 32);
      *(_QWORD *)(v8 + 32) = v15;

      v17 = *(id *)(v8 + 32);
      objc_msgSend(v17, "activate");

      v18 = *(id *)(v8 + 32);
      v55 = 0;
      objc_msgSend(v18, "startMonitoringEventType:error:", 30, &v55);
      v19 = v55;

      if (v19)
      {
        if (nrCopyLogObj_onceToken_13 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
        v20 = (id)nrCopyLogObj_sNRLogObj_14;
        v21 = v20;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v43 = os_log_type_enabled(v20, OS_LOG_TYPE_FAULT);

          if (!v43)
          {
LABEL_37:

            objc_destroyWeak(&v57);
            objc_destroyWeak(&location);
            return;
          }
        }
        if (nrCopyLogObj_onceToken_13 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
        v44 = (id)nrCopyLogObj_sNRLogObj_14;
        _NRLogWithArgs((uint64_t)v44, 17, (uint64_t)"startMonitoringEventType(%@) failed", v45, v46, v47, v48, v49, (uint64_t)v19);

        goto LABEL_37;
      }
      v53[0] = v11;
      v53[1] = 3221225472;
      v53[2] = __34__NRLaunchEventMonitor_startInner__block_invoke_2;
      v53[3] = &unk_1EA3F6C88;
      objc_copyWeak(&v54, &location);
      v28 = *(id *)(v8 + 32);
      objc_msgSend(v28, "setEventHandler:", v53);

      context.version = 0;
      memset(&context.retain, 0, 24);
      context.info = (void *)v8;
      *(_QWORD *)(v8 + 48) = SCDynamicStoreCreate(0, CFSTR("NRLaunchEventMonitor"), (SCDynamicStoreCallBack)scDynamicStoreCallout, &context);
      NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], CFSTR("ir0"), (CFStringRef)*MEMORY[0x1E0CE8B90]);
      v30 = *(void **)(v8 + 56);
      *(_QWORD *)(v8 + 56) = NetworkInterfaceEntity;

      v31 = *(id *)(v8 + 56);
      v60[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
      v32 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

      SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(v8 + 48), v32, 0);
      v33 = *(const __SCDynamicStore **)(v8 + 48);
      v34 = *(id *)(v8 + 24);
      SCDynamicStoreSetDispatchQueue(v33, v34);

      v35 = *(NSObject **)(v8 + 24);
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __34__NRLaunchEventMonitor_startInner__block_invoke_3;
      block[3] = &unk_1EA3F7368;
      block[4] = v8;
      v51 = v32;
      v36 = v32;
      dispatch_async(v35, block);

      objc_destroyWeak(&v54);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&location);
      v42 = *(_QWORD *)(a1 + 32);
      if (v42)
        *(_BYTE *)(v42 + 8) = 1;
      if (nrCopyLogObj_onceToken_13 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_14, OS_LOG_TYPE_DEFAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_14, 0, (uint64_t)"%s%.30s:%-4d started launch event monitor", v37, v38, v39, v40, v41, (uint64_t)");
    }
    else
    {
      if (nrCopyLogObj_onceToken_13 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_14, OS_LOG_TYPE_DEFAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_14, 0, (uint64_t)"%s%.30s:%-4d PHS proxy client not supported", a4, a5, a6, a7, a8, (uint64_t)");
    }
  }
}

void __34__NRLaunchEventMonitor_startInner__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((_BYTE *)WeakRetained + 9) && *((_DWORD *)WeakRetained + 3) == a2)
  {
    v4 = WeakRetained;
    -[NRLaunchEventMonitor triggerLaunchIfNeeded]((uint64_t)WeakRetained);
    WeakRetained = v4;
  }

}

void __34__NRLaunchEventMonitor_startInner__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 9))
    -[NRLaunchEventMonitor processCWFEvent:forced:]((uint64_t)WeakRetained, v5, 0);

}

void __34__NRLaunchEventMonitor_startInner__block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  -[NRLaunchEventMonitor processCWFEvent:forced:](*(_QWORD *)(a1 + 32), 0, 1);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[NRLaunchEventMonitor processSCDUpdate:](v2, *(void **)(a1 + 40));
}

- (void)processCWFEvent:(int)a3 forced:
{
  id v5;
  void *v6;
  int v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[5];
  int v11;

  v5 = a2;
  v6 = v5;
  if (a1 && (objc_msgSend(v5, "type") == 30 || a3))
  {
    v7 = *(_DWORD *)(a1 + 16) + 1;
    *(_DWORD *)(a1 + 16) = v7;
    v8 = dispatch_time(0, 2000000000);
    v9 = *(NSObject **)(a1 + 24);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__NRLaunchEventMonitor_processCWFEvent_forced___block_invoke;
    v10[3] = &unk_1EA3F6CB0;
    v10[4] = a1;
    v11 = v7;
    dispatch_after(v8, v9, v10);
  }

}

- (void)processSCDUpdate:(uint64_t)a1
{
  const __CFArray *v3;
  CFDictionaryRef v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFArray *v9;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 9))
  {
    v9 = v3;
    v4 = SCDynamicStoreCopyMultiple(*(SCDynamicStoreRef *)(a1 + 48), v3, 0);
    if (-[__CFArray containsObject:](v9, "containsObject:", *(_QWORD *)(a1 + 56)))
    {
      -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8D98]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLValue");

      }
      else
      {
        v8 = 0;
      }
      if (v8 == (*(_DWORD *)(a1 + 40) & 1))
      {

      }
      else
      {
        -[NRLaunchEventMonitor setLaunchFlags:](a1, *(_QWORD *)(a1 + 40) ^ 1);

        -[NRLaunchEventMonitor triggerLaunchIfNeeded](a1);
      }
    }

    v3 = v9;
  }

}

- (void)setLaunchFlags:(uint64_t)a1
{
  uint64_t v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;

  if (a1 && *(_QWORD *)(a1 + 40) != a2)
  {
    *(_QWORD *)(a1 + 40) = a2;
    if (nrCopyLogObj_onceToken_13 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_14, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = (objc_class *)MEMORY[0x1E0C99DE8];
      v5 = (id)nrCopyLogObj_sNRLogObj_14;
      v6 = objc_alloc_init(v4);
      v7 = v6;
      if ((v3 & 1) != 0)
        objc_msgSend(v6, "addObject:", CFSTR("PHSClientActiveWithIR"));
      if ((v3 & 2) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("PHSClientActiveWithSoftAP"));
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
        v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = &stru_1EA3F8020;
      }
      v14 = (__CFString *)v8;

      _NRLogWithArgs((uint64_t)v5, 0, (uint64_t)"%s%.30s:%-4d updated launch flags: [%@]", v9, v10, v11, v12, v13, (uint64_t)");
    }
  }
}

- (void)triggerLaunchIfNeeded
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 && *(_QWORD *)(a1 + 40))
  {
    if (nrCopyLogObj_onceToken_13 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_14, OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(_QWORD *)(a1 + 40);
      v3 = (objc_class *)MEMORY[0x1E0C99DE8];
      v4 = (id)nrCopyLogObj_sNRLogObj_14;
      v5 = objc_alloc_init(v3);
      v6 = v5;
      if ((v2 & 1) != 0)
        objc_msgSend(v5, "addObject:", CFSTR("PHSClientActiveWithIR"));
      if ((v2 & 2) != 0)
        objc_msgSend(v6, "addObject:", CFSTR("PHSClientActiveWithSoftAP"));
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = &stru_1EA3F8020;
      }

      _NRLogWithArgs((uint64_t)v4, 0, (uint64_t)"%s%.30s:%-4d issuing launch notify w/ flags: %@", v8, v9, v10, v11, v12, (uint64_t)");
    }
    if ((*(_BYTE *)(a1 + 40) & 3) != 0)
      notify_post("com.apple.networkrelay.launch.phs");
  }
}

void __47__NRLaunchEventMonitor_processCWFEvent_forced___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    if (*(_BYTE *)(v9 + 9))
      return;
    if (*(_DWORD *)(a1 + 40) == *(_DWORD *)(v9 + 16))
    {
      v10 = *(void **)(v9 + 32);
      goto LABEL_6;
    }
  }
  else if (!*(_DWORD *)(a1 + 40))
  {
    v10 = 0;
LABEL_6:
    objc_msgSend(v10, "currentKnownNetworkProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v27 = v11;
    if (v12)
    {
      v13 = *(_QWORD *)(v12 + 40);
      if (!objc_msgSend(v11, "isPersonalHotspot") || (v13 & 2) != 0)
      {
        if ((v13 & 2) != 0 && (objc_msgSend(v27, "isPersonalHotspot") & 1) == 0)
        {
          if (nrCopyLogObj_onceToken_13 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_14, OS_LOG_TYPE_DEFAULT))
          {
            v20 = nrCopyLogObj_25();
            _NRLogWithArgs((uint64_t)v20, 0, (uint64_t)"%s%.30s:%-4d Left PHS network", v21, v22, v23, v24, v25, (uint64_t)");

          }
          v26 = *(_QWORD *)(a1 + 32);
          if (v26)
            -[NRLaunchEventMonitor setLaunchFlags:](v26, *(_QWORD *)(v26 + 40) & 0xFFFFFFFFFFFFFFFDLL);
        }
        goto LABEL_26;
      }
    }
    else if (!objc_msgSend(v11, "isPersonalHotspot"))
    {
LABEL_26:

      return;
    }
    if (nrCopyLogObj_onceToken_13 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_14, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_14, 0, (uint64_t)"%s%.30s:%-4d Joined PHS network", v14, v15, v16, v17, v18, (uint64_t)");
    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
    {
      -[NRLaunchEventMonitor setLaunchFlags:](v19, *(_QWORD *)(v19 + 40) | 2);
      v19 = *(_QWORD *)(a1 + 32);
    }
    -[NRLaunchEventMonitor triggerLaunchIfNeeded](v19);
    goto LABEL_26;
  }
  if (nrCopyLogObj_onceToken_13 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_14, OS_LOG_TYPE_DEBUG))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_14, 2, (uint64_t)"%s%.30s:%-4d Ignoring stale profile changed event", a4, a5, a6, a7, a8, (uint64_t)");
}

+ (id)copySharedMonitor
{
  if (copySharedMonitor_onceToken != -1)
    dispatch_once(&copySharedMonitor_onceToken, &__block_literal_global_32);
  return (id)copySharedMonitor_monitor;
}

void __41__NRLaunchEventMonitor_copySharedMonitor__block_invoke()
{
  NRLaunchEventMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(NRLaunchEventMonitor);
  v1 = (void *)copySharedMonitor_monitor;
  copySharedMonitor_monitor = (uint64_t)v0;

}

@end
