@implementation DiagExtWifiScanner

- (DiagExtWifiScanner)initWithDelegate:(id)a3
{
  id v3;
  DiagExtWifiScanner *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DiagExtWifiScanner;
  v3 = a3;
  v4 = -[DiagExtWifiScanner init](&v6, "init");
  -[DiagExtWifiScanner setDelegate:](v4, "setDelegate:", v3, v6.receiver, v6.super_class);

  -[DiagExtWifiScanner setFWaitForResult:](v4, "setFWaitForResult:", 0);
  -[DiagExtWifiScanner setFAvailabilityState:](v4, "setFAvailabilityState:", 0);
  v4->fWifiManagerRef = 0;
  v4->fWifiDeviceRef = 0;
  v4->fIsMonitoring = 0;
  -[DiagExtWifiScanner startRunLoop_sync](v4, "startRunLoop_sync");
  return v4;
}

- (void)startRunLoop_sync
{
  _QWORD *v3;
  os_log_s *v4;
  uint8_t v5[8];
  _QWORD v6[5];

  -[DiagExtWifiScanner setFWaitForResult:](self, "setFWaitForResult:", dispatch_semaphore_create(0));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000090CC;
  v6[3] = &unk_1000104F8;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Create Runloop", v5, 2u);
  }
  pthread_create(&self->fServerRunLoopThread, 0, (void *(__cdecl *)(void *))sub_10000910C, v3);
  dispatch_semaphore_wait((dispatch_semaphore_t)-[DiagExtWifiScanner fWaitForResult](self, "fWaitForResult"), 0xFFFFFFFFFFFFFFFFLL);

}

- (void)dealloc
{
  os_log_s *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)DiagExtWifiScanner;
  -[DiagExtWifiScanner dealloc](&v4, "dealloc");
}

- (BOOL)setupWifiManagerClient
{
  os_log_s *v3;
  __WiFiDeviceClient *v4;
  void *v6;
  __CFRunLoop *Current;
  os_log_s *v8;
  const char *v9;
  const char *v10;
  int v11;
  const char *v12;

  if (self->fWifiManagerRef)
    goto LABEL_4;
  self->fWifiManagerRef = (__WiFiManagerClient *)WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    if (self->fWifiManagerRef)
      v10 = "Success";
    else
      v10 = "Failed";
    v11 = 136315138;
    v12 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: setup manager client %s", (uint8_t *)&v11, 0xCu);
    if (!self->fWifiManagerRef)
      goto LABEL_5;
LABEL_4:
    if (self->fWifiDeviceRef)
      goto LABEL_5;
    v6 = (void *)WiFiManagerClientCopyDevices();
    if (objc_msgSend(v6, "count"))
    {
      v4 = (__WiFiDeviceClient *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));

      if (v4)
      {
        self->fWifiDeviceRef = v4;
        CFRetain(v4);
        WiFiManagerClientScheduleWithRunLoop(self->fWifiManagerRef, -[DiagExtWifiScanner fServerRunLoopRef](self, "fServerRunLoopRef"), kCFRunLoopDefaultMode);
        Current = CFRunLoopGetCurrent();
        CFRunLoopWakeUp(Current);
        LOBYTE(v4) = 1;
        v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
        if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        goto LABEL_14;
      }
    }
    else
    {
      v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: No device available", (uint8_t *)&v11, 2u);
        LOBYTE(v4) = 0;
        v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
        if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        goto LABEL_14;
      }
      LOBYTE(v4) = 0;
    }
    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      return (char)v4;
    }
LABEL_14:
    if (self->fWifiDeviceRef)
      v9 = "Success";
    else
      v9 = "Failed";
    v11 = 136315138;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: setup device client %s", (uint8_t *)&v11, 0xCu);
    goto LABEL_18;
  }
  if (self->fWifiManagerRef)
    goto LABEL_4;
LABEL_5:
  LOBYTE(v4) = 0;
  return (char)v4;
}

