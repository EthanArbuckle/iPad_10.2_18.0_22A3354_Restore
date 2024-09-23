@implementation EasyConfigDevice

- (EasyConfigDevice)init
{
  EasyConfigDevice *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  EasyConfigDevice *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EasyConfigDevice;
  v2 = -[EasyConfigDevice init](&v7, sel_init);
  if (v2
    && (v3 = dispatch_queue_create("EasyConfigDevice", 0),
        internalQueue = v2->_internalQueue,
        v2->_internalQueue = (OS_dispatch_queue *)v3,
        internalQueue,
        v2->_internalQueue))
  {
    objc_storeStrong((id *)&v2->_userQueue, MEMORY[0x24BDAC9B8]);
    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *userQueue;
  NSDictionary *scanRecord;
  NSDictionary *airplayBonjourInfo;
  NSDictionary *raopBonjourInfo;
  NSDictionary *mfiConfigBonjourInfo;
  NSDictionary *hapBonjourInfo;
  NSString *model;
  NSString *name;
  NSDictionary *configuration;
  NSDictionary *configResponse;
  id promptForSetupCodeBlock;
  id progressHandler;
  NSDictionary *deviceInfo;
  objc_super v17;

  internalQueue = self->_internalQueue;
  if (internalQueue)
  {
    self->_internalQueue = 0;

  }
  userQueue = self->_userQueue;
  if (userQueue)
  {
    self->_userQueue = 0;

  }
  scanRecord = self->_scanRecord;
  self->_scanRecord = 0;

  airplayBonjourInfo = self->_airplayBonjourInfo;
  self->_airplayBonjourInfo = 0;

  raopBonjourInfo = self->_raopBonjourInfo;
  self->_raopBonjourInfo = 0;

  mfiConfigBonjourInfo = self->_mfiConfigBonjourInfo;
  self->_mfiConfigBonjourInfo = 0;

  hapBonjourInfo = self->_hapBonjourInfo;
  self->_hapBonjourInfo = 0;

  model = self->_model;
  self->_model = 0;

  name = self->_name;
  self->_name = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

  configResponse = self->_configResponse;
  self->_configResponse = 0;

  promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_promptForSetupCodeBlock = 0;

  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = 0;

  v17.receiver = self;
  v17.super_class = (Class)EasyConfigDevice;
  -[EasyConfigDevice dealloc](&v17, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSDictionary copy](self->_scanRecord, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  v7 = -[NSDictionary copy](self->_airplayBonjourInfo, "copy");
  v8 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v7;

  v9 = -[NSDictionary copy](self->_raopBonjourInfo, "copy");
  v10 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v9;

  v11 = -[NSDictionary copy](self->_mfiConfigBonjourInfo, "copy");
  v12 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v11;

  v13 = -[NSDictionary copy](self->_hapBonjourInfo, "copy");
  v14 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v13;

  *(_DWORD *)(v4 + 104) = self->_configSeed;
  objc_msgSend((id)v4, "setDeviceIdentifier:", self->_deviceIdentifier);
  *(_QWORD *)(v4 + 184) = self->_features;
  objc_msgSend((id)v4, "setModel:", self->_model);
  objc_msgSend((id)v4, "setName:", self->_name);
  objc_msgSend((id)v4, "setConfiguration:", self->_configuration);
  return (id)v4;
}

- (BOOL)updated:(id)a3
{
  id v5;
  void *v6;
  char v7;
  unint64_t DeviceID;
  char v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary **p_airplayBonjourInfo;
  NSDictionary *airplayBonjourInfo;
  NSDictionary *raopBonjourInfo;
  NSDictionary *mfiConfigBonjourInfo;
  NSDictionary *hapBonjourInfo;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSString isEqual:](self->_name, "isEqual:", v6);
  if ((v7 & 1) == 0)
    -[EasyConfigDevice setName:](self, "setName:", v6);
  DeviceID = BonjourDevice_GetDeviceID();
  if (DeviceID == self->_deviceIdentifier)
  {
    v9 = v7 ^ 1;
  }
  else
  {
    self->_deviceIdentifier = DeviceID;
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("serviceType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqual:", CFSTR("_airplay._tcp.")))
  {
    airplayBonjourInfo = self->_airplayBonjourInfo;
    p_airplayBonjourInfo = &self->_airplayBonjourInfo;
    v11 = airplayBonjourInfo;
  }
  else if (objc_msgSend(v10, "isEqual:", CFSTR("_raop._tcp.")))
  {
    raopBonjourInfo = self->_raopBonjourInfo;
    p_airplayBonjourInfo = &self->_raopBonjourInfo;
    v11 = raopBonjourInfo;
  }
  else if (objc_msgSend(v10, "isEqual:", CFSTR("_mfi-config._tcp.")))
  {
    mfiConfigBonjourInfo = self->_mfiConfigBonjourInfo;
    p_airplayBonjourInfo = &self->_mfiConfigBonjourInfo;
    v11 = mfiConfigBonjourInfo;
  }
  else
  {
    if (!objc_msgSend(v10, "isEqual:", CFSTR("_hap._tcp.")))
      goto LABEL_16;
    hapBonjourInfo = self->_hapBonjourInfo;
    p_airplayBonjourInfo = &self->_hapBonjourInfo;
    v11 = hapBonjourInfo;
  }
  if ((-[NSDictionary isEqual:](v11, "isEqual:", v5) & 1) == 0)
  {

    objc_storeStrong((id *)p_airplayBonjourInfo, a3);
    v9 = 1;
  }
LABEL_16:

  return v9;
}

- (BOOL)removed:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("serviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", CFSTR("_airplay._tcp.")) & 1) != 0)
  {
    v5 = 48;
LABEL_9:
    v6 = *(Class *)((char *)&self->super.isa + v5);
    *(Class *)((char *)&self->super.isa + v5) = 0;

    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "isEqual:", CFSTR("_raop._tcp.")) & 1) != 0)
  {
    v5 = 64;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "isEqual:", CFSTR("_mfi-config._tcp.")) & 1) != 0)
  {
    v5 = 80;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("_hap._tcp.")))
  {
    v5 = 96;
    goto LABEL_9;
  }
LABEL_10:
  v7 = !self->_airplayBonjourInfo
    && !self->_raopBonjourInfo
    && !self->_mfiConfigBonjourInfo
    && self->_hapBonjourInfo == 0;

  return v7;
}

