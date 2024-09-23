@implementation CBDisplayModuleHIDiOS

- (CBDisplayModuleHIDiOS)initWithDevice:(unsigned int)a3 andQueue:(id)a4
{
  void *v4;
  float v5;
  uint64_t v7;
  NSObject *v8;
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
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint8_t v52[7];
  os_log_type_t v53;
  os_log_t v54;
  uint8_t v55[15];
  os_log_type_t v56;
  os_log_t v57;
  os_log_type_t v58;
  os_log_t v59;
  os_log_type_t v60;
  os_log_t v61;
  uint32_t UnitExponent;
  uint8_t v63[7];
  os_log_type_t v64;
  os_log_t oslog;
  uint64_t v66;
  int v67;
  int v68;
  CFTypeID (*v69)(uint64_t, void *);
  void *v70;
  char *v71;
  id v72;
  uint8_t v73[7];
  os_log_type_t v74;
  NSObject *v75;
  uint8_t v76[7];
  os_log_type_t v77;
  NSObject *v78;
  os_log_type_t v79;
  os_log_t v80;
  uint8_t v81[15];
  os_log_type_t v82;
  NSObject *v83;
  id v84;
  uint8_t v85[7];
  os_log_type_t v86;
  NSObject *v87;
  id v88;
  os_log_type_t v89;
  os_log_t v90;
  id v91;
  uint8_t v92[7];
  char v93;
  NSObject *v94;
  objc_super v95;
  uint8_t v96[15];
  char v97;
  NSObject *v98;
  id v99;
  io_registry_entry_t v100;
  SEL v101;
  char *v102;
  uint8_t v104[32];
  uint8_t v105[16];
  uint8_t v106[48];
  uint8_t v107[32];
  uint8_t v108[8];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v102 = (char *)self;
  v101 = a2;
  v100 = a3;
  v99 = a4;
  if (!a3 || !v99)
  {
    v98 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v98 = inited;
    v97 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v98;
      type = v97;
      __os_log_helper_16_0_0(v96);
      _os_log_error_impl(&dword_1B5291000, log, type, "invalid input", v96, 2u);
    }
LABEL_141:

    v102 = 0;
    return 0;
  }
  v95.receiver = v102;
  v95.super_class = (Class)CBDisplayModuleHIDiOS;
  v102 = -[CBDisplayModuleHIDiOS init](&v95, sel_init);
  if (v102)
  {
    *((_QWORD *)v102 + 5) = os_log_create("com.apple.CoreBrightness.HIDDisplay", "default");
    *((_QWORD *)v102 + 6) = v99;
    dispatch_retain(*((dispatch_object_t *)v102 + 6));
    *((_QWORD *)v102 + 14) = dispatch_queue_create("CBDisplayModuleHID - Brightness", 0);
    if (!*((_QWORD *)v102 + 14))
    {
      v94 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v48 = *((_QWORD *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v47 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v47 = init_default_corebrightness_log();
        v48 = v47;
      }
      v94 = v48;
      v93 = 16;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v45 = v94;
        v46 = v93;
        __os_log_helper_16_0_0(v92);
        _os_log_error_impl(&dword_1B5291000, v45, v46, "error: unable to create CBDisplayModuleHID - Brightness queue", v92, 2u);
      }
      goto LABEL_141;
    }
    v91 = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", CFSTR("DISABLE_HID_INTERFACE"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v102[132] = objc_msgSend(v91, "BOOLValue") & 1;
      v90 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v44 = *((_QWORD *)v102 + 5);
      }
      else
      {
        v43 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v44 = v43;
      }
      v90 = v44;
      v89 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v108, v102[132] & 1);
        _os_log_impl(&dword_1B5291000, v90, v89, "loaded no-HID override from preferences (%d)", v108, 8u);
      }
    }

    v88 = 0;
    v88 = (id)IORegistryEntrySearchCFProperty(v100, "IOService", CFSTR("ProductID"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2u);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *((_QWORD *)v102 + 20) = objc_msgSend(v88, "unsignedIntegerValue");
    }
    else
    {
      v87 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v42 = *((_QWORD *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v41 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v41 = init_default_corebrightness_log();
        v42 = v41;
      }
      v87 = v42;
      v86 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v39 = v87;
        v40 = v86;
        __os_log_helper_16_0_0(v85);
        _os_log_error_impl(&dword_1B5291000, v39, v40, "error: failed to retrieve PID", v85, 2u);
      }
    }

    v84 = 0;
    v84 = (id)IORegistryEntrySearchCFProperty(v100, "IOService", CFSTR("VendorID"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2u);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *((_QWORD *)v102 + 19) = objc_msgSend(v84, "unsignedIntegerValue");
    }
    else
    {
      v83 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v38 = *((_QWORD *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v37 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v37 = init_default_corebrightness_log();
        v38 = v37;
      }
      v83 = v38;
      v82 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v35 = v83;
        v36 = v82;
        __os_log_helper_16_0_0(v81);
        _os_log_error_impl(&dword_1B5291000, v35, v36, "error: failed to retrieve VID", v81, 2u);
      }
    }

    v80 = 0;
    if (*((_QWORD *)v102 + 5))
    {
      v34 = *((_QWORD *)v102 + 5);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v33 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v33 = init_default_corebrightness_log();
      v34 = v33;
    }
    v80 = v34;
    v79 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v107, *((_QWORD *)v102 + 19), *((_QWORD *)v102 + 20));
      _os_log_impl(&dword_1B5291000, v80, v79, "VID = %lu | PID = %lu", v107, 0x16u);
    }
    *((_QWORD *)v102 + 4) = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v100);
    if (!*((_QWORD *)v102 + 4))
    {
      v78 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v32 = *((_QWORD *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v31 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v31 = init_default_corebrightness_log();
        v32 = v31;
      }
      v78 = v32;
      v77 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v29 = v78;
        v30 = v77;
        __os_log_helper_16_0_0(v76);
        _os_log_error_impl(&dword_1B5291000, v29, v30, "error: unable to create IOHIDDevice", v76, 2u);
      }
      goto LABEL_141;
    }
    if (IOHIDDeviceOpen(*((IOHIDDeviceRef *)v102 + 4), 0))
    {
      v75 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v28 = *((_QWORD *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v27 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v27 = init_default_corebrightness_log();
        v28 = v27;
      }
      v75 = v28;
      v74 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v25 = v75;
        v26 = v74;
        __os_log_helper_16_0_0(v73);
        _os_log_error_impl(&dword_1B5291000, v25, v26, "error: unable to open IOHIDDevice", v73, 2u);
      }
      goto LABEL_141;
    }
    v72 = 0;
    v72 = (id)IORegistryEntrySearchCFProperty(v100, "IOService", CFSTR("kUSBContainerID"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *((_QWORD *)v102 + 7) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v72);

    *((_QWORD *)v102 + 10) = IOHIDDeviceCopyMatchingElements(*((IOHIDDeviceRef *)v102 + 4), 0, 0);
    v4 = (void *)*((_QWORD *)v102 + 10);
    v66 = MEMORY[0x1E0C809B0];
    v67 = -1073741824;
    v68 = 0;
    v69 = __49__CBDisplayModuleHIDiOS_initWithDevice_andQueue___block_invoke;
    v70 = &unk_1E68EA068;
    v71 = v102;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v66);
    if (!*((_QWORD *)v102 + 9))
    {
      oslog = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v24 = *((_QWORD *)v102 + 5);
      }
      else
      {
        v23 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v24 = v23;
      }
      oslog = v24;
      v64 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v21 = oslog;
        v22 = v64;
        __os_log_helper_16_0_0(v63);
        _os_log_impl(&dword_1B5291000, v21, v22, "duration element isn't available", v63, 2u);
      }
    }
    if (!*((_QWORD *)v102 + 8))
    {
      v54 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v12 = *((_QWORD *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v11 = init_default_corebrightness_log();
        v12 = v11;
      }
      v54 = v12;
      v53 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v9 = v54;
        v10 = v53;
        __os_log_helper_16_0_0(v52);
        _os_log_error_impl(&dword_1B5291000, v9, v10, "error: can't find brightness element - abort", v52, 2u);
      }
      goto LABEL_141;
    }
    UnitExponent = 0;
    UnitExponent = IOHIDElementGetUnitExponent(*((IOHIDElementRef *)v102 + 8));
    *((float *)v102 + 23) = (float)IOHIDElementGetPhysicalMax(*((IOHIDElementRef *)v102 + 8));
    *((float *)v102 + 22) = (float)IOHIDElementGetPhysicalMin(*((IOHIDElementRef *)v102 + 8));
    *((_DWORD *)v102 + 25) = 1120403456;
    if (*((float *)v102 + 23) > 2000.0)
    {
      if (UnitExponent)
      {
        v5 = scaleForExponent(UnitExponent);
        *((float *)v102 + 25) = v5;
        if (*((float *)v102 + 25) > 0.0)
        {
          *((float *)v102 + 23) = *((float *)v102 + 23) / *((float *)v102 + 25);
          *((float *)v102 + 22) = *((float *)v102 + 22) / *((float *)v102 + 25);
        }
      }
    }
    v61 = 0;
    if (*((_QWORD *)v102 + 5))
    {
      v20 = *((_QWORD *)v102 + 5);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v19 = init_default_corebrightness_log();
      v20 = v19;
    }
    v61 = v20;
    v60 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_4_8_0_8_0_8_0_4_0((uint64_t)v106, COERCE__INT64(*((float *)v102 + 23)), COERCE__INT64(*((float *)v102 + 22)), COERCE__INT64(*((float *)v102 + 25)), UnitExponent);
      _os_log_impl(&dword_1B5291000, v61, v60, "maxNits = %f, minNits = %f, nitsScaler = %f, exponent = %d", v106, 0x26u);
    }
    if (*((float *)v102 + 23) <= 0.0)
    {
      v59 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v18 = *((_QWORD *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v17 = init_default_corebrightness_log();
        v18 = v17;
      }
      v59 = v18;
      v58 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v105, COERCE__INT64(*((float *)v102 + 23)));
        _os_log_error_impl(&dword_1B5291000, v59, v58, "error: max nits (%f) - defaulting", v105, 0xCu);
      }
      *((_DWORD *)v102 + 26) = 981668463;
    }
    else
    {
      *((float *)v102 + 26) = *((float *)v102 + 22) / *((float *)v102 + 23);
    }
    if ((objc_msgSend(v102, "getNits:", v102 + 96) & 1) == 0)
    {
      v57 = 0;
      if (*((_QWORD *)v102 + 5))
      {
        v16 = *((_QWORD *)v102 + 5);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v15 = init_default_corebrightness_log();
        v16 = v15;
      }
      v57 = v16;
      v56 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v13 = v57;
        v14 = v56;
        __os_log_helper_16_0_0(v55);
        _os_log_error_impl(&dword_1B5291000, v13, v14, "error: failed to retrieve current nits - defaulting to 150 nits", v55, 2u);
      }
      *((_DWORD *)v102 + 24) = 1125515264;
    }
    if (*((_QWORD *)v102 + 5))
    {
      v8 = *((_QWORD *)v102 + 5);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v104, COERCE__INT64(*((float *)v102 + 24)), COERCE__INT64(*((float *)v102 + 22)), COERCE__INT64(*((float *)v102 + 23)));
      _os_log_impl(&dword_1B5291000, v8, OS_LOG_TYPE_INFO, "brightness: current=%f min=%f max=%f", v104, 0x20u);
    }
  }
  return (CBDisplayModuleHIDiOS *)v102;
}

