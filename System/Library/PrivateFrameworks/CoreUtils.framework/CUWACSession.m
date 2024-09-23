@implementation CUWACSession

- (CUWACSession)init
{
  CUWACSession *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUWACSession;
  v2 = -[CUWACSession init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUWACSession;
  }
  return v2;
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
  -[CUWACSession _cleanup](self, "_cleanup");
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CUWACSession;
  -[CUWACSession dealloc](&v10, sel_dealloc);
}

- (void)_cleanup
{
  NSDictionary *originalWiFiInfo;
  EasyConfigDevice *easyConfigDevice;
  id progressHandler;
  id promptForSetupCodeHandler;

  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0;

  -[EasyConfigDevice stop](self->_easyConfigDevice, "stop");
  easyConfigDevice = self->_easyConfigDevice;
  self->_easyConfigDevice = 0;

  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

  promptForSetupCodeHandler = self->_promptForSetupCodeHandler;
  self->_promptForSetupCodeHandler = 0;

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
  v7 = qword_1EE067FC0;
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
  block[2] = __24__CUWACSession_activate__block_invoke;
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
  block[2] = __26__CUWACSession_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_progress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LogCategory *ucat;
  const char *v11;
  void (**progressHandler)(id, _QWORD, id);
  id v13;
  id v14;

  v4 = *(_QWORD *)&a3;
  v14 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_56;
      ucat = self->_ucat;
    }
    if ((int)v4 <= 99)
    {
      if ((int)v4 > 49)
      {
        if ((int)v4 <= 69)
        {
          if ((_DWORD)v4 == 50)
          {
            v11 = "JoinedSoftAP";
            goto LABEL_55;
          }
          if ((_DWORD)v4 == 60)
          {
            v11 = "PreConfigStart";
            goto LABEL_55;
          }
        }
        else
        {
          switch((_DWORD)v4)
          {
            case 'F':
              v11 = "SearchingPreConfig";
              goto LABEL_55;
            case 'P':
              v11 = "FoundPreConfig";
              goto LABEL_55;
            case 'Z':
              v11 = "Authenticating";
              goto LABEL_55;
          }
        }
      }
      else if ((int)v4 <= 19)
      {
        if (!(_DWORD)v4)
        {
          v11 = "Invalid";
          goto LABEL_55;
        }
        if ((_DWORD)v4 == 10)
        {
          v11 = "Start";
          goto LABEL_55;
        }
      }
      else
      {
        switch((_DWORD)v4)
        {
          case 0x14:
            v11 = "Final";
            goto LABEL_55;
          case 0x1E:
            v11 = "Error";
            goto LABEL_55;
          case 0x28:
            v11 = "JoiningSoftAP";
            goto LABEL_55;
        }
      }
    }
    else if ((int)v4 <= 149)
    {
      if ((int)v4 <= 119)
      {
        if ((_DWORD)v4 == 100)
        {
          v11 = "Authenticated";
          goto LABEL_55;
        }
        if ((_DWORD)v4 == 110)
        {
          v11 = "ApplyingConfig";
          goto LABEL_55;
        }
      }
      else
      {
        switch((_DWORD)v4)
        {
          case 0x78:
            v11 = "AppliedConfig";
            goto LABEL_55;
          case 0x82:
            v11 = "RestoringOriginalWiFi";
            goto LABEL_55;
          case 0x8C:
            v11 = "RestoredOriginalWiFi";
            goto LABEL_55;
        }
      }
    }
    else if ((int)v4 > 179)
    {
      switch((_DWORD)v4)
      {
        case 0xB4:
          v11 = "CheckingPostConfig";
          goto LABEL_55;
        case 0xBE:
          v11 = "CheckedPostConfig";
          goto LABEL_55;
        case 0xC8:
          v11 = "ConfigComplete";
          goto LABEL_55;
      }
    }
    else
    {
      switch((_DWORD)v4)
      {
        case 0x96:
          v11 = "SearchingPostConfig";
          goto LABEL_55;
        case 0xA0:
          v11 = "PostConfigStart";
          goto LABEL_55;
        case 0xAA:
          v11 = "FoundPostConfig";
LABEL_55:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _progress:info:]", 0x1Eu, (uint64_t)"Progress: %s %@\n", v6, v7, v8, v9, (uint64_t)v11);
          goto LABEL_56;
      }
    }
    v11 = "?";
    goto LABEL_55;
  }
