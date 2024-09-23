@implementation CBDisplayContaineriOS

void __57__CBDisplayContaineriOS_sendNotificationForKey_andValue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  v12 = a1;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __57__CBDisplayContaineriOS_sendNotificationForKey_andValue___block_invoke_2;
  v8 = &unk_1E68EA150;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  dispatch_sync(v2, &block);

}

uint64_t __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "handleHIDEvent:from:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __68__CBDisplayContaineriOS_handleNotificationForKey_withProperty_from___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "isEqual:", a1[4]);
    if ((result & 1) == 0)
      return objc_msgSend(a2, "handleNotificationForKey:withProperty:", a1[5], a1[6]);
  }
  return result;
}

uint64_t __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v12 = a1;
  v11 = a1;
  v2 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke_2;
  v8 = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
  v9 = a1[5];
  v10 = a1[6];
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v4);
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSObject *queue;
  uint64_t block;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  CBDisplayContaineriOS *v11;
  __IOHIDEvent *v12;
  __IOHIDServiceClient *v13;
  __IOHIDServiceClient *v14;
  __IOHIDEvent *v15;
  SEL v16;
  CBDisplayContaineriOS *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke;
  v10 = &unk_1E68E9FA0;
  v11 = v17;
  v12 = a3;
  v13 = a4;
  dispatch_sync(queue, &block);
  return 1;
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  NSObject *v4;
  uint64_t v5;
  uint8_t v8[24];
  uint64_t v9;

  v5 = result;
  v9 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    objc_msgSend(*(id *)(v5 + 32), "handleNotificationForKey:withProperty:from:", a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 40));
    return objc_msgSend(*(id *)(v5 + 32), "sendNotificationForKey:andValue:", a2, a3);
  }
  return result;
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  NSObject *v4;
  uint64_t v5;
  uint8_t v8[24];
  uint64_t v9;

  v5 = result;
  v9 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    objc_msgSend(*(id *)(v5 + 32), "handleNotificationForKey:withProperty:from:", a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 40));
    return objc_msgSend(*(id *)(v5 + 32), "sendNotificationForKey:andValue:", a2, a3);
  }
  return result;
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  id v4;
  id v5;
  NSObject *notificationQueue;
  uint64_t block;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  CBDisplayContaineriOS *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SEL v17;
  CBDisplayContaineriOS *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  if (self->super._notificationQueue)
  {
    v4 = v16;
    v5 = v15;
    notificationQueue = v18->super._notificationQueue;
    block = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __57__CBDisplayContaineriOS_sendNotificationForKey_andValue___block_invoke;
    v11 = &unk_1E68EA150;
    v12 = v18;
    v13 = v16;
    v14 = v15;
    dispatch_async(notificationQueue, &block);
  }
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4 from:(id)a5
{
  NSMutableArray *modules;
  NSObject *log;
  os_log_type_t v7;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[15];
  os_log_type_t type;
  os_log_t oslog;
  char v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t (*v17)(_QWORD *, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;
  CBDisplayContaineriOS *v26;

  v26 = self;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  v22 = a5;
  if ((-[CBCAManager isEqual:](self->_displayCAManager, "isEqual:", a5) & 1) == 0)
    -[CBCAManager handleNotificationForKey:withProperty:](v26->_displayCAManager, "handleNotificationForKey:withProperty:", v24, v23);
  modules = v26->_modules;
  v14 = MEMORY[0x1E0C809B0];
  v15 = -1073741824;
  v16 = 0;
  v17 = __68__CBDisplayContaineriOS_handleNotificationForKey_withProperty_from___block_invoke;
  v18 = &unk_1E68EA290;
  v19 = v22;
  v20 = v24;
  v21 = v23;
  -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:", &v14);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CBContainerProtocol handleNotificationForKey:withProperty:](v26->_harmonyContainer, "handleNotificationForKey:withProperty:", v24, v23);
  if (v26->_builtIn)
  {
    v13 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v24, "isEqualToString:", CFSTR("ALSServiceReady")) & 1) != 0
      && !v26->_alsServiceReady)
    {
      v26->_alsServiceReady = 1;
      v13 = 1;
    }
    if ((v13 & 1) != 0 && -[CBDisplayContaineriOS isReady](v26, "isReady"))
    {
      oslog = 0;
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
      oslog = logHandle;
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        log = oslog;
        v7 = type;
        __os_log_helper_16_0_0(v10);
        _os_log_debug_impl(&dword_1B5291000, log, v7, "internal display ready", v10, 2u);
      }
      -[CBDisplayContaineriOS sendNotificationForKey:andValue:](v26, "sendNotificationForKey:andValue:", CFSTR("CBInternalDisplayReady"), MEMORY[0x1E0C9AAB0], log);
    }
  }
}

uint64_t __44__CBDisplayContaineriOS_setProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setPropertyNoQueue:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result & 1;
  return result;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  NSObject *queue;
  char v6;
  uint64_t block;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  CBDisplayContaineriOS *v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  char v20;
  id v21;
  id v22;
  SEL v23;
  CBDisplayContaineriOS *v24;

  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __44__CBDisplayContaineriOS_setProperty_forKey___block_invoke;
  v11 = &unk_1E68EAFA0;
  v15 = &v16;
  v12 = v24;
  v13 = a3;
  v14 = a4;
  dispatch_sync(queue, &block);
  v6 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v6 & 1;
}

- (BOOL)setPropertyNoQueue:(id)a3 forKey:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  uint64_t inited;
  NSObject *logHandle;
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  uint8_t v20[16];
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a4, "getKeyDisplayID") == self->_displayID)
    {
      v9 = (void *)objc_msgSend(a4, "getKeyString");
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
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)a4, (uint64_t)v9);
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ string=%@", v21, 0x16u);
      }
      if (v9)
      {
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("DisplayBrightnessAuto")) & 1) != 0
          || (objc_msgSend(v9, "isEqualToString:", CFSTR("BrightnessWeakCap")) & 1) != 0
          || (objc_msgSend(v9, "isEqualToString:", CFSTR("DisplayBrightness2")) & 1) != 0)
        {
          v11 = (-[CBContainerModuleProtocol setProperty:forKey:](self->_displayControlModule, "setProperty:forKey:", a3, v9) & 1) != 0;
          return (v11 | -[CBContainerModuleProtocol setProperty:forKey:](self->_autoBrightnessModule, "setProperty:forKey:", a3, v9) & 1) != 0;
        }
        else
        {
          v12 = (-[CBContainerModuleProtocol setProperty:forKey:](self->_autoBrightnessModule, "setProperty:forKey:", a3, v9) & 1) != 0;
          return (v12 | -[CBContainerModuleProtocol setProperty:forKey:](self->_displayControlModule, "setProperty:forKey:", a3, v9) & 1) != 0;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(a4, "isEqualToString:", CFSTR("kCoreBrightnessPresetStateChanged")) & 1) != 0)
      {
        -[CBDisplayContaineriOS handlePresetChange:](self, "handlePresetChange:", +[CBPresetsParser sharedInstance](CBPresetsParser, "sharedInstance"));
      }
      else if (self->_builtIn || -[NSArray containsObject:](self->_allowlist, "containsObject:", a4))
      {
        if (a3 && !self->_displayControlModule)
        {
          -[NSMutableArray addObject:](self->_missedProperties, "addObject:", a3);
          -[NSMutableArray addObject:](self->_missedKeys, "addObject:", a4);
          if (self->super._logHandle)
          {
            v6 = self->super._logHandle;
          }
          else
          {
            v5 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v6 = v5;
          }
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)a4);
            _os_log_error_impl(&dword_1B5291000, v6, OS_LOG_TYPE_ERROR, "Modules not ready: Caching %@ property", v20, 0xCu);
          }
        }
        if ((objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightnessAuto")) & 1) != 0
          || (objc_msgSend(a4, "isEqualToString:", CFSTR("BrightnessWeakCap")) & 1) != 0
          || (objc_msgSend(a4, "isEqualToString:", CFSTR("DisplayBrightness2")) & 1) != 0)
        {
          v13 = (-[CBContainerModuleProtocol setProperty:forKey:](self->_displayControlModule, "setProperty:forKey:", a3, a4) & 1) != 0;
          v10 = (v13 | -[CBContainerModuleProtocol setProperty:forKey:](self->_autoBrightnessModule, "setProperty:forKey:", a3, a4) & 1) != 0;
        }
        else
        {
          v14 = (-[CBContainerModuleProtocol setProperty:forKey:](self->_autoBrightnessModule, "setProperty:forKey:", a3, a4) & 1) != 0;
          v10 = (v14 | -[CBContainerModuleProtocol setProperty:forKey:](self->_displayControlModule, "setProperty:forKey:", a3, a4) & 1) != 0;
        }
      }
      v15 = (v10 | -[CBContainerProtocol setProperty:forKey:](self->_harmonyContainer, "setProperty:forKey:", a3, a4) & 1) != 0;
      v16 = (v15 | -[CBContainerModuleProtocol setProperty:forKey:](self->_AODModule, "setProperty:forKey:", a3, a4) & 1) != 0;
      return (v16 | -[CBContainerModuleProtocol setProperty:forKey:](self->_SliderCommitTelemetryModule, "setProperty:forKey:", a3, a4) & 1) != 0;
    }
  }
  return v10;
}

void __57__CBDisplayContaineriOS_sendNotificationForKey_andValue___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 141) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", CFSTR("DisplayBrightnessAuto2")) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", CFSTR("DisplayBrightnessAuto2Available")) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", CFSTR("DisplayBrightness2")) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", CFSTR("CEOverride")) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", CFSTR("CEOutput")) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", CFSTR("RLuxOverride")) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", CFSTR("RLuxOutput")) & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
    }
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithPropertyKey:andDisplay:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
    if (v2)
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();

    }
  }
}

