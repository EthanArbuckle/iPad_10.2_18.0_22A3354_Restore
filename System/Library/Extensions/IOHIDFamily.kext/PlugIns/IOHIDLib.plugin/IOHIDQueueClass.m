@implementation IOHIDQueueClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6;
  CFUUIDRef v7;
  int v8;

  v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Eu, 0xC7u, 0x8Bu, 0xDBu, 0x9Fu, 0x4Eu, 0x11u, 0xDAu, 0xB6u, 0x5Cu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (!CFEqual(v6, v7))
  {
    v8 = -2147483644;
    if (!v6)
      return v8;
    goto LABEL_3;
  }
  *a4 = &self->_queue;
  CFRetain(self);
  v8 = 0;
  if (v6)
LABEL_3:
    CFRelease(v6);
  return v8;
}

- (int)getAsyncEventSource:(const void *)a3
{
  os_unfair_lock_s *p_queueLock;

  if (!a3)
    return -536870206;
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  *a3 = self->_runLoopSource;
  os_unfair_lock_unlock(p_queueLock);
  return 0;
}

- (int)setDepth:(unsigned int)a3
{
  os_unfair_lock_s *p_queueLock;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  self->_depth = a3;
  os_unfair_lock_unlock(p_queueLock);
  return 0;
}

- (int)getDepth:(unsigned int *)a3
{
  os_unfair_lock_s *p_queueLock;

  if (!a3)
    return -536870206;
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  *a3 = self->_depth;
  os_unfair_lock_unlock(p_queueLock);
  return 0;
}

