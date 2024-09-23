@implementation BKSAccelerometer

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setXThreshold:(float)a3
{
  if (self->_xThreshold != a3)
  {
    self->_xThreshold = a3;
    -[NSLock lock](self->_lock, "lock");
    if (self->_accelerometerEventsSource)
      -[BKSAccelerometer _checkIn](self, "_checkIn");
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)setYThreshold:(float)a3
{
  if (self->_yThreshold != a3)
  {
    self->_yThreshold = a3;
    -[NSLock lock](self->_lock, "lock");
    if (self->_accelerometerEventsSource)
      -[BKSAccelerometer _checkIn](self, "_checkIn");
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)setZThreshold:(float)a3
{
  if (self->_zThreshold != a3)
  {
    self->_zThreshold = a3;
    -[NSLock lock](self->_lock, "lock");
    if (self->_accelerometerEventsSource)
      -[BKSAccelerometer _checkIn](self, "_checkIn");
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)setAccelerometerEventsEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (-[BKSAccelerometer accelerometerEventsEnabled](self, "accelerometerEventsEnabled") != v3)
  {
    if (v3)
      -[BKSAccelerometer _checkIn](self, "_checkIn");
    else
      -[BKSAccelerometer _checkOut](self, "_checkOut");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)accelerometerEventsEnabled
{
  return self->_accelerometerEventsSource != 0;
}

- (void)_checkIn
{
  __CFNotificationCenter *LocalCenter;
  unsigned int *v5;
  kern_return_t v6;
  __CFRunLoopSource *v7;
  __CFRunLoop *Current;
  int v9;
  __CFRunLoopSource *accelerometerEventsSource;
  mach_error_t v11;
  mach_error_t v12;
  NSObject *v13;
  char *v14;
  mach_error_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  CFRunLoopSourceContext name;

  name.perform = (void (__cdecl *)(void *))*MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__checkIn, 0);
  if (!self->_accelerometerEventsSource)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_serverWasRestarted, CFSTR("kBKSHIDServerDiedNotification"), 0, (CFNotificationSuspensionBehavior)0);
    LODWORD(name.version) = 0;
    v5 = (unsigned int *)MEMORY[0x1E0C83DA0];
    v6 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, (mach_port_name_t *)&name);
    if (v6)
    {
      v15 = v6;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSAccelerometer.m"), 139, CFSTR("%@ unable to allocate notification receive port: %s"), v17, mach_error_string(v15));

    }
    v19 = 2;
    MEMORY[0x18D768888](*v5, LODWORD(name.version), 1, &v19, 1);
    v7 = BKCreateMIGServerSourceWithContext((uint64_t)&_BKXXBKAccelerometer_subsystem, name.version, 0, (uint64_t)self);
    self->_accelerometerEventsSource = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSAccelerometer.m"), 146, CFSTR("%@ unable to create run loop source"), objc_opt_class());

    }
    Current = CFRunLoopGetCurrent();
    self->_accelerometerEventsRunLoop = Current;
    CFRetain(Current);
    CFRunLoopAddSource(self->_accelerometerEventsRunLoop, self->_accelerometerEventsSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  }
  v9 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  accelerometerEventsSource = self->_accelerometerEventsSource;
  memset(&name.info, 0, 64);
  name.version = 1;
  CFRunLoopSourceGetContext(accelerometerEventsSource, &name);
  v11 = _BKSHIDSetAccelerometerClientEventsEnabled(v9, *(_DWORD *)name.info, 0, self->_updateInterval, self->_xThreshold, self->_yThreshold, self->_zThreshold);
  if (v11)
  {
    v12 = v11;
    if (v11 == 268435460)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]);
      v13 = objc_claimAutoreleasedReturnValue();
      -[BKSAccelerometer performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__checkIn, 0, v13, 1.0);
    }
    else
    {
      BKLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = mach_error_string(v12);
        LODWORD(name.version) = 136446210;
        *(CFIndex *)((char *)&name.version + 4) = (CFIndex)v14;
        _os_log_error_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_ERROR, "BKSetAccelerometerClientEventsEnabled failed: %{public}s", (uint8_t *)&name, 0xCu);
      }
    }

  }
}

- (void)setUpdateInterval:(double)a3
{
  if (self->_updateInterval != a3)
  {
    self->_updateInterval = a3;
    -[NSLock lock](self->_lock, "lock");
    if (self->_accelerometerEventsSource)
      -[BKSAccelerometer _checkIn](self, "_checkIn");
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (int64_t)currentDeviceOrientation
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_orientationCheckToken, &state64);
  return state64;
}

- (BKSAccelerometer)init
{
  BKSAccelerometer *v2;
  NSLock *v3;
  NSLock *lock;
  NSObject *v5;
  void *v7;
  id v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)BKSAccelerometer;
  v2 = -[BKSAccelerometer init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

    if (notify_register_check("com.apple.backboardd.rawOrientation", &v2->_orientationCheckToken))
    {
      BKLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        v8 = v7;
        _os_log_error_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@ unable to create notifyd token for device orientation", buf, 0xCu);

      }
    }
    v2->_passiveOrientationEvents = 1;
    mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &v2->_orientationPort);
  }
  return v2;
}

