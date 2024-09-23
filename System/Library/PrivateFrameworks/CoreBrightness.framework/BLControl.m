@implementation BLControl

- (id)copyBLControlPropertyWithkey:(id)a3
{
  NSMutableArray *displayContainers;
  uint64_t v4;
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  int v31;
  int v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  id v36;
  SEL v37;
  BLControl *v38;

  v38 = self;
  v37 = a2;
  v36 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 1375731712;
  v32 = 48;
  v33 = __Block_byref_object_copy__15;
  v34 = __Block_byref_object_dispose__15;
  v35 = 0;
  if ((objc_msgSend(a3, "isEqual:", CFSTR("BLControlAlsSupported")) & 1) != 0)
  {
    displayContainers = v38->_displayContainers;
    v22 = MEMORY[0x1E0C809B0];
    v23 = -1073741824;
    v24 = 0;
    v25 = __42__BLControl_copyBLControlPropertyWithkey___block_invoke;
    v26 = &unk_1E68EA910;
    v28 = &v29;
    v27 = v36;
    -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v22);
  }
  else if ((objc_msgSend(v36, "isEqual:", CFSTR("DisplayStateControlSupported")) & 1) != 0)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", CBU_SyncDisplayStateControlSupported() & 1);
    v30[5] = v4;
  }
  else if ((objc_msgSend(v36, "isEqual:", CFSTR("DisplayBrightnessIgnored")) & 1) != 0)
  {
    if (v38->_ignoreBrightnessKey)
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
    else
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
    v30[5] = v5;
  }
  else if ((objc_msgSend(v36, "isEqual:", CFSTR("EventTimestamps")) & 1) != 0)
  {
    v6 = v38->_displayContainers;
    v16 = MEMORY[0x1E0C809B0];
    v17 = -1073741824;
    v18 = 0;
    v19 = __42__BLControl_copyBLControlPropertyWithkey___block_invoke_2;
    v20 = &unk_1E68EAF28;
    v21 = &v29;
    -[NSMutableArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", &v16);
  }
  else if ((objc_msgSend(v36, "isEqual:", CFSTR("CBDisplayList")) & 1) != 0)
  {
    v7 = -[BLControl copyDisplayList](v38, "copyDisplayList");
    v30[5] = v7;
  }
  else if ((objc_msgSend(v36, "isEqual:", CFSTR("CBDisplayInfo")) & 1) != 0)
  {
    v8 = -[BLControl copyDisplayInfo](v38, "copyDisplayInfo");
    v30[5] = v8;
  }
  else if ((objc_msgSend(v36, "isEqual:", CFSTR("StatusInfo")) & 1) != 0)
  {
    v9 = -[BLControl copyStatusInfo](v38, "copyStatusInfo");
    v30[5] = v9;
  }
  else if ((objc_msgSend(v36, "isEqual:", CFSTR("DisplayMode")) & 1) != 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v10 = objc_msgSend(v15, "initWithInt:", v38->_displayMode);
    v30[5] = v10;
  }
  else if ((objc_msgSend(v36, "isEqual:", CFSTR("KeyboardBacklightIDs")) & 1) != 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D20]);
    v11 = objc_msgSend(v14, "initWithArray:", -[NSMutableDictionary allKeys](v38->_keyboardContainers, "allKeys"));
    v30[5] = v11;
  }
  v13 = (void *)v30[5];
  _Block_object_dispose(&v29, 8);
  return v13;
}

- (BOOL)setBLControlPropertyWithKey:(id)a3 property:(id)a4
{
  NSMutableArray *hidServiceClients;
  NSMutableArray *displayContainers;
  uint64_t v6;
  NSMutableArray *v7;
  BOOL v9;
  CFTypeID v10;
  CFTypeID v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  CFTypeID v20;
  CFTypeID TypeID;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t (*v31)(_QWORD *, void *);
  void *v32;
  const __CFNumber *v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  int v38;
  int v39;
  char v40;
  id v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t (*v45)(uint64_t, void *);
  void *v46;
  const __CFNumber *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  int v51;
  int v52;
  char v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t (*v57)(uint64_t, __IOHIDServiceClient *, uint64_t, _BYTE *);
  void *v58;
  BLControl *v59;
  CFTypeRef v60;
  CFTypeRef AmbientLightSensorEvent;
  int v62;
  uint8_t v63[7];
  char v64;
  NSObject *v65;
  uint8_t v66[7];
  os_log_type_t v67;
  NSObject *v68;
  id v69;
  Boolean v70;
  int valuePtr;
  os_log_type_t v72;
  os_log_t v73;
  uint8_t v74[7];
  char v75;
  NSObject *v76;
  char v77;
  const __CFNumber *v78;
  id v79;
  SEL v80;
  BLControl *v81;
  char v82;
  uint8_t v83[24];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v81 = self;
  v80 = a2;
  v79 = a3;
  v78 = (const __CFNumber *)a4;
  v77 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v79, "isEqual:", CFSTR("DisplayBrightness")) & 1) != 0)
    {
      if (v81->_ignoreBrightnessKey && !v81->_overrideIgnoreBrightness)
      {
        v73 = 0;
        if (v81->_logHandle)
        {
          logHandle = v81->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        v73 = logHandle;
        v72 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v83, (uint64_t)"DisplayBrightness");
          _os_log_impl(&dword_1B5291000, v73, v72, "Ignoring key %s\n", v83, 0xCu);
        }
        v77 = 1;
      }
    }
    else if ((objc_msgSend(v79, "isEqual:", CFSTR("DisplayBrightnessAuto")) & 1) != 0)
    {
      if (v78)
      {
        TypeID = CFNumberGetTypeID();
        if (TypeID == CFGetTypeID(v78))
        {
          valuePtr = 0;
          if (CFNumberGetValue(v78, kCFNumberIntType, &valuePtr))
            v81->_overrideIgnoreBrightness = valuePtr == 0;
        }
        else
        {
          v20 = CFBooleanGetTypeID();
          if (v20 == CFGetTypeID(v78))
          {
            v70 = 0;
            v70 = CFEqual(v78, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
            v81->_overrideIgnoreBrightness = v70 == 0;
          }
        }
      }
      v69 = -[BLControl copyPropertyInternalWithKey:forClient:](v81, "copyPropertyInternalWithKey:forClient:", CFSTR("BLControlAlsSupported"), 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v69, "BOOLValue") & 1) == 0)
      {
        v68 = 0;
        if (v81->_logHandle)
        {
          v19 = v81->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v18 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v18 = init_default_corebrightness_log();
          v19 = v18;
        }
        v68 = v19;
        v67 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v68;
          v17 = v67;
          __os_log_helper_16_0_0(v66);
          _os_log_impl(&dword_1B5291000, v16, v17, "ALS is not supported on this device -> ignore setting of DisplayBrightnessAuto property", v66, 2u);
        }
        v77 = 1;
      }

    }
    else if ((objc_msgSend(v79, "isEqual:", CFSTR("BrightnessCurveLevel")) & 1) != 0)
    {
      if (v81->_useMultiCurves)
      {
        v81->_ignoreBrightnessKey = 1;
      }
      else
      {
        v65 = 0;
        if (v81->_logHandle)
        {
          v15 = v81->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v14 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v14 = init_default_corebrightness_log();
          v15 = v14;
        }
        v65 = v15;
        v64 = 1;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v12 = v65;
          v13 = v64;
          __os_log_helper_16_0_0(v63);
          _os_log_impl(&dword_1B5291000, v12, v13, "ignoring this key as this device does not support this feature.", v63, 2u);
        }
        v77 = 1;
      }
    }
    else if ((objc_msgSend(v79, "isEqual:", CFSTR("ALSEventsIgnore")) & 1) != 0)
    {
      if (v78)
      {
        v11 = CFGetTypeID(v78);
        if (v11 == CFBooleanGetTypeID())
        {
          v81->_ignoreALSEvents = CFBooleanGetValue(v78) != 0;
          v77 = 1;
        }
      }
    }
    else if ((objc_msgSend(v79, "isEqual:", CFSTR("ALSEventsOverride")) & 1) != 0)
    {
      if (v78)
      {
        v10 = CFGetTypeID(v78);
        if (v10 == CFNumberGetTypeID())
        {
          v62 = 0;
          if (CFNumberGetValue(v78, kCFNumberFloatType, &v62))
          {
            mach_absolute_time();
            AmbientLightSensorEvent = (CFTypeRef)IOHIDEventCreateAmbientLightSensorEvent();
            if (AmbientLightSensorEvent)
            {
              hidServiceClients = v81->_hidServiceClients;
              v54 = MEMORY[0x1E0C809B0];
              v55 = -1073741824;
              v56 = 0;
              v57 = __50__BLControl_setBLControlPropertyWithKey_property___block_invoke;
              v58 = &unk_1E68EA608;
              v60 = AmbientLightSensorEvent;
              v59 = v81;
              -[NSMutableArray enumerateObjectsUsingBlock:](hidServiceClients, "enumerateObjectsUsingBlock:", &v54);
              CFRelease(AmbientLightSensorEvent);
            }
          }
        }
      }
    }
    else if ((objc_msgSend(v79, "isEqual:", CFSTR("DisplayMode")) & 1) != 0)
    {
      v49 = 0;
      v50 = &v49;
      v51 = 0x20000000;
      v52 = 32;
      v53 = 0;
      -[BLControl releaseDisplayModeCompletionTimer](v81, "releaseDisplayModeCompletionTimer");
      displayContainers = v81->_displayContainers;
      v42 = MEMORY[0x1E0C809B0];
      v43 = -1073741824;
      v44 = 0;
      v45 = __50__BLControl_setBLControlPropertyWithKey_property___block_invoke_2;
      v46 = &unk_1E68EA910;
      v48 = &v49;
      v47 = v78;
      -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v42);
      if ((v50[3] & 1) == 0)
      {
        v9 = -[BLControl handleDisplayModeUpdatePropertyHandler:](v81, "handleDisplayModeUpdatePropertyHandler:", v78);
        *((_BYTE *)v50 + 24) = (v50[3] & 1 | v9) != 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = (id)-[__CFNumber objectForKey:](v78, "objectForKey:", CFSTR("Value"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = objc_msgSend(v41, "integerValue");
          v81->_displayMode = v6;
        }
      }
      v77 = v50[3] & 1;
      _Block_object_dispose(&v49, 8);
    }
    else if ((objc_msgSend(v79, "isEqual:", CFSTR("FlipBookState")) & 1) != 0)
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x20000000;
      v39 = 32;
      v40 = 0;
      v7 = v81->_displayContainers;
      v28 = MEMORY[0x1E0C809B0];
      v29 = -1073741824;
      v30 = 0;
      v31 = __50__BLControl_setBLControlPropertyWithKey_property___block_invoke_3;
      v32 = &unk_1E68EA268;
      v35 = &v36;
      v33 = v78;
      v34 = v79;
      -[NSMutableArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", &v28);
      v77 = v37[3] & 1;
      _Block_object_dispose(&v36, 8);
    }
    v82 = v77 & 1;
  }
  else
  {
    v76 = 0;
    if (v81->_logHandle)
    {
      v27 = v81->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v26 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v26 = init_default_corebrightness_log();
      v27 = v26;
    }
    v76 = v27;
    v75 = 1;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      log = v76;
      type = v75;
      __os_log_helper_16_0_0(v74);
      _os_log_impl(&dword_1B5291000, log, type, "key is not string", v74, 2u);
    }
    v82 = v77 & 1;
  }
  return v82 & 1;
}

uint64_t __33__BLControl_handleHIDEvent_from___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "handleHIDEvent:from:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (id)copyPropertyWithKey:(id)a3 client:(id)a4
{
  NSObject *queue;
  void *v6;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  BLControl *v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  int v20;
  int v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  id v25;
  id v26;
  SEL v27;
  BLControl *v28;
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = self;
  v27 = a2;
  v26 = a3;
  v25 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 1375731712;
  v21 = 48;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v24 = 0;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __40__BLControl_copyPropertyWithKey_client___block_invoke;
  v13 = &unk_1E68EAFA0;
  v17 = &v18;
  v14 = v28;
  v15 = a3;
  v16 = a4;
  dispatch_sync(queue, &block);
  if (v28->_logHandle)
  {
    logHandle = v28->_logHandle;
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v26, v19[5]);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "key=%@ result=%@", v29, 0x16u);
  }
  v6 = (void *)v19[5];
  _Block_object_dispose(&v18, 8);
  return v6;
}

