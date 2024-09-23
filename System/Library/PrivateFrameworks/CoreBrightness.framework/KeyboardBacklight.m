@implementation KeyboardBacklight

- (KeyboardBacklight)initWithQueue:(id)a3
{
  return -[KeyboardBacklight initWithQueue:device:](self, "initWithQueue:device:", a3, 0);
}

- (KeyboardBacklight)initWithQueue:(id)a3 device:(id)a4
{
  return -[KeyboardBacklight initWithQueue:device:ambientOffset:](self, "initWithQueue:device:ambientOffset:", a3, a4);
}

- (KeyboardBacklight)initWithQueue:(id)a3 device:(id)a4 ambientOffset:(float)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  os_log_t v11;
  uint64_t v12;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  NSObject *log;
  os_log_type_t v29;
  NSObject *inited;
  uint8_t v31[15];
  os_log_type_t v32;
  os_log_t v33;
  uint8_t v35[15];
  os_log_type_t v36;
  os_log_t v37;
  os_log_type_t v38;
  os_log_t v39;
  int v40;
  char *v41;
  size_t v42;
  id v43;
  id v44;
  uint8_t v45[7];
  os_log_type_t v46;
  os_log_t v47;
  uint8_t v48[7];
  os_log_type_t type;
  os_log_t oslog;
  objc_super v51;
  float v52;
  id v53;
  id v54;
  SEL v55;
  id v56;
  uint8_t v58[40];
  char __s1[1024];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v56 = self;
  v55 = a2;
  v54 = a3;
  v53 = a4;
  v52 = a5;
  v51.receiver = self;
  v51.super_class = (Class)KeyboardBacklight;
  v56 = -[CBModule initWithQueue:](&v51, sel_initWithQueue_, a3);
  if (v56)
  {
    v5 = v53;
    *((_QWORD *)v56 + 7) = v5;
    *((_BYTE *)v56 + 37) = 0;
    *((_BYTE *)v56 + 35) = 0;
    *((_BYTE *)v56 + 34) = 1;
    *((_BYTE *)v56 + 261) = 1;
    *((_BYTE *)v56 + 36) = 0;
    *((_BYTE *)v56 + 32) = 0;
    *((_BYTE *)v56 + 33) = 1;
    *((_BYTE *)v56 + 39) = 1;
    *((_BYTE *)v56 + 40) = 1;
    *((_DWORD *)v56 + 71) = 0;
    *((_DWORD *)v56 + 72) = 0;
    *((_DWORD *)v56 + 73) = 0;
    *((_DWORD *)v56 + 66) = 30;
    *((_DWORD *)v56 + 79) = 0;
    *((float *)v56 + 70) = 1.0;
    *((float *)v56 + 77) = 1.0;
    *((_DWORD *)v56 + 69) = 1061427347;
    *((_DWORD *)v56 + 68) = 1062534644;
    *((float *)v56 + 67) = v52;
    *((_BYTE *)v56 + 260) = 0;
    *((_QWORD *)v56 + 40) = 0;
    *((_QWORD *)v56 + 14) = 0;
    *((_DWORD *)v56 + 11) = 0;
    *((_DWORD *)v56 + 12) = 0;
    *((_BYTE *)v56 + 38) = 0;
    *((_DWORD *)v56 + 50) = 0;
    *((_BYTE *)v56 + 204) = 0;
    *((_BYTE *)v56 + 41) = 0;
    *((_QWORD *)v56 + 24) = 1;
    *((_BYTE *)v56 + 152) = 0;
    *((_QWORD *)v56 + 23) = 0;
    v6 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    *((_QWORD *)v56 + 20) = v6;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v56 + 12) = v7;
    if (mach_timebase_info((mach_timebase_info_t)v56 + 21))
    {
      oslog = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      oslog = inited;
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v29 = type;
        __os_log_helper_16_0_0(v48);
        _os_log_error_impl(&dword_1B5291000, log, v29, "Failed to create mach timebase info.", v48, 2u);
      }
LABEL_58:

      return 0;
    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v56 + 13) = v8;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v56 + 41) = v9;
    if ((objc_msgSend(v56, "supportsAuthentication") & 1) != 0)
      v10 = "Secondary";
    else
      v10 = "default";
    v11 = os_log_create("com.apple.CoreBrightness.KeyboardBacklight", v10);
    *((_QWORD *)v56 + 2) = v11;
    if (!*((_QWORD *)v56 + 2))
    {
      v47 = 0;
      v27 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v47 = v27;
      v46 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v25 = v47;
        v26 = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_error_impl(&dword_1B5291000, v25, v26, "Failed to create logHandle", v45, 2u);
      }
    }
    *((_DWORD *)v56 + 44) = 60;
    *((_QWORD *)v56 + 31) = 0;
    *((_DWORD *)v56 + 64) = 0;
    v44 = 0;
    v44 = (id)objc_msgSend(*((id *)v56 + 7), "propertyForKey:", CFSTR("ProductID"));
    if (v44)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v44, "intValue") == 1108 || objc_msgSend(v44, "intValue") == 1109))
      {
        *((_DWORD *)v56 + 44) = 15;
      }
    }
    v43 = 0;
    v43 = (id)objc_msgSend(*((id *)v56 + 7), "propertyForKey:", CFSTR("VendorID"));
    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v43, "intValue") == 1133)
      {
        *((_DWORD *)v56 + 44) = 15;
        *((_DWORD *)v56 + 50) = 0;
      }
    }
    bzero(__s1, 0x400uLL);
    v42 = 1024;
    if (!sysctlbyname("kern.bootargs", __s1, &v42, 0, 0))
    {
      v41 = strstr(__s1, "kb_backlight_update_hz");
      if (v41)
      {
        v41 += 22;
        v40 = strtol(v41 + 1, 0, 0);
        if (v40 > 0)
          *((_DWORD *)v56 + 44) = v40;
      }
    }
    v39 = 0;
    if (*((_QWORD *)v56 + 2))
    {
      v24 = *((_QWORD *)v56 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v23 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v23 = init_default_corebrightness_log();
      v24 = v23;
    }
    v39 = v24;
    v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(*((id *)v56 + 7), "propertyForKey:", CFSTR("VendorID"));
      v12 = objc_msgSend(*((id *)v56 + 7), "propertyForKey:", CFSTR("ProductID"));
      __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v58, v22, v12, *((_DWORD *)v56 + 44));
      _os_log_impl(&dword_1B5291000, v39, v38, "[VID=%@] [PID=%@] Update frequency = %d", v58, 0x1Cu);
    }
    v37 = 0;
    if (*((_QWORD *)v56 + 2))
    {
      v21 = *((_QWORD *)v56 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v20 = init_default_corebrightness_log();
      v21 = v20;
    }
    v37 = v21;
    v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v37;
      v19 = v36;
      __os_log_helper_16_0_0(v35);
      _os_log_impl(&dword_1B5291000, v18, v19, "Open HIDDevice", v35, 2u);
    }
    objc_msgSend(*((id *)v56 + 7), "open");
    if (!(objc_msgSend(v56, "retrieveKeyboardBacklightElements") & 1))
    {
      v33 = 0;
      if (*((_QWORD *)v56 + 2))
      {
        v17 = *((_QWORD *)v56 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v16 = init_default_corebrightness_log();
        v17 = v16;
      }
      v33 = v17;
      v32 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v14 = v33;
        v15 = v32;
        __os_log_helper_16_0_0(v31);
        _os_log_error_impl(&dword_1B5291000, v14, v15, "Initialization of KeyboardBacklight failed", v31, 2u);
      }
      goto LABEL_58;
    }
  }
  return (KeyboardBacklight *)v56;
}

- (void)dealloc
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  objc_super v6;
  uint8_t v7[7];
  os_log_type_t v8;
  NSObject *v9;
  SEL v10;
  KeyboardBacklight *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  if (self->super._logHandle)
  {
    logHandle = v11->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v9 = logHandle;
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1B5291000, log, type, "Dealloc", v7, 2u);
  }

  v11->_alsServiceClients = 0;
  v6.receiver = v11;
  v6.super_class = (Class)KeyboardBacklight;
  -[CBModule dealloc](&v6, sel_dealloc);
}

- (void)stop
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v3;
  __CFNotificationCenter *v4;
  void *v5;
  int *v6;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  __CFString *v11;
  uint8_t v12[7];
  os_log_type_t v13;
  NSObject *v14;
  SEL v15;
  KeyboardBacklight *v16;

  v16 = self;
  v15 = a2;
  v14 = 0;
  if (self->super._logHandle)
  {
    logHandle = v16->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v14 = logHandle;
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    __os_log_helper_16_0_0(v12);
    _os_log_impl(&dword_1B5291000, log, type, "Stop", v12, 2u);
  }
  -[KeyboardBacklight stopKBDeviceManagementServiceLookup](v16, "stopKBDeviceManagementServiceLookup");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v16, CFSTR("com.apple.springboard.deviceWillShutDown"), 0);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = (__CFString *)objc_msgSend(v3, "initWithUTF8String:", *MEMORY[0x1E0D27C98]);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, v16, v11, 0);

  if (v16->_forceLuxUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v16->_forceLuxUpdateTimer);
    dispatch_release((dispatch_object_t)v16->_forceLuxUpdateTimer);
    v16->_forceLuxUpdateTimer = 0;
  }
  if (v16->_backlightUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v16->_backlightUpdateTimer);
    dispatch_release((dispatch_object_t)v16->_backlightUpdateTimer);
    v16->_backlightUpdateTimer = 0;
  }
  v16->_numOfBacklightUpdateRetries = 0;
  if (v16->_rampTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v16->_rampTimer);
    dispatch_release((dispatch_object_t)v16->_rampTimer);
    v16->_rampTimer = 0;
  }
  if (v16->_activityNotificationHandle)
  {
    v6 = &OBJC_IVAR___BLControl__clientDisplayMap;
    IOPMUnregisterNotification();
    v16->_activityNotificationHandle = 0;
  }
  -[HIDDevice close](v16->_device, "close", v6);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", v16, CFSTR("com.apple.AmbientLightSensorHID.PreferencesChanged"), 0);
}

- (void)start
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v3;
  os_log_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  __CFNotificationCenter *center;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *v27;
  uint8_t v28[7];
  char v29;
  NSObject *v30;
  uint8_t v31[7];
  char v32;
  NSObject *v33;
  os_log_type_t v34;
  os_log_t v35;
  id v36;
  os_log_type_t v37;
  os_log_t v38;
  os_log_type_t v39;
  os_log_t v40;
  id v41;
  uint8_t v42[7];
  char v43;
  NSObject *v44;
  SEL v45;
  KeyboardBacklight *v46;
  uint8_t v47[16];
  uint8_t v48[16];
  uint8_t v49[16];
  uint8_t v50[24];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v46 = self;
  v45 = a2;
  v44 = 0;
  if (self->super._logHandle)
  {
    logHandle = v46->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v44 = logHandle;
  v43 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v44;
    type = v43;
    __os_log_helper_16_0_0(v42);
    _os_log_debug_impl(&dword_1B5291000, log, type, "Get properties for Keyboard Backlight", v42, 2u);
  }
  v46->_properties = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v41 = 0;
  v41 = (id)-[HIDDevice propertyForKey:](v46->_device, "propertyForKey:", CFSTR("KeyboardUniqueID"));
  if (v41)
  {
    -[KeyboardBacklight setKeyboardID:](v46, "setKeyboardID:", objc_msgSend(v41, "unsignedIntegerValue"));
    v40 = 0;
    if (v46->super._logHandle)
    {
      v22 = v46->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v21 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v21 = init_default_corebrightness_log();
      v22 = v21;
    }
    v40 = v22;
    v39 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v50, (uint64_t)v41);
      _os_log_impl(&dword_1B5291000, v40, v39, "KeyboardID = %{public}@", v50, 0xCu);
    }
  }
  else
  {
    v46->_keyboardID = +[KeyboardBacklight getHashIDForDevice:](KeyboardBacklight, "getHashIDForDevice:", v46->_device);
    v38 = 0;
    if (v46->super._logHandle)
    {
      v20 = v46->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v19 = init_default_corebrightness_log();
      v20 = v19;
    }
    v38 = v20;
    v37 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v49, v46->_keyboardID);
      _os_log_debug_impl(&dword_1B5291000, v38, v37, "Keyboard ID = %lu", v49, 0xCu);
    }
  }
  v36 = 0;
  v36 = (id)-[HIDDevice propertyForKey:](v46->_device, "propertyForKey:", CFSTR("Built-In"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46->_builtIn = objc_msgSend(v36, "BOOLValue") & 1;
    v35 = 0;
    if (v46->super._logHandle)
    {
      v18 = v46->super._logHandle;
    }
    else
    {
      v17 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v18 = v17;
    }
    v35 = v18;
    v34 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v48, (uint64_t)v36);
      _os_log_impl(&dword_1B5291000, v35, v34, "builtIn = %{public}@", v48, 0xCu);
    }
  }
  -[KeyboardBacklight getKeyboardBacklightPreferences](v46, "getKeyboardBacklightPreferences");
  -[KeyboardBacklight storeKeyboardBacklightPreferences](v46, "storeKeyboardBacklightPreferences");
  -[KeyboardBacklight resetKeyDimTimeout](v46, "resetKeyDimTimeout");
  v33 = 0;
  if (v46->super._logHandle)
  {
    v16 = v46->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v15 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v15 = init_default_corebrightness_log();
    v16 = v15;
  }
  v33 = v16;
  v32 = 2;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v13 = v33;
    v14 = v32;
    __os_log_helper_16_0_0(v31);
    _os_log_debug_impl(&dword_1B5291000, v13, v14, "Registering for device shutdown notification", v31, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v46, (CFNotificationCallback)handleShutdownNotification, CFSTR("com.apple.springboard.deviceWillShutDown"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v30 = 0;
  if (v46->super._logHandle)
  {
    v12 = v46->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v11 = init_default_corebrightness_log();
    v12 = v11;
  }
  v30 = v12;
  v29 = 2;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v9 = v30;
    v10 = v29;
    __os_log_helper_16_0_0(v28);
    _os_log_debug_impl(&dword_1B5291000, v9, v10, "Registering for keyboard availability notification", v28, 2u);
  }
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7 = (_QWORD *)MEMORY[0x1E0D27C98];
  v27 = (void *)objc_msgSend(v3, "initWithUTF8String:", *MEMORY[0x1E0D27C98]);
  center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(center, v46, (CFNotificationCallback)handleAvailabilityNotification, (CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v7), 0, (CFNotificationSuspensionBehavior)0);

  if (v46->super._logHandle)
  {
    v6 = v46->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v5 = init_default_corebrightness_log();
    v6 = v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v4 = v6;
    __os_log_helper_16_2_1_8_64((uint64_t)v47, (uint64_t)v46);
    _os_log_debug_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEBUG, "%@", v47, 0xCu);
  }
  -[KeyboardBacklight startKBDeviceManagementServiceLookup](v46, "startKBDeviceManagementServiceLookup", v4);
}

