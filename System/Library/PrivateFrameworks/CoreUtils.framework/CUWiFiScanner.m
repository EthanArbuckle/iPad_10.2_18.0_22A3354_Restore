@implementation CUWiFiScanner

- (CUWiFiScanner)init
{
  CUWiFiScanner *v2;
  CUWiFiScanner *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUWiFiScanner;
  v2 = -[CUWiFiScanner init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_changeFlags = 5;
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_scanFlags = 3;
    v3->_ucat = (LogCategory *)&gLogCategory_CUWiFiScanner;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  objc_super v10;

  if (self->_activateCalled && !self->_invalidateCalled)
    FatalErrorF((uint64_t)"Dealloc without invalidate", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v10.receiver);
  -[CUWiFiScanner _cleanup](self, "_cleanup");
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CUWiFiScanner;
  -[CUWiFiScanner dealloc](&v10, sel_dealloc);
}

- (void)_cleanup
{
  NSMutableDictionary *devices;
  OS_dispatch_source *scanTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  id errorHandler;
  id invalidationHandler;

  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0;

  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    v5 = scanTimer;
    dispatch_source_cancel(v5);
    v6 = self->_scanTimer;
    self->_scanTimer = 0;

  }
  deviceFoundHandler = self->_deviceFoundHandler;
  self->_deviceFoundHandler = 0;

  deviceLostHandler = self->_deviceLostHandler;
  self->_deviceLostHandler = 0;

  deviceChangedHandler = self->_deviceChangedHandler;
  self->_deviceChangedHandler = 0;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

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
  v7 = qword_1EE068030;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CUWiFiScanner_activate__block_invoke;
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
  block[2] = __27__CUWiFiScanner_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  uint64_t v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!*(_WORD *)&self->_invalidateDone)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    -[CUWiFiScanner _cleanup](self, "_cleanup");
    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_6:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiScanner _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v4, v5, v6, v7, v9);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_6;
      }
    }
  }
}

- (void)suspend
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__CUWiFiScanner_suspend__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)resume
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__CUWiFiScanner_resume__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_scanWiFiStart
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int scanFlags;
  NSString *ssid;
  LogCategory *ucat;
  OS_dispatch_queue *dispatchQueue;
  int v13;
  void (**errorHandler)(id, void *);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23[5];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v3;
  scanFlags = self->_scanFlags;
  if ((scanFlags & 1) == 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("channel_2pt4GHz"));
    scanFlags = self->_scanFlags;
  }
  if ((scanFlags & 2) == 0)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("channel_5GHz"));
  ssid = self->_ssid;
  if (ssid)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", ssid, CFSTR("ssid"));
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_11;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiScanner _scanWiFiStart]", 0x1Eu, (uint64_t)"WiFi scan start\n", v4, v5, v6, v7, v23[0]);
  }
LABEL_11:
  self->_scanning = 1;
  dispatchQueue = self->_dispatchQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = (uint64_t)__31__CUWiFiScanner__scanWiFiStart__block_invoke;
  v23[3] = (uint64_t)&unk_1E25DE598;
  v23[4] = (uint64_t)self;
  v13 = WiFiScan_b((const __CFDictionary *)v8, dispatchQueue, v23);
  if (v13)
  {
    errorHandler = (void (**)(id, void *))self->_errorHandler;
    if (errorHandler)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2F90];
      v17 = v13;
      v24 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v13, 0, 0));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = CFSTR("?");
      if (v18)
        v20 = (const __CFString *)v18;
      v25[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      errorHandler[2](errorHandler, v22);

    }
  }

}