LABEL_56:
  progressHandler = (void (**)(id, _QWORD, id))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, v4, v14);
  if ((_DWORD)v4 == 20)
  {
    v13 = self->_progressHandler;
    self->_progressHandler = 0;

  }
}

- (void)trySetupCode:(id)a3
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
  v7[2] = __29__CUWACSession_trySetupCode___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    && -[CUWACSession _runSaveOriginalWiFi](self, "_runSaveOriginalWiFi") == 4
    && -[CUWACSession _runJoinSoftAP](self, "_runJoinSoftAP") == 4
    && -[CUWACSession _runEasyConfigPreConfig](self, "_runEasyConfigPreConfig") == 4
    && -[CUWACSession _runRestoreOriginalWiFi](self, "_runRestoreOriginalWiFi") == 4
    && -[CUWACSession _runEasyConfigPostConfig](self, "_runEasyConfigPostConfig") == 4)
  {
    -[CUWACSession _runFinish](self, "_runFinish");
  }
}

- (int)_runSaveOriginalWiFi
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int result;
  LogCategory *ucat;
  NSDictionary *v9;
  NSDictionary *originalWiFiInfo;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  LogCategory *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  result = self->_saveOriginalWiFiState;
  if (result)
    return result;
  v28 = 0;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_6;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runSaveOriginalWiFi]", 0x1Eu, (uint64_t)"Saving off current WiFi info\n", v2, v3, v4, v5, v27);
  }
LABEL_6:
  v9 = (NSDictionary *)WiFiCopyCurrentNetworkInfoEx(1, (int *)&v28);
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = v9;

  v15 = v28;
  if (self->_originalWiFiInfo && !v28)
  {
    result = 4;
    self->_saveOriginalWiFiState = 4;
    return result;
  }
  v16 = self->_ucat;
  if (v16->var0 > 60)
    goto LABEL_13;
  if (v16->var0 == -1)
  {
    v17 = _LogCategory_Initialize((uint64_t)v16, 0x3Cu);
    v15 = v28;
    if (!v17)
      goto LABEL_13;
    v16 = self->_ucat;
  }
  LogPrintF((uint64_t)v16, (uint64_t)"-[CUWACSession _runSaveOriginalWiFi]", 0x3Cu, (uint64_t)"### Saving off current WiFi info failed: %#m\n", v11, v12, v13, v14, v15);
  LODWORD(v15) = v28;
LABEL_13:
  self->_saveOriginalWiFiState = 3;
  if (!(_DWORD)v15)
  {
    LODWORD(v15) = -6762;
    v28 = -6762;
  }
  v31 = CFSTR("eo");
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0CB2F90];
  v20 = (int)v15;
  v29 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v15, 0, 0));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = CFSTR("?");
  if (v21)
    v23 = (const __CFString *)v21;
  v30 = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v20, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWACSession _progress:info:](self, "_progress:info:", 30, v26);

  return self->_saveOriginalWiFiState;
}

- (int)_runJoinSoftAP
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t joinSoftAPState;
  LogCategory *ucat;

  joinSoftAPState = self->_joinSoftAPState;
  if ((_DWORD)joinSoftAPState != 4)
  {
    if ((_DWORD)joinSoftAPState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
            return self->_joinSoftAPState;
          ucat = self->_ucat;
          joinSoftAPState = self->_joinSoftAPState;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runJoinSoftAP]", 0x1Eu, (uint64_t)"Join SoftAP hasn't succeeded yet (%d)\n", v2, v3, v4, v5, joinSoftAPState);
      }
    }
    else
    {
      self->_joinSoftAPState = 1;
      -[CUWACSession _runJoinSoftAPStart](self, "_runJoinSoftAPStart");
    }
  }
  return self->_joinSoftAPState;
}

- (void)_runJoinSoftAPStart
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  const __CFString *Value;
  const __CFString *v9;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  LogCategory *ucat;
  uint64_t v17;
  LogCategory *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  int v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[CUWACSession _progress:info:](self, "_progress:info:", 40, 0);
  -[CUWiFiDevice rawScanResult](self->_wacDevice, "rawScanResult");
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_15;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runJoinSoftAPStart]", 0x5Au, (uint64_t)"### No scan result to join SoftAP\n", v3, v4, v5, v6, v28);
    }