- (void)releaseWifiManagerClient
{
  __WiFiManagerClient *fWifiManagerRef;
  os_log_s *v4;
  __WiFiDeviceClient *fWifiDeviceRef;
  os_log_s *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  fWifiManagerRef = self->fWifiManagerRef;
  if (fWifiManagerRef)
  {
    WiFiManagerClientUnscheduleFromRunLoop(fWifiManagerRef, -[DiagExtWifiScanner fServerRunLoopRef](self, "fServerRunLoopRef"), kCFRunLoopDefaultMode);
    CFRelease(self->fWifiManagerRef);
    self->fWifiManagerRef = 0;
    v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: release manager client", buf, 2u);
    }
  }
  fWifiDeviceRef = self->fWifiDeviceRef;
  if (fWifiDeviceRef)
  {
    CFRelease(fWifiDeviceRef);
    self->fWifiDeviceRef = 0;
    v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: release device client", v7, 2u);
    }
  }
}

- (void)setTimeForNextScan
{
  os_log_s *v3;
  NSTimer *fScanTimer;
  NSTimer *v5;
  NSTimer *v6;
  uint8_t v7[16];

  if (-[DiagExtWifiScanner fIsScanning](self, "fIsScanning"))
  {
    v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Device is already scanning for networks", v7, 2u);
    }
  }
  else
  {
    fScanTimer = self->fScanTimer;
    if (fScanTimer)
      -[NSTimer invalidate](fScanTimer, "invalidate");
    -[DiagExtWifiScanner fScanIntervalInSec](self, "fScanIntervalInSec");
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "startWiFiNetworkScan", 0, 0));
    v6 = self->fScanTimer;
    self->fScanTimer = v5;

  }
}

- (int)scanAndGetWifiAvailability:(unsigned int)a3
{
  dispatch_semaphore_s *v6;
  dispatch_time_t v7;
  os_log_s *v8;
  int v9;
  os_log_s *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (self->fIsMonitoring)
    return -[DiagExtWifiScanner fAvailabilityState](self, "fAvailabilityState", *(_QWORD *)&a3);
  -[DiagExtWifiScanner setFScanRepeatRequired:](self, "setFScanRepeatRequired:", 0);
  if (-[DiagExtWifiScanner startWiFiNetworkScan](self, "startWiFiNetworkScan"))
  {
    -[DiagExtWifiScanner setFWaitForResult:](self, "setFWaitForResult:", dispatch_semaphore_create(0));
    v6 = -[DiagExtWifiScanner fWaitForResult](self, "fWaitForResult");
    v7 = dispatch_time(0, 1000000000 * a3);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)v6, v7))
    {
      -[DiagExtWifiScanner stopWiFiNetworkScan](self, "stopWiFiNetworkScan");
      v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      v9 = 0;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Failed to get wifi scan reseult in time", v11, 2u);
        v9 = 0;
      }
    }
    else
    {
      v9 = -[DiagExtWifiScanner fAvailabilityState](self, "fAvailabilityState");
    }
    -[DiagExtWifiScanner setFWaitForResult:](self, "setFWaitForResult:", 0);
    return v9;
  }
  else
  {
    v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Failed to start", buf, 2u);
    }
    return 0;
  }
}

- (BOOL)startMonitoring:(double)a3
{
  _BOOL4 fIsMonitoring;
  os_log_s *v6;
  _BOOL4 v7;
  BOOL v8;
  int v10;
  double v11;

  fIsMonitoring = self->fIsMonitoring;
  v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  v7 = os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT);
  if (fIsMonitoring)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: already running", (uint8_t *)&v10, 2u);
    }
    return 1;
  }
  else
  {
    if (v7)
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Start monitoring w/ scan interval=%lf", (uint8_t *)&v10, 0xCu);
    }
    -[DiagExtWifiScanner setFScanIntervalInSec:](self, "setFScanIntervalInSec:", a3);
    v8 = 1;
    -[DiagExtWifiScanner setFScanRepeatRequired:](self, "setFScanRepeatRequired:", 1);
    if (-[DiagExtWifiScanner startWiFiNetworkScan](self, "startWiFiNetworkScan"))
      self->fIsMonitoring = 1;
    else
      return 0;
  }
  return v8;
}

- (void)stopMonitoring
{
  os_log_s *v3;
  uint8_t v4[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Stop monitoring", v4, 2u);
  }
  -[DiagExtWifiScanner stopWiFiNetworkScan](self, "stopWiFiNetworkScan");
  self->fIsMonitoring = 0;
}

- (void)stopWiFiNetworkScan
{
  os_log_s *v3;
  NSTimer *fScanTimer;
  uint8_t v5[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Stop wifi scanning", v5, 2u);
  }
  if (self->fWifiDeviceRef)
    WiFiDeviceClientScanCancel();
  fScanTimer = self->fScanTimer;
  if (fScanTimer)
    -[NSTimer invalidate](fScanTimer, "invalidate");
  -[DiagExtWifiScanner setFIsScanning:](self, "setFIsScanning:", 0);
}