CFTypeID __49__CBDisplayModuleHIDiOS_initWithDevice_andQueue___block_invoke(uint64_t a1, void *a2)
{
  CFTypeID TypeID;
  CFTypeID result;
  CFTypeID v5;

  v5 = CFGetTypeID(a2);
  TypeID = IOHIDElementGetTypeID();
  result = v5;
  if (v5 == TypeID)
  {
    if (IOHIDElementGetType((IOHIDElementRef)a2) == kIOHIDElementTypeFeature
      && IOHIDElementGetUsage((IOHIDElementRef)a2) == 16
      && (result = IOHIDElementGetUsagePage((IOHIDElementRef)a2), (_DWORD)result == 130))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = a2;
    }
    else
    {
      result = IOHIDElementGetType((IOHIDElementRef)a2);
      if ((_DWORD)result == 257)
      {
        result = IOHIDElementGetUsage((IOHIDElementRef)a2);
        if ((_DWORD)result == 80)
        {
          result = IOHIDElementGetUsagePage((IOHIDElementRef)a2);
          if ((_DWORD)result == 15)
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = a2;
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  CFTypeID TypeID;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSArray *obj;
  uint64_t v8;
  objc_super v9;
  _QWORD __b[8];
  CFTypeRef v11;
  SEL v12;
  CBDisplayModuleHIDiOS *v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = self;
  v12 = a2;
  if (self->_elements)
  {
    memset(__b, 0, sizeof(__b));
    obj = v13->_elements;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
    if (v8)
    {
      v4 = *(_QWORD *)__b[2];
      v5 = 0;
      v6 = v8;
      while (1)
      {
        v3 = v5;
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(obj);
        v11 = 0;
        v11 = *(CFTypeRef *)(__b[1] + 8 * v5);
        TypeID = IOHIDElementGetTypeID();
        if (TypeID == CFGetTypeID(v11))
          _IOHIDElementSetValue();
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
          if (!v6)
            break;
        }
      }
    }

  }
  if (v13->_queue)
  {
    dispatch_release((dispatch_object_t)v13->_queue);
    v13->_queue = 0;
  }
  if (v13->_brightnessUpdateQueue)
  {
    dispatch_release((dispatch_object_t)v13->_brightnessUpdateQueue);
    v13->_brightnessUpdateQueue = 0;
  }
  if (v13->_logHandle)
  {

    v13->_logHandle = 0;
  }
  if (v13->_hidDisplayDevice)
  {
    IOHIDDeviceClose(v13->_hidDisplayDevice, 0);
    CFRelease(v13->_hidDisplayDevice);
    v13->_hidDisplayDevice = 0;
  }

  v9.receiver = v13;
  v9.super_class = (Class)CBDisplayModuleHIDiOS;
  -[CBModule dealloc](&v9, sel_dealloc);
}

- (void)start
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[15];
  char v11;
  NSObject *v12;
  id v13;
  uint8_t v14[7];
  char v15;
  NSObject *v16;
  SEL v17;
  CBDisplayModuleHIDiOS *v18;

  v18 = self;
  v17 = a2;
  v16 = 0;
  if (self->_logHandle)
  {
    logHandle = v18->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v16 = logHandle;
  v15 = 1;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    log = v16;
    type = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v14, 2u);
  }
  v13 = -[CBDisplayModuleHIDiOS newDisplayBrightnessData](v18, "newDisplayBrightnessData");
  if (v13)
  {
    -[CBDisplayModuleHIDiOS sendNotificationForKey:withValue:](v18, "sendNotificationForKey:withValue:", CFSTR("DisplayBrightness"), v13);
  }
  else
  {
    v12 = 0;
    if (v18->_logHandle)
    {
      v5 = v18->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    v12 = v5;
    v11 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v2 = v12;
      v3 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1B5291000, v2, v3, "failed to create display data structure", v10, 2u);
    }
  }

}