LABEL_15:
    LODWORD(v17) = -6705;
    goto LABEL_16;
  }
  self->_easyConfigPreConfigMetrics.rssiOfSWAP = -[CUWiFiDevice rssi](self->_wacDevice, "rssi");
  Value = (const __CFString *)CFDictionaryGetValue(v7, CFSTR("SNR"));
  if (Value)
  {
    v30 = 0;
    LODWORD(Value) = CFGetInt64(Value, &v30);
  }
  self->_easyConfigPreConfigMetrics.snrOfSWAP = Value;
  v9 = (const __CFString *)CFDictionaryGetValue(v7, CFSTR("CHANNEL"));
  if (v9)
  {
    v30 = 0;
    LODWORD(v9) = CFGetInt64(v9, &v30);
  }
  self->_easyConfigPreConfigMetrics.channelOfSWAP = v9;
  dispatchQueue = self->_dispatchQueue;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __35__CUWACSession__runJoinSoftAPStart__block_invoke;
  v29[3] = &unk_1E25DE468;
  v29[4] = self;
  v11 = WiFiJoinNetwork_b(v7, dispatchQueue, v29);
  if ((_DWORD)v11)
  {
    v17 = v11;
    v18 = self->_ucat;
    if (v18->var0 <= 60)
    {
      if (v18->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v18, 0x3Cu))
          goto LABEL_16;
        v18 = self->_ucat;
      }
      LogPrintF((uint64_t)v18, (uint64_t)"-[CUWACSession _runJoinSoftAPStart]", 0x3Cu, (uint64_t)"### Join SoftAP start failed: %#m\n", v12, v13, v14, v15, v17);
    }
LABEL_16:
    self->_joinSoftAPState = 3;
    v33 = CFSTR("eo");
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2F90];
    v21 = (int)v17;
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = CFSTR("?");
    if (v22)
      v24 = (const __CFString *)v22;
    v32 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUWACSession _progress:info:](self, "_progress:info:", 30, v27);

  }
}

- (void)_runJoinSoftAPFinished:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  LogCategory *ucat;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  self->_easyConfigPreConfigMetrics.wifiJoinSWAPError = a3;
  if (!a3)
  {
    self->_easyConfigPreConfigMetrics.secondsToGetLinkUpOnSWAP = CFAbsoluteTimeGetCurrent() - self->_joinSoftAPStartTime;
    -[CUWACSession _progress:info:](self, "_progress:info:", 50, 0);
    self->_joinSoftAPState = 4;
    -[CUWACSession _run](self, "_run");
    return;
  }
  v8 = *(_QWORD *)&a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
        goto LABEL_7;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runJoinSoftAPFinished:]", 0x3Cu, (uint64_t)"### Join SoftAP start failed: %#m\n", v3, v4, v5, v6, v8);
  }
LABEL_7:
  self->_joinSoftAPState = 3;
  v21 = CFSTR("eo");
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2F90];
  v12 = (int)v8;
  v19 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v8, 0, 0));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("?");
  if (v13)
    v15 = (const __CFString *)v13;
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWACSession _progress:info:](self, "_progress:info:", 30, v18);

}

- (int)_runEasyConfigPreConfig
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t easyConfigPreConfigState;
  LogCategory *ucat;

  easyConfigPreConfigState = self->_easyConfigPreConfigState;
  if ((_DWORD)easyConfigPreConfigState != 4)
  {
    if ((_DWORD)easyConfigPreConfigState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
            return self->_easyConfigPreConfigState;
          ucat = self->_ucat;
          easyConfigPreConfigState = self->_easyConfigPreConfigState;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runEasyConfigPreConfig]", 0x1Eu, (uint64_t)"EasyConfig PreConfig hasn't succeeded yet (%d)\n", v2, v3, v4, v5, easyConfigPreConfigState);
      }
    }
    else
    {
      self->_easyConfigPreConfigState = 1;
      -[CUWACSession _runEasyConfigPreConfigStart](self, "_runEasyConfigPreConfigStart");
    }
  }
  return self->_easyConfigPreConfigState;
}