- (void)start
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__EasyConfigDevice_start__block_invoke;
  block[3] = &unk_24D1B9060;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_start
{
  NSDictionary *configResponse;
  NSDictionary *scanRecord;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int Int64;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  if (!self->_started)
  {
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_started = 1;
    self->_firstErr = 0;
    self->_configStartTime = CFAbsoluteTimeGetCurrent();
    configResponse = self->_configResponse;
    self->_configResponse = 0;

    scanRecord = self->_scanRecord;
    if (scanRecord)
    {
      -[NSDictionary objectForKey:](scanRecord, "objectForKey:", CFSTR("IE"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        if (objc_msgSend(v5, "length"))
        {
          v6 = objc_retainAutorelease(v6);
          objc_msgSend(v6, "bytes");
          v7 = IEGetVendorSpecific();
          v13 = v7;
          if ((_DWORD)v7 || (v7 = TLV8Get(), (v13 = v7) != 0))
          {
            v8 = v7;
LABEL_21:
            if (gLogCategory_EasyConfigDevice <= 60
              && (gLogCategory_EasyConfigDevice != -1 || (v10 = _LogCategory_Initialize(), v8 = v13, v10)))
            {
              v12 = v8;
              LogPrintF();
              -[EasyConfigDevice _stop:](self, "_stop:", v13, v12);
            }
            else
            {
              -[EasyConfigDevice _stop:](self, "_stop:", v8, v11);
            }
            goto LABEL_26;
          }
          v8 = 4294960553;
        }
        else
        {
          v8 = 4294960546;
        }
      }
      else
      {
        v8 = 4294960569;
      }
    }
    else
    {
      if (self->_deviceInfo)
      {
        self->_deviceIdentifier = CFDictionaryGetHardwareAddress();
        Int64 = CFDictionaryGetInt64();
        v6 = 0;
        self->_supportsHAP = (Int64 & 0x20000) != 0;
        self->_supportsHAP2 = (Int64 & 0x40000) != 0;
        self->_supportsMFi = (Int64 & 4) != 0;
        self->_supportsPairSetup = (Int64 & 0x100000) != 0;
        if (((Int64 >> 17) & 1) == 0 && ((Int64 >> 18) & 1) == 0 && ((Int64 >> 2) & 1) == 0 && ((Int64 >> 20) & 1) == 0)
        {
          v8 = 4294960562;
          goto LABEL_34;
        }
        if (self->_configuration)
        {
          -[EasyConfigDevice _findDevicePreConfigStart](self, "_findDevicePreConfigStart");
          goto LABEL_26;
        }
      }
      else
      {
        v6 = 0;
      }
      v8 = 4294960551;
    }
LABEL_34:
    v13 = v8;
    goto LABEL_21;
  }
  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = 0;
LABEL_26:

}

- (void)stop
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__EasyConfigDevice_stop__block_invoke;
  block[3] = &unk_24D1B9060;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_stop:(int)a3
{
  uint64_t v3;
  _BOOL4 started;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  OS_dispatch_source *timeoutTimer;
  NSObject *v21;
  OS_dispatch_source *v22;
  PairingSessionPrivate *pairingSession;
  id promptForSetupCodeBlock;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v3 = *(_QWORD *)&a3;
  v31[1] = *MEMORY[0x24BDAC8D0];
  started = self->_started;
  self->_started = 0;
  if (!self->_firstErr)
    self->_firstErr = a3;
  if (started)
  {
    -[EasyConfigDevice _logEnded](self, "_logEnded");
    v6 = 0x254D7B000uLL;
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      v25 = v3;
      LogPrintF();
    }
    v7 = 0x24BDD1000uLL;
    if ((_DWORD)v3)
    {
      v30 = CFSTR("EasyConfigKey_ReasonError");
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BDD1100];
      v10 = (int)v3;
      v28 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("?");
      if (v11)
        v13 = (const __CFString *)v11;
      v29 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1, v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, (int)v3, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 2, v16);

      v7 = 0x24BDD1000;
      v6 = 0x254D7B000;
    }
    else
    {
      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 2, 0);
      v10 = 0;
      v9 = *MEMORY[0x24BDD1100];
    }
    objc_msgSend(*(id *)(v7 + 1344), "errorWithDomain:code:userInfo:", v9, v10, 0, v25, CFSTR("EasyConfigKey_ReasonError"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EasyConfigDevice _postNote:info:](self, "_postNote:info:", CFSTR("EasyConfigDeviceStoppedNotification"), v18);

    v19 = *(_DWORD *)(v6 + 584);
    if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  if (self->_airplayBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_airplayBrowser);
    self->_airplayBrowser = 0;
  }
  if (self->_raopBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_raopBrowser);
    self->_raopBrowser = 0;
  }
  if (self->_mfiConfigBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_mfiConfigBrowser);
    self->_mfiConfigBrowser = 0;
  }
  if (self->_hapBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_hapBrowser);
    self->_hapBrowser = 0;
  }
  if (self->_httpClient)
  {
    HTTPClientInvalidate();
    CFRelease(self->_httpClient);
    self->_httpClient = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v21 = timeoutTimer;
    dispatch_source_cancel(v21);
    v22 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  if (self->_mfiSAP)
  {
    MFiSAP_Delete();
    self->_mfiSAP = 0;
  }
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_promptForSetupCodeBlock = 0;

}

- (void)resumePostConfig
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__EasyConfigDevice_resumePostConfig__block_invoke;
  block[3] = &unk_24D1B9060;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)setPairingDelegate:(const void *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  BOOL v6;

  if (a3)
  {
    *(_OWORD *)&self->_pairingDelegate.context = *(_OWORD *)a3;
    v3 = *((_OWORD *)a3 + 1);
    v4 = *((_OWORD *)a3 + 2);
    v5 = *((_OWORD *)a3 + 3);
    self->_pairingDelegate.resumeResponse_f = (void *)*((_QWORD *)a3 + 8);
    *(_OWORD *)&self->_pairingDelegate.copyIdentity_f = v4;
    *(_OWORD *)&self->_pairingDelegate.savePeer_f = v5;
    *(_OWORD *)&self->_pairingDelegate.hideSetupCode_f = v3;
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  self->_hasPairingDelegate = v6;
}

- (void)setPreConfigMetrics:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var8;
  *(_OWORD *)&self->_preConfigMetrics.secondsToGetLinkUpOnSWAP = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_preConfigMetrics.rssiOfSWAP = v4;
  *(_OWORD *)&self->_preConfigMetrics.startTime = v3;
  self->_preConfigMetricsSet = 1;
}

- (void)setPostConfigMetrics:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_postConfigMetrics.secondsToGetLinkUpOnDestination = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_postConfigMetrics.rssiOfDestinationAP = v3;
  self->_postConfigMetricsSet = 1;
}

