@implementation CUWiFiManager

- (CUWiFiManager)init
{
  CUWiFiManager *v2;
  CUWiFiManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUWiFiManager;
  v2 = -[CUWiFiManager init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUWiFiManager;
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
  v4.super_class = (Class)CUWiFiManager;
  -[CUWiFiManager dealloc](&v4, sel_dealloc);
}

- (void)setControlFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__CUWiFiManager_setControlFlags___block_invoke;
  v3[3] = &unk_1E25DE500;
  v4 = a3;
  v3[4] = self;
  -[CUWiFiManager _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setInfraDisabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__CUWiFiManager_setInfraDisabled___block_invoke;
  v3[3] = &unk_1E25DE528;
  v4 = a3;
  v3[4] = self;
  -[CUWiFiManager _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
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
  v7 = qword_1EE065620;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)setTrafficPeers:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__CUWiFiManager_setTrafficPeers___block_invoke;
  v6[3] = &unk_1E25DE628;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CUWiFiManager _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);

}

- (void)setWakeOnWirelessEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CUWiFiManager_setWakeOnWirelessEnabled___block_invoke;
  v3[3] = &unk_1E25DE528;
  v4 = a3;
  v3[4] = self;
  -[CUWiFiManager _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)activate
{
  -[CUWiFiManager activateWithCompletion:](self, "activateWithCompletion:", 0);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  CUWiFiManager *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CUWiFiManager_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E25DE600;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)_activateSafeInvokeBlock:(id)a3
{
  void (**v4)(_QWORD);
  CUWiFiManager *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__CUWiFiManager__activateSafeInvokeBlock___block_invoke;
    v7[3] = &unk_1E25DE600;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CUWiFiManager_invalidate__block_invoke;
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
  id interruptionHandler;
  id v10;
  id trafficFlagsUnavailableUpdatedHandler;
  id wifiStateChangedHandler;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  LogCategory *v17;
  uint64_t v18;
  uint64_t v19;

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
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _invalidated]", 0x3Cu, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v18);
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
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2]();
  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  v10 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  trafficFlagsUnavailableUpdatedHandler = self->_trafficFlagsUnavailableUpdatedHandler;
  self->_trafficFlagsUnavailableUpdatedHandler = 0;

  wifiStateChangedHandler = self->_wifiStateChangedHandler;
  self->_wifiStateChangedHandler = 0;

  self->_invalidateDone = 1;
  v17 = self->_ucat;
  if (v17->var0 <= 30)
  {
    if (v17->var0 != -1)
    {
LABEL_11:
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUWiFiManager _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v13, v14, v15, v16, v19);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v17, 0x1Eu))
    {
      v17 = self->_ucat;
      goto LABEL_11;
    }
  }
}

- (void)performUpdate:(id)a3
{
  uint64_t v4;
  NSObject *dispatchQueue;
  void (**v6)(_QWORD);
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];

  v4 = MEMORY[0x1E0C809B0];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CUWiFiManager_performUpdate___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  v6 = (void (**)(_QWORD))a3;
  dispatch_async(dispatchQueue, block);
  v6[2](v6);

  v7 = self->_dispatchQueue;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __31__CUWiFiManager_performUpdate___block_invoke_2;
  v8[3] = &unk_1E25DF2A0;
  v8[4] = self;
  dispatch_async(v7, v8);
}

- (void)_update
{
  CUWiFiManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_invalidateCalled)
  {
    -[CUWiFiManager _wifiEnsureStarted](obj, "_wifiEnsureStarted");
    -[CUWiFiManager _updateInfraDisabled](obj, "_updateInfraDisabled");
    -[CUWiFiManager _updateTrafficPeers](obj, "_updateTrafficPeers");
    -[CUWiFiManager _updateWakeOnWireless](obj, "_updateWakeOnWireless");
  }
  objc_sync_exit(obj);

}

- (void)_updateInfraDisabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 infraDisabled;
  LogCategory *ucat;
  const char *v9;
  uint64_t v10;
  __WiFiNetwork *v11;
  __WiFiNetwork *wifiNetworkDisabled;
  __WiFiNetwork *v13;

  if (!self->_wifiManager || !self->_infraDisabledChanged)
    return;
  infraDisabled = self->_infraDisabled;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      if (infraDisabled)
        v9 = "no";
      else
        v9 = "yes";
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateInfraDisabled]", 0x1Eu, (uint64_t)"InfraDisabled: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v9);
      goto LABEL_10;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }
LABEL_10:
  if (infraDisabled)
  {
    WiFiManagerClientDisable();
    self->_wifiAutoJoinDisabled = 1;
    if (self->_wifiDevice)
    {
      v10 = WiFiDeviceClientCopyCurrentNetwork();
      if (v10)
      {
        v11 = (__WiFiNetwork *)v10;
        WiFiManagerClientTemporarilyDisableNetwork();
        wifiNetworkDisabled = self->_wifiNetworkDisabled;
        if (wifiNetworkDisabled)
          CFRelease(wifiNetworkDisabled);
        self->_wifiNetworkDisabled = v11;
      }
    }
  }
  else
  {
    if (self->_wifiAutoJoinDisabled)
    {
      WiFiManagerClientEnable();
      self->_wifiAutoJoinDisabled = 0;
    }
    if (self->_wifiNetworkDisabled)
    {
      WiFiManagerClientEnableNetwork();
      v13 = self->_wifiNetworkDisabled;
      if (v13)
      {
        CFRelease(v13);
        self->_wifiNetworkDisabled = 0;
      }
    }
  }
  self->_infraDisabledChanged = 0;
}

- (void)_updateTrafficPeers
{
  LogCategory *ucat;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSArray *trafficPeers;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_wifiDevice && self->_trafficPeerChanged)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_7;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_7:
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = self->_trafficPeersCurrent;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          v13 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v9);
              v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "trafficFlags");
            }
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          }
          while (v11);
        }
        else
        {
          v12 = 0;
        }

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v15 = self->_trafficPeers;
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v22 != v18)
                objc_enumerationMutation(v15);
              v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "trafficFlags");
            }
            v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v17);
        }

        if ((v12 & 0x100) != 0)
        {
          -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 256);
          if ((v12 & 0x400) == 0)
          {
LABEL_25:
            if ((v12 & 0x1000) == 0)
              goto LABEL_26;
            goto LABEL_36;
          }
        }
        else if ((v12 & 0x400) == 0)
        {
          goto LABEL_25;
        }
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 1024);
        if ((v12 & 0x1000) == 0)
        {
LABEL_26:
          if ((v12 & 0x2000) == 0)
            goto LABEL_27;
          goto LABEL_37;
        }
LABEL_36:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 4096);
        if ((v12 & 0x2000) == 0)
        {
LABEL_27:
          if ((v12 & 0x8000) == 0)
            goto LABEL_28;
          goto LABEL_38;
        }
LABEL_37:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 0x2000);
        if ((v12 & 0x8000) == 0)
        {
LABEL_28:
          if ((v12 & 0x200) == 0)
            goto LABEL_29;
          goto LABEL_39;
        }