- (BOOL)setPropertyWithKey:(id)a3 property:(id)a4 client:(id)a5
{
  NSObject *queue;
  uint64_t block;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  BLControl *v12;
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  int v20;
  int v21;
  char v22;
  id v23;
  id v24;
  id v25;
  SEL v26;
  BLControl *v27;
  char v28;

  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  v23 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x20000000;
  v21 = 32;
  v22 = 0;
  if ((objc_msgSend(a3, "isEqual:", CFSTR("CBAOTStateUpdate")) & 1) != 0)
  {
    v28 = 1;
  }
  else
  {
    queue = v27->_queue;
    block = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __48__BLControl_setPropertyWithKey_property_client___block_invoke;
    v11 = &unk_1E68EB040;
    v16 = &v18;
    v12 = v27;
    v13 = v25;
    v14 = v24;
    v15 = v23;
    dispatch_sync(queue, &block);
    v28 = v19[3] & 1;
  }
  v17 = 1;
  _Block_object_dispose(&v18, 8);
  return v28 & 1;
}

uint64_t __48__BLControl_setPropertyWithKey_property_client___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setPropertyInternalWithKey:property:client:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result & 1;
  return result;
}

- (BOOL)setPropertyInternalWithKey:(id)a3 property:(id)a4 client:(id)a5
{
  NSMutableArray *displayContainers;
  NSMutableArray *v6;
  NSMutableDictionary *keyboardContainers;
  char v9;
  BOOL v10;
  const __CFString *v11;
  const __CFString *v12;
  BOOL v13;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v16;
  int v17;
  int v18;
  _QWORD *(*v19)(_QWORD *, uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t (*v27)(_QWORD *, void *);
  void *v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, void *, uint64_t, _BYTE *);
  void *v36;
  id v37;
  id v38;
  uint64_t *v39;
  _BOOL4 v40;
  _BOOL4 v41;
  __CFString *v42;
  os_log_type_t v43;
  os_log_t v44;
  uint64_t v45;
  uint64_t *v46;
  int v47;
  int v48;
  char v49;
  const __CFString *v50;
  id v51;
  id v52;
  SEL v53;
  BLControl *v54;
  uint8_t v55[24];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v54 = self;
  v53 = a2;
  v52 = a3;
  v51 = a4;
  v50 = (const __CFString *)a5;
  v45 = 0;
  v46 = &v45;
  v47 = 0x20000000;
  v48 = 32;
  v49 = 0;
  v44 = 0;
  if (self->_logHandle)
  {
    logHandle = v54->_logHandle;
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
  v43 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v55, (uint64_t)v52, (uint64_t)v51);
    _os_log_impl(&dword_1B5291000, v44, v43, "key=%@ property=%@", v55, 0x16u);
  }
  v13 = -[BLControl setBLControlPropertyWithKey:property:](v54, "setBLControlPropertyWithKey:property:", v52, v51);
  *((_BYTE *)v46 + 24) = v13;
  if ((v46[3] & 1) == 0 && v54->_builtInDisplayCount > 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v52, "isEqual:", CFSTR("DisplaySelect")) & 1) != 0)
      {
        if (v50)
          v12 = v50;
        else
          v12 = CFSTR("Server");
        -[NSMutableDictionary setObject:forKey:](v54->_clientDisplayMap, "setObject:forKey:", v51, v12);
        *((_BYTE *)v46 + 24) = 1;
      }
      else if ((objc_msgSend(v52, "isEqual:", CFSTR("DisplayBrightness")) & 1) != 0
             || (objc_msgSend(v52, "isEqual:", CFSTR("DisplayNitsKey")) & 1) != 0
             || (objc_msgSend(v52, "isEqual:", CFSTR("MaxBrightness")) & 1) != 0)
      {
        v42 = 0;
        if (v50)
          v11 = v50;
        else
          v11 = CFSTR("Server");
        v42 = (__CFString *)-[NSMutableDictionary objectForKey:](v54->_clientDisplayMap, "objectForKey:", v11);
        if (!v42)
          v42 = CFSTR("DisplayTypeIcon");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v41 = (-[__CFString isEqual:](v42, "isEqual:", CFSTR("DisplayTypeIcon")) & 1) != 0;
          displayContainers = v54->_displayContainers;
          v32 = MEMORY[0x1E0C809B0];
          v33 = -1073741824;
          v34 = 0;
          v35 = __56__BLControl_setPropertyInternalWithKey_property_client___block_invoke;
          v36 = &unk_1E68EAFF0;
          v40 = v41;
          v39 = &v45;
          v37 = v51;
          v38 = v52;
          -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v32);
        }
      }
    }
  }
  if ((v46[3] & 1) == 0)
  {
    v6 = v54->_displayContainers;
    v24 = MEMORY[0x1E0C809B0];
    v25 = -1073741824;
    v26 = 0;
    v27 = __56__BLControl_setPropertyInternalWithKey_property_client___block_invoke_2;
    v28 = &unk_1E68EA268;
    v31 = &v45;
    v29 = v51;
    v30 = v52;
    -[NSMutableArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", &v24);
    keyboardContainers = v54->_keyboardContainers;
    v16 = MEMORY[0x1E0C809B0];
    v17 = -1073741824;
    v18 = 0;
    v19 = __56__BLControl_setPropertyInternalWithKey_property_client___block_invoke_3;
    v20 = &unk_1E68EB018;
    v23 = &v45;
    v21 = v51;
    v22 = v52;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyboardContainers, "enumerateKeysAndObjectsUsingBlock:", &v16);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[NightModeControl setProperty:forKey:](v54->_nightModeControl, "setProperty:forKey:", v51, v52);
      *((_BYTE *)v46 + 24) = (v46[3] & 1 | v10) != 0;
    }
  }
  v9 = *((_BYTE *)v46 + 24);
  _Block_object_dispose(&v45, 8);
  return v9 & 1;
}

void __43__BLControl_sendNotificationFor_withValue___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "sendSyncNotificationFor:withValue:", a1[5], a1[6]);

}

- (void)sendSyncNotificationFor:(id)a3 withValue:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)a3, (uint64_t)a4);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ value=%@", v9, 0x16u);
  }
  -[BLControl handleNotificationInternalForKey:withValue:](self, "handleNotificationInternalForKey:withValue:", a3, a4);
  if (self->_callback)
    (*((void (**)(void))self->_callback + 2))();
}

uint64_t __56__BLControl_setPropertyInternalWithKey_property_client___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "setProperty:forKey:", a1[4], a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) & 1 | result & 1) != 0;
  }
  return result;
}

uint64_t __41__BLControl_handleCAWindowServerDisplay___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

- (void)sendNotificationFor:(id)a3 withValue:(id)a4
{
  id v4;
  id v5;
  NSObject *queue;
  uint64_t block;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  BLControl *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SEL v17;
  BLControl *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v4 = a3;
  v5 = v15;
  queue = v18->_queue;
  block = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __43__BLControl_sendNotificationFor_withValue___block_invoke;
  v11 = &unk_1E68EA150;
  v12 = v18;
  v13 = v16;
  v14 = v15;
  dispatch_async(queue, &block);
}

uint64_t __42__BLControl_copyBLControlPropertyWithkey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "copyPropertyForKey:", *(_QWORD *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

uint64_t __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "copyPropertyForKey:", *(_QWORD *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *a4 = 1;
  }
  return result;
}

uint64_t __40__BLControl_copyPropertyWithKey_client___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "copyPropertyInternalWithKey:forClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

uint64_t __33__BLControl_startHIDSystemClient__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleHIDEvent:from:", a5, a4, a1, a5, a4, a3, a2, a1);
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSMutableArray *displayContainers;
  NSMutableDictionary *keyboardContainers;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  __IOHIDEvent *v22;
  __IOHIDServiceClient *v23;
  id v24;
  BOOL v25;
  uint8_t v26[7];
  char v27;
  NSObject *v28;
  __IOHIDServiceClient *v29;
  __IOHIDEvent *v30;
  SEL v31;
  BLControl *v32;

  v32 = self;
  v31 = a2;
  v30 = a3;
  v29 = a4;
  if (a4 && v30)
  {
    v25 = 0;
    if (IOHIDEventGetType() == 12)
    {
      v24 = -[BLControl copyPropertyInternalWithKey:forClient:](v32, "copyPropertyInternalWithKey:forClient:", CFSTR("ALSIntegrationMode"), 0);
      if (-[CBAODState isAODActive](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODActive"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || objc_msgSend(v24, "intValue") != 2 && objc_msgSend(v24, "intValue") != 1)
        {
          +[CBALSEvent replaceLuxWithFilteredLux:](CBALSEvent, "replaceLuxWithFilteredLux:", v30);
        }
      }

      if (!v32->_ignoreALSEvents)
        v25 = 1;
    }
    else if (IOHIDEventGetType() == 14)
    {
      v25 = 1;
    }
    else if (IOHIDEventGetType() == 11)
    {
      v25 = 1;
    }
    else if (IOHIDEventGetType() == 3)
    {
      v25 = 1;
    }
    else if (IOHIDEventGetType() == 1 && IOHIDEventGetIntegerValue() == 65280)
    {
      v25 = IOHIDEventGetIntegerValue() == 98;
    }
    if (v25)
    {
      displayContainers = v32->_displayContainers;
      v17 = MEMORY[0x1E0C809B0];
      v18 = -1073741824;
      v19 = 0;
      v20 = __33__BLControl_handleHIDEvent_from___block_invoke;
      v21 = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
      v22 = v30;
      v23 = v29;
      -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v17);
      if (-[NSMutableDictionary count](v32->_keyboardContainers, "count"))
      {
        if (IOHIDEventGetType() == 12)
        {
          v16 = -[BLControl copyPropertyInternalWithKey:forClient:](v32, "copyPropertyInternalWithKey:forClient:", CFSTR("TrustedFrontLux"), 0);
          if (v16)
          {
            keyboardContainers = v32->_keyboardContainers;
            v10 = MEMORY[0x1E0C809B0];
            v11 = -1073741824;
            v12 = 0;
            v13 = __33__BLControl_handleHIDEvent_from___block_invoke_2;
            v14 = &unk_1E68EA568;
            v15 = v16;
            -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyboardContainers, "enumerateKeysAndObjectsUsingBlock:", &v10);
          }

        }
      }
    }
  }
  else
  {
    v28 = 0;
    if (v32->_logHandle)
    {
      logHandle = v32->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v28 = logHandle;
    v27 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v28;
      type = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_error_impl(&dword_1B5291000, log, type, "invalid parameters", v26, 2u);
    }
  }
}

- (id)copyPropertyInternalWithKey:(id)a3 forClient:(id)a4
{
  NSMutableArray *displayContainers;
  NSMutableArray *v5;
  NSMutableDictionary *keyboardContainers;
  uint64_t v7;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t, uint64_t, void *, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t, void *, uint64_t, _BYTE *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, void *, uint64_t, _BYTE *);
  void *v29;
  id v30;
  uint64_t *v31;
  _BOOL4 v32;
  _BOOL4 v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  const __CFString *v42;
  id v43;
  SEL v44;
  BLControl *v45;

  v45 = self;
  v44 = a2;
  v43 = a3;
  v42 = (const __CFString *)a4;
  v35 = 0;
  v36 = &v35;
  v37 = 1375731712;
  v38 = 48;
  v39 = __Block_byref_object_copy__15;
  v40 = __Block_byref_object_dispose__15;
  v41 = 0;
  v41 = -[BLControl copyBLControlPropertyWithkey:](self, "copyBLControlPropertyWithkey:", a3);
  if (!v36[5])
  {
    if (v45->_builtInDisplayCount > 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ((objc_msgSend(v43, "isEqual:", CFSTR("DisplayBrightness")) & 1) != 0
        || (objc_msgSend(v43, "isEqual:", CFSTR("DisplayNitsKey")) & 1) != 0
        || (objc_msgSend(v43, "isEqual:", CFSTR("BrightnessCLTMMode")) & 1) != 0
        || (objc_msgSend(v43, "isEqual:", CFSTR("BrightnessCLTM")) & 1) != 0)
      {
        v34 = 0;
        if (v42)
          v10 = v42;
        else
          v10 = CFSTR("Server");
        v34 = (__CFString *)-[NSMutableDictionary objectForKey:](v45->_clientDisplayMap, "objectForKey:", v10);
        if (!v34)
          v34 = CFSTR("DisplayTypeIcon");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = (-[__CFString isEqual:](v34, "isEqual:", CFSTR("DisplayTypeIcon")) & 1) != 0;
          displayContainers = v45->_displayContainers;
          v25 = MEMORY[0x1E0C809B0];
          v26 = -1073741824;
          v27 = 0;
          v28 = __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke;
          v29 = &unk_1E68EAF50;
          v32 = v33;
          v31 = &v35;
          v30 = v43;
          -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v25);
        }
      }
    }
    else
    {
      v5 = v45->_displayContainers;
      v18 = MEMORY[0x1E0C809B0];
      v19 = -1073741824;
      v20 = 0;
      v21 = __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke_2;
      v22 = &unk_1E68EA910;
      v24 = &v35;
      v23 = v43;
      -[NSMutableArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", &v18);
      if (!v36[5])
      {
        keyboardContainers = v45->_keyboardContainers;
        v11 = MEMORY[0x1E0C809B0];
        v12 = -1073741824;
        v13 = 0;
        v14 = __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke_3;
        v15 = &unk_1E68EAF78;
        v17 = &v35;
        v16 = v43;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyboardContainers, "enumerateKeysAndObjectsUsingBlock:", &v11);
      }
    }
  }
  if (!v36[5])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(-[NightModeControl getPropertyForKey:](v45->_nightModeControl, "getPropertyForKey:", v43), "copy");
      v36[5] = v7;
    }
  }
  v9 = (void *)v36[5];
  _Block_object_dispose(&v35, 8);
  return v9;
}