- (void)startKBDeviceManagementServiceLookup
{
  const __CFDictionary *v2;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  IONotificationPortRef notifyPort;
  io_object_t v7;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  self->_deviceManagementArrivalNotificationPort = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  IONotificationPortSetDispatchQueue(self->_deviceManagementArrivalNotificationPort, (dispatch_queue_t)self->super._queue);
  notifyPort = self->_deviceManagementArrivalNotificationPort;
  v2 = IOServiceMatching("AppleDeviceManagementHIDEventService");
  if (!IOServiceAddMatchingNotification(notifyPort, "IOServiceFirstMatch", v2, (IOServiceMatchingCallback)deviceManagementArrivalCallback, self, &self->_deviceManagementArrivalIterator)&& self->_deviceManagementArrivalIterator)
  {
    while (1)
    {
      v7 = IOIteratorNext(self->_deviceManagementArrivalIterator);
      if (!v7)
        break;
      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v9, v7);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Found device management service (%u)", v9, 8u);
      }
      -[KeyboardBacklight handleDeviceManagementArrival:](self, "handleDeviceManagementArrival:", v7);
    }
  }
  objc_autoreleasePoolPop(context);
}

- (void)stopKBDeviceManagementServiceLookup
{
  if (self->_deviceManagementArrivalNotificationPort)
  {
    IONotificationPortDestroy(self->_deviceManagementArrivalNotificationPort);
    self->_deviceManagementArrivalNotificationPort = 0;
  }
  if (self->_deviceManagementArrivalIterator)
  {
    IOObjectRelease(self->_deviceManagementArrivalIterator);
    self->_deviceManagementArrivalIterator = 0;
  }
}

- (void)handleDeviceManagementArrival:(unsigned int)a3
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t inited;
  NSObject *logHandle;
  CFTypeID v13;
  uint8_t v14[7];
  char v15;
  NSObject *v16;
  uint8_t v17[15];
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  os_log_t v21;
  unsigned int valuePtr;
  const __CFNumber *CFProperty;
  io_registry_entry_t v24;
  SEL v25;
  KeyboardBacklight *v26;
  uint8_t v27[8];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = self;
  v25 = a2;
  v24 = a3;
  if (a3)
  {
    CFProperty = 0;
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v24, CFSTR("ColorID"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty && (v13 = CFGetTypeID(CFProperty), v13 == CFNumberGetTypeID()))
    {
      valuePtr = 0;
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
      v21 = 0;
      if (v26->super._logHandle)
      {
        logHandle = v26->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v21 = logHandle;
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v27, valuePtr);
        _os_log_impl(&dword_1B5291000, v21, v20, "Found device colorID = %d", v27, 8u);
      }
      -[KeyboardBacklight setColor:](v26, "setColor:", valuePtr);
    }
    else
    {
      v19 = 0;
      if (v26->super._logHandle)
      {
        v10 = v26->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v9 = init_default_corebrightness_log();
        v10 = v9;
      }
      v19 = v10;
      v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v19;
        v8 = v18;
        __os_log_helper_16_0_0(v17);
        _os_log_impl(&dword_1B5291000, v7, v8, "Device color is not present", v17, 2u);
      }
    }
    if (CFProperty)
      CFRelease(CFProperty);
  }
  else
  {
    v16 = 0;
    if (v26->super._logHandle)
    {
      v6 = v26->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v5 = init_default_corebrightness_log();
      v6 = v5;
    }
    v16 = v6;
    v15 = 16;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v3 = v16;
      v4 = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_error_impl(&dword_1B5291000, v3, v4, "No service", v14, 2u);
    }
  }
}

- (BOOL)retrieveKeyboardBacklightElements
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t inited;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id obj;
  uint64_t v23;
  NSObject *log;
  os_log_type_t v25;
  uint64_t v26;
  NSObject *logHandle;
  uint8_t v28[7];
  os_log_type_t v29;
  os_log_t v30;
  os_log_type_t v31;
  os_log_t v32;
  os_log_type_t v33;
  os_log_t v34;
  _QWORD __b[8];
  id v36;
  uint8_t v37[15];
  os_log_type_t type;
  os_log_t oslog;
  id v40;
  void *v41;
  char v42;
  SEL v43;
  KeyboardBacklight *v44;
  uint8_t v45[16];
  uint8_t v46[72];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v44 = self;
  v43 = a2;
  v42 = 0;
  v41 = &unk_1E6917768;
  v40 = 0;
  v40 = (id)-[HIDDevice elementsMatching:](self->_device, "elementsMatching:", &unk_1E6917768);
  if (!objc_msgSend(v40, "count"))
  {
    oslog = 0;
    if (v44->super._logHandle)
    {
      logHandle = v44->super._logHandle;
    }
    else
    {
      v26 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v26;
    }
    oslog = logHandle;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v25 = type;
      __os_log_helper_16_0_0(v37);
      _os_log_error_impl(&dword_1B5291000, log, v25, "HID elements not found.", v37, 2u);
    }
  }
  memset(__b, 0, sizeof(__b));
  obj = v40;
  v23 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
  if (v23)
  {
    v19 = *(_QWORD *)__b[2];
    v20 = 0;
    v21 = v23;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)__b[2] != v19)
        objc_enumerationMutation(obj);
      v36 = 0;
      v36 = *(id *)(__b[1] + 8 * v20);
      if (objc_msgSend(v36, "type") == 257)
      {
        v34 = 0;
        if (v44->super._logHandle)
        {
          v17 = v44->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          v17 = inited;
        }
        v34 = v17;
        v33 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v10 = objc_msgSend(v36, "usage");
          v11 = objc_msgSend(v36, "usagePage");
          v12 = objc_msgSend(v36, "reportID");
          v13 = objc_msgSend(v36, "unit");
          v14 = objc_msgSend(v36, "reportSize");
          v15 = objc_msgSend(v36, "logicalMax");
          __os_log_helper_16_0_7_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v46, v10, v11, v12, v13, v14, v15, objc_msgSend(v36, "logicalMin"));
          _os_log_debug_impl(&dword_1B5291000, v34, v33, "usage = 0x%lx, usage page = 0x%lx, reportID = %ld, unit = 0x%lx, reportSize = %ld, max logical = %ld, min logical = %ld", v46, 0x48u);
        }
        v9 = objc_msgSend(v36, "usage") - 1;
        if (v9 <= 4)
          __asm { BR              X8 }
        v32 = 0;
        if (v44->super._logHandle)
        {
          v8 = v44->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v7 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v7 = init_default_corebrightness_log();
          v8 = v7;
        }
        v32 = v8;
        v31 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v45, objc_msgSend(v36, "usage"));
          _os_log_debug_impl(&dword_1B5291000, v32, v31, "Unknown element with usage = %ld", v45, 0xCu);
        }
      }
      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
        if (!v21)
          break;
      }
    }
  }

  if (v44->_levelElement && v44->_levelFadeSpeedElement)
  {
    v42 = 1;
  }
  else
  {
    v30 = 0;
    if (v44->super._logHandle)
    {
      v6 = v44->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v5 = init_default_corebrightness_log();
      v6 = v5;
    }
    v30 = v6;
    v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v3 = v30;
      v4 = v29;
      __os_log_helper_16_0_0(v28);
      _os_log_error_impl(&dword_1B5291000, v3, v4, "Elements to set keyboard backlight level are not available", v28, 2u);
    }
  }
  return v42 & 1;
}

- (NSString)description
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;

  v28 = (void *)MEMORY[0x1E0CB3940];
  -[KeyboardBacklight currentLux](self, "currentLux");
  v13 = v2;
  -[KeyboardBacklight brightness](self, "brightness");
  v14 = v3;
  -[KeyboardBacklight levelPercentage](self, "levelPercentage");
  v15 = v4;
  v16 = -[KeyboardBacklight saturated](self, "saturated");
  v17 = -[KeyboardBacklight manualAdjust](self, "manualAdjust");
  v18 = -[KeyboardBacklight autoAdjust](self, "autoAdjust");
  v19 = -[KeyboardBacklight suppressed](self, "suppressed");
  v20 = -[KeyboardBacklight dimmed](self, "dimmed");
  v21 = -[KeyboardBacklight muted](self, "muted");
  -[KeyboardBacklight levelMin](self, "levelMin");
  v22 = v5;
  -[KeyboardBacklight levelMax](self, "levelMax");
  v23 = v6;
  -[KeyboardBacklight levelOff](self, "levelOff");
  v24 = v7;
  -[KeyboardBacklight ambientOffset](self, "ambientOffset");
  v25 = v8;
  -[KeyboardBacklight ambientSlope](self, "ambientSlope");
  v26 = v9;
  -[KeyboardBacklight ambientLowThreshold](self, "ambientLowThreshold");
  v27 = v10;
  -[KeyboardBacklight ambientHighThreshold](self, "ambientHighThreshold");
  return (NSString *)objc_msgSend(v28, "stringWithFormat:", CFSTR("currentLux %f brightness %f levelPercentage %f saturated %d manualAdjust %d autoAdjust %d suppressed %d dimmed %d muted %d levelMin %f levelMax %f levelOff %f ambientOffset %f ambientSlope %f ambientLowThreshold %f ambientHighThreshold %f suspend %d userActive %d HW available %d"), *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15, v16, v17, v18, v19, v20, v21, *(_QWORD *)&v22, *(_QWORD *)&v23, *(_QWORD *)&v24, *(_QWORD *)&v25, *(_QWORD *)&v26, *(_QWORD *)&v27, v11,
                       -[KeyboardBacklight suspend](self, "suspend"),
                       -[KeyboardBacklight userActive](self, "userActive"),
                       -[KeyboardBacklight keyboardAvailable](self, "keyboardAvailable"));
}

- (BOOL)suppressed
{
  BOOL v3;

  v3 = 1;
  if (!-[KeyboardBacklight dimmed](self, "dimmed"))
  {
    v3 = 1;
    if (!-[KeyboardBacklight muted](self, "muted"))
    {
      v3 = 1;
      if (-[KeyboardBacklight userActive](self, "userActive"))
      {
        v3 = 1;
        if (-[KeyboardBacklight keyboardAvailable](self, "keyboardAvailable"))
          return -[KeyboardBacklight clamshellClosed](self, "clamshellClosed");
      }
    }
  }
  return v3;
}

- (BOOL)dimmed
{
  BOOL v3;

  v3 = 0;
  if (self->_dimmed)
    return !self->_suspendDimming;
  return v3;
}

- (void)setDimmed:(BOOL)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v5;
  BOOL v6;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a3 != self->_dimmed)
  {
    v5 = -[KeyboardBacklight suppressed](self, "suppressed");
    self->_dimmed = v6;
    if (v5 != -[KeyboardBacklight suppressed](self, "suppressed"))
      -[KeyboardBacklight sendSuppressedNotification](self, "sendSuppressedNotification");
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v8, self->_dimmed);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "keyboard backlight dimmed %d", v8, 8u);
    }
  }
}

