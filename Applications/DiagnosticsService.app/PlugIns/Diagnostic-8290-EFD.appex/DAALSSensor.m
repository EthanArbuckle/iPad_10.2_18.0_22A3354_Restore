@implementation DAALSSensor

- (DAALSSensor)initWithDelegate:(id)a3 threshold:(unsigned int)a4
{
  id v6;
  DAALSSensor *v7;
  DAALSSensor *v8;
  NSMutableArray *v9;
  NSMutableArray *ALSSamples;
  dispatch_queue_t v11;
  OS_dispatch_queue *HIDEventQueue;
  DAChamberSensorEvent *mostRecentEvent;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAALSSensor;
  v7 = -[DAALSSensor init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    ALSSamples = v8->_ALSSamples;
    v8->_ALSSamples = v9;

    v8->_threshold = a4;
    v8->_minimalALSSampleCount = 10;
    v8->_HIDSystemClient = 0;
    v8->_HIDServiceClient = 0;
    v11 = dispatch_queue_create("DAALSSensorQueue", 0);
    HIDEventQueue = v8->_HIDEventQueue;
    v8->_HIDEventQueue = (OS_dispatch_queue *)v11;

    mostRecentEvent = v8->_mostRecentEvent;
    v8->_mostRecentEvent = 0;

    v8->_started = 0;
  }

  return v8;
}

- (void)startMonitoring
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Start monitoring", buf, 2u);
  }

  -[DAALSSensor setStarted:](self, "setStarted:", -[DAALSSensor setupALSClient](self, "setupALSClient"));
  if (!-[DAALSSensor started](self, "started"))
  {
    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAALSSensor: ALS Client failed to set up.", v7, 2u);
    }

  }
}

- (void)stopMonitoring
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Stop monitoring", v6, 2u);
  }

  -[DAALSSensor setStarted:](self, "setStarted:", 0);
  -[DAALSSensor releaseALSClient](self, "releaseALSClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor ALSSamples](self, "ALSSamples"));
  objc_msgSend(v5, "removeAllObjects");

  -[DAALSSensor setMostRecentEvent:](self, "setMostRecentEvent:", 0);
}

- (BOOL)setupALSClient
{
  void *v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (-[DAALSSensor setupHIDSystemClient](self, "setupHIDSystemClient")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor HIDEventQueue](self, "HIDEventQueue")),
        v3,
        v3))
  {
    IOHIDServiceClientSetProperty(-[DAALSSensor HIDServiceClient](self, "HIDServiceClient"), CFSTR("ReportInterval"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10000));
    IOHIDEventSystemClientActivate(-[DAALSSensor HIDSystemClient](self, "HIDSystemClient"));
    return 1;
  }
  else
  {
    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100010FFC(v6, v7, v8, v9, v10, v11, v12, v13);

    return 0;
  }
}

- (BOOL)setupHIDSystemClient
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __IOHIDEventSystemClient *v12;
  __IOHIDEventSystemClient *v13;
  void *v14;
  dispatch_block_t v15;
  __IOHIDEventSystemClient *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  __IOHIDEventSystemClient *v20;
  const char *v21;
  const __CFArray *v22;
  const __CFArray *v23;
  CFIndex v24;
  __IOHIDServiceClient *ValueAtIndex;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  __IOHIDServiceClient *v30;
  const char *v31;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  void *v38;

  if (-[DAALSSensor HIDSystemClient](self, "HIDSystemClient")
    && -[DAALSSensor HIDServiceClient](self, "HIDServiceClient"))
  {
    v3 = DiagnosticLogHandleForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100011030(v4, v5, v6, v7, v8, v9, v10, v11);

    LOBYTE(v12) = 0;
  }
  else
  {
    if (!-[DAALSSensor HIDSystemClient](self, "HIDSystemClient"))
    {
      -[DAALSSensor setHIDSystemClient:](self, "setHIDSystemClient:", IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0));
      IOHIDEventSystemClientRegisterEventCallback(-[DAALSSensor HIDSystemClient](self, "HIDSystemClient"), ALSHIDEventCallback, self, 0);
      v13 = -[DAALSSensor HIDSystemClient](self, "HIDSystemClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor HIDEventQueue](self, "HIDEventQueue"));
      IOHIDEventSystemClientScheduleWithDispatchQueue(v13, v14);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000E1FC;
      block[3] = &unk_10001C580;
      block[4] = self;
      v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      IOHIDEventSystemClientSetCancelHandler(-[DAALSSensor HIDSystemClient](self, "HIDSystemClient"), v15);
      v16 = -[DAALSSensor HIDSystemClient](self, "HIDSystemClient");
      v36[0] = CFSTR("PrimaryUsagePage");
      v36[1] = CFSTR("PrimaryUsage");
      v37[0] = &off_10001D580;
      v37[1] = &off_10001D598;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
      v38 = v17;
      IOHIDEventSystemClientSetMatchingMultiple(v16, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));

      v18 = DiagnosticLogHandleForCategory(3);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = -[DAALSSensor HIDSystemClient](self, "HIDSystemClient");
        v21 = "success";
        if (!v20)
          v21 = "failure";
        *(_DWORD *)buf = 136315138;
        v35 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Setup system client: %s", buf, 0xCu);
      }

    }
    if (-[DAALSSensor HIDSystemClient](self, "HIDSystemClient")
      && !-[DAALSSensor HIDServiceClient](self, "HIDServiceClient"))
    {
      v22 = IOHIDEventSystemClientCopyServices(-[DAALSSensor HIDSystemClient](self, "HIDSystemClient"));
      if (v22)
      {
        v23 = v22;
        if (CFArrayGetCount(v22) >= 1)
        {
          v24 = 0;
          while (1)
          {
            ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v23, v24);
            v26 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, CFSTR("PrimaryUsage"));
            v27 = v26;
            if (v26)
            {
              if (objc_msgSend(v26, "intValue") == 4)
                break;
            }

            if (CFArrayGetCount(v23) <= ++v24)
              goto LABEL_22;
          }
          -[DAALSSensor setHIDServiceClient:](self, "setHIDServiceClient:", ValueAtIndex);
          CFRetain(ValueAtIndex);

        }