- (void)_runEasyConfigPreConfigStart
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  LogCategory *ucat;
  CFTypeID TypeID;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  LogCategory *v27;
  EasyConfigDevice *v28;
  EasyConfigDevice *easyConfigDevice;
  uint64_t v30;
  EasyConfigDevice *v31;
  LogCategory *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  -[CUWACSession _progress:info:](self, "_progress:info:", 60, 0);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CUWiFiDevice deviceIEDeviceID](self->_wacDevice, "deviceIEDeviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    getEasyConfigKey_DeviceID[0]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

    v10 = -[CUWiFiDevice deviceIEFlags](self->_wacDevice, "deviceIEFlags");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (v10 >> 31) | (((v10 >> 14) & 1) << 17) & 0xFFEBFFFF | (((v10 >> 13) & 1) << 18) & 0xFFEFFFFF | (v10 >> 27) & 4 | (((v10 >> 11) & 1) << 20));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getEasyConfigKey_Flags[0]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

    v13 = self->_originalWiFiInfo;
    if (v13)
    {
      v14 = v13;
      v15 = (id)-[NSDictionary mutableCopy](self->_configuration, "mutableCopy");
      if (!v15)
        v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("password"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("wifiPSK"));
        goto LABEL_11;
      }
      ucat = self->_ucat;
      if (ucat->var0 <= 50)
      {
        if (ucat->var0 != -1)
        {
LABEL_9:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runEasyConfigPreConfigStart]", 0x32u, (uint64_t)"### No WiFI password to configure\n", v17, v18, v19, v20, v40);
          goto LABEL_11;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
        {
          ucat = self->_ucat;
          goto LABEL_9;
        }
      }
LABEL_11:
      TypeID = CFStringGetTypeID();
      CFDictionaryGetTypedValue((const __CFDictionary *)v14, CFSTR("ssid"), TypeID, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("wifiSSID"));
      }
      else
      {
        v27 = self->_ucat;
        if (v27->var0 <= 50)
        {
          if (v27->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v27, 0x32u))
              goto LABEL_17;
            v27 = self->_ucat;
          }
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUWACSession _runEasyConfigPreConfigStart]", 0x32u, (uint64_t)"### No WiFI SSID to configure\n", v23, v24, v25, v26, v40);
        }
      }
LABEL_17:
      -[EasyConfigDevice stop](self->_easyConfigDevice, "stop");
      objc_msgSend((Class)getEasyConfigDeviceClass[0](), "deviceWithInfo:", v3);
      v28 = (EasyConfigDevice *)objc_claimAutoreleasedReturnValue();
      easyConfigDevice = self->_easyConfigDevice;
      self->_easyConfigDevice = v28;

      -[EasyConfigDevice setConfiguration:](self->_easyConfigDevice, "setConfiguration:", v15);
      -[EasyConfigDevice setDispatchQueue:](self->_easyConfigDevice, "setDispatchQueue:", self->_dispatchQueue);
      -[EasyConfigDevice setPausesAfterApply:](self->_easyConfigDevice, "setPausesAfterApply:", 1);
      -[EasyConfigDevice setPreConfigMetrics:](self->_easyConfigDevice, "setPreConfigMetrics:", &self->_easyConfigPreConfigMetrics);
      v30 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke;
      v42[3] = &unk_1E25DE490;
      v42[4] = self;
      -[EasyConfigDevice setProgressHandler:](self->_easyConfigDevice, "setProgressHandler:", v42);
      if (self->_promptForSetupCodeHandler)
      {
        v31 = self->_easyConfigDevice;
        v41[0] = v30;
        v41[1] = 3221225472;
        v41[2] = __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke_2;
        v41[3] = &unk_1E25DE4B8;
        v41[4] = self;
        -[EasyConfigDevice setPromptForSetupCodeHandler:](v31, "setPromptForSetupCodeHandler:", v41);
      }
      -[EasyConfigDevice start](self->_easyConfigDevice, "start");
      goto LABEL_20;
    }
    v32 = self->_ucat;
    if (v32->var0 <= 90)
    {
      if (v32->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v32, 0x5Au))
          goto LABEL_31;
        v32 = self->_ucat;
      }
      v33 = "### No current WiFi info to start EasyConfig\n";