- (void)_scanWiFiFinished:(id)a3 status:(int)a4
{
  id v6;
  LogCategory *ucat;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**errorHandler)(id, void *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  LogCategory *v38;
  void (**deviceLostHandler)(id, void *);
  uint64_t v40;
  OS_dispatch_source *scanTimer;
  NSObject *v42;
  OS_dispatch_source *v43;
  OS_dispatch_source *v44;
  OS_dispatch_source *v45;
  NSObject *v46;
  NSObject *v47;
  dispatch_time_t v48;
  _QWORD handler[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;
  _QWORD v61[4];

  v61[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      v8 = objc_msgSend(v6, "count");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiScanner _scanWiFiFinished:status:]", 0x1Eu, (uint64_t)"WiFi scan finish: %ld results, status %#m\n", v9, v10, v11, v12, v8);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (self->_invalidateCalled)
  {
    -[CUWiFiScanner _invalidated](self, "_invalidated");
    goto LABEL_39;
  }
  if (self->_suspended)
    goto LABEL_39;
  if (a4)
  {
    errorHandler = (void (**)(id, void *))self->_errorHandler;
    if (errorHandler)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2F90];
      v16 = a4;
      v60 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, a4, 0, 0));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("?");
      if (v17)
        v19 = (const __CFString *)v17;
      v61[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      errorHandler[2](errorHandler, v21);

    }
  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_devices, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9959);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v22 = v6;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v22);
        -[CUWiFiScanner _scanWiFiProcessResult:](self, "_scanWiFiProcessResult:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v24);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[NSMutableDictionary allKeys](self->_devices, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v51;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v51 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v31);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)objc_msgSend(v33, "present") <= -2)
        {
          v38 = self->_ucat;
          if (v38->var0 <= 30)
          {
            if (v38->var0 != -1)
              goto LABEL_28;
            if (_LogCategory_Initialize((uint64_t)v38, 0x1Eu))
            {
              v38 = self->_ucat;
LABEL_28:
              LogPrintF((uint64_t)v38, (uint64_t)"-[CUWiFiScanner _scanWiFiFinished:status:]", 0x1Eu, (uint64_t)"WiFi scan lost: %@\n", v34, v35, v36, v37, (uint64_t)v33);
            }
          }
          -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v32);
          deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
          if (deviceLostHandler)
            deviceLostHandler[2](deviceLostHandler, v33);
        }

        ++v31;
      }
      while (v29 != v31);
      v40 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      v29 = v40;
    }
    while (v40);
  }

  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    v42 = scanTimer;
    dispatch_source_cancel(v42);
    v43 = self->_scanTimer;
    self->_scanTimer = 0;

  }
  v44 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v45 = self->_scanTimer;
  self->_scanTimer = v44;

  v46 = self->_scanTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__CUWiFiScanner__scanWiFiFinished_status___block_invoke_2;
  handler[3] = &unk_1E25DF2A0;
  handler[4] = self;
  dispatch_source_set_event_handler(v46, handler);
  v47 = self->_scanTimer;
  v48 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v47, v48, 0xFFFFFFFFFFFFFFFFLL, 0x4A817C80uLL);
  dispatch_resume((dispatch_object_t)self->_scanTimer);
LABEL_39:

}

- (void)_scanWiFiProcessResult:(id)a3
{
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CUWiFiDevice *v11;
  void *v12;
  CFTypeID TypeID;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  int64_t Int64Ranged;
  CFTypeID v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int changeFlags;
  LogCategory *v36;
  LogCategory *v37;
  void *v38;
  NSMutableDictionary *devices;
  NSMutableDictionary *v40;
  NSMutableDictionary *v41;
  void (**deviceFoundHandler)(id, CUWiFiDevice *);
  void (**deviceChangedHandler)(id, CUWiFiDevice *, uint64_t);
  LogCategory *ucat;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  unsigned __int8 *v48;
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFDictionary *)a3;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  CFDictionaryGetHardwareAddress(v4, CFSTR("bssid"), (char *)&v49, 6uLL, &v51);
  if (v51)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x32u))
          goto LABEL_52;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiScanner _scanWiFiProcessResult:]", 0x32u, (uint64_t)"### No BSSID for scan result\n", v5, v6, v7, v8, v45);
    }
