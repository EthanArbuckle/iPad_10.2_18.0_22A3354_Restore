@implementation CBALSNode

- (BOOL)handleALSEvent:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v6;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  if (a3 && (__IOHIDServiceClient *)objc_msgSend(a3, "service") == self->_alsService)
  {
    if (self->_currentALSEvent)

    else
      objc_msgSend(a3, "setFirstALSSample:", 1);
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
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
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)a3);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "%@", v9, 0xCu);
    }
    self->_currentALSEvent = (CBALSEvent *)a3;
    v6 = 1;
  }
  return v6 & 1;
}

- (__IOHIDServiceClient)alsService
{
  return self->_alsService;
}

- (int)orientation
{
  return self->_orientation;
}

- (CBALSNode)initWithALSServiceClient:(__IOHIDServiceClient *)a3
{
  os_log_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  mach_port_t mainPort;
  NSObject *log;
  os_log_type_t type;
  NSObject *v10;
  const __CFNumber *number;
  uint64_t valuePtr;
  uint8_t v13[15];
  char v14;
  NSObject *v15;
  objc_super v16;
  __IOHIDServiceClient *v17;
  SEL v18;
  CBALSNode *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CBALSNode;
  v19 = -[CBALSNode init](&v16, sel_init);
  if (v19)
  {
    v3 = os_log_create("com.apple.CoreBrightness.CBALSNode", "default");
    v19->_logHandle = (OS_os_log *)v3;
    if (!v19->_logHandle)
    {
      v15 = 0;
      v10 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v15 = v10;
      v14 = 16;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        log = v15;
        type = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v13, 2u);
      }
    }
    v19->_alsService = v17;
    CFRetain(v19->_alsService);
    v19->_alsIOService = 0;
    valuePtr = 0;
    number = (const __CFNumber *)IOHIDServiceClientGetRegistryID(v19->_alsService);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
      if (valuePtr)
      {
        mainPort = *MEMORY[0x1E0CBBAA8];
        v4 = IORegistryEntryIDMatching(valuePtr);
        MatchingService = IOServiceGetMatchingService(mainPort, v4);
        v19->_alsIOService = MatchingService;
      }
    }
    -[CBALSNode initALSProperties](v19, "initALSProperties");
  }
  return v19;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBALSNode *v4;

  v4 = self;
  v3 = a2;

  if (v4->_alsService)
    CFRelease(v4->_alsService);
  if (v4->_alsIOService)
    IOObjectRelease(v4->_alsIOService);
  if (v4->_overrideHotspot)

  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBALSNode;
  -[CBALSNode dealloc](&v2, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("orientation:%d placement:%d useProx:%d digitizerFilterType:%d hotspot:[%@]"), self->_orientation, self->_placement, -[CBALSNode useProxForOcclusion](self, "useProxForOcclusion"), -[CBALSNode digitizerFilterWindow](self, "digitizerFilterWindow"), -[CBALSNode overrideHotspot](self, "overrideHotspot"));
}