- (BOOL)suspend
{
  return self->_suspend;
}

- (void)setSuspend:(BOOL)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 != self->_suspend)
  {
    self->_suspend = a3;
    if (self->_suspend)
      -[KeyboardBacklight stopRamp](self, "stopRamp");
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v6, self->_suspend);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Suspend auto-brightness = %d", v6, 8u);
    }
  }
}

- (BOOL)userActive
{
  return self->_userActive;
}

- (void)setUserActive:(BOOL)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v5;
  BOOL v6;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a3 != self->_userActive)
  {
    v5 = -[KeyboardBacklight suppressed](self, "suppressed");
    self->_userActive = v6;
    if (v5 != -[KeyboardBacklight suppressed](self, "suppressed"))
      -[KeyboardBacklight sendSuppressedNotification](self, "sendSuppressedNotification");
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v8, self->_userActive);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "User activity %d", v8, 8u);
    }
  }
}

- (BOOL)keyboardAvailable
{
  return self->_keyboardAvailable;
}

- (void)setKeyboardAvailable:(BOOL)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v5;
  BOOL v6;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a3 != self->_keyboardAvailable)
  {
    v5 = -[KeyboardBacklight suppressed](self, "suppressed");
    self->_keyboardAvailable = v6;
    if (v5 != -[KeyboardBacklight suppressed](self, "suppressed"))
      -[KeyboardBacklight sendSuppressedNotification](self, "sendSuppressedNotification");
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v8, self->_keyboardAvailable);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "HW keyboard availability %d", v8, 8u);
    }
  }
}

- (BOOL)clamshellClosed
{
  return self->_clamshellClosed;
}

- (void)setClamshellClosed:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  char v6;
  BOOL v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a3 != self->_clamshellClosed)
  {
    v6 = -[KeyboardBacklight suppressed](self, "suppressed");
    self->_clamshellClosed = v7;
    if (v6 != -[KeyboardBacklight suppressed](self, "suppressed"))
      -[KeyboardBacklight sendSuppressedNotification](self, "sendSuppressedNotification");
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
        v3 = "closed";
      else
        v3 = "opened";
      __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Clamshell is %s.", v9, 0xCu);
    }
  }
}

- (void)sendSuppressedNotification
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[KeyboardBacklight suppressed](self, "suppressed"));
  -[KeyboardBacklight sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightSuppressed"), v2);

}

- (void)updateBacklightDevice
{
  -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 0, a2, self);
}

- (void)updateBacklightDeviceWithReason:(unint64_t)a3
{
  float v3;
  float v4;
  double v5;
  uint64_t v6;
  float v8;

  -[KeyboardBacklight level](self, "level");
  v8 = v3;
  -[KeyboardBacklight levelOff](self, "levelOff");
  v4 = *(float *)&v5;
  *(float *)&v5 = v8;
  if (v8 == v4)
    v6 = 350;
  else
    v6 = 500;
  -[KeyboardBacklight updateBacklightDeviceWithFadeSpeed:commit:reason:](self, "updateBacklightDeviceWithFadeSpeed:commit:reason:", v6, 1, a3, v5);
}

- (void)updateBacklightDeviceWithFadeSpeed:(int)a3 commit:(BOOL)a4 reason:(unint64_t)a5
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  id v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  int v19;
  int v20;
  double v21;
  double v22;
  float v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  NSObject *v27;
  KeyboardBacklight *v28;
  KeyboardBacklight *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  KeyboardBacklight *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  NSObject *v43;
  float v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v50[7];
  os_log_type_t v51;
  os_log_t v52;
  char v53;
  uint64_t v54;
  os_log_type_t v55;
  os_log_t v56;
  os_log_type_t v57;
  os_log_t v58;
  os_log_type_t v59;
  os_log_t oslog;
  os_log_type_t v61;
  os_log_t v62;
  uint8_t v63[7];
  char v64;
  NSObject *v65;
  int v66;
  id v67;
  os_log_type_t v68;
  os_log_t v69;
  unint64_t v70;
  BOOL v71;
  int v72;
  SEL v73;
  KeyboardBacklight *v74;
  uint8_t v75[16];
  uint8_t v76[16];
  uint8_t v77[32];
  uint8_t v78[16];
  uint8_t v79[56];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v74 = self;
  v73 = a2;
  v72 = a3;
  v71 = a4;
  v70 = a5;
  v69 = 0;
  if (self->super._logHandle)
  {
    logHandle = v74->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v69 = logHandle;
  v68 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    -[KeyboardBacklight levelPercentage](v74, "levelPercentage");
    *(double *)&v46 = v5;
    -[KeyboardBacklight level](v74, "level");
    *(double *)&v47 = v6;
    -[KeyboardBacklight currentLux](v74, "currentLux");
    __os_log_helper_16_2_4_8_0_8_0_8_0_8_66((uint64_t)v79, v46, v47, COERCE__INT64(v7), (uint64_t)-[KeyboardBacklight brightnessUpdateReasonToString:](v74, "brightnessUpdateReasonToString:", v70));
    _os_log_impl(&dword_1B5291000, v69, v68, "levelPercentage %f, level = %f (nits/pwm), lux = %f (reason = %{public}@)", v79, 0x2Au);
  }
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = v72;
  if (v74->_backlightUpdateFrequency > 0 && (float)v72 <= (float)(1000.0 / (float)v74->_backlightUpdateFrequency))
    v66 = (int)(float)(1000.0 / (float)v74->_backlightUpdateFrequency);
  if (v66 > 0)
    v45 = v66;
  else
    v45 = 10;
  v66 = v45;
  -[KeyboardBacklight level](v74, "level");
  v44 = v8;
  -[KeyboardBacklight levelOff](v74, "levelOff");
  v9 = *(float *)&v10;
  *(float *)&v10 = v44;
  if (v44 == v9)
  {
    if (v74->_enableElement && v74->_enableFadeSpeedElement)
    {
      -[HIDElement setIntegerValue:](v74->_enableElement, "setIntegerValue:", 0, v10);
      -[HIDElement setIntegerValue:](v74->_enableFadeSpeedElement, "setIntegerValue:", v66);
      objc_msgSend(v67, "addObject:", v74->_enableElement);
      objc_msgSend(v67, "addObject:", v74->_enableFadeSpeedElement);
      v65 = 0;
      if (v74->super._logHandle)
      {
        v43 = v74->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v42 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v42 = init_default_corebrightness_log();
        v43 = v42;
      }
      v65 = v43;
      v64 = 1;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v40 = v65;
        v41 = v64;
        __os_log_helper_16_0_0(v63);
        _os_log_impl(&dword_1B5291000, v40, v41, "Turn off keyboard backlight", v63, 2u);
      }
    }
    else if (v74->_levelElement && v74->_levelFadeSpeedElement)
    {
      -[KeyboardBacklight levelOff](v74, "levelOff", v10);
      -[HIDElement setIntegerValue:](v74->_levelElement, "setIntegerValue:", (uint64_t)v11);
      -[HIDElement setIntegerValue:](v74->_levelFadeSpeedElement, "setIntegerValue:", v66);
      objc_msgSend(v67, "addObject:", v74->_levelElement);
      objc_msgSend(v67, "addObject:", v74->_levelFadeSpeedElement);
      v62 = 0;
      if (v74->super._logHandle)
      {
        v39 = v74->super._logHandle;
      }
      else
      {
        v38 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v39 = v38;
      }
      v62 = v39;
      v61 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        -[KeyboardBacklight levelOff](v74, "levelOff");
        __os_log_helper_16_0_1_8_0((uint64_t)v78, COERCE__INT64(v12));
        _os_log_impl(&dword_1B5291000, v62, v61, "Turn off keyboard backlight with level %f", v78, 0xCu);
      }
    }
  }
  else if (v74->_levelElement && v74->_levelFadeSpeedElement)
  {
    -[KeyboardBacklight level](v74, "level", v10);
    -[HIDElement setIntegerValue:](v74->_levelElement, "setIntegerValue:", (uint64_t)(float)(v13 * (float)-[KeyboardBacklight unitExponent](v74, "unitExponent")));
    -[HIDElement setIntegerValue:](v74->_levelFadeSpeedElement, "setIntegerValue:", v66);
    objc_msgSend(v67, "addObject:", v74->_levelElement);
    objc_msgSend(v67, "addObject:", v74->_levelFadeSpeedElement);
    if (v74->_enableElement
      && v74->_enableFadeSpeedElement
      && -[HIDElement integerValue](v74->_enableElement, "integerValue") != 1)
    {
      -[HIDElement setIntegerValue:](v74->_enableElement, "setIntegerValue:", 1);
      -[HIDElement setIntegerValue:](v74->_enableFadeSpeedElement, "setIntegerValue:", v66);
      objc_msgSend(v67, "addObject:", v74->_enableElement);
      objc_msgSend(v67, "addObject:", v74->_enableFadeSpeedElement);
    }
    oslog = 0;
    if (v74->super._logHandle)
    {
      v37 = v74->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v36 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v36 = init_default_corebrightness_log();
      v37 = v36;
    }
    oslog = v37;
    v59 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      -[KeyboardBacklight level](v74, "level");
      __os_log_helper_16_0_3_8_0_4_0_8_0((uint64_t)v77, COERCE__INT64(v14), v66, v70);
      _os_log_impl(&dword_1B5291000, oslog, v59, "Set keyboard backlight with level %f (nits/pwm), fade speed %d (ms), reason %lu", v77, 0x1Cu);
    }
  }
  if (objc_msgSend(v67, "count", v10))
  {
    if (v74->_backlightUpdateType != 1 || v70 == 4)
    {
      v56 = 0;
      if (v74->super._logHandle)
      {
        v32 = v74->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v31 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v31 = init_default_corebrightness_log();
        v32 = v31;
      }
      v56 = v32;
      v55 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v75, (uint64_t)v67);
        _os_log_impl(&dword_1B5291000, v56, v55, "Commit elements %@", v75, 0xCu);
      }
      v54 = 0;
      v53 = 0;
      v53 = -[HIDDevice commitElements:direction:error:](v74->_device, "commitElements:direction:error:", v67, 1, &v54) & 1;
      v29 = v74;
      -[KeyboardBacklight level](v74, "level");
      v30 = v19;
      -[KeyboardBacklight brightness](v74, "brightness");
      LODWORD(v21) = v20;
      LODWORD(v22) = v30;
      -[KeyboardBacklight didUpdateBacklightLevel:brightness:result:error:](v29, "didUpdateBacklightLevel:brightness:result:error:", v53 & 1, v54, v22, v21);
    }
    else
    {
      -[NSLock lock](v74->_backlightUpdateLock, "lock");

      v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v16 = objc_msgSend(v15, "initWithArray:", v67);
      v74->_elements = (NSMutableArray *)v16;
      if (v74->_backlightUpdateInProgress)
      {
        v58 = 0;
        if (v74->super._logHandle)
        {
          v34 = v74->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v33 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v33 = init_default_corebrightness_log();
          v34 = v33;
        }
        v58 = v34;
        v57 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          -[KeyboardBacklight timeToNextBacklightUpdate](v74, "timeToNextBacklightUpdate");
          __os_log_helper_16_0_1_8_0((uint64_t)v76, v18);
          _os_log_debug_impl(&dword_1B5291000, v58, v57, "Backlight update is scheduled already (in %f ms)", v76, 0xCu);
        }
      }
      else
      {
        v74->_backlightUpdateInProgress = 1;
        v35 = v74;
        -[KeyboardBacklight timeToNextBacklightUpdate](v74, "timeToNextBacklightUpdate");
        -[KeyboardBacklight scheduleBacklightUpdate:](v35, "scheduleBacklightUpdate:", (int)v17);
      }
      -[NSLock unlock](v74->_backlightUpdateLock, "unlock");
    }
    if (v70 == 3 || v70 == 1 && v71)
    {
      v28 = v74;
      -[KeyboardBacklight brightness](v74, "brightness");
      -[KeyboardBacklight rampToBrightness:withDuration:](v28, "rampToBrightness:withDuration:", v72);
    }
    else if (v70 != 2)
    {
      -[KeyboardBacklight brightness](v74, "brightness");
      v74->_ramp.current = v23;
    }
  }
  else
  {
    v52 = 0;
    if (v74->super._logHandle)
    {
      v27 = v74->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v26 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v26 = init_default_corebrightness_log();
      v27 = v26;
    }
    v52 = v27;
    v51 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v24 = v52;
      v25 = v51;
      __os_log_helper_16_0_0(v50);
      _os_log_error_impl(&dword_1B5291000, v24, v25, "No elements", v50, 2u);
    }
  }

}

