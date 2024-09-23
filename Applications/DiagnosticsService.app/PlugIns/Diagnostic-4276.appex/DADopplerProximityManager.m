@implementation DADopplerProximityManager

+ (id)sharedInstance
{
  if (qword_100011C98 != -1)
    dispatch_once(&qword_100011C98, &stru_10000C430);
  return (id)qword_100011C90;
}

- (DADopplerProximityManager)init
{
  DADopplerProximityManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *proxQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *handlerQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DADopplerProximityManager;
  v2 = -[DADopplerProximityManager init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4276.dopplerProximitySensorUpdatesQueue", 0);
    proxQueue = v2->_proxQueue;
    v2->_proxQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4276.dopplerProximitySensorUpdatesHandlerQueue", 0);
    handlerQueue = v2->_handlerQueue;
    v2->_handlerQueue = (OS_dispatch_queue *)v5;

    v2->_buffer = (char *)malloc_type_malloc(0x200uLL, 0x100004077774924uLL);
  }
  return v2;
}

- (void)dealloc
{
  char *buffer;
  objc_super v4;

  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DADopplerProximityManager;
  -[DADopplerProximityManager dealloc](&v4, "dealloc");
}

- (void)teardownProxManager
{
  __IOHIDManager *manager;

  manager = self->_manager;
  if (manager)
  {
    IOHIDManagerClose(manager, 0);
    CFRelease(self->_manager);
    self->_manager = 0;
  }
}

- (id)sensorData
{
  return 0;
}

- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  _QWORD v9[5];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v14 = !-[DADopplerProximityManager isUpdating](self, "isUpdating");
  if (*((_BYTE *)v12 + 24))
  {
    -[DADopplerProximityManager setHandler:](self, "setHandler:", v4);
    v5 = objc_claimAutoreleasedReturnValue(-[DADopplerProximityManager proxQueue](self, "proxQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003034;
    block[3] = &unk_10000C458;
    block[4] = self;
    block[5] = &v11;
    dispatch_sync(v5, block);

    if (*((_BYTE *)v12 + 24))
    {
      -[DADopplerProximityManager setUpdating:](self, "setUpdating:", 1);
      v6 = objc_claimAutoreleasedReturnValue(-[DADopplerProximityManager proxQueue](self, "proxQueue"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100003064;
      v9[3] = &unk_10000C480;
      v9[4] = self;
      dispatch_async(v6, v9);

    }
    v7 = *((_BYTE *)v12 + 24) != 0;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (BOOL)stopProximitySensorUpdates
{
  if (-[DADopplerProximityManager isUpdating](self, "isUpdating"))
  {
    -[DADopplerProximityManager deactivateProximitySensor](self, "deactivateProximitySensor");
    -[DADopplerProximityManager setUpdating:](self, "setUpdating:", 0);
  }
  return 1;
}

- (BOOL)activateProximitySensor
{
  _BOOL4 v3;

  v3 = -[DADopplerProximityManager retrieveHIDDevice](self, "retrieveHIDDevice");
  if (v3)
  {
    v3 = -[DADopplerProximityManager backupDopplerState](self, "backupDopplerState");
    if (v3)
    {
      v3 = -[DADopplerProximityManager deviceSetDetectionModeActive:](self, "deviceSetDetectionModeActive:", 1);
      if (v3)
      {
        v3 = -[DADopplerProximityManager deviceSetStreamEnabled:](self, "deviceSetStreamEnabled:", 1);
        if (v3)
        {
          -[DADopplerProximityManager registerForCallback](self, "registerForCallback");
          LOBYTE(v3) = 1;
        }
      }
    }
  }
  return v3;
}

- (void)deactivateProximitySensor
{
  -[DADopplerProximityManager deviceSetStreamEnabled:](self, "deviceSetStreamEnabled:", 0);
  -[DADopplerProximityManager deviceSetDetectionModeActive:](self, "deviceSetDetectionModeActive:", 0);
  -[DADopplerProximityManager deregisterForCallback](self, "deregisterForCallback");
  -[DADopplerProximityManager unscheduleProximityUpdates](self, "unscheduleProximityUpdates");
}

- (void)startRunLoop
{
  -[DADopplerProximityManager setProxRunLoop:](self, "setProxRunLoop:", CFRunLoopGetCurrent());
  -[DADopplerProximityManager scheduleProximityUpdates](self, "scheduleProximityUpdates");
  CFRunLoopRun();
  -[DADopplerProximityManager teardownProxManager](self, "teardownProxManager");
}

- (BOOL)retrieveHIDDevice
{
  __IOHIDManager *v3;
  CFSetRef v4;
  CFSetRef v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;

  v3 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
  self->_manager = v3;
  if (!v3)
    return 0;
  IOHIDManagerSetDeviceMatching(v3, (CFDictionaryRef)&off_10000CC78);
  IOHIDManagerOpen(self->_manager, 0);
  v4 = IOHIDManagerCopyDevices(self->_manager);
  v5 = v4;
  if (v4 && -[__CFSet count](v4, "count"))
  {
    -[DADopplerProximityManager setProxDeviceRef:](self, "setProxDeviceRef:", -[__CFSet anyObject](v5, "anyObject"));
    if ((unint64_t)-[__CFSet count](v5, "count") >= 2)
    {
      v6 = DiagnosticLogHandleForCategory(3);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100007130(v5, v7);

    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)backupDopplerState
{
  _BOOL4 v3;

  v3 = -[DADopplerProximityManager getHIDReportForDevice:reportType:reportID:buffer:bufferSize:](self, "getHIDReportForDevice:reportType:reportID:buffer:bufferSize:", -[DADopplerProximityManager proxDeviceRef](self, "proxDeviceRef"), 2, 81, &self->_initialDopplerDataStreamEnables, 2);
  self->_initialDopplerDataStreamEnables.type = 81;
  if (v3)
  {
    LOBYTE(v3) = -[DADopplerProximityManager getHIDReportForDevice:reportType:reportID:buffer:bufferSize:](self, "getHIDReportForDevice:reportType:reportID:buffer:bufferSize:", -[DADopplerProximityManager proxDeviceRef](self, "proxDeviceRef"), 2, 80, &self->_initialDopplerDetectionMode, 2);
    self->_initialDopplerDetectionMode.type = 80;
  }
  return v3;
}

- (BOOL)deviceSetStreamEnabled:(BOOL)a3
{
  char value;
  __IOHIDDevice *v5;
  void *v6;
  BOOL v7;
  _BYTE v9[2];

  if (a3)
    value = self->_initialDopplerDataStreamEnables.value | 2;
  else
    value = self->_initialDopplerDataStreamEnables.value;
  v9[0] = 81;
  v9[1] = value;
  v5 = -[DADopplerProximityManager proxDeviceRef](self, "proxDeviceRef");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v9, 2));
  v7 = -[DADopplerProximityManager setHIDReportForDevice:reportType:reportID:buffer:](self, "setHIDReportForDevice:reportType:reportID:buffer:", v5, 2, 81, v6);

  return v7;
}

- (BOOL)deviceSetDetectionModeActive:(BOOL)a3
{
  unsigned __int8 value;
  __IOHIDDevice *v5;
  void *v6;
  BOOL v7;
  _BYTE v9[2];

  if (a3)
    value = 15;
  else
    value = self->_initialDopplerDetectionMode.value;
  v9[0] = 80;
  v9[1] = value;
  v5 = -[DADopplerProximityManager proxDeviceRef](self, "proxDeviceRef");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v9, 2));
  v7 = -[DADopplerProximityManager setHIDReportForDevice:reportType:reportID:buffer:](self, "setHIDReportForDevice:reportType:reportID:buffer:", v5, 2, 80, v6);

  return v7;
}

- (BOOL)getHIDReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(void *)a6 bufferSize:(int64_t)a7
{
  CFIndex pReportLength;

  pReportLength = a7;
  return IOHIDDeviceGetReport(a3, (IOHIDReportType)a4, a5, (uint8_t *)a6, &pReportLength) == 0;
}

- (BOOL)setHIDReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6
{
  id v9;
  const uint8_t *v10;
  id v11;

  v9 = objc_retainAutorelease(a6);
  v10 = (const uint8_t *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");

  return IOHIDDeviceSetReport(a3, (IOHIDReportType)a4, a5, v10, (CFIndex)v11) == 0;
}

- (void)registerForCallback
{
  IOHIDDeviceRegisterInputReportCallback(-[DADopplerProximityManager proxDeviceRef](self, "proxDeviceRef"), (uint8_t *)-[DADopplerProximityManager buffer](self, "buffer"), 512, (IOHIDReportCallback)sub_1000034F4, self);
}

- (void)deregisterForCallback
{
  IOHIDDeviceRegisterInputReportCallback(-[DADopplerProximityManager proxDeviceRef](self, "proxDeviceRef"), (uint8_t *)-[DADopplerProximityManager buffer](self, "buffer"), 512, 0, self);
}

- (void)scheduleProximityUpdates
{
  IOHIDDeviceScheduleWithRunLoop(-[DADopplerProximityManager proxDeviceRef](self, "proxDeviceRef"), -[DADopplerProximityManager proxRunLoop](self, "proxRunLoop"), kCFRunLoopCommonModes);
}

- (void)unscheduleProximityUpdates
{
  IOHIDDeviceUnscheduleFromRunLoop(-[DADopplerProximityManager proxDeviceRef](self, "proxDeviceRef"), -[DADopplerProximityManager proxRunLoop](self, "proxRunLoop"), kCFRunLoopCommonModes);
  CFRunLoopStop(-[DADopplerProximityManager proxRunLoop](self, "proxRunLoop"));
}

- (void)handleNewProximityValue:(int)a3
{
  uint64_t v3;
  void *v4;
  void (**v5)(id, _QWORD, void *);

  v3 = *(_QWORD *)&a3;
  v5 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue(-[DADopplerProximityManager handler](self, "handler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5[2](v5, v3, v4);

}

- (__IOHIDDevice)proxDeviceRef
{
  return self->_proxDeviceRef;
}

- (void)setProxDeviceRef:(__IOHIDDevice *)a3
{
  self->_proxDeviceRef = a3;
}

- (__CFRunLoop)proxRunLoop
{
  return self->_proxRunLoop;
}

- (void)setProxRunLoop:(__CFRunLoop *)a3
{
  self->_proxRunLoop = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (OS_dispatch_queue)proxQueue
{
  return self->_proxQueue;
}

- (void)setProxQueue:(id)a3
{
  objc_storeStrong((id *)&self->_proxQueue, a3);
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (char)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(char *)a3
{
  self->_buffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_proxQueue, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