- (int)addElement:(__IOHIDElement *)a3
{
  unint64_t queueToken;
  id WeakRetained;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_port_t v10;
  kern_return_t v11;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[2] = 0;
  outputCnt = 1;
  if (!a3)
    return -536870206;
  queueToken = self->_queueToken;
  output = 0xAAAAAAAAAAAAAAAALL;
  input[0] = queueToken;
  input[1] = IOHIDElementGetCookie(a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v10 = objc_msgSend_connect(WeakRetained, v6, v7, v8, v9);
  v11 = IOConnectCallScalarMethod(v10, 5u, input, 3u, &output, &outputCnt);

  self->_queueSizeChanged = (output | self->_queueSizeChanged) != 0;
  return v11;
}

- (int)removeElement:(__IOHIDElement *)a3
{
  unint64_t queueToken;
  id WeakRetained;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_port_t v10;
  kern_return_t v11;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  outputCnt = 1;
  if (!a3)
    return -536870206;
  queueToken = self->_queueToken;
  output = 0xAAAAAAAAAAAAAAAALL;
  input[0] = queueToken;
  input[1] = IOHIDElementGetCookie(a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v10 = objc_msgSend_connect(WeakRetained, v6, v7, v8, v9);
  v11 = IOConnectCallScalarMethod(v10, 6u, input, 2u, &output, &outputCnt);

  self->_queueSizeChanged = (output | self->_queueSizeChanged) != 0;
  return v11;
}

- (int)containsElement:(__IOHIDElement *)a3 pValue:(char *)a4
{
  kern_return_t v4;
  unint64_t queueToken;
  id WeakRetained;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t v13;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  outputCnt = 1;
  v4 = -536870206;
  if (a3 && a4)
  {
    queueToken = self->_queueToken;
    output = 0xAAAAAAAAAAAAAAAALL;
    input[0] = queueToken;
    input[1] = IOHIDElementGetCookie(a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    v13 = objc_msgSend_connect(WeakRetained, v9, v10, v11, v12);
    v4 = IOConnectCallScalarMethod(v13, 7u, input, 2u, &output, &outputCnt);

    *a4 = output;
  }
  return v4;
}

- (int)start
{
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  mach_port_t v8;
  kern_return_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v8 = objc_msgSend_connect(WeakRetained, v4, v5, v6, v7);
  v9 = IOConnectCallScalarMethod(v8, 8u, &self->_queueToken, 1u, 0, 0);

  os_unfair_lock_lock(&self->_queueLock);
  if (!self->_queueMemory || self->_queueSizeChanged)
  {
    objc_msgSend_mapMemory(self, v10, v11, v12, v13);
    self->_queueSizeChanged = 0;
  }
  os_unfair_lock_unlock(&self->_queueLock);
  return v9;
}

- (int)stop
{
  IOHIDQueueClass *v2;
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  mach_port_t v8;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v8 = objc_msgSend_connect(WeakRetained, v4, v5, v6, v7);
  LODWORD(v2) = IOConnectCallScalarMethod(v8, 9u, &v2->_queueToken, 1u, 0, 0);

  return (int)v2;
}

- (int)setValueAvailableCallback:(void *)a3 context:(void *)a4
{
  os_unfair_lock_s *p_queueLock;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  self->_valueAvailableCallback = a3;
  self->_valueAvailableContext = a4;
  os_unfair_lock_unlock(p_queueLock);
  return 0;
}

- (int)copyNextValue:(__IOHIDValue *)a3
{
  os_unfair_lock_s *p_queueLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  IODataQueueEntry *v10;
  IODataQueueEntry *v11;
  uint64_t v12;
  id WeakRetained;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint32_t dataSize;

  if (!a3)
    return -536870206;
  dataSize = -1431655766;
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  objc_msgSend_updateUsageAnalytics(self, v6, v7, v8, v9);
  v10 = IODataQueuePeek(self->_queueMemory);
  if (v10)
  {
    v11 = v10;
    v12 = *(unsigned int *)v10->data;
    WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    objc_msgSend_getElement_(WeakRetained, v14, v12, v15, v16);
    *a3 = (__IOHIDValue *)_IOHIDValueCreateWithElementValuePtr();

    if (*a3 && (_IOHIDValueGetFlags() & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)&self->_device);
      objc_msgSend_releaseReport_(v17, v18, *(_QWORD *)&v11[3], v19, v20);

    }
    IODataQueueDequeue(self->_queueMemory, 0, &dataSize);
    if (*a3)
      v21 = 0;
    else
      v21 = -536870212;
  }
  else
  {
    v21 = -536870169;
  }
  os_unfair_lock_unlock(p_queueLock);
  return v21;
}

- (void)queueCallback:(__CFMachPort *)a3 msg:(id *)a4 size:(int64_t)a5 info:(void *)a6
{
  os_unfair_lock_s *p_queueLock;
  void *valueAvailableContext;
  void (*valueAvailableCallback)(void *, _QWORD, IOHIDDeviceQueueInterface **);

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  valueAvailableCallback = (void (*)(void *, _QWORD, IOHIDDeviceQueueInterface **))self->_valueAvailableCallback;
  valueAvailableContext = self->_valueAvailableContext;
  os_unfair_lock_unlock(p_queueLock);
  if (valueAvailableCallback)
    valueAvailableCallback(valueAvailableContext, 0, &self->_queue);
}

- (void)unmapMemory
{
  _IOHIDQueueHeader *queueHeader;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (self->_queueMemory)
  {
    queueHeader = self->_queueHeader;
    WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    v9 = objc_msgSend_connect(WeakRetained, v5, v6, v7, v8);
    MEMORY[0x2348D0C10](v9, LODWORD(self->_queueToken), *MEMORY[0x24BDAEC58], queueHeader);

    self->_queueHeader = 0;
    self->_queueMemory = 0;
    self->_queueMemorySize = 0;
  }
  if (self->_usageAnalytics)
  {
    IOHIDAnalyticsEventCancel();
    CFRelease(self->_usageAnalytics);
    self->_usageAnalytics = 0;
  }
}

- (void)mapMemory
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _IOHIDQueueHeader *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _IOHIDQueueHeader *v18;

  v17 = 0;
  v18 = 0;
  objc_msgSend_unmapMemory(self, a2, v2, v3, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v11 = objc_msgSend_connect(WeakRetained, v7, v8, v9, v10);
  MEMORY[0x2348D0BF8](v11, LODWORD(self->_queueToken), *MEMORY[0x24BDAEC58], &v18, &v17, 1);

  v12 = v18;
  self->_queueHeader = v18;
  self->_queueMemory = (_IODataQueueMemory *)&v12[1];
  self->_queueMemorySize = v17 - 48;
  objc_msgSend_setupAnalytics(self, v13, v14, v15, v16);
}

- (IOHIDQueueClass)initWithDevice:(id)a3
{
  return (IOHIDQueueClass *)objc_msgSend_initWithDevice_port_source_(self, a2, (uint64_t)a3, 0, 0);
}

- (IOHIDQueueClass)initWithDevice:(id)a3 port:(unsigned int)a4 source:(__CFRunLoopSource *)a5
{
  id v8;
  __int128 v9;
  IOHIDQueueClass *v10;
  IOHIDQueueClass *v11;
  char *v12;
  IUnknownVTbl *vtbl;
  ULONG (__cdecl *Release)(void *);
  __int128 v15;
  id WeakRetained;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  mach_port_t v21;
  kern_return_t v22;
  mach_port_t NotificationPort;
  CFMachPortRef v24;
  CFRunLoopSourceRef RunLoopSource;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  mach_port_t v31;
  NSObject *v32;
  IOHIDQueueClass *v33;
  objc_super v35;
  CFMachPortContext context;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  kern_return_t v40;
  uint64_t reference[2];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  input[0] = 0;
  input[1] = 0;
  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v43 = v9;
  v44 = v9;
  *(_OWORD *)reference = v9;
  v42 = v9;
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  v35.receiver = self;
  v35.super_class = (Class)IOHIDQueueClass;
  v10 = -[IOHIDIUnknown2 init](&v35, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_device, v8);
    v12 = (char *)malloc_type_malloc(0x70uLL, 0x8004065BD1A13uLL);
    v11->_queue = (IOHIDDeviceQueueInterface *)v12;
    v11->_queueLock._os_unfair_lock_opaque = 0;
    vtbl = v11->super._vtbl;
    Release = vtbl->Release;
    v15 = *(_OWORD *)&vtbl->QueryInterface;
    *(_QWORD *)v12 = v11;
    *((_QWORD *)v12 + 3) = Release;
    *((_QWORD *)v12 + 4) = sub_2310D87A0;
    *((_QWORD *)v12 + 5) = sub_2310D87B0;
    *((_QWORD *)v12 + 6) = sub_2310D87C0;
    *((_QWORD *)v12 + 7) = sub_2310D87D0;
    *((_QWORD *)v12 + 8) = sub_2310D87E0;
    *((_QWORD *)v12 + 9) = sub_2310D87F0;
    *((_QWORD *)v12 + 10) = sub_2310D8804;
    *(_OWORD *)(v12 + 8) = v15;
    *((_QWORD *)v12 + 11) = sub_2310D8810;
    *((_QWORD *)v12 + 12) = sub_2310D881C;
    *((_QWORD *)v12 + 13) = sub_2310D8830;
    WeakRetained = objc_loadWeakRetained((id *)&v11->_device);
    v21 = objc_msgSend_connect(WeakRetained, v17, v18, v19, v20);
    v22 = IOConnectCallScalarMethod(v21, 3u, input, 2u, &output, &outputCnt);

    if (!v22)
    {
      v11->_queueToken = output;
      if (a4)
      {
        v11->_port = a4;
      }
      else
      {
        NotificationPort = IODataQueueAllocateNotificationPort();
        v22 = -536870211;
        v11->_port = NotificationPort;
        if (!NotificationPort)
          goto LABEL_11;
        v24 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], NotificationPort, (CFMachPortCallBack)sub_2310D8840, &context, 0);
        v11->_machPort = v24;
        if (!v24)
          goto LABEL_11;
      }
      if (a5)
      {
        v11->_runLoopSource = a5;
        CFRetain(a5);
        goto LABEL_10;
      }
      RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], v11->_machPort, 0);
      v11->_runLoopSource = RunLoopSource;
      if (RunLoopSource)
      {
LABEL_10:
        v26 = objc_loadWeakRetained((id *)&v11->_device);
        v31 = objc_msgSend_connect(v26, v27, v28, v29, v30);
        v22 = IOConnectCallAsyncScalarMethod(v31, 0x10u, v11->_port, reference, 1u, &v11->_queueToken, 1u, 0, 0);

        if (!v22)
        {
          v33 = v11;
          goto LABEL_16;
        }
        goto LABEL_11;
      }
      v22 = -536870211;
    }