- (void)updateAuthentication:(BOOL)a3
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v10;
  id v11;
  os_log_type_t v12;
  os_log_t v13;
  BOOL v14;
  SEL v15;
  KeyboardBacklight *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15 = a2;
  v14 = a3;
  if (-[KeyboardBacklight supportsAuthentication](self, "supportsAuthentication") && v16->_enableAuthenticationElement)
  {
    v13 = 0;
    if (v16->super._logHandle)
    {
      logHandle = v16->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v13 = logHandle;
    v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (v14)
        v3 = "Start";
      else
        v3 = "Stop";
      __os_log_helper_16_2_1_8_32((uint64_t)v19, (uint64_t)v3);
      _os_log_impl(&dword_1B5291000, v13, v12, "%s authentication", v19, 0xCu);
    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = 0;
    -[HIDElement setIntegerValue:](v16->_enableAuthenticationElement, "setIntegerValue:", v14);
    objc_msgSend(v11, "addObject:", v16->_enableAuthenticationElement);
    if ((-[HIDDevice commitElements:direction:error:](v16->_device, "commitElements:direction:error:", v11, 1, &v10) & 1) != 0)
    {
      if (v16->super._logHandle)
      {
        v5 = v16->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v4 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v4 = init_default_corebrightness_log();
        v5 = v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v17, v14);
        _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "Authentication updated successfully = %d", v17, 8u);
      }
    }
    else
    {
      if (v16->super._logHandle)
      {
        v7 = v16->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v6 = init_default_corebrightness_log();
        v7 = v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v18, v10);
        _os_log_error_impl(&dword_1B5291000, v7, OS_LOG_TYPE_ERROR, "Failed to set authentication %{public}@", v18, 0xCu);
      }
    }

  }
}

- (void)didUpdateBacklightLevel:(float)a3 brightness:(float)a4 result:(BOOL)a5 error:(id)a6
{
  id v6;
  double v7;
  id v8;
  double v9;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t v20[32];
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    self->_previousLevel = a3;
    self->_numOfBacklightUpdateRetries = 0;
    if (self->_previousLevelPercentage != a4)
    {
      self->_previousLevelPercentage = a4;
      v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v7 = a4;
      v15 = (id)objc_msgSend(v6, "initWithFloat:", v7);
      v8 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v9 = a3;
      v14 = (id)objc_msgSend(v8, "initWithFloat:", v9);
      -[KeyboardBacklight sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightBrightness"), v15);
      -[KeyboardBacklight sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightLevel"), v14);

    }
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v20, COERCE__INT64(a3), COERCE__INT64(a4));
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Backlight updated successfully - level = %f, brightness = %f", v20, 0x16u);
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      v13 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v12 = init_default_corebrightness_log();
      v13 = v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)a6);
      _os_log_error_impl(&dword_1B5291000, v13, OS_LOG_TYPE_ERROR, "%@", v21, 0xCu);
    }
    if (self->_numOfBacklightUpdateRetries < 12)
    {
      ++self->_numOfBacklightUpdateRetries;
      -[KeyboardBacklight scheduleBacklightUpdate:](self, "scheduleBacklightUpdate:", 250);
    }
  }
}

- (void)toggleMute
{
  -[KeyboardBacklight setMuted:](self, "setMuted:", !-[KeyboardBacklight muted](self, "muted"));
  if (-[KeyboardBacklight manualAdjust](self, "manualAdjust"))
    -[KeyboardBacklight setSaturated:](self, "setSaturated:", 0);
  -[KeyboardBacklight updateBacklightDevice](self, "updateBacklightDevice");
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  char v3;
  BOOL v4;

  v4 = a3;
  if (self->_muted != a3)
  {
    v3 = -[KeyboardBacklight suppressed](self, "suppressed");
    self->_muted = v4;
    if (v3 != -[KeyboardBacklight suppressed](self, "suppressed"))
      -[KeyboardBacklight sendSuppressedNotification](self, "sendSuppressedNotification");
    +[CBKeyboardPreferencesManager setBoolPreference:forKey:](CBKeyboardPreferencesManager, "setBoolPreference:forKey:", self->_muted, CFSTR("KeyboardBacklightMuted"));
  }
}

- (BOOL)manualAdjust
{
  return self->_manualAdjust;
}

- (void)setManualAdjust:(BOOL)a3
{
  int v3;

  LOBYTE(v3) = 1;
  if (!a3)
    v3 = !-[KeyboardBacklight autoAdjust](self, "autoAdjust");
  self->_manualAdjust = v3 & 1;
}

- (BOOL)saturated
{
  return self->_saturated;
}

- (void)setSaturated:(BOOL)a3
{
  float v3;
  _BOOL4 v4;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v7;
  id v8;
  BOOL saturated;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  saturated = self->_saturated;
  v7 = 0;
  if (a3)
    v7 = -[KeyboardBacklight autoAdjust](self, "autoAdjust");
  self->_saturated = v7;
  if (saturated != self->_saturated)
  {
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      v4 = self->_saturated;
      -[KeyboardBacklight currentLux](self, "currentLux");
      __os_log_helper_16_0_2_4_0_8_0((uint64_t)v11, v4, COERCE__INT64(v3));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "keyboard backlight saturated %d (Lux=%f)", v11, 0x12u);
    }
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_saturated);
    -[KeyboardBacklight sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightSaturated"), v8);

  }
}

- (float)brightness
{
  float v2;
  float v3;

  if (-[KeyboardBacklight suppressed](self, "suppressed") || -[KeyboardBacklight saturated](self, "saturated"))
  {
    -[KeyboardBacklight levelOff](self, "levelOff");
    return v2;
  }
  else
  {
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    return v3;
  }
}

- (void)setBrightness:(float)a3
{
  double v3;
  float v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  float v11;
  float v12;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v15[7];
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  os_log_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  os_log_type_t v26;
  os_log_t v27;
  float v28;
  SEL v29;
  KeyboardBacklight *v30;
  uint8_t v31[16];
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30 = self;
  v29 = a2;
  v28 = a3;
  v27 = 0;
  if (self->super._logHandle)
  {
    logHandle = v30->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v27 = logHandle;
  v26 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v32, COERCE__INT64(v28), -[KeyboardBacklight manualAdjust](v30, "manualAdjust"));
    _os_log_debug_impl(&dword_1B5291000, v27, v26, "Requested keyboard brightness %f, manualAdjust %d", v32, 0x12u);
  }
  if (-[KeyboardBacklight manualAdjust](v30, "manualAdjust"))
  {
    v25 = 0.0;
    v24 = 0.0;
    v23 = v28;
    if (v28 <= 0.0)
      v12 = v24;
    else
      v12 = v23;
    v22 = v12;
    v25 = v12;
    v21 = 1.0;
    if (v12 >= 1.0)
      v11 = v21;
    else
      v11 = v25;
    v20 = v11;
    *(float *)&v3 = v11;
    -[KeyboardBacklight setLevelPercentage:](v30, "setLevelPercentage:", v3);
    -[KeyboardBacklight setSaturated:](v30, "setSaturated:", 0);
    -[KeyboardBacklight levelPercentage](v30, "levelPercentage");
    -[KeyboardBacklight setMuted:](v30, "setMuted:", v4 == 0.0);
    -[KeyboardBacklight levelPercentage](v30, "levelPercentage");
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightManualBrightness"));
    -[KeyboardBacklight updateAmbientOffset](v30, "updateAmbientOffset");
    -[KeyboardBacklight updateBacklightDeviceWithReason:](v30, "updateBacklightDeviceWithReason:", 1);
    v19 = 0;
    if (v30->super._logHandle)
    {
      v10 = v30->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    v19 = v10;
    v18 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v30);
      _os_log_debug_impl(&dword_1B5291000, v19, v18, "%@", v31, 0xCu);
    }
  }
  else
  {
    v17 = 0;
    if (v30->super._logHandle)
    {
      v8 = v30->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    v17 = v8;
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v17;
      v6 = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1B5291000, v5, v6, "Manual keyboard brightness adjustment not allowed", v15, 2u);
    }
  }
}

- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5
{
  double v5;
  float v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  float v13;
  float v14;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v17[15];
  os_log_type_t v18;
  os_log_t oslog;
  os_log_type_t v20;
  os_log_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  os_log_type_t v28;
  os_log_t v29;
  BOOL v30;
  unsigned int v31;
  float v32;
  SEL v33;
  KeyboardBacklight *v34;
  uint8_t v35[16];
  uint8_t v36[40];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = self;
  v33 = a2;
  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = 0;
  if (self->super._logHandle)
  {
    logHandle = v34->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v29 = logHandle;
  v28 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_8_0_4_0_4_0_4_0((uint64_t)v36, COERCE__INT64(v32), -[KeyboardBacklight manualAdjust](v34, "manualAdjust"), v31, v30);
    _os_log_debug_impl(&dword_1B5291000, v29, v28, "Requested keyboard brightness %f, manualAdjust %d, fade speed %d, commit %d", v36, 0x1Eu);
  }
  if (-[KeyboardBacklight manualAdjust](v34, "manualAdjust"))
  {
    v27 = 0.0;
    v26 = 0.0;
    v25 = v32;
    if (v32 <= 0.0)
      v14 = v26;
    else
      v14 = v25;
    v24 = v14;
    v27 = v14;
    v23 = 1.0;
    if (v14 >= 1.0)
      v13 = v23;
    else
      v13 = v27;
    v22 = v13;
    *(float *)&v5 = v13;
    -[KeyboardBacklight setLevelPercentage:](v34, "setLevelPercentage:", v5);
    -[KeyboardBacklight setSaturated:](v34, "setSaturated:", 0);
    -[KeyboardBacklight levelPercentage](v34, "levelPercentage");
    -[KeyboardBacklight setMuted:](v34, "setMuted:", v6 == 0.0);
    -[KeyboardBacklight levelPercentage](v34, "levelPercentage");
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightManualBrightness"));
    -[KeyboardBacklight updateAmbientOffset](v34, "updateAmbientOffset");
    -[KeyboardBacklight updateBacklightDeviceWithFadeSpeed:commit:reason:](v34, "updateBacklightDeviceWithFadeSpeed:commit:reason:", v31, v30, 1);
    v21 = 0;
    if (v34->super._logHandle)
    {
      v12 = v34->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v11 = init_default_corebrightness_log();
      v12 = v11;
    }
    v21 = v12;
    v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v34);
      _os_log_debug_impl(&dword_1B5291000, v21, v20, "%@", v35, 0xCu);
    }
  }
  else
  {
    oslog = 0;
    if (v34->super._logHandle)
    {
      v10 = v34->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    oslog = v10;
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_impl(&dword_1B5291000, v7, v8, "Manual keyboard brightness adjustment not allowed", v17, 2u);
    }
  }
}

- (void)setBacklightLevel:(float)a3
{
  float v3;
  float v4;
  double v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v14, COERCE__INT64(a3));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Set backlight level = %f", v14, 0xCu);
  }
  -[KeyboardBacklight levelMin](self, "levelMin");
  v9 = a3 - v3;
  -[KeyboardBacklight levelMax](self, "levelMax");
  v8 = v4;
  -[KeyboardBacklight levelMin](self, "levelMin");
  if ((float)(v9 / (float)(v8 - *(float *)&v5)) >= 0.0)
    v7 = v9 / (float)(v8 - *(float *)&v5);
  else
    v7 = 0.0;
  if (v7 >= 1.0)
    v6 = 1.0;
  else
    v6 = v7;
  *(float *)&v5 = v6;
  -[KeyboardBacklight setBrightness:](self, "setBrightness:", v5);
}