- (void)initALSProperties
{
  uint64_t v2;
  BOOL v3;
  BOOL v4;
  BOOL v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  NSObject *v9;
  CFTypeID v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  CFTypeID v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  CFTypeID v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  CFTypeID v25;
  NSObject *log;
  os_log_type_t type;
  uint64_t v28;
  NSObject *v29;
  CFTypeID v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t inited;
  NSObject *logHandle;
  CFTypeID v35;
  uint8_t v36[7];
  char v37;
  NSObject *v38;
  uint8_t v39[7];
  char v40;
  NSObject *v41;
  uint8_t v42[7];
  char v43;
  NSObject *v44;
  uint8_t v45[7];
  char v46;
  NSObject *v47;
  uint8_t v48[7];
  char v49;
  NSObject *v50;
  uint8_t v51[15];
  char v52;
  NSObject *v53;
  const __CFNumber *v54;
  SEL v55;
  CBALSNode *v56;

  v56 = self;
  v55 = a2;
  self->_orientation = 0;
  v56->_placement = 0;
  v56->_sensorType = 0;
  v56->_superFastIntegrationTime = 99000;
  v56->_fastIntegrationTime = 100000;
  v56->_slowIntegrationTime = 250000;
  v56->_colorSupport = 0;
  v54 = 0;
  v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, CFSTR("Orientation"));
  if (v54 && (v35 = CFGetTypeID(v54), v35 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_orientation);
  }
  else
  {
    v53 = 0;
    if (v56->_logHandle)
    {
      logHandle = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v53 = logHandle;
    v52 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      v31 = v53;
      v32 = v52;
      __os_log_helper_16_0_0(v51);
      _os_log_error_impl(&dword_1B5291000, v31, v32, "Failed to load ALS orientation.", v51, 2u);
    }
  }
  if (v54)
    CFRelease(v54);
  v54 = 0;
  v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, CFSTR("Placement"));
  if (v54 && (v30 = CFGetTypeID(v54), v30 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_placement);
  }
  else
  {
    v50 = 0;
    if (v56->_logHandle)
    {
      v29 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v28 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v28 = init_default_corebrightness_log();
      v29 = v28;
    }
    v50 = v29;
    v49 = 16;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      log = v50;
      type = v49;
      __os_log_helper_16_0_0(v48);
      _os_log_error_impl(&dword_1B5291000, log, type, "Failed to load ALS placement.", v48, 2u);
    }
  }
  if (v54)
    CFRelease(v54);
  v54 = 0;
  v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, CFSTR("ALSSensorType"));
  if (v54 && (v25 = CFGetTypeID(v54), v25 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_sensorType);
  }
  else
  {
    v47 = 0;
    if (v56->_logHandle)
    {
      v24 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v23 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v23 = init_default_corebrightness_log();
      v24 = v23;
    }
    v47 = v24;
    v46 = 16;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v21 = v47;
      v22 = v46;
      __os_log_helper_16_0_0(v45);
      _os_log_error_impl(&dword_1B5291000, v21, v22, "Failed to load ALS sensor type.", v45, 2u);
    }
  }
  if (v54)
    CFRelease(v54);
  v54 = 0;
  v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, CFSTR("ALSFastIntegrationTime"));
  if (v54 && (v20 = CFGetTypeID(v54), v20 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_fastIntegrationTime);
  }
  else
  {
    v44 = 0;
    if (v56->_logHandle)
    {
      v19 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v18 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v18 = init_default_corebrightness_log();
      v19 = v18;
    }
    v44 = v19;
    v43 = 16;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v16 = v44;
      v17 = v43;
      __os_log_helper_16_0_0(v42);
      _os_log_error_impl(&dword_1B5291000, v16, v17, "Failed to load ALS fast integration time.", v42, 2u);
    }
  }
  if (v54)
    CFRelease(v54);
  v54 = 0;
  v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, CFSTR("ALSSuperFastIntegrationTime"));
  if (v54 && (v15 = CFGetTypeID(v54), v15 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_superFastIntegrationTime);
  }
  else
  {
    v41 = 0;
    if (v56->_logHandle)
    {
      v14 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v13 = init_default_corebrightness_log();
      v14 = v13;
    }
    v41 = v14;
    v40 = 16;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v11 = v41;
      v12 = v40;
      __os_log_helper_16_0_0(v39);
      _os_log_error_impl(&dword_1B5291000, v11, v12, "Failed to load ALS super fast integration time.", v39, 2u);
    }
  }
  if (v54)
    CFRelease(v54);
  v54 = 0;
  v54 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v56->_alsService, CFSTR("ALSSlowIntegrationTime"));
  if (v54 && (v10 = CFGetTypeID(v54), v10 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v54, kCFNumberSInt32Type, &v56->_slowIntegrationTime);
  }
  else
  {
    v38 = 0;
    if (v56->_logHandle)
    {
      v9 = v56->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v8 = init_default_corebrightness_log();
      v9 = v8;
    }
    v38 = v9;
    v37 = 16;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v6 = v38;
      v7 = v37;
      __os_log_helper_16_0_0(v36);
      _os_log_error_impl(&dword_1B5291000, v6, v7, "Failed to load ALS slow integration time.", v36, 2u);
    }
  }
  if (v54)
    CFRelease(v54);
  v54 = 0;
  v2 = -[CBALSNode copyHotspotLocation](v56, "copyHotspotLocation");
  v56->_overrideHotspot = (CBALSHotspotLocation *)v2;
  v3 = -[CBALSNode getUseProxForOcclusion](v56, "getUseProxForOcclusion");
  v56->_useProxForOcclusion = v3;
  v4 = -[CBALSNode getDigitizerFilterWindow](v56, "getDigitizerFilterWindow");
  v56->_digitizerFilterWindow = v4;
  v5 = -[CBALSNode getSupportsFloatLuxValue](v56, "getSupportsFloatLuxValue");
  v56->_supportsFloatLux = v5;
  -[CBALSNode isColorSupported](v56, "isColorSupported");
}