- (void)setPromptForSetupCodeHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id promptForSetupCodeBlock;
  id v8;

  v4 = (void *)MEMORY[0x2199D229C](a3, a2);
  if (v4)
  {
    v5 = v4;
    v8 = (id)objc_msgSend(v4, "copy");

  }
  else
  {
    v8 = 0;
  }
  v6 = (void *)MEMORY[0x2199D229C](v8);
  promptForSetupCodeBlock = self->_promptForSetupCodeBlock;
  self->_promptForSetupCodeBlock = v6;

}

- (void)trySetupCode:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__EasyConfigDevice_trySetupCode___block_invoke;
  v7[3] = &unk_24D1B9088;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

- (void)_trySetupCode:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  self->_enterSetupCodeMs = ((CFAbsoluteTimeGetCurrent() - self->_promptForSetupCodeTime) * 1000.0);
  if (!self->_pairingSession)
  {
    v4 = 4294960593;
LABEL_4:
    -[EasyConfigDevice _handleError:](self, "_handleError:", v4);
    goto LABEL_5;
  }
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  v4 = PairingSessionSetSetupCode();
  if ((_DWORD)v4)
    goto LABEL_4;
  v4 = -[EasyConfigDevice _pairSetupNext:](self, "_pairSetupNext:", 0);
  if ((_DWORD)v4)
    goto LABEL_4;
LABEL_5:

}

- (int)_findDevicePreConfigStart
{
  double Current;
  uint64_t v4;
  uint64_t v5;
  unint64_t deviceIdentifier;
  unint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  self->_state = 1;
  Current = CFAbsoluteTimeGetCurrent();
  v4 = MEMORY[0x24BDAC760];
  self->_findPreConfigStartTime = Current;
  self->_findPreConfigFoundTime = Current;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __45__EasyConfigDevice__findDevicePreConfigStart__block_invoke;
  v10[3] = &unk_24D1B90B0;
  v10[4] = self;
  v5 = -[EasyConfigDevice _startBonjourWithTimeout:handler:](self, "_startBonjourWithTimeout:handler:", 20, v10);
  if ((_DWORD)v5)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      deviceIdentifier = self->_deviceIdentifier;
      v9 = v5;
      LogPrintF();
    }
    -[EasyConfigDevice _handleError:](self, "_handleError:", v5, deviceIdentifier, v9);
  }
  else if (gLogCategory_EasyConfigDevice <= 30
         && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    v8 = self->_deviceIdentifier;
    LogPrintF();
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 10, 0, v8);
  }
  else
  {
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 10, 0, deviceIdentifier);
  }
  return v5;
}

- (void)_findDevicePreConfigEvent:(unsigned int)a3 info:(id)a4
{
  id v6;
  BOOL v7;
  OS_dispatch_source *timeoutTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  id v11;

  v6 = a4;
  if (a3 == 1
    && self->_started
    && (self->_airplayBrowser || self->_raopBrowser || self->_mfiConfigBrowser || self->_hapBrowser))
  {
    v11 = v6;
    v7 = BonjourDevice_GetDeviceID() == self->_deviceIdentifier;
    v6 = v11;
    if (v7)
    {
      self->_findPreConfigFoundTime = CFAbsoluteTimeGetCurrent();
      BonjourDevice_Reconfirm();
      if (self->_airplayBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_airplayBrowser);
        self->_airplayBrowser = 0;
      }
      if (self->_raopBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_raopBrowser);
        self->_raopBrowser = 0;
      }
      if (self->_mfiConfigBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_mfiConfigBrowser);
        self->_mfiConfigBrowser = 0;
      }
      if (self->_hapBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_hapBrowser);
        self->_hapBrowser = 0;
      }
      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        v9 = timeoutTimer;
        dispatch_source_cancel(v9);
        v10 = self->_timeoutTimer;
        self->_timeoutTimer = 0;

      }
      -[EasyConfigDevice _configureStart:](self, "_configureStart:", v11);
      v6 = v11;
    }
  }

}

- (int)_configureStart:(id)a3
{
  const __CFDictionary *v4;
  int v5;
  unint64_t deviceIdentifier;
  const char *v7;
  _BOOL4 v8;
  const __CFString *TypedValue;
  const __CFString *v10;
  unsigned int v11;
  const __CFData *Value;
  const __CFData *v13;
  const UInt8 *BytePtr;
  uint16_t Length;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  const __CFDictionary *v24;
  uint8_t valueLen;
  unsigned int v26;

  v4 = (const __CFDictionary *)a3;
  self->_state = 2;
  v5 = gLogCategory_EasyConfigDevice;
  if (gLogCategory_EasyConfigDevice <= 30)
  {
    if (gLogCategory_EasyConfigDevice == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_16;
      v5 = gLogCategory_EasyConfigDevice;
    }
    deviceIdentifier = self->_deviceIdentifier;
    if (v5 > 20 || v5 == -1 && !_LogCategory_Initialize())
      v7 = "";
    else
      v7 = ":\n";
    if (gLogCategory_EasyConfigDevice > 20)
      v8 = 0;
    else
      v8 = gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize() != 0;
    v21 = deviceIdentifier;
    v22 = (uint64_t)v7;
    v23 = v8;
    v24 = v4;
    LogPrintF();
  }
LABEL_16:
  v26 = 0;
  valueLen = 0;
  self->_configSeed = BonjourDevice_GetInt64();
  if (v26)
  {
    self->_configSeed = BonjourDevice_GetInt64();
    if (v26)
    {
      self->_configSeed = BonjourDevice_GetInt64();
      if (v26)
      {
        if (gLogCategory_EasyConfigDevice <= 50
          && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
        {
          v21 = self->_deviceIdentifier;
          LogPrintF();
        }
        self->_configSeed = 1;
      }
    }
  }
  self->_supportsTLV = 0;
  CFStringGetTypeID();
  TypedValue = (const __CFString *)CFDictionaryGetTypedValue();
  if (!TypedValue)
    goto LABEL_53;
  v10 = TypedValue;
  if (CFStringCompare(TypedValue, CFSTR("_airplay._tcp."), 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v10, CFSTR("_raop._tcp."), 1uLL) == kCFCompareEqualTo)
  {
    Value = (const __CFData *)CFDictionaryGetValue(v4, CFSTR("txt"));
    if (Value)
    {
      v13 = Value;
      BytePtr = CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v13);
      if (TXTRecordGetValuePtr(Length, BytePtr, "srcvers", &valueLen)
        || TXTRecordGetValuePtr(Length, BytePtr, "vs", &valueLen))
      {
        LOBYTE(v11) = TextToSourceVersion() > 0x1B903F;
LABEL_34:
        self->_supportsTLV = v11;
        goto LABEL_35;
      }
      v16 = 4294960581;
LABEL_55:
      v26 = v16;
      goto LABEL_46;
    }
LABEL_53:
    v16 = 4294960534;
    goto LABEL_55;
  }
  if (CFStringCompare(v10, CFSTR("_mfi-config._tcp."), 1uLL) == kCFCompareEqualTo)
  {
    v11 = (BonjourDevice_GetInt64() >> 2) & 1;
    goto LABEL_34;
  }
  LOBYTE(v11) = 1;
  if (CFStringCompare(v10, CFSTR("_hap._tcp."), 1uLL) == kCFCompareEqualTo)
    goto LABEL_34;
LABEL_35:
  v16 = -[EasyConfigDevice _setupClient:](self, "_setupClient:", v4, v21, v22, v23, v24);
  v26 = v16;
  if (!(_DWORD)v16)
  {
    if (CFDictionaryGetInt64() && (self->_supportsHAP2 || self->_supportsPairSetup || !self->_supportsMFi))
      v17 = self->_skipPairSetup
          ? -[EasyConfigDevice _pairVerifyStart](self, "_pairVerifyStart")
          : -[EasyConfigDevice _pairSetupStart](self, "_pairSetupStart");
    else
      v17 = -[EasyConfigDevice _mfiSAPStart](self, "_mfiSAPStart");
    v16 = v17;
    v26 = v17;
    if (!(_DWORD)v17)
    {
      v19 = 0;
      goto LABEL_51;
    }
  }
LABEL_46:
  if (gLogCategory_EasyConfigDevice <= 60)
  {
    if (gLogCategory_EasyConfigDevice != -1 || (v18 = _LogCategory_Initialize(), v16 = v26, v18))
    {
      v21 = self->_deviceIdentifier;
      v22 = v16;
      LogPrintF();
      v16 = v26;
    }
  }
  -[EasyConfigDevice _handleError:](self, "_handleError:", v16, v21, v22);
  v19 = v26;
LABEL_51:

  return v19;
}

