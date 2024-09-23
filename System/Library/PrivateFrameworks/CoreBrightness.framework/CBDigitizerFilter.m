@implementation CBDigitizerFilter

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  float v4;
  double v5;
  float v6;
  uint64_t inited;
  NSObject *logHandle;
  float v10;
  char v11;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  if ((objc_msgSend(a4, "isEqual:", CFSTR("AutoBrightnessTouchEnabled")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CBDigitizerFilter setIsActive:](self, "setIsActive:", objc_msgSend(a3, "BOOLValue") & 1);
      v11 = 1;
    }
  }
  else if ((objc_msgSend(a4, "isEqual:", CFSTR("AutoBrightnessTouchDelay")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a4, "floatValue");
      v10 = v4;
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
        -[CBDigitizerHotspot touchTriggerDelay](self->_hotspot, "touchTriggerDelay");
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v15, COERCE__INT64(v6), COERCE__INT64(v10));
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Changing delay=%f to %f", v15, 0x16u);
      }
      *(float *)&v5 = v10;
      -[CBDigitizerHotspot setTouchTriggerDelay:](self->_hotspot, "setTouchTriggerDelay:", v5);
      v11 = 1;
    }
  }
  return v11 & 1;
}

- (BOOL)isObstructed
{
  BOOL v3;

  v3 = 0;
  if (-[CBDigitizerFilter isActive](self, "isActive"))
    return -[CBDigitizerFilter isObstructedIgnoreActive](self, "isObstructedIgnoreActive");
  return v3;
}

- (BOOL)isObstructedIgnoreActive
{
  return -[CBDigitizerHotspot triggered](self->_hotspot, "triggered", a2, self) != 0;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (id)filterEvent:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "eventType");
  if (v4 == 11)
    return -[CBDigitizerFilter handleDigitizerEvent:](self, "handleDigitizerEvent:", a3);
  if (v4 == 12)
    return -[CBDigitizerFilter handleALSEvent:](self, "handleALSEvent:", a3);
  return a3;
}

- (id)handleALSEvent:(id)a3
{
  float v3;
  int v5;
  uint64_t inited;
  NSObject *logHandle;
  CBDigitizerHotspot *hotspot;
  int v9;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a3, "firstALSSample") & 1) == 0)
    {
      v9 = -[CBDigitizerHotspot orientation](self->_hotspot, "orientation");
      if (v9 == objc_msgSend(a3, "orientation"))
      {
        hotspot = self->_hotspot;
        objc_msgSend(a3, "timestamp");
        if (-[CBDigitizerHotspot isClearedAt:](hotspot, "isClearedAt:"))
          -[CBDigitizerFilter setTriggered:forHotspot:](self, "setTriggered:forHotspot:", 0, self->_hotspot);
        if (-[CBDigitizerHotspot triggered](self->_hotspot, "triggered")
          && -[CBDigitizerFilter isActive](self, "isActive"))
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
            v5 = objc_msgSend(a3, "orientation");
            objc_msgSend(a3, "timestamp");
            __os_log_helper_16_2_3_4_0_8_0_8_64((uint64_t)v12, v5, COERCE__INT64(v3), (uint64_t)self->_hotspot);
            _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Hotspot for ALS %d: timestamp = %.2f marked as obstucted hotspot = [%@]", v12, 0x1Cu);
          }
          objc_msgSend(a3, "setObstructed:", 1);
        }
      }
    }
  }
  return a3;
}