- (id)copyHotspotLocation
{
  double v2;
  double v3;
  float v5;
  float fixed_float_from_edt;
  CBALSHotspotLocation *v7;

  v7 = 0;
  if (self->_alsIOService)
  {
    fixed_float_from_edt = load_fixed_float_from_edt(self->_alsIOService, CFSTR("hotspot-center-x"));
    v5 = load_fixed_float_from_edt(self->_alsIOService, CFSTR("hotspot-center-y"));
    v7 = objc_alloc_init(CBALSHotspotLocation);
    *(float *)&v2 = fixed_float_from_edt;
    -[CBALSHotspotLocation setX:](v7, "setX:", v2);
    *(float *)&v3 = v5;
    -[CBALSHotspotLocation setY:](v7, "setY:", v3);
  }
  return v7;
}

- (BOOL)getUseProxForOcclusion
{
  int v3;
  BOOL v4;
  SEL v5;
  CBALSNode *v6;

  v6 = self;
  v5 = a2;
  v4 = 1;
  if (self->_alsIOService)
  {
    v3 = 0;
    if ((load_int_from_edt(v6->_alsIOService, CFSTR("use-prox-for-occlusion"), &v3) & 1) != 0)
      return v3 != 0;
  }
  return v4;
}

- (BOOL)getSupportsFloatLuxValue
{
  int v3;
  BOOL v4;
  SEL v5;
  CBALSNode *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  if (self->_alsIOService)
  {
    v3 = 0;
    if ((load_int_from_edt(v6->_alsIOService, CFSTR("supports-float-lux"), &v3) & 1) != 0)
      return v3 != 0;
  }
  return v4;
}

- (BOOL)getDigitizerFilterWindow
{
  uint64_t inited;
  NSObject *logHandle;
  unsigned int v5;
  uint64_t v6;
  SEL v7;
  CBALSNode *v8;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v7 = a2;
  v6 = 0;
  if (self->_alsIOService)
  {
    v5 = 0x7FFFFFFF;
    if ((load_int_from_edt(v8->_alsIOService, CFSTR("digitizer-filter-window-type"), &v5) & 1) != 0)
    {
      if (v5 > 1)
      {
        if (v8->_logHandle)
        {
          logHandle = v8->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v9, v5);
          _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "%d", v9, 8u);
        }
      }
      else
      {
        v6 = (int)v5;
      }
    }
  }
  return v6 != 0;
}

- (BOOL)isColorSupported
{
  const char *v2;
  uint64_t v4;
  NSObject *logHandle;
  CFTypeID TypeID;
  int valuePtr;
  const __CFNumber *v8;
  SEL v9;
  CBALSNode *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = self;
  v9 = a2;
  v8 = 0;
  v8 = (const __CFNumber *)IOHIDServiceClientCopyProperty(self->_alsService, CFSTR("crgb"));
  if (v8)
  {
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v8))
    {
      valuePtr = 0;
      CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
      v10->_colorSupport = valuePtr != 0;
      if (v10->_logHandle)
      {
        logHandle = v10->_logHandle;
      }
      else
      {
        v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v4;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        if (v10->_colorSupport)
          v2 = "";
        else
          v2 = "NOT";
        __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)v2);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "ALS Color support is %s available", v11, 0xCu);
      }
    }
  }
  if (v8)
    CFRelease(v8);
  return v10->_colorSupport;
}