- (int)_mfiSAPStart
{
  uint64_t v3;
  unint64_t deviceIdentifier;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  self->_securityStartTime = CFAbsoluteTimeGetCurrent();
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 20, 0, deviceIdentifier);
  if (self->_mfiSAP)
  {
    MFiSAP_Delete();
    self->_mfiSAP = 0;
  }
  v3 = MFiSAP_Create();
  if ((_DWORD)v3
    || (v3 = -[EasyConfigDevice _mfiSAPNext:](self, "_mfiSAPNext:", 0), (_DWORD)v3)
    || (v9[0] = MEMORY[0x24BDAC760],
        v9[1] = 3221225472,
        v9[2] = __32__EasyConfigDevice__mfiSAPStart__block_invoke,
        v9[3] = &unk_24D1B9060,
        v9[4] = self,
        v3 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20, v9),
        (_DWORD)v3))
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      v7 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v3, v7, v3);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v3, v6, v8);
    }
  }
  return v3;
}

- (int)_mfiSAPNext:(HTTPMessagePrivate *)a3
{
  uint64_t var21;
  int var12;
  uint64_t v7;
  unint64_t deviceIdentifier;
  uint64_t v9;

  if (!a3)
    goto LABEL_4;
  var21 = a3->var21;
  if ((_DWORD)var21)
    goto LABEL_8;
  var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    var21 = (var12 + 200000);
  }
  else
  {
LABEL_4:
    var21 = MFiSAP_Exchange();
    if (!(_DWORD)var21)
    {
      var21 = HTTPMessageCreate();
      if (!(_DWORD)var21)
      {
        HTTPHeader_InitRequest();
        HTTPHeader_SetField();
        var21 = HTTPMessageSetBody();
        if (!(_DWORD)var21)
        {
          HTTPMessageSetCompletionBlock();
          var21 = HTTPClientSendMessage();
        }
      }
    }
  }
LABEL_8:
  if ((_DWORD)var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v7, v9);
    }
  }
  return var21;
}

- (int)_pairSetupStart
{
  PairingSessionPrivate *pairingSession;
  uint64_t v4;
  unint64_t deviceIdentifier;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  self->_securityStartTime = CFAbsoluteTimeGetCurrent();
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 20, 0, deviceIdentifier);
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  v4 = PairingSessionCreate();
  if ((_DWORD)v4)
    goto LABEL_23;
  if (self->_supportsHAP || self->_supportsHAP2 || self->_supportsPairSetup)
  {
    LODWORD(v7) = 1;
    PairingSessionSetKeychainInfo();
  }
  if (self->_pairSetupFlags)
    PairingSessionSetFlags();
  PairingSessionSetLogging();
  v4 = -[EasyConfigDevice _pairSetupNext:](self, "_pairSetupNext:", 0);
  if ((_DWORD)v4)
  {
LABEL_23:
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      v8 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v8, v4);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v7, v9);
    }
  }
  return v4;
}

- (int)_pairSetupNext:(HTTPMessagePrivate *)a3
{
  uint64_t var21;
  int var12;
  unsigned int v6;
  uint64_t v7;
  const char *v9;
  unint64_t deviceIdentifier;
  uint64_t v11;
  _QWORD v12[10];
  CFTypeRef v13;
  char v14;
  uint64_t v15;
  void *v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13 = 0;
  if (!a3)
    goto LABEL_4;
  var21 = a3->var21;
  if ((_DWORD)var21)
    goto LABEL_10;
  var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    var21 = (var12 + 200000);
  }
  else
  {
LABEL_4:
    v6 = PairingSessionExchange();
    if (v6)
    {
      if (v6 == -6771)
        var21 = 0;
      else
        var21 = v6;
    }
    else
    {
      var21 = HTTPMessageCreate();
      if (!(_DWORD)var21)
      {
        v9 = "pair-setup";
        HTTPHeader_InitRequestF();
        var21 = HTTPMessageSetBody();
        if (!(_DWORD)var21)
        {
          v7 = MEMORY[0x24BDAC760];
          v12[5] = MEMORY[0x24BDAC760];
          v12[6] = 3221225472;
          v12[7] = __35__EasyConfigDevice__pairSetupNext___block_invoke;
          v12[8] = &unk_24D1B90D8;
          v12[9] = self;
          HTTPMessageSetCompletionBlock();
          var21 = HTTPClientSendMessage();
          if (!(_DWORD)var21)
          {
            if (self->_timeoutTimer)
            {
              var21 = 0;
            }
            else
            {
              v12[0] = v7;
              v12[1] = 3221225472;
              v12[2] = __35__EasyConfigDevice__pairSetupNext___block_invoke_2;
              v12[3] = &unk_24D1B9060;
              v12[4] = self;
              var21 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20, v12, "pair-setup");
            }
          }
        }
      }
    }
  }