LABEL_52:
    v38 = 0;
    v11 = 0;
    v30 = 0;
    v21 = 0;
    v26 = 0;
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v49, 6);
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (CUWiFiDevice *)v10;
  if (!v10)
    v11 = objc_alloc_init(CUWiFiDevice);
  -[CUWiFiDevice setBssid:](v11, "setBssid:", v9);
  -[CUWiFiDevice setRawScanResult:](v11, "setRawScanResult:", v4);
  if (-[CUWiFiDevice present](v11, "present") <= 0)
    -[CUWiFiDevice setPresent:](v11, "setPresent:", 1);
  LOWORD(v53) = 0;
  v52 = 0;
  *(_DWORD *)((char *)&v53 + 2) = v49;
  HIWORD(v53) = v50;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v52);
  -[CUWiFiDevice setIdentifier:](v11, "setIdentifier:", v12);

  TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v4, CFSTR("ie"), TypeID, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v9;
  if (!v14)
    goto LABEL_12;
  -[CUWiFiDevice ieData](v11, "ieData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v17 = v15;
  if (v16 == v17)
  {

    goto LABEL_12;
  }
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v16, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_14;
LABEL_12:
    v20 = 0;
    goto LABEL_15;
  }

LABEL_14:
  -[CUWiFiDevice setIeData:](v11, "setIeData:", v16);
  v20 = 1;
LABEL_15:
  -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("platformNetwork"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    -[CUWiFiDevice setPlatformObject:](v11, "setPlatformObject:", v21);
  Int64Ranged = CFDictionaryGetInt64Ranged(v4, CFSTR("rssi"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v51);
  if ((Int64Ranged & 0x80000000) != 0 && -[CUWiFiDevice rssi](v11, "rssi") != (_DWORD)Int64Ranged)
  {
    -[CUWiFiDevice setRssi:](v11, "setRssi:", Int64Ranged);
    v20 = v20 | 2;
  }
  v23 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v4, CFSTR("ssid"), v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWiFiDevice ssid](v11, "ssid");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24;
  v27 = v25;
  if (v26 == v27)
  {

    goto LABEL_27;
  }
  v28 = v27;
  if ((v26 == 0) == (v27 != 0))
  {

    goto LABEL_26;
  }
  v29 = objc_msgSend(v26, "isEqual:", v27);

  if ((v29 & 1) == 0)
  {
LABEL_26:
    -[CUWiFiDevice setSsid:](v11, "setSsid:", v26);
    v20 = v20 | 4;
  }
LABEL_27:
  v30 = objc_retainAutorelease(v14);
  v47 = 0;
  v48 = (unsigned __int8 *)objc_msgSend(v30, "bytes");
  IEGetVendorSpecific(v48, (unint64_t)&v48[objc_msgSend(v30, "length")], 10502144, &v48, &v47, 0);
  if (v47)
    v20 = -[CUWiFiDevice _updateWithDeviceIE:end:](v11, "_updateWithDeviceIE:end:", v48, &v48[v47]) | v20;
  if (v10)
  {
    changeFlags = self->_changeFlags;
    if (changeFlags != -1 && (changeFlags & v20) == 0)
    {
LABEL_46:
      v38 = v46;
      goto LABEL_47;
    }
    v36 = self->_ucat;
    if (v36->var0 <= 30)
    {
      if (v36->var0 != -1)
      {
LABEL_34:
        LogPrintF((uint64_t)v36, (uint64_t)"-[CUWiFiScanner _scanWiFiProcessResult:]", 0x1Eu, (uint64_t)"WiFi scan changed: %@, %#{flags}\n", v31, v32, v33, v34, (uint64_t)v11);
        goto LABEL_44;
      }
      if (_LogCategory_Initialize((uint64_t)v36, 0x1Eu))
      {
        v36 = self->_ucat;
        goto LABEL_34;
      }
    }
LABEL_44:
    deviceChangedHandler = (void (**)(id, CUWiFiDevice *, uint64_t))self->_deviceChangedHandler;
    if (deviceChangedHandler)
      deviceChangedHandler[2](deviceChangedHandler, v11, v20);
    goto LABEL_46;
  }
  v37 = self->_ucat;
  v38 = v46;
  if (v37->var0 <= 30)
  {
    if (v37->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x1Eu))
        goto LABEL_39;
      v37 = self->_ucat;
    }
    LogPrintF((uint64_t)v37, (uint64_t)"-[CUWiFiScanner _scanWiFiProcessResult:]", 0x1Eu, (uint64_t)"WiFi scan found: %@\n", v31, v32, v33, v34, (uint64_t)v11);
  }
