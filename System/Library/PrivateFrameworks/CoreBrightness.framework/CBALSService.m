@implementation CBALSService

- (CBALSService)initWithHIDALSServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v3;
  char v4;
  char v5;
  id v7;
  id v8;
  void *v9;
  objc_super v10;
  id v11;
  __IOHIDServiceClient *v12;
  SEL v13;
  CBALSService *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.CBALSService.%lu"), objc_msgSend((id)IOHIDServiceClientGetRegistryID(a3), "unsignedIntegerValue"));
  v10.receiver = v14;
  v10.super_class = (Class)CBALSService;
  v14 = -[CBHIDService initWithHIDServiceClient:andIdentifier:](&v10, sel_initWithHIDServiceClient_andIdentifier_, v12, v11);
  if (v14)
  {
    v9 = (void *)IOHIDServiceClientCopyProperty(v14->super._service, CFSTR("SensorLocation"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = objc_msgSend(v9, "unsignedIntegerValue");
      v14->_desc = (NSString *)v3;
    }

    v8 = (id)IOHIDServiceClientCopyProperty(v14->super._service, CFSTR("Built-In"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v8, "BOOLValue");
      v14->super._builtIn = v4 & 1;
    }

    v7 = (id)IOHIDServiceClientCopyProperty(v14->super._service, CFSTR("ColorSupport"));
    if (!v7)
      v7 = (id)IOHIDServiceClientCopyProperty(v14->super._service, CFSTR("crgb"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v7, "BOOLValue");
      LOBYTE(v14->_lux) = v5 & 1;
    }

    -[CBALSService updateEventData](v14, "updateEventData");
  }

  return v14;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBALSService *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBALSService;
  -[CBHIDService dealloc](&v2, sel_dealloc);
}

- (void)resetEventData
{
  if (self->super._event)
  {
    CFRelease(self->super._event);
    self->super._event = 0;
  }
  *(&self->super._builtIn + 1) = 0;
  *(_QWORD *)&self->_colorSupport = 0;
  self->_x = 0.0;
  self->_y = 0.0;
  *(_QWORD *)&self->_validData = 0;
}

- (void)setEvent:(__IOHIDEvent *)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t inited;
  NSObject *logHandle;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *log;
  os_log_type_t type;
  uint64_t v27;
  NSObject *v28;
  uint8_t v29[7];
  os_log_type_t v30;
  os_log_t v31;
  uint8_t v32[7];
  os_log_type_t v33;
  os_log_t v34;
  os_log_type_t v35;
  os_log_t v36;
  os_log_type_t v37;
  os_log_t oslog;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t v43[15];
  os_log_type_t v44;
  NSObject *v45;
  __IOHIDEvent *v46;
  SEL v47;
  CBALSService *v48;
  uint8_t v49[16];
  uint8_t v50[48];
  uint8_t v51[32];
  uint8_t v52[56];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v48 = self;
  v47 = a2;
  v46 = a3;
  -[CBALSService resetEventData](self, "resetEventData");
  if (v46)
  {
    v48->super._event = v46;
    CFRetain(v48->super._event);
    IOHIDEventGetDoubleValue();
    *(_QWORD *)&v48->_validData = v3;
    if (*(double *)&v48->_validData < 0.0)
      *(_QWORD *)&v48->_validData = 0;
    if ((LOBYTE(v48->_lux) & 1) != 0)
    {
      if (*(double *)&v48->_validData == 0.0)
      {
        v31 = 0;
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
        v31 = logHandle;
        v30 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v31;
          v14 = v30;
          __os_log_helper_16_0_0(v29);
          _os_log_impl(&dword_1B5291000, v13, v14, "lux is 0, leave the values zeroed out", v29, 2u);
        }
      }
      else if (IOHIDEventGetIntegerValue() == 1)
      {
        IOHIDEventGetDoubleValue();
        *(_QWORD *)&v48->_validData = v4;
        IOHIDEventGetDoubleValue();
        v48->_y = v5;
        IOHIDEventGetDoubleValue();
        v42 = v6;
        IOHIDEventGetDoubleValue();
        v41 = v7;
        IOHIDEventGetDoubleValue();
        v40 = *(_QWORD *)&v8;
        v39 = *(double *)&v42 + *(double *)&v41 + v8;
        oslog = 0;
        if (v48->super._logHandle)
        {
          v24 = v48->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v23 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v23 = init_default_corebrightness_log();
          v24 = v23;
        }
        oslog = v24;
        v37 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v52, *(uint64_t *)&v39, v42, v41, v40);
          _os_log_debug_impl(&dword_1B5291000, oslog, v37, "sum:%f tempX=%f tempY=%f tempZ:%f", v52, 0x2Au);
        }
        if (v39 == 0.0)
        {
          v36 = 0;
          if (v48->super._logHandle)
          {
            v22 = v48->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v21 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v21 = init_default_corebrightness_log();
            v22 = v21;
          }
          v36 = v22;
          v35 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v51, v42, v41, v40);
            _os_log_error_impl(&dword_1B5291000, v36, v35, "invalid data - tristimulus values add up to zero. tempX=%f tempY=%f tempZ:%f", v51, 0x20u);
          }
        }
        else
        {
          *(double *)&v48->_colorSupport = *(double *)&v42 / v39;
          v48->_x = *(double *)&v41 / v39;
        }
      }
      else
      {
        v34 = 0;
        if (v48->super._logHandle)
        {
          v20 = v48->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v19 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v19 = init_default_corebrightness_log();
          v20 = v19;
        }
        v34 = v20;
        v33 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v17 = v34;
          v18 = v33;
          __os_log_helper_16_0_0(v32);
          _os_log_error_impl(&dword_1B5291000, v17, v18, "unknown color space", v32, 2u);
        }
      }
      if (v48->super._logHandle)
      {
        v12 = v48->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v11 = init_default_corebrightness_log();
        v12 = v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v50, *(_QWORD *)&v48->_validData, *(_QWORD *)&v48->_colorSupport, *(_QWORD *)&v48->_x, *(_QWORD *)&v48->_y);
        _os_log_debug_impl(&dword_1B5291000, v12, OS_LOG_TYPE_DEBUG, "update: lux=%f x=%f y=%f CCT=%f", v50, 0x2Au);
      }
    }
    else
    {
      if (v48->super._logHandle)
      {
        v10 = v48->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v9 = init_default_corebrightness_log();
        v10 = v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v49, *(_QWORD *)&v48->_validData);
        _os_log_debug_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEBUG, "update: lux=%f", v49, 0xCu);
      }
    }
    *(&v48->super._builtIn + 1) = 1;
  }
  else
  {
    v45 = 0;
    if (v48->super._logHandle)
    {
      v28 = v48->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v27 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v27 = init_default_corebrightness_log();
      v28 = v27;
    }
    v45 = v28;
    v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      log = v45;
      type = v44;
      __os_log_helper_16_0_0(v43);
      _os_log_impl(&dword_1B5291000, log, type, "nulling event", v43, 2u);
    }
  }
}