LABEL_10:
  if (v13)
    CFRelease(v13);
  if (v16)
    free(v16);
  if ((_DWORD)var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v9, v11);
    }
  }
  return var21;
}

- (int)_pairVerifyStart
{
  PairingSessionPrivate *pairingSession;
  uint64_t v4;
  unint64_t deviceIdentifier;
  unint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  __int128 v10;
  _OWORD v11[3];

  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  v10 = 0u;
  memset(v11, 0, sizeof(v11));
  v9[5] = self;
  if (self->_hasPairingDelegate)
  {
    *(_OWORD *)((char *)v11 + 8) = *(_OWORD *)&self->_pairingDelegate.copyIdentity_f;
    *((_QWORD *)&v11[1] + 1) = self->_pairingDelegate.savePeer_f;
  }
  v4 = PairingSessionCreate();
  if ((_DWORD)v4)
    goto LABEL_26;
  if (self->_supportsHAP || self->_supportsHAP2 || self->_supportsPairSetup)
  {
    LODWORD(deviceIdentifier) = 1;
    PairingSessionSetKeychainInfo();
  }
  if (self->_pairVerifyFlags)
    PairingSessionSetFlags();
  PairingSessionSetLogging();
  v4 = -[EasyConfigDevice _pairVerifyNext:](self, "_pairVerifyNext:", 0);
  if ((_DWORD)v4
    || (v9[0] = MEMORY[0x24BDAC760],
        v9[1] = 3221225472,
        v9[2] = __36__EasyConfigDevice__pairVerifyStart__block_invoke,
        v9[3] = &unk_24D1B9060,
        v9[4] = self,
        v4 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20, v9),
        (_DWORD)v4))
  {
LABEL_26:
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      v7 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, v7, v4);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v4, deviceIdentifier, v8);
    }
  }
  return v4;
}

- (int)_pairVerifyNext:(HTTPMessagePrivate *)a3
{
  uint64_t var21;
  int var12;
  const char *v7;
  unint64_t deviceIdentifier;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    goto LABEL_4;
  var21 = a3->var21;
  if ((_DWORD)var21)
    goto LABEL_5;
  var12 = a3->var2.var12;
  if ((var12 - 200) >= 0x64)
  {
    var21 = (var12 + 200000);
  }
  else
  {
LABEL_4:
    var21 = PairingSessionExchange();
    if (!(_DWORD)var21)
    {
      var21 = HTTPMessageCreate();
      if (!(_DWORD)var21)
      {
        v7 = "pair-verify";
        HTTPHeader_InitRequestF();
        var21 = HTTPMessageSetBody();
        if (!(_DWORD)var21)
        {
          HTTPMessageSetCompletionBlock();
          var21 = HTTPClientSendMessage();
        }
      }
    }
  }
LABEL_5:
  if ((_DWORD)var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v7, v9);
    }
  }
  return var21;
}

- (int)_applyConfigStart
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v13;
  unint64_t deviceIdentifier;
  uint64_t v15;
  _QWORD v16[10];
  uint64_t v17;
  _BYTE *v18;
  unsigned int v19;

  v19 = 0;
  v17 = 0;
  v18 = 0;
  self->_applyConfigStartTime = CFAbsoluteTimeGetCurrent();
  if (self->_supportsTLV)
  {
    v3 = EasyConfigCreateTLVfromDictionary((const __CFDictionary *)self->_configuration, (uint64_t)&v17, &v19);
    v4 = 0;
    if (v19)
    {
      v5 = (void *)v3;
      goto LABEL_8;
    }
    v7 = "application/x-tlv8";
    v5 = (void *)v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", self->_configuration, 200, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v4 = 0;
      v19 = -6732;
      goto LABEL_10;
    }
    v4 = objc_retainAutorelease(v6);
    objc_msgSend(v4, "bytes");
    v5 = 0;
    v17 = objc_msgSend(v4, "length");
    v7 = "application/octet-stream";
  }
  v19 = HTTPMessageCreate();
  if (!v19)
  {
    HTTPHeader_InitRequest();
    HTTPHeader_SetField();
    deviceIdentifier = (unint64_t)v7;
    HTTPHeader_SetField();
    if (self->_mfiSAP)
    {
      v19 = HTTPMessageSetBodyLength();
      if (v19)
        goto LABEL_8;
      v10 = MFiSAP_Encrypt();
    }
    else
    {
      v10 = HTTPMessageSetBody();
    }
    v19 = v10;
    if (!v10)
    {
      v13 = MEMORY[0x24BDAC760];
      v16[5] = MEMORY[0x24BDAC760];
      v16[6] = 3221225472;
      v16[7] = __37__EasyConfigDevice__applyConfigStart__block_invoke;
      v16[8] = &unk_24D1B90D8;
      v16[9] = self;
      HTTPMessageSetCompletionBlock();
      v18[8512] = 1;
      v19 = HTTPClientSendMessage();
      if (!v19)
      {
        v16[0] = v13;
        v16[1] = 3221225472;
        v16[2] = __37__EasyConfigDevice__applyConfigStart__block_invoke_2;
        v16[3] = &unk_24D1B9060;
        v16[4] = self;
        v19 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20, v16, v7);
        if (!v19)
        {
          if (gLogCategory_EasyConfigDevice <= 30
            && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
          {
            deviceIdentifier = self->_deviceIdentifier;
            LogPrintF();
          }
          -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 30, 0, deviceIdentifier);
        }
      }
    }
  }
LABEL_8:
  if (v5)
    free(v5);