- (void)wifiScanCompleted:(__CFArray *)a3 withError:(int)a4
{
  os_log_s *v6;
  int Count;
  __int128 v9;
  CFIndex v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  const void *ValueAtIndex;
  uint64_t SSID;
  void *v16;
  os_log_s *v17;
  id v18;
  uint64_t v19;
  os_log_s *v20;
  void *v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;

  if (a4)
  {
    v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler", a3);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = a4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan finished with error 0x%x", buf, 8u);
      -[DiagExtWifiScanner setFIsScanning:](self, "setFIsScanning:", 0);
      if (-[DiagExtWifiScanner fScanRepeatRequired](self, "fScanRepeatRequired"))
        goto LABEL_26;
    }
    else
    {
      -[DiagExtWifiScanner setFIsScanning:](self, "setFIsScanning:", 0);
      if (-[DiagExtWifiScanner fScanRepeatRequired](self, "fScanRepeatRequired"))
        goto LABEL_26;
    }
LABEL_4:
    if (!-[DiagExtWifiScanner fWaitForResult](self, "fWaitForResult"))
      return;
    goto LABEL_5;
  }
  Count = CFArrayGetCount(a3);
  if (Count < 1)
  {
    v11 = 0;
    goto LABEL_22;
  }
  v10 = 0;
  v11 = 0;
  if (Count <= 1uLL)
    v12 = 1;
  else
    v12 = Count;
  *(_QWORD *)&v9 = 138412290;
  v22 = v9;
  do
  {
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v10);
      SSID = WiFiNetworkGetSSID(ValueAtIndex);
      v16 = (void *)objc_claimAutoreleasedReturnValue(SSID);
      v17 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
        break;
      v18 = v16;
      if (!objc_msgSend(v18, "length"))
        goto LABEL_15;
LABEL_12:
      v13 = objc_msgSend(v18, "isEqualToString:", CFSTR(" "), v22) ^ 1;

      v11 += v13;
      if (v12 == ++v10)
        goto LABEL_19;
    }
    *(_DWORD *)buf = v22;
    v24 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEBUG, "\tSSID=%@", buf, 0xCu);
    v18 = v16;
    if (objc_msgSend(v18, "length"))
      goto LABEL_12;
LABEL_15:

    ++v10;
  }
  while (v12 != v10);
LABEL_19:
  if (v11 > 0)
  {
    v19 = 2;
    goto LABEL_23;
  }
LABEL_22:
  v19 = 1;
LABEL_23:
  -[DiagExtWifiScanner setFAvailabilityState:](self, "setFAvailabilityState:", v19, v22);
  v20 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Scan finished and report %d networks", buf, 8u);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DiagExtWifiScanner delegate](self, "delegate"));
  objc_msgSend(v21, "handleWifiAvailabilityEvent:", -[DiagExtWifiScanner fAvailabilityState](self, "fAvailabilityState"));

  -[DiagExtWifiScanner setFIsScanning:](self, "setFIsScanning:", 0);
  if (!-[DiagExtWifiScanner fScanRepeatRequired](self, "fScanRepeatRequired"))
    goto LABEL_4;
LABEL_26:
  -[DiagExtWifiScanner setTimeForNextScan](self, "setTimeForNextScan");
  if (-[DiagExtWifiScanner fWaitForResult](self, "fWaitForResult"))
LABEL_5:
    dispatch_semaphore_signal((dispatch_semaphore_t)-[DiagExtWifiScanner fWaitForResult](self, "fWaitForResult"));
}