- (BLControl)init
{
  os_log_t v2;
  id v3;
  dispatch_workloop_t inactive;
  dispatch_queue_t v5;
  id v6;
  id v7;
  id v8;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t inited;
  NSObject *v21;
  NSObject *log;
  os_log_type_t type;
  NSObject *v24;
  uint8_t v25[7];
  char v26;
  NSObject *v27;
  uint8_t v28[7];
  char v29;
  NSObject *v30;
  uint8_t v31[7];
  char v32;
  NSObject *v33;
  uint8_t v34[15];
  char v35;
  NSObject *v36;
  objc_super v37;
  SEL v38;
  id v39;

  v39 = self;
  v38 = a2;
  v37.receiver = self;
  v37.super_class = (Class)BLControl;
  v39 = -[BLControl init](&v37, sel_init);
  if (v39)
  {
    v2 = os_log_create("com.apple.CoreBrightness.BLControl", "default");
    *((_QWORD *)v39 + 14) = v2;
    if (!*((_QWORD *)v39 + 14))
    {
      v36 = 0;
      v24 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v36 = v24;
      v35 = 16;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        log = v36;
        type = v35;
        __os_log_helper_16_0_0(v34);
        _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v34, 2u);
      }
    }
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v39 + 11) = v3;
    if (!*((_QWORD *)v39 + 11))
    {
      v33 = 0;
      if (*((_QWORD *)v39 + 14))
      {
        v21 = *((_QWORD *)v39 + 14);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v21 = inited;
      }
      v33 = v21;
      v32 = 16;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v18 = v33;
        v19 = v32;
        __os_log_helper_16_0_0(v31);
        _os_log_error_impl(&dword_1B5291000, v18, v19, "creation of _clientDisplayMap failed!! Not starting brightness system", v31, 2u);
      }
LABEL_39:

      v39 = 0;
      return 0;
    }
    inactive = dispatch_workloop_create_inactive("BacklightControl - Primary workloop");
    *((_QWORD *)v39 + 2) = inactive;
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate(*((dispatch_object_t *)v39 + 2));
    v5 = dispatch_queue_create_with_target_V2("BacklightControl - Primary queue", 0, *((dispatch_queue_t *)v39 + 2));
    *((_QWORD *)v39 + 3) = v5;
    if (!*((_QWORD *)v39 + 3))
    {
      v30 = 0;
      if (*((_QWORD *)v39 + 14))
      {
        v17 = *((_QWORD *)v39 + 14);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v16 = init_default_corebrightness_log();
        v17 = v16;
      }
      v30 = v17;
      v29 = 16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v14 = v30;
        v15 = v29;
        __os_log_helper_16_0_0(v28);
        _os_log_error_impl(&dword_1B5291000, v14, v15, "failed to create an internal dispatch queue", v28, 2u);
      }
      goto LABEL_39;
    }
    *((_BYTE *)v39 + 57) = 0;
    *((_BYTE *)v39 + 56) = 0;
    *((_DWORD *)v39 + 15) = -1;
    *((_DWORD *)v39 + 18) = -1;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v39 + 12) = v6;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v39 + 13) = v7;
    *((_QWORD *)v39 + 19) = 0;
    *((_QWORD *)v39 + 20) = 5;
    *((_QWORD *)v39 + 21) = 0;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v39 + 17) = v8;
    if (!*((_QWORD *)v39 + 17))
    {
      v27 = 0;
      if (*((_QWORD *)v39 + 14))
      {
        v13 = *((_QWORD *)v39 + 14);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v12 = init_default_corebrightness_log();
        v13 = v12;
      }
      v27 = v13;
      v26 = 16;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v10 = v27;
        v11 = v26;
        __os_log_helper_16_0_0(v25);
        _os_log_error_impl(&dword_1B5291000, v10, v11, "unable to create display containers dictionary", v25, 2u);
      }
      goto LABEL_39;
    }
  }
  return (BLControl *)v39;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  BLControl *v4;

  v4 = self;
  v3 = a2;
  -[BLControl releaseDisplayModeCompletionTimer](self, "releaseDisplayModeCompletionTimer");
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_queue)
    dispatch_release((dispatch_object_t)v4->_queue);
  if (v4->_workloop)
    dispatch_release((dispatch_object_t)v4->_workloop);

  v2.receiver = v4;
  v2.super_class = (Class)BLControl;
  -[BLControl dealloc](&v2, sel_dealloc);
}

- (BOOL)start
{
  NSObject *queue;
  char v4;
  uint64_t block;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  BLControl *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  char v16;
  SEL v17;
  BLControl *v18;

  v18 = self;
  v17 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x20000000;
  v15 = 32;
  v16 = 0;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __18__BLControl_start__block_invoke;
  v9 = &unk_1E68EABC8;
  v10 = v18;
  v11 = &v12;
  dispatch_sync(queue, &block);
  v4 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v4 & 1;
}

uint64_t __18__BLControl_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v22;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(uint64_t);
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t, int);
  void *v34;
  uint64_t v35;
  uint8_t v36[7];
  char v37;
  NSObject *v38;
  uint8_t v39[7];
  char v40;
  NSObject *v41;
  uint8_t v42[15];
  char v43;
  NSObject *v44;
  char v45;
  uint8_t v46[7];
  char v47;
  NSObject *v48;
  uint8_t v49[7];
  os_log_type_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;

  v53 = a1;
  v52 = a1;
  if ((CBU_ShouldWaitForALS() & 1) != 0)
  {
    v51 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    {
      v22 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v22 = inited;
    }
    v51 = v22;
    v50 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      log = v51;
      type = v50;
      __os_log_helper_16_0_0(v49);
      _os_log_impl(&dword_1B5291000, log, type, "check ALS arrival", v49, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "waitForALSArrival");
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "startHIDSystemClient") & 1) == 0)
  {
    v48 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    {
      v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    }
    else
    {
      v17 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v18 = v17;
    }
    v48 = v18;
    v47 = 16;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v15 = v48;
      v16 = v47;
      __os_log_helper_16_0_0(v46);
      _os_log_error_impl(&dword_1B5291000, v15, v16, "no HID", v46, 2u);
    }
  }
  v45 = 0;
  v45 = objc_msgSend(*(id *)(a1 + 32), "findDisplays") & 1;
  if (!v45)
  {
    v44 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v13 = init_default_corebrightness_log();
      v14 = v13;
    }
    v44 = v14;
    v43 = 1;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v11 = v44;
      v12 = v43;
      __os_log_helper_16_0_0(v42);
      _os_log_impl(&dword_1B5291000, v11, v12, "CA doesn't provide display list", v42, 2u);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "findBacklight") & 1) != 0)
    {
      v41 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
      {
        v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v9 = init_default_corebrightness_log();
        v10 = v9;
      }
      v41 = v10;
      v40 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v7 = v41;
        v8 = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_impl(&dword_1B5291000, v7, v8, "CA doesn't provide display list", v39, 2u);
      }
    }
    else
    {
      v38 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
      {
        v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v5 = init_default_corebrightness_log();
        v6 = v5;
      }
      v38 = v6;
      v37 = 16;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v3 = v38;
        v4 = v37;
        __os_log_helper_16_0_0(v36);
        _os_log_error_impl(&dword_1B5291000, v3, v4, "Built in display/backlight driver has not been found.", v36, 2u);
      }
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "enumerateObjectsUsingBlock:", &__block_literal_global_11, v3);
  v1 = MEMORY[0x1E0C809B0];
  v30 = MEMORY[0x1E0C809B0];
  v31 = -1073741824;
  v32 = 0;
  v33 = __18__BLControl_start__block_invoke_2;
  v34 = &unk_1E68EAE10;
  v35 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = &v30;
  v24 = v1;
  v25 = -1073741824;
  v26 = 0;
  v27 = __18__BLControl_start__block_invoke_3;
  v28 = &unk_1E68EAE10;
  v29 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = &v24;
  notify_register_dispatch("com.apple.system.lowpowermode", (int *)(*(_QWORD *)(a1 + 32) + 60), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24), *(notify_handler_t *)(*(_QWORD *)(a1 + 32) + 64));
  notify_register_dispatch("com.apple.powerd.lowpowermode.prefs", (int *)(*(_QWORD *)(a1 + 32) + 72), MEMORY[0x1E0C80D38], *(notify_handler_t *)(*(_QWORD *)(a1 + 32) + 80));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "initKeyboardBacklightHIDManager");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = IOPMScheduleUserActiveChangedNotification();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F78]), "initWithIdentifier:queue:", CFSTR("com.apple.CoreBrightness.BLControl"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "addObserver:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __18__BLControl_start__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("DisplayBrightnessAuto"));
  return result;
}

uint64_t __18__BLControl_start__block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  uint64_t state64[2];
  int v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2;
  state64[1] = a1;
  state64[0] = 0;
  notify_get_state(a2, state64);
  v4 = *(void **)(a1 + 32);
  if (state64[0])
    return objc_msgSend(v4, "setPropertyInternalWithKey:property:client:", CFSTR("EcoMode"), *MEMORY[0x1E0C9AE50], 0);
  else
    return objc_msgSend(v4, "setPropertyInternalWithKey:property:client:", CFSTR("EcoMode"), *MEMORY[0x1E0C9AE40], 0);
}

void __18__BLControl_start__block_invoke_3(uint64_t a1)
{
  CFTypeRef cf;

  CFPreferencesAppSynchronize(CFSTR("com.apple.powerd.lowpowermode"));
  cf = CFPreferencesCopyAppValue(CFSTR("backlightReduction"), CFSTR("com.apple.powerd.lowpowermode"));
  if (cf)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPropertyInternalWithKey:property:client:", CFSTR("EcoModeFactorUpdate"), cf, 0);
    CFRelease(cf);
  }
}

uint64_t __18__BLControl_start__block_invoke_4(uint64_t a1, char a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUserIsActiveStateChange:", a2 & 1);
}

- (void)stop
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  BLControl *v8;
  SEL v9;
  BLControl *v10;

  v10 = self;
  v9 = a2;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __17__BLControl_stop__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = v10;
  dispatch_sync(queue, &block);
}

void __17__BLControl_stop__block_invoke(uint64_t a1)
{
  if (notify_is_valid_token(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 60)))
  {
    notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 60));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 60) = -1;
  }
  if (notify_is_valid_token(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 72)))
  {
    notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 72));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = -1;
  }
  objc_msgSend(*(id *)(a1 + 32), "registerNotificationBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "cancelHIDSystemClient");
  objc_msgSend(*(id *)(a1 + 32), "stopDisplayLookup");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "makeObjectsPerformSelector:", 0x1F2741C48uLL);
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "allValues"), "makeObjectsPerformSelector:", 0x1F2741C48uLL);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152))
  {
    IOPMUnregisterNotification();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "removeObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "invalidate");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
  }
}

uint64_t __33__BLControl_handleHIDEvent_from___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "conformsToProtocol:", &unk_1EF12E780);
  if ((result & 1) != 0)
    return objc_msgSend(a3, "setProperty:forKey:", *(_QWORD *)(a1 + 32), CFSTR("TrustedFrontLux"));
  return result;
}