- (id)copyPropertyForKey:(id)a3
{
  NSObject *queue;
  NSObject *v4;
  void *v6;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CBDisplayContaineriOS *v14;
  id v15;
  uint64_t *v16;
  uint64_t block;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  CBDisplayContaineriOS *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  id v32;
  SEL v33;
  CBDisplayContaineriOS *v34;
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v34 = self;
  v33 = a2;
  v32 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 1375731712;
  v28 = 48;
  v29 = __Block_byref_object_copy__16;
  v30 = __Block_byref_object_dispose__16;
  v31 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    queue = v34->super._queue;
    block = MEMORY[0x1E0C809B0];
    v18 = -1073741824;
    v19 = 0;
    v20 = __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke;
    v21 = &unk_1E68EA1A0;
    v22 = v32;
    v23 = v34;
    v24 = &v25;
    dispatch_sync(queue, &block);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v34->_builtIn || -[NSArray containsObject:](v34->_allowlist, "containsObject:", v32)))
    {
      v4 = v34->super._queue;
      v9 = MEMORY[0x1E0C809B0];
      v10 = -1073741824;
      v11 = 0;
      v12 = __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_3;
      v13 = &unk_1E68EB3A0;
      v16 = &v25;
      v14 = v34;
      v15 = v32;
      dispatch_sync(v4, &v9);
    }
  }
  if (v34->super._logHandle)
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v35, (uint64_t)v32, v26[5]);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ result=%@", v35, 0x16u);
  }
  v6 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v6;
}

uint64_t __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "copyPropertyForKey:", *(_QWORD *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *a4 = 1;
  }
  return result;
}

uint64_t __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  void *v2;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *, uint64_t, _BYTE *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = a1;
  v11 = a1;
  result = objc_msgSend(*(id *)(a1 + 32), "copyPropertyInternalForKey:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  if (!result)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_4;
    v8 = &unk_1E68EA910;
    v10 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 40);
    return objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v4);
  }
  return result;
}

- (id)copyPropertyInternalForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v7 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBDisplayID")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", self->_displayID);
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBDisplayIsBuiltIn")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_builtIn);
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBDisplayIsExternal")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_isExternal);
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("BrightnessControlCapabilities")) & 1) != 0)
    return (id)objc_msgSend((id)-[CBBrightnessProxy getBrightnessCapabilities](self->_brtCtl, "getBrightnessCapabilities"), "copy");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBContainerInfo")) & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_builtIn);
    if (v4)
      objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("CBDisplayIsBuiltIn"));

    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", self->_displayID);
    if (v5)
      objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("CBDisplayID"));

    v6 = (id)-[NSString copy](-[NSUUID UUIDString](self->_displayContainerUUID, "UUIDString"), "copy");
    if (v6)
      objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("CBDisplayContainerID"));

  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("StatusInfo")) & 1) != 0)
  {
    return -[CBDisplayContaineriOS copyStatusInfo](self, "copyStatusInfo");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBInternalDisplayReady")) & 1) != 0)
  {
    if (self->_builtIn)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[CBDisplayContaineriOS isReady](self, "isReady"));
  }
  else
  {
    return (id)-[CBContainerProtocol copyPropertyForKey:](self->_harmonyContainer, "copyPropertyForKey:", a3);
  }
  return v7;
}

- (CBDisplayContaineriOS)initWithBacklightService:(unsigned int)a3
{
  os_log_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t type;
  uint64_t v22;
  NSObject *v23;
  NSObject *log;
  os_log_type_t v25;
  NSObject *inited;
  uint8_t v27[15];
  char v28;
  NSObject *v29;
  os_log_type_t v30;
  os_log_t v31;
  id v32;
  uint8_t v33[7];
  char v34;
  NSObject *v35;
  uint8_t v36[7];
  char v37;
  NSObject *v38;
  objc_super v39;
  uint8_t v40[7];
  char v41;
  NSObject *v42;
  unsigned int v43;
  SEL v44;
  id v45;
  uint8_t v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v45 = self;
  v44 = a2;
  v43 = a3;
  if (!a3)
  {
    v42 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v42 = inited;
    v41 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v42;
      v25 = v41;
      __os_log_helper_16_0_0(v40);
      _os_log_error_impl(&dword_1B5291000, log, v25, "invalid backlight service", v40, 2u);
    }
LABEL_52:

    v45 = 0;
    return 0;
  }
  v39.receiver = v45;
  v39.super_class = (Class)CBDisplayContaineriOS;
  v45 = -[CBDisplayContaineriOS init](&v39, sel_init);
  if (v45)
  {
    *((_DWORD *)v45 + 34) = v43;
    IOObjectRetain(*((_DWORD *)v45 + 34));
    v3 = os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "default");
    *((_QWORD *)v45 + 1) = v3;
    if (IORegistryEntryGetRegistryEntryID(*((_DWORD *)v45 + 34), (uint64_t *)v45 + 19))
    {
      v38 = 0;
      if (*((_QWORD *)v45 + 1))
      {
        v23 = *((_QWORD *)v45 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v22 = init_default_corebrightness_log();
        v23 = v22;
      }
      v38 = v23;
      v37 = 16;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v20 = v38;
        type = v37;
        __os_log_helper_16_0_0(v36);
        _os_log_error_impl(&dword_1B5291000, v20, type, "unable to retrieve the registryID", v36, 2u);
      }
      goto LABEL_52;
    }
    *((_QWORD *)v45 + 18) = *((_QWORD *)v45 + 19);
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v5 = dispatch_queue_create("com.apple.CoreBrightness.CBDisplayContaineriOS", v4);
    *((_QWORD *)v45 + 2) = v5;
    if (!*((_QWORD *)v45 + 2))
    {
      v35 = 0;
      if (*((_QWORD *)v45 + 1))
      {
        v19 = *((_QWORD *)v45 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v18 = init_default_corebrightness_log();
        v19 = v18;
      }
      v35 = v19;
      v34 = 16;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v16 = v35;
        v17 = v34;
        __os_log_helper_16_0_0(v33);
        _os_log_error_impl(&dword_1B5291000, v16, v17, "error: failed to create internal dispatch queue", v33, 2u);
      }
      goto LABEL_52;
    }
    if (IOObjectConformsTo(*((_DWORD *)v45 + 34), "AppleARMBacklight"))
      *((_BYTE *)v45 + 141) = 1;
    else
      *((_BYTE *)v45 + 142) = 1;
    v32 = 0;
    v32 = (id)IORegistryEntrySearchCFProperty(*((_DWORD *)v45 + 34), "IOService", CFSTR("kUSBContainerID"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v32);
      *((_QWORD *)v45 + 8) = v6;
      v31 = 0;
      if (*((_QWORD *)v45 + 1))
      {
        v15 = *((_QWORD *)v45 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v14 = init_default_corebrightness_log();
        v15 = v14;
      }
      v31 = v15;
      v30 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v47, *((_QWORD *)v45 + 8));
        _os_log_impl(&dword_1B5291000, v31, v30, "usb container ID = %{public}@", v47, 0xCu);
      }
    }
    else
    {
      v29 = 0;
      if (*((_QWORD *)v45 + 1))
      {
        v13 = *((_QWORD *)v45 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v12 = init_default_corebrightness_log();
        v13 = v12;
      }
      v29 = v13;
      v28 = 1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v10 = v29;
        v11 = v28;
        __os_log_helper_16_0_0(v27);
        _os_log_impl(&dword_1B5291000, v10, v11, "no usb container ID", v27, 2u);
      }
    }

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v45 + 5) = v7;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v45 + 6) = v8;
    *((_QWORD *)v45 + 26) = 0;
    *((_QWORD *)v45 + 22) = 0;
  }
  return (CBDisplayContaineriOS *)v45;
}

- (CBDisplayContaineriOS)initWithCADisplay:(id)a3
{
  CADisplay *v3;
  NSObject *v4;
  CBCAManager *v5;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  CBDisplayContaineriOS *v19;
  _QWORD *v20;
  _QWORD v21[2];
  int v22;
  int v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  CBCAManager *displayCAManager;
  uint8_t v27[7];
  char v28;
  NSObject *v29;
  objc_super v30;
  uint8_t v31[7];
  char v32;
  NSObject *v33;
  CADisplay *v34;
  SEL v35;
  CBDisplayContaineriOS *v36;

  v36 = self;
  v35 = a2;
  v34 = (CADisplay *)a3;
  if (!a3)
  {
    v33 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v33 = inited;
    v32 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v33;
      type = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_error_impl(&dword_1B5291000, log, type, "invalid display", v31, 2u);
    }
LABEL_21:

    v36 = 0;
    return 0;
  }
  v30.receiver = v36;
  v30.super_class = (Class)CBDisplayContaineriOS;
  v36 = -[CBDisplayContaineriOS init](&v30, sel_init);
  if (v36)
  {
    v36->super._logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "default");
    v36->_display = v34;
    v3 = v36->_display;
    v36->_displayID = -[CADisplay displayId](v36->_display, "displayId");
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v36->super._queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreBrightness.CBDisplayContaineriOS", v4);
    if (!v36->super._queue)
    {
      v29 = 0;
      if (v36->super._logHandle)
      {
        logHandle = v36->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v9 = init_default_corebrightness_log();
        logHandle = v9;
      }
      v29 = logHandle;
      v28 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        v7 = v29;
        v8 = v28;
        __os_log_helper_16_0_0(v27);
        _os_log_error_impl(&dword_1B5291000, v7, v8, "error: failed to create internal dispatch queue", v27, 2u);
      }
      goto LABEL_21;
    }
    v36->_relevantServices = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36->_modules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36->_displayService = 0;
    v36->_isExternal = -[CADisplay displayType](v34, "displayType") == 1;
    v36->_displayCAManager = -[CBCAManager initWithCADisplay:andQueue:]([CBCAManager alloc], "initWithCADisplay:andQueue:", v34, v36->super._queue);
    v21[0] = 0;
    v21[1] = v21;
    v22 = 1375731712;
    v23 = 48;
    v24 = __Block_byref_object_copy__16;
    v25 = __Block_byref_object_dispose__16;
    displayCAManager = 0;
    displayCAManager = v36->_displayCAManager;
    v5 = v36->_displayCAManager;
    v14 = MEMORY[0x1E0C809B0];
    v15 = -1073741824;
    v16 = 0;
    v17 = __43__CBDisplayContaineriOS_initWithCADisplay___block_invoke;
    v18 = &unk_1E68EB368;
    v19 = v36;
    v20 = v21;
    -[CBModule registerNotificationBlock:](v5, "registerNotificationBlock:", &v14);
    v36->_brtCtl = 0;
    _Block_object_dispose(v21, 8);
  }
  return v36;
}