- (void)stop
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  char v7;
  NSObject *v8;
  SEL v9;
  CBDisplayModuleHIDiOS *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  if (self->_logHandle)
  {
    logHandle = v10->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v8 = logHandle;
  v7 = 1;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v6, 2u);
  }
}

- (id)newDisplayBrightnessData
{
  id v2;
  double v3;
  id v4;
  double v5;
  double v6;
  unint64_t v8;
  int *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SEL v15;
  CBDisplayModuleHIDiOS *v16;

  v16 = self;
  v15 = a2;
  v14 = 0;
  v13 = 0;
  v8 = 0x1E0CB3000uLL;
  v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v9 = &OBJC_IVAR___BLControl__clientDisplayMap;
  *(float *)&v3 = v16->_currentNits;
  v13 = (id)objc_msgSend(v2, "initWithFloat:", v3);
  v12 = 0;
  v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v5 = v16->_currentNits;
  v12 = (id)objc_msgSend(v4, "initWithFloat:", v5);
  v11 = 0;
  v10 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v6 = v16->_currentNits;
  -[CBDisplayModuleHIDiOS getUserBrightnessForNits:](v16, "getUserBrightnessForNits:", v6);
  v11 = (id)objc_msgSend(v10, "initWithFloat:");
  if (v13 && v12 && v11)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v11, CFSTR("Brightness"), v12, CFSTR("NitsPhysical"), v13, CFSTR("Nits"), 0);

  return v14;
}