- (BOOL)findBacklight
{
  CBDisplayContaineriOS *v2;
  NSMutableArray *hidServiceClients;
  NSObject *log;
  os_log_type_t v6;
  uint64_t inited;
  NSObject *logHandle;
  CFAllocatorRef *v9;
  CFDictionaryKeyCallBacks *keyCallBacks;
  CFDictionaryValueCallBacks *valueCallBacks;
  uint8_t v12[7];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  CBDisplayContaineriOS *v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  BLControl *v26;
  CBDisplayContaineriOS *v27;
  io_object_t v28;
  io_iterator_t existing;
  CFDictionaryRef v30;
  CFDictionaryRef v31;
  char v32;
  SEL v33;
  BLControl *v34;
  void *v35;
  void *v36;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v34 = self;
  v33 = a2;
  v32 = 0;
  keys[0] = CFSTR("backlight-control");
  values = 0;
  values = (void *)*MEMORY[0x1E0C9AE50];
  v31 = 0;
  v9 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  keyCallBacks = (CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  valueCallBacks = (CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  v31 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v36 = CFSTR("IOPropertyMatch");
  v35 = v31;
  v30 = 0;
  v30 = CFDictionaryCreate(*v9, (const void **)&v36, (const void **)&v35, 1, keyCallBacks, valueCallBacks);
  CFRelease(v31);
  existing = 0;
  v28 = 0;
  if (!IOServiceGetMatchingServices(*MEMORY[0x1E0CBBAA8], v30, &existing) && existing)
  {
    while (1)
    {
      v28 = IOIteratorNext(existing);
      if (!v28)
        break;
      v27 = 0;
      v2 = [CBDisplayContaineriOS alloc];
      v27 = -[CBDisplayContaineriOS initWithBacklightService:](v2, "initWithBacklightService:", v28);
      if (v27)
      {
        -[CBContainer scheduleWithDispatchQueue:](v27, "scheduleWithDispatchQueue:", v34->_queue);
        v21 = MEMORY[0x1E0C809B0];
        v22 = -1073741824;
        v23 = 0;
        v24 = __26__BLControl_findBacklight__block_invoke;
        v25 = &unk_1E68E9F38;
        v26 = v34;
        -[CBDisplayContaineriOS registerNotificationBlock:](v27, "registerNotificationBlock:", &v21);
        v32 = -[CBDisplayContaineriOS start](v27, "start");
        if (!v32)
        {

          break;
        }
        -[BLControl addDisplayContainer:](v34, "addDisplayContainer:", v27);
        ++v34->_builtInDisplayCount;
        if ((-[CBDisplayContaineriOS conformsToProtocol:](v27, "conformsToProtocol:", &unk_1EF12B9C8) & 1) != 0)
        {
          hidServiceClients = v34->_hidServiceClients;
          v15 = MEMORY[0x1E0C809B0];
          v16 = -1073741824;
          v17 = 0;
          v18 = __26__BLControl_findBacklight__block_invoke_2;
          v19 = &unk_1E68EA068;
          v20 = v27;
          -[NSMutableArray enumerateObjectsUsingBlock:](hidServiceClients, "enumerateObjectsUsingBlock:", &v15);
        }

      }
      else
      {
        oslog = 0;
        if (v34->_logHandle)
        {
          logHandle = v34->_logHandle;
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
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v6 = type;
          __os_log_helper_16_0_0(v12);
          _os_log_error_impl(&dword_1B5291000, log, v6, "error: failed to create display container for service", v12, 2u);
        }
      }
      v32 = 1;
    }
    IOObjectRelease(existing);
  }
  return v32 & 1;
}

uint64_t __26__BLControl_findBacklight__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

uint64_t __26__BLControl_findBacklight__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addHIDServiceClient:", a2);
}

- (BOOL)findDisplays
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obj;
  uint64_t v15;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  _QWORD v23[8];
  id v24;
  unsigned int v25;
  _QWORD __b[8];
  id v27;
  id v28;
  os_log_type_t v29;
  os_log_t v30;
  id v31;
  uint8_t v32[15];
  os_log_type_t type;
  os_log_t oslog;
  id v35;
  char v36;
  SEL v37;
  BLControl *v38;
  char v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint8_t v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = self;
  v37 = a2;
  v36 = 0;
  v35 = (id)objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning");
  if (v35)
  {
    v31 = (id)objc_msgSend(v35, "displays");
    v30 = 0;
    if (v38->_logHandle)
    {
      logHandle = v38->_logHandle;
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
    v29 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v42, (uint64_t)v31);
      _os_log_impl(&dword_1B5291000, v30, v29, "displays: %{public}@", v42, 0xCu);
    }
    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    memset(__b, 0, sizeof(__b));
    obj = v31;
    v15 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
    if (v15)
    {
      v11 = *(_QWORD *)__b[2];
      v12 = 0;
      v13 = v15;
      while (1)
      {
        v10 = v12;
        if (*(_QWORD *)__b[2] != v11)
          objc_enumerationMutation(obj);
        v27 = 0;
        v27 = *(id *)(__b[1] + 8 * v12);
        v25 = objc_msgSend(v27, "displayId");
        if (-[BLControl useSyncBrightnessTransactionForDisplay:](v38, "useSyncBrightnessTransactionForDisplay:", v27))
        {
          -[BLControl handleCAWindowServerDisplay:](v38, "handleCAWindowServerDisplay:", v27);
          v36 = 1;
          objc_msgSend(v28, "setObject:forKey:", CFSTR("WSDisplay"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v25));
        }
        else
        {
          objc_msgSend(v28, "setObject:forKey:", CFSTR("CADisplay"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v25));
        }
        ++v12;
        if (v10 + 1 >= v13)
        {
          v12 = 0;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
          if (!v13)
            break;
        }
      }
    }
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    objc_msgSend(v2, "addObserver:forKeyPath:options:context:", v38, CFSTR("currentPreset"), 0, 0);
    -[BLControl handlePresetChange](v38, "handlePresetChange");
    memset(v23, 0, sizeof(v23));
    v8 = (id)objc_msgSend(MEMORY[0x1E0CD2728], "displays");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v23, v40, 16);
    if (v9)
    {
      v5 = *(_QWORD *)v23[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)v23[2] != v5)
          objc_enumerationMutation(v8);
        v24 = 0;
        v24 = *(id *)(v23[1] + 8 * v6);
        v22 = objc_msgSend(v24, "displayId");
        if ((objc_msgSend((id)objc_msgSend(v28, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22)), "isEqualToString:", CFSTR("CADisplay")) & 1) != 0)
        {
          -[BLControl handleCADisplay:](v38, "handleCADisplay:", v24);
          objc_msgSend(v24, "addObserver:forKeyPath:options:context:", v38, CFSTR("currentMode"), 0, 0);
          v36 = 1;
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v23, v40, 16);
          if (!v7)
            break;
        }
      }
    }

    v39 = v36 & 1;
  }
  else
  {
    oslog = 0;
    if (v38->_logHandle)
    {
      v21 = v38->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v20 = init_default_corebrightness_log();
      v21 = v20;
    }
    oslog = v21;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v19 = type;
      __os_log_helper_16_0_0(v32);
      _os_log_error_impl(&dword_1B5291000, log, v19, "CAWindowServer is not running", v32, 2u);
    }
    v39 = v36 & 1;
  }
  return v39 & 1;
}

- (void)stopDisplayLookup
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id obj;
  uint64_t v8;
  uint64_t inited;
  NSObject *logHandle;
  _QWORD __b[8];
  id v12;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v15;
  SEL v16;
  BLControl *v17;
  _BYTE v18[128];
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = self;
  v16 = a2;
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning"), "displays");
  oslog = 0;
  if (v17->_logHandle)
  {
    logHandle = v17->_logHandle;
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
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v19, v15);
    _os_log_impl(&dword_1B5291000, oslog, type, "displays: %{public}@", v19, 0xCu);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay"), "removeObserver:forKeyPath:context:", v17, CFSTR("currentPreset"), 0);
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(MEMORY[0x1E0CD2728], "displays");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
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
      v12 = 0;
      v12 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v12, "removeObserver:forKeyPath:context:", v17, CFSTR("currentMode"), 0, v6);
      ++v5;
      v6 = v2;
      if (v3 + 1 >= v2)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
        if (!v6)
          break;
      }
    }
  }
}

- (void)handleCADisplay:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[16];
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3 && isDisplayAvailable((CADisplay *)a3))
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v10, objc_msgSend(a3, "deviceName"));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "%{public}@ is available", v10, 0xCu);
    }
    -[BLControl handleCADisplayArrival:](self, "handleCADisplayArrival:", a3);
  }
  else
  {
    if (self->_logHandle)
    {
      v4 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v3 = init_default_corebrightness_log();
      v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v9, objc_msgSend(a3, "deviceName"));
      _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_INFO, "%{public}@ is not available", v9, 0xCu);
    }
    -[BLControl handleCADisplayRemoval:](self, "handleCADisplayRemoval:", a3);
  }
}

- (void)handleCAWindowServerDisplay:(id)a3
{
  char v3;
  uint64_t v4;
  NSMutableArray *hidServiceClients;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v10;
  uint64_t v11;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  CBDisplayContaineriOS *v22;
  os_log_type_t v23;
  os_log_t v24;
  id v25;
  uint8_t v26[7];
  char v27;
  NSObject *v28;
  char v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  void *v34;
  BLControl *v35;
  CBDisplayContaineriOS *v36;
  CBBrightnessProxyCA *v37;
  id v38;
  id v39;
  SEL v40;
  BLControl *v41;
  uint8_t v42[16];
  uint8_t v43[24];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v41 = self;
  v40 = a2;
  v39 = a3;
  v38 = a3;
  v37 = -[CBBrightnessProxyCA initWithCABrightnessControl:]([CBBrightnessProxyCA alloc], "initWithCABrightnessControl:", a3);
  if (v37)
  {
    v36 = -[CBDisplayContaineriOS initWithCBBrtControl:]([CBDisplayContaineriOS alloc], "initWithCBBrtControl:", v37);
    if (v36)
    {
      -[CBContainer scheduleWithDispatchQueue:](v36, "scheduleWithDispatchQueue:", v41->_queue);
      v30 = MEMORY[0x1E0C809B0];
      v31 = -1073741824;
      v32 = 0;
      v33 = __41__BLControl_handleCAWindowServerDisplay___block_invoke;
      v34 = &unk_1E68E9F38;
      v35 = v41;
      -[CBDisplayContaineriOS registerNotificationBlock:](v36, "registerNotificationBlock:", &v30);
      v29 = -[CBDisplayContaineriOS start](v36, "start");
      v16 = -[CBBrightnessProxyCA getDisplayType](v37, "getDisplayType");
      if (v16 != -[CBBrightnessProxyCA CBDispTypeIntegrated](v37, "CBDispTypeIntegrated") || (v29 & 1) != 0)
      {
        v11 = -[CBBrightnessProxyCA getDisplayType](v37, "getDisplayType");
        if (v11 == -[CBBrightnessProxyCA CBDispTypeIntegrated](v37, "CBDispTypeIntegrated"))
          ++v41->_builtInDisplayCount;
        v10 = -[CBBrightnessProxyCA getDisplayType](v37, "getDisplayType");
        if (v10 == -[CBBrightnessProxyCA CBDispTypeIntegrated](v37, "CBDispTypeIntegrated") && v41->_displayMode == 5)
        {
          v25 = -[CBDisplayContaineriOS copyPropertyForKey:](v36, "copyPropertyForKey:", CFSTR("DisplayOn"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v3 = objc_msgSend(v25, "BOOLValue");
            v4 = 3;
            if ((v3 & 1) == 0)
              v4 = 0;
            v41->_displayMode = v4;
            v24 = 0;
            if (v41->_logHandle)
            {
              logHandle = v41->_logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                inited = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                inited = init_default_corebrightness_log();
              logHandle = inited;
            }
            v24 = logHandle;
            v23 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
            {
              __os_log_helper_16_2_1_8_66((uint64_t)v43, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v41->_displayMode));
              _os_log_impl(&dword_1B5291000, v24, v23, "display mode initialised from invalid to %{public}@", v43, 0xCu);
            }
          }

        }
        -[BLControl addDisplayContainer:](v41, "addDisplayContainer:", v36);
        if ((-[CBDisplayContaineriOS conformsToProtocol:](v36, "conformsToProtocol:", &unk_1EF12B9C8) & 1) != 0)
        {
          hidServiceClients = v41->_hidServiceClients;
          v17 = MEMORY[0x1E0C809B0];
          v18 = -1073741824;
          v19 = 0;
          v20 = __41__BLControl_handleCAWindowServerDisplay___block_invoke_118;
          v21 = &unk_1E68EA068;
          v22 = v36;
          -[NSMutableArray enumerateObjectsUsingBlock:](hidServiceClients, "enumerateObjectsUsingBlock:", &v17);
        }

      }
      else
      {
        v28 = 0;
        if (v41->_logHandle)
        {
          v15 = v41->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v14 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v14 = init_default_corebrightness_log();
          v15 = v14;
        }
        v28 = v15;
        v27 = 16;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          log = v28;
          type = v27;
          __os_log_helper_16_0_0(v26);
          _os_log_error_impl(&dword_1B5291000, log, type, "BLControl, ERROR creating container....return! ", v26, 2u);
        }

      }
    }
    else
    {
      if (v41->_logHandle)
      {
        v7 = v41->_logHandle;
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
        __os_log_helper_16_2_1_8_66((uint64_t)v42, (uint64_t)v39);
        _os_log_error_impl(&dword_1B5291000, v7, OS_LOG_TYPE_ERROR, "error: failed to create display container for service %{public}@", v42, 0xCu);
      }

    }
  }
}

