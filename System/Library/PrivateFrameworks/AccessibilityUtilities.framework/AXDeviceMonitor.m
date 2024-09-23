@implementation AXDeviceMonitor

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXDeviceMonitor)initWithMatchingMultiple:(id)a3 callbackRunLoop:(id)a4
{
  const __CFArray *v6;
  id v7;
  AXDeviceMonitor *v8;
  AXDeviceMonitor *v9;
  objc_super v11;

  v6 = (const __CFArray *)a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXDeviceMonitor;
  v8 = -[AXDeviceMonitor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXDeviceMonitor _commonInitWithRunLoop:](v8, "_commonInitWithRunLoop:", v7);
    IOHIDManagerSetDeviceMatchingMultiple(v9->_hidManager, v6);
  }

  return v9;
}

- (id)copyDevices
{
  os_unfair_lock_s *p_devicesLock;
  void *v4;

  if (self->_state != 1)
    _AXAssert();
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  v4 = (void *)-[NSMutableSet copy](self->_devices, "copy");
  os_unfair_lock_unlock(p_devicesLock);
  return v4;
}

- (void)begin
{
  __IOHIDManager *hidManager;
  __CFRunLoop *v4;
  unint64_t state;

  if (self->_state)
  {
    state = self->_state;
    _AXAssert();
  }
  self->_state = 1;
  hidManager = self->_hidManager;
  v4 = -[NSRunLoop getCFRunLoop](self->_targetRunLoop, "getCFRunLoop", state);
  IOHIDManagerScheduleWithRunLoop(hidManager, v4, (CFStringRef)*MEMORY[0x1E0C9B280]);
  IOHIDManagerOpen(self->_hidManager, 0);
}

- (void)_commonInitWithRunLoop:(id)a3
{
  id v5;
  NSMutableSet *v6;
  NSMutableSet *devices;

  objc_storeStrong((id *)&self->_targetRunLoop, a3);
  v5 = a3;
  self->_hidManager = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  devices = self->_devices;
  self->_devices = v6;

  self->_devicesLock._os_unfair_lock_opaque = 0;
  IOHIDManagerRegisterDeviceMatchingCallback(self->_hidManager, (IOHIDDeviceCallback)deviceMatchingCallback, self);
  IOHIDManagerRegisterDeviceRemovalCallback(self->_hidManager, (IOHIDDeviceCallback)deviceRemovalCallback, self);

  self->_state = 0;
}

- (AXDeviceMonitor)initWithMatchingDictionary:(id)a3 callbackRunLoop:(id)a4
{
  const __CFDictionary *v6;
  id v7;
  AXDeviceMonitor *v8;
  AXDeviceMonitor *v9;
  objc_super v11;

  v6 = (const __CFDictionary *)a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXDeviceMonitor;
  v8 = -[AXDeviceMonitor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXDeviceMonitor _commonInitWithRunLoop:](v8, "_commonInitWithRunLoop:", v7);
    IOHIDManagerSetDeviceMatching(v9->_hidManager, v6);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_state == 1)
    _AXAssert();
  CFRelease(self->_hidManager);
  v3.receiver = self;
  v3.super_class = (Class)AXDeviceMonitor;
  -[AXDeviceMonitor dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  __IOHIDManager *hidManager;
  __CFRunLoop *v4;
  unint64_t state;

  if (self->_state != 1)
  {
    state = self->_state;
    _AXAssert();
  }
  self->_state = 2;
  hidManager = self->_hidManager;
  v4 = -[NSRunLoop getCFRunLoop](self->_targetRunLoop, "getCFRunLoop", state);
  IOHIDManagerUnscheduleFromRunLoop(hidManager, v4, (CFStringRef)*MEMORY[0x1E0C9B280]);
  IOHIDManagerClose(self->_hidManager, 0);
}

- (void)didAddDevice:(__IOHIDDevice *)a3
{
  id v5;

  -[AXDeviceMonitor _existingDevicesForDevice:](self, "_existingDevicesForDevice:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    os_unfair_lock_lock(&self->_devicesLock);
    -[NSMutableSet addObject:](self->_devices, "addObject:", a3);
    os_unfair_lock_unlock(&self->_devicesLock);
    -[AXDeviceMonitor informDelegate](self, "informDelegate");
  }

}

- (void)didRemoveDevice:(__IOHIDDevice *)a3
{
  id v4;

  -[AXDeviceMonitor _existingDevicesForDevice:](self, "_existingDevicesForDevice:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_devicesLock);
    -[NSMutableSet minusSet:](self->_devices, "minusSet:", v4);
    os_unfair_lock_unlock(&self->_devicesLock);
    -[AXDeviceMonitor informDelegate](self, "informDelegate");
  }

}

- (id)_existingDevicesForDevice:(__IOHIDDevice *)a3
{
  void *v5;
  os_unfair_lock_s *p_devicesLock;
  NSMutableSet *devices;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  __IOHIDDevice *v13;

  IOHIDDeviceGetProperty(a3, CFSTR("UniqueID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  devices = self->_devices;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__AXDeviceMonitor__existingDevicesForDevice___block_invoke;
  v11[3] = &unk_1E24C7300;
  v12 = v5;
  v13 = a3;
  v8 = v5;
  -[NSMutableSet objectsPassingTest:](devices, "objectsPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_devicesLock);

  return v9;
}

BOOL __45__AXDeviceMonitor__existingDevicesForDevice___block_invoke(uint64_t a1, void *a2)
{
  __IOHIDDevice *v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  IOHIDDeviceGetProperty(v3, CFSTR("UniqueID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(*(id *)(a1 + 32), "isEqual:", v4) & 1) != 0 || *(_QWORD *)(a1 + 40) == (_QWORD)v3;

  return v5;
}

- (void)informDelegate
{
  id v3;

  -[AXDeviceMonitor delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceMonitorDidDetectDeviceEvent:", self);

}

+ (id)bluetoothKeyboardDevices
{
  __IOHIDManager *v2;
  CFSetRef v3;

  v2 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  IOHIDManagerSetDeviceMatching(v2, (CFDictionaryRef)&unk_1E24F8F80);
  IOHIDManagerOpen(v2, 0);
  v3 = IOHIDManagerCopyDevices(v2);
  IOHIDManagerClose(v2, 0);
  CFRelease(v2);
  return v3;
}

- (AXDeviceMonitorDelegate)delegate
{
  return (AXDeviceMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_targetRunLoop, 0);
}

@end
