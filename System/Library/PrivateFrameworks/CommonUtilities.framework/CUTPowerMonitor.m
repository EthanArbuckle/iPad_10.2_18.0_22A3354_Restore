@implementation CUTPowerMonitor

- (BOOL)isExternalPowerConnected
{
  CUTPowerMonitor *v2;
  char v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((_BYTE *)v2->_internal + 64);
  objc_sync_exit(v2);

  return v3;
}

- (void)addDelegate:(id)a3
{
  id v4;
  CUTPowerMonitor *v5;
  void *v6;
  uint64_t v7;
  _QWORD *internal;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)*((_QWORD *)v5->_internal + 6);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = objc_claimAutoreleasedReturnValue();
      internal = v5->_internal;
      v9 = (void *)internal[6];
      internal[6] = v7;

      v6 = (void *)*((_QWORD *)v5->_internal + 6);
    }
    objc_msgSend(v6, "addObject:", v10);
    objc_sync_exit(v5);

    v4 = v10;
  }

}

- (void)removeDelegate:(id)a3
{
  id v4;
  CUTPowerMonitor *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend(*((id *)v5->_internal + 6), "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

+ (id)sharedInstance
{
  if (qword_1ECD8FDD8 != -1)
    dispatch_once(&qword_1ECD8FDD8, &unk_1E448FFD8);
  return (id)qword_1ECD8FDA8;
}

- (void)updateBatteryLevelWithBatteryEntry:(unsigned int)a3
{
  CUTPowerMonitor *obj;

  obj = self;
  objc_sync_enter(obj);
  *((_DWORD *)obj->_internal + 11) = a3;
  *((_QWORD *)obj->_internal + 7) = 0xBFF0000000000000;
  objc_sync_exit(obj);

}

- (void)updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3
{
  CUTPowerMonitor *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[CUTPowerMonitor _updateBatteryConnectedStateWithBatteryEntry:](self, "_updateBatteryConnectedStateWithBatteryEntry:", *(_QWORD *)&a3))
  {
    v4 = self;
    objc_sync_enter(v4);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = *((id *)v4->_internal + 6);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
          dispatch_get_global_queue(0, 0);
          v11 = objc_claimAutoreleasedReturnValue();
          v12[0] = v8;
          v12[1] = 3221225472;
          v12[2] = sub_1A0BD1C50;
          v12[3] = &unk_1E44901E0;
          v12[4] = v10;
          v12[5] = v4;
          dispatch_async(v11, v12);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    objc_sync_exit(v4);
  }
}

- (BOOL)_updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3
{
  CUTPowerMonitor *v4;
  void *CFProperty;
  const void *v6;
  int v7;
  _BYTE *internal;
  int v9;
  BOOL v10;

  v4 = self;
  objc_sync_enter(v4);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("ExternalConnected"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v6 = CFProperty;
  if (CFProperty)
  {
    v7 = objc_msgSend(CFProperty, "BOOLValue");
    internal = v4->_internal;
    v9 = internal[64];
    v10 = v9 != v7;
    if (v9 != v7)
      internal[64] = v7;
    CFRelease(v6);
  }
  else
  {
    v10 = 0;
  }
  objc_sync_exit(v4);

  return v10;
}

- (void)_handlePowerChangedNotificationWithMessageType:(unsigned int)a3 notificationID:(void *)a4
{
  CUTPowerMonitor *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 == -536870288 || a3 == -536870272)
  {
    IOAllowPowerChange(*((_DWORD *)self->_internal + 7), (intptr_t)a4);
  }
  else if (a3 == -536870144)
  {
    v4 = self;
    objc_sync_enter(v4);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = *((id *)v4->_internal + 6);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
          dispatch_get_global_queue(0, 0);
          v11 = objc_claimAutoreleasedReturnValue();
          v12[0] = v8;
          v12[1] = 3221225472;
          v12[2] = sub_1A0BD18CC;
          v12[3] = &unk_1E44901E0;
          v12[4] = v10;
          v12[5] = v4;
          dispatch_async(v11, v12);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    objc_sync_exit(v4);
  }
}

- (id)_init
{
  CUTPowerMonitor *v2;
  _CUTPowerMonitor *v3;
  id internal;
  NSObject *p_super;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUTPowerMonitor;
  v2 = -[CUTPowerMonitor init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_CUTPowerMonitor);
    internal = v2->_internal;
    v2->_internal = v3;

    *((_QWORD *)v2->_internal + 7) = 0xBFF0000000000000;
    if (!-[CUTPowerMonitor _initIOService](v2, "_initIOService"))
    {
      p_super = &v2->super;
      v2 = 0;
      goto LABEL_6;
    }
    *((_DWORD *)v2->_internal + 7) = IORegisterForSystemPower(0, (IONotificationPortRef *)v2->_internal + 4, (IOServiceInterestCallback)sub_1A0BD19E8, (io_object_t *)v2->_internal + 10);
    if (*((_DWORD *)v2->_internal + 7))
    {
      p_super = dispatch_queue_create("CUTPowerMonitor-IOPowerManagement", 0);
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v2->_internal + 4), p_super);
LABEL_6:

    }
  }
  return v2;
}