- (id)copyPropertyForKey:(id)a3
{
  return -[CBDisplayModuleHIDiOS copyPropertyInternalForKey:](self, "copyPropertyInternalForKey:", a3);
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  ;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  uint64_t inited;
  NSObject *logHandle;
  char v9;
  uint8_t v13[32];
  uint8_t v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightness2")) & 1) != 0)
  {
    v9 = -[CBDisplayModuleHIDiOS handleDisplayBrightnessProperty:](self, "handleDisplayBrightnessProperty:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DISABLE_HID_INTERFACE")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_noHID = objc_msgSend(a3, "BOOLValue") & 1;
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
        __os_log_helper_16_0_1_4_0((uint64_t)v14, self->_noHID);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "setting no-HID override to %d", v14, 8u);
      }
      v9 = +[CBPreferencesHandler storePreferenceForAllUsersForKey:andValue:](CBPreferencesHandler, "storePreferenceForAllUsersForKey:andValue:", CFSTR("DISABLE_HID_INTERFACE"), a3);
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightnessLinear")) & 1) != 0)
  {
    v9 = -[CBDisplayModuleHIDiOS handleDisplayLinearBrightnessProperty:](self, "handleDisplayLinearBrightnessProperty:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CBDisplayVendorID")) & 1) != 0)
  {
    v9 = -[CBDisplayModuleHIDiOS handleDisplayVendorIDProperty:](self, "handleDisplayVendorIDProperty:", a3);
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CBDisplayProductID")) & 1) != 0)
  {
    v9 = -[CBDisplayModuleHIDiOS handleDisplayProductIDProperty:](self, "handleDisplayProductIDProperty:", a3);
  }
  if (self->_logHandle)
  {
    v6 = self->_logHandle;
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
    __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v13, (uint64_t)a4, (uint64_t)a3, v9 & 1);
    _os_log_debug_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ result=%d", v13, 0x1Cu);
  }
  return v9 & 1;
}

- (BOOL)handleDisplayProductIDProperty:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_displayPID = objc_msgSend(a3, "unsignedIntegerValue");
  return 0;
}

- (BOOL)handleDisplayVendorIDProperty:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_displayVID = objc_msgSend(a3, "unsignedIntegerValue");
  return 0;
}