- (id)description
{
  id v2;
  double y;
  uint64_t v4;
  double x;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v10;
  int *v11;
  id v12;
  id v13;
  SEL v14;
  CBALSService *v15;

  v15 = self;
  v14 = a2;
  if (*(_QWORD *)&self->_CCT)

  v13 = 0;
  v12 = 0;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("id=0x%lX location=%lu internal=%d"), v15->super._registryID, v15->_desc, v15->super._builtIn);
  if (*(&v15->super._builtIn + 1))
  {
    if ((LOBYTE(v15->_lux) & 1) != 0)
    {
      v2 = objc_alloc(MEMORY[0x1E0CB3940]);
      y = v15->_y;
      v4 = *(_QWORD *)&v15->_colorSupport;
      x = v15->_x;
      v10 = *(_QWORD *)&v15->_validData;
      v13 = (id)objc_msgSend(v2, "initWithFormat:", CFSTR("lux=%f CCT=%f xy= %f | %f"), v10, *(_QWORD *)&y, v4, *(_QWORD *)&x);
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      v10 = *(_QWORD *)&v15->_validData;
      v13 = (id)objc_msgSend(v6, "initWithFormat:", CFSTR("lux=%f"), v10);
    }
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = objc_msgSend(v7, "initWithFormat:", CFSTR("service %@ | data %@"), v12, v13);
  v11 = &OBJC_IVAR___BLControl__clientDisplayMap;
  *(_QWORD *)&v15->_CCT = v8;

  return *(Class *)((char *)&v15->super.super.isa + v11[425]);
}

- (id)copyDataInDictionary
{
  _QWORD v3[17];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  SEL v12;
  CBALSService *v13;

  v13 = self;
  v12 = a2;
  v11 = 0;
  v10 = 0;
  v3[16] = 0x1E0CB3000uLL;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", self->_desc);
  v9 = 0;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v13->super._builtIn);
  v8 = 0;
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", *(&v13->super._builtIn + 1));
  v7 = 0;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", *(double *)&v13->_validData);
  v6 = 0;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v13->_y);
  v5 = 0;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", *(double *)&v13->_colorSupport);
  v4 = 0;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v13->_x);
  if (v10 && v9 && v8 && v7 && v6 && v5 && v4)
  {
    v3[15] = v3;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("location"), v9, CFSTR("internal"), v8, CFSTR("valid"), v7, CFSTR("lux"), v6, CFSTR("CCT"), v5, CFSTR("x"), v4, CFSTR("y"), 0);
  }

  return v11;
}

- (BOOL)updateEventData
{
  uint64_t v2;
  id v4;
  CFTypeRef cf;
  char v6;

  v6 = 0;
  cf = (CFTypeRef)IOHIDServiceClientCopyEvent();
  if (cf)
  {
    -[CBALSService setEvent:](self, "setEvent:", cf);
    CFRelease(cf);
    v6 = 1;
  }
  else
  {
    -[CBALSService resetEventData](self, "resetEventData");
    v4 = -[CBHIDService copyPropertyForKey:](self, "copyPropertyForKey:", CFSTR("CurrentLuxValue"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "doubleValue");
      *(_QWORD *)&self->_validData = v2;
      *(&self->super._builtIn + 1) = 1;
      v6 = 1;
    }

  }
  return v6 & 1;
}

- (BOOL)validData
{
  return *(&self->super._builtIn + 1);
}

- (double)lux
{
  return *(double *)&self->_validData;
}

- (BOOL)colorSupport
{
  return LOBYTE(self->_lux) & 1;
}

- (double)x
{
  return *(double *)&self->_colorSupport;
}

- (double)y
{
  return self->_x;
}

- (double)CCT
{
  return self->_y;
}

- (unint64_t)location
{
  return (unint64_t)self->_desc;
}

@end