LABEL_27:
      LogPrintF((uint64_t)v32, (uint64_t)"-[CUWACSession _runEasyConfigPreConfigStart]", 0x5Au, (uint64_t)v33, v4, v5, v6, v7, v40);
    }
  }
  else
  {
    v32 = self->_ucat;
    if (v32->var0 <= 90)
    {
      if (v32->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v32, 0x5Au))
          goto LABEL_31;
        v32 = self->_ucat;
      }
      v33 = "### No deviceID start EasyConfig\n";
      goto LABEL_27;
    }
  }
LABEL_31:
  self->_easyConfigPreConfigState = 3;
  v45 = CFSTR("eo");
  v34 = (void *)MEMORY[0x1E0CB35C8];
  v35 = *MEMORY[0x1E0CB2F90];
  v43 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, -6705, 0, 0));
  v36 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v36;
  v37 = CFSTR("?");
  if (v36)
    v37 = (const __CFString *)v36;
  v44 = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, -6705, v15);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWACSession _progress:info:](self, "_progress:info:", 30, v39);

LABEL_20:
}

- (void)_runEasyConfigProgress:(int)a3 info:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  CUWACSession *v11;
  uint64_t v12;
  id v13;
  CFTypeID TypeID;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  LogCategory *ucat;
  LogCategory *v21;
  void *v22;
  void **v23;
  const __CFString **v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v4 = *(_QWORD *)&a3;
  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = (const __CFDictionary *)a4;
  if ((int)v4 <= 39)
  {
    if ((int)v4 > 19)
    {
      if ((_DWORD)v4 == 20)
      {
        v11 = self;
        v12 = 90;
        goto LABEL_25;
      }
      if ((_DWORD)v4 == 30)
      {
        -[CUWACSession _progress:info:](self, "_progress:info:", 100, v10);
        v11 = self;
        v12 = 110;
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    if ((_DWORD)v4 != 2)
    {
      if ((_DWORD)v4 == 10)
      {
        v11 = self;
        v12 = 70;
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    v13 = (id)getEasyConfigKey_ReasonError[0]();
    TypeID = CFErrorGetTypeID();
    CFDictionaryGetTypedValue(v10, v13, TypeID, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_21:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runEasyConfigProgress:info:]", 0x1Eu, (uint64_t)"EasyConfig final: %{error}\n", v15, v16, v17, v18, (uint64_t)v19);
        goto LABEL_31;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_21;
      }
    }
LABEL_31:
    if (self->_easyConfigPreConfigState == 1)
    {
      if (v19)
      {
        self->_easyConfigPreConfigState = 3;
        v28 = CFSTR("eo");
        v29[0] = v19;
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = (void **)v29;
        v24 = &v28;
LABEL_37:
        objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUWACSession _progress:info:](self, "_progress:info:", 30, v25);

      }
    }
    else if (self->_easyConfigPostConfigState == 1)
    {
      if (!v19)
      {
        self->_easyConfigPostConfigState = 4;
        -[CUWACSession _run](self, "_run");
        goto LABEL_38;
      }
      self->_easyConfigPostConfigState = 3;
      v26 = CFSTR("eo");
      v27 = v19;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v27;
      v24 = &v26;
      goto LABEL_37;
    }
LABEL_38:

    goto LABEL_26;
  }
  if ((int)v4 <= 59)
  {
    if ((_DWORD)v4 == 40)
    {
      -[CUWACSession _progress:info:](self, "_progress:info:", 120, v10);
      if (self->_easyConfigPreConfigState == 1)
      {
        self->_easyConfigPreConfigState = 4;
        -[CUWACSession _run](self, "_run");
      }
      goto LABEL_26;
    }
    if ((_DWORD)v4 == 50)
    {
      v11 = self;
      v12 = 150;
      goto LABEL_25;
    }
  }
  else
  {
    switch((_DWORD)v4)
    {
      case '<':
        -[CUWACSession _progress:info:](self, "_progress:info:", 170, v10);
        v11 = self;
        v12 = 180;
        goto LABEL_25;
      case 'F':
        v11 = self;
        v12 = 190;
        goto LABEL_25;
      case 'd':
        v11 = self;
        v12 = 200;
LABEL_25:
        -[CUWACSession _progress:info:](v11, "_progress:info:", v12, v10);
        goto LABEL_26;
    }
  }
LABEL_27:
  v21 = self->_ucat;
  if (v21->var0 <= 30)
  {
    if (v21->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v21, 0x1Eu))
        goto LABEL_26;
      v21 = self->_ucat;
    }
    LogPrintF((uint64_t)v21, (uint64_t)"-[CUWACSession _runEasyConfigProgress:info:]", 0x1Eu, (uint64_t)"EasyConfig unknown event %d %@\n", v6, v7, v8, v9, v4);
  }