LABEL_10:
  if (v18)
    CFRelease(v18);
  v8 = v19;
  if (v19)
  {
    if (gLogCategory_EasyConfigDevice <= 60)
    {
      if (gLogCategory_EasyConfigDevice != -1 || (v11 = _LogCategory_Initialize(), v8 = v19, v11))
      {
        deviceIdentifier = self->_deviceIdentifier;
        v15 = v8;
        LogPrintF();
        v8 = v19;
      }
    }
    -[EasyConfigDevice _handleError:](self, "_handleError:", v8, deviceIdentifier, v15);
    v9 = v19;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_applyConfigCompletion:(HTTPMessagePrivate *)a3
{
  uint64_t var21;
  int var12;
  NSDictionary *DictionaryFromTLV;
  NSDictionary *configResponse;
  OS_dispatch_source *timeoutTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  int v12;
  int v13;
  unint64_t deviceIdentifier;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  v18 = 0;
  var21 = a3->var21;
  if ((_DWORD)var21)
  {
    v18 = var21;
  }
  else
  {
    var12 = a3->var2.var12;
    if ((var12 - 200) >= 0x64)
    {
      v13 = var12 + 196608;
      var21 = (v13 + 3392);
      v18 = v13 + 3392;
      if (v13 == -3392)
        return;
    }
    else if (!self->_mfiSAP || (var21 = MFiSAP_Decrypt(), (v18 = var21) == 0))
    {
      CFDictionaryGetTypeID();
      DictionaryFromTLV = (NSDictionary *)CFCreateWithPlistBytes();
      if (!DictionaryFromTLV)
      {
        DictionaryFromTLV = (NSDictionary *)EasyConfigCreateDictionaryFromTLV((uint64_t)a3->var6, a3->var7, (int *)&v18);
        if (!DictionaryFromTLV)
          goto LABEL_20;
      }
      configResponse = self->_configResponse;
      self->_configResponse = DictionaryFromTLV;

      self->_applyConfigFinishTime = CFAbsoluteTimeGetCurrent();
      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }
      -[EasyConfigDevice _postProgress:withResponse:](self, "_postProgress:withResponse:", 40, self->_configResponse, deviceIdentifier);
      if (self->_pausesAfterApply)
      {
        timeoutTimer = self->_timeoutTimer;
        if (timeoutTimer)
        {
          v10 = timeoutTimer;
          dispatch_source_cancel(v10);
          v11 = self->_timeoutTimer;
          self->_timeoutTimer = 0;

        }
        if (gLogCategory_EasyConfigDevice <= 30
          && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
LABEL_20:
        var21 = v18;
        if (!v18)
          return;
        goto LABEL_21;
      }
      var21 = -[EasyConfigDevice _findDevicePostConfigStart](self, "_findDevicePostConfigStart");
      v18 = var21;
      if (!(_DWORD)var21)
        return;
    }
  }
LABEL_21:
  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || (v12 = _LogCategory_Initialize(), var21 = v18, v12)))
  {
    v15 = self->_deviceIdentifier;
    v17 = var21;
    LogPrintF();
    -[EasyConfigDevice _handleError:](self, "_handleError:", v18, v15, v17);
  }
  else
  {
    -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, v16);
  }
}

- (int)_findDevicePostConfigStart
{
  double Current;
  uint64_t v4;
  uint64_t v5;
  unint64_t deviceIdentifier;
  unint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  self->_state = 3;
  Current = CFAbsoluteTimeGetCurrent();
  v4 = MEMORY[0x24BDAC760];
  self->_findPostConfigStartTime = Current;
  self->_findPostConfigFoundTime = Current;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __46__EasyConfigDevice__findDevicePostConfigStart__block_invoke;
  v10[3] = &unk_24D1B90B0;
  v10[4] = self;
  v5 = -[EasyConfigDevice _startBonjourWithTimeout:handler:](self, "_startBonjourWithTimeout:handler:", 60, v10);
  if ((_DWORD)v5)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      deviceIdentifier = self->_deviceIdentifier;
      v9 = v5;
      LogPrintF();
    }
    -[EasyConfigDevice _handleError:](self, "_handleError:", v5, deviceIdentifier, v9);
  }
  else if (gLogCategory_EasyConfigDevice <= 30
         && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    v8 = self->_deviceIdentifier;
    LogPrintF();
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 50, 0, v8);
  }
  else
  {
    -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 50, 0, deviceIdentifier);
  }
  return v5;
}

- (void)_findDevicePostConfigEvent:(unsigned int)a3 info:(id)a4
{
  id v6;
  uint64_t Int64;
  void *v8;
  uint64_t v9;
  unint64_t deviceIdentifier;
  unint64_t v11;
  uint64_t v12;
  uint64_t configSeed;
  uint64_t v14;

  v6 = a4;
  if (a3 != 1
    || !self->_started
    || !self->_airplayBrowser && !self->_raopBrowser && !self->_mfiConfigBrowser && !self->_hapBrowser
    || BonjourDevice_GetDeviceID() != self->_deviceIdentifier)
  {
    goto LABEL_34;
  }
  Int64 = BonjourDevice_GetInt64();
  if (self->_configSeed != (_DWORD)Int64)
    goto LABEL_21;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("_hap._tcp.")))
  {
    v9 = BonjourDevice_GetInt64();
    if ((v9 & 2) == 0)
    {
      if (gLogCategory_EasyConfigDevice <= 40
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        v12 = Int64;
        v14 = v9;
        deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }

LABEL_21:
      self->_findPostConfigFoundTime = CFAbsoluteTimeGetCurrent();
      if (self->_airplayBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_airplayBrowser);
        self->_airplayBrowser = 0;
      }
      if (self->_raopBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_raopBrowser);
        self->_raopBrowser = 0;
      }
      if (self->_mfiConfigBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_mfiConfigBrowser);
        self->_mfiConfigBrowser = 0;
      }
      if (self->_hapBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_hapBrowser);
        self->_hapBrowser = 0;
      }
      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        configSeed = self->_configSeed;
        v11 = self->_deviceIdentifier;
        LogPrintF();
        -[EasyConfigDevice _postConfigCheckStart:](self, "_postConfigCheckStart:", v6, v11, configSeed, Int64);
      }
      else
      {
        -[EasyConfigDevice _postConfigCheckStart:](self, "_postConfigCheckStart:", v6, deviceIdentifier, v12, v14);
      }
      goto LABEL_34;
    }
  }
  if (gLogCategory_EasyConfigDevice <= 40
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

LABEL_34:
}

- (void)_postConfigCheckStart:(id)a3
{
  id v4;
  double Current;
  uint64_t v6;
  uint64_t v7;
  unint64_t deviceIdentifier;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[10];
  _BYTE *v13;

  v13 = 0;
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  self->_postConfigCheckStartTime = Current;
  self->_postConfigCheckFinishTime = Current;
  if (gLogCategory_EasyConfigDevice <= 30
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 60, 0, deviceIdentifier);
  v6 = -[EasyConfigDevice _setupClient:](self, "_setupClient:", v4);

  if (!(_DWORD)v6)
  {
    v6 = HTTPMessageCreate();
    if (!(_DWORD)v6)
    {
      HTTPHeader_InitRequest();
      HTTPHeader_SetField();
      v7 = MEMORY[0x24BDAC760];
      v12[5] = MEMORY[0x24BDAC760];
      v12[6] = 3221225472;
      v12[7] = __42__EasyConfigDevice__postConfigCheckStart___block_invoke;
      v12[8] = &unk_24D1B90D8;
      v12[9] = self;
      HTTPMessageSetCompletionBlock();
      v13[8512] = 1;
      v6 = HTTPClientSendMessage();
      if (!(_DWORD)v6)
      {
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __42__EasyConfigDevice__postConfigCheckStart___block_invoke_2;
        v12[3] = &unk_24D1B9060;
        v12[4] = self;
        v6 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 20, v12);
      }
    }
  }
  if (v13)
    CFRelease(v13);
  if ((_DWORD)v6)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      v10 = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", v6, v10, v6);
    }
    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", v6, v9, v11);
    }
  }
}