- (BOOL)_initIOService
{
  mach_port_t v3;
  __CFRunLoop *Main;
  const __CFDictionary *v5;
  uint64_t MatchingService;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *MEMORY[0x1E0CBBAB8];
  *((_QWORD *)self->_internal + 2) = IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
  *((_QWORD *)self->_internal + 1) = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)self->_internal + 2));
  if (*((_QWORD *)self->_internal + 1))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, *((CFRunLoopSourceRef *)self->_internal + 1), (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    v5 = IOServiceMatching("IOPMPowerSource");
    MatchingService = IOServiceGetMatchingService(v3, v5);
    if (!IOServiceAddInterestNotification(*((IONotificationPortRef *)self->_internal + 2), MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)sub_1A0BC4730, 0, (io_object_t *)self->_internal + 6))
    {
      -[CUTPowerMonitor updateBatteryLevelWithBatteryEntry:](self, "updateBatteryLevelWithBatteryEntry:", MatchingService);
      -[CUTPowerMonitor _updateBatteryConnectedStateWithBatteryEntry:](self, "_updateBatteryConnectedStateWithBatteryEntry:", MatchingService);
      LOBYTE(v7) = 1;
      return v7;
    }
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v7)
    {
      sub_1A0BD26B0(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_7:
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v7)
    {
      sub_1A0BD2678(v7, v15, v16, v17, v18, v19, v20, v21);
      goto LABEL_7;
    }
  }
  return v7;
}

- (void)dealloc
{
  __CFRunLoop *Main;
  const __CFString *v4;
  __CFRunLoop *v5;
  id internal;
  IONotificationPort *v7;
  io_object_t v8;
  objc_super v9;

  Main = CFRunLoopGetMain();
  v4 = (const __CFString *)*MEMORY[0x1E0C9B280];
  if (CFRunLoopContainsSource(Main, *((CFRunLoopSourceRef *)self->_internal + 1), (CFRunLoopMode)*MEMORY[0x1E0C9B280]))
  {
    v5 = CFRunLoopGetMain();
    CFRunLoopRemoveSource(v5, *((CFRunLoopSourceRef *)self->_internal + 1), v4);
  }
  internal = self->_internal;
  v7 = (IONotificationPort *)*((_QWORD *)internal + 2);
  if (v7)
  {
    IONotificationPortDestroy(v7);
    *((_QWORD *)self->_internal + 2) = 0;
    internal = self->_internal;
  }
  v8 = *((_DWORD *)internal + 6);
  if (v8)
  {
    IOObjectRelease(v8);
    *((_DWORD *)self->_internal + 6) = 0;
    internal = self->_internal;
  }
  if (*((_DWORD *)internal + 7))
  {
    IODeregisterForSystemPower((io_object_t *)internal + 10);
    IONotificationPortDestroy(*((IONotificationPortRef *)self->_internal + 4));
    IOServiceClose(*((_DWORD *)self->_internal + 7));
    *((_DWORD *)self->_internal + 7) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CUTPowerMonitor;
  -[CUTPowerMonitor dealloc](&v9, sel_dealloc);
}

- (double)batteryPercentRemaining
{
  CUTPowerMonitor *v2;
  id internal;
  io_registry_entry_t v4;
  const __CFAllocator *v5;
  void *CFProperty;
  void *v7;
  const void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = self;
  objc_sync_enter(v2);
  internal = v2->_internal;
  if (*((double *)internal + 7) != -1.0)
    goto LABEL_12;
  v4 = *((_DWORD *)internal + 11);
  if (!v4)
    goto LABEL_12;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("MaxCapacity"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v7 = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("CurrentCapacity"), v5, 0);
  v8 = v7;
  if (CFProperty)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    *((_QWORD *)v2->_internal + 7) = 0xBFF0000000000000;
    if (!CFProperty)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(v7, "doubleValue");
    v11 = v10;
    objc_msgSend(CFProperty, "doubleValue");
    *((double *)v2->_internal + 7) = v11 / v12;
    *((_DWORD *)v2->_internal + 11) = 0;
  }
  CFRelease(CFProperty);
LABEL_10:
  if (v8)
    CFRelease(v8);
LABEL_12:
  v13 = *((double *)v2->_internal + 7);
  objc_sync_exit(v2);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