LABEL_26:

}

- (int)_runRestoreOriginalWiFi
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t restoreOriginalWiFiState;
  LogCategory *ucat;

  restoreOriginalWiFiState = self->_restoreOriginalWiFiState;
  if ((_DWORD)restoreOriginalWiFiState != 4)
  {
    if ((_DWORD)restoreOriginalWiFiState)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
            return self->_restoreOriginalWiFiState;
          ucat = self->_ucat;
          restoreOriginalWiFiState = self->_restoreOriginalWiFiState;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runRestoreOriginalWiFi]", 0x1Eu, (uint64_t)"Restore original WiFi hasn't succeeded yet (%d)\n", v2, v3, v4, v5, restoreOriginalWiFiState);
      }
    }
    else
    {
      self->_restoreOriginalWiFiState = 1;
      -[CUWACSession _runRestoreOriginalWiFiStart](self, "_runRestoreOriginalWiFiStart");
    }
  }
  return self->_restoreOriginalWiFiState;
}

- (void)_runRestoreOriginalWiFiStart
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  const __CFString *Value;
  const __CFString *v10;
  const __CFString *v11;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  LogCategory *ucat;
  uint64_t v19;
  LogCategory *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  int v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[CUWACSession _progress:info:](self, "_progress:info:", 130, 0);
  v3 = self->_originalWiFiInfo;
  v8 = (const __CFDictionary *)v3;
  if (!v3)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_17;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runRestoreOriginalWiFiStart]", 0x5Au, (uint64_t)"### No original WiFi info to restore\n", v4, v5, v6, v7, v30);
    }
LABEL_17:
    LODWORD(v19) = -6705;
    goto LABEL_18;
  }
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v3, CFSTR("RSSI"));
  if (Value)
  {
    v32 = 0;
    LODWORD(Value) = CFGetInt64(Value, &v32);
  }
  self->_easyConfigPostConfigMetrics.rssiOfDestinationAP = (int)Value;
  v10 = (const __CFString *)CFDictionaryGetValue(v8, CFSTR("SNR"));
  if (v10)
  {
    v32 = 0;
    LODWORD(v10) = CFGetInt64(v10, &v32);
  }
  self->_easyConfigPostConfigMetrics.snrOfDestinationAP = v10;
  v11 = (const __CFString *)CFDictionaryGetValue(v8, CFSTR("CHANNEL"));
  if (v11)
  {
    v32 = 0;
    LODWORD(v11) = CFGetInt64(v11, &v32);
  }
  self->_easyConfigPostConfigMetrics.channelOfDestinationAP = v11;
  self->_restoreStartTime = CFAbsoluteTimeGetCurrent();
  dispatchQueue = self->_dispatchQueue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __44__CUWACSession__runRestoreOriginalWiFiStart__block_invoke;
  v31[3] = &unk_1E25DE468;
  v31[4] = self;
  v13 = WiFiRestoreNetwork(v8, dispatchQueue, v31);
  if ((_DWORD)v13)
  {
    v19 = v13;
    v20 = self->_ucat;
    if (v20->var0 <= 60)
    {
      if (v20->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v20, 0x3Cu))
          goto LABEL_18;
        v20 = self->_ucat;
      }
      LogPrintF((uint64_t)v20, (uint64_t)"-[CUWACSession _runRestoreOriginalWiFiStart]", 0x3Cu, (uint64_t)"### Restore original WiFi start failed: %#m\n", v14, v15, v16, v17, v19);
    }