- (void)_postConfigCheckCompletion:(HTTPMessagePrivate *)a3
{
  uint64_t var21;
  int var12;
  unint64_t deviceIdentifier;

  self->_postConfigCheckFinishTime = CFAbsoluteTimeGetCurrent();
  var21 = a3->var21;
  if (!(_DWORD)var21)
  {
    var12 = a3->var2.var12;
    if ((var12 - 300) >= 0xFFFFFF9C)
    {
      if (gLogCategory_EasyConfigDevice <= 30
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        deviceIdentifier = self->_deviceIdentifier;
        LogPrintF();
      }
      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 70, 0, deviceIdentifier);
      -[EasyConfigDevice _postProgress:info:](self, "_postProgress:info:", 100, 0);
      -[EasyConfigDevice _stop:](self, "_stop:", 0);
      return;
    }
    var21 = (var12 + 200000);
    if (var12 == -200000)
      return;
  }
  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[EasyConfigDevice _handleError:](self, "_handleError:", var21);
}

- (void)_handleError:(int)a3
{
  uint64_t v3;
  double v5;
  _QWORD v6[5];

  v3 = *(_QWORD *)&a3;
  v5 = CFAbsoluteTimeGetCurrent() - self->_configStartTime;
  if (gLogCategory_EasyConfigDevice <= 40
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_firstErr)
    self->_firstErr = v3;
  if ((self->_state - 1) <= 1)
  {
    if (v5 >= 120.0)
    {
      if (gLogCategory_EasyConfigDevice <= 60
        && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __33__EasyConfigDevice__handleError___block_invoke;
      v6[3] = &unk_24D1B9060;
      v6[4] = self;
      v3 = -[EasyConfigDevice _timeoutTimerStart:block:](self, "_timeoutTimerStart:block:", 5, v6);
    }
  }
  if ((_DWORD)v3)
    -[EasyConfigDevice _stop:](self, "_stop:", v3);
}

- (void)_logEnded
{
  CFAbsoluteTimeGetCurrent();
  if (gLogCategory_EasyConfigDevice <= 50
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_postNote:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *userQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  EasyConfigDevice *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  userQueue = self->_userQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__EasyConfigDevice__postNote_info___block_invoke;
  block[3] = &unk_24D1B9100;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(userQueue, block);

}

- (void)_postProgress:(int)a3 info:(id)a4
{
  id v6;
  NSObject *userQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  userQueue = self->_userQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__EasyConfigDevice__postProgress_info___block_invoke;
  block[3] = &unk_24D1B9128;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(userQueue, block);

}

- (void)_postProgress:(int)a3 withResponse:(id)a4
{
  id v6;
  NSObject *userQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  userQueue = self->_userQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__EasyConfigDevice__postProgress_withResponse___block_invoke;
  block[3] = &unk_24D1B9128;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(userQueue, block);

}

- (int)_setupClient:(id)a3
{
  id v4;
  HTTPClientPrivate **p_httpClient;
  int DNSName;

  v4 = a3;
  p_httpClient = &self->_httpClient;
  if (self->_httpClient)
  {
    HTTPClientInvalidate();
    CFRelease(*p_httpClient);
    *p_httpClient = 0;
  }
  DNSName = HTTPClientCreate();
  if (DNSName
    || (HTTPClientSetDispatchQueue(),
        HTTPClientSetFlags(),
        HTTPClientSetLogging(),
        (DNSName = BonjourDevice_GetDNSName()) != 0)
    || (DNSName = HTTPClientSetDestination()) != 0)
  {
    if (*p_httpClient)
    {
      HTTPClientInvalidate();
      CFRelease(*p_httpClient);
      *p_httpClient = 0;
    }
  }

  return DNSName;
}

- (int)_startBonjourWithTimeout:(int)a3 handler:(id)a4
{
  uint64_t v4;
  id v6;
  BonjourBrowser **p_hapBrowser;
  int v8;
  EasyConfigDevice *v9;
  BonjourBrowser **p_airplayBrowser;
  EasyConfigDevice *v11;
  CFTypeRef *p_raopBrowser;
  EasyConfigDevice *v13;
  CFTypeRef *p_mfiConfigBrowser;
  _QWORD v16[5];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (!self->_supportsHAP2)
  {
    p_airplayBrowser = &self->_airplayBrowser;
    if (self->_airplayBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_airplayBrowser);
      *p_airplayBrowser = 0;
    }
    v8 = BonjourBrowser_Create();
    if (v8)
      goto LABEL_20;
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    v8 = BonjourBrowser_Start();
    if (v8)
      goto LABEL_20;
    v11 = self;

    p_raopBrowser = (CFTypeRef *)&v11->_raopBrowser;
    if (v11->_raopBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_raopBrowser);
      *p_raopBrowser = 0;
    }
    v8 = BonjourBrowser_Create();
    if (v8)
      goto LABEL_20;
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    v8 = BonjourBrowser_Start();
    if (v8)
      goto LABEL_20;
    v13 = v11;

    p_mfiConfigBrowser = (CFTypeRef *)&v13->_mfiConfigBrowser;
    if (v13->_mfiConfigBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_mfiConfigBrowser);
      *p_mfiConfigBrowser = 0;
    }
    v8 = BonjourBrowser_Create();
    if (v8)
      goto LABEL_20;
    BonjourBrowser_SetDispatchQueue();
    BonjourBrowser_SetEventHandlerBlock();
    v8 = BonjourBrowser_Start();
    if (v8)
      goto LABEL_20;

  }
  p_hapBrowser = &self->_hapBrowser;
  if (self->_hapBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(*p_hapBrowser);
    *p_hapBrowser = 0;
  }
  v8 = BonjourBrowser_Create();
  if (v8)
    goto LABEL_20;
  BonjourBrowser_SetDispatchQueue();
  BonjourBrowser_SetEventHandlerBlock();
  v8 = BonjourBrowser_Start();
  if (v8)
    goto LABEL_20;
  v9 = self;

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__EasyConfigDevice__startBonjourWithTimeout_handler___block_invoke;
  v16[3] = &unk_24D1B9060;
  v16[4] = v9;
  v8 = -[EasyConfigDevice _timeoutTimerStart:block:](v9, "_timeoutTimerStart:block:", v4, v16);
  if (v8)
  {
LABEL_20:
    if (self->_airplayBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_airplayBrowser);
      self->_airplayBrowser = 0;
    }
    if (self->_raopBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_raopBrowser);
      self->_raopBrowser = 0;
    }
    if (self->_mfiConfigBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_mfiConfigBrowser);
      self->_mfiConfigBrowser = 0;
    }
    if (self->_hapBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(self->_hapBrowser);
      self->_hapBrowser = 0;
    }
  }

  return v8;
}