uint64_t __41__BLControl_handleCAWindowServerDisplay___block_invoke_118(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addHIDServiceClient:", a2);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *queue;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  BLControl *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  SEL v20;
  BLControl *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = a5;
  v16 = a6;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __60__BLControl_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v11 = &unk_1E68EA4D0;
  v12 = a4;
  v13 = v21;
  v14 = a3;
  v15 = a5;
  dispatch_sync(queue, &v7);
}

void __60__BLControl_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t inited;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v10;
  uint8_t v11[16];
  uint8_t v12[32];
  uint8_t v13[48];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = *(void **)(a1 + 32);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
    {
      v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v6 = inited;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_4_8_66_8_66_8_66_8_66((uint64_t)v13, objc_msgSend(v10, "name"), *(_QWORD *)(a1 + 48), objc_msgSend(v10, "valueForKeyPath:", *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 56));
      _os_log_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEFAULT, "observed %{public}@ changing %{public}@; is now %{public}@; change dict: %{public}@",
        v13,
        0x2Au);
    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v3 = init_default_corebrightness_log();
      v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_4_0_8_66((uint64_t)v12, objc_msgSend(v10, "displayId"), objc_msgSend(v10, "uniqueId"));
      _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "display ID %u; unique ID %{public}@;", v12, 0x12u);
    }
    if ((objc_msgSend(v10, "isExternal") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 48), "isEqual:", CFSTR("currentMode")) & 1) == 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "isEqual:", CFSTR("currentPreset")) & 1) != 0)
        objc_msgSend(*(id *)(a1 + 40), "handlePresetChange");
      else
        objc_msgSend(*(id *)(a1 + 40), "handleCADisplay:", v10);
    }
    else
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
      {
        v2 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v1 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v1 = init_default_corebrightness_log();
        v2 = v1;
      }
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v11, objc_msgSend(v10, "displayId"));
        _os_log_impl(&dword_1B5291000, v2, OS_LOG_TYPE_DEFAULT, "%u Internal display's mode (resolution) changed, doing nothing", v11, 8u);
      }
    }
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
    {
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, *(_QWORD *)(a1 + 32));
      _os_log_error_impl(&dword_1B5291000, v8, OS_LOG_TYPE_ERROR, "Unexpected object observed %@", v14, 0xCu);
    }
  }
}

- (void)handleCADisplayArrival:(id)a3
{
  char v3;
  uint64_t v4;
  NSMutableArray *hidServiceClients;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  CBDisplayContaineriOS *v15;
  os_log_type_t v16;
  os_log_t v17;
  id v18;
  char v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t);
  void *v24;
  BLControl *v25;
  CBDisplayContaineriOS *v26;
  id v27;
  SEL v28;
  BLControl *v29;
  uint8_t v30[16];
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = self;
  v28 = a2;
  v27 = a3;
  -[BLControl handleCADisplayRemoval:](self, "handleCADisplayRemoval:", a3);
  v26 = -[CBDisplayContaineriOS initWithCADisplay:]([CBDisplayContaineriOS alloc], "initWithCADisplay:", v27);
  if (v26)
  {
    -[CBContainer scheduleWithDispatchQueue:](v26, "scheduleWithDispatchQueue:", v29->_queue);
    v20 = MEMORY[0x1E0C809B0];
    v21 = -1073741824;
    v22 = 0;
    v23 = __36__BLControl_handleCADisplayArrival___block_invoke;
    v24 = &unk_1E68E9F38;
    v25 = v29;
    -[CBDisplayContaineriOS registerNotificationBlock:](v26, "registerNotificationBlock:", &v20);
    v19 = -[CBDisplayContaineriOS start](v26, "start");
    if ((objc_msgSend(v27, "isExternal") & 1) != 0 || (v19 & 1) != 0)
    {
      if ((objc_msgSend(v27, "isExternal") & 1) == 0)
        ++v29->_builtInDisplayCount;
      if ((objc_msgSend(v27, "isExternal") & 1) == 0 && v29->_displayMode == 5)
      {
        v18 = -[CBDisplayContaineriOS copyPropertyForKey:](v26, "copyPropertyForKey:", CFSTR("DisplayOn"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = objc_msgSend(v18, "BOOLValue");
          v4 = 3;
          if ((v3 & 1) == 0)
            v4 = 0;
          v29->_displayMode = v4;
          v17 = 0;
          if (v29->_logHandle)
          {
            logHandle = v29->_logHandle;
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
          v16 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v31, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v29->_displayMode));
            _os_log_impl(&dword_1B5291000, v17, v16, "display mode initialised from invalid to %{public}@", v31, 0xCu);
          }
        }

      }
      -[BLControl addDisplayContainer:](v29, "addDisplayContainer:", v26);
      if ((-[CBDisplayContaineriOS conformsToProtocol:](v26, "conformsToProtocol:", &unk_1EF12B9C8) & 1) != 0)
      {
        hidServiceClients = v29->_hidServiceClients;
        v10 = MEMORY[0x1E0C809B0];
        v11 = -1073741824;
        v12 = 0;
        v13 = __36__BLControl_handleCADisplayArrival___block_invoke_119;
        v14 = &unk_1E68EA068;
        v15 = v26;
        -[NSMutableArray enumerateObjectsUsingBlock:](hidServiceClients, "enumerateObjectsUsingBlock:", &v10);
      }

      -[BLControl handleExternalDisplayChange](v29, "handleExternalDisplayChange");
    }
    else
    {

    }
  }
  else
  {
    if (v29->_logHandle)
    {
      v7 = v29->_logHandle;
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
      __os_log_helper_16_2_1_8_66((uint64_t)v30, (uint64_t)v27);
      _os_log_error_impl(&dword_1B5291000, v7, OS_LOG_TYPE_ERROR, "error: failed to create display container for service %{public}@", v30, 0xCu);
    }
  }
}

uint64_t __36__BLControl_handleCADisplayArrival___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

uint64_t __36__BLControl_handleCADisplayArrival___block_invoke_119(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addHIDServiceClient:", a2);
}

- (void)handleCADisplayRemoval:(id)a3
{
  NSMutableArray *displayContainers;
  uint64_t v4;
  NSObject *v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  id v13;
  BLControl *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  id v25;
  SEL v26;
  BLControl *v27;
  uint8_t v28[16];
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26 = a2;
  v25 = a3;
  if (a3)
  {
    v24 = 0;
    v24 = objc_msgSend(v25, "displayId");
    v17 = 0;
    v18 = &v17;
    v19 = 1375731712;
    v20 = 48;
    v21 = __Block_byref_object_copy__15;
    v22 = __Block_byref_object_dispose__15;
    v23 = 0;
    displayContainers = v27->_displayContainers;
    v8 = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __36__BLControl_handleCADisplayRemoval___block_invoke;
    v12 = &unk_1E68EAE90;
    v13 = v25;
    v14 = v27;
    v16 = v24;
    v15 = &v17;
    -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v8);
    if (v18[5])
    {
      if ((objc_msgSend(v25, "isExternal") & 1) == 0)
        --v27->_builtInDisplayCount;
      if (v27->_logHandle)
      {
        logHandle = v27->_logHandle;
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
        __os_log_helper_16_2_1_8_66((uint64_t)v29, v18[5]);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "removing %{public}@", v29, 0xCu);
      }
      objc_msgSend((id)v18[5], "stop");
      objc_msgSend((id)v18[5], "unregisterNotificationBlock");
      objc_msgSend((id)v18[5], "unscheduleWithDispatchQueue:", v27->_queue);
      -[BLControl removeDisplayContainer:](v27, "removeDisplayContainer:", v18[5]);
      -[BLControl handleExternalDisplayChange](v27, "handleExternalDisplayChange");
    }
    else
    {
      if (v27->_logHandle)
      {
        v5 = v27->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v4 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v4 = init_default_corebrightness_log();
        v5 = v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v28, v24);
        _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_INFO, "no matching container to registry ID 0x%llX", v28, 0xCu);
      }
    }
    _Block_object_dispose(&v17, 8);
  }
}

void __36__BLControl_handleCADisplayRemoval___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t inited;
  NSObject *v5;
  uint64_t v6;
  id v8;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780) & 1) != 0)
  {
    v8 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("CBDisplayID"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v8, "unsignedLongValue");
      if (v6 == objc_msgSend(*(id *)(a1 + 32), "displayId"))
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
        {
          v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          v5 = inited;
        }
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_2_8_0_8_64((uint64_t)v11, *(_QWORD *)(a1 + 56), (uint64_t)a2);
          _os_log_debug_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEBUG, "found container matching to to registry ID 0x%llX (%@)", v11, 0x16u);
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a2;
        *a4 = 1;
      }
    }

  }
}

- (id)newDevicePariMatchingDictionaryWithPage:(unsigned int)a3 andUsage:(unsigned int)a4
{
  id v4;
  id v5;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  SEL v15;
  BLControl *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = 0;
  v11 = 0;
  v7 = 0x1E0CB3000uLL;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a3);
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v13);
  if (v10 && v9)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v10, CFSTR("DeviceUsagePage"), v9, CFSTR("DeviceUsage"), 0);
    if (v11)
    {
      v8 = 0;
      v4 = objc_alloc(MEMORY[0x1E0C99D20]);
      v8 = (id)objc_msgSend(v4, "initWithObjects:", v11, 0);
      if (v8)
      {
        v5 = objc_alloc(MEMORY[0x1E0C99E08]);
        v12 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v8, CFSTR("DeviceUsagePairs"), 0);
      }

    }
  }

  return v12;
}

- (void)hidServiceArrival:(__IOHIDServiceClient *)a3
{
  NSMutableArray *displayContainers;
  NSMutableDictionary *keyboardContainers;
  uint64_t v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  __IOHIDServiceClient *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  __IOHIDServiceClient *v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v24;
  BLControl *v25;
  os_log_type_t v26;
  os_log_t v27;
  __IOHIDServiceClient *v28;
  SEL v29;
  BLControl *v30;
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = self;
  v29 = a2;
  v28 = a3;
  v27 = 0;
  if (self->_logHandle)
  {
    logHandle = v30->_logHandle;
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
  v26 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_0_8_66((uint64_t)v31, (uint64_t)v28, (uint64_t)v28);
    _os_log_impl(&dword_1B5291000, v27, v26, "(%p) %{public}@", v31, 0x16u);
  }
  v5 = MEMORY[0x1E0C809B0];
  v20 = MEMORY[0x1E0C809B0];
  v21 = -1073741824;
  v22 = 0;
  v23 = __31__BLControl_hidServiceArrival___block_invoke;
  v24 = &unk_1E68EAEB8;
  v25 = v30;
  IOHIDServiceClientRegisterRemovalBlock();
  -[NSMutableArray addObject:](v30->_hidServiceClients, "addObject:", v28);
  displayContainers = v30->_displayContainers;
  v14 = v5;
  v15 = -1073741824;
  v16 = 0;
  v17 = __31__BLControl_hidServiceArrival___block_invoke_2;
  v18 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v19 = v28;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v14);
  keyboardContainers = v30->_keyboardContainers;
  v8 = v5;
  v9 = -1073741824;
  v10 = 0;
  v11 = __31__BLControl_hidServiceArrival___block_invoke_3;
  v12 = &__block_descriptor_40_e15_v32__0_8_16_B24l;
  v13 = v28;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyboardContainers, "enumerateKeysAndObjectsUsingBlock:", &v8);
}

uint64_t __31__BLControl_hidServiceArrival___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeHIDService:", a4);
}

uint64_t __31__BLControl_hidServiceArrival___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "addHIDServiceClient:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __31__BLControl_hidServiceArrival___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a3, "addHIDServiceClient:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)removeHIDService:(__IOHIDServiceClient *)a3
{
  NSMutableArray *displayContainers;
  NSMutableDictionary *keyboardContainers;
  uint64_t v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  __IOHIDServiceClient *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  __IOHIDServiceClient *v19;
  os_log_type_t v20;
  os_log_t v21;
  __IOHIDServiceClient *v22;
  SEL v23;
  BLControl *v24;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = 0;
  if (self->_logHandle)
  {
    logHandle = v24->_logHandle;
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
  v20 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_0_8_66((uint64_t)v25, (uint64_t)v22, (uint64_t)v22);
    _os_log_impl(&dword_1B5291000, v21, v20, "(%p) %{public}@", v25, 0x16u);
  }
  -[NSMutableArray removeObject:](v24->_hidServiceClients, "removeObject:", v22);
  displayContainers = v24->_displayContainers;
  v5 = MEMORY[0x1E0C809B0];
  v14 = MEMORY[0x1E0C809B0];
  v15 = -1073741824;
  v16 = 0;
  v17 = __30__BLControl_removeHIDService___block_invoke;
  v18 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v19 = v22;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v14);
  keyboardContainers = v24->_keyboardContainers;
  v8 = v5;
  v9 = -1073741824;
  v10 = 0;
  v11 = __30__BLControl_removeHIDService___block_invoke_2;
  v12 = &__block_descriptor_40_e15_v32__0_8_16_B24l;
  v13 = v22;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyboardContainers, "enumerateKeysAndObjectsUsingBlock:", &v8);
}