LABEL_18:
    self->_restoreOriginalWiFiState = 3;
    v35 = CFSTR("eo");
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2F90];
    v23 = (int)v19;
    v33 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v19, 0, 0));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = CFSTR("?");
    if (v24)
      v26 = (const __CFString *)v24;
    v34 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUWACSession _progress:info:](self, "_progress:info:", 30, v29);

  }
}

- (void)_runRestoreOriginalWiFiFinished:(int)a3
{
  uint64_t v3;
  NSDictionary *originalWiFiInfo;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LogCategory *ucat;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v3 = *(_QWORD *)&a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0;

  self->_easyConfigPostConfigMetrics.wifiJoinDestinationAPError = v3;
  if (!(_DWORD)v3)
  {
    self->_easyConfigPostConfigMetrics.secondsToGetLinkUpOnDestination = CFAbsoluteTimeGetCurrent()
                                                                       - self->_restoreStartTime;
    -[CUWACSession _progress:info:](self, "_progress:info:", 140, 0);
    self->_restoreOriginalWiFiState = 4;
    -[CUWACSession _run](self, "_run");
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
        goto LABEL_7;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runRestoreOriginalWiFiFinished:]", 0x3Cu, (uint64_t)"### Restore original WiFi failed: %#m\n", v6, v7, v8, v9, v3);
  }
LABEL_7:
  self->_restoreOriginalWiFiState = 3;
  v22 = CFSTR("eo");
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2F90];
  v13 = (int)v3;
  v20 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v3, 0, 0));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("?");
  if (v14)
    v16 = (const __CFString *)v14;
  v21 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWACSession _progress:info:](self, "_progress:info:", 30, v19);

}

- (int)_runEasyConfigPostConfig
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t easyConfigPostConfigState;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  EasyConfigDevice *easyConfigDevice;
  LogCategory *v13;
  LogCategory *ucat;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const char **v20;
  const char *v21;
  int v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  easyConfigPostConfigState = self->_easyConfigPostConfigState;
  if ((_DWORD)easyConfigPostConfigState == 4)
    return self->_easyConfigPostConfigState;
  if (!(_DWORD)easyConfigPostConfigState)
  {
    self->_easyConfigPostConfigState = 1;
    -[CUWACSession _progress:info:](self, "_progress:info:", 160, 0);
    easyConfigDevice = self->_easyConfigDevice;
    if (easyConfigDevice)
    {
      -[EasyConfigDevice setPostConfigMetrics:](easyConfigDevice, "setPostConfigMetrics:", &self->_easyConfigPostConfigMetrics);
      -[EasyConfigDevice resumePostConfig](self->_easyConfigDevice, "resumePostConfig");
      return self->_easyConfigPostConfigState;
    }
    ucat = self->_ucat;
    if (ucat->var0 > 90)
      goto LABEL_14;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
      {
LABEL_14:
        self->_easyConfigPostConfigState = 3;
        v33 = CFSTR("eo");
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0CB2F90];
        v31 = *MEMORY[0x1E0CB2D50];
        v17 = (void *)MEMORY[0x1E0CB3940];
        if (MEMORY[0x1E0D1B9C8] && (v18 = CUErrorCodesTableGet(), (v19 = *(const char **)(v18 + 8)) != 0))
        {
          if (*(_DWORD *)v18 != -6762)
          {
            v20 = (const char **)(v18 + 24);
            v19 = "";
            while (1)
            {
              v21 = *v20;
              if (!*v20)
                break;
              v22 = *((_DWORD *)v20 - 2);
              v20 += 2;
              if (v22 == -6762)
              {
                v19 = v21;
                break;
              }
            }
          }
        }
        else
        {
          v19 = "";
        }
        objc_msgSend(v17, "stringWithUTF8String:", v19);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = CFSTR("?");
        if (v23)
          v25 = (const __CFString *)v23;
        v32 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, -6762, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUWACSession _progress:info:](self, "_progress:info:", 30, v28);

        return self->_easyConfigPostConfigState;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runEasyConfigPostConfig]", 0x5Au, (uint64_t)"### No EasyConfigDevice to resume?\n", v8, v9, v10, v11, v30);
    goto LABEL_14;
  }
  v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x1Eu))
        return self->_easyConfigPostConfigState;
      v13 = self->_ucat;
      easyConfigPostConfigState = self->_easyConfigPostConfigState;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUWACSession _runEasyConfigPostConfig]", 0x1Eu, (uint64_t)"EasyConfig PostConfig hasn't succeeded yet (%d)\n", v2, v3, v4, v5, easyConfigPostConfigState);
  }
  return self->_easyConfigPostConfigState;
}

