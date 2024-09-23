@implementation DiagExtALSDataMonitor

- (DiagExtALSDataMonitor)initWithDelegate:(id)a3
{
  id v3;
  DiagExtALSDataMonitor *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DiagExtALSDataMonitor;
  v3 = a3;
  v4 = -[DiagExtALSDataMonitor init](&v7, "init");
  -[DiagExtALSDataMonitor setDelegate:](v4, "setDelegate:", v3, v7.receiver, v7.super_class);

  v5 = objc_alloc_init((Class)NSMutableArray);
  -[DiagExtALSDataMonitor setValueQueue:](v4, "setValueQueue:", v5);

  -[DiagExtALSDataMonitor setFALSEnclosedLimit:](v4, "setFALSEnclosedLimit:", 15);
  -[DiagExtALSDataMonitor setFALSEnclosedSampleCount:](v4, "setFALSEnclosedSampleCount:", 10);
  -[DiagExtALSDataMonitor setFEnclosedStateFlag:](v4, "setFEnclosedStateFlag:", 0);
  -[DiagExtALSDataMonitor setFIsMonitoring:](v4, "setFIsMonitoring:", 0);
  v4->fHIDSystemClient = 0;
  v4->fHIDServiceClient = 0;
  v4->fHIDEventQueue = (dispatch_queue_s *)dispatch_queue_create("DE.ALSDataMonitor.queue", 0);
  return v4;
}

- (void)dealloc
{
  os_log_s *v3;
  NSObject *fHIDEventQueue;
  objc_super v5;
  uint8_t buf[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor dealloc", buf, 2u);
  }
  fHIDEventQueue = self->fHIDEventQueue;
  if (fHIDEventQueue)
    dispatch_release(fHIDEventQueue);
  v5.receiver = self;
  v5.super_class = (Class)DiagExtALSDataMonitor;
  -[DiagExtALSDataMonitor dealloc](&v5, "dealloc");
}

- (BOOL)setupALSClient
{
  _BOOL4 v3;
  os_log_s *v4;
  uint8_t v6[16];

  if (-[DiagExtALSDataMonitor setupHIDClient](self, "setupHIDClient") && self->fHIDEventQueue)
  {
    IOHIDServiceClientSetProperty(self->fHIDServiceClient, CFSTR("ReportInterval"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10000));
    IOHIDEventSystemClientActivate(self->fHIDSystemClient);
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    v3 = os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "ALSDataMonitor: Failed to setup service client for ALS", v6, 2u);
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)releaseALSClient
{
  __IOHIDEventSystemClient *fHIDSystemClient;

  fHIDSystemClient = self->fHIDSystemClient;
  if (fHIDSystemClient)
  {
    IOHIDEventSystemClientUnregisterEventCallback(fHIDSystemClient, sub_10000A4DC, self, 0);
    IOHIDEventSystemClientCancel(self->fHIDSystemClient);
  }
}

- (BOOL)setupHIDClient
{
  __IOHIDEventSystemClient *fHIDSystemClient;
  __IOHIDServiceClient **p_fHIDServiceClient;
  dispatch_block_t v5;
  void *v6;
  void *v7;
  os_log_s *v8;
  const char *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex v12;
  __IOHIDServiceClient *ValueAtIndex;
  void *v14;
  const void *v15;
  os_log_s *v16;
  const char *v17;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v21;
  _QWORD v22[2];
  _QWORD v23[2];

  fHIDSystemClient = self->fHIDSystemClient;
  if (fHIDSystemClient)
  {
    p_fHIDServiceClient = &self->fHIDServiceClient;
    if (self->fHIDServiceClient)
      goto LABEL_28;
  }
  else
  {
    self->fHIDSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
    IOHIDEventSystemClientRegisterEventCallback();
    IOHIDEventSystemClientScheduleWithDispatchQueue(self->fHIDSystemClient, self->fHIDEventQueue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A8C4;
    block[3] = &unk_1000104F8;
    block[4] = self;
    v5 = dispatch_block_create((dispatch_block_flags_t)0, block);
    IOHIDEventSystemClientSetCancelHandler(self->fHIDSystemClient, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v22[0] = CFSTR("PrimaryUsagePage");
    v22[1] = CFSTR("PrimaryUsage");
    v23[0] = &off_100010B50;
    v23[1] = &off_100010B68;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
    objc_msgSend(v6, "addObject:", v7);

    IOHIDEventSystemClientSetMatchingMultiple(self->fHIDSystemClient, v6);
    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->fHIDSystemClient)
        v9 = "Success";
      else
        v9 = "Failed";
      *(_DWORD *)buf = 136315138;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: setup system client %s", buf, 0xCu);
    }

    fHIDSystemClient = self->fHIDSystemClient;
    if (!fHIDSystemClient)
      return (char)fHIDSystemClient;
    p_fHIDServiceClient = &self->fHIDServiceClient;
    if (self->fHIDServiceClient)
      goto LABEL_25;
  }
  v10 = IOHIDEventSystemClientCopyServices(fHIDSystemClient);
  if (!v10)
    goto LABEL_20;
  v11 = v10;
  if (CFArrayGetCount(v10) < 1)
    goto LABEL_19;
  v12 = 0;
  while (1)
  {
    ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v11, v12);
    v14 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, CFSTR("PrimaryUsage"));
    if (v14)
      break;
