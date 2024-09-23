@implementation APDBrowserBluetoothHelper

- (APDBrowserBluetoothHelper)init
{
  APDBrowserBluetoothHelper *v2;
  dispatch_queue_t v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APDBrowserBluetoothHelper;
  v2 = -[APDBrowserBluetoothHelper init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("APBrowserBluetoothManagerInternalQueue", 0);
    v2->_queue = (OS_dispatch_queue *)v3;
    if (v3
      && (v4 = dispatch_queue_create("APBrowserBluetoothManagerEventQueue", 0),
          (v2->_eventQueue = (OS_dispatch_queue *)v4) != 0))
    {
      objc_msgSend(MEMORY[0x1E0D03410], "setSharedInstanceQueue:", v2->_queue);
    }
    else
    {
      APSLogErrorAt();
    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *queue;
  NSObject *eventQueue;
  objc_super v5;

  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  eventQueue = self->_eventQueue;
  if (eventQueue)
  {
    dispatch_release(eventQueue);
    self->_eventQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)APDBrowserBluetoothHelper;
  -[APDBrowserBluetoothHelper dealloc](&v5, sel_dealloc);
}

- (int)invalidate
{
  int v3;
  int v4;

  if (-[APDBrowserBluetoothHelper isInvalidated](self, "isInvalidated"))
    return -72182;
  v3 = -[APDBrowserBluetoothHelper ensureBluetoothPowerChangedListenerStopped](self, "ensureBluetoothPowerChangedListenerStopped");
  if (v3)
  {
    v4 = v3;
    APSLogErrorAt();
  }
  else
  {
    v4 = -[APDBrowserBluetoothHelper dispatchEvent:withEventInfo:](self, "dispatchEvent:withEventInfo:", 100, 0);
    -[APDBrowserBluetoothHelper setIsInvalidated:](self, "setIsInvalidated:", 1);
  }
  return v4;
}

- (id)getEventString:(unsigned int)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("Invalidated");
  v4 = CFSTR("Unknown");
  if (a3 == 101)
    v4 = CFSTR("Bluetooth Power Changed Listening Stopped");
  if (a3 != 100)
    v3 = v4;
  if (a3 == 1)
    return CFSTR("Bluetooth Power Changed");
  else
    return (id)v3;
}

- (int)setEventHandler:(void *)a3 context:(void *)a4 helperRef:(OpaqueAPDBluetoothHelper *)a5
{
  if (-[APDBrowserBluetoothHelper isInvalidated](self, "isInvalidated"))
    return -72182;
  -[APDBrowserBluetoothHelper setEventHandlerFunc:](self, "setEventHandlerFunc:", a3);
  -[APDBrowserBluetoothHelper setEventHandlerContext:](self, "setEventHandlerContext:", a4);
  -[APDBrowserBluetoothHelper setHelperRef:](self, "setHelperRef:", a5);
  return 0;
}

- (int)startListeningToEvent:(unsigned int)a3
{
  uint64_t v3;
  int v5;

  v3 = *(_QWORD *)&a3;
  if (-[APDBrowserBluetoothHelper isInvalidated](self, "isInvalidated"))
  {
    APSLogErrorAt();
    return -72182;
  }
  if ((v3 - 100) >= 2)
  {
    if ((_DWORD)v3 == 1)
    {
      v5 = -[APDBrowserBluetoothHelper ensureBluetoothPowerEventMonitorStarted](self, "ensureBluetoothPowerEventMonitorStarted");
      if (!v5)
        return v5;
    }
    else
    {
      v5 = -72181;
      if ((_DWORD)v3)
      {
        if (gLogCategory_APDBluetoothHelper > 60
          || gLogCategory_APDBluetoothHelper == -1 && !_LogCategory_Initialize())
        {
          return v5;
        }
LABEL_11:
        LogPrintF();
        return v5;
      }
    }
    APSLogErrorAt();
    return v5;
  }
  v5 = -72181;
  if (gLogCategory_APDBluetoothHelper <= 60
    && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
  {
    -[APDBrowserBluetoothHelper getEventString:](self, "getEventString:", v3);
    goto LABEL_11;
  }
  return v5;
}

- (int)stopListeningToEvent:(unsigned int)a3
{
  uint64_t v3;
  int v5;

  v3 = *(_QWORD *)&a3;
  if (-[APDBrowserBluetoothHelper isInvalidated](self, "isInvalidated"))
  {
    APSLogErrorAt();
    return -72182;
  }
  if ((v3 - 100) >= 2)
  {
    if ((_DWORD)v3 == 1)
    {
      v5 = -[APDBrowserBluetoothHelper ensureBluetoothPowerChangedListenerStopped](self, "ensureBluetoothPowerChangedListenerStopped");
      if (!v5)
        return v5;
    }
    else
    {
      v5 = -72181;
      if ((_DWORD)v3)
      {
        if (gLogCategory_APDBluetoothHelper > 60
          || gLogCategory_APDBluetoothHelper == -1 && !_LogCategory_Initialize())
        {
          return v5;
        }
LABEL_11:
        LogPrintF();
        return v5;
      }
    }
    APSLogErrorAt();
    return v5;
  }
  v5 = -72181;
  if (gLogCategory_APDBluetoothHelper <= 60
    && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
  {
    -[APDBrowserBluetoothHelper getEventString:](self, "getEventString:", v3);
    goto LABEL_11;
  }
  return v5;
}

- (int)dispatchEvent:(unsigned int)a3 withEventInfo:(id)a4
{
  void *v7;
  OpaqueAPDBluetoothHelper *v8;
  void *v9;
  OS_dispatch_queue *v10;
  _QWORD block[8];
  unsigned int v13;

  v7 = -[APDBrowserBluetoothHelper eventHandlerFunc](self, "eventHandlerFunc");
  v8 = -[APDBrowserBluetoothHelper helperRef](self, "helperRef");
  v9 = -[APDBrowserBluetoothHelper eventHandlerContext](self, "eventHandlerContext");
  if (-[APDBrowserBluetoothHelper eventHandlerFunc](self, "eventHandlerFunc")
    && !-[APDBrowserBluetoothHelper isInvalidated](self, "isInvalidated"))
  {
    CFRetain(v8);
    v10 = -[APDBrowserBluetoothHelper eventQueue](self, "eventQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__APDBrowserBluetoothHelper_dispatchEvent_withEventInfo___block_invoke;
    block[3] = &unk_1E825A470;
    v13 = a3;
    block[4] = a4;
    block[5] = v7;
    block[6] = v8;
    block[7] = v9;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  return 0;
}

void __57__APDBrowserBluetoothHelper_dispatchEvent_withEventInfo___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

- (void)handleBluetoothChangedNotificationInternal:(id)a3
{
  int isBluetoothPoweredOn;
  int v5;
  const char *v6;
  const char *v7;
  int v8;
  const char *v9;
  const char *v10;
  unsigned __int8 v11;

  v11 = 0;
  if (!-[APDBrowserBluetoothHelper isInvalidated](self, "isInvalidated", a3)
    && -[APDBrowserBluetoothHelper bluetoothPowerChangedListeningStarted](self, "bluetoothPowerChangedListeningStarted"))
  {
    if (!-[APDBrowserBluetoothHelper getBluetoothPowerOn:](self, "getBluetoothPowerOn:", &v11))
    {
      isBluetoothPoweredOn = self->_isBluetoothPoweredOn;
      v5 = v11;
      if (isBluetoothPoweredOn == v11)
        return;
      if (gLogCategory_APDBluetoothHelper > 40)
        goto LABEL_15;
      if (gLogCategory_APDBluetoothHelper == -1)
      {
        v8 = _LogCategory_Initialize();
        v5 = v11;
        if (!v8)
        {
LABEL_15:
          self->_isBluetoothPoweredOn = v5;
          -[APDBrowserBluetoothHelper dispatchEvent:withEventInfo:](self, "dispatchEvent:withEventInfo:", 1, 0, v9, v10);
          return;
        }
        isBluetoothPoweredOn = self->_isBluetoothPoweredOn;
      }
      if (isBluetoothPoweredOn)
        v6 = "ON";
      else
        v6 = "OFF";
      if (v5)
        v7 = "ON";
      else
        v7 = "OFF";
      v9 = v6;
      v10 = v7;
      LogPrintF();
      LOBYTE(v5) = v11;
      goto LABEL_15;
    }
    APSLogErrorAt();
    if (gLogCategory_APDBluetoothHelper <= 60
      && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (int)ensureBluetoothPowerEventMonitorStarted
{
  int v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (-[APDBrowserBluetoothHelper isInvalidated](self, "isInvalidated"))
  {
    APSLogErrorAt();
    return -72182;
  }
  else if (-[APDBrowserBluetoothHelper bluetoothPowerChangedListeningStarted](self, "bluetoothPowerChangedListeningStarted"))
  {
    return 0;
  }
  else
  {
    if (gLogCategory_APDBluetoothHelper <= 40
      && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = -[APDBrowserBluetoothHelper getBluetoothPowerOn:](self, "getBluetoothPowerOn:", &self->_isBluetoothPoweredOn);
    if (v3)
    {
      APSLogErrorAt();
      if (gLogCategory_APDBluetoothHelper <= 60
        && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)handleBluetoothChangedNotification, CFSTR("com.apple.bluetooth.power-changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      -[APDBrowserBluetoothHelper setBluetoothPowerChangedListeningStarted:](self, "setBluetoothPowerChangedListeningStarted:", 1);
    }
  }
  return v3;
}

- (int)ensureBluetoothPowerChangedListenerStopped
{
  int result;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (-[APDBrowserBluetoothHelper isInvalidated](self, "isInvalidated"))
  {
    APSLogErrorAt();
    return -72182;
  }
  else
  {
    result = -[APDBrowserBluetoothHelper bluetoothPowerChangedListeningStarted](self, "bluetoothPowerChangedListeningStarted");
    if (result)
    {
      if (gLogCategory_APDBluetoothHelper <= 40
        && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.bluetooth.power-changed"), 0);
      -[APDBrowserBluetoothHelper setBluetoothPowerChangedListeningStarted:](self, "setBluetoothPowerChangedListeningStarted:", 0);
      return -[APDBrowserBluetoothHelper dispatchEvent:withEventInfo:](self, "dispatchEvent:withEventInfo:", 101, 0);
    }
  }
  return result;
}

- (int)queryBluetoothPower:(BOOL *)a3
{
  int v4;
  BOOL v6;

  v6 = 0;
  v4 = -[APDBrowserBluetoothHelper getBluetoothPowerOn:](self, "getBluetoothPowerOn:", &v6);
  if (v4)
  {
    APSLogErrorAt();
    if (gLogCategory_APDBluetoothHelper <= 60
      && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    *a3 = v6;
  }
  return v4;
}

- (int)setBluetoothPower:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  int v6;
  int v7;
  const char *v9;
  char v10;

  v3 = a3;
  v10 = 0;
  if (gLogCategory_APDBluetoothHelper <= 40
    && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
  {
    v5 = "OFF";
    if (v3)
      v5 = "ON";
    v9 = v5;
    LogPrintF();
  }
  v6 = -[APDBrowserBluetoothHelper getBluetoothPowerOn:](self, "getBluetoothPowerOn:", &v10, v9);
  if (v6)
  {
    v7 = v6;
    APSLogErrorAt();
    if (gLogCategory_APDBluetoothHelper <= 60
      && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_17;
    }
  }
  else if (v10 == v3)
  {
    return 0;
  }
  else
  {
    v7 = -[APDBrowserBluetoothHelper setPowered:](self, "setPowered:", v3);
    if (v7)
    {
      APSLogErrorAt();
      if (gLogCategory_APDBluetoothHelper <= 60
        && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
      {
LABEL_17:
        LogPrintF();
      }
    }
  }
  return v7;
}

- (int)getBluetoothPowerOn:(BOOL *)a3
{
  void *v4;
  char v5;
  int result;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  if (v4)
  {
    v5 = objc_msgSend(v4, "enabled");
    result = 0;
    *a3 = v5;
  }
  else
  {
    APSLogErrorAt();
    return -72184;
  }
  return result;
}

- (int)setPowered:(BOOL)a3
{
  _BOOL8 v3;
  int v4;
  void *v5;

  v3 = a3;
  v4 = -72184;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  if (!v5)
    goto LABEL_7;
  if ((objc_msgSend(v5, "setPowered:", v3) & 1) == 0)
  {
    v4 = -72183;
LABEL_7:
    APSLogErrorAt();
    return v4;
  }
  return 0;
}

- (void)eventHandlerContext
{
  return self->_eventHandlerContext;
}

- (void)setEventHandlerContext:(void *)a3
{
  self->_eventHandlerContext = a3;
}

- (void)eventHandlerFunc
{
  return self->_eventHandlerFunc;
}

- (void)setEventHandlerFunc:(void *)a3
{
  self->_eventHandlerFunc = a3;
}

- (OpaqueAPDBluetoothHelper)helperRef
{
  return self->_helperRef;
}

- (void)setHelperRef:(OpaqueAPDBluetoothHelper *)a3
{
  self->_helperRef = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (BOOL)bluetoothPowerChangedListeningStarted
{
  return self->_bluetoothPowerChangedListeningStarted;
}

- (void)setBluetoothPowerChangedListeningStarted:(BOOL)a3
{
  self->_bluetoothPowerChangedListeningStarted = a3;
}

@end