- (CBDigitizerFilter)initWithALSNode:(id)a3 andLogCategory:(const char *)a4
{
  os_log_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  double v9;
  double v10;
  uint64_t v11;
  CBDigitizerFilter *v13;
  int v14;
  uint64_t inited;
  NSObject *logHandle;
  objc_super v17;
  const char *v18;
  id v19;
  SEL v20;
  CBDigitizerFilter *v21;
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CBDigitizerFilter;
  v21 = -[CBFilter init](&v17, sel_init);
  if (v21)
  {
    v4 = os_log_create("com.apple.CoreBrightness.CBDigitizerFilter", v18);
    v21->super._logHandle = (OS_os_log *)v4;
    v5 = objc_msgSend(v19, "orientation");
    v21->_orientation = v5;
    v6 = objc_msgSend(v19, "digitizerFilterWindow");
    v21->_behavior = v6;
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v19);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Creating digitizer filter for ALS [%@]", v22, 0xCu);
    }
    v21->_hotspot = 0;
    v21->_isActive = 1;
    if (objc_msgSend(v19, "overrideHotspot"))
    {
      v13 = v21;
      objc_msgSend((id)objc_msgSend(v19, "overrideHotspot"), "x");
      v14 = v7;
      objc_msgSend((id)objc_msgSend(v19, "overrideHotspot"), "y");
      LODWORD(v9) = v8;
      LODWORD(v10) = v14;
      v11 = -[CBDigitizerFilter newHospotForLocationX:andY:](v13, "newHospotForLocationX:andY:", v10, v9);
      v21->_hotspot = (CBDigitizerHotspot *)v11;
    }
    v21->_firstDigitizerEvent = 0;
  }
  return v21;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBDigitizerFilter *v4;

  v4 = self;
  v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBDigitizerFilter;
  -[CBFilter dealloc](&v2, sel_dealloc);
}

- (void)setIsActive:(BOOL)a3
{
  uint64_t inited;
  NSObject *logHandle;
  BOOL v5;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = a3;
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
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v7, self->_isActive, v5);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Changing active=%d to %d", v7, 0xEu);
  }
  self->_isActive = v5;
}

- (void)overrideHotspotWithCenterX:(float)a3 andCenterY:(float)a4
{
  double v4;
  double v5;

  *(float *)&v4 = a3;
  *(float *)&v5 = a4;
  self->_hotspot = (CBDigitizerHotspot *)-[CBDigitizerFilter newHospotForLocationX:andY:](self, "newHospotForLocationX:andY:", v4, v5);
}

- (id)handleDigitizerEvent:(id)a3
{
  uint64_t v3;
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  const char *v13;
  CBDigitizerHotspot *hotspot;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  CBDigitizerFilterTouchProperties *p_props;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  BOOL v33;
  int i;
  char v35;
  void *v36;
  __int128 v37;
  float v38;
  uint8_t v39[15];
  char v40;
  NSObject *v41;
  id v42;
  SEL v43;
  CBDigitizerFilter *v44;
  uint8_t v45[88];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v44 = self;
  v43 = a2;
  v42 = a3;
  if (!self->_firstDigitizerEvent)
  {
    v41 = 0;
    if (v44->super._logHandle)
    {
      logHandle = v44->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v41 = logHandle;
    v40 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v41;
      type = v40;
      __os_log_helper_16_0_0(v39);
      _os_log_debug_impl(&dword_1B5291000, log, type, "First digitizer event -> load touch properties", v39, 2u);
    }
    p_props = &v44->_props;
    +[CBDigitizerFilter loadTouchProperties:](CBDigitizerFilter, "loadTouchProperties:", objc_msgSend(v42, "service"));
    *(_OWORD *)&p_props->digitizerWidth = v37;
    p_props->touchHotSpotSquared = v38;
    if (!v44->_hotspot)
    {
      v3 = -[CBDigitizerFilter newHotspotForOrientation](v44, "newHotspotForOrientation");
      v44->_hotspot = (CBDigitizerHotspot *)v3;
    }
    v44->_firstDigitizerEvent = 1;
  }
  v36 = (void *)objc_msgSend(v42, "copyChildren");
  if (!v36)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D20]);
    v36 = (void *)objc_msgSend(v4, "initWithObjects:", v42, 0);
  }
  if (v36)
  {
    v35 = 0;
    for (i = 0; i < (unint64_t)objc_msgSend(v36, "count"); ++i)
    {
      objc_msgSend(v36, "objectAtIndexedSubscript:", i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "integerValueForKey:", 720905) != 0;
        objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720896);
        v32 = v5;
        objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720897);
        v31 = v32 * v44->_props.digitizerWidth;
        v30 = v6 * v44->_props.digitizerHeight;
        -[CBDigitizerHotspot center_X](v44->_hotspot, "center_X");
        v29 = v7 - v31;
        -[CBDigitizerHotspot center_Y](v44->_hotspot, "center_Y");
        v28 = (float)((float)(v8 - v30) * (float)(v8 - v30)) + (float)(v29 * v29);
        if (v44->super._logHandle)
        {
          v22 = v44->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v21 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v21 = init_default_corebrightness_log();
          v22 = v21;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720904);
          *(double *)&v16 = v10;
          objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720917);
          *(double *)&v17 = v11;
          objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValueForKey:", 720916);
          *(double *)&v18 = v12;
          v19 = -[CBDigitizerHotspot orientation](v44->_hotspot, "orientation");
          v20 = 0;
          if (v28 < v44->_props.touchHotSpotSquared)
            v20 = v33;
          v13 = "";
          if (!v20)
            v13 = "un";
          __os_log_helper_16_2_8_8_0_8_0_8_0_8_0_8_0_4_0_4_0_8_32((uint64_t)v45, COERCE__INT64(v31), COERCE__INT64(v30), v16, v17, v18, v33, v19, (uint64_t)v13);
          _os_log_debug_impl(&dword_1B5291000, v22, OS_LOG_TYPE_DEBUG, "Multitouch event - X: %f, Y: %f, range: %f, minor r: %f, major r: %f, touch: %d, ALS[%d] obstruction %sdetected", v45, 0x4Au);
        }
        *(float *)&v9 = v28;
        if (v28 < v44->_props.touchHotSpotSquared && v33)
        {
          v35 = 1;
          -[CBDigitizerFilter setTriggered:forHotspot:](v44, "setTriggered:forHotspot:", 1, v44->_hotspot, v9);
          break;
        }
      }
    }
    if ((v35 & 1) == 0 && -[CBDigitizerHotspot triggered](v44->_hotspot, "triggered") == 1)
    {
      -[CBDigitizerFilter setTriggered:forHotspot:](v44, "setTriggered:forHotspot:", 2, v44->_hotspot);
      hotspot = v44->_hotspot;
      objc_msgSend(v42, "timestamp");
      -[CBDigitizerHotspot setTouchReleaseTime:](hotspot, "setTouchReleaseTime:");
    }
  }

  return v42;
}