LABEL_22:
        CFRelease(v23);
      }
      v28 = DiagnosticLogHandleForCategory(3);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = -[DAALSSensor HIDServiceClient](self, "HIDServiceClient");
        v31 = "success";
        if (!v30)
          v31 = "failure";
        *(_DWORD *)buf = 136315138;
        v35 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Setup service client: %s", buf, 0xCu);
      }

    }
    v12 = -[DAALSSensor HIDSystemClient](self, "HIDSystemClient");
    if (v12)
      LOBYTE(v12) = -[DAALSSensor HIDServiceClient](self, "HIDServiceClient") != 0;
  }
  return (char)v12;
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  void *v6;
  void *v7;

  if (IOHIDEventGetType(a3, a2) == 12)
  {
    if (-[DAALSSensor started](self, "started"))
    {
      IntegerValue = IOHIDEventGetIntegerValue(a3, 786432);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor ALSSamples](self, "ALSSamples"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", IntegerValue));
      objc_msgSend(v6, "addObject:", v7);

      -[DAALSSensor determineEnclosureState](self, "determineEnclosureState");
    }
  }
}

- (id)averageSampleValue
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor ALSSamples](self, "ALSSamples", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 += (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "longValue");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor ALSSamples](self, "ALSSamples"));
  objc_msgSend(v9, "removeAllObjects");

  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v6 / -[DAALSSensor minimalALSSampleCount](self, "minimalALSSampleCount")));
}

- (void)determineEnclosureState
{
  void *v3;
  id v4;
  signed int v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  DAChamberSensorEvent *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor ALSSamples](self, "ALSSamples"));
  v4 = objc_msgSend(v3, "count");
  v5 = -[DAALSSensor minimalALSSampleCount](self, "minimalALSSampleCount");

  if ((unint64_t)v4 >= v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor averageSampleValue](self, "averageSampleValue"));
    v7 = objc_msgSend(v6, "intValue");

    v8 = -[DAALSSensor threshold](self, "threshold");
    v9 = DiagnosticLogHandleForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 <= v8)
        v11 = "Closed";
      else
        v11 = "Opened";
      v17 = 136315650;
      v18 = v11;
      v19 = 1024;
      v20 = v7;
      v21 = 1024;
      v22 = -[DAALSSensor threshold](self, "threshold");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Detect %s - average value= %d, ALS limit = %d", (uint8_t *)&v17, 0x18u);
    }

    if (v7 > v8)
      v12 = 1;
    else
      v12 = 2;
    v13 = -[DAChamberSensorEvent initWithSensorType:eventType:]([DAChamberSensorEvent alloc], "initWithSensorType:eventType:", 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor mostRecentEvent](self, "mostRecentEvent"));
    v15 = -[DAChamberSensorEvent isEqual:](v13, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DAALSSensor delegate](self, "delegate"));
      objc_msgSend(v16, "handleSensorEvent:", v13);

      -[DAALSSensor setMostRecentEvent:](self, "setMostRecentEvent:", v13);
    }

  }
}

- (void)releaseALSClient
{
  if (-[DAALSSensor HIDSystemClient](self, "HIDSystemClient"))
  {
    IOHIDEventSystemClientUnregisterEventCallback(-[DAALSSensor HIDSystemClient](self, "HIDSystemClient"), ALSHIDEventCallback, self, 0);
    IOHIDEventSystemClientCancel(-[DAALSSensor HIDSystemClient](self, "HIDSystemClient"));
  }
}

- (void)dealloc
{
  objc_super v3;

  -[DAALSSensor stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)DAALSSensor;
  -[DAALSSensor dealloc](&v3, "dealloc");
}

- (DAChamberSensorDelegate)delegate
{
  return (DAChamberSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DAChamberSensorEvent)mostRecentEvent
{
  return self->_mostRecentEvent;
}

- (void)setMostRecentEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentEvent, a3);
}

- (__IOHIDEventSystemClient)HIDSystemClient
{
  return self->_HIDSystemClient;
}

- (void)setHIDSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_HIDSystemClient = a3;
}

- (__IOHIDServiceClient)HIDServiceClient
{
  return self->_HIDServiceClient;
}

- (void)setHIDServiceClient:(__IOHIDServiceClient *)a3
{
  self->_HIDServiceClient = a3;
}

- (OS_dispatch_queue)HIDEventQueue
{
  return self->_HIDEventQueue;
}

- (void)setHIDEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_HIDEventQueue, a3);
}

- (NSMutableArray)ALSSamples
{
  return self->_ALSSamples;
}

- (void)setALSSamples:(id)a3
{
  objc_storeStrong((id *)&self->_ALSSamples, a3);
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(unsigned int)a3
{
  self->_threshold = a3;
}

- (int)minimalALSSampleCount
{
  return self->_minimalALSSampleCount;
}

- (void)setMinimalALSSampleCount:(int)a3
{
  self->_minimalALSSampleCount = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ALSSamples, 0);
  objc_storeStrong((id *)&self->_HIDEventQueue, 0);
  objc_storeStrong((id *)&self->_mostRecentEvent, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