- (BOOL)handleDisplayLinearBrightnessProperty:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  char v6;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    v6 = -[CBDisplayModuleHIDiOS setLinearBrightness:](self, "setLinearBrightness:");
  }
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
    __os_log_helper_16_2_2_8_64_4_0((uint64_t)v9, (uint64_t)a3, v6 & 1);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "data=%@ result=%d", v9, 0x12u);
  }
  return v6 & 1;
}

- (BOOL)handleDisplayBrightnessProperty:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  void *v6;
  void *v7;
  char v8;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "floatValue");
    v8 = -[CBDisplayModuleHIDiOS setSlider:](self, "setSlider:");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Brightness"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "floatValue");
        v8 = -[CBDisplayModuleHIDiOS setSlider:](self, "setSlider:");
      }
      else
      {
        v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Nits"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "floatValue");
          v8 = -[CBDisplayModuleHIDiOS setNits:](self, "setNits:");
        }
      }
    }
  }
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
    __os_log_helper_16_2_2_8_64_4_0((uint64_t)v11, (uint64_t)a3, v8 & 1);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "data=%@ result=%d", v11, 0x12u);
  }
  return v8 & 1;
}

- (BOOL)setLinearBrightness:(float)a3
{
  double v3;

  *(float *)&v3 = a3 * self->_maxNits;
  return -[CBDisplayModuleHIDiOS setNits:](self, "setNits:", v3);
}

- (float)getLinearBrightness
{
  if (self->_maxNits <= 0.0)
    return 0.0;
  else
    return self->_currentNits / self->_maxNits;
}

- (BOOL)setSlider:(float)a3
{
  float v3;
  double v4;
  double v6;
  double v7;

  if (a3 >= 0.0)
    v7 = a3;
  else
    v7 = 0.0;
  v3 = v7;
  if (v3 <= 1.0)
    v6 = v3;
  else
    v6 = 1.0;
  HIDWORD(v4) = HIDWORD(v6);
  *(float *)&v4 = v6;
  -[CBDisplayModuleHIDiOS getNitsForUserBrightness:](self, "getNitsForUserBrightness:", v4);
  return -[CBDisplayModuleHIDiOS setNits:](self, "setNits:");
}

- (BOOL)setNits:(float)a3 withPeriod:(float)a4
{
  NSObject *brightnessUpdateQueue;
  NSObject *log;
  os_log_type_t v7;
  uint64_t inited;
  NSObject *logHandle;
  float v10;
  float v11;
  uint8_t v12[15];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t block;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  CBDisplayModuleHIDiOS *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float maxNits;
  float v26;
  float v27;
  float minNits;
  char v29;
  float v30;
  float v31;
  SEL v32;
  CBDisplayModuleHIDiOS *v33;

  v33 = self;
  v32 = a2;
  v31 = a3;
  v30 = a4;
  v29 = 1;
  minNits = 0.0;
  minNits = self->_minNits;
  v27 = a3;
  if (minNits >= a3)
    v11 = minNits;
  else
    v11 = v27;
  v26 = v11;
  v31 = v11;
  maxNits = 0.0;
  maxNits = v33->_maxNits;
  v24 = v11;
  if (maxNits >= v11)
    v10 = v24;
  else
    v10 = maxNits;
  v23 = v10;
  v31 = v10;
  ++v33->_brighntessUpdateCounter;
  v33->_brightnessUpdateTarget = v31;
  v33->_currentNits = v31;
  if (v33->_brighntessUpdateCounter == 1)
  {
    brightnessUpdateQueue = v33->_brightnessUpdateQueue;
    block = MEMORY[0x1E0C809B0];
    v16 = -1073741824;
    v17 = 0;
    v18 = __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke;
    v19 = &unk_1E68EA3D8;
    v20 = v33;
    v21 = v30;
    v22 = v31;
    dispatch_async(brightnessUpdateQueue, &block);
  }
  else
  {
    oslog = 0;
    if (v33->_logHandle)
    {
      logHandle = v33->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    oslog = logHandle;
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = oslog;
      v7 = type;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_1B5291000, log, v7, "dropping previous brightness setting", v12, 2u);
    }
  }
  return v29 & 1;
}