- (BOOL)conformsToHIDServiceClient:(__IOHIDServiceClient *)a3
{
  return a3 == self->_alsService;
}

- (__IOHIDEvent)copyEvent
{
  uint64_t inited;
  NSObject *logHandle;
  CBALSEvent *v5;
  __IOHIDEvent *v6;
  CFTypeRef cf;
  uint8_t v10[184];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (self->_colorSupport)
  {
    memset(&v10[15], 0, 0xA9uLL);
    mach_absolute_time();
    cf = (CFTypeRef)IOHIDEventCreateVendorDefinedEvent();
    if (!cf)
      return 0;
  }
  v6 = (__IOHIDEvent *)IOHIDServiceClientCopyEvent();
  if (cf)
    CFRelease(cf);
  v5 = -[CBALSEvent initWithHIDEvent:andNode:]([CBALSEvent alloc], "initWithHIDEvent:andNode:", v6, self);
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v10, (uint64_t)v5);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Copied ALS: %{public}@", v10, 0xCu);
  }

  return v6;
}

- (id)copyALSEvent
{
  CBALSEvent *v3;
  __IOHIDEvent *cf;

  cf = -[CBALSNode copyEvent](self, "copyEvent");
  if (!cf)
    return 0;
  v3 = -[CBALSEvent initWithHIDEvent:andNode:]([CBALSEvent alloc], "initWithHIDEvent:andNode:", cf, self);
  CFRelease(cf);
  return v3;
}

- (id)copyALSEventWithinTimeout:(float)a3
{
  float v3;
  float v4;
  uint64_t inited;
  NSObject *logHandle;
  float v8;
  CBALSEvent *v9;
  __IOHIDEvent *v10;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = -[CBALSNode copyEvent](self, "copyEvent");
  if (!v10)
    return 0;
  v9 = -[CBALSEvent initWithHIDEvent:andNode:]([CBALSEvent alloc], "initWithHIDEvent:andNode:", v10, self);
  CFRelease(v10);
  v8 = mach_time_now_in_seconds();
  -[CBHIDEvent timestamp](v9, "timestamp");
  if (fabs((float)(v3 - v8)) >= a3)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
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
      -[CBHIDEvent timestamp](v9, "timestamp");
      __os_log_helper_16_0_1_8_0((uint64_t)v14, COERCE__INT64(fabs((float)(v4 - v8))));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Copied ALS event is stale (%f secs).", v14, 0xCu);
    }

    return 0;
  }
  return v9;
}

- (void)setReportInterval:(int)a3
{
  uint64_t inited;
  NSObject *logHandle;
  CFNumberRef property;
  int valuePtr;
  SEL v7;
  CBALSNode *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v7 = a2;
  valuePtr = a3;
  if (self->_logHandle)
  {
    logHandle = v8->_logHandle;
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
    __os_log_helper_16_2_2_4_0_8_64((uint64_t)v9, valuePtr, (uint64_t)v8);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Setting report interval to %d for ALS: %@", v9, 0x12u);
  }
  property = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (property)
  {
    IOHIDServiceClientSetProperty(v8->_alsService, CFSTR("ReportInterval"), property);
    CFRelease(property);
  }
}

- (CBALSEvent)currentALSEvent
{
  return self->_currentALSEvent;
}

- (void)setCurrentALSEvent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (int)placement
{
  return self->_placement;
}

- (int)sensorType
{
  return self->_sensorType;
}

- (BOOL)supportsFloatLux
{
  return self->_supportsFloatLux;
}

- (int)superFastIntegrationTime
{
  return self->_superFastIntegrationTime;
}

- (int)fastIntegrationTime
{
  return self->_fastIntegrationTime;
}

- (int)slowIntegrationTime
{
  return self->_slowIntegrationTime;
}

- (CBALSHotspotLocation)overrideHotspot
{
  return self->_overrideHotspot;
}

- (BOOL)useProxForOcclusion
{
  return self->_useProxForOcclusion;
}

- (int64_t)digitizerFilterWindow
{
  return self->_digitizerFilterWindow;
}

@end