- (void)updateAmbientOffset
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  float v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t inited;
  NSObject *logHandle;
  float v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  NSObject *v29;
  NSObject *log;
  os_log_type_t type;
  NSObject *v32;
  float v33;
  uint8_t v34[7];
  char v35;
  NSObject *v36;
  uint8_t v37[15];
  char v38;
  NSObject *v39;
  float v40;
  uint8_t v41[7];
  char v42;
  NSObject *v43;
  uint8_t v44[7];
  char v45;
  NSObject *v46;
  SEL v47;
  KeyboardBacklight *v48;
  uint8_t v49[16];
  uint8_t v50[56];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v48 = self;
  v47 = a2;
  -[KeyboardBacklight levelPercentage](self, "levelPercentage");
  if (v2 < 0.0)
  {
    v46 = 0;
    v32 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v46 = v32;
    v45 = 16;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      log = v46;
      type = v45;
      __os_log_helper_16_0_0(v44);
      _os_log_error_impl(&dword_1B5291000, log, type, "ASSERTION FAILED: self.levelPercentage >= 0.0", v44, 2u);
    }
  }
  -[KeyboardBacklight levelPercentage](v48, "levelPercentage");
  if (v3 > 1.0)
  {
    v43 = 0;
    v29 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v43 = v29;
    v42 = 16;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v27 = v43;
      v28 = v42;
      __os_log_helper_16_0_0(v41);
      _os_log_error_impl(&dword_1B5291000, v27, v28, "ASSERTION FAILED: self.levelPercentage <= 1.0", v41, 2u);
    }
  }
  -[KeyboardBacklight levelPercentage](v48, "levelPercentage");
  if (v4 >= 0.0)
  {
    -[KeyboardBacklight levelPercentage](v48, "levelPercentage");
    if (v5 <= 1.0
      && !-[KeyboardBacklight saturated](v48, "saturated")
      && -[KeyboardBacklight autoAdjust](v48, "autoAdjust"))
    {
      -[KeyboardBacklight currentLuxToAmbient](v48, "currentLuxToAmbient");
      v40 = v6;
      if (v6 < 0.0)
      {
        v39 = 0;
        v26 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
        v39 = v26;
        v38 = 16;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v24 = v39;
          v25 = v38;
          __os_log_helper_16_0_0(v37);
          _os_log_error_impl(&dword_1B5291000, v24, v25, "ASSERTION FAILED: ambient >= 0.0F", v37, 2u);
        }
      }
      if (v40 > 1.0)
      {
        v36 = 0;
        v23 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
        v36 = v23;
        v35 = 16;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v21 = v36;
          v22 = v35;
          __os_log_helper_16_0_0(v34);
          _os_log_error_impl(&dword_1B5291000, v21, v22, "ASSERTION FAILED: ambient <= 1.0F", v34, 2u);
        }
      }
      if (v40 >= 0.0 && v40 <= 1.0)
      {
        -[KeyboardBacklight levelPercentage](v48, "levelPercentage");
        v20 = v7;
        -[KeyboardBacklight ambientSlope](v48, "ambientSlope");
        v33 = v20 - (float)(v8 * v40);
        if (v48->super._logHandle)
        {
          logHandle = v48->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          *(double *)&v16 = v40;
          -[KeyboardBacklight levelPercentage](v48, "levelPercentage");
          *(double *)&v17 = v9;
          -[KeyboardBacklight ambientOffset](v48, "ambientOffset");
          __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v50, v16, v17, COERCE__INT64(v10), COERCE__INT64(v33));
          _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "keyboard offset changed: ambient = %1.5f, pwmPercentage = %1.5f, ambientOffset %1.5f, newOffset %1.5f", v50, 0x2Au);
        }
        -[KeyboardBacklight ambientOffset](v48, "ambientOffset");
        v12 = fabs((float)(v11 - v33));
        if (v12 > 0.001)
        {
          *(float *)&v12 = v33;
          -[KeyboardBacklight setAmbientOffset:](v48, "setAmbientOffset:", v12);
          if (v48->super._logHandle)
          {
            v15 = v48->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v14 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v14 = init_default_corebrightness_log();
            v15 = v14;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            -[KeyboardBacklight ambientOffset](v48, "ambientOffset");
            __os_log_helper_16_0_1_8_0((uint64_t)v49, COERCE__INT64(v13));
            _os_log_debug_impl(&dword_1B5291000, v15, OS_LOG_TYPE_DEBUG, "New ambientOffset %f", v49, 0xCu);
          }
          -[KeyboardBacklight ambientOffset](v48, "ambientOffset");
          +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightUserOffset"));
        }
      }
    }
  }
}

- (float)level
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;

  if (-[KeyboardBacklight suppressed](self, "suppressed") || -[KeyboardBacklight saturated](self, "saturated"))
  {
    -[KeyboardBacklight levelOff](self, "levelOff");
    return v2;
  }
  else
  {
    -[KeyboardBacklight levelMax](self, "levelMax");
    v12 = v3;
    -[KeyboardBacklight levelMin](self, "levelMin");
    v14 = v12 - v4;
    -[KeyboardBacklight levelPercentage](self, "levelPercentage");
    v13 = v5;
    -[KeyboardBacklight levelMin](self, "levelMin");
    v15 = (float)(int)rintf(v6 + (float)(v14 * v13));
    -[KeyboardBacklight levelMin](self, "levelMin");
    if (v15 >= v7)
      v11 = v15;
    else
      v11 = v7;
    -[KeyboardBacklight levelMax](self, "levelMax");
    if (v11 >= v8)
      return v8;
    else
      return v11;
  }
}

- (BOOL)supportsAuthentication
{
  return self->_enableAuthenticationElement != 0;
}

- (void)getCurrentLux
{
  double v2;
  float v3;
  uint64_t inited;
  NSObject *logHandle;
  const void *v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  if (-[NSMutableArray count](self->_alsServiceClients, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_alsServiceClients, "objectAtIndex:", 0);
    v6 = (const void *)IOHIDServiceClientCopyEvent();
  }
  if (v6)
  {
    IOHIDEventGetFloatValue();
    *(float *)&v2 = v2;
    -[KeyboardBacklight setCurrentLux:](self, "setCurrentLux:", v2);
    CFRelease(v6);
  }
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    -[KeyboardBacklight currentLux](self, "currentLux");
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(v3));
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "currentLux %f", v8, 0xCu);
  }
}

- (float)maxUserLevel
{
  float result;

  -[KeyboardBacklight levelMax](self, "levelMax", a2, self);
  return result;
}

- (void)handleLuxUpdate:(float)a3
{
  double v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  float v16;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  NSObject *v21;
  float v22;
  char v23;
  uint8_t v24[15];
  char v25;
  NSObject *v26;
  float v27;
  SEL v28;
  KeyboardBacklight *v29;
  uint8_t v30[16];
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = self;
  v28 = a2;
  v27 = a3;
  if (a3 < 0.0)
  {
    v26 = 0;
    v21 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v26 = v21;
    v25 = 16;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      log = v26;
      type = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_error_impl(&dword_1B5291000, log, type, "ASSERTION FAILED: lux >= 0.0F", v24, 2u);
    }
  }
  if (v29->super._logHandle)
  {
    logHandle = v29->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v31, COERCE__INT64(v27));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Lux=%f", v31, 0xCu);
  }
  *(float *)&v3 = v27;
  -[KeyboardBacklight setCurrentLux:](v29, "setCurrentLux:", v3);
  if (!-[KeyboardBacklight suspend](v29, "suspend"))
  {
    v23 = 1;
    -[KeyboardBacklight currentLuxToAmbient](v29, "currentLuxToAmbient");
    v22 = v4;
    v16 = v4;
    -[KeyboardBacklight ambientHighThreshold](v29, "ambientHighThreshold");
    v6 = v5;
    *(float *)&v7 = v16;
    -[KeyboardBacklight setManualAdjust:](v29, "setManualAdjust:", v16 <= v6, v7);
    if (-[KeyboardBacklight saturated](v29, "saturated")
      && (-[KeyboardBacklight ambientLowThreshold](v29, "ambientLowThreshold"),
          v8 = *(float *)&v9,
          *(float *)&v9 = v22,
          v22 < v8))
    {
      -[KeyboardBacklight setSaturated:](v29, "setSaturated:", 0, v9);
    }
    else if (-[KeyboardBacklight saturated](v29, "saturated")
           || (-[KeyboardBacklight ambientHighThreshold](v29, "ambientHighThreshold"),
               v10 = *(float *)&v11,
               *(float *)&v11 = v22,
               v22 <= v10))
    {
      if (-[KeyboardBacklight suppressed](v29, "suppressed") || -[KeyboardBacklight saturated](v29, "saturated"))
        v23 = 0;
    }
    else
    {
      -[KeyboardBacklight setSaturated:](v29, "setSaturated:", 1, v11);
    }
    -[KeyboardBacklight levelPercentage](v29, "levelPercentage");
    if (v12 > 0.0
      && -[KeyboardBacklight autoAdjust](v29, "autoAdjust")
      && !-[KeyboardBacklight suspend](v29, "suspend")
      && (v23 & 1) != 0)
    {
      *(float *)&v13 = v22;
      -[KeyboardBacklight calculateLevelPercentageAtAmbient:](v29, "calculateLevelPercentageAtAmbient:", v13);
      -[KeyboardBacklight updateBacklightDeviceWithReason:](v29, "updateBacklightDeviceWithReason:", 3);
    }
    if (v29->super._logHandle)
    {
      v15 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v14 = init_default_corebrightness_log();
      v15 = v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v29);
      _os_log_debug_impl(&dword_1B5291000, v15, OS_LOG_TYPE_DEBUG, "%@", v30, 0xCu);
    }
  }
}

- (float)currentLuxToAmbient
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  unsigned int i;
  float v14;

  v14 = 1.0;
  -[KeyboardBacklight currentLux](self, "currentLux");
  if (v2 > 0.0)
  {
    -[KeyboardBacklight currentLux](self, "currentLux");
    if (v3 < 300.0)
    {
      for (i = 0; i < 9; ++i)
      {
        -[KeyboardBacklight currentLux](self, "currentLux");
        if (v4 <= *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)i))
        {
          v12 = *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)(i - 1));
          v11 = *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)i);
          v10 = *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)(i - 1) + 1);
          v9 = *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)i + 1);
          -[KeyboardBacklight currentLux](self, "currentLux");
          v14 = v10 + (float)((float)((float)(v5 - v12) / (float)(v11 - v12)) * (float)(v9 - v10));
          break;
        }
      }
    }
    else
    {
      v14 = 1.0;
    }
  }
  else
  {
    v14 = 0.0;
  }
  if (v14 >= 1.0)
    v8 = 1.0;
  else
    v8 = v14;
  if (v8 <= 0.0)
    return 0.0;
  else
    return v8;
}

- (void)calculateLevelPercentageAtAmbient:(float)a3
{
  double v3;
  double v4;
  float v5;
  float v6;
  double v7;
  double v8;
  int v9;
  float v10;
  float v11;
  KeyboardBacklight *v12;
  float v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  NSObject *log;
  os_log_type_t type;
  NSObject *v19;
  uint8_t v20[7];
  char v21;
  NSObject *v22;
  uint8_t v23[15];
  char v24;
  NSObject *v25;
  float v26;
  SEL v27;
  KeyboardBacklight *v28;

  v28 = self;
  v27 = a2;
  v26 = a3;
  if (a3 < 0.0)
  {
    v25 = 0;
    v19 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v25 = v19;
    v24 = 16;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      log = v25;
      type = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_error_impl(&dword_1B5291000, log, type, "ASSERTION FAILED: ambient >= 0.0", v23, 2u);
    }
  }
  v3 = v26;
  if (v26 > 1.0)
  {
    v22 = 0;
    v16 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v22 = v16;
    v21 = 16;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v14 = v22;
      v15 = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_error_impl(&dword_1B5291000, v14, v15, "ASSERTION FAILED: ambient <= 1.0", v20, 2u);
    }
  }
  LODWORD(v3) = 981668463;
  -[KeyboardBacklight setLevelPercentage:](v28, "setLevelPercentage:", v3);
  if (v26 >= 0.0 && v26 <= 1.0)
  {
    v4 = v26;
    if (v26 == 0.0)
    {
      v13 = 0.001;
    }
    else
    {
      -[KeyboardBacklight ambientSlope](v28, "ambientSlope", v4);
      v13 = *(float *)&v4 * v26;
    }
    *(float *)&v4 = v13;
    -[KeyboardBacklight setLevelPercentage:](v28, "setLevelPercentage:", v4);
    v12 = v28;
    -[KeyboardBacklight ambientOffset](v28, "ambientOffset");
    v11 = v5;
    -[KeyboardBacklight levelPercentage](v12, "levelPercentage");
    *(float *)&v7 = v6 + v11;
    -[KeyboardBacklight setLevelPercentage:](v12, "setLevelPercentage:", v7);
    -[KeyboardBacklight levelPercentage](v28, "levelPercentage");
    if (*(float *)&v8 <= 1.0)
      v10 = *(float *)&v8;
    else
      v10 = 1.0;
    if (v10 <= 0.001)
      v9 = 981668463;
    else
      v9 = LODWORD(v10);
    LODWORD(v8) = v9;
    -[KeyboardBacklight setLevelPercentage:](v28, "setLevelPercentage:", v8);
  }
}