uint64_t __43__CBDisplayContaineriOS_initWithCADisplay___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  NSObject *v4;
  uint64_t v5;
  uint8_t v8[24];
  uint64_t v9;

  v5 = result;
  v9 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    objc_msgSend(*(id *)(v5 + 32), "handleNotificationForKey:withProperty:from:", a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 40));
    return objc_msgSend(*(id *)(v5 + 32), "sendNotificationForKey:andValue:", a2, a3);
  }
  return result;
}

- (CBDisplayContaineriOS)initWithCBBrtControl:(id)a3
{
  CBBrightnessProxy *v3;
  unsigned int v4;
  os_log_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  BOOL v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v14;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v19;
  id v20;
  const char *v21;
  uint8_t v22[15];
  char v23;
  NSObject *v24;
  id v25;
  objc_super v26;
  CBBrightnessProxy *v27;
  SEL v28;
  CBDisplayContaineriOS *v29;

  v29 = self;
  v28 = a2;
  v27 = (CBBrightnessProxy *)a3;
  v26.receiver = self;
  v26.super_class = (Class)CBDisplayContaineriOS;
  v29 = -[CBDisplayContaineriOS init](&v26, sel_init);
  if (!v29)
    return v29;
  v29->_brtCtl = v27;
  v3 = v29->_brtCtl;
  v29->_display = 0;
  v4 = -[CBBrightnessProxy getDisplayId](v29->_brtCtl, "getDisplayId");
  v29->_displayID = v4;
  v25 = 0;
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19 = objc_msgSend(-[CBDisplayContaineriOS className](v29, "className"), "cStringUsingEncoding:");
  v25 = (id)objc_msgSend(v20, "initWithFormat:", CFSTR("%s.%s.%u"), "com.apple.CoreBrightness", v19, -[CBBrightnessProxy getDisplayId](v29->_brtCtl, "getDisplayId"));
  v5 = os_log_create((const char *)objc_msgSend(v25, "cStringUsingEncoding:", 1), "default");
  v29->super._logHandle = (OS_os_log *)v5;
  v21 = (const char *)objc_msgSend(v25, "cStringUsingEncoding:", 1);
  v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v7 = dispatch_queue_create(v21, v6);
  v29->super._queue = (OS_dispatch_queue *)v7;
  if (v29->super._queue)
  {

    -[CBBrightnessProxy setNotificationQueue:](v29->_brtCtl, "setNotificationQueue:", v29->super._queue);
    v14 = -[CBBrightnessProxy getDisplayType](v29->_brtCtl, "getDisplayType");
    v8 = v14 == -[CBBrightnessProxy CBDispTypeExternal](v29->_brtCtl, "CBDispTypeExternal");
    v29->_isExternal = v8;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29->_relevantServices = v9;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29->_modules = v10;
    v29->_displayService = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29->_missedProperties = v11;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29->_missedKeys = v12;
    return v29;
  }
  v24 = 0;
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
  v24 = logHandle;
  v23 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    log = v24;
    type = v23;
    __os_log_helper_16_0_0(v22);
    _os_log_error_impl(&dword_1B5291000, log, type, "error: failed to create internal dispatch queue", v22, 2u);
  }

  v29 = 0;
  return 0;
}

- (BOOL)findBacklight
{
  CFAllocatorRef *v3;
  CFDictionaryKeyCallBacks *keyCallBacks;
  CFDictionaryValueCallBacks *valueCallBacks;
  io_object_t object;
  io_iterator_t existing;
  CFDictionaryRef matching;
  CFDictionaryRef v9;
  char v10;
  SEL v11;
  CBDisplayContaineriOS *v12;
  void *v13;
  void *v14;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v12 = self;
  v11 = a2;
  v10 = 0;
  keys[0] = CFSTR("backlight-control");
  values = 0;
  values = (void *)*MEMORY[0x1E0C9AE50];
  v9 = 0;
  v3 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  keyCallBacks = (CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  valueCallBacks = (CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v14 = CFSTR("IOPropertyMatch");
  v13 = v9;
  matching = 0;
  matching = CFDictionaryCreate(*v3, (const void **)&v14, (const void **)&v13, 1, keyCallBacks, valueCallBacks);
  CFRelease(v9);
  existing = 0;
  if (!IOServiceGetMatchingServices(*MEMORY[0x1E0CBBAA8], matching, &existing) && existing)
  {
    while (1)
    {
      object = IOIteratorNext(existing);
      if (!object)
        break;
      if (v12->_brtCtl && IOObjectConformsTo(object, "AppleARMBacklight"))
      {
        v12->_builtIn = 1;
        v12->_armBacklightDisplayService = object;
        v12->_displayService = object;
        IOObjectRetain(v12->_displayService);
        IOObjectRetain(v12->_armBacklightDisplayService);
      }
      else
      {
        -[CBDisplayContaineriOS handleDisplayArrival:](v12, "handleDisplayArrival:", object);
      }
      v10 = 1;
    }
    IOObjectRelease(existing);
  }
  return v10 & 1;
}

- (BOOL)initialiseHIDDisplay
{
  uint64_t inited;
  NSObject *logHandle;
  io_object_t v5;
  void *v6;
  void *v7;
  CFMutableDictionaryRef v8;
  char v9;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  self->_displayArrivalNotificationPort = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  if (self->_displayArrivalNotificationPort)
  {
    IONotificationPortSetDispatchQueue(self->_displayArrivalNotificationPort, (dispatch_queue_t)self->super._queue);
    v8 = IOServiceMatching("IOHIDDevice");
    if (v8)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", 128);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", 1);
      if (v7 && v6)
      {
        -[__CFDictionary setObject:forKey:](v8, "setObject:forKey:", v7, CFSTR("DeviceUsagePage"));
        -[__CFDictionary setObject:forKey:](v8, "setObject:forKey:", v6, CFSTR("DeviceUsage"));
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v11, (uint64_t)v8);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "matching: %{public}@", v11, 0xCu);
      }
      IOServiceAddMatchingNotification(self->_displayArrivalNotificationPort, "IOServiceFirstMatch", v8, (IOServiceMatchingCallback)displayArrivalCallback, self, &self->_displayArrivalIterator);
      if (self->_displayArrivalIterator)
      {
        while (1)
        {
          v5 = IOIteratorNext(self->_displayArrivalIterator);
          if (!v5)
            break;
          v9 = -[CBDisplayContaineriOS handleDisplayArrival:](self, "handleDisplayArrival:", v5);
        }
      }
    }
  }
  return v9 & 1;
}

- (BOOL)handleDisplayArrival:(unsigned int)a3
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t v16[15];
  char v17;
  NSObject *v18;
  os_log_type_t v19;
  os_log_t v20;
  os_log_type_t v21;
  os_log_t v22;
  os_log_type_t v23;
  os_log_t v24;
  os_log_type_t v25;
  os_log_t v26;
  __CFString *v27;
  id v28;
  char v29;
  unsigned int v30;
  SEL v31;
  CBDisplayContaineriOS *v32;
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t v36[40];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = self;
  v31 = a2;
  v30 = a3;
  v29 = 1;
  self->_displayService = a3;
  IOObjectRetain(v32->_displayService);
  v28 = 0;
  if (IORegistryEntryGetRegistryEntryID(v30, &v32->_registryID))
  {
    v22 = 0;
    if (v32->super._logHandle)
    {
      logHandle = v32->super._logHandle;
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
    v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v34, v30);
      _os_log_error_impl(&dword_1B5291000, v22, v21, "failed to retrieve registry ID for display service %u", v34, 8u);
    }
    v29 = 0;
  }
  else
  {
    v27 = (__CFString *)IOObjectCopyClass(v30);
    if (v27)
    {
      v26 = 0;
      if (v32->super._logHandle)
      {
        v15 = v32->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v14 = init_default_corebrightness_log();
        v15 = v14;
      }
      v26 = v15;
      v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_4_0_8_0_8_66((uint64_t)v36, v30, v32->_registryID, (uint64_t)v27);
        _os_log_impl(&dword_1B5291000, v26, v25, "display service %u | registry ID 0x%llX | class %{public}@", v36, 0x1Cu);
      }

      if (v32->_brtCtl && v32->_displayService && IOObjectConformsTo(v32->_displayService, "AppleARMBacklight"))
      {
        v29 = 0;
      }
      else
      {
        if (v32->_displayService && IOObjectConformsTo(v32->_displayService, "AppleARMBacklight"))
          v32->_builtIn = 1;
        v28 = (id)IORegistryEntrySearchCFProperty(v32->_displayService, "IOService", CFSTR("kUSBContainerID"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32->_displayContainerUUID = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v28);
          v20 = 0;
          if (v32->super._logHandle)
          {
            v9 = v32->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v8 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v8 = init_default_corebrightness_log();
            v9 = v8;
          }
          v20 = v9;
          v19 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v33, (uint64_t)v32->_displayContainerUUID);
            _os_log_impl(&dword_1B5291000, v20, v19, "usb container ID = %{public}@", v33, 0xCu);
          }
        }
        else
        {
          v18 = 0;
          if (v32->super._logHandle)
          {
            v7 = v32->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v6 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v6 = init_default_corebrightness_log();
            v7 = v6;
          }
          v18 = v7;
          v17 = 1;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v4 = v18;
            v5 = v17;
            __os_log_helper_16_0_0(v16);
            _os_log_impl(&dword_1B5291000, v4, v5, "no usb container ID", v16, 2u);
          }
        }
        v29 = -[CBDisplayContaineriOS setupInternalModules](v32, "setupInternalModules");
      }
    }
    else
    {
      v24 = 0;
      if (v32->super._logHandle)
      {
        v13 = v32->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v12 = init_default_corebrightness_log();
        v13 = v12;
      }
      v24 = v13;
      v23 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v35, v30);
        _os_log_error_impl(&dword_1B5291000, v24, v23, "failed to retrieve class for display service %u", v35, 8u);
      }
      v29 = 0;
    }
  }

  return v29 & 1;
}