LABEL_38:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 0x8000);
        if ((v12 & 0x200) == 0)
        {
LABEL_29:
          if ((v12 & 0x4000) == 0)
            goto LABEL_30;
          goto LABEL_40;
        }
LABEL_39:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 512);
        if ((v12 & 0x4000) == 0)
        {
LABEL_30:
          if ((v12 & 0x10000) == 0)
          {
LABEL_32:
            objc_storeStrong((id *)&self->_trafficPeersCurrent, self->_trafficPeers);
            trafficPeers = self->_trafficPeers;
            self->_trafficPeers = 0;

            self->_trafficPeerChanged = 0;
            -[CUWiFiManager _updateTrafficPeerStatusMonitor](self, "_updateTrafficPeerStatusMonitor");
            return;
          }
LABEL_31:
          -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 0x10000);
          goto LABEL_32;
        }
LABEL_40:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 0x4000);
        if ((v12 & 0x10000) == 0)
          goto LABEL_32;
        goto LABEL_31;
      }
      ucat = self->_ucat;
    }
    v4 = -[NSArray count](self->_trafficPeersCurrent, "count");
    -[NSArray count](self->_trafficPeers, "count");
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeers]", 0x1Eu, (uint64_t)"Traffic registration update: %d -> %d peers\n", v5, v6, v7, v8, v4);
    goto LABEL_7;
  }
}

- (void)_updateTrafficPeersWithService:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *v9;
  const __CFString *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  int v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSArray *v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  LogCategory *ucat;
  int var0;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSArray *v63;
  CUWiFiManager *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
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
  _QWORD v82[2];
  _QWORD v83[2];
  _BYTE v84[128];
  _QWORD v85[2];
  _QWORD v86[2];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v3 = *(_QWORD *)&a3;
  v90 = *MEMORY[0x1E0C80C00];
  v65 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((v3 & 0x100) != 0)
  {
    v10 = CFSTR("airplay");
    goto LABEL_20;
  }
  if ((v3 & 0x400) != 0)
  {
    v10 = CFSTR("D2DMigration");
    goto LABEL_20;
  }
  if ((v3 & 0x1000) != 0)
  {
    v10 = CFSTR("ensemble");
    goto LABEL_20;
  }
  if ((v3 & 0x2000) != 0)
  {
    v10 = CFSTR("MPRemoteCamera");
    goto LABEL_20;
  }
  if ((v3 & 0x8000) != 0)
  {
    v10 = CFSTR("TVRemoteCamera");
    goto LABEL_20;
  }
  if ((v3 & 0x200) != 0)
  {
    v10 = CFSTR("sidecar");
    goto LABEL_20;
  }
  if ((v3 & 0x4000) != 0)
  {
    v10 = CFSTR("RemoteCamera");
    goto LABEL_20;
  }
  if ((v3 & 0x10000) != 0)
  {
    v10 = CFSTR("RemoteScreen");
LABEL_20:
    v62 = (uint64_t)v10;
    objc_msgSend(v65, "setObject:forKeyedSubscript:");
    v11 = self->_trafficPeers;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
    v64 = self;
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v79 != v15)
            objc_enumerationMutation(v11);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "trafficFlags");
          if ((v17 & v3) != 0)
          {
            if ((v17 & 4) != 0)
              v18 = 9;
            else
              v18 = 1;
            v14 = v18 & 0xFFFFFFF9 | (2 * (v17 & 3)) | v14;
          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v19, CFSTR("TR_SESSION_FLAGS"));

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v20 = v11;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v75 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
          if ((objc_msgSend(v25, "trafficFlags") & 0x3200) != 0)
          {
            objc_msgSend(v25, "sessionID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
              objc_msgSend(v65, "setObject:forKeyedSubscript:", v26, CFSTR("TR_SIDECAR_SESSION_UUID"));

          }
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
      }
      while (v22);
    }
    v63 = v20;

    if ((_DWORD)v14)
      v27 = MEMORY[0x1E0C9AAB0];
    else
      v27 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v27, CFSTR("TR_ACTIVE"));
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v29 = v64->_trafficPeersCurrent;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
    v31 = CFSTR("TR_IFNAME");
    v32 = CFSTR("awdl0");
    if (v30)
    {
      v33 = v30;
      v34 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v71 != v34)
            objc_enumerationMutation(v29);
          v36 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
          if ((objc_msgSend(v36, "trafficFlags") & v3) != 0)
          {
            objc_msgSend(v36, "peerMACAddressData");
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v37;
            if (v37)
            {
              v85[0] = v31;
              v85[1] = CFSTR("TR_PEER_ADDRESS");
              v86[0] = v32;
              v86[1] = v37;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
              v39 = v32;
              v40 = v31;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v41);

              v31 = v40;
              v32 = v39;
            }

          }
        }
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
      }
      while (v33);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v42 = v63;
    v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v67;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v67 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * m);
          if ((objc_msgSend(v47, "trafficFlags") & v3) != 0)
          {
            objc_msgSend(v47, "peerMACAddressData");
            v48 = objc_claimAutoreleasedReturnValue();
            v49 = (void *)v48;
            if (v48)
            {
              v82[0] = v31;
              v82[1] = CFSTR("TR_PEER_ADDRESS");
              v83[0] = v32;
              v83[1] = v48;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v50);

            }
          }
        }
        v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
      }
      while (v44);
    }

    objc_msgSend(v65, "setObject:forKeyedSubscript:", v28, CFSTR("TR_PEER_CONTEXTS"));
    v55 = WiFiDeviceClientTrafficRegistration();
    ucat = v64->_ucat;
    var0 = ucat->var0;
    if (v55)
    {
      if (var0 <= 90)
      {
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v64->_ucat, 0x5Au))
            goto LABEL_80;
          ucat = v64->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeersWithService:]", 0x5Au, (uint64_t)"### Traffic register failed: '%@', %#m\n", v51, v52, v53, v54, v62);
      }
    }
    else if (var0 <= 30)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v64->_ucat, 0x1Eu))
          goto LABEL_80;
        ucat = v64->_ucat;
      }
      -[NSArray count](v42, "count");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeersWithService:]", 0x1Eu, (uint64_t)"Traffic registered: '%@', %d peers\n", v58, v59, v60, v61, v62);
    }
LABEL_80:
    v64->_lastTrafficRegistrationErrorCode = v55;
    -[CUWiFiManager _updateWiFiState](v64, "_updateWiFiState");

    goto LABEL_81;
  }
  v9 = self->_ucat;
  if (v9->var0 <= 90)
  {
    if (v9->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au))
        goto LABEL_81;
      v9 = self->_ucat;
    }
    LogPrintF((uint64_t)v9, (uint64_t)"-[CUWiFiManager _updateTrafficPeersWithService:]", 0x5Au, (uint64_t)"### Bad service flag: 0x%X\n", v5, v6, v7, v8, v3);
  }
LABEL_81:

}