+ (CBDigitizerFilterTouchProperties)loadTouchProperties:(SEL)a3
{
  CBDigitizerFilterTouchProperties *result;
  const __CFDictionary *v5;
  CFTypeID TypeID;
  CFTypeID v7;
  CBDigitizerFilterTouchProperties *v8;
  CBDigitizerFilterTouchProperties *v9;
  mach_port_t mainPort;
  CFAllocatorRef *v11;
  float v13;
  CBDigitizerFilterTouchProperties *cf;
  CFTypeRef CFProperty;
  io_service_t MatchingService;
  uint64_t valuePtr;
  IOHIDServiceClientRef v18;
  SEL v19;
  id v20;

  v20 = a2;
  v19 = a3;
  v18 = a4;
  valuePtr = 0;
  *(_QWORD *)&retstr->digitizerWidth = 0;
  *(_QWORD *)&retstr->deviceCenterX = 0;
  retstr->touchHotSpotSquared = 0.0;
  result = (CBDigitizerFilterTouchProperties *)IOHIDServiceClientGetRegistryID(v18);
  if (result)
    result = (CBDigitizerFilterTouchProperties *)CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &valuePtr);
  if (valuePtr)
  {
    mainPort = *MEMORY[0x1E0CBBAA8];
    v5 = IORegistryEntryIDMatching(valuePtr);
    MatchingService = IOServiceGetMatchingService(mainPort, v5);
    v11 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
    CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("Sensor Surface Width"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    result = (CBDigitizerFilterTouchProperties *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("Sensor Surface Height"), *v11, 0);
    cf = result;
    if (CFProperty)
    {
      v9 = (CBDigitizerFilterTouchProperties *)CFGetTypeID(CFProperty);
      TypeID = CFNumberGetTypeID();
      result = v9;
      if (v9 == (CBDigitizerFilterTouchProperties *)TypeID)
      {
        if (cf)
        {
          v8 = (CBDigitizerFilterTouchProperties *)CFGetTypeID(cf);
          v7 = CFNumberGetTypeID();
          result = v8;
          if (v8 == (CBDigitizerFilterTouchProperties *)v7)
          {
            CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberFloatType, retstr);
            result = (CBDigitizerFilterTouchProperties *)CFNumberGetValue((CFNumberRef)cf, kCFNumberFloatType, &retstr->digitizerHeight);
            retstr->deviceCenterX = retstr->digitizerWidth / 2.0;
            retstr->deviceCenterY = retstr->digitizerHeight / 2.0;
            if (retstr->digitizerWidth * 0.001 <= 10.0)
              v13 = 1.27;
            else
              v13 = 2.54;
            retstr->touchHotSpotSquared = (float)((float)(v13 * 1000.0) * v13) * 1000.0;
          }
        }
      }
    }
    if (CFProperty)
      CFRelease(CFProperty);
    if (cf)
      CFRelease(cf);
  }
  return result;
}