uint64_t __30__BLControl_removeHIDService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "removeHIDServiceClient:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __30__BLControl_removeHIDService___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a3, "removeHIDServiceClient:", *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)startHIDSystemClient
{
  NSObject *log;
  os_log_type_t v4;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v7;
  uint8_t v8[15];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  BLControl *v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v22;
  BLControl *v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v28;
  BLControl *v29;
  id v30;
  id v31;
  char v32;
  SEL v33;
  BLControl *v34;

  v34 = self;
  v33 = a2;
  v32 = 0;
  self->_hidSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  if (v34->_hidSystemClient)
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v31)
    {
      v30 = -[BLControl newDevicePariMatchingDictionaryWithPage:andUsage:](v34, "newDevicePariMatchingDictionaryWithPage:andUsage:", 65280, 4);
      if (v30)
      {
        objc_msgSend(v31, "addObject:", v30);

      }
      v30 = -[BLControl newDevicePariMatchingDictionaryWithPage:andUsage:](v34, "newDevicePariMatchingDictionaryWithPage:andUsage:", 32, 65);
      if (v30)
      {
        objc_msgSend(v31, "addObject:", v30);

      }
      if (!v34->_monitorALSOnly)
      {
        v30 = -[BLControl newDevicePariMatchingDictionaryWithPage:andUsage:](v34, "newDevicePariMatchingDictionaryWithPage:andUsage:", 65280, 8);
        if (v30)
        {
          objc_msgSend(v31, "addObject:", v30);

        }
        v30 = -[BLControl newDevicePariMatchingDictionaryWithPage:andUsage:](v34, "newDevicePariMatchingDictionaryWithPage:andUsage:", 13, 12);
        if (v30)
        {
          objc_msgSend(v30, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Built-In"));
          objc_msgSend(v31, "addObject:", v30);

        }
        v30 = -[BLControl newDevicePariMatchingDictionaryWithPage:andUsage:](v34, "newDevicePariMatchingDictionaryWithPage:andUsage:", 11, 1);
        if (v30)
        {
          objc_msgSend(v31, "addObject:", v30);

        }
        v30 = -[BLControl newDevicePariMatchingDictionaryWithPage:andUsage:](v34, "newDevicePariMatchingDictionaryWithPage:andUsage:", 65280, 98);
        if (v30)
        {
          objc_msgSend(v31, "addObject:", v30);

        }
      }
      IOHIDEventSystemClientSetMatchingMultiple();

      v7 = MEMORY[0x1E0C809B0];
      v24 = MEMORY[0x1E0C809B0];
      v25 = -1073741824;
      v26 = 0;
      v27 = __33__BLControl_startHIDSystemClient__block_invoke;
      v28 = &unk_1E68EAF00;
      v29 = v34;
      IOHIDEventSystemClientRegisterEventBlock();
      v18 = v7;
      v19 = -1073741824;
      v20 = 0;
      v21 = __33__BLControl_startHIDSystemClient__block_invoke_2;
      v22 = &unk_1E68EAEB8;
      v23 = v34;
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      IOHIDEventSystemClientScheduleWithDispatchQueue();
      v17 = 0;
      v17 = IOHIDEventSystemClientCopyServices(v34->_hidSystemClient);
      v11 = v7;
      v12 = -1073741824;
      v13 = 0;
      v14 = __33__BLControl_startHIDSystemClient__block_invoke_3;
      v15 = &unk_1E68EA068;
      v16 = v34;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v11);

      v32 = 1;
    }
  }
  else
  {
    oslog = 0;
    if (v34->_logHandle)
    {
      logHandle = v34->_logHandle;
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
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v4 = type;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1B5291000, log, v4, "failed to initialise IOHIDSystemClient", v8, 2u);
    }
  }
  return v32 & 1;
}

uint64_t __33__BLControl_startHIDSystemClient__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "hidServiceArrival:", a4);
}

uint64_t __33__BLControl_startHIDSystemClient__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hidServiceArrival:", a2);
}

- (void)cancelHIDSystemClient
{
  if (self->_hidSystemClient)
  {
    MEMORY[0x1B5E4A07C](self->_hidSystemClient, self->_queue);
    IOHIDEventSystemClientUnregisterEventBlock();
    CFRelease(self->_hidSystemClient);
    self->_hidSystemClient = 0;
  }
}

void __42__BLControl_copyBLControlPropertyWithkey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v10 = (void *)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("CBDisplayIsBuiltIn"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v10, "BOOLValue") & 1) != 0)
  {
    v9 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("EventTimestampFirstALSSample"));
    v8 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("EventTimestampDisplayOn"));
    v7 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("EventTimestampDisplayOff"));
    v6 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("EventTimestampFirstALSSampleTimeout"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    if (v9)
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("EventTimestampFirstALSSample"));
    if (v8)
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("EventTimestampDisplayOn"));
    if (v7)
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("EventTimestampDisplayOff"));
    if (v6)
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("EventTimestampFirstALSSampleTimeout"));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v5;
    *a4 = 1;
  }

}

void __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;

  v5 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("DisplayTypeA"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "intValue") == *(_DWORD *)(a1 + 48))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copyPropertyForKey:", *(_QWORD *)(a1 + 32));
    *a4 = 1;
  }

}

uint64_t __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t result;

  v4 = objc_msgSend(a3, "copyPropertyForKey:", *(_QWORD *)(a1 + 32));
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v4;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
  return result;
}

- (void)handlePresetChange
{
  CBPresetsParser *v2;

  v2 = +[CBPresetsParser sharedInstance](CBPresetsParser, "sharedInstance");
  -[CBPresetsParser refreshPresetState](v2, "refreshPresetState");
  -[NightModeControl setProperty:forKey:](self->_nightModeControl, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CBPresetsParser nightShiftDisabled](v2, "nightShiftDisabled")), CFSTR("CBDisplayPresetDisableNightShift"));
  -[BLControl setPropertyInternalWithKey:property:client:](self, "setPropertyInternalWithKey:property:client:", CFSTR("kCoreBrightnessPresetStateChanged"), 0);
}

- (void)handleExternalDisplayChange
{
  NSMutableArray *displayContainers;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  char v13;
  SEL v14;
  BLControl *v15;

  v15 = self;
  v14 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v13 = 0;
  displayContainers = self->_displayContainers;
  v3 = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __40__BLControl_handleExternalDisplayChange__block_invoke;
  v7 = &unk_1E68EAFC8;
  v8 = &v9;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v3);
  -[BLControl setPropertyInternalWithKey:property:client:](v15, "setPropertyInternalWithKey:property:client:", CFSTR("CBHasExternalDisplay"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10[3] & 1), 0);
  _Block_object_dispose(&v9, 8);
}

void __40__BLControl_handleExternalDisplayChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("CBDisplayIsExternal"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 24) & 1 | objc_msgSend(v3, "BOOLValue") & 1) != 0;

  }
}

uint64_t __50__BLControl_setBLControlPropertyWithKey_property___block_invoke(uint64_t a1, __IOHIDServiceClient *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = IOHIDServiceClientConformsTo(a2, 0xFF00u, 4u);
  if ((_DWORD)result)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      result = objc_msgSend(*(id *)(a1 + 32), "handleHIDEvent:from:", *(_QWORD *)(a1 + 40), a2);
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __50__BLControl_setBLControlPropertyWithKey_property___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF1323D0);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "handleDisplayModeUpdate:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 24) & 1 | result & 1) != 0;
  }
  return result;
}

uint64_t __50__BLControl_setBLControlPropertyWithKey_property___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "setProperty:forKey:", a1[4], a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) & 1 | result & 1) != 0;
  }
  return result;
}

void __56__BLControl_setPropertyInternalWithKey_property_client___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;

  v5 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("DisplayTypeA"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "intValue") == *(_DWORD *)(a1 + 56))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(a2, "setProperty:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1;
    *a4 = 1;
  }

}

_QWORD *__56__BLControl_setPropertyInternalWithKey_property_client___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  char v3;
  _QWORD *result;

  v3 = objc_msgSend(a3, "setProperty:forKey:", a1[4], a1[5]);
  result = a1;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) & 1 | v3 & 1) != 0;
  return result;
}

- (BOOL)handleDisplayModeUpdatePropertyHandler:(id)a3
{
  float v3;
  double v4;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  NSObject *v9;
  float v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint8_t v16[16];
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Value"));
    v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("TransitionLength"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v13, "integerValue");
        objc_msgSend(v12, "floatValue");
        v10 = v3;
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
          __os_log_helper_16_2_3_8_66_4_0_8_0((uint64_t)v17, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v11), v11, COERCE__INT64(v10));
          _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "[Display Mode] Update handler - new mode: %{public}@ (%d), transition length: %f", v17, 0x1Cu);
        }
        if (v11 <= 4)
          __asm { BR              X8 }
        v9 = self->_logHandle;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v16, v11);
          _os_log_fault_impl(&dword_1B5291000, v9, OS_LOG_TYPE_FAULT, "[Display Mode] Failed to handle unexpected display mode = %d", v16, 8u);
        }
        *(float *)&v4 = v10 + 0.02;
        -[BLControl scheduleDisplayModeCompletionTimerIn:forDisplayMode:](self, "scheduleDisplayModeCompletionTimerIn:forDisplayMode:", v11, v4);
      }
    }
  }
  objc_autoreleasePoolPop(context);
  return 0;
}

- (BOOL)setDisplayFactor:(float)a3 transitionLength:(float)a4
{
  double v4;
  double v5;
  void *context;
  char v8;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  *(float *)&v4 = a4;
  -[BLControl setPropertyInternalWithKey:property:client:](self, "setPropertyInternalWithKey:property:client:", CFSTR("DisplayBrightnessFadePeriod"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4));
  *(float *)&v5 = a3;
  v8 = -[BLControl setPropertyInternalWithKey:property:client:](self, "setPropertyInternalWithKey:property:client:", CFSTR("DisplayBrightnessFactorWithFade"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), 0);
  objc_autoreleasePoolPop(context);
  return v8 & 1;
}

- (void)waitForALSArrival
{
  dispatch_time_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *dsema;
  uint8_t v16[15];
  os_log_type_t v17;
  os_log_t oslog;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t (*v22)(_QWORD *);
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  CFTypeRef v26;
  uint8_t v27[7];
  os_log_type_t v28;
  NSObject *v29;
  uint8_t v30[3];
  char v31;
  NSObject *v32;
  uint64_t block;
  int v34;
  int v35;
  void (*v36)(uint64_t);
  void *v37;
  BLControl *v38;
  NSObject *v39;
  uint64_t *v40;
  CFTypeRef v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  int v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  uint64_t v48;
  id v49;
  CFTypeRef v50;
  NSObject *v51;
  SEL v52;
  BLControl *v53;

  v53 = self;
  v52 = a2;
  v51 = dispatch_queue_create("com.apple.CoreBrightness.initQueue", 0);
  if (v51)
  {
    v50 = (CFTypeRef)IOHIDEventSystemClientCreate();
    if (v50)
    {
      v49 = -[BLControl newDevicePariMatchingDictionaryWithPage:andUsage:](v53, "newDevicePariMatchingDictionaryWithPage:andUsage:", 65280, 4);
      if (v49)
      {
        IOHIDEventSystemClientSetMatching();
        CFRelease(v49);
      }
      v42 = 0;
      v43 = &v42;
      v44 = 1375731712;
      v45 = 48;
      v46 = __Block_byref_object_copy__15;
      v47 = __Block_byref_object_dispose__15;
      v48 = 0;
      block = MEMORY[0x1E0C809B0];
      v34 = -1073741824;
      v35 = 0;
      v36 = __30__BLControl_waitForALSArrival__block_invoke;
      v37 = &unk_1E68EB090;
      v41 = v50;
      v38 = v53;
      v40 = &v42;
      v39 = v51;
      dispatch_sync(v51, &block);
      if (v43[5])
      {
        dsema = v43[5];
        v2 = dispatch_time(0, 5000000000);
        if (dispatch_semaphore_wait(dsema, v2))
        {
          v32 = 0;
          if (v53->_logHandle)
          {
            logHandle = v53->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              inited = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              inited = init_default_corebrightness_log();
            logHandle = inited;
          }
          v32 = logHandle;
          v31 = 16;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            log = v32;
            type = v31;
            __os_log_helper_16_0_0(v30);
            _os_log_error_impl(&dword_1B5291000, log, type, "(CBU_ShouldWaitForALS) error: timeout waiting for ALS arrival", v30, 2u);
          }
        }
        else
        {
          v29 = 0;
          if (v53->_logHandle)
          {
            v10 = v53->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v9 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v9 = init_default_corebrightness_log();
            v10 = v9;
          }
          v29 = v10;
          v28 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v7 = v29;
            v8 = v28;
            __os_log_helper_16_0_0(v27);
            _os_log_impl(&dword_1B5291000, v7, v8, "(CBU_ShouldWaitForALS) service arrived in time", v27, 2u);
          }
        }
        v19 = MEMORY[0x1E0C809B0];
        v20 = -1073741824;
        v21 = 0;
        v22 = __30__BLControl_waitForALSArrival__block_invoke_217;
        v23 = &unk_1E68EA6A8;
        v25 = &v42;
        v26 = v50;
        v24 = v51;
        dispatch_sync(v51, &v19);
      }
      else
      {
        oslog = 0;
        if (v53->_logHandle)
        {
          v6 = v53->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v5 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v5 = init_default_corebrightness_log();
          v6 = v5;
        }
        oslog = v6;
        v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v3 = oslog;
          v4 = v17;
          __os_log_helper_16_0_0(v16);
          _os_log_impl(&dword_1B5291000, v3, v4, "(CBU_ShouldWaitForALS) found service right away, skip waiting", v16, 2u);
        }
      }
      CFRelease(v50);
      _Block_object_dispose(&v42, 8);
    }
    CFRelease(v51);
  }
}