- (void)_updateTrafficPeerStatusMonitor
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSSet *wifiP2PStateServices;
  NSSet *v38;
  NSSet *v39;
  NSSet *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CUWiFiManager *v49;
  LogCategory *v50;
  LogCategory *ucat;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  WiFiP2PAWDLStateMonitor *wifiP2PStateMonitor;
  WiFiP2PAWDLStateMonitor *v58;
  WiFiP2PAWDLStateMonitor *v59;
  NSSet *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  _BOOL4 v65;
  void **p_wifiP2PStateMonitor;
  void *v67;
  NSSet *v68;
  void (**trafficFlagsUnavailableUpdatedHandler)(void);
  uint64_t v70;
  _QWORD v72[4];
  id v73;
  id location;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (self->_trafficFlagsUnavailableUpdatedHandler || self->_degradeOnAnyTrafficUnavailable)
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v2 = self->_trafficPeersCurrent;
    v3 = 0;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v80 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          if (!v3)
            v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v8 = objc_msgSend(v7, "trafficFlags");
          if ((v8 & 0x100) != 0)
          {
            getAWDLTrafficRegistrationServiceAirPlay[0]();
            v9 = objc_claimAutoreleasedReturnValue();
            v10 = (void *)v9;
            if (v9)
              v11 = (const __CFString *)v9;
            else
              v11 = &stru_1E25DF9F8;
            objc_msgSend(v3, "addObject:", v11);

          }
          if ((v8 & 0x200) != 0)
          {
            getAWDLTrafficRegistrationServiceSidecar[0]();
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v12;
            if (v12)
              v14 = (const __CFString *)v12;
            else
              v14 = &stru_1E25DF9F8;
            objc_msgSend(v3, "addObject:", v14);

          }
          if ((v8 & 0x400) != 0)
          {
            getAWDLTrafficRegistrationServiceDeviceToDeviceMigration[0]();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
              v17 = (const __CFString *)v15;
            else
              v17 = &stru_1E25DF9F8;
            objc_msgSend(v3, "addObject:", v17);

          }
          if ((v8 & 0x1000) != 0)
          {
            getAWDLTrafficRegistrationServiceUniversalControl[0]();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            if (v18)
              v20 = (const __CFString *)v18;
            else
              v20 = &stru_1E25DF9F8;
            objc_msgSend(v3, "addObject:", v20);

          }
          if ((v8 & 0x2000) != 0)
          {
            getAWDLTrafficRegistrationServiceMPRemoteCamera[0]();
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v21;
            if (v21)
              v23 = (const __CFString *)v21;
            else
              v23 = &stru_1E25DF9F8;
            objc_msgSend(v3, "addObject:", v23);

          }
          if ((v8 & 0x4000) != 0)
          {
            getAWDLTrafficRegistrationServiceRemoteCamera[0]();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (void *)v24;
            if (v24)
              v26 = (const __CFString *)v24;
            else
              v26 = &stru_1E25DF9F8;
            objc_msgSend(v3, "addObject:", v26);

          }
          if ((v8 & 0x8000) != 0)
          {
            getAWDLTrafficRegistrationServiceTVRemoteCamera[0]();
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = (void *)v27;
            if (v27)
              v29 = (const __CFString *)v27;
            else
              v29 = &stru_1E25DF9F8;
            objc_msgSend(v3, "addObject:", v29);

          }
          if ((v8 & 0x10000) != 0)
          {
            getAWDLTrafficRegistrationServiceRemoteScreen[0]();
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            if (v30)
              v32 = (const __CFString *)v30;
            else
              v32 = &stru_1E25DF9F8;
            objc_msgSend(v3, "addObject:", v32);

          }
        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      }
      while (v4);
    }

    if (objc_msgSend(v3, "count"))
    {
      wifiP2PStateServices = self->_wifiP2PStateServices;
      v38 = (NSSet *)v3;
      v39 = wifiP2PStateServices;
      if (v38 != v39)
      {
        v40 = v39;
        if ((v38 == 0) != (v39 != 0))
        {
          v41 = -[NSSet isEqual:](v38, "isEqual:", v39);

          v49 = self;
          if ((v41 & 1) != 0)
            goto LABEL_81;
        }
        else
        {

          v49 = self;
        }
        ucat = v49->_ucat;
        if (ucat->var0 > 30)
          goto LABEL_67;
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v49->_ucat, 0x1Eu))
            goto LABEL_67;
          ucat = self->_ucat;
        }
        NSPrintF((uint64_t)"%##@", v42, v43, v44, v45, v46, v47, v48, (uint64_t)v38);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeerStatusMonitor]", 0x1Eu, (uint64_t)"P2P state monitor start: services=%@", v53, v54, v55, v56, (uint64_t)v52);

LABEL_67:
        objc_storeStrong((id *)&self->_wifiP2PStateServices, v3);
        -[WiFiP2PAWDLStateMonitor endMonitoring](self->_wifiP2PStateMonitor, "endMonitoring");
        wifiP2PStateMonitor = self->_wifiP2PStateMonitor;
        self->_wifiP2PStateMonitor = 0;

        v58 = (WiFiP2PAWDLStateMonitor *)objc_alloc_init(getWiFiP2PAWDLStateMonitorClass());
        v59 = self->_wifiP2PStateMonitor;
        self->_wifiP2PStateMonitor = v58;

        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v60 = v38;
        v61 = -[NSSet countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        if (v61)
        {
          v62 = *(_QWORD *)v76;
          do
          {
            for (j = 0; j != v61; ++j)
            {
              if (*(_QWORD *)v76 != v62)
                objc_enumerationMutation(v60);
              v64 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
              if (objc_msgSend(v64, "length"))
                -[WiFiP2PAWDLStateMonitor registerAvailabilityUpdatesForService:](self->_wifiP2PStateMonitor, "registerAvailabilityUpdatesForService:", v64);
            }
            v61 = -[NSSet countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
          }
          while (v61);
        }

        objc_initWeak(&location, self);
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __48__CUWiFiManager__updateTrafficPeerStatusMonitor__block_invoke;
        v72[3] = &unk_1E25DE550;
        objc_copyWeak(&v73, &location);
        -[WiFiP2PAWDLStateMonitor setServiceAvailabilityUpdatedHandler:](self->_wifiP2PStateMonitor, "setServiceAvailabilityUpdatedHandler:", v72);
        -[WiFiP2PAWDLStateMonitor beginMonitoring](self->_wifiP2PStateMonitor, "beginMonitoring");
        objc_destroyWeak(&v73);
        objc_destroyWeak(&location);
        goto LABEL_80;
      }

LABEL_80:
      v49 = self;
      goto LABEL_81;
    }
    v49 = self;
    if (!self->_wifiP2PStateMonitor)
    {
LABEL_81:
      -[CUWiFiManager _updateWiFiState](v49, "_updateWiFiState");

      return;
    }
    v50 = self->_ucat;
    if (v50->var0 <= 30)
    {
      if (v50->var0 != -1)
      {
LABEL_60:
        LogPrintF((uint64_t)v50, (uint64_t)"-[CUWiFiManager _updateTrafficPeerStatusMonitor]", 0x1Eu, (uint64_t)"P2P state monitor stop", v33, v34, v35, v36, v70);
        v49 = self;
        goto LABEL_78;
      }
      v65 = _LogCategory_Initialize((uint64_t)v50, 0x1Eu);
      v49 = self;
      if (v65)
      {
        v50 = self->_ucat;
        goto LABEL_60;
      }
    }