LABEL_14:
    if (CFArrayGetCount(v11) <= ++v12)
      goto LABEL_19;
  }
  v15 = v14;
  if (objc_msgSend(v14, "intValue") != 4)
  {
    CFRelease(v15);
    goto LABEL_14;
  }
  *p_fHIDServiceClient = ValueAtIndex;
  CFRetain(ValueAtIndex);
LABEL_19:
  CFRelease(v11);
LABEL_20:
  v16 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    if (*p_fHIDServiceClient)
      v17 = "Success";
    else
      v17 = "Failed";
    *(_DWORD *)buf = 136315138;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: setup service client %s", buf, 0xCu);
  }
LABEL_25:
  if (self->fHIDSystemClient)
  {
    LOBYTE(fHIDSystemClient) = *p_fHIDServiceClient != 0;
    return (char)fHIDSystemClient;
  }
LABEL_28:
  LOBYTE(fHIDSystemClient) = 0;
  return (char)fHIDSystemClient;
}

- (id)averageSampleQueue
{
  void *v3;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiagExtALSDataMonitor valueQueue](self, "valueQueue", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "intValue");
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiagExtALSDataMonitor valueQueue](self, "valueQueue"));
  objc_msgSend(v9, "removeAllObjects");

  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v6/ -[DiagExtALSDataMonitor fALSEnclosedSampleCount](self, "fALSEnclosedSampleCount"))));
}

- (void)determineEnclosureState
{
  void *v3;
  signed int v4;
  signed int v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  os_log_s *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiagExtALSDataMonitor valueQueue](self, "valueQueue"));
  v4 = objc_msgSend(v3, "count");
  v5 = -[DiagExtALSDataMonitor fALSEnclosedSampleCount](self, "fALSEnclosedSampleCount");

  if (v5 <= v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiagExtALSDataMonitor averageSampleQueue](self, "averageSampleQueue"));
    v7 = objc_msgSend(v6, "intValue");

    v8 = -[DiagExtALSDataMonitor fALSEnclosedLimit](self, "fALSEnclosedLimit");
    v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    {
      if (v7 <= v8)
        v14 = "Closed";
      else
        v14 = "Opened";
      v15 = 136315650;
      v16 = v14;
      v17 = 1024;
      v18 = v7;
      v19 = 1024;
      v20 = -[DiagExtALSDataMonitor fALSEnclosedLimit](self, "fALSEnclosedLimit");
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEBUG, "ALSDataMonitor: Detect %s - average value= %d, ALS limit = %d", (uint8_t *)&v15, 0x18u);
      v10 = -[DiagExtALSDataMonitor fEnclosedStateFlag](self, "fEnclosedStateFlag");
      if (v7 > v8)
        goto LABEL_4;
    }
    else
    {
      v10 = -[DiagExtALSDataMonitor fEnclosedStateFlag](self, "fEnclosedStateFlag");
      if (v7 > v8)
      {
LABEL_4:
        if (v10 == 2)
          return;
        -[DiagExtALSDataMonitor setFEnclosedStateFlag:](self, "setFEnclosedStateFlag:", 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DiagExtALSDataMonitor delegate](self, "delegate"));
        v12 = v11;
        v13 = 2;
LABEL_12:
        objc_msgSend(v11, "handleALSEnclosedEvent:", v13);

        return;
      }
    }
    if (v10 == 1)
      return;
    -[DiagExtALSDataMonitor setFEnclosedStateFlag:](self, "setFEnclosedStateFlag:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DiagExtALSDataMonitor delegate](self, "delegate"));
    v12 = v11;
    v13 = 1;
    goto LABEL_12;
  }
}

- (BOOL)startMonitoring
{
  unsigned int v3;
  os_log_s *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = -[DiagExtALSDataMonitor fIsMonitoring](self, "fIsMonitoring");
  v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  v5 = os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: already running", buf, 2u);
    }
    return 1;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: Start monitoring", v7, 2u);
    }
    -[DiagExtALSDataMonitor setFIsMonitoring:](self, "setFIsMonitoring:", 1);
    return 1;
  }
}

- (void)stopMonitoring
{
  os_log_s *v3;
  void *v4;
  uint8_t v5[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: Stop monitoring", v5, 2u);
  }
  -[DiagExtALSDataMonitor setFIsMonitoring:](self, "setFIsMonitoring:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiagExtALSDataMonitor valueQueue](self, "valueQueue"));
  objc_msgSend(v4, "removeAllObjects");

}

- (DiagExtALSDataMonitorDelegate)delegate
{
  return (DiagExtALSDataMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)valueQueue
{
  return self->_valueQueue;
}

- (void)setValueQueue:(id)a3
{
  objc_storeStrong((id *)&self->_valueQueue, a3);
}

- (unsigned)fALSEnclosedLimit
{
  return self->_fALSEnclosedLimit;
}

- (void)setFALSEnclosedLimit:(unsigned int)a3
{
  self->_fALSEnclosedLimit = a3;
}

- (int)fALSEnclosedSampleCount
{
  return self->_fALSEnclosedSampleCount;
}

- (void)setFALSEnclosedSampleCount:(int)a3
{
  self->_fALSEnclosedSampleCount = a3;
}

- (BOOL)fIsMonitoring
{
  return self->_fIsMonitoring;
}

- (void)setFIsMonitoring:(BOOL)a3
{
  self->_fIsMonitoring = a3;
}

- (int)fEnclosedStateFlag
{
  return self->_fEnclosedStateFlag;
}

- (void)setFEnclosedStateFlag:(int)a3
{
  self->_fEnclosedStateFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