void __30__BLControl_waitForALSArrival__block_invoke(uint64_t a1)
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v4;
  uint8_t v6[15];
  os_log_type_t v7;
  NSObject *v8;
  const __CFArray *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = 0;
  v9 = IOHIDEventSystemClientCopyServices(*(IOHIDEventSystemClientRef *)(a1 + 56));
  if (!v9 || !CFArrayGetCount(v9))
  {
    v8 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    v8 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      log = v8;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1B5291000, log, type, "(CBU_ShouldWaitForALS) service not found, wait for ALS arrival", v6, 2u);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = dispatch_semaphore_create(0);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      IOHIDEventSystemClientScheduleWithDispatchQueue();
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
    }
  }
  if (v9)
    CFRelease(v9);
}

intptr_t __30__BLControl_waitForALSArrival__block_invoke_216(intptr_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40));
  return result;
}

uint64_t __30__BLControl_waitForALSArrival__block_invoke_217(_QWORD *a1)
{
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1[5] + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = 0;
  IOHIDEventSystemClientUnregisterDeviceMatchingBlock();
  return MEMORY[0x1B5E4A07C](a1[6], a1[4]);
}

- (void)registerNotificationBlock:(id)a3
{
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BLControl *v9;
  id v10;
  id v11;
  SEL v12;
  BLControl *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __39__BLControl_registerNotificationBlock___block_invoke;
  v8 = &unk_1E68EB0B8;
  v9 = v13;
  v10 = a3;
  dispatch_sync(queue, &block);
}

void __39__BLControl_registerNotificationBlock___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    _Block_release(*(const void **)(*(_QWORD *)(a1 + 32) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
  if (*(_QWORD *)(a1 + 40))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = _Block_copy(*(const void **)(a1 + 40));
}

- (id)copyStatusInfo
{
  NSMutableArray *displayContainers;
  NSMutableDictionary *keyboardContainers;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, uint64_t, void *);
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  SEL v20;
  BLControl *v21;

  v21 = self;
  v20 = a2;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v18)
  {
    displayContainers = v21->_displayContainers;
    v12 = MEMORY[0x1E0C809B0];
    v13 = -1073741824;
    v14 = 0;
    v15 = __27__BLControl_copyStatusInfo__block_invoke;
    v16 = &unk_1E68EB0E0;
    v17 = v18;
    -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v12);
    objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("CBDisplays"));
  }

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v11)
  {
    keyboardContainers = v21->_keyboardContainers;
    v5 = MEMORY[0x1E0C809B0];
    v6 = -1073741824;
    v7 = 0;
    v8 = __27__BLControl_copyStatusInfo__block_invoke_2;
    v9 = &unk_1E68EA568;
    v10 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyboardContainers, "enumerateKeysAndObjectsUsingBlock:", &v5);
    objc_msgSend(v19, "setObject:forKey:", v11, CFSTR("CBKeyboards"));
  }

  return v19;
}

void __27__BLControl_copyStatusInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("StatusInfo"));
  v3 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("CBDisplayID"));
  if (v4 && v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v3);

}

void __27__BLControl_copyStatusInfo__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copyPropertyForKey:", CFSTR("StatusInfo"));
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, a2);

  }
}

- (id)copyDisplayList
{
  NSMutableArray *displayContainers;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  id v11;
  SEL v12;
  BLControl *v13;

  v13 = self;
  v12 = a2;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  displayContainers = v13->_displayContainers;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __28__BLControl_copyDisplayList__block_invoke;
  v8 = &unk_1E68EB0E0;
  v9 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v4);
  objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("CBDisplayDeviceIDs"));

  return v11;
}

void __28__BLControl_copyDisplayList__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("CBDisplayID"));
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)copyDisplayInfo
{
  NSMutableArray *displayContainers;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  SEL v11;
  BLControl *v12;

  v12 = self;
  v11 = a2;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  displayContainers = v12->_displayContainers;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __28__BLControl_copyDisplayInfo__block_invoke;
  v8 = &unk_1E68EB0E0;
  v9 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:", &v4);
  return v10;
}

void __28__BLControl_copyDisplayInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("CBDisplayID"));
  if (v4)
  {
    v3 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("CBContainerInfo"));
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v4);

    }
  }

}

- (BOOL)useSyncBrightnessTransactionForDisplay:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  BOOL v6;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a3, "displayType"))
    v6 = (CBU_IsSyncBrightnessTransactionsSupported() & 1) != 0 || (objc_msgSend(a3, "brightnessAvailable") & 1) != 0;
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
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v9, objc_msgSend(a3, "displayId"), v6);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Display ID: %d, UseSyncBrightnessTransactionForDisplay: %d", v9, 0xEu);
  }
  return v6;
}

- (void)addDisplayContainer:(id)a3
{
  NightModeControl *v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  void *context;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  BLControl *v12;
  id v13;
  SEL v14;
  BLControl *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  -[NSMutableArray addObject:](v15->_displayContainers, "addObject:", v13);
  if (v15->_nightModeControl)
  {
    -[NightModeControl addSupportObject:](v15->_nightModeControl, "addSupportObject:", v13);
  }
  else
  {
    v3 = [NightModeControl alloc];
    queue = v15->_queue;
    v7 = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __33__BLControl_addDisplayContainer___block_invoke;
    v11 = &unk_1E68EA2E0;
    v12 = v15;
    v5 = -[NightModeControl initWithSupportObject:queue:callback:](v3, "initWithSupportObject:queue:callback:", v13, queue, &v7);
    v15->_nightModeControl = (NightModeControl *)v5;
  }
  -[CBPresetsParser setDisplayList:](+[CBPresetsParser sharedInstance](CBPresetsParser, "sharedInstance"), "setDisplayList:", objc_msgSend(-[BLControl copyDisplayList](v15, "copyDisplayList"), "objectForKeyedSubscript:", CFSTR("CBDisplayDeviceIDs")));
  objc_autoreleasePoolPop(context);
}

uint64_t __33__BLControl_addDisplayContainer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

- (void)removeDisplayContainer:(id)a3
{
  void *context;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  -[NSMutableArray removeObject:](self->_displayContainers, "removeObject:", a3);
  if (self->_nightModeControl && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EF131518) & 1) != 0)
    -[NightModeControl removeSupportObject:](self->_nightModeControl, "removeSupportObject:", a3);
  -[CBPresetsParser setDisplayList:](+[CBPresetsParser sharedInstance](CBPresetsParser, "sharedInstance"), "setDisplayList:", objc_msgSend(-[BLControl copyDisplayList](self, "copyDisplayList"), "objectForKeyedSubscript:", CFSTR("CBDisplayDeviceIDs")));
  objc_autoreleasePoolPop(context);
}

- (BOOL)initKeyboardBacklightHIDManager
{
  HIDManager *keyboardBacklightHIDManager;
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, uint64_t, char);
  void *v9;
  _QWORD *v10;
  _QWORD v11[2];
  int v12;
  int v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  BLControl *v16;
  id v17;
  SEL v18;
  BLControl *v19;

  v19 = self;
  v18 = a2;
  self->_keyboardBacklightHIDManager = (HIDManager *)objc_alloc_init(MEMORY[0x1E0D27CB8]);
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context = (void *)MEMORY[0x1B5E4A8B0]();
  objc_msgSend(v17, "addObject:", &unk_1E69176F0);
  objc_msgSend(v17, "addObject:", &unk_1E6917740);
  objc_autoreleasePoolPop(context);
  -[HIDManager setDeviceMatching:](v19->_keyboardBacklightHIDManager, "setDeviceMatching:", v17);

  v11[0] = 0;
  v11[1] = v11;
  v12 = 1375731712;
  v13 = 48;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  v16 = v19;
  keyboardBacklightHIDManager = v19->_keyboardBacklightHIDManager;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __44__BLControl_initKeyboardBacklightHIDManager__block_invoke;
  v9 = &unk_1E68EB108;
  v10 = v11;
  -[HIDManager setDeviceNotificationHandler:](keyboardBacklightHIDManager, "setDeviceNotificationHandler:", &v5);
  -[HIDManager setDispatchQueue:](v19->_keyboardBacklightHIDManager, "setDispatchQueue:", v19->_queue);
  -[HIDManager activate](v19->_keyboardBacklightHIDManager, "activate");
  _Block_object_dispose(v11, 8);
  return 1;
}

uint64_t __44__BLControl_initKeyboardBacklightHIDManager__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "keyboardBacklightHIDDeviceArrived:", a2);
  else
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "keyboardBacklightHIDDeviceRemoved:", a2);
}

- (void)keyboardBacklightHIDDeviceArrived:(id)a3
{
  id v3;
  NSObject *queue;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  BLControl *v11;
  id v12;
  SEL v13;
  BLControl *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v3 = a3;
  queue = v14->_queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke;
  v9 = &unk_1E68EA540;
  v10 = v12;
  v11 = v14;
  dispatch_async(queue, &block);
}