void __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *log;
  os_log_type_t v5;
  uint64_t inited;
  NSObject *v7;
  uint8_t v9[7];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  IOReturn v18;
  int v19;
  int v20;
  IOReturn v21;
  uint64_t block;
  int v23;
  int v24;
  void (*v25)(uint64_t);
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = a1;
  v36 = a1;
  v31 = 0;
  v32 = &v31;
  v33 = 0x20000000;
  v34 = 32;
  v35 = 0;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block = MEMORY[0x1E0C809B0];
  v23 = -1073741824;
  v24 = 0;
  v25 = __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke_2;
  v26 = &unk_1E68EA658;
  v27 = *(_QWORD *)(a1 + 32);
  v28 = &v31;
  v29 = *(_DWORD *)(a1 + 40);
  v30 = *(_DWORD *)(a1 + 44);
  dispatch_sync(v2, &block);
  if (v32[3])
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) & 1) != 0)
    {
      oslog = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
      {
        v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v7 = inited;
      }
      oslog = v7;
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v5 = type;
        __os_log_helper_16_0_0(v9);
        _os_log_error_impl(&dword_1B5291000, log, v5, "WORKAROUND: Skipping the nit update in the HID interface - CA is expected to handle this in PQ", v9, 2u);
      }
    }
    else
    {
      v21 = 0;
      v21 = IOHIDTransactionCommit((IOHIDTransactionRef)v32[3]);
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      v12 = MEMORY[0x1E0C809B0];
      v13 = -1073741824;
      v14 = 0;
      v15 = __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke_35;
      v16 = &unk_1E68EAAA8;
      v18 = v21;
      v17 = *(_QWORD *)(a1 + 32);
      v19 = *(_DWORD *)(a1 + 44);
      v20 = *(_DWORD *)(a1 + 40);
      dispatch_sync(v3, &v12);
    }
    CFRelease((CFTypeRef)v32[3]);
  }
  _Block_object_dispose(&v31, 8);
}

void __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _DWORD *v13;
  void *v14;
  void *v15;
  uint64_t inited;
  NSObject *v17;
  void *v18;
  _DWORD *v19;
  void *context;
  __IOHIDElement *element;
  const __CFAllocator *allocator;
  __IOHIDElement *v23;
  const __CFAllocator *v24;
  uint8_t v26[15];
  char v27;
  NSObject *v28;
  uint64_t v29;
  os_log_type_t v30;
  os_log_t v31;
  __IOHIDValue *v32;
  __IOHIDValue *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];
  _QWORD v37[3];
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v35 = a1;
  v34 = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = IOHIDTransactionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(IOHIDDeviceRef *)(*(_QWORD *)(a1 + 32) + 32), kIOHIDTransactionDirectionTypeOutput, 0);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      IOHIDTransactionAddElement(*(IOHIDTransactionRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(IOHIDElementRef *)(*(_QWORD *)(a1 + 32) + 64));
      v33 = 0;
      v24 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v23 = *(__IOHIDElement **)(*(_QWORD *)(a1 + 32) + 64);
      v1 = mach_absolute_time();
      v33 = IOHIDValueCreateWithIntegerValue(v24, v23, v1, (uint64_t)(float)(*(float *)(*(_QWORD *)(a1 + 32) + 128) * *(float *)(*(_QWORD *)(a1 + 32) + 100)));
      if (v33)
      {
        IOHIDTransactionSetValue(*(IOHIDTransactionRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(IOHIDElementRef *)(*(_QWORD *)(a1 + 32) + 64), v33, 0);
        CFRelease(v33);
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
      {
        IOHIDTransactionAddElement(*(IOHIDTransactionRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(IOHIDElementRef *)(*(_QWORD *)(a1 + 32) + 72));
        v32 = 0;
        allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        element = *(__IOHIDElement **)(*(_QWORD *)(a1 + 32) + 72);
        v2 = mach_absolute_time();
        v32 = IOHIDValueCreateWithIntegerValue(allocator, element, v2, (uint64_t)(float)(*(float *)(a1 + 48) * 1000.0));
        if (v32)
        {
          IOHIDTransactionSetValue(*(IOHIDTransactionRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(IOHIDElementRef *)(*(_QWORD *)(a1 + 32) + 72), v32, 0);
          CFRelease(v32);
        }
      }
      context = (void *)MEMORY[0x1B5E4A8B0]();
      v19 = *(_DWORD **)(a1 + 32);
      v18 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v3) = v19[24];
      objc_msgSend(v19, "getUserBrightnessForNits:", v3);
      objc_msgSend(v19, "sendNotificationForKey:withValue:", CFSTR("DisplayBrightness2"), objc_msgSend(v18, "numberWithFloat:"));
      objc_autoreleasePoolPop(context);
      v31 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
      {
        v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v17 = inited;
      }
      v31 = v17;
      v30 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v38, COERCE__INT64(*(float *)(a1 + 52)), COERCE__INT64(*(float *)(a1 + 48)));
        _os_log_impl(&dword_1B5291000, v31, v30, "nits=%f period=%f", v38, 0x16u);
      }
      v15 = (void *)MEMORY[0x1B5E4A8B0]();
      v13 = *(_DWORD **)(a1 + 32);
      v12 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v4) = v13[24];
      objc_msgSend(v13, "getUserBrightnessForNits:", v4);
      objc_msgSend(v13, "sendNotificationForKey:withValue:", CFSTR("DisplayBrightness2"), objc_msgSend(v12, "numberWithFloat:"));
      v29 = 0;
      v36[0] = CFSTR("Brightness");
      v14 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v5) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96);
      objc_msgSend(*(id *)(a1 + 32), "getUserBrightnessForNits:", v5);
      v37[0] = objc_msgSend(v14, "numberWithFloat:");
      v36[1] = CFSTR("Nits");
      LODWORD(v6) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v37[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      v36[2] = CFSTR("NitsPhysical");
      LODWORD(v7) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v37[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
      v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
      objc_msgSend(*(id *)(a1 + 32), "sendNotificationForKey:withValue:", CFSTR("DisplayBrightness"), v29);
      objc_autoreleasePoolPop(v15);
    }
    else
    {
      v28 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
      {
        v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v10 = init_default_corebrightness_log();
        v11 = v10;
      }
      v28 = v11;
      v27 = 16;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v8 = v28;
        v9 = v27;
        __os_log_helper_16_0_0(v26);
        _os_log_error_impl(&dword_1B5291000, v8, v9, "error: failed to create transaction", v26, 2u);
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
}

void __44__CBDisplayModuleHIDiOS_setNits_withPeriod___block_invoke_35(uint64_t a1)
{
  uint64_t inited;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 40))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    {
      v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v2 = inited;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v6, *(_DWORD *)(a1 + 40));
      _os_log_error_impl(&dword_1B5291000, v2, OS_LOG_TYPE_ERROR, "error 0x%x: failed to commit nits", v6, 8u);
    }
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v3 = init_default_corebrightness_log();
      v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v7, COERCE__INT64(*(float *)(a1 + 44)), COERCE__INT64(*(float *)(a1 + 48)));
      _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "setting %f nits over %fs", v7, 0x16u);
    }
  }
}