- (void)dealloc
{
  int *v2;
  objc_super v3;
  SEL v4;
  CBDisplayContaineriOS *v5;

  v5 = self;
  v4 = a2;

  -[CBBrightnessProxy unregisterNotificationBlocks](v5->_brtCtl, "unregisterNotificationBlocks");
  if (v5->super._queue)
  {
    dispatch_release((dispatch_object_t)v5->super._queue);
    v5->super._queue = 0;
  }
  if (v5->_displayService)
  {
    IOObjectRelease(v5->_displayService);
    v5->_displayService = 0;
  }
  if (v5->_armBacklightDisplayService)
  {
    IOObjectRelease(v5->_armBacklightDisplayService);
    v5->_armBacklightDisplayService = 0;
  }
  if (v5->super._logHandle)
  {
    v2 = &OBJC_IVAR___CBContainer__logHandle;

    v5->super._logHandle = 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)CBDisplayContaineriOS;
  -[CBContainer dealloc](&v3, sel_dealloc, v2);
}

- (NSString)description
{
  uint64_t v2;
  SEL v4;
  CBDisplayContaineriOS *v5;

  v5 = self;
  v4 = a2;
  if (!self->_description)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CBDisplayContaineriOS<%p>: ID=%lu built-in=%d service=%u containerID=%@"), v5, v5->_displayID, v5->_builtIn, v5->_displayService, v5->_displayContainerUUID, 0);
    v5->_description = (NSString *)v2;
  }
  return v5->_description;
}

uint64_t __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v2;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *, uint64_t, _BYTE *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = a1;
  v11 = a1;
  result = objc_msgSend(*(id *)(a1 + 32), "getKeyDisplayID");
  if (result == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "getKeyString");
    if (result)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
      if (!result)
      {
        v2 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
        v4 = MEMORY[0x1E0C809B0];
        v5 = -1073741824;
        v6 = 0;
        v7 = __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_2;
        v8 = &unk_1E68EA910;
        v10 = *(_QWORD *)(a1 + 48);
        v9 = *(_QWORD *)(a1 + 32);
        return objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v4);
      }
    }
  }
  return result;
}

uint64_t __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890);
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "copyPropertyForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *a4 = 1;
  }
  return result;
}

- (BOOL)start
{
  uint64_t v3;

  if (self->_brtCtl
    && (v3 = -[CBBrightnessProxy getDisplayType](self->_brtCtl, "getDisplayType"),
        v3 == -[CBBrightnessProxy CBDispTypeIntegrated](self->_brtCtl, "CBDispTypeIntegrated")))
  {
    return -[CBDisplayContaineriOS handleCBBrtCtlDisplayContainerStart](self, "handleCBBrtCtlDisplayContainerStart");
  }
  else
  {
    return -[CBDisplayContaineriOS handleCBDisplayContainerStart](self, "handleCBDisplayContainerStart");
  }
}

- (void)handlePresetChange:(id)a3
{
  void *context;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "Presets: refershing presets state based on %@", v8, 0xCu);
  }
  if (a3)
  {
    context = (void *)MEMORY[0x1B5E4A8B0]();
    -[CBContainerProtocol setProperty:forKey:](self->_harmonyContainer, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "trueToneDisabled") & 1), CFSTR("CBDisplayPresetDisableHarmony"));
    -[CBContainerModuleProtocol setProperty:forKey:](self->_autoBrightnessModule, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "autoBrightnessDisabledForDisplay:", self->_displayID) & 1));
    -[CBContainerModuleProtocol setProperty:forKey:](self->_displayControlModule, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "autoBrightnessDisabledForDisplay:", self->_displayID) & 1), CFSTR("CBDisplayPresetDisableAutoBrightness"));
    -[CBContainerModuleProtocol setProperty:forKey:](self->_displayControlModule, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "brightnessDisabledForDisplay:", self->_displayID) & 1), CFSTR("CBDisplayPresetLockBrightnessUpdates"));
    objc_autoreleasePoolPop(context);
  }
}

- (BOOL)handleCBDisplayContainerStart
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  uint64_t block;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  CBDisplayContaineriOS *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  char v20;
  SEL v21;
  CBDisplayContaineriOS *v22;

  v22 = self;
  v21 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 1;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __54__CBDisplayContaineriOS_handleCBDisplayContainerStart__block_invoke;
  v13 = &unk_1E68EABC8;
  v14 = v22;
  v15 = &v16;
  dispatch_sync(queue, &block);
  v8 = objc_alloc(MEMORY[0x1E0C99D20]);
  v6 = &v4;
  v7 = objc_msgSend(v8, "initWithObjects:", CFSTR("DisplayBrightnessFactorWithFade"), CFSTR("DisplayBrightnessFactor"), CFSTR("CBContainerInfo"), CFSTR("CBDisplayIsBuiltIn"), CFSTR("CBDisplayIsExternal"), CFSTR("CBDisplayID"), CFSTR("DisplayBrightness2Available"), CFSTR("DisplayBrightness2"), CFSTR("DisplayBrightnessAuto2Available"), CFSTR("DisplayBrightnessAuto2"), CFSTR("StatusInfo"), CFSTR("DISABLE_HID_INTERFACE"), 0);
  v22->_allowlist = (NSArray *)v7;
  v5 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v5 & 1;
}

void __54__CBDisplayContaineriOS_handleCBDisplayContainerStart__block_invoke(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  CBColorModuleiOS *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v18;
  uint8_t v20[15];
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD v30[2];
  int v31;
  int v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  os_log_type_t v36;
  os_log_t v37;
  id v38;
  uint8_t v39[7];
  char v40;
  NSObject *v41;
  uint8_t v42[15];
  char v43;
  NSObject *v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v48 = a1;
  v47 = a1;
  v46 = 0;
  v45 = 1;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "isExternal") & 1) != 0)
  {
    v44 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v18 = inited;
    }
    v44 = v18;
    v43 = 1;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      log = v44;
      type = v43;
      __os_log_helper_16_0_0(v42);
      _os_log_impl(&dword_1B5291000, log, type, "External display -> find HID display service.", v42, 2u);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "External");
    if ((objc_msgSend(*(id *)(a1 + 32), "initialiseHIDDisplay") & 1) == 0)
    {
      v41 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
      {
        v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      }
      else
      {
        v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v14 = v13;
      }
      v41 = v14;
      v40 = 1;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v11 = v41;
        v12 = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_impl(&dword_1B5291000, v11, v12, "no display service found - waiting for display arrival", v39, 2u);
      }
    }
    v46 = 1;
    v38 = 0;
    v38 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "currentMode"), "colorMode");
    v45 = (objc_msgSend(v38, "localizedCaseInsensitiveContainsString:", CFSTR("YCbCr")) ^ 1) & 1;
    v37 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    v37 = v10;
    v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((v45 & 1) != 0)
        v1 = "yes";
      else
        v1 = "no";
      __os_log_helper_16_2_2_8_66_8_32((uint64_t)v49, (uint64_t)v38, (uint64_t)v1);
      _os_log_impl(&dword_1B5291000, v37, v36, "ColorMode %{public}@ - initialize Color Module=%s", v49, 0x16u);
    }
  }
  else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) && (objc_msgSend(*(id *)(a1 + 32), "findBacklight") & 1) != 0
         || (objc_msgSend(*(id *)(a1 + 32), "handleDisplayArrival:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 136)) & 1) != 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "BuiltIn");
    v46 = 1;
  }
  if ((v45 & 1) != 0)
  {
    v8 = [CBColorModuleiOS alloc];
    v2 = (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 141) & 1) != 0 ? 1 : 2;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = -[CBColorModuleiOS initWithBacklight:andModuleType:](v8, "initWithBacklight:andModuleType:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 136), v2);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "scheduleWithDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    }
  }
  v30[0] = 0;
  v30[1] = v30;
  v31 = 1375731712;
  v32 = 48;
  v33 = __Block_byref_object_copy__16;
  v34 = __Block_byref_object_dispose__16;
  v35 = 0;
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v23 = MEMORY[0x1E0C809B0];
  v24 = -1073741824;
  v25 = 0;
  v26 = __54__CBDisplayContaineriOS_handleCBDisplayContainerStart__block_invoke_128;
  v27 = &unk_1E68EB368;
  v28 = *(_QWORD *)(a1 + 32);
  v29 = v30;
  objc_msgSend(v3, "registerNotificationBlock:", &v23);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 141) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("ColorFadesEnabled"));
  if ((v46 & 1) == 0)
  {
    v22 = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    v22 = v7;
    v21 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v4 = v22;
      v5 = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_impl(&dword_1B5291000, v4, v5, "no backlight found", v20, 2u);
    }
    DisplayNotify(1u);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  _Block_object_dispose(v30, 8);
}

uint64_t __54__CBDisplayContaineriOS_handleCBDisplayContainerStart__block_invoke_128(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  NSObject *v4;
  uint64_t v5;
  uint8_t v8[24];
  uint64_t v9;

  v5 = result;
  v9 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    objc_msgSend(*(id *)(v5 + 32), "handleNotificationForKey:withProperty:from:", a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 40));
    return objc_msgSend(*(id *)(v5 + 32), "sendNotificationForKey:andValue:", a2, a3);
  }
  return result;
}