void __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFDictionary *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  mach_port_t mainPort;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t inited;
  NSObject *v19;
  uint8_t v21[15];
  os_log_type_t v22;
  os_log_t v23;
  kern_return_t v24;
  uint8_t v25[15];
  os_log_type_t v26;
  os_log_t v27;
  io_registry_entry_t entry;
  os_log_type_t v29;
  os_log_t oslog;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void *v35;
  CBKeyboardBacklightContainer *v36;
  uint64_t v37;
  int v38;
  int v39;
  void (*v40)(uint64_t, void *, uint64_t, _BYTE *);
  void *v41;
  CBKeyboardBacklightContainer *v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t (*v46)(uint64_t, uint64_t, uint64_t);
  void *v47;
  uint64_t v48;
  CBKeyboardBacklightContainer *v49;
  id v50;
  os_log_type_t v51;
  os_log_t v52;
  os_log_type_t v53;
  os_log_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t v59[16];
  uint8_t v60[32];
  uint8_t v61[24];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v58 = a1;
  v57 = a1;
  v56 = 0;
  v56 = (void *)objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", CFSTR("KeyboardUniqueID"));
  v55 = 0;
  if (v56)
  {
    v55 = v56;
  }
  else
  {
    v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", +[KeyboardBacklight getHashIDForDevice:](KeyboardBacklight, "getHashIDForDevice:", *(_QWORD *)(a1 + 32)));
    v54 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
    {
      v19 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v19 = inited;
    }
    v54 = v19;
    v53 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v55);
      _os_log_debug_impl(&dword_1B5291000, v54, v53, "Keyboard ID Hash = %@", v61, 0xCu);
    }
  }
  v52 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
  {
    v17 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v16 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v16 = init_default_corebrightness_log();
    v17 = v16;
  }
  v52 = v17;
  v51 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v60, (uint64_t)v55, *(_QWORD *)(a1 + 32));
    _os_log_impl(&dword_1B5291000, v52, v51, "Keyboard backlight HID device (ID=%{public}@) arrived = %{public}@", v60, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = 0;
    v50 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "objectForKey:", v55);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "keyboardBacklightHIDDeviceRemovedInternal:", objc_msgSend(v50, "device"));
    v49 = 0;
    v49 = -[CBKeyboardBacklightContainer initWithDevice:]([CBKeyboardBacklightContainer alloc], "initWithDevice:", *(_QWORD *)(a1 + 32));
    -[CBContainer scheduleWithDispatchQueue:](v49, "scheduleWithDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
    v15 = MEMORY[0x1E0C809B0];
    v43 = MEMORY[0x1E0C809B0];
    v44 = -1073741824;
    v45 = 0;
    v46 = __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_258;
    v47 = &unk_1E68E9F38;
    v48 = *(_QWORD *)(a1 + 40);
    -[CBContainer registerNotificationBlock:](v49, "registerNotificationBlock:", &v43);
    v1 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
    v37 = v15;
    v38 = -1073741824;
    v39 = 0;
    v40 = __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_2;
    v41 = &unk_1E68EA068;
    v42 = v49;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:", &v37);
    if (-[CBKeyboardBacklightContainer start](v49, "start"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "setObject:forKey:", v49, v55);
      v2 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
      v31 = MEMORY[0x1E0C809B0];
      v32 = -1073741824;
      v33 = 0;
      v34 = __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_3;
      v35 = &unk_1E68EA068;
      v36 = v49;
      objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v31);
    }

    oslog = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v13 = init_default_corebrightness_log();
      v14 = v13;
    }
    oslog = v14;
    v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v59, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
      _os_log_impl(&dword_1B5291000, oslog, v29, "Keyboard added to dictionary = %{public}@", v59, 0xCu);
    }
    entry = 0;
    mainPort = *MEMORY[0x1E0CBBAA8];
    v3 = IOServiceMatching("IOResources");
    entry = IOServiceGetMatchingService(mainPort, v3);
    if (entry)
    {
      v24 = 0;
      v24 = IORegistryEntrySetCFProperty(entry, CFSTR("KeyboardBacklight"), (CFTypeRef)*MEMORY[0x1E0C9AE50]);
      if (v24)
      {
        v23 = 0;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
        {
          v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
        }
        else
        {
          v6 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v7 = v6;
        }
        v23 = v7;
        v22 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v4 = v23;
          v5 = v22;
          __os_log_helper_16_0_0(v21);
          _os_log_error_impl(&dword_1B5291000, v4, v5, "failed to set KeyboardBacklight property to IOResources", v21, 2u);
        }
      }
      IOObjectRelease(entry);
    }
    else
    {
      v27 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
      {
        v11 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v10 = init_default_corebrightness_log();
        v11 = v10;
      }
      v27 = v11;
      v26 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v8 = v27;
        v9 = v26;
        __os_log_helper_16_0_0(v25);
        _os_log_error_impl(&dword_1B5291000, v8, v9, "failed to get IOResources entry", v25, 2u);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "sendNotificationWithKeyboardIDs", v4);
  }
  if (!v56)

}

uint64_t __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

void __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  id v6;

  if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780) & 1) != 0)
  {
    v6 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("CBDisplayIsBuiltIn"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
    {
      v5 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("DisplayBrightnessFactor"));
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", v5, CFSTR("CBUserActivityUpdate"));
      }

      *a4 = 1;
    }

  }
}

uint64_t __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addHIDServiceClient:", a2);
}

- (void)keyboardBacklightHIDDeviceRemovedInternal:(id)a3
{
  os_log_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t inited;
  NSObject *logHandle;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = objc_msgSend(a3, "propertyForKey:", CFSTR("KeyboardUniqueID"));
  if (v15)
  {
    v14 = (void *)v15;
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", +[KeyboardBacklight getHashIDForDevice:](KeyboardBacklight, "getHashIDForDevice:", a3));
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
      __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v14);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Keyboard ID Hash to remove = %@", v21, 0xCu);
    }
  }
  v13 = 1;
  if (self->_logHandle)
  {
    v9 = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v8 = init_default_corebrightness_log();
    v9 = v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v20, (uint64_t)v14);
    _os_log_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEFAULT, "KeyboardID = %{public}@", v20, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)-[NSMutableDictionary objectForKey:](self->_keyboardContainers, "objectForKey:", v14);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((id)objc_msgSend(v12, "device") == a3)
      {
        objc_msgSend(v12, "stop");
        objc_msgSend(v12, "unregisterNotificationBlock");
        objc_msgSend(v12, "unscheduleWithDispatchQueue:", self->_queue);
      }
      else
      {
        v13 = 0;
        if (self->_logHandle)
        {
          v7 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v6 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v6 = init_default_corebrightness_log();
          v7 = v6;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v19, (uint64_t)a3);
          _os_log_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEFAULT, "Keyboard HID device was not present already = %{public}@", v19, 0xCu);
        }
      }
    }
    if ((v13 & 1) != 0)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_keyboardContainers, "removeObjectForKey:", v14);
      if (self->_logHandle)
      {
        v5 = self->_logHandle;
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
        v3 = v5;
        __os_log_helper_16_2_1_8_66((uint64_t)v18, (uint64_t)a3);
        _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard HID device has been removed = %{public}@", v18, 0xCu);
      }
    }
    -[BLControl sendNotificationWithKeyboardIDs](self, "sendNotificationWithKeyboardIDs", v3);
  }
  if (!v15)

}

- (void)keyboardBacklightHIDDeviceRemoved:(id)a3
{
  id v3;
  NSObject *queue;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  BLControl *v10;
  id v11;
  id v12;
  SEL v13;
  BLControl *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v3 = a3;
  queue = v14->_queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __47__BLControl_keyboardBacklightHIDDeviceRemoved___block_invoke;
  v9 = &unk_1E68EA540;
  v10 = v14;
  v11 = v12;
  dispatch_async(queue, &block);
}

void __47__BLControl_keyboardBacklightHIDDeviceRemoved___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "keyboardBacklightHIDDeviceRemovedInternal:", *(_QWORD *)(a1 + 40));

}

- (void)sendNotificationWithKeyboardIDs
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:keyboardID:", CFSTR("KeyboardBacklightIDs"), 1);
  -[BLControl sendNotificationFor:withValue:](self, "sendNotificationFor:withValue:", v2, -[NSMutableDictionary allKeys](self->_keyboardContainers, "allKeys"));

}

- (void)handleUserIsActiveStateChange:(BOOL)a3
{
  -[CBAnalyticsManager setUserActive:](+[CBAnalyticsManager sharedInstance](CBAnalyticsManager, "sharedInstance"), "setUserActive:", a3);
}

- (void)releaseDisplayModeCompletionTimer
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  SEL v9;
  BLControl *v10;

  v10 = self;
  v9 = a2;
  if (self->_displayModeCompletionTimer)
  {
    v8 = 0;
    if (v10->_logHandle)
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
    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v8;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1B5291000, log, type, "[Display Mode] Release scheduled display mode completion timer", v6, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)v10->_displayModeCompletionTimer);
    dispatch_release((dispatch_object_t)v10->_displayModeCompletionTimer);
    v10->_displayModeCompletionTimer = 0;
  }
}

- (void)scheduleDisplayModeCompletionTimerIn:(float)a3 forDisplayMode:(int64_t)a4
{
  dispatch_time_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *source;
  uint64_t inited;
  NSObject *v11;
  uint8_t v12[15];
  os_log_type_t v13;
  os_log_t oslog;
  uint64_t block;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  dispatch_queue_t *v20;
  int64_t v21;
  float v22;
  dispatch_block_t v23;
  int64_t v24;
  os_log_type_t v25;
  os_log_t v26;
  int64_t v27;
  float v28;
  SEL v29;
  dispatch_queue_t *v30;
  uint8_t v31[40];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = (dispatch_queue_t *)self;
  v29 = a2;
  v28 = a3;
  v27 = a4;
  if (self->_displayModeCompletionTimer)
    -[dispatch_queue_t releaseDisplayModeCompletionTimer](v30, "releaseDisplayModeCompletionTimer");
  v26 = 0;
  if (v30[14])
  {
    v11 = v30[14];
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v11 = inited;
  }
  v26 = v11;
  v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_0_8_66_4_0((uint64_t)v31, COERCE__INT64(v28), (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v27), v27);
    _os_log_impl(&dword_1B5291000, v26, v25, "[Display Mode] Schedule display mode completion timer in %f sec for %{public}@ (%d) mode", v31, 0x1Cu);
  }
  v24 = (unint64_t)(float)(v28 * 1000000000.0);
  v30[21] = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v30[3]);
  if (v30[21])
  {
    v23 = 0;
    block = MEMORY[0x1E0C809B0];
    v16 = -1073741824;
    v17 = 0;
    v18 = __65__BLControl_scheduleDisplayModeCompletionTimerIn_forDisplayMode___block_invoke;
    v19 = &unk_1E68EAAA8;
    v20 = v30;
    v21 = v27;
    v22 = v28;
    v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
    if (v23)
    {
      dispatch_source_set_event_handler(v30[21], v23);
      _Block_release(v23);
      source = v30[21];
      v4 = dispatch_time(0, v24);
      dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_activate(v30[21]);
    }
    else
    {
      oslog = 0;
      if (v30[14])
      {
        v8 = v30[14];
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
      v13 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v5 = oslog;
        v6 = v13;
        __os_log_helper_16_0_0(v12);
        _os_log_error_impl(&dword_1B5291000, v5, v6, "[Display Mode] Failed to create display mode completion timer", v12, 2u);
      }
    }
  }
}

void __65__BLControl_scheduleDisplayModeCompletionTimerIn_forDisplayMode___block_invoke(uint64_t a1)
{
  NSObject *v1;
  os_signpost_type_t v2;
  os_signpost_id_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_type_t v7;
  os_signpost_id_t spid;
  uint64_t v9;
  NSObject *v10;
  uint64_t inited;
  NSObject *v12;
  uint8_t v14[16];
  unint64_t v15;
  char v16;
  NSObject *v17;
  id v18;
  uint8_t v19[8];
  unint64_t v20;
  char v21;
  NSObject *v22;
  os_log_type_t v23;
  os_log_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[40];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = a1;
  v25 = a1;
  v24 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v12 = inited;
  }
  v24 = v12;
  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_66_4_0_8_0((uint64_t)v27, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 40), COERCE__INT64(*(float *)(a1 + 48)));
    _os_log_impl(&dword_1B5291000, v24, v23, "[Display Mode] didCompleteTransitionToDisplayMode %{public}@ (%d in %f seconds)", v27, 0x1Cu);
  }
  v22 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v9 = init_default_corebrightness_log();
    v10 = v9;
  }
  v22 = v10;
  v21 = 1;
  v20 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v10))
  {
    v6 = v22;
    v7 = v21;
    spid = v20;
    __os_log_helper_16_0_0(v19);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v6, v7, spid, "DisplayModeSendNotification", (const char *)&unk_1B546AB41, v19, 2u);
  }
  v18 = 0;
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sendSyncNotificationFor:withValue:", CFSTR("DisplayModeChangeComplete"), v18);
  v17 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v4 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v4 = init_default_corebrightness_log();
    v5 = v4;
  }
  v17 = v5;
  v16 = 2;
  v15 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v5))
  {
    v1 = v17;
    v2 = v16;
    v3 = v15;
    __os_log_helper_16_0_0(v14);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v1, v2, v3, "DisplayModeSendNotification", (const char *)&unk_1B546AB41, v14, 2u);
  }

}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[15];
  os_log_type_t v8;
  NSObject *v9;
  id v10;
  SEL v11;
  BLControl *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
  if (self->_logHandle)
  {
    logHandle = v12->_logHandle;
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
    _os_log_impl(&dword_1B5291000, log, type, "System WILL wake from sleep", v7, 2u);
  }
  -[BLControl setPropertyInternalWithKey:property:client:](v12, "setPropertyInternalWithKey:property:client:", CFSTR("CBSystemWillWakeFromSleep"), v10, 0);
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[15];
  os_log_type_t v8;
  NSObject *v9;
  id v10;
  SEL v11;
  BLControl *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
  if (self->_logHandle)
  {
    logHandle = v12->_logHandle;
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
    _os_log_impl(&dword_1B5291000, log, type, "System DID wake from sleep", v7, 2u);
  }
  -[BLControl setPropertyInternalWithKey:property:client:](v12, "setPropertyInternalWithKey:property:client:", CFSTR("CBSystemDidWakeFromSleep"), v10, 0);
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[7];
  os_log_type_t v9;
  NSObject *v10;
  void (**v11)(void);
  id v12;
  SEL v13;
  BLControl *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = (void (**)(void))a4;
  v10 = 0;
  if (self->_logHandle)
  {
    logHandle = v14->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v10 = logHandle;
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1B5291000, log, type, "System is preparing for sleep", v8, 2u);
  }
  -[BLControl setPropertyInternalWithKey:property:client:](v14, "setPropertyInternalWithKey:property:client:", CFSTR("CBSystemPrepareForSleep"), v12, 0);
  v11[2]();
}

@end