- (BOOL)setNits:(float)a3
{
  double v3;

  LODWORD(v3) = 0;
  return -[CBDisplayModuleHIDiOS setNits:withPeriod:](self, "setNits:withPeriod:", *(double *)&a3, v3);
}

- (BOOL)getNits:(float *)a3
{
  float ScaledValue;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v17[7];
  os_log_type_t v18;
  os_log_t oslog;
  uint8_t v20[7];
  char v21;
  NSObject *v22;
  os_log_type_t v23;
  os_log_t v24;
  float v25;
  IOHIDValueRef Value;
  os_log_type_t v27;
  os_log_t v28;
  os_log_type_t v29;
  os_log_t v30;
  int v31;
  IOReturn v32;
  __IOHIDTransaction *v33;
  char v34;
  float *v35;
  SEL v36;
  CBDisplayModuleHIDiOS *v37;
  uint8_t v38[32];
  uint8_t v39[16];
  uint8_t v40[8];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37 = self;
  v36 = a2;
  v35 = a3;
  v34 = 0;
  v33 = 0;
  v33 = IOHIDTransactionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_hidDisplayDevice, kIOHIDTransactionDirectionTypeInput, 0);
  if (v33)
  {
    IOHIDTransactionAddElement(v33, v37->_brightnessElement);
    v32 = -536870212;
    v31 = 0;
    do
    {
      v32 = IOHIDTransactionCommit(v33);
      if (v32)
      {
        v30 = 0;
        if (v37->_logHandle)
        {
          logHandle = v37->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        v30 = logHandle;
        v29 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v40, v32);
          _os_log_error_impl(&dword_1B5291000, v30, v29, "failed to commit transaction 0x%x", v40, 8u);
        }
        if (v32 != -536850432)
          ++v31;
        if (v31 < 9)
        {
          v28 = (os_log_t)MEMORY[0x1E0C81028];
          v27 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_0_1_4_0((uint64_t)v39, v31);
            _os_log_error_impl(&dword_1B5291000, v28, v27, "retrying commit attempt No.%d", v39, 8u);
          }
          usleep(0xC350u);
        }
      }
      else
      {
        v31 = 9;
      }
    }
    while (v31 < 9);
    Value = 0;
    Value = IOHIDTransactionGetValue(v33, v37->_brightnessElement, 0);
    if (Value)
    {
      ScaledValue = IOHIDValueGetScaledValue(Value, 2u);
      v25 = ScaledValue;
      if (ScaledValue > v37->_maxNits || v25 < v37->_minNits)
      {
        v24 = 0;
        if (v37->_logHandle)
        {
          v14 = v37->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v13 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v13 = init_default_corebrightness_log();
          v14 = v13;
        }
        v24 = v14;
        v23 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v38, COERCE__INT64(v25), COERCE__INT64(v37->_minNits), COERCE__INT64(v37->_maxNits));
          _os_log_error_impl(&dword_1B5291000, v24, v23, "error: value (%f) out of bounds (%f-%f)", v38, 0x20u);
        }
      }
      else
      {
        v34 = 1;
        *v35 = v25;
      }
    }
    else
    {
      v22 = 0;
      if (v37->_logHandle)
      {
        v12 = v37->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v11 = init_default_corebrightness_log();
        v12 = v11;
      }
      v22 = v12;
      v21 = 16;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v9 = v22;
        v10 = v21;
        __os_log_helper_16_0_0(v20);
        _os_log_error_impl(&dword_1B5291000, v9, v10, "error: invalid value", v20, 2u);
      }
    }
    CFRelease(v33);
  }
  else
  {
    oslog = 0;
    if (v37->_logHandle)
    {
      v8 = v37->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    oslog = v8;
    v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v5 = oslog;
      v6 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_error_impl(&dword_1B5291000, v5, v6, "error: failed to create transaction", v17, 2u);
    }
  }
  return v34 & 1;
}