LABEL_78:
    p_wifiP2PStateMonitor = (void **)&v49->_wifiP2PStateMonitor;
    -[WiFiP2PAWDLStateMonitor endMonitoring](v49->_wifiP2PStateMonitor, "endMonitoring");
    v67 = *p_wifiP2PStateMonitor;
    *p_wifiP2PStateMonitor = 0;

    v68 = self->_wifiP2PStateServices;
    self->_wifiP2PStateServices = 0;

    v49 = self;
    self->_trafficFlagsUnavailable = 0;
    trafficFlagsUnavailableUpdatedHandler = (void (**)(void))self->_trafficFlagsUnavailableUpdatedHandler;
    if (trafficFlagsUnavailableUpdatedHandler)
    {
      trafficFlagsUnavailableUpdatedHandler[2]();
      goto LABEL_80;
    }
    goto LABEL_81;
  }
}

- (void)_updateTrafficPeerStatusUpdated:(id)a3 isAvailable:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  char v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  char v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  char v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  int v55;
  unsigned int trafficFlagsUnavailable;
  int v57;
  unsigned int v58;
  LogCategory *ucat;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (**trafficFlagsUnavailableUpdatedHandler)(void);
  void *v65;
  id v66;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  getAWDLTrafficRegistrationServiceAirPlay[0]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v8;
  v11 = v10;
  if (v11 == v66)
  {

    goto LABEL_6;
  }
  if ((v66 == 0) == (v11 != 0))
  {

    goto LABEL_8;
  }
  v12 = objc_msgSend(v66, "isEqual:", v11);

  if ((v12 & 1) != 0)
  {
LABEL_6:
    v20 = 256;
    goto LABEL_58;
  }
LABEL_8:
  getAWDLTrafficRegistrationServiceSidecar[0]();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v66;
  v23 = v21;
  if (v23 == v22)
  {

    goto LABEL_13;
  }
  v24 = v23;
  if ((v66 == 0) == (v23 != 0))
  {

    goto LABEL_15;
  }
  v25 = objc_msgSend(v22, "isEqual:", v23);

  if ((v25 & 1) != 0)
  {
LABEL_13:
    v20 = 512;
    goto LABEL_58;
  }
LABEL_15:
  getAWDLTrafficRegistrationServiceDeviceToDeviceMigration[0]();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v22;
  v28 = v26;
  if (v28 == v27)
  {

    goto LABEL_20;
  }
  v29 = v28;
  if ((v66 == 0) == (v28 != 0))
  {

    goto LABEL_22;
  }
  v30 = objc_msgSend(v27, "isEqual:", v28);

  if ((v30 & 1) != 0)
  {
LABEL_20:
    v20 = 1024;
    goto LABEL_58;
  }
LABEL_22:
  getAWDLTrafficRegistrationServiceUniversalControl[0]();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v27;
  v33 = v31;
  if (v33 == v32)
  {

    goto LABEL_27;
  }
  v34 = v33;
  if ((v66 == 0) == (v33 != 0))
  {

    goto LABEL_29;
  }
  v35 = objc_msgSend(v32, "isEqual:", v33);

  if ((v35 & 1) != 0)
  {
LABEL_27:
    v20 = 4096;
    goto LABEL_58;
  }
LABEL_29:
  getAWDLTrafficRegistrationServiceMPRemoteCamera[0]();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v32;
  v38 = v36;
  if (v38 == v37)
  {

    goto LABEL_34;
  }
  v39 = v38;
  if ((v66 == 0) == (v38 != 0))
  {

    goto LABEL_36;
  }
  v40 = objc_msgSend(v37, "isEqual:", v38);

  if ((v40 & 1) != 0)
  {
LABEL_34:
    v20 = 0x2000;
    goto LABEL_58;
  }
LABEL_36:
  getAWDLTrafficRegistrationServiceRemoteCamera[0]();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v37;
  v43 = v41;
  if (v43 == v42)
  {

    goto LABEL_41;
  }
  v44 = v43;
  if ((v66 == 0) == (v43 != 0))
  {

    goto LABEL_43;
  }
  v45 = objc_msgSend(v42, "isEqual:", v43);

  if ((v45 & 1) != 0)
  {
LABEL_41:
    v20 = 0x4000;
    goto LABEL_58;
  }
LABEL_43:
  getAWDLTrafficRegistrationServiceTVRemoteCamera[0]();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v42;
  v48 = v46;
  if (v48 == v47)
  {

    goto LABEL_48;
  }
  v49 = v48;
  if ((v66 == 0) == (v48 != 0))
  {

    goto LABEL_50;
  }
  v50 = objc_msgSend(v47, "isEqual:", v48);

  if ((v50 & 1) != 0)
  {
LABEL_48:
    v20 = 0x8000;
    goto LABEL_58;
  }
LABEL_50:
  getAWDLTrafficRegistrationServiceRemoteScreen[0]();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v47;
  v53 = v51;
  if (v53 == v52)
  {

    goto LABEL_55;
  }
  v54 = v53;
  if ((v66 == 0) != (v53 != 0))
  {
    v55 = objc_msgSend(v52, "isEqual:", v53);

    if (!v55)
      goto LABEL_57;
LABEL_55:
    v20 = 0x10000;
    goto LABEL_58;
  }

LABEL_57:
  v20 = 0;
LABEL_58:
  trafficFlagsUnavailable = self->_trafficFlagsUnavailable;
  v57 = trafficFlagsUnavailable | v20;
  v58 = trafficFlagsUnavailable & ~v20;
  if (!v6)
    v58 = v57;
  self->_trafficFlagsUnavailable = v58;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_62:
      NSPrintF((uint64_t)"%{error}", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v9);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateTrafficPeerStatusUpdated:isAvailable:error:]", 0x1Eu, (uint64_t)"P2P state monitor update: service=%@, isAvailable=%s, error=%@, trafficFlags=0x%X", v60, v61, v62, v63, (uint64_t)v66);

      goto LABEL_64;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_62;
    }
  }
LABEL_64:
  if (self->_trafficFlagsUnavailable != trafficFlagsUnavailable)
  {
    trafficFlagsUnavailableUpdatedHandler = (void (**)(void))self->_trafficFlagsUnavailableUpdatedHandler;
    if (trafficFlagsUnavailableUpdatedHandler)
      trafficFlagsUnavailableUpdatedHandler[2]();
    -[CUWiFiManager _updateWiFiState](self, "_updateWiFiState");
  }

}

