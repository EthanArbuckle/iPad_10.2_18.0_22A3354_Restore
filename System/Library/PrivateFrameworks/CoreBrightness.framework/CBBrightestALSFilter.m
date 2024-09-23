@implementation CBBrightestALSFilter

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  BOOL v5;

  v5 = 0;
  if ((objc_msgSend(a4, "isEqual:", CFSTR("DisplayBrightnessFactor")) & 1) != 0
    || (objc_msgSend(a4, "isEqual:", CFSTR("DisplayBrightnessFactorWithFade")) & 1) != 0)
  {
    return -[CBBrightestALSFilter displayBrightnessFactorPropertyHandler:](self, "displayBrightnessFactorPropertyHandler:", a3);
  }
  return v5;
}

- (id)filterEvent:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  void *context;
  uint8_t v11[7];
  char v12;
  NSObject *v13;
  int v14;
  id v15;
  os_log_type_t v16;
  os_log_t v17;
  id v18;
  id v19;
  id v20;
  SEL v21;
  CBBrightestALSFilter *v22;
  id v23;
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = self;
  v21 = a2;
  v20 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return v20;
  v19 = v20;
  context = (void *)MEMORY[0x1B5E4A8B0](-[NSMutableDictionary setObject:forKey:](v22->_alsEvents, "setObject:forKey:", v20, objc_msgSend(v20, "serviceRegistryID")));
  v18 = 0;
  v18 = (id)-[NSMutableDictionary keysSortedByValueUsingComparator:](v22->_alsEvents, "keysSortedByValueUsingComparator:", &__block_literal_global_5);
  v17 = 0;
  if (v22->super._logHandle)
  {
    logHandle = v22->super._logHandle;
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
  v16 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)v22->_alsEvents);
    _os_log_debug_impl(&dword_1B5291000, v17, v16, "ALS events %@", v24, 0xCu);
  }
  v15 = 0;
  v15 = (id)-[NSMutableDictionary objectForKey:](v22->_alsEvents, "objectForKey:", objc_msgSend(v18, "objectAtIndexedSubscript:", 0));
  if (v15 && ((objc_msgSend(v15, "obstructed") & 1) == 0 || (objc_msgSend(v20, "firstALSSample") & 1) != 0))
  {
    v23 = v15;
    v14 = 1;
  }
  else
  {
    v13 = 0;
    if (v22->super._logHandle)
    {
      v7 = v22->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    v13 = v7;
    v12 = 2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v4 = v13;
      v5 = v12;
      __os_log_helper_16_0_0(v11);
      _os_log_debug_impl(&dword_1B5291000, v4, v5, "Brightest ALS event was not found", v11, 2u);
    }
    v23 = 0;
    v14 = 1;
  }
  objc_autoreleasePoolPop(context);
  return v23;
}

- (CBBrightestALSFilter)init
{
  os_log_t v2;
  NSMutableDictionary *v3;
  objc_super v5;
  SEL v6;
  CBBrightestALSFilter *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)CBBrightestALSFilter;
  v7 = -[CBFilter init](&v5, sel_init);
  if (v7)
  {
    v2 = os_log_create("com.apple.CoreBrightness.CBBrightestALSFilter", "default");
    v7->super._logHandle = (OS_os_log *)v2;
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_alsEvents = v3;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBBrightestALSFilter *v4;

  v4 = self;
  v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBBrightestALSFilter;
  -[CBFilter dealloc](&v2, sel_dealloc);
}

uint64_t __36__CBBrightestALSFilter_filterEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:", a3, a1, a3, a2, a1);
}

- (void)forgetDataForService:(__IOHIDServiceClient *)a3
{
  uint64_t inited;
  NSObject *logHandle;
  CFTypeRef RegistryID;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  RegistryID = IOHIDServiceClientGetRegistryID(a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[NSMutableDictionary objectForKey:](self->_alsEvents, "objectForKey:", RegistryID))
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
      __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)RegistryID);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "forgetting data for service with ID = %@", v7, 0xCu);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_alsEvents, "removeObjectForKey:", RegistryID);
  }
}

- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3
{
  float v3;
  uint64_t inited;
  NSObject *logHandle;
  id v7;
  char v8;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (id)objc_msgSend(a3, "objectForKey:", CFSTR("DisplayBrightnessFactor"));
  else
    v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "floatValue");
    if (v3 <= 0.0)
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
        __os_log_helper_16_0_1_8_0((uint64_t)v11, -[NSMutableDictionary count](self->_alsEvents, "count"));
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Display off -> stored ALS events (%lu) removed", v11, 0xCu);
      }
      -[NSMutableDictionary removeAllObjects](self->_alsEvents, "removeAllObjects");
    }
    v8 = 1;
  }
  return v8 & 1;
}

@end