- (BOOL)handleCBBrtCtlDisplayContainerStart
{
  NSObject *queue;
  uint64_t v3;
  uint64_t block;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CBDisplayContaineriOS *v10;
  SEL v11;
  CBDisplayContaineriOS *v12;

  v12 = self;
  v11 = a2;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke;
  v9 = &unk_1E68E9E60;
  v10 = v12;
  dispatch_sync(queue, &block);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("DisplayBrightnessFactorWithFade"), CFSTR("DisplayBrightnessFactor"), CFSTR("CBContainerInfo"), CFSTR("CBDisplayIsBuiltIn"), CFSTR("CBDisplayID"), CFSTR("DisplayBrightness2Available"), CFSTR("DisplayBrightness2"), CFSTR("DisplayBrightnessAuto2Available"), CFSTR("DisplayBrightnessAuto2"), CFSTR("StatusInfo"), CFSTR("DISABLE_HID_INTERFACE"), 0);
  v12->_allowlist = (NSArray *)v3;
  return 1;
}

uint64_t __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t result;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v12 = a1;
  v22 = a1;
  v21 = a1;
  objc_msgSend(*(id *)(a1 + 32), "findBacklight");
  v1 = *(_QWORD *)(v12 + 32);
  v5 = &OBJC_IVAR___CBContainer__logHandle;

  *(_QWORD *)(*(_QWORD *)(v12 + 32) + 8) = os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "BuiltIn");
  v20 = 0;
  v11 = objc_alloc(MEMORY[0x1E0C99D20]);
  v2 = *(_QWORD *)(v12 + 32);
  v13 = &OBJC_IVAR___BLControl__clientDisplayMap;
  v10 = objc_msgSend(*(id *)(v2 + 176), "brightnessNotificationRequestEDR");
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(v12 + 32) + 176), "brightnessNotificationAttached");
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(v12 + 32) + 176), "brightnessNotificationPowerOn");
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(v12 + 32) + 176), "brightnessNotificationPowerOff");
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(v12 + 32) + 176), "brightnessNotificationSecureIndicatorOn");
  v20 = (id)objc_msgSend(v11, "initWithObjects:", v10, v6, v7, v8, v9, objc_msgSend(*(id *)(*(_QWORD *)(v12 + 32) + 176), "brightnessNotificationSecureIndicatorOff"), 0);
  v3 = *(void **)(*(_QWORD *)(v12 + 32) + v13[204]);
  v14 = MEMORY[0x1E0C809B0];
  v15 = -1073741824;
  v16 = 0;
  v17 = __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_2;
  v18 = &unk_1E68EB3C8;
  v19 = *(_QWORD *)(v12 + 32);
  objc_msgSend(v3, "registerForNotifications:withBlock:", v20, &v14);

  result = objc_msgSend(*(id *)(*(_QWORD *)(v12 + 32) + v13[204]), "getBrightnessCapabilities");
  if (result)
    return objc_msgSend(*(id *)(v12 + 32), "setupInternalBrtCtlModules");
  return result;
}

void __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t inited;
  NSObject *v5;
  uint64_t block;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  os_log_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = a1;
  v19 = a2;
  v18 = a3;
  v17 = a1;
  v16 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v5 = inited;
  }
  v16 = v5;
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, v19, v18);
    _os_log_impl(&dword_1B5291000, v16, v15, "Notification %@ received from CA with payload %@", v21, 0x16u);
  }
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_144;
  v11 = &unk_1E68EA150;
  v12 = v19;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v18;
  dispatch_async(v3, &block);
}

uint64_t __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_144(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  v12 = a1;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "brightnessNotificationAttached")) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setupInternalBrtCtlModules");
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "brightnessNotificationAttached");
    objc_msgSend(v3, "setProperty:forKey:");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setProperty:forKey:", 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "brightnessNotificationAttached"));
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "brightnessNotificationRequestEDR")) & 1) != 0)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setProperty:forKey:", *(_QWORD *)(a1 + 48), CFSTR("EDRHeadroomRequest"));
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v5 = MEMORY[0x1E0C809B0];
    v6 = -1073741824;
    v7 = 0;
    v8 = __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_2_147;
    v9 = &unk_1E68EA760;
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v5);
  }
}

uint64_t __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_2_147(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "setProperty:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)stop
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  CBDisplayContaineriOS *v8;
  SEL v9;
  CBDisplayContaineriOS *v10;

  v10 = self;
  v9 = a2;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __29__CBDisplayContaineriOS_stop__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = v10;
  dispatch_sync(queue, &block);
}

uint64_t __29__CBDisplayContaineriOS_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tearDownInternalModules", a1, a1);
}

- (BOOL)matchDisplayWithHidService:(__IOHIDServiceClient *)a3
{
  int v4;
  int valuePtr;
  CFNumberRef number;
  BOOL v7;
  id v8;
  id v9;
  IOHIDServiceClientRef v10;
  SEL v11;
  CBDisplayContaineriOS *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  if (!self->_displayService)
    return 0;
  v9 = 0;
  v8 = (id)IOHIDServiceClientCopyProperty(v10, CFSTR("kUSBContainerID"));
  v7 = 0;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  }

  valuePtr = 0;
  v4 = 0;
  number = (CFNumberRef)IOHIDServiceClientCopyProperty(v10, CFSTR("PrimaryUsagePage"));
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
  }
  number = (CFNumberRef)IOHIDServiceClientCopyProperty(v10, CFSTR("PrimaryUsage"));
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &v4);
    CFRelease(number);
  }
  if (v12->_displayContainerUUID && IOHIDServiceClientConformsTo(v10, 0x20u, 0x41u))
  {
    v7 = 1;

    return v7;
  }
  else
  {
    v7 = !v9 && !v12->_displayContainerUUID
      || v9 && v12->_displayContainerUUID && (objc_msgSend(v9, "isEqual:", v12->_displayContainerUUID) & 1) != 0;

    return v7;
  }
}