- (void)resetKeyDimTimeout
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[7];
  char v13;
  NSObject *v14;
  os_log_type_t v15;
  os_log_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  KeyboardBacklight *v22;
  os_log_type_t v23;
  os_log_t v24;
  os_log_type_t v25;
  os_log_t v26;
  SEL v28;
  KeyboardBacklight *v29;
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t v32[8];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29 = self;
  v28 = a2;
  if (-[KeyboardBacklight dimTime](self, "dimTime") <= 0)
  {
    if (v29->_activityNotificationHandle)
    {
      IOPMUnregisterNotification();
      v29->_activityNotificationHandle = 0;
    }
    v14 = 0;
    if (v29->super._logHandle)
    {
      logHandle = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v14 = logHandle;
    v13 = 1;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      v2 = v14;
      v3 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_impl(&dword_1B5291000, v2, v3, "Idle dim time for keyboard backlight has been turned off", v12, 2u);
    }
  }
  else if (v29->_activityNotificationHandle)
  {
    -[KeyboardBacklight dimTime](v29, "dimTime");
    if (IOPMSetUserActivityIdleTimeout())
    {
      v26 = 0;
      if (v29->super._logHandle)
      {
        v11 = v29->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v10 = init_default_corebrightness_log();
        v11 = v10;
      }
      v26 = v11;
      v25 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v32, -[KeyboardBacklight dimTime](v29, "dimTime"));
        _os_log_error_impl(&dword_1B5291000, v26, v25, "Failed to set idle dim time to %d sec", v32, 8u);
      }
    }
    else
    {
      v24 = 0;
      if (v29->super._logHandle)
      {
        v9 = v29->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v8 = init_default_corebrightness_log();
        v9 = v8;
      }
      v24 = v9;
      v23 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v31, -[KeyboardBacklight dimTime](v29, "dimTime"));
        _os_log_impl(&dword_1B5291000, v24, v23, "Idle dim time for keyboard backlight has been changed to %d sec", v31, 8u);
      }
    }
  }
  else
  {
    -[KeyboardBacklight dimTime](v29, "dimTime");
    v17 = MEMORY[0x1E0C809B0];
    v18 = -1073741824;
    v19 = 0;
    v20 = __39__KeyboardBacklight_resetKeyDimTimeout__block_invoke;
    v21 = &unk_1E68EB130;
    v22 = v29;
    v29->_activityNotificationHandle = IOPMScheduleUserActivityLevelNotificationWithTimeout();
    v16 = 0;
    if (v29->super._logHandle)
    {
      v7 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    v16 = v7;
    v15 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v30, -[KeyboardBacklight dimTime](v29, "dimTime"));
      _os_log_impl(&dword_1B5291000, v16, v15, "Idle dim time for keyboard backlight has been set to %d sec", v30, 8u);
    }
  }
}

uint64_t __39__KeyboardBacklight_resetKeyDimTimeout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePMUserActivityStateChanged:", a2, a1, a3, a2, a1);
}

- (void)handlePMUserActivityStateChanged:(unint64_t)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  id v6;
  id v7;
  BOOL v8;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = (a3 & 1) != 0;
  if ((a3 & 1) != 0)
  {
    -[KeyboardBacklight endKeyDim](self, "endKeyDim");
  }
  else
  {
    -[KeyboardBacklight setDimmed:](self, "setDimmed:", 1);
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
    -[KeyboardBacklight sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightIdleDimActive"), v7);

    -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 2);
  }
  v6 = (id)IOPMCopyUserActivityLevelDescription();
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v3 = "";
    else
      v3 = "in";
    __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v11, (uint64_t)v3, (uint64_t)v6, a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "User became %sactive (%{public}@ | Activity level = %llu)", v11, 0x20u);
  }

}

- (void)endKeyDim
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  void *v6;
  uint8_t v7[7];
  char v8;
  NSObject *v9;
  SEL v10;
  KeyboardBacklight *v11;

  v11 = self;
  v10 = a2;
  if (self->_dimmed && !-[KeyboardBacklight suspend](v11, "suspend"))
  {
    v9 = 0;
    if (v11->super._logHandle)
    {
      logHandle = v11->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v9 = logHandle;
    v8 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_1B5291000, log, type, "End keyboard backlight dimming", v7, 2u);
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
    -[KeyboardBacklight sendNotificationForKey:withValue:](v11, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightIdleDimActive"), v6);

    -[KeyboardBacklight setDimmed:](v11, "setDimmed:", 0);
    if (-[KeyboardBacklight manualAdjust](v11, "manualAdjust"))
      -[KeyboardBacklight setSaturated:](v11, "setSaturated:", 0);
    if (-[KeyboardBacklight autoAdjust](v11, "autoAdjust"))
      -[KeyboardBacklight forceLuxUpdate](v11, "forceLuxUpdate");
    else
      -[KeyboardBacklight updateBacklightDeviceWithReason:](v11, "updateBacklightDeviceWithReason:", 2);
  }
}

- (void)forceLuxUpdate
{
  dispatch_time_t v2;
  dispatch_source_t v3;
  NSObject *forceLuxUpdateTimer;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *source;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t handler;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  KeyboardBacklight *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[7];
  char v21;
  NSObject *v22;
  SEL v23;
  KeyboardBacklight *v24;

  v24 = self;
  v23 = a2;
  v22 = 0;
  if (self->super._logHandle)
  {
    logHandle = v24->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v22 = logHandle;
  v21 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v22;
    type = v21;
    __os_log_helper_16_0_0(v20);
    _os_log_debug_impl(&dword_1B5291000, log, type, "ForceLuxUpdate", v20, 2u);
  }
  v19 = 25;
  v18 = 200;
  if (v24->_forceLuxUpdateTimer)
  {
    source = v24->_forceLuxUpdateTimer;
    v2 = dispatch_time(0, 25000000);
    dispatch_source_set_timer(source, v2, 0xFFFFFFFFFFFFFFFFLL, 0xC8uLL);
  }
  else
  {
    v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v24->super._queue);
    v24->_forceLuxUpdateTimer = (OS_dispatch_source *)v3;
    if (v24->_forceLuxUpdateTimer)
    {
      forceLuxUpdateTimer = v24->_forceLuxUpdateTimer;
      handler = MEMORY[0x1E0C809B0];
      v13 = -1073741824;
      v14 = 0;
      v15 = __35__KeyboardBacklight_forceLuxUpdate__block_invoke;
      v16 = &unk_1E68E9E60;
      v17 = v24;
      dispatch_source_set_event_handler(forceLuxUpdateTimer, &handler);
      v6 = v24->_forceLuxUpdateTimer;
      v5 = dispatch_time(0, 25000000);
      dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0xC8uLL);
      dispatch_resume((dispatch_object_t)v24->_forceLuxUpdateTimer);
    }
  }
}

uint64_t __35__KeyboardBacklight_forceLuxUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceLuxUpdateRoutine", a1, a1);
}

- (void)forceLuxUpdateRoutine
{
  -[KeyboardBacklight getCurrentLux](self, "getCurrentLux");
  -[KeyboardBacklight currentLux](self, "currentLux");
  -[KeyboardBacklight handleLuxUpdate:](self, "handleLuxUpdate:");
  dispatch_source_cancel((dispatch_source_t)self->_forceLuxUpdateTimer);
  dispatch_release((dispatch_object_t)self->_forceLuxUpdateTimer);
  self->_forceLuxUpdateTimer = 0;
}

- (void)scheduleBacklightUpdate:(int)a3
{
  dispatch_time_t v3;
  NSObject *backlightUpdateTimer;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *source;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t handler;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  KeyboardBacklight *v15;
  os_log_type_t v16;
  os_log_t v17;
  uint64_t v18;
  int turnOnBacklightDelayMS;
  SEL v20;
  KeyboardBacklight *v21;
  uint8_t v22[8];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  turnOnBacklightDelayMS = a3;
  v18 = 200;
  if (self->_forceDelayToTurnOnBacklight && turnOnBacklightDelayMS < v21->_turnOnBacklightDelayMS)
    turnOnBacklightDelayMS = v21->_turnOnBacklightDelayMS;
  v17 = 0;
  if (v21->super._logHandle)
  {
    logHandle = v21->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v17 = logHandle;
  v16 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v22, turnOnBacklightDelayMS);
    _os_log_impl(&dword_1B5291000, v17, v16, "Schedule keyboard backlight update in %d ms", v22, 8u);
  }
  if (v21->_backlightUpdateTimer)
  {
    source = v21->_backlightUpdateTimer;
    v3 = dispatch_time(0, 1000000 * turnOnBacklightDelayMS);
    dispatch_source_set_timer(source, v3, 0xFFFFFFFFFFFFFFFFLL, 0xC8uLL);
  }
  else
  {
    v21->_backlightUpdateTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v21->super._queue);
    if (v21->_backlightUpdateTimer)
    {
      backlightUpdateTimer = v21->_backlightUpdateTimer;
      handler = MEMORY[0x1E0C809B0];
      v11 = -1073741824;
      v12 = 0;
      v13 = __45__KeyboardBacklight_scheduleBacklightUpdate___block_invoke;
      v14 = &unk_1E68E9E60;
      v15 = v21;
      dispatch_source_set_event_handler(backlightUpdateTimer, &handler);
      v6 = v21->_backlightUpdateTimer;
      v5 = dispatch_time(0, 1000000 * turnOnBacklightDelayMS);
      dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0xC8uLL);
      dispatch_resume((dispatch_object_t)v21->_backlightUpdateTimer);
    }
  }
  v21->_forceDelayToTurnOnBacklight = 0;
}

uint64_t __45__KeyboardBacklight_scheduleBacklightUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceBacklightUpdateRoutine", a1, a1);
}

- (void)forceBacklightUpdateRoutine
{
  int v2;
  int v3;
  char v4;
  double v5;
  double v6;
  os_log_t log;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v10;
  os_log_type_t v11;
  os_log_t v12;
  int v13;
  int v14;
  id v15;
  SEL v16;
  KeyboardBacklight *v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = self;
  v16 = a2;
  -[NSLock lock](self->_backlightUpdateLock, "lock");
  v15 = 0;
  v15 = (id)-[NSMutableArray copy](v17->_elements, "copy");
  v17->_backlightUpdateInProgress = 0;
  dispatch_source_cancel((dispatch_source_t)v17->_backlightUpdateTimer);
  dispatch_release((dispatch_object_t)v17->_backlightUpdateTimer);
  v17->_backlightUpdateTimer = 0;
  v17->_lastBacklightUpdate = mach_absolute_time();
  -[KeyboardBacklight brightness](v17, "brightness");
  v14 = v2;
  -[KeyboardBacklight level](v17, "level");
  v13 = v3;
  -[NSLock unlock](v17->_backlightUpdateLock, "unlock");
  if (objc_msgSend(v15, "count"))
  {
    v12 = 0;
    if (v17->super._logHandle)
    {
      logHandle = v17->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v12 = logHandle;
    v11 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      log = v12;
      __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v15);
      _os_log_impl(&dword_1B5291000, v12, v11, "Commit elements %@", v18, 0xCu);
    }
    v10 = 0;
    v4 = -[HIDDevice commitElements:direction:error:](v17->_device, "commitElements:direction:error:", v15, 1, &v10, log);
    LODWORD(v5) = v13;
    LODWORD(v6) = v14;
    -[KeyboardBacklight didUpdateBacklightLevel:brightness:result:error:](v17, "didUpdateBacklightLevel:brightness:result:error:", v4 & 1, v10, v5, v6);
  }

}

- (id)copyPropertyForKey:(id)a3
{
  double v3;
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightBrightness")) & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[KeyboardBacklight brightness](self, "brightness");
    v8 = (id)objc_msgSend(v7, "initWithFloat:");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightLevel")) & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[KeyboardBacklight previousLevel](self, "previousLevel");
    v8 = (id)objc_msgSend(v6, "initWithFloat:");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightSaturated")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[KeyboardBacklight saturated](self, "saturated"));
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightSuppressed")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[KeyboardBacklight suppressed](self, "suppressed"));
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightABSuspend")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[KeyboardBacklight suspend](self, "suspend"));
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightABEnabled")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[KeyboardBacklight autoAdjust](self, "autoAdjust"));
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightIdleDimTime")) & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v3 = (float)-[KeyboardBacklight dimTime](self, "dimTime");
    v8 = (id)objc_msgSend(v5, "initWithFloat:", v3);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightIdleDimActive")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[KeyboardBacklight dimmed](self, "dimmed"));
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightSuspendDimming")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_suspendDimming);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightBuiltIn")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[KeyboardBacklight builtIn](self, "builtIn"));
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("KeyboardBacklightUpdateFrequency")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", self->_backlightUpdateFrequency);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBUserAuthentication")) & 1) != 0)
  {
    if (-[KeyboardBacklight supportsAuthentication](self, "supportsAuthentication")
      && self->_enableAuthenticationElement)
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[HIDElement integerValue](self->_enableAuthenticationElement, "integerValue") != 0);
    }
  }
  else
  {
    v8 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3), "copy");
  }
  if (!v8)
    v8 = +[CBKeyboardPreferencesManager copyPreferenceForKey:](CBKeyboardPreferencesManager, "copyPreferenceForKey:", a3);
  if (!v8)
    return +[CBKeyboardPreferencesManager copyPreferenceForKey:keyboardID:](CBKeyboardPreferencesManager, "copyPreferenceForKey:keyboardID:", a3, -[KeyboardBacklight keyboardID](self, "keyboardID"));
  return v8;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  float v4;
  uint64_t inited;
  NSObject *logHandle;
  char v8;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightBrightness")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBBrightnessPropertyHandler:](self, "KBBrightnessPropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightLevel")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBBacklightLevelPropertyHandler:](self, "KBBacklightLevelPropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightABSuspend")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBAutoBrightnessSuspendPropertyHandler:](self, "KBAutoBrightnessSuspendPropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightABEnabled")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBAutoBrightnessEnablePropertyHandler:](self, "KBAutoBrightnessEnablePropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightIdleDimActive")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBIdleDimPropertyHandler:](self, "KBIdleDimPropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightIdleDimTime")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBIdleDimTimeHandler:](self, "KBIdleDimTimeHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightSuspendDimming")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBSuspendDimmingPropertyHandler:](self, "KBSuspendDimmingPropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CBUserActivityUpdate")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBUserActivityUpdateHandler:](self, "KBUserActivityUpdateHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqual:", CFSTR("DisplayBrightnessFactor")) & 1) != 0
         || (objc_msgSend(a4, "isEqual:", CFSTR("DisplayBrightnessFactorWithFade")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBDisplayBrightnessFactorPropertyHandler:](self, "KBDisplayBrightnessFactorPropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightUserOffset")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBUserOffsetPropertyHandler:](self, "KBUserOffsetPropertyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("KeyboardBacklightUpdateFrequency")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBUpdateFrequencyHandler:](self, "KBUpdateFrequencyHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("TrustedFrontLux")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a3, "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v12, COERCE__INT64(v4));
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "TrustedFrontLux from AABC = %f", v12, 0xCu);
      }
      objc_msgSend(a3, "floatValue");
      -[KeyboardBacklight handleLuxUpdate:](self, "handleLuxUpdate:");
      v8 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("ClamshellUpdate")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBClamshellUpdateHandler:](self, "KBClamshellUpdateHandler:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CBUserAuthentication")) & 1) != 0)
  {
    v8 = -[KeyboardBacklight KBAuthenticationHandler:](self, "KBAuthenticationHandler:", a3);
  }
  return v8 & 1;
}