- (id)copyPropertyInternalForKey:(id)a3
{
  double v3;
  id v4;
  double v5;
  id v6;
  double v7;
  id v8;
  double v9;
  id v10;
  double v11;
  uint64_t inited;
  NSObject *logHandle;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("StatusInfo")) & 1) != 0)
  {
    v17 = +[CBStatusInfoHelper copyStatusInfoFor:](CBStatusInfoHelper, "copyStatusInfoFor:", self);
    if (v17)
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v17, CFSTR("CBDisplayModuleHIDiOS"), 0);

  }
  else
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightness2")) & 1) != 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v3 = self->_currentNits;
      -[CBDisplayModuleHIDiOS getUserBrightnessForNits:](self, "getUserBrightnessForNits:", v3);
      v18 = (id)objc_msgSend(v16, "initWithFloat:");
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightnessLinear")) & 1) != 0)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB37E8]);
      -[CBDisplayModuleHIDiOS getLinearBrightness](self, "getLinearBrightness");
      v18 = (id)objc_msgSend(v15, "initWithFloat:");
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightnessLinearMin")) & 1) != 0)
    {
      v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v5 = self->_minLinearBrightness;
      v18 = (id)objc_msgSend(v4, "initWithFloat:", v5);
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayNitsKey")) & 1) != 0
      || (objc_msgSend(a3, "isEqualToString:", CFSTR("NitsPhysical")) & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v7 = self->_currentNits;
      v18 = (id)objc_msgSend(v6, "initWithFloat:", v7);
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightness")) & 1) != 0)
    {
      v18 = -[CBDisplayModuleHIDiOS newDisplayBrightnessData](self, "newDisplayBrightnessData");
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightness2Available")) & 1) != 0)
    {
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightnessMin")) & 1) != 0)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v9 = self->_minNits;
      v18 = (id)objc_msgSend(v8, "initWithFloat:", v9);
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayBrightnessMax")) & 1) != 0)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v11 = self->_maxNits;
      v18 = (id)objc_msgSend(v10, "initWithFloat:", v11);
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kUSBContainerID")) & 1) != 0)
      goto LABEL_23;
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBDisplayVendorID")) & 1) != 0)
    {
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", self->_displayVID);
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBDisplayProductID")) & 1) != 0)
    {
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", self->_displayPID);
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DisplayUniqueID")) & 1) != 0)
    {
LABEL_23:
      v18 = (id)-[NSUUID copy](self->_containerID, "copy");
      goto LABEL_31;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DISABLE_HID_INTERFACE")) & 1) != 0)
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_noHID);
  }
LABEL_31:
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)a3, (uint64_t)v18);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "key=%@ result=%@", v21, 0x16u);
  }
  return v18;
}

- (id)copyIdentifiers
{
  SEL v3;
  CBDisplayModuleHIDiOS *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("DisplayBrightness2"), CFSTR("DisplayBrightnessLinear"), CFSTR("DisplayBrightnessLinearMin"), CFSTR("DisplayNitsKey"), CFSTR("NitsPhysical"), CFSTR("DisplayBrightness"), CFSTR("DisplayBrightness2Available"), CFSTR("DisplayBrightnessMin"), CFSTR("DisplayBrightnessMax"), CFSTR("kUSBContainerID"), 0);
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super.super._notificationBlock)
    (*((void (**)(void))self->super.super._notificationBlock + 2))();
}

- (float)getNitsForUserBrightness:(float)a3
{
  float maxNits;
  float v5;
  float v6;

  if (a3 <= 1.0)
    v6 = a3;
  else
    v6 = 1.0;
  if (v6 <= 0.0)
    v5 = 0.0;
  else
    v5 = v6;
  maxNits = self->_maxNits;
  return maxNits * powf(maxNits / self->_minNits, v5 - 1.0);
}

- (float)getUserBrightnessForNits:(float)a3
{
  float minNits;
  float maxNits;
  float v6;

  if (self->_maxNits >= a3)
    maxNits = a3;
  else
    maxNits = self->_maxNits;
  if (self->_minNits >= maxNits)
    minNits = self->_minNits;
  else
    minNits = maxNits;
  v6 = logf(self->_maxNits / self->_minNits);
  return (float)(logf(minNits / self->_maxNits) / v6) + 1.0;
}

- (unint64_t)VID
{
  return self->_VID;
}

- (unint64_t)PID
{
  return self->_PID;
}

@end