LABEL_11:
    _IOHIDLogCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v40 = v22;
      _os_log_impl(&dword_2310D3000, v32, OS_LOG_TYPE_INFO, "Failed to create IOHIDQueue plugin result: 0x%x\n", buf, 8u);
    }

  }
  v33 = 0;
LABEL_16:

  return v33;
}

- (void)dealloc
{
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  mach_port_t v8;
  const char *port;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IOHIDDeviceQueueInterface *queue;
  __CFRunLoopSource *runLoopSource;
  __CFMachPort *machPort;
  objc_super v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v8 = objc_msgSend_connect(WeakRetained, v4, v5, v6, v7);
  IOConnectCallScalarMethod(v8, 4u, &self->_queueToken, 1u, 0, 0);

  queue = self->_queue;
  if (queue)
    free(queue);
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
    CFRelease(runLoopSource);
  machPort = self->_machPort;
  if (machPort)
  {
    CFMachPortInvalidate(machPort);
    CFRelease(self->_machPort);
    port = (const char *)self->_port;
    if ((_DWORD)port)
      mach_port_mod_refs(*MEMORY[0x24BDAEC58], (mach_port_name_t)port, 1u, -1);
  }
  objc_msgSend_unmapMemory(self, port, v10, v11, v12);
  v16.receiver = self;
  v16.super_class = (Class)IOHIDQueueClass;
  -[IOHIDIUnknown2 dealloc](&v16, sel_dealloc);
}