- (BOOL)KBDisplayBrightnessFactorPropertyHandler:(id)a3
{
  float v3;
  double v4;
  uint64_t inited;
  NSObject *logHandle;
  id v8;
  BOOL displayOn;
  float v10;
  id v11;
  char v12;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = (id)objc_msgSend(a3, "objectForKey:", CFSTR("DisplayBrightnessFactor"));
  else
    v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 1;
    objc_msgSend(v11, "floatValue");
    v10 = v3;
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v15, COERCE__INT64(v10));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "KB: Brightness factor update = %f", v15, 0xCu);
    }
    displayOn = self->_displayOn;
    v4 = v10;
    self->_displayOn = v10 > 0.0;
    if (self->_displayOn != displayOn)
    {
      if (self->_displayOn)
        self->_forceDelayToTurnOnBacklight = 1;
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_displayOn);
      -[KeyboardBacklight KBUserActivityUpdateHandler:](self, "KBUserActivityUpdateHandler:", v8);

    }
    -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", v11, CFSTR("DisplayBrightnessFactor"), v4);
  }
  return v12 & 1;
}

- (BOOL)KBAutoBrightnessSuspendPropertyHandler:(id)a3
{
  BOOL v4;

  v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[KeyboardBacklight setSuspend:](self, "setSuspend:", objc_msgSend(a3, "BOOLValue") & 1);
    return 1;
  }
  return v4;
}

- (BOOL)KBAutoBrightnessEnablePropertyHandler:(id)a3
{
  int v4;
  uint64_t inited;
  NSObject *logHandle;
  char v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v10, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Set Keyboard Auto Brightness = %{public}@", v10, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CBKeyboardPreferencesManager setBoolPreference:forKey:](CBKeyboardPreferencesManager, "setBoolPreference:forKey:", objc_msgSend(a3, "BOOLValue") & 1, CFSTR("KeyboardBacklightABEnabled"));
    v4 = -[KeyboardBacklight autoAdjust](self, "autoAdjust");
    if (v4 != (objc_msgSend(a3, "BOOLValue") & 1))
    {
      -[KeyboardBacklight setAutoAdjust:](self, "setAutoAdjust:", objc_msgSend(a3, "BOOLValue") & 1);
      if (-[KeyboardBacklight autoAdjust](self, "autoAdjust"))
      {
        -[KeyboardBacklight updateAmbientOffset](self, "updateAmbientOffset");
        -[KeyboardBacklight forceLuxUpdate](self, "forceLuxUpdate");
      }
      else
      {
        -[KeyboardBacklight levelPercentage](self, "levelPercentage");
        +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightManualBrightness"));
        -[KeyboardBacklight setSaturated:](self, "setSaturated:", 0);
        -[KeyboardBacklight setManualAdjust:](self, "setManualAdjust:", 1);
      }
      -[KeyboardBacklight sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightABEnabled"), a3);
      -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 3);
    }
    v7 = 1;
  }
  return v7 & 1;
}

- (BOOL)KBBrightnessPropertyHandler:(id)a3
{
  int v3;
  char v4;
  double v5;
  int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v12 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    -[KeyboardBacklight setBrightness:](self, "setBrightness:");
    return 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Brightness"));
      v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("FadeSpeed"));
      v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Commit"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((objc_msgSend(v9, "BOOLValue") & 1) == 0 && !-[KeyboardBacklight suspend](self, "suspend"))
              -[KeyboardBacklight setSuspend:](self, "setSuspend:", 1);
            objc_msgSend(v11, "floatValue");
            v7 = v3;
            v8 = objc_msgSend(v10, "intValue");
            v4 = objc_msgSend(v9, "BOOLValue");
            LODWORD(v5) = v7;
            -[KeyboardBacklight setBrightness:withFadeSpeed:commit:](self, "setBrightness:withFadeSpeed:commit:", v8, v4 & 1, v5);
            if ((objc_msgSend(v9, "BOOLValue") & 1) != 0 && -[KeyboardBacklight suspend](self, "suspend"))
              -[KeyboardBacklight setSuspend:](self, "setSuspend:", 0);
          }
        }
      }
    }
  }
  return v12;
}

- (BOOL)KBBacklightLevelPropertyHandler:(id)a3
{
  BOOL v4;

  v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    -[KeyboardBacklight setBacklightLevel:](self, "setBacklightLevel:");
    return 1;
  }
  return v4;
}

- (BOOL)KBIdleDimPropertyHandler:(id)a3
{
  BOOL v4;

  v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a3, "BOOLValue") & 1) == 0)
  {
    -[KeyboardBacklight endKeyDim](self, "endKeyDim");
    return 1;
  }
  return v4;
}

- (BOOL)KBIdleDimTimeHandler:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  int v6;
  void *v7;
  char v8;
  uint8_t v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[KeyboardBacklight dimTime](self, "dimTime");
    if (v6 != objc_msgSend(a3, "intValue"))
    {
      +[CBKeyboardPreferencesManager setIntPreference:forKey:](CBKeyboardPreferencesManager, "setIntPreference:forKey:", objc_msgSend(a3, "intValue"), CFSTR("KeyboardBacklightIdleDimTime"));
      -[KeyboardBacklight setDimTime:](self, "setDimTime:", objc_msgSend(a3, "intValue"));
      if (self->_dimmed && !-[KeyboardBacklight dimTime](self, "dimTime"))
        -[KeyboardBacklight setDimmed:](self, "setDimmed:", 0);
      -[KeyboardBacklight resetKeyDimTimeout](self, "resetKeyDimTimeout");
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", -[KeyboardBacklight dimTime](self, "dimTime"));
      -[KeyboardBacklight sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightIdleDimTime"), v7);

      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v11, -[KeyboardBacklight dimTime](self, "dimTime"));
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Dim time changed to %d sec", v11, 8u);
      }
      -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 2);
    }
    v8 = 1;
  }
  return v8 & 1;
}

- (BOOL)KBSuspendDimmingPropertyHandler:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v8, objc_msgSend(a3, "BOOLValue") & 1);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Suspend dimming = %d", v8, 8u);
    }
    self->_suspendDimming = objc_msgSend(a3, "BOOLValue") & 1;
    -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 8);
  }
  return 0;
}

- (BOOL)KBUserActivityUpdateHandler:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v6;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[KeyboardBacklight setUserActive:](self, "setUserActive:", objc_msgSend(a3, "BOOLValue") & 1);
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v9, -[KeyboardBacklight userActive](self, "userActive"));
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "user active = %d", v9, 8u);
    }
    if (-[KeyboardBacklight userActive](self, "userActive") && -[KeyboardBacklight autoAdjust](self, "autoAdjust"))
      -[KeyboardBacklight forceLuxUpdate](self, "forceLuxUpdate");
    else
      -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 2);
    v6 = 1;
  }
  return v6 & 1;
}

- (BOOL)KBAvailabilityUpdateHandler:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v6;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[KeyboardBacklight setKeyboardAvailable:](self, "setKeyboardAvailable:", objc_msgSend(a3, "BOOLValue") & 1);
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v9, -[KeyboardBacklight keyboardAvailable](self, "keyboardAvailable"));
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "HW keyboard availability = %d", v9, 8u);
    }
    if (-[KeyboardBacklight keyboardAvailable](self, "keyboardAvailable")
      && -[KeyboardBacklight autoAdjust](self, "autoAdjust"))
    {
      -[KeyboardBacklight forceLuxUpdate](self, "forceLuxUpdate");
    }
    else
    {
      -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 5);
    }
    v6 = 1;
  }
  return v6 & 1;
}

- (BOOL)KBUserOffsetPropertyHandler:(id)a3
{
  float v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    self->_ambientOffset = v3;
    -[KeyboardBacklight ambientOffset](self, "ambientOffset");
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightUserOffset"));
    -[KeyboardBacklight forceLuxUpdate](self, "forceLuxUpdate");
  }
  return 0;
}

- (BOOL)KBUpdateFrequencyHandler:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v6;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_backlightUpdateFrequency = objc_msgSend(a3, "intValue");
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v9, objc_msgSend(a3, "intValue"));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Backlight update frequency = %d", v9, 8u);
    }
    v6 = 1;
  }
  return v6 & 1;
}

- (BOOL)KBClamshellUpdateHandler:(id)a3
{
  BOOL v4;

  v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[KeyboardBacklight setClamshellClosed:](self, "setClamshellClosed:", objc_msgSend(a3, "BOOLValue") & 1);
    -[KeyboardBacklight updateBacklightDeviceWithReason:](self, "updateBacklightDeviceWithReason:", 7);
    return 1;
  }
  return v4;
}

- (BOOL)KBAuthenticationHandler:(id)a3
{
  BOOL v4;

  v4 = 0;
  if (-[KeyboardBacklight supportsAuthentication](self, "supportsAuthentication"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[KeyboardBacklight updateAuthentication:](self, "updateAuthentication:", objc_msgSend(a3, "BOOLValue") & 1);
      return 1;
    }
  }
  return v4;
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  BOOL v4;

  v4 = 0;
  if (a3)
  {
    -[NSMutableArray addObject:](self->_alsServiceClients, "addObject:", a3);
    if (-[KeyboardBacklight autoAdjust](self, "autoAdjust"))
      -[KeyboardBacklight forceLuxUpdate](self, "forceLuxUpdate");
    else
      -[KeyboardBacklight updateBacklightDevice](self, "updateBacklightDevice");
    return 1;
  }
  return v4;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  double v4;
  BOOL v6;

  v6 = 0;
  if (IOHIDEventGetType() == 12
    && (-[NSMutableArray containsObject:](self->_alsServiceClients, "containsObject:", a4) & 1) != 0)
  {
    IOHIDEventGetFloatValue();
    *(float *)&v4 = v4;
    -[KeyboardBacklight handleLuxUpdate:](self, "handleLuxUpdate:", v4);
    return 1;
  }
  return v6;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSMutableArray *obj;
  uint64_t v9;
  _QWORD __b[8];
  __IOHIDServiceClient *v11;
  char v12;
  __IOHIDServiceClient *v13;
  SEL v14;
  KeyboardBacklight *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14 = a2;
  v13 = a3;
  v12 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v15->_alsServiceClients;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v11 = 0;
      v11 = *(__IOHIDServiceClient **)(__b[1] + 8 * v6);
      if (v11 == v13)
        v12 = 1;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          break;
      }
    }
  }
  if ((v12 & 1) != 0)
    -[NSMutableArray removeObject:](v15->_alsServiceClients, "removeObject:", v13);
  return v12 & 1;
}

+ (unint64_t)getHashIDForDevice:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E68EDC78);
  v4 = objc_msgSend(a3, "propertyForKey:", CFSTR("SerialNumber"));
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "appendString:", v4);
  }
  v5 = (void *)objc_msgSend(a3, "propertyForKey:", CFSTR("VendorID"));
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "appendString:", objc_msgSend(v5, "stringValue"));
  }
  v6 = (void *)objc_msgSend(a3, "propertyForKey:", CFSTR("ProductID"));
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "appendString:", objc_msgSend(v6, "stringValue"));
  }
  v8 = objc_msgSend(v7, "hash");

  return v8;
}