- (BOOL)startWiFiNetworkScan
{
  os_log_s *v3;
  BOOL v4;
  __WiFiDeviceClient *fWifiDeviceRef;
  int v7;
  int v8;
  os_log_s *v9;
  int v10;
  int v11;
  os_log_s *v12;
  int v13;
  int v14;
  os_log_s *v15;
  int v16;
  int v17;
  os_log_s *v18;
  int v19;
  int v20;
  os_log_s *v21;
  os_log_s *v22;
  os_log_s *v23;
  int v24;
  int v25;

  if (-[DiagExtWifiScanner fIsScanning](self, "fIsScanning"))
  {
    v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Scanning already in progress", (uint8_t *)&v24, 2u);
    }
    return 1;
  }
  fWifiDeviceRef = self->fWifiDeviceRef;
  if (!fWifiDeviceRef)
  {
    v23 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: no client", (uint8_t *)&v24, 2u);
    }
    return 0;
  }
  v7 = WiFiDeviceClientScanAsync(fWifiDeviceRef, +[NSDictionary dictionary](NSDictionary, "dictionary"), sub_10000A18C, self);
  if (v7)
  {
    v8 = v7;
    v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      v24 = 67109120;
      v25 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v24, 8u);
    }
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 2.0);
    v10 = WiFiDeviceClientScanAsync(self->fWifiDeviceRef, +[NSDictionary dictionary](NSDictionary, "dictionary"), sub_10000A18C, self);
    if (v10)
    {
      v11 = v10;
      v12 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        v24 = 67109120;
        v25 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v24, 8u);
      }
      +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 2.0);
      v13 = WiFiDeviceClientScanAsync(self->fWifiDeviceRef, +[NSDictionary dictionary](NSDictionary, "dictionary"), sub_10000A18C, self);
      if (v13)
      {
        v14 = v13;
        v15 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        {
          v24 = 67109120;
          v25 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v24, 8u);
        }
        +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 2.0);
        v16 = WiFiDeviceClientScanAsync(self->fWifiDeviceRef, +[NSDictionary dictionary](NSDictionary, "dictionary"), sub_10000A18C, self);
        if (v16)
        {
          v17 = v16;
          v18 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            v24 = 67109120;
            v25 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v24, 8u);
          }
          +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 2.0);
          v19 = WiFiDeviceClientScanAsync(self->fWifiDeviceRef, +[NSDictionary dictionary](NSDictionary, "dictionary"), sub_10000A18C, self);
          if (v19)
          {
            v20 = v19;
            v21 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
            if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
            {
              v24 = 67109120;
              v25 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_ERROR, "DiagExtWifiScanner: Scan request returned error %d", (uint8_t *)&v24, 8u);
            }
            +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 2.0);
            return 0;
          }
        }
      }
    }
  }
  v22 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "DiagExtWifiScanner: Start wifi scanning", (uint8_t *)&v24, 2u);
  }
  v4 = 1;
  -[DiagExtWifiScanner setFIsScanning:](self, "setFIsScanning:", 1);
  return v4;
}

- (BOOL)isMonitoring
{
  return self->fIsMonitoring;
}

- (void)disableAutoJoin
{
  __WiFiManagerClient *fWifiManagerRef;

  fWifiManagerRef = self->fWifiManagerRef;
  if (fWifiManagerRef)
    WiFiManagerClientDisable(fWifiManagerRef, a2);
}

- (void)enableAutoJoin
{
  __WiFiManagerClient *fWifiManagerRef;

  fWifiManagerRef = self->fWifiManagerRef;
  if (fWifiManagerRef)
    WiFiManagerClientEnable(fWifiManagerRef, a2);
}

- (DiagExtWifiScannerDelegate)delegate
{
  return (DiagExtWifiScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)fAvailabilityState
{
  return self->_fAvailabilityState;
}

- (void)setFAvailabilityState:(int)a3
{
  self->_fAvailabilityState = a3;
}

- (BOOL)fIsScanning
{
  return self->_fIsScanning;
}

- (void)setFIsScanning:(BOOL)a3
{
  self->_fIsScanning = a3;
}

- (BOOL)fScanRepeatRequired
{
  return self->_fScanRepeatRequired;
}

- (void)setFScanRepeatRequired:(BOOL)a3
{
  self->_fScanRepeatRequired = a3;
}

- (double)fScanIntervalInSec
{
  return self->_fScanIntervalInSec;
}

- (void)setFScanIntervalInSec:(double)a3
{
  self->_fScanIntervalInSec = a3;
}

- (dispatch_semaphore_s)fWaitForResult
{
  return self->_fWaitForResult;
}

- (void)setFWaitForResult:(dispatch_semaphore_s *)a3
{
  self->_fWaitForResult = a3;
}

- (__CFRunLoop)fServerRunLoopRef
{
  return self->_fServerRunLoopRef;
}

- (void)setFServerRunLoopRef:(__CFRunLoop *)a3
{
  self->_fServerRunLoopRef = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->fScanTimer, 0);
}

@end