LABEL_39:
  devices = self->_devices;
  if (!devices)
  {
    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v41 = self->_devices;
    self->_devices = v40;

    devices = self->_devices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v11, v46);
  deviceFoundHandler = (void (**)(id, CUWiFiDevice *))self->_deviceFoundHandler;
  if (deviceFoundHandler)
    deviceFoundHandler[2](deviceFoundHandler, v11);
LABEL_47:

}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (void)setScanFlags:(unsigned int)a3
{
  self->_scanFlags = a3;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

uint64_t __42__CUWiFiScanner__scanWiFiFinished_status___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scanWiFiStart");
}

void __42__CUWiFiScanner__scanWiFiFinished_status___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setPresent:", objc_msgSend(v3, "present") - 1);

}

uint64_t __31__CUWiFiScanner__scanWiFiStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_scanWiFiFinished:status:", a3, a2);
}

uint64_t __23__CUWiFiScanner_resume__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t result;
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
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUWiFiScanner resume]_block_invoke", 0x1Eu, (uint64_t)"Resume\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  *(_BYTE *)(v9 + 40) = 0;
  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 8) && !*(_BYTE *)(result + 26) && !*(_QWORD *)(result + 32))
    return objc_msgSend((id)result, "_scanWiFiStart");
  return result;
}

void __24__CUWiFiScanner_suspend__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUWiFiScanner suspend]_block_invoke", 0x1Eu, (uint64_t)"Suspend\n", a5, a6, a7, a8, v16);
      v9 = *(_QWORD *)(a1 + 32);
      goto LABEL_5;
    }
    v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    v9 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v10 = *(int **)(v9 + 48);
      goto LABEL_3;
    }
  }
LABEL_5:
  v12 = *(void **)(v9 + 32);
  if (v12)
  {
    v13 = v12;
    dispatch_source_cancel(v13);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 32);
    *(_QWORD *)(v14 + 32) = 0;

    v9 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v9 + 40) = 1;
}

uint64_t __27__CUWiFiScanner_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v8 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v8 + 24))
    return result;
  v9 = result;
  *(_BYTE *)(v8 + 24) = 1;
  v10 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v10 + 25))
  {
    v11 = *(int **)(v10 + 48);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize(*(_QWORD *)(v10 + 48), 0x1Eu);
        v10 = *(_QWORD *)(v9 + 32);
        if (!v12)
          goto LABEL_7;
        v11 = *(int **)(v10 + 48);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUWiFiScanner invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v17);
      v10 = *(_QWORD *)(v9 + 32);
    }
  }
LABEL_7:
  v13 = *(void **)(v10 + 32);
  if (v13)
  {
    v14 = v13;
    dispatch_source_cancel(v14);
    v15 = *(_QWORD *)(v9 + 32);
    v16 = *(void **)(v15 + 32);
    *(_QWORD *)(v15 + 32) = 0;

    v10 = *(_QWORD *)(v9 + 32);
  }
  return objc_msgSend((id)v10, "_invalidated");
}

uint64_t __25__CUWiFiScanner_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUWiFiScanner activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  *(_BYTE *)(v9 + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_scanWiFiStart");
}

@end