- (void)_updateWakeOnWireless
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 wakeOnWirelessEnabled;
  LogCategory *ucat;
  const char *v9;

  if (self->_wifiManager && self->_wakeOnWirelessEnabledChanged)
  {
    wakeOnWirelessEnabled = self->_wakeOnWirelessEnabled;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        if (wakeOnWirelessEnabled)
          v9 = "no";
        else
          v9 = "yes";
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateWakeOnWireless]", 0x1Eu, (uint64_t)"WakeOnWireless: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v9);
        goto LABEL_10;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
LABEL_10:
    WiFiManagerClientSetWoWState();
    self->_wakeOnWirelessEnabledChanged = 0;
  }
}

- (void)_updateWiFiState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t wifiFlags;
  int lastTrafficRegistrationErrorCode;
  _BOOL4 degradeOnAnyTrafficUnavailable;
  int v12;
  unsigned int v13;
  LogCategory *ucat;
  void (**v15)(void);
  void (**v16)(void);

  wifiFlags = self->_wifiFlags;
  lastTrafficRegistrationErrorCode = self->_lastTrafficRegistrationErrorCode;
  degradeOnAnyTrafficUnavailable = self->_degradeOnAnyTrafficUnavailable;
  if (self->_degradeOnAnyTrafficUnavailable)
    degradeOnAnyTrafficUnavailable = self->_trafficFlagsUnavailable != 0;
  self->_trafficPeerDegraded = degradeOnAnyTrafficUnavailable;
  if ((lastTrafficRegistrationErrorCode == 100 || lastTrafficRegistrationErrorCode == 0)
    && !degradeOnAnyTrafficUnavailable)
  {
    v12 = wifiFlags & 0xFFFFFFBF;
  }
  else
  {
    v12 = wifiFlags | 0x40;
  }
  v13 = v12 & 0xFFFFFF7F | ((lastTrafficRegistrationErrorCode == 100) << 7);
  if (v13 != (_DWORD)wifiFlags)
  {
    self->_wifiFlags = v13;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_17;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _updateWiFiState]", 0x1Eu, (uint64_t)"Flags changed: %#{flags} -> %#{flags}\n", v2, v3, v4, v5, wifiFlags);
    }
LABEL_17:
    v15 = (void (**)(void))_Block_copy(self->_wifiStateChangedHandler);
    if (v15)
    {
      v16 = v15;
      v15[2]();
      v15 = v16;
    }

  }
}

- (void)_wifiEnsureStarted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  CURetrier *v8;
  CURetrier *wifiRetrier;
  __WiFiManagerClient *v10;
  LogCategory *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  __WiFiDeviceClient *ValueAtIndex;
  LogCategory *v15;
  LogCategory *v16;
  LogCategory *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  LogCategory *v27;
  id wifiStateChangedHandler;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int wifiState;
  LogCategory *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  _QWORD v38[5];

  if (!self->_wifiRetrier)
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFi start monitoring\n", v2, v3, v4, v5, v37);
    }
LABEL_6:
    v8 = objc_alloc_init(CURetrier);
    wifiRetrier = self->_wifiRetrier;
    self->_wifiRetrier = v8;

    -[CURetrier setDispatchQueue:](self->_wifiRetrier, "setDispatchQueue:", self->_dispatchQueue);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __35__CUWiFiManager__wifiEnsureStarted__block_invoke;
    v38[3] = &unk_1E25DF2A0;
    v38[4] = self;
    -[CURetrier setActionHandler:](self->_wifiRetrier, "setActionHandler:", v38);
    -[CURetrier setStartTime:](self->_wifiRetrier, "setStartTime:", CFAbsoluteTimeGetCurrent());
  }
  if (self->_wifiManager)
    goto LABEL_14;
  v10 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->_wifiManager = v10;
  if (v10)
    goto LABEL_14;
  v11 = self->_ucat;
  if (v11->var0 <= 60)
  {
    if (v11->var0 != -1)
    {
LABEL_11:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x3Cu, (uint64_t)"### WiFiManagerClientCreate failed\n", v2, v3, v4, v5, v37);
      goto LABEL_13;
    }
    if (_LogCategory_Initialize((uint64_t)v11, 0x3Cu))
    {
      v11 = self->_ucat;
      goto LABEL_11;
    }
  }
LABEL_13:
  if (!self->_wifiManager)
    goto LABEL_24;
LABEL_14:
  if (self->_wifiDevice)
    goto LABEL_24;
  v12 = (const __CFArray *)WiFiManagerClientCopyDevices();
  v13 = v12;
  if (!v12 || CFArrayGetCount(v12) < 1)
  {
    v15 = self->_ucat;
    if (v15->var0 > 60)
      goto LABEL_22;
    if (v15->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v15, 0x3Cu))
      {
LABEL_22:
        if (!v13)
          goto LABEL_24;
        goto LABEL_23;
      }
      v15 = self->_ucat;
    }
    LogPrintF((uint64_t)v15, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x3Cu, (uint64_t)"### WiFiManagerClientCopyDevices failed: %@\n", v2, v3, v4, v5, (uint64_t)v13);
    goto LABEL_22;
  }
  ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v13, 0);
  self->_wifiDevice = ValueAtIndex;
  CFRetain(ValueAtIndex);
LABEL_23:
  CFRelease(v13);
LABEL_24:
  if ((self->_controlFlags & 0x100) != 0)
  {
    if (!self->_wifiDevice || self->_wifiCriticalSetup)
      goto LABEL_40;
    v17 = self->_ucat;
    if (v17->var0 <= 30)
    {
      if (v17->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v17, 0x1Eu))
          goto LABEL_39;
        v17 = self->_ucat;
      }
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFiDeviceClient critical monitor started\n", v2, v3, v4, v5, v37);
    }
LABEL_39:
    WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback();
    self->_wifiCriticalSetup = 1;
    goto LABEL_40;
  }
  if (!self->_wifiCriticalSetup)
    goto LABEL_40;
  v16 = self->_ucat;
  if (v16->var0 > 30)
    goto LABEL_35;
  if (v16->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v16, 0x1Eu))
      goto LABEL_35;
    v16 = self->_ucat;
  }
  LogPrintF((uint64_t)v16, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFiDeviceClient critical monitor stopped\n", v2, v3, v4, v5, v37);
LABEL_35:
  if (self->_wifiDevice)
    WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback();
  *(_WORD *)&self->_wifiCriticalSetup = 0;
LABEL_40:
  if (self->_wifiManager)
  {
    if (!self->_wifiManagerSetup)
    {
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      WiFiManagerClientRegisterServerRestartCallback();
      self->_wifiManagerSetup = 1;
      v22 = self->_ucat;
      if (v22->var0 <= 30)
      {
        if (v22->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v22, 0x1Eu))
            goto LABEL_46;
          v22 = self->_ucat;
        }
        LogPrintF((uint64_t)v22, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFiManagerClient started\n", v18, v19, v20, v21, v37);
      }
    }
  }