- (int)_runFinish
{
  NSDictionary *originalWiFiInfo;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v5;
  uint64_t v6;
  CUWACSession *v7;
  _QWORD v9[5];

  if (!self->_finishState)
  {
    originalWiFiInfo = self->_originalWiFiInfo;
    if (!originalWiFiInfo)
    {
      v7 = self;
      v6 = 0;
      goto LABEL_6;
    }
    self->_easyConfigPostConfigState = 1;
    dispatchQueue = self->_dispatchQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __26__CUWACSession__runFinish__block_invoke;
    v9[3] = &unk_1E25DE468;
    v9[4] = self;
    v5 = WiFiRestoreNetwork((const __CFDictionary *)originalWiFiInfo, dispatchQueue, v9);
    if ((_DWORD)v5)
    {
      v6 = v5;
      v7 = self;
LABEL_6:
      -[CUWACSession _runFinishRestored:](v7, "_runFinishRestored:", v6);
    }
  }
  return self->_finishState;
}

- (void)_runFinishRestored:(int)a3
{
  uint64_t v3;
  NSDictionary *originalWiFiInfo;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LogCategory *ucat;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v3 = *(_QWORD *)&a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  originalWiFiInfo = self->_originalWiFiInfo;
  self->_originalWiFiInfo = 0;

  if (!(_DWORD)v3)
  {
    -[CUWACSession _progress:info:](self, "_progress:info:", 20, 0);
    self->_finishState = 4;
    -[CUWACSession _run](self, "_run");
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
        goto LABEL_7;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWACSession _runFinishRestored:]", 0x3Cu, (uint64_t)"### Finish restore original WiFi failed: %#m\n", v6, v7, v8, v9, v3);
  }
LABEL_7:
  self->_finishState = 3;
  v22 = CFSTR("eo");
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2F90];
  v13 = (int)v3;
  v20 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v3, 0, 0));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("?");
  if (v14)
    v16 = (const __CFString *)v14;
  v21 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWACSession _progress:info:](self, "_progress:info:", 30, v19);

}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
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

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)promptForSetupCodeHandler
{
  return self->_promptForSetupCodeHandler;
}

- (void)setPromptForSetupCodeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (CUWiFiDevice)wacDevice
{
  return self->_wacDevice;
}

- (void)setWacDevice:(id)a3
{
  objc_storeStrong((id *)&self->_wacDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wacDevice, 0);
  objc_storeStrong(&self->_promptForSetupCodeHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_easyConfigDevice, 0);
  objc_storeStrong((id *)&self->_originalWiFiInfo, 0);
}

uint64_t __26__CUWACSession__runFinish__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runFinishRestored:", a2);
}

uint64_t __44__CUWACSession__runRestoreOriginalWiFiStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runRestoreOriginalWiFiFinished:", a2);
}

uint64_t __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runEasyConfigProgress:info:", a2, a3);
}

uint64_t __44__CUWACSession__runEasyConfigPreConfigStart__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) + 16))();
  return 0;
}

uint64_t __35__CUWACSession__runJoinSoftAPStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runJoinSoftAPFinished:", a2);
}

uint64_t __29__CUWACSession_trySetupCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "trySetupCode:", *(_QWORD *)(a1 + 40));
}

uint64_t __26__CUWACSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
    v11 = (int *)v10[2];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        v10 = *(_QWORD **)(v9 + 32);
        if (!v12)
          goto LABEL_6;
        v11 = (int *)v10[2];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUWACSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v13);
      v10 = *(_QWORD **)(v9 + 32);
    }
LABEL_6:
    objc_msgSend(v10, "_runFinish");
    return objc_msgSend(*(id *)(v9 + 32), "_cleanup");
  }
  return result;
}

uint64_t __24__CUWACSession_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v13;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 16);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_5;
      v10 = *(int **)(v9 + 16);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUWACSession activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  *(_BYTE *)(v9 + 8) = 1;
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 72) = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "_progress:info:", 10, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

@end