- (int)_timeoutTimerStart:(int)a3 block:(id)a4
{
  id v6;
  OS_dispatch_source *timeoutTimer;
  id *p_timeoutTimer;
  NSObject *v9;
  id v10;
  dispatch_source_t v11;
  dispatch_time_t v12;
  int v13;

  v6 = a4;
  p_timeoutTimer = (id *)&self->_timeoutTimer;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    v10 = *p_timeoutTimer;
    *p_timeoutTimer = 0;

  }
  v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_internalQueue);
  objc_storeStrong(p_timeoutTimer, v11);
  if (v11)
  {
    dispatch_source_set_event_handler(v11, v6);
    v12 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(v11);
    v13 = 0;
  }
  else
  {
    v13 = -6700;
  }

  return v13;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (unint64_t)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(unint64_t)a3
{
  self->_deviceIdentifier = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_userQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_userQueue, a3);
}

- (unint64_t)features
{
  return self->_features;
}

- (void)setFeatures:(unint64_t)a3
{
  self->_features = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (BOOL)pausesAfterApply
{
  return self->_pausesAfterApply;
}

- (void)setPausesAfterApply:(BOOL)a3
{
  self->_pausesAfterApply = a3;
}

- (BOOL)skipPairSetup
{
  return self->_skipPairSetup;
}

- (void)setSkipPairSetup:(BOOL)a3
{
  self->_skipPairSetup = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_configResponse, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong(&self->_promptForSetupCodeBlock, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_hapBonjourInfo, 0);
  objc_storeStrong((id *)&self->_mfiConfigBonjourInfo, 0);
  objc_storeStrong((id *)&self->_raopBonjourInfo, 0);
  objc_storeStrong((id *)&self->_airplayBonjourInfo, 0);
  objc_storeStrong((id *)&self->_scanRecord, 0);
  objc_storeStrong((id *)&self->_userQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

uint64_t __53__EasyConfigDevice__startBonjourWithTimeout_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleError:", 4294960574);
}

void __47__EasyConfigDevice__postProgress_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496);
  if (v2)
  {
    v3 = *(unsigned int *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 40);
    v14 = CFSTR("EasyConfigKey_Response");
    v15[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v5);

  }
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 496);
    *(_QWORD *)(v6 + 496) = 0;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v12[0] = CFSTR("EasyConfigKey_Progress");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("EasyConfigKey_Response");
  v13[0] = v10;
  v13[1] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("EasyConfigDeviceProgressNotification"), v9, v11);

}

void __39__EasyConfigDevice__postProgress_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 496);
    *(_QWORD *)(v3 + 496) = 0;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v9 = CFSTR("EasyConfigKey_Progress");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("EasyConfigDeviceProgressNotification"), v6, v8);

}

void __35__EasyConfigDevice__postNote_info___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], a1[5], a1[6]);

}

uint64_t __33__EasyConfigDevice__handleError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findDevicePreConfigStart");
}

uint64_t __42__EasyConfigDevice__postConfigCheckStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postConfigCheckCompletion:", a2);
}

uint64_t __42__EasyConfigDevice__postConfigCheckStart___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleError:", 4294960574);
}

uint64_t __46__EasyConfigDevice__findDevicePostConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findDevicePostConfigEvent:info:", a2, a3);
}

uint64_t __37__EasyConfigDevice__applyConfigStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyConfigCompletion:", a2);
}

uint64_t __37__EasyConfigDevice__applyConfigStart__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleError:", 4294960574);
}

uint64_t __36__EasyConfigDevice__pairVerifyNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifyNext:", a2);
}

uint64_t __36__EasyConfigDevice__pairVerifyStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleError:", 4294960574);
}

uint64_t __35__EasyConfigDevice__pairSetupNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupNext:", a2);
}

uint64_t __35__EasyConfigDevice__pairSetupNext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleError:", 4294960574);
}

uint64_t __32__EasyConfigDevice__mfiSAPNext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mfiSAPNext:", a2);
}

uint64_t __32__EasyConfigDevice__mfiSAPStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleError:", 4294960574);
}

uint64_t __45__EasyConfigDevice__findDevicePreConfigStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findDevicePreConfigEvent:info:", a2, a3);
}

uint64_t __33__EasyConfigDevice_trySetupCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trySetupCode:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__EasyConfigDevice_resumePostConfig__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 232))
  {
    v1 = result;
    if (gLogCategory_EasyConfigDevice <= 30
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v1 + 32), "_findDevicePostConfigStart");
  }
  else if (gLogCategory_EasyConfigDevice <= 60)
  {
    if (gLogCategory_EasyConfigDevice != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t __24__EasyConfigDevice_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop:", 4294960573);
}

uint64_t __25__EasyConfigDevice_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

+ (BOOL)supportedScanRecord:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("IE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
    goto LABEL_5;
  objc_msgSend(objc_retainAutorelease(v4), "bytes");
  v5 = IEGetVendorSpecific();
  if (!v5)
  {
    TLV8Get();
LABEL_5:
    v5 = -6727;
  }
  v6 = v5 == 0;

  return v6;
}

+ (id)deviceWithInfo:(id)a3
{
  NSDictionary *v3;
  EasyConfigDevice *v4;
  NSDictionary *deviceInfo;

  v3 = (NSDictionary *)a3;
  v4 = objc_alloc_init(EasyConfigDevice);
  deviceInfo = v4->_deviceInfo;
  v4->_deviceInfo = v3;

  return v4;
}

+ (id)deviceWithScanRecord:(id)a3
{
  NSDictionary *v3;
  EasyConfigDevice *v4;
  NSDictionary *scanRecord;

  v3 = (NSDictionary *)a3;
  v4 = objc_alloc_init(EasyConfigDevice);
  scanRecord = v4->_scanRecord;
  v4->_scanRecord = v3;

  return v4;
}

@end