LABEL_46:
  if (self->_wifiDevice)
  {
    if (!self->_wifiDeviceSetup)
    {
      WiFiDeviceClientRegisterRemovalCallback();
      self->_wifiDeviceSetup = 1;
      v27 = self->_ucat;
      if (v27->var0 <= 30)
      {
        if (v27->var0 != -1)
        {
LABEL_50:
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)"WiFiDeviceClient started\n", v23, v24, v25, v26, v37);
          goto LABEL_52;
        }
        if (_LogCategory_Initialize((uint64_t)v27, 0x1Eu))
        {
          v27 = self->_ucat;
          goto LABEL_50;
        }
      }
    }
  }
LABEL_52:
  wifiStateChangedHandler = self->_wifiStateChangedHandler;
  if (!self->_wifiDeviceSetup)
  {
    if (wifiStateChangedHandler)
      goto LABEL_80;
    goto LABEL_63;
  }
  if (!wifiStateChangedHandler)
  {
LABEL_63:
    if (!self->_wifiStateMonitorSetup)
      goto LABEL_80;
    WiFiDeviceClientRegisterAutoJoinNotificationCallback();
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegisterPowerCallback();
    self->_wifiStateMonitorSetup = 0;
    self->_wifiState = 0;
    v34 = self->_ucat;
    if (v34->var0 > 30)
      goto LABEL_80;
    if (v34->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v34, 0x1Eu))
        goto LABEL_80;
      v34 = self->_ucat;
    }
    v36 = "WiFi state monitor stopped\n";
    goto LABEL_79;
  }
  if (self->_wifiStateMonitorSetup)
    goto LABEL_80;
  WiFiDeviceClientRegisterAutoJoinNotificationCallback();
  WiFiDeviceClientRegisterHostApStateChangedCallback();
  WiFiDeviceClientRegisterPowerCallback();
  self->_wifiStateMonitorSetup = 1;
  self->_wifiFlags = -[CUWiFiManager _wifiFlagsUncached](self, "_wifiFlagsUncached");
  wifiState = -[CUWiFiManager _wifiStateUncached](self, "_wifiStateUncached");
  self->_wifiState = wifiState;
  v34 = self->_ucat;
  if (v34->var0 > 30)
    goto LABEL_80;
  if (v34->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v34, 0x1Eu))
      goto LABEL_80;
    v34 = self->_ucat;
    wifiState = self->_wifiState;
  }
  if (wifiState <= 19)
  {
    if (!wifiState)
    {
      v35 = "Unknown";
      goto LABEL_78;
    }
    if (wifiState == 10)
    {
      v35 = "Off";
      goto LABEL_78;
    }
LABEL_77:
    v35 = "?";
    goto LABEL_78;
  }
  if (wifiState == 20)
  {
    v35 = "NotConnected";
    goto LABEL_78;
  }
  if (wifiState == 30)
  {
    v35 = "Connecting";
    goto LABEL_78;
  }
  if (wifiState != 40)
    goto LABEL_77;
  v35 = "Connected";
LABEL_78:
  v37 = (uint64_t)v35;
  v36 = "WiFi state monitor started, %s, %#{flags}\n";
LABEL_79:
  LogPrintF((uint64_t)v34, (uint64_t)"-[CUWiFiManager _wifiEnsureStarted]", 0x1Eu, (uint64_t)v36, v29, v30, v31, v32, v37);
LABEL_80:
  if (!self->_wifiDeviceSetup)
    -[CURetrier failed](self->_wifiRetrier, "failed");
}

- (void)_wifiEnsureStopped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t i;
  NSArray *trafficPeers;
  NSArray *trafficPeersCurrent;
  LogCategory *v21;
  LogCategory *v22;
  __WiFiDeviceClient *wifiDevice;
  LogCategory *v24;
  __WiFiNetwork *wifiNetworkDisabled;
  LogCategory *v26;
  LogCategory *v27;
  CURetrier *wifiRetrier;
  WiFiP2PAWDLStateMonitor *wifiP2PStateMonitor;
  NSSet *wifiP2PStateServices;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_wifiDevice && -[NSArray count](self->_trafficPeersCurrent, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_7;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
LABEL_7:
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = self->_trafficPeersCurrent;
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v13);
              v16 |= objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "trafficFlags");
            }
            v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v15);
        }
        else
        {
          v16 = 0;
        }

        trafficPeers = self->_trafficPeers;
        self->_trafficPeers = 0;

        if ((v16 & 0x100) != 0)
        {
          -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 256);
          if ((v16 & 0x400) == 0)
          {
LABEL_18:
            if ((v16 & 0x1000) == 0)
              goto LABEL_19;
            goto LABEL_32;
          }
        }
        else if ((v16 & 0x400) == 0)
        {
          goto LABEL_18;
        }
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 1024);
        if ((v16 & 0x1000) == 0)
        {
LABEL_19:
          if ((v16 & 0x2000) == 0)
            goto LABEL_20;
          goto LABEL_33;
        }
LABEL_32:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 4096);
        if ((v16 & 0x2000) == 0)
        {
LABEL_20:
          if ((v16 & 0x8000) == 0)
            goto LABEL_21;
          goto LABEL_34;
        }
LABEL_33:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 0x2000);
        if ((v16 & 0x8000) == 0)
        {
LABEL_21:
          if ((v16 & 0x200) == 0)
            goto LABEL_22;
          goto LABEL_35;
        }
LABEL_34:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 0x8000);
        if ((v16 & 0x200) == 0)
        {
LABEL_22:
          if ((v16 & 0x4000) == 0)
            goto LABEL_23;
          goto LABEL_36;
        }
LABEL_35:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 512);
        if ((v16 & 0x4000) == 0)
        {
LABEL_23:
          if ((v16 & 0x10000) == 0)
          {
LABEL_25:
            trafficPeersCurrent = self->_trafficPeersCurrent;
            self->_trafficPeersCurrent = 0;

            goto LABEL_26;
          }
LABEL_24:
          -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 0x10000);
          goto LABEL_25;
        }
LABEL_36:
        -[CUWiFiManager _updateTrafficPeersWithService:](self, "_updateTrafficPeersWithService:", 0x4000);
        if ((v16 & 0x10000) == 0)
          goto LABEL_25;
        goto LABEL_24;
      }
      ucat = self->_ucat;
    }
    v8 = -[NSArray count](self->_trafficPeersCurrent, "count");
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"Traffic registration stop: %d peers\n", v9, v10, v11, v12, v8);
    goto LABEL_7;
  }
LABEL_26:
  if (!self->_wifiCriticalSetup)
    goto LABEL_42;
  v21 = self->_ucat;
  if (v21->var0 <= 30)
  {
    if (v21->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v21, 0x1Eu))
        goto LABEL_39;
      v21 = self->_ucat;
    }
    LogPrintF((uint64_t)v21, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFiDeviceClient critical monitor stopped\n", v2, v3, v4, v5, v31);
  }
LABEL_39:
  if (self->_wifiDevice)
    WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback();
  *(_WORD *)&self->_wifiCriticalSetup = 0;