- (BOOL)setupAnalytics
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  io_registry_entry_t v18;
  const __CFAllocator *v19;
  void *CFProperty;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  io_registry_entry_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  NSObject *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v33[0] = CFSTR("staticSize");
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], a2, self->_queueMemorySize, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = CFSTR("queueType");
  v34[0] = v5;
  v34[1] = CFSTR("deviceQueue");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, (uint64_t)v34, (uint64_t)v33, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_mutableCopy(v7, v8, v9, v10, v11);

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v18 = objc_msgSend_service(WeakRetained, v14, v15, v16, v17, 3336, 1);
  v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v18, CFSTR("DeviceUsagePairs"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);

  v21 = objc_loadWeakRetained((id *)&self->_device);
  v26 = objc_msgSend_service(v21, v22, v23, v24, v25);
  v27 = (void *)IORegistryEntryCreateCFProperty(v26, CFSTR("Transport"), v19, 0);

  if (CFProperty)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v28, (uint64_t)CFProperty, (uint64_t)CFSTR("usagePairs"), v29);
  if (v27)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v28, (uint64_t)v27, (uint64_t)CFSTR("transport"), v29);
  v30 = (void *)IOHIDAnalyticsHistogramEventCreate();
  self->_usageAnalytics = v30;
  if (v30)
  {
    IOHIDAnalyticsEventActivate();
  }
  else
  {
    _IOHIDLogCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_2310E13B8(v32);

  }
  return v30 != 0;
}

- (void)updateUsageAnalytics
{
  _IODataQueueMemory *queueMemory;
  unsigned int tail;

  if (self->_queueHeader)
  {
    queueMemory = self->_queueMemory;
    if (queueMemory)
    {
      if (self->_usageAnalytics)
      {
        tail = queueMemory->tail;
        if (tail != self->_lastTail)
        {
          IOHIDAnalyticsHistogramEventSetIntegerValue();
          self->_lastTail = tail;
        }
      }
    }
  }
}

- (void)signalQueueEmpty
{
  _IOHIDQueueHeader *queueHeader;
  char v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_t v9;
  kern_return_t v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  queueHeader = self->_queueHeader;
  if (queueHeader)
  {
    v3 = atomic_load(&queueHeader->var0);
    if ((v3 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_device);
      v9 = objc_msgSend_connect(WeakRetained, v5, v6, v7, v8);
      v10 = IOConnectCallScalarMethod(v9, 0x12u, 0, 0, 0, 0);

      if (v10)
      {
        _IOHIDLogCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12[0] = 67109120;
          v12[1] = v10;
          _os_log_impl(&dword_2310D3000, v11, OS_LOG_TYPE_DEFAULT, "kIOHIDLibUserClientResumeReports:%#x\n", (uint8_t *)v12, 8u);
        }

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
}

@end