- (BOOL)setupInternalModules
{
  CBDisplayModuleiOS *v2;
  uint64_t v3;
  CBABModuleiOS *v4;
  uint64_t v5;
  CBDisplayModuleHIDiOS *v6;
  CBEDRModule *v7;
  uint64_t v8;
  CBABModuleExternal *v9;
  uint64_t v10;
  CBAODModule *v11;
  uint64_t v12;
  NSMutableArray *modules;
  NSMutableArray *v14;
  NSMutableArray *relevantServices;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  NSObject *v37;
  void *context;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t (*v70)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v71;
  CBDisplayContaineriOS *v72;
  uint64_t v73;
  int v74;
  int v75;
  void (*v76)(uint64_t, void *, uint64_t, uint64_t);
  void *v77;
  CBDisplayContaineriOS *v78;
  uint8_t v79[15];
  os_log_type_t v80;
  os_log_t oslog;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t (*v85)(uint64_t, void *);
  void *v86;
  CBDisplayContaineriOS *v87;
  uint8_t v88[7];
  char v89;
  NSObject *v90;
  uint8_t v91[7];
  char v92;
  NSObject *v93;
  uint8_t v94[7];
  char v95;
  NSObject *v96;
  uint8_t v97[7];
  os_log_type_t v98;
  NSObject *v99;
  uint8_t v100[7];
  char v101;
  NSObject *v102;
  uint8_t v103[15];
  os_log_type_t v104;
  NSObject *v105;
  CBDisplayModuleHIDiOS *v106;
  uint8_t v107[7];
  char v108;
  NSObject *v109;
  uint8_t v110[7];
  char v111;
  NSObject *v112;
  uint8_t v113[7];
  char v114;
  NSObject *v115;
  uint8_t v116[7];
  char v117;
  NSObject *v118;
  uint8_t v119[7];
  char v120;
  NSObject *v121;
  SEL v122;
  CBDisplayContaineriOS *v123;

  v123 = self;
  v122 = a2;
  v121 = 0;
  if (self->super._logHandle)
  {
    logHandle = v123->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v121 = logHandle;
  v120 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v121;
    type = v120;
    __os_log_helper_16_0_0(v119);
    _os_log_debug_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v119, 2u);
  }
  if (IOObjectConformsTo(v123->_displayService, "AppleARMBacklight"))
  {
    if (v123->_display || CBU_IsAccessory())
    {
      v2 = [CBDisplayModuleiOS alloc];
      v3 = -[CBDisplayModuleiOS initWithBacklight:queue:display:](v2, "initWithBacklight:queue:display:", v123->_displayService, v123->super._queue, v123->_display);
      v123->_displayControlModule = (CBContainerModuleProtocol *)v3;
    }
    if (v123->_displayControlModule)
    {
      v4 = [CBABModuleiOS alloc];
      v5 = -[CBABModuleiOS initWithDisplayModule:andQueue:](v4, "initWithDisplayModule:andQueue:", v123->_displayControlModule, v123->super._queue);
      v123->_autoBrightnessModule = (CBContainerModuleProtocol *)v5;
      if (v123->_autoBrightnessModule)
      {
        -[NSMutableArray addObject:](v123->_modules, "addObject:", v123->_autoBrightnessModule);
        v118 = 0;
        if (v123->super._logHandle)
        {
          v62 = v123->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v61 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v61 = init_default_corebrightness_log();
          v62 = v61;
        }
        v118 = v62;
        v117 = 2;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          v59 = v118;
          v60 = v117;
          __os_log_helper_16_0_0(v116);
          _os_log_debug_impl(&dword_1B5291000, v59, v60, "auto brightness module for internal display added", v116, 2u);
        }
        v123->_running = 1;
        -[CBDisplayContaineriOS createAndAddSliderCommitTelemetryModule](v123, "createAndAddSliderCommitTelemetryModule");
      }
      else
      {
        v115 = 0;
        if (v123->super._logHandle)
        {
          v58 = v123->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v57 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v57 = init_default_corebrightness_log();
          v58 = v57;
        }
        v115 = v58;
        v114 = 16;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v55 = v115;
          v56 = v114;
          __os_log_helper_16_0_0(v113);
          _os_log_error_impl(&dword_1B5291000, v55, v56, "error: failed to create auto-brighntess module", v113, 2u);
        }
      }
      -[NSMutableArray addObject:](v123->_modules, "addObject:", v123->_displayControlModule);
      v112 = 0;
      if (v123->super._logHandle)
      {
        v54 = v123->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v53 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v53 = init_default_corebrightness_log();
        v54 = v53;
      }
      v112 = v54;
      v111 = 2;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        v51 = v112;
        v52 = v111;
        __os_log_helper_16_0_0(v110);
        _os_log_debug_impl(&dword_1B5291000, v51, v52, "control module for internal display added", v110, 2u);
      }
    }
    else
    {
      v109 = 0;
      if (v123->super._logHandle)
      {
        v50 = v123->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v49 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v49 = init_default_corebrightness_log();
        v50 = v49;
      }
      v109 = v50;
      v108 = 16;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v47 = v109;
        v48 = v108;
        __os_log_helper_16_0_0(v107);
        _os_log_error_impl(&dword_1B5291000, v47, v48, "error: failed to create a display module", v107, 2u);
      }
    }
  }
  else if (IOObjectConformsTo(v123->_displayService, "IOHIDDevice"))
  {
    v106 = 0;
    v6 = [CBDisplayModuleHIDiOS alloc];
    v106 = -[CBDisplayModuleHIDiOS initWithDevice:andQueue:](v6, "initWithDevice:andQueue:", v123->_displayService, v123->super._queue);
    if (v106)
    {
      if (-[CBDisplayModuleHIDiOS VID](v106, "VID") == 1452 && -[CBDisplayModuleHIDiOS PID](v106, "PID") == 37415)
      {
        v105 = 0;
        if (v123->super._logHandle)
        {
          v46 = v123->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v45 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v45 = init_default_corebrightness_log();
          v46 = v45;
        }
        v105 = v46;
        v104 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v43 = v105;
          v44 = v104;
          __os_log_helper_16_0_0(v103);
          _os_log_impl(&dword_1B5291000, v43, v44, "Thunderbolt display doesn't have brightness support.", v103, 2u);
        }
        v123->_running = 0;

      }
      else
      {
        v123->_displayControlModule = (CBContainerModuleProtocol *)v106;
        -[NSMutableArray addObject:](v123->_modules, "addObject:", v123->_displayControlModule);
        v102 = 0;
        if (v123->super._logHandle)
        {
          v42 = v123->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v41 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v41 = init_default_corebrightness_log();
          v42 = v41;
        }
        v102 = v42;
        v101 = 2;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          v39 = v102;
          v40 = v101;
          __os_log_helper_16_0_0(v100);
          _os_log_debug_impl(&dword_1B5291000, v39, v40, "display module for external display added", v100, 2u);
        }
        v123->_running = 1;
        if (v123->_brtCtl)
        {
          context = (void *)MEMORY[0x1B5E4A8B0]();
          -[CBContainerModuleProtocol setProperty:forKey:](v123->_displayControlModule, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CBBrightnessProxy getVendorId](v123->_brtCtl, "getVendorId")), CFSTR("CBDisplayVendorID"));
          -[CBContainerModuleProtocol setProperty:forKey:](v123->_displayControlModule, "setProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CBBrightnessProxy getProductId](v123->_brtCtl, "getProductId")), CFSTR("CBDisplayProductID"));
          objc_autoreleasePoolPop(context);
        }
        if (-[CBDisplayModuleHIDiOS VID](v106, "VID") == 1452 && -[CBDisplayModuleHIDiOS PID](v106, "PID") == 37443)
        {
          v99 = 0;
          if (v123->super._logHandle)
          {
            v37 = v123->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v36 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v36 = init_default_corebrightness_log();
            v37 = v36;
          }
          v99 = v37;
          v98 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v34 = v99;
            v35 = v98;
            __os_log_helper_16_0_0(v97);
            _os_log_impl(&dword_1B5291000, v34, v35, "VID/PID match Initialise EDR module", v97, 2u);
          }
          v7 = [CBEDRModule alloc];
          v8 = -[CBEDRModule initWithQueue:display:colorModule:andDisplayModule:](v7, "initWithQueue:display:colorModule:andDisplayModule:", v123->super._queue, v123->_display, v123->_harmonyContainer, v123->_displayControlModule);
          v123->_edrControlModule = (CBContainerModuleProtocol *)v8;
          if (v123->_edrControlModule)
            -[NSMutableArray addObject:](v123->_modules, "addObject:", v123->_edrControlModule);
        }
        -[CBDisplayContaineriOS sendNotificationForKey:andValue:](v123, "sendNotificationForKey:andValue:", CFSTR("DisplayBrightness2Available"), MEMORY[0x1E0C9AAB0]);
        v9 = [CBABModuleExternal alloc];
        v10 = -[CBABModuleExternal initWithDisplayModule:andQueue:](v9, "initWithDisplayModule:andQueue:", v123->_displayControlModule, v123->super._queue);
        v123->_autoBrightnessModule = (CBContainerModuleProtocol *)v10;
        if (v123->_autoBrightnessModule)
        {
          -[NSMutableArray addObject:](v123->_modules, "addObject:", v123->_autoBrightnessModule);
          v96 = 0;
          if (v123->super._logHandle)
          {
            v33 = v123->super._logHandle;
          }
          else
          {
            v32 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v33 = v32;
          }
          v96 = v33;
          v95 = 2;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            v30 = v96;
            v31 = v95;
            __os_log_helper_16_0_0(v94);
            _os_log_debug_impl(&dword_1B5291000, v30, v31, "auto brightness module for external display added", v94, 2u);
          }
        }
      }
    }
    else
    {
      v93 = 0;
      if (v123->super._logHandle)
      {
        v29 = v123->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v28 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v28 = init_default_corebrightness_log();
        v29 = v28;
      }
      v93 = v29;
      v92 = 16;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v26 = v93;
        v27 = v92;
        __os_log_helper_16_0_0(v91);
        _os_log_error_impl(&dword_1B5291000, v26, v27, "error: failed to create a display module", v91, 2u);
      }
    }
  }
  else
  {
    v90 = 0;
    if (v123->super._logHandle)
    {
      v25 = v123->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v24 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v24 = init_default_corebrightness_log();
      v25 = v24;
    }
    v90 = v25;
    v89 = 16;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v22 = v90;
      v23 = v89;
      __os_log_helper_16_0_0(v88);
      _os_log_error_impl(&dword_1B5291000, v22, v23, "unsupported service", v88, 2u);
    }
  }
  if (v123->_brtCtl)
  {
    v11 = [CBAODModule alloc];
    v12 = -[CBAODModule initWithCBBrtControl:andQueue:](v11, "initWithCBBrtControl:andQueue:", v123->_brtCtl, v123->super._queue);
    v123->_AODModule = (CBContainerModuleProtocol *)v12;
    if (v123->_AODModule)
    {
      modules = v123->_modules;
      v82 = MEMORY[0x1E0C809B0];
      v83 = -1073741824;
      v84 = 0;
      v85 = __45__CBDisplayContaineriOS_setupInternalModules__block_invoke;
      v86 = &unk_1E68EA068;
      v87 = v123;
      -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:", &v82);
      -[NSMutableArray addObject:](v123->_modules, "addObject:", v123->_AODModule);
    }
    else
    {
      oslog = 0;
      if (v123->super._logHandle)
      {
        v21 = v123->super._logHandle;
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
      v80 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v18 = oslog;
        v19 = v80;
        __os_log_helper_16_0_0(v79);
        _os_log_error_impl(&dword_1B5291000, v18, v19, "Failed to initialize AOD module", v79, 2u);
      }
    }
  }
  v14 = v123->_modules;
  v73 = MEMORY[0x1E0C809B0];
  v74 = -1073741824;
  v75 = 0;
  v76 = __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_176;
  v77 = &unk_1E68EA068;
  v78 = v123;
  -[NSMutableArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", &v73, MEMORY[0x1E0C809B0]);
  relevantServices = v123->_relevantServices;
  v67 = v17;
  v68 = -1073741824;
  v69 = 0;
  v70 = __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_177;
  v71 = &unk_1E68EA068;
  v72 = v123;
  -[NSMutableArray enumerateObjectsUsingBlock:](relevantServices, "enumerateObjectsUsingBlock:", &v67);
  -[NSMutableArray makeObjectsPerformSelector:](v123->_modules, "makeObjectsPerformSelector:", sel_start);
  return v123->_running;
}

uint64_t __45__CBDisplayContaineriOS_setupInternalModules__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12BA58);
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addModule:", a2);
  return result;
}

void __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_176(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[2];
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v22 = a1;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  v18 = a1;
  if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890) & 1) != 0)
  {
    v12[0] = 0;
    v12[1] = v12;
    v13 = 1375731712;
    v14 = 48;
    v15 = __Block_byref_object_copy__16;
    v16 = __Block_byref_object_dispose__16;
    v17 = v21;
    v5 = MEMORY[0x1E0C809B0];
    v6 = -1073741824;
    v7 = 0;
    v8 = __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_2;
    v9 = &unk_1E68EB368;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v12;
    objc_msgSend(v21, "registerNotificationBlock:", &v5);
    _Block_object_dispose(v12, 8);
  }
}

uint64_t __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  NSObject *v4;
  uint64_t v5;
  uint8_t v8[24];
  uint64_t v9;

  v5 = result;
  v9 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
    {
      v4 = *(NSObject **)(*(_QWORD *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    objc_msgSend(*(id *)(v5 + 32), "handleNotificationForKey:withProperty:from:", a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 40));
    return objc_msgSend(*(id *)(v5 + 32), "sendNotificationForKey:andValue:", a2, a3);
  }
  return result;
}

uint64_t __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_177(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = a1;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_2_178;
  v10 = &unk_1E68EA068;
  v11 = a2;
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v6);
}