- (id)newHotspot
{
  if (self->_behavior == 1)
    return objc_alloc_init(CBDigitizerHotspotTTF);
  else
    return objc_alloc_init(CBDigitizerHotspot);
}

- (id)newHospotForLocationX:(float)a3 andY:(float)a4
{
  double v4;
  double v5;
  id v7;

  v7 = -[CBDigitizerFilter newHotspot](self, "newHotspot");
  *(float *)&v4 = a3;
  objc_msgSend(v7, "setCenter_X:", v4);
  *(float *)&v5 = a4;
  objc_msgSend(v7, "setCenter_Y:", v5);
  objc_msgSend(v7, "setOrientation:", self->_orientation);
  return v7;
}

- (id)newHotspotForOrientation
{
  double v2;
  double v3;
  float v4;
  float v5;
  int v7;
  uint64_t v8;
  uint64_t inited;
  NSObject *logHandle;
  unint64_t v11;
  id v12;
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = -[CBDigitizerFilter newHotspot](self, "newHotspot");
  objc_msgSend(v12, "setOrientation:", self->_orientation);
  v11 = (self->_orientation - 1);
  if (v11 <= 7)
    __asm { BR              X8 }
  *(float *)&v2 = self->_props.deviceCenterX;
  objc_msgSend(v12, "setCenter_X:", v2);
  LODWORD(v3) = 0;
  objc_msgSend(v12, "setCenter_Y:", v3);
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v12, "orientation");
    objc_msgSend(v12, "center_X");
    *(double *)&v8 = v4;
    objc_msgSend(v12, "center_Y");
    __os_log_helper_16_0_3_4_0_8_0_8_0((uint64_t)v14, v7, v8, COERCE__INT64(v5));
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Hotspot for ALS %d: centerX %f centerY %f", v14, 0x1Cu);
  }
  return v12;
}

- (void)setTriggered:(int64_t)a3 forHotspot:(id)a4
{
  uint64_t v4;
  id v5;
  void *context;
  uint64_t inited;
  NSObject *logHandle;
  void *v9;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 != objc_msgSend(a4, "triggered"))
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_4_4_0_4_0_8_32_8_32((uint64_t)v13, objc_msgSend(a4, "orientation"), -[CBDigitizerFilter isActive](self, "isActive"), (uint64_t)(&kTouchStateStr)[objc_msgSend(a4, "triggered")], (uint64_t)(&kTouchStateStr)[a3]);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Hotspot for ALS %d: active = %d changed = %s to %s", v13, 0x22u);
    }
    objc_msgSend(a4, "setTriggered:", a3);
    if (!a3)
    {
      objc_msgSend(a4, "touchTriggerDelay");
      +[CBAnalytics touchOcclusionElapsedDelay:](CBAnalytics, "touchOcclusionElapsedDelay:");
    }
    if (-[CBDigitizerFilter isActive](self, "isActive"))
    {
      context = (void *)MEMORY[0x1B5E4A8B0]();
      v5 = objc_alloc(MEMORY[0x1E0C99D80]);
      v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_orientation);
      v9 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v4, CFSTR("TouchOrientation"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CBDigitizerFilter isObstructed](self, "isObstructed")), CFSTR("TouchIsObstucted"), 0);
      objc_autoreleasePoolPop(context);
      -[CBFilter sendNotificationForKey:andValue:](self, "sendNotificationForKey:andValue:", CFSTR("TouchStateChanged"), v9);

    }
  }
}

- (int)orientation
{
  return self->_orientation;
}

@end