- (void)setKBPreferenceBacklightMaxUser
{
  id v2;
  void *v3;
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", -[KeyboardBacklight keyboardID](self, "keyboardID"));
  v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
  -[KeyboardBacklight maxUserLevel](self, "maxUserLevel");
  v3 = (void *)objc_msgSend(v2, "initWithFloat:");
  -[NSMutableDictionary setObject:forKey:](self->_keyboardSpecificPreferences, "setObject:forKey:", v3, CFSTR("KeyboardBacklightMaxUser"));
  +[CBKeyboardPreferencesManager setPreference:forKey:](CBKeyboardPreferencesManager, "setPreference:forKey:", self->_keyboardSpecificPreferences, objc_msgSend(v4, "stringValue"));

}

- (void)getKeyboardBacklightPreferences
{
  double v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v11[7];
  os_log_type_t v12;
  NSObject *v13;
  float v14;
  id v15;
  uint8_t v16[7];
  char v17;
  NSObject *v18;
  SEL v19;
  KeyboardBacklight *v20;

  v20 = self;
  v19 = a2;
  v18 = 0;
  if (self->super._logHandle)
  {
    logHandle = v20->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v18 = logHandle;
  v17 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v18;
    type = v17;
    __os_log_helper_16_0_0(v16);
    _os_log_debug_impl(&dword_1B5291000, log, type, "Get keyboard backlight prefereneces", v16, 2u);
  }
  v15 = +[CBKeyboardPreferencesManager copyAllPreferences](CBKeyboardPreferencesManager, "copyAllPreferences");
  if (v15 && objc_msgSend(v15, "count"))
  {
    v14 = -1.0;
    if (+[CBKeyboardPreferencesManager getFloatPreference:forKey:](CBKeyboardPreferencesManager, "getFloatPreference:forKey:", &v14, CFSTR("KeyboardBacklightPrefVersion"))&& v14 == 1.0)
    {
      +[CBKeyboardPreferencesManager getBoolPreference:forKey:](CBKeyboardPreferencesManager, "getBoolPreference:forKey:", &v20->_muted, CFSTR("KeyboardBacklightMuted"), v14);
      +[CBKeyboardPreferencesManager getFloatPreference:forKey:](CBKeyboardPreferencesManager, "getFloatPreference:forKey:", &v20->_levelPercentage, CFSTR("KeyboardBacklightManualBrightness"));
      if (-[KeyboardBacklight muted](v20, "muted"))
      {
        LODWORD(v2) = 0;
        -[KeyboardBacklight setLevelPercentage:](v20, "setLevelPercentage:", v2);
      }
      +[CBKeyboardPreferencesManager getBoolPreference:forKey:](CBKeyboardPreferencesManager, "getBoolPreference:forKey:", &v20->_autoAdjust, CFSTR("KeyboardBacklightABEnabled"));
      +[CBKeyboardPreferencesManager getIntPreference:forKey:](CBKeyboardPreferencesManager, "getIntPreference:forKey:", &v20->_dimTime, CFSTR("KeyboardBacklightIdleDimTime"));
      +[CBKeyboardPreferencesManager getFloatPreference:forKey:](CBKeyboardPreferencesManager, "getFloatPreference:forKey:", &v20->_ambientOffset, CFSTR("KeyboardBacklightUserOffset"));
    }
  }
  else
  {
    v13 = 0;
    if (v20->super._logHandle)
    {
      v6 = v20->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v5 = init_default_corebrightness_log();
      v6 = v5;
    }
    v13 = v6;
    v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v13;
      v4 = v12;
      __os_log_helper_16_0_0(v11);
      _os_log_impl(&dword_1B5291000, v3, v4, "Keyboard backlight preferences not present in defaults", v11, 2u);
    }
  }

}

- (void)storeKeyboardBacklightPreferences
{
  double v2;

  +[CBKeyboardPreferencesManager setBoolPreference:forKey:](CBKeyboardPreferencesManager, "setBoolPreference:forKey:", -[KeyboardBacklight muted](self, "muted"), CFSTR("KeyboardBacklightMuted"));
  -[KeyboardBacklight levelPercentage](self, "levelPercentage");
  +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightManualBrightness"));
  +[CBKeyboardPreferencesManager setBoolPreference:forKey:](CBKeyboardPreferencesManager, "setBoolPreference:forKey:", -[KeyboardBacklight autoAdjust](self, "autoAdjust"), CFSTR("KeyboardBacklightABEnabled"));
  +[CBKeyboardPreferencesManager setIntPreference:forKey:](CBKeyboardPreferencesManager, "setIntPreference:forKey:", -[KeyboardBacklight dimTime](self, "dimTime"), CFSTR("KeyboardBacklightIdleDimTime"));
  -[KeyboardBacklight ambientOffset](self, "ambientOffset");
  +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightUserOffset"));
  LODWORD(v2) = 1.0;
  +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", CFSTR("KeyboardBacklightPrefVersion"), v2);
  -[KeyboardBacklight setKBPreferenceBacklightMaxUser](self, "setKBPreferenceBacklightMaxUser");
}

- (void)rampToBrightness:(float)a3 withDuration:(unsigned int)a4
{
  -[KeyboardBacklight stopRamp](self, "stopRamp");
  self->_ramp.start = self->_ramp.current;
  self->_ramp.target = a3;
  self->_ramp.duration = (float)a4 / 1000.0;
  self->_ramp.startTime = CFAbsoluteTimeGetCurrent();
  -[KeyboardBacklight startRamp](self, "startRamp");
}

- (void)startRamp
{
  id v2;
  double v3;
  uint64_t block;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  KeyboardBacklight *v9;
  dispatch_object_t v10;
  dispatch_block_t v11;
  dispatch_object_t v12;
  float v13;
  id v14;
  SEL v15;
  KeyboardBacklight *v16;

  v16 = self;
  v15 = a2;
  if (self->_rampTimer || v16->_ramp.current == v16->_ramp.target || v16->_ramp.duration <= 0.0)
  {
    v14 = 0;
    v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v3 = v16->_ramp.target;
    v14 = (id)objc_msgSend(v2, "initWithFloat:", v3);
    -[KeyboardBacklight sendNotificationForKey:withValue:](v16, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightBrightnessSlider"), v14);

  }
  else
  {
    v13 = 16667000.0;
    v12 = 0;
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v16->super._queue);
    if (v12)
    {
      dispatch_source_set_timer(v12, 0, (unint64_t)v13, 0);
      v11 = 0;
      block = MEMORY[0x1E0C809B0];
      v5 = -1073741824;
      v6 = 0;
      v7 = __30__KeyboardBacklight_startRamp__block_invoke;
      v8 = &unk_1E68EA540;
      v9 = v16;
      v10 = v12;
      v11 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, &block);
      if (v11)
      {
        dispatch_source_set_event_handler(v12, v11);
        _Block_release(v11);
      }
      v16->_rampTimer = (OS_dispatch_source *)v12;
      dispatch_resume(v12);
    }
  }
}

uint64_t __30__KeyboardBacklight_startRamp__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerRoutine:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)timerRoutine:(id)a3
{
  float v3;
  float v4;
  id v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  float v9;
  float v10;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  id v15;
  uint8_t v16[15];
  char v17;
  NSObject *v18;
  double Current;
  int v20;
  id v21;
  SEL v22;
  KeyboardBacklight *v23;
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = 1017370378;
  Current = CFAbsoluteTimeGetCurrent();
  if (Current >= v23->_ramp.startTime + v23->_ramp.duration + 0.0199999996 || v23->_ramp.current == v23->_ramp.target)
  {
    if (v23->_rampTimer)
    {
      -[KeyboardBacklight stopRamp](v23, "stopRamp");
      v23->_ramp.current = v23->_ramp.target;
    }
    else
    {
      v18 = 0;
      if (v23->super._logHandle)
      {
        logHandle = v23->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v18 = logHandle;
      v17 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v18;
        type = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_error_impl(&dword_1B5291000, log, type, "Ramp timer null and the ramp is running. This shouldn't happen", v16, 2u);
      }
    }
  }
  else
  {
    v3 = Current - v23->_ramp.startTime;
    v4 = (float)((float)(v23->_ramp.target - v23->_ramp.start) * v3) / v23->_ramp.duration + v23->_ramp.start;
    v23->_ramp.current = v4;
    if (v23->_ramp.current <= 0.0)
      v10 = 0.0;
    else
      v10 = v23->_ramp.current;
    if (v10 >= 1.0)
      v9 = 1.0;
    else
      v9 = v10;
    v23->_ramp.current = v9;
    if (v23->super._logHandle)
    {
      v8 = v23->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v24, COERCE__INT64(v23->_ramp.current));
      _os_log_debug_impl(&dword_1B5291000, v8, OS_LOG_TYPE_DEBUG, "Keyboard backlight virtual ramp - current = %f", v24, 0xCu);
    }
    v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v6 = v23->_ramp.current;
    v15 = (id)objc_msgSend(v5, "initWithFloat:", v6);
    -[KeyboardBacklight sendNotificationForKey:withValue:](v23, "sendNotificationForKey:withValue:", CFSTR("KeyboardBacklightBrightnessSlider"), v15);

  }
}

- (void)stopRamp
{
  if (self->_rampTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_rampTimer);
    dispatch_release((dispatch_object_t)self->_rampTimer);
    self->_rampTimer = 0;
  }
}

- (double)timeToNextBacklightUpdate
{
  unint64_t v2;
  double v3;
  double v4;
  double v7;
  uint64_t v8;

  v8 = mach_absolute_time();
  LODWORD(v2) = self->_clockInfo.numer;
  v4 = (double)v2;
  v3 = (double)(v8 - self->_lastBacklightUpdate) * v4;
  LODWORD(v4) = self->_clockInfo.denom;
  v7 = (float)(1000.0 / (float)self->_backlightUpdateFrequency);
  if (v7 > v3 / (double)*(unint64_t *)&v4 / 1000000.0)
    return v7 - v3 / (double)*(unint64_t *)&v4 / 1000000.0;
  else
    return 0.0;
}

- (id)brightnessUpdateReasonToString:(unint64_t)a3
{
  if (a3 <= 8)
    __asm { BR              X8 }
  return CFSTR("Not Specified");
}

- (BOOL)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (unint64_t)keyboardID
{
  return self->_keyboardID;
}

- (void)setKeyboardID:(unint64_t)a3
{
  self->_keyboardID = a3;
}

- (int)dimTime
{
  return self->_dimTime;
}

- (void)setDimTime:(int)a3
{
  self->_dimTime = a3;
}

- (float)ambientOffset
{
  return self->_ambientOffset;
}

- (void)setAmbientOffset:(float)a3
{
  self->_ambientOffset = a3;
}

- (float)ambientHighThreshold
{
  return self->_ambientHighThreshold;
}

- (float)ambientLowThreshold
{
  return self->_ambientLowThreshold;
}

- (HIDDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  self->_device = (HIDDevice *)a3;
}

- (BOOL)autoAdjust
{
  return self->_autoAdjust;
}

- (void)setAutoAdjust:(BOOL)a3
{
  self->_autoAdjust = a3;
}

- (float)levelPercentage
{
  return self->_levelPercentage;
}

- (void)setLevelPercentage:(float)a3
{
  self->_levelPercentage = a3;
}

- (float)levelMin
{
  return self->_levelMin;
}

- (void)setLevelMin:(float)a3
{
  self->_levelMin = a3;
}

- (float)levelMax
{
  return self->_levelMax;
}

- (void)setLevelMax:(float)a3
{
  self->_levelMax = a3;
}

- (float)levelOff
{
  return self->_levelOff;
}

- (void)setLevelOff:(float)a3
{
  self->_levelOff = a3;
}

- (int)color
{
  return self->_color;
}

- (void)setColor:(int)a3
{
  self->_color = a3;
}

- (unsigned)levelUnit
{
  return self->_levelUnit;
}

- (void)setLevelUnit:(unsigned int)a3
{
  self->_levelUnit = a3;
}

- (unsigned)unitExponent
{
  return self->_unitExponent;
}

- (void)setUnitExponent:(unsigned int)a3
{
  self->_unitExponent = a3;
}

- (float)ambientSlope
{
  return self->_ambientSlope;
}

- (float)currentLux
{
  return self->_currentLux;
}

- (void)setCurrentLux:(float)a3
{
  self->_currentLux = a3;
}

- (BOOL)hysteresisOn
{
  return self->_hysteresisOn;
}

- (void)setHysteresisOn:(BOOL)a3
{
  self->_hysteresisOn = a3;
}

- (NSMutableDictionary)keyboardSpecificPreferences
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (void)setKeyboardSpecificPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (float)previousLevel
{
  return self->_previousLevel;
}

- (void)setPreviousLevel:(float)a3
{
  self->_previousLevel = a3;
}

@end