LABEL_42:
  if (!self->_wifiStateMonitorSetup)
    goto LABEL_47;
  WiFiDeviceClientRegisterAutoJoinNotificationCallback();
  WiFiDeviceClientRegisterHostApStateChangedCallback();
  WiFiDeviceClientRegisterPowerCallback();
  self->_wifiStateMonitorSetup = 0;
  self->_wifiFlags = 0;
  self->_wifiState = 0;
  v22 = self->_ucat;
  if (v22->var0 > 30)
    goto LABEL_47;
  if (v22->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v22, 0x1Eu))
      goto LABEL_47;
    v22 = self->_ucat;
  }
  LogPrintF((uint64_t)v22, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFi state monitor stopped\n", v2, v3, v4, v5, v31);
LABEL_47:
  if (self->_wifiDeviceSetup)
  {
    WiFiDeviceClientRegisterRemovalCallback();
    wifiDevice = self->_wifiDevice;
    if (wifiDevice)
      CFRelease(wifiDevice);
    self->_wifiDevice = 0;
    self->_wifiDeviceSetup = 0;
    v24 = self->_ucat;
    if (v24->var0 <= 30)
    {
      if (v24->var0 != -1)
      {
LABEL_52:
        LogPrintF((uint64_t)v24, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFiDeviceClient stopped\n", v2, v3, v4, v5, v31);
        goto LABEL_54;
      }
      if (_LogCategory_Initialize((uint64_t)v24, 0x1Eu))
      {
        v24 = self->_ucat;
        goto LABEL_52;
      }
    }
  }
LABEL_54:
  self->_wifiAutoJoinDisabled = 0;
  wifiNetworkDisabled = self->_wifiNetworkDisabled;
  if (wifiNetworkDisabled)
  {
    CFRelease(wifiNetworkDisabled);
    self->_wifiNetworkDisabled = 0;
  }
  self->_wifiManagerSetup = 0;
  if (self->_wifiManager)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterServerRestartCallback();
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
    v26 = self->_ucat;
    if (v26->var0 <= 30)
    {
      if (v26->var0 != -1)
      {
LABEL_59:
        LogPrintF((uint64_t)v26, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFiManagerClient stopped\n", v2, v3, v4, v5, v31);
        goto LABEL_61;
      }
      if (_LogCategory_Initialize((uint64_t)v26, 0x1Eu))
      {
        v26 = self->_ucat;
        goto LABEL_59;
      }
    }
  }
LABEL_61:
  if (self->_wifiRetrier)
  {
    v27 = self->_ucat;
    if (v27->var0 <= 30)
    {
      if (v27->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v27, 0x1Eu))
          goto LABEL_66;
        v27 = self->_ucat;
      }
      LogPrintF((uint64_t)v27, (uint64_t)"-[CUWiFiManager _wifiEnsureStopped]", 0x1Eu, (uint64_t)"WiFi monitoring stopped\n", v2, v3, v4, v5, v31);
    }
LABEL_66:
    -[CURetrier invalidateDirect](self->_wifiRetrier, "invalidateDirect");
    wifiRetrier = self->_wifiRetrier;
    self->_wifiRetrier = 0;

  }
  -[WiFiP2PAWDLStateMonitor endMonitoring](self->_wifiP2PStateMonitor, "endMonitoring");
  wifiP2PStateMonitor = self->_wifiP2PStateMonitor;
  self->_wifiP2PStateMonitor = 0;

  wifiP2PStateServices = self->_wifiP2PStateServices;
  self->_wifiP2PStateServices = 0;

}

- (void)_wifiAutoJoinNotification:(id)a3
{
  const void *v4;
  CFTypeID TypeID;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  LogCategory *ucat;
  int v14;
  void *v15;
  void *SSID;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  LogCategory *v22;
  int wifiState;
  const char *v24;
  void (**wifiStateChangedHandler)(void);
  const __CFDictionary *v26;

  v26 = (const __CFDictionary *)a3;
  v4 = (const void *)*MEMORY[0x1E0D4FE08];
  TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v26, v4, TypeID, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CUWiFiManager _wifiFlagsUncached](self, "_wifiFlagsUncached");
  v12 = -[CUWiFiManager _wifiStateUncached](self, "_wifiStateUncached");
  ucat = self->_ucat;
  if (ucat->var0 > 9)
    goto LABEL_6;
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 9u))
      goto LABEL_6;
    ucat = self->_ucat;
  }
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _wifiAutoJoinNotification:]", 9u, (uint64_t)"WiFi AutoJoin notification: %@, %s, %#{flags}\n", v8, v9, v10, v11, (uint64_t)v6);
LABEL_6:
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0D4FDF0]))
    v14 = 30;
  else
    v14 = v12;
  if (v14 == self->_wifiState && v7 == self->_wifiFlags)
    goto LABEL_34;
  -[__CFDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D4FDE8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    SSID = (void *)WiFiNetworkGetSSID();
  else
    SSID = 0;
  v21 = SSID;
  v22 = self->_ucat;
  if (v22->var0 <= 30)
  {
    if (v22->var0 != -1)
      goto LABEL_16;
    if (_LogCategory_Initialize((uint64_t)v22, 0x1Eu))
    {
      v22 = self->_ucat;
LABEL_16:
      wifiState = self->_wifiState;
      if (wifiState <= 19)
      {
        if (!wifiState)
        {
          v24 = "Unknown";
          goto LABEL_30;
        }
        if (wifiState == 10)
        {
          v24 = "Off";
          goto LABEL_30;
        }
      }
      else
      {
        switch(wifiState)
        {
          case 20:
            v24 = "NotConnected";
            goto LABEL_30;
          case 30:
            v24 = "Connecting";
            goto LABEL_30;
          case 40:
            v24 = "Connected";
LABEL_30:
            LogPrintF((uint64_t)v22, (uint64_t)"-[CUWiFiManager _wifiAutoJoinNotification:]", 0x1Eu, (uint64_t)"WiFi state changed: %s -> %s, %#{flags} %?''@\n", v17, v18, v19, v20, (uint64_t)v24);
            goto LABEL_31;
        }
      }
      v24 = "?";
      goto LABEL_30;
    }
  }
LABEL_31:
  self->_wifiFlags = v7;
  self->_wifiState = v14;
  wifiStateChangedHandler = (void (**)(void))self->_wifiStateChangedHandler;
  if (wifiStateChangedHandler)
    wifiStateChangedHandler[2]();

LABEL_34:
}

- (unsigned)_wifiFlagsUncached
{
  unsigned int v2;
  uint64_t v3;
  const void *v4;
  unsigned int AuthFlags;

  v2 = self->_wifiCriticalState << 8;
  if (self->_wifiDevice)
  {
    v3 = WiFiDeviceClientCopyCurrentNetwork();
    if (v3)
    {
      v4 = (const void *)v3;
      AuthFlags = WiFiNetworkGetAuthFlags();
      v2 |= (AuthFlags == 0) | (__rbit32(AuthFlags) >> 27) & 0x1A;
      if (WiFiNetworkIsCaptive())
        v2 |= 4u;
      if (WiFiNetworkGetOperatingBand() == 2)
        v2 |= 0x200u;
      CFRelease(v4);
    }
    WiFiDeviceClientCopyHostedNetworks();
  }
  return v2;
}