- (void)setPassiveOrientationEvents:(BOOL)a3
{
  if (self->_passiveOrientationEvents != a3)
  {
    self->_passiveOrientationEvents = a3;
    -[BKSAccelerometer _updateOrientationServer](self, "_updateOrientationServer");
  }
}

- (void)setOrientationEventsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSThread *v5;
  NSThread *orientationEventsThread;
  NSObject *v7;
  NSThread *v8;
  _QWORD handler[5];

  if (self->_orientationEventsEnabled != a3)
  {
    v3 = a3;
    self->_orientationEventsEnabled = a3;
    -[BKSAccelerometer _updateOrientationServer](self, "_updateOrientationServer");
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v5 = (NSThread *)objc_claimAutoreleasedReturnValue();
      orientationEventsThread = self->_orientationEventsThread;
      self->_orientationEventsThread = v5;

      dispatch_get_global_queue(0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __48__BKSAccelerometer_setOrientationEventsEnabled___block_invoke;
      handler[3] = &unk_1E1EA0958;
      handler[4] = self;
      notify_register_dispatch("com.apple.backboardd.rawOrientation", &self->_orientationNotificationsToken, v7, handler);

    }
    else
    {
      notify_cancel(self->_orientationNotificationsToken);
      v8 = self->_orientationEventsThread;
      self->_orientationEventsThread = 0;

    }
  }
}

- (void)_updateOrientationServer
{
  int v3;

  v3 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDSetOrientationClientEventsEnabled(v3, self->_orientationPort, self->_orientationEventsEnabled, self->_passiveOrientationEvents);
}

- (void)dealloc
{
  mach_port_name_t orientationPort;
  objc_super v4;

  -[BKSAccelerometer setAccelerometerEventsEnabled:](self, "setAccelerometerEventsEnabled:", 0);
  -[BKSAccelerometer setOrientationEventsEnabled:](self, "setOrientationEventsEnabled:", 0);
  notify_cancel(self->_orientationCheckToken);
  orientationPort = self->_orientationPort;
  if (orientationPort + 1 >= 2)
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], orientationPort, 1u, -1);
  v4.receiver = self;
  v4.super_class = (Class)BKSAccelerometer;
  -[BKSAccelerometer dealloc](&v4, sel_dealloc);
}

- (void)_checkOut
{
  __CFNotificationCenter *LocalCenter;
  __CFRunLoopSource *accelerometerEventsSource;
  mach_port_name_t v5;
  ipc_space_t *v6;
  CFRunLoopSourceContext context;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__checkIn, 0);
  if (self->_accelerometerEventsSource)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, CFSTR("kBKSHIDServerDiedNotification"), 0);
    accelerometerEventsSource = self->_accelerometerEventsSource;
    memset(&context.info, 0, 64);
    context.version = 1;
    CFRunLoopSourceGetContext(accelerometerEventsSource, &context);
    v5 = *(_DWORD *)context.info;
    CFRunLoopSourceInvalidate(self->_accelerometerEventsSource);
    CFRelease(self->_accelerometerEventsSource);
    self->_accelerometerEventsSource = 0;
    CFRelease(self->_accelerometerEventsRunLoop);
    v6 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    self->_accelerometerEventsRunLoop = 0;
    mach_port_mod_refs(*v6, v5, 1u, -1);
  }
}

- (void)_serverWasRestarted
{
  -[NSLock lock](self->_lock, "lock");
  if (self->_accelerometerEventsSource)
    -[BKSAccelerometer _checkIn](self, "_checkIn");
  if (self->_orientationEventsEnabled)
    -[BKSAccelerometer _updateOrientationServer](self, "_updateOrientationServer");
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)_orientationEventsThread
{
  return self->_orientationEventsThread;
}

- (void)_orientationDidChange
{
  id v3;

  -[BKSAccelerometer delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accelerometer:didChangeDeviceOrientation:", self, -[BKSAccelerometer currentDeviceOrientation](self, "currentDeviceOrientation"));

}

- (BKSAccelerometerDelegate)delegate
{
  return (BKSAccelerometerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (float)xThreshold
{
  return self->_xThreshold;
}

- (float)yThreshold
{
  return self->_yThreshold;
}

- (float)zThreshold
{
  return self->_zThreshold;
}

- (BOOL)passiveOrientationEvents
{
  return self->_passiveOrientationEvents;
}

- (BOOL)orientationEventsEnabled
{
  return self->_orientationEventsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationEventsThread, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __48__BKSAccelerometer_setOrientationEventsEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:onThread:withObject:waitUntilDone:", sel__orientationDidChange, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 0, 0);
}

@end