uint64_t __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_2_178(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "addHIDServiceClient:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setupInternalBrtCtlModules
{
  CBColorModuleiOS *v2;
  uint64_t v3;
  uint64_t v4;
  CBContainerProtocol *v5;
  NSMutableArray *modules;
  NSMutableArray *v7;
  NSMutableArray *relevantServices;
  NSMutableArray *missedKeys;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  CBAODModule *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  void *v36;
  CBDisplayContaineriOS *v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v42;
  CBDisplayContaineriOS *v43;
  uint64_t v44;
  int v45;
  int v46;
  void (*v47)(uint64_t, void *, uint64_t, uint64_t);
  void *v48;
  CBDisplayContaineriOS *v49;
  uint8_t v50[7];
  os_log_type_t v51;
  os_log_t oslog;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t (*v56)(uint64_t, void *);
  void *v57;
  CBDisplayContaineriOS *v58;
  uint64_t v59;
  int v60;
  int v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t);
  void *v63;
  CBDisplayContaineriOS *v64;
  _QWORD *v65;
  _QWORD v66[2];
  int v67;
  int v68;
  void (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  CBContainerProtocol *harmonyContainer;
  id v72;
  uint8_t v73[7];
  char v74;
  NSObject *v75;
  uint8_t v76[7];
  char v77;
  NSObject *v78;
  uint8_t v79[7];
  char v80;
  NSObject *v81;
  uint8_t v82[7];
  char v83;
  NSObject *v84;
  SEL v85;
  CBDisplayContaineriOS *v86;

  v86 = self;
  v85 = a2;
  if (!self->_displayControlModule)
  {
    v86->_displayControlModule = (CBContainerModuleProtocol *)-[CBDisplayModuleiOS initWithBacklight:queue:brtCtl:]([CBDisplayModuleiOS alloc], "initWithBacklight:queue:brtCtl:", v86->_armBacklightDisplayService, v86->super._queue, v86->_brtCtl);
    if (v86->_displayControlModule)
    {
      v86->_autoBrightnessModule = (CBContainerModuleProtocol *)-[CBABModuleiOS initWithDisplayModule:andQueue:]([CBABModuleiOS alloc], "initWithDisplayModule:andQueue:", v86->_displayControlModule, v86->super._queue);
      if (v86->_autoBrightnessModule)
      {
        -[NSMutableArray addObject:](v86->_modules, "addObject:", v86->_autoBrightnessModule);
        v84 = 0;
        if (v86->super._logHandle)
        {
          logHandle = v86->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        v84 = logHandle;
        v83 = 2;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          log = v84;
          type = v83;
          __os_log_helper_16_0_0(v82);
          _os_log_debug_impl(&dword_1B5291000, log, type, "auto brightness module for internal display added", v82, 2u);
        }
        -[CBDisplayContaineriOS createAndAddSliderCommitTelemetryModule](v86, "createAndAddSliderCommitTelemetryModule");
      }
      else
      {
        v81 = 0;
        if (v86->super._logHandle)
        {
          v27 = v86->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v26 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v26 = init_default_corebrightness_log();
          v27 = v26;
        }
        v81 = v27;
        v80 = 16;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v24 = v81;
          v25 = v80;
          __os_log_helper_16_0_0(v79);
          _os_log_error_impl(&dword_1B5291000, v24, v25, "error: failed to create auto-brighntess module", v79, 2u);
        }
      }
      -[NSMutableArray addObject:](v86->_modules, "addObject:", v86->_displayControlModule);
      v78 = 0;
      if (v86->super._logHandle)
      {
        v23 = v86->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v22 = init_default_corebrightness_log();
        v23 = v22;
      }
      v78 = v23;
      v77 = 2;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v20 = v78;
        v21 = v77;
        __os_log_helper_16_0_0(v76);
        _os_log_debug_impl(&dword_1B5291000, v20, v21, "control module for internal display added", v76, 2u);
      }
    }
    else
    {
      v75 = 0;
      if (v86->super._logHandle)
      {
        v19 = v86->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v18 = init_default_corebrightness_log();
        v19 = v18;
      }
      v75 = v19;
      v74 = 16;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v16 = v75;
        v17 = v74;
        __os_log_helper_16_0_0(v73);
        _os_log_error_impl(&dword_1B5291000, v16, v17, "error: failed to create a display module", v73, 2u);
      }
    }
    v2 = [CBColorModuleiOS alloc];
    if (v86->_builtIn)
      v3 = 1;
    else
      v3 = 2;
    v4 = -[CBColorModuleiOS initWithBacklight:andModuleType:andBrightnessControl:](v2, "initWithBacklight:andModuleType:andBrightnessControl:", v86->_armBacklightDisplayService, v3, v86->_brtCtl);
    v86->_harmonyContainer = (CBContainerProtocol *)v4;
    if (v86->_harmonyContainer)
    {
      -[CBContainerProtocol scheduleWithDispatchQueue:](v86->_harmonyContainer, "scheduleWithDispatchQueue:", v86->super._queue);
      -[NSMutableArray addObject:](v86->_modules, "addObject:", v86->_harmonyContainer);
      v72 = 0;
      v72 = (id)-[CBContainerModuleProtocol copyPropertyForKey:](v86->_displayControlModule, "copyPropertyForKey:", CFSTR("TwilightModule"));
      if (v72)
      {
        -[CBContainerProtocol setProperty:forKey:](v86->_harmonyContainer, "setProperty:forKey:", objc_msgSend(v72, "params"), CFSTR("TwilightParameters"));

      }
    }
    v66[0] = 0;
    v66[1] = v66;
    v67 = 1375731712;
    v68 = 48;
    v69 = __Block_byref_object_copy__16;
    v70 = __Block_byref_object_dispose__16;
    harmonyContainer = 0;
    harmonyContainer = v86->_harmonyContainer;
    v5 = v86->_harmonyContainer;
    v59 = MEMORY[0x1E0C809B0];
    v60 = -1073741824;
    v61 = 0;
    v62 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke;
    v63 = &unk_1E68EB368;
    v64 = v86;
    v65 = v66;
    -[CBContainerProtocol registerNotificationBlock:](v5, "registerNotificationBlock:", &v59);
    if (!v86->_builtIn)
      -[CBContainerProtocol setProperty:forKey:](v86->_harmonyContainer, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("ColorFadesEnabled"));
    if (v86->_brtCtl)
    {
      v15 = [CBAODModule alloc];
      v14 = -[CBAODModule initWithCBBrtControl:andQueue:](v15, "initWithCBBrtControl:andQueue:", v86->_brtCtl, v86->super._queue);
      v86->_AODModule = (CBContainerModuleProtocol *)v14;
      if (v86->_AODModule)
      {
        modules = v86->_modules;
        v53 = MEMORY[0x1E0C809B0];
        v54 = -1073741824;
        v55 = 0;
        v56 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_190;
        v57 = &unk_1E68EA068;
        v58 = v86;
        -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:", &v53);
        -[NSMutableArray addObject:](v86->_modules, "addObject:", v86->_AODModule);
      }
      else
      {
        oslog = 0;
        if (v86->super._logHandle)
        {
          v13 = v86->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v12 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v12 = init_default_corebrightness_log();
          v13 = v12;
        }
        oslog = v13;
        v51 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v10 = oslog;
          v11 = v51;
          __os_log_helper_16_0_0(v50);
          _os_log_error_impl(&dword_1B5291000, v10, v11, "Failed to initialize AOD module", v50, 2u);
        }
      }
    }
    v7 = v86->_modules;
    v44 = MEMORY[0x1E0C809B0];
    v45 = -1073741824;
    v46 = 0;
    v47 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_191;
    v48 = &unk_1E68EA068;
    v49 = v86;
    -[NSMutableArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", &v44);
    relevantServices = v86->_relevantServices;
    v38 = MEMORY[0x1E0C809B0];
    v39 = -1073741824;
    v40 = 0;
    v41 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_192;
    v42 = &unk_1E68EA068;
    v43 = v86;
    -[NSMutableArray enumerateObjectsUsingBlock:](relevantServices, "enumerateObjectsUsingBlock:", &v38);
    -[CBDisplayContaineriOS setColorMitigations](v86, "setColorMitigations");
    -[NSMutableArray makeObjectsPerformSelector:](v86->_modules, "makeObjectsPerformSelector:", sel_start);
    missedKeys = v86->_missedKeys;
    v32 = MEMORY[0x1E0C809B0];
    v33 = -1073741824;
    v34 = 0;
    v35 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_3;
    v36 = &unk_1E68EA068;
    v37 = v86;
    -[NSMutableArray enumerateObjectsUsingBlock:](missedKeys, "enumerateObjectsUsingBlock:", &v32);

    v86->_missedKeys = 0;
    v86->_missedProperties = 0;
    -[CBDisplayContaineriOS handlePresetChange:](v86, "handlePresetChange:", +[CBPresetsParser sharedInstance](CBPresetsParser, "sharedInstance"));
    _Block_object_dispose(v66, 8);
  }
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_190(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12BA58);
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addModule:", a2);
  return result;
}

void __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_191(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[2];
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v22 = a1;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  v18 = a1;
  if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890) & 1) != 0)
  {
    v12[0] = 0;
    v12[1] = v12;
    v13 = 1375731712;
    v14 = 48;
    v15 = __Block_byref_object_copy__16;
    v16 = __Block_byref_object_dispose__16;
    v17 = v21;
    v5 = MEMORY[0x1E0C809B0];
    v6 = -1073741824;
    v7 = 0;
    v8 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_2;
    v9 = &unk_1E68EB368;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v12;
    objc_msgSend(v21, "registerNotificationBlock:", &v5);
    _Block_object_dispose(v12, 8);
  }
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_192(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = a1;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_2_193;
  v10 = &unk_1E68EA068;
  v11 = a2;
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v6);
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_2_193(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "addHIDServiceClient:", *(_QWORD *)(a1 + 32));
  return result;
}

void __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  NSObject *v4;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setPropertyNoQueue:forKey:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectAtIndex:", a3), a2);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v4 = inited;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v7, a2);
    _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "Restored %@ property", v7, 0xCu);
  }
}