- (int)_wifiStateUncached
{
  __WiFiManagerClient *wifiManager;
  const void *v4;

  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    if (WiFiManagerClientGetPower())
    {
      if (self->_wifiDevice && (v4 = (const void *)WiFiDeviceClientCopyCurrentNetwork()) != 0)
      {
        CFRelease(v4);
        LODWORD(wifiManager) = 40;
      }
      else
      {
        LODWORD(wifiManager) = 20;
      }
    }
    else
    {
      LODWORD(wifiManager) = 10;
    }
  }
  return (int)wifiManager;
}

- (void)_wifiStateChanged
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int wifiState;
  LogCategory *ucat;
  const char *v11;
  LogCategory *v12;
  const char *v13;
  void (**v14)(void);
  void (**v15)(void);

  v3 = -[CUWiFiManager _wifiFlagsUncached](self, "_wifiFlagsUncached");
  v8 = -[CUWiFiManager _wifiStateUncached](self, "_wifiStateUncached");
  wifiState = self->_wifiState;
  if (__PAIR64__(v8, v3) == *(_QWORD *)&self->_wifiFlags)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 10)
      return;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0xAu))
        return;
      ucat = self->_ucat;
    }
    if (v8 <= 19)
    {
      if (!v8)
      {
        v11 = "Unknown";
        goto LABEL_38;
      }
      if (v8 == 10)
      {
        v11 = "Off";
        goto LABEL_38;
      }
    }
    else
    {
      switch(v8)
      {
        case 20:
          v11 = "NotConnected";
          goto LABEL_38;
        case 30:
          v11 = "Connecting";
          goto LABEL_38;
        case 40:
          v11 = "Connected";
LABEL_38:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUWiFiManager _wifiStateChanged]", 0xAu, (uint64_t)"WiFi state changed: %s, %#{flags}\n", v4, v5, v6, v7, (uint64_t)v11);
          return;
      }
    }
    v11 = "?";
    goto LABEL_38;
  }
  v12 = self->_ucat;
  if (v12->var0 <= 30)
  {
    if (v12->var0 != -1)
      goto LABEL_11;
    if (_LogCategory_Initialize((uint64_t)v12, 0x1Eu))
    {
      v12 = self->_ucat;
      wifiState = self->_wifiState;
LABEL_11:
      if (wifiState <= 19)
      {
        if (!wifiState)
        {
          v13 = "Unknown";
          goto LABEL_27;
        }
        if (wifiState == 10)
        {
          v13 = "Off";
          goto LABEL_27;
        }
      }
      else
      {
        switch(wifiState)
        {
          case 20:
            v13 = "NotConnected";
            goto LABEL_27;
          case 30:
            v13 = "Connecting";
            goto LABEL_27;
          case 40:
            v13 = "Connected";
LABEL_27:
            LogPrintF((uint64_t)v12, (uint64_t)"-[CUWiFiManager _wifiStateChanged]", 0x1Eu, (uint64_t)"WiFi state changed: %s -> %s, %#{flags}\n", v4, v5, v6, v7, (uint64_t)v13);
            goto LABEL_28;
        }
      }
      v13 = "?";
      goto LABEL_27;
    }
  }
LABEL_28:
  self->_wifiFlags = v3;
  self->_wifiState = v8;
  v14 = (void (**)(void))_Block_copy(self->_wifiStateChangedHandler);
  if (v14)
  {
    v15 = v14;
    v14[2]();
    v14 = v15;
  }

}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)infraDisabled
{
  return self->_infraDisabled;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)trafficPeers
{
  return self->_trafficPeers;
}

- (unsigned)trafficFlagsUnavailable
{
  return self->_trafficFlagsUnavailable;
}

- (id)trafficFlagsUnavailableUpdatedHandler
{
  return self->_trafficFlagsUnavailableUpdatedHandler;
}

- (void)setTrafficFlagsUnavailableUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)degradeOnAnyTrafficUnavailable
{
  return self->_degradeOnAnyTrafficUnavailable;
}

- (void)setDegradeOnAnyTrafficUnavailable:(BOOL)a3
{
  self->_degradeOnAnyTrafficUnavailable = a3;
}

- (BOOL)wakeOnWirelessEnabled
{
  return self->_wakeOnWirelessEnabled;
}

- (unsigned)wifiFlags
{
  return self->_wifiFlags;
}

- (int)wifiState
{
  return self->_wifiState;
}

- (id)wifiStateChangedHandler
{
  return self->_wifiStateChangedHandler;
}

- (void)setWifiStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wifiStateChangedHandler, 0);
  objc_storeStrong(&self->_trafficFlagsUnavailableUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_trafficPeers, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiP2PStateServices, 0);
  objc_storeStrong((id *)&self->_wifiP2PStateMonitor, 0);
  objc_storeStrong((id *)&self->_wifiRetrier, 0);
  objc_storeStrong((id *)&self->_trafficPeersCurrent, 0);
}

uint64_t __35__CUWiFiManager__wifiEnsureStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void __48__CUWiFiManager__updateTrafficPeerStatusMonitor__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_updateTrafficPeerStatusUpdated:isAvailable:error:", v8, a3, v7);

}

uint64_t __31__CUWiFiManager_performUpdate___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 1;
  return result;
}

_BYTE *__31__CUWiFiManager_performUpdate___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (result[9])
  {
    if (!result[10])
      return (_BYTE *)objc_msgSend(result, "_update");
  }
  return result;
}

uint64_t __27__CUWiFiManager_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;

  v8 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v8 + 10))
  {
    v9 = result;
    *(_BYTE *)(v8 + 10) = 1;
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
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUWiFiManager invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v13);
      v10 = *(_QWORD **)(v9 + 32);
    }
LABEL_6:
    objc_msgSend(v10, "_wifiEnsureStopped");
    return objc_msgSend(*(id *)(v9 + 32), "_invalidated");
  }
  return result;
}

_BYTE *__42__CUWiFiManager__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  _BYTE *result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "_update");
  return result;
}

uint64_t __40__CUWiFiManager_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t result;
  uint64_t v13;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 16);
  if (*v10 > 30)
    goto LABEL_5;
  if (*v10 != -1)
    goto LABEL_3;
  v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
  v9 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    v10 = *(int **)(v9 + 16);
LABEL_3:
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUWiFiManager activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  *(_BYTE *)(v9 + 9) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_update");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __42__CUWiFiManager_setWakeOnWirelessEnabled___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 130))
  {
    *(_BYTE *)(v2 + 130) = v1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 127) = 1;
  }
  return result;
}

void __33__CUWiFiManager_setTrafficPeers___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 126) = 1;
}

uint64_t __34__CUWiFiManager_setInfraDisabled___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 128))
  {
    *(_BYTE *)(v2 + 128) = v1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 125) = 1;
  }
  return result;
}

uint64_t __33__CUWiFiManager_setControlFlags___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 132))
    *(_DWORD *)(v2 + 132) = v1;
  return result;
}

@end