- (void)tearDownInternalModules
{
  NSObject *log;
  os_log_type_t v3;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  SEL v9;
  CBDisplayContaineriOS *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  if (self->super._logHandle)
  {
    logHandle = v10->super._logHandle;
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
    v3 = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1B5291000, log, v3, (const char *)&unk_1B546AB41, v6, 2u);
  }
  -[NSMutableArray makeObjectsPerformSelector:](v10->_modules, "makeObjectsPerformSelector:", sel_stop);
  -[NSMutableArray makeObjectsPerformSelector:](v10->_modules, "makeObjectsPerformSelector:", sel_unregisterNotificationBlock);
  -[NSMutableArray removeAllObjects](v10->_modules, "removeAllObjects");
  -[CBModule unregisterNotificationBlock](v10->_displayCAManager, "unregisterNotificationBlock");

  -[CBContainerProtocol stop](v10->_harmonyContainer, "stop");
  -[CBContainerProtocol unscheduleWithDispatchQueue:](v10->_harmonyContainer, "unscheduleWithDispatchQueue:", v10->super._queue);

  v10->_harmonyContainer = 0;
  if (v10->_displayArrivalNotificationPort)
  {
    IONotificationPortSetDispatchQueue(v10->_displayArrivalNotificationPort, 0);
    IONotificationPortDestroy(v10->_displayArrivalNotificationPort);
    v10->_displayArrivalNotificationPort = 0;
  }
  if (v10->_displayArrivalIterator)
  {
    IOObjectRelease(v10->_displayArrivalIterator);
    v10->_displayArrivalIterator = 0;
  }
}

- (void)setColorMitigations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSMutableArray *obj;
  uint64_t v7;
  CBALSNode *v8;
  IOHIDServiceClientRef service;
  _QWORD __b[8];
  IOHIDServiceClientRef v11;
  SEL v12;
  CBDisplayContaineriOS *v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = self;
  v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v13->_relevantServices;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
  if (v7)
  {
    v3 = *(_QWORD *)__b[2];
    v4 = 0;
    v5 = v7;
    while (1)
    {
      v2 = v4;
      if (*(_QWORD *)__b[2] != v3)
        objc_enumerationMutation(obj);
      v11 = 0;
      v11 = *(IOHIDServiceClientRef *)(__b[1] + 8 * v4);
      service = v11;
      if (v13->_builtIn
        && IOHIDServiceClientConformsTo(v11, 0xFF00u, 4u)
        && -[CBContainerModuleProtocol shouldMitigateHarmony:](v13->_autoBrightnessModule, "shouldMitigateHarmony:", service))
      {
        v8 = -[CBALSNode initWithALSServiceClient:]([CBALSNode alloc], "initWithALSServiceClient:", service);
        if (-[CBALSNode isColorSupported](v8, "isColorSupported"))
          -[CBContainerProtocol enableMitigations:](v13->_harmonyContainer, "enableMitigations:", 1);

      }
      ++v4;
      if (v2 + 1 >= v5)
      {
        v4 = 0;
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
        if (!v5)
          break;
      }
    }
  }
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSObject *queue;
  uint64_t block;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CBDisplayContaineriOS *v10;
  __IOHIDServiceClient *v11;
  __IOHIDServiceClient *v12;
  SEL v13;
  CBDisplayContaineriOS *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __45__CBDisplayContaineriOS_addHIDServiceClient___block_invoke;
  v9 = &unk_1E68EA3D8;
  v10 = v14;
  v11 = a3;
  dispatch_sync(queue, &block);
  return 1;
}

uint64_t __45__CBDisplayContaineriOS_addHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v2;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  result = objc_msgSend(*(id *)(a1 + 32), "matchDisplayWithHidService:", *(_QWORD *)(a1 + 40));
  if ((result & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __45__CBDisplayContaineriOS_addHIDServiceClient___block_invoke_2;
    v8 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v4);
    return objc_msgSend(*(id *)(a1 + 32), "setColorMitigations");
  }
  return result;
}

uint64_t __45__CBDisplayContaineriOS_addHIDServiceClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "addHIDServiceClient:", *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSObject *queue;
  uint64_t block;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CBDisplayContaineriOS *v10;
  __IOHIDServiceClient *v11;
  __IOHIDServiceClient *v12;
  SEL v13;
  CBDisplayContaineriOS *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __48__CBDisplayContaineriOS_removeHIDServiceClient___block_invoke;
  v9 = &unk_1E68EA3D8;
  v10 = v14;
  v11 = a3;
  dispatch_sync(queue, &block);
  return 1;
}

uint64_t __48__CBDisplayContaineriOS_removeHIDServiceClient___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __48__CBDisplayContaineriOS_removeHIDServiceClient___block_invoke_2;
  v8 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v9 = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", &v4);
}

uint64_t __48__CBDisplayContaineriOS_removeHIDServiceClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B9C8);
  if ((result & 1) != 0)
    return objc_msgSend(a2, "removeHIDServiceClient:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)registerNotificationBlock:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  objc_super v7;
  uint8_t v8[15];
  char v9;
  NSObject *v10;
  id v11;
  SEL v12;
  CBDisplayContaineriOS *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = 0;
  if (self->super._logHandle)
  {
    logHandle = v13->super._logHandle;
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
  v9 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v10;
    type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_debug_impl(&dword_1B5291000, log, type, "Register notification block", v8, 2u);
  }
  v7.receiver = v13;
  v7.super_class = (Class)CBDisplayContaineriOS;
  -[CBContainer registerNotificationBlock:](&v7, sel_registerNotificationBlock_, v11);
}

- (void)unregisterNotificationBlock
{
  objc_super v2;
  SEL v3;
  CBDisplayContaineriOS *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CBDisplayContaineriOS;
  -[CBContainer unregisterNotificationBlock](&v2, sel_unregisterNotificationBlock);
}

- (id)copyPreferenceForKey:(id)a3 user:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "NightShift copyPreferencesForKey %@", v10, 0xCu);
  }
  return (id)-[CBContainerProtocol copyPreferenceForKey:user:](self->_harmonyContainer, "copyPreferenceForKey:user:", a3, a4);
}

- (void)setNightShiftFactorDictionary:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "NightShift setNightShiftFactorDictionary %@", v7, 0xCu);
  }
  -[CBContainerProtocol setNightShiftFactorDictionary:](self->_harmonyContainer, "setNightShiftFactorDictionary:", a3);
}

- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v11, (uint64_t)a3, (uint64_t)a4);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "NightShift setPreference %@ for key %@", v11, 0x16u);
  }
  -[CBContainerProtocol setPreference:forKey:user:](self->_harmonyContainer, "setPreference:forKey:user:", a3, a4, a5);
}

- (id)copyStatusInfo
{
  NSMutableArray *modules;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  SEL v13;
  CBDisplayContaineriOS *v14;

  v14 = self;
  v13 = a2;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = +[CBStatusInfoHelper copyStatusInfoFor:](CBStatusInfoHelper, "copyStatusInfoFor:", v14);
  if (v11)
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("DisplayContainer"));

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  modules = v14->_modules;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __39__CBDisplayContaineriOS_copyStatusInfo__block_invoke;
  v8 = &unk_1E68EA068;
  v9 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:", &v4);
  objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("ModulesInfo"));

  return v12;
}

void __39__CBDisplayContaineriOS_copyStatusInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12B890) & 1) != 0
    || (objc_msgSend(a2, "conformsToProtocol:", &unk_1EF12E780) & 1) != 0)
  {
    v3 = (id)objc_msgSend(a2, "copyPropertyForKey:", CFSTR("StatusInfo"));
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (id)copyIdentifiers
{
  SEL v3;
  CBDisplayContaineriOS *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("CBContainerInfo"), CFSTR("BrightnessControlCapabilities"), 0);
}

- (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isReady
{
  return self->_alsServiceReady;
}

- (BOOL)handleDisplayModeUpdate:(id)a3
{
  NSObject *queue;
  char v5;
  uint64_t block;
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  CBDisplayContaineriOS *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  id v19;
  SEL v20;
  CBDisplayContaineriOS *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0;
  queue = self->super._queue;
  block = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke;
  v10 = &unk_1E68EA6D0;
  v11 = v21;
  v13 = &v14;
  v12 = a3;
  dispatch_sync(queue, &block);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v5 & 1;
}

uint64_t __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v12 = a1;
  v11 = a1;
  v2 = *(void **)(a1[4] + 48);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke_2;
  v8 = &unk_1E68EA910;
  v10 = a1[6];
  v9 = a1[5];
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v4);
}

uint64_t __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke_2(uint64_t a1, void *a2)
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

- (BOOL)createAndAddSliderCommitTelemetryModule
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *log;
  os_log_type_t type;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[7];
  char v12;
  NSObject *v13;
  uint8_t v14[15];
  char v15;
  NSObject *v16;
  SEL v17;
  CBDisplayContaineriOS *v18;

  v18 = self;
  v17 = a2;
  if ((CBU_IsSliderCommitTelemetrySupported() & 1) == 0)
    return 0;
  v18->_SliderCommitTelemetryModule = (CBContainerModuleProtocol *)-[CBSliderCommitTelemetry initWithQueue:andDisplayContainer:]([CBSliderCommitTelemetry alloc], "initWithQueue:andDisplayContainer:", v18->super._queue, v18);
  if (v18->_SliderCommitTelemetryModule)
  {
    -[NSMutableArray addObject:](v18->_modules, "addObject:", v18->_SliderCommitTelemetryModule);
    v13 = 0;
    if (v18->super._logHandle)
    {
      logHandle = v18->super._logHandle;
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
    v12 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      v3 = v13;
      v4 = v12;
      __os_log_helper_16_0_0(v11);
      _os_log_debug_impl(&dword_1B5291000, v3, v4, "SliderCommitTelemetry module added", v11, 2u);
    }
    return 1;
  }
  else
  {
    v16 = 0;
    if (v18->super._logHandle)
    {
      v10 = v18->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    v16 = v10;
    v15 = 16;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      log = v16;
      type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_error_impl(&dword_1B5291000, log, type, "SliderCommitTelemetry module failed to init", v14, 2u);
    }
    return 0;
  }
}

@end
