@implementation GrimaldiAPDSEventSource

- (NSString)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (GrimaldiAPDSEventSource)init
{
  os_log_t v2;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint8_t v7[15];
  char v8;
  NSObject *v9;
  objc_super v10;
  SEL v11;
  GrimaldiAPDSEventSource *v12;

  v12 = self;
  v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)GrimaldiAPDSEventSource;
  v12 = -[GrimaldiAPDSEventSource init](&v10, sel_init);
  if (v12)
  {
    v2 = os_log_create((const char *)CBGrimaldiModuleName, "APDSEventSource");
    v12->_logHandle = (OS_os_log *)v2;
    if (v12->_logHandle)
    {
      if (!ApplePhotonDetectorServicesOpen())
        return v12;
    }
    else
    {
      v9 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v9 = inited;
      v8 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = v9;
        type = v8;
        __os_log_helper_16_0_0(v7);
        _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v7, 2u);
      }
    }

    return 0;
  }
  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  GrimaldiAPDSEventSource *v4;

  v4 = self;
  v3 = a2;
  if (self->_apdsHandle)
    ApplePhotonDetectorServicesClose();

  v2.receiver = v4;
  v2.super_class = (Class)GrimaldiAPDSEventSource;
  -[GrimaldiAPDSEventSource dealloc](&v2, sel_dealloc);
}

- (int)requestEventOn:(id)a3 withNsamples:(unsigned __int8)a4 withCallback:(id)a5
{
  NSObject *v6;
  os_log_type_t v7;
  uint64_t inited;
  NSObject *logHandle;
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
  NSObject *log;
  os_log_type_t type;
  uint64_t v22;
  NSObject *v23;
  uint8_t v24[7];
  char v25;
  NSObject *v26;
  uint8_t v27[15];
  char v28;
  NSObject *v29;
  void *v30;
  os_log_type_t v31;
  os_log_t v32;
  uint8_t v33[15];
  char v34;
  NSObject *v35;
  const void **v36;
  uint8_t v37[15];
  char v38;
  NSObject *v39;
  int v40;
  id v41;
  unsigned __int8 v42;
  id v43;
  SEL v44;
  GrimaldiAPDSEventSource *v45;
  uint8_t v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v45 = self;
  v44 = a2;
  v43 = a3;
  v42 = a4;
  v41 = a5;
  v40 = 0;
  if (a5)
  {
    v36 = (const void **)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    if (v36)
    {
      *v36 = _Block_copy(v41);
      if (*v36)
      {
        v30 = malloc_type_calloc(1uLL, 0x28uLL, 0x1090040653BC2AFuLL);
        if (v30)
        {
          *(_QWORD *)v30 = malloc_type_calloc(v42, 4uLL, 0x100004052888210uLL);
          *((_QWORD *)v30 + 1) = malloc_type_calloc(v42, 4uLL, 0x100004052888210uLL);
          *((_QWORD *)v30 + 2) = malloc_type_calloc(v42, 8uLL, 0x100004000313F17uLL);
          *((_QWORD *)v30 + 3) = malloc_type_calloc(v42, 1uLL, 0x100004077774924uLL);
          if (*(_QWORD *)v30 && *((_QWORD *)v30 + 1) && *((_QWORD *)v30 + 2) && *((_QWORD *)v30 + 3))
          {
            *((_DWORD *)v30 + 8) = 0;
            *((_BYTE *)v30 + 36) = v42;
            return ApplePhotonDetectorServicesGetLuxAsync();
          }
          v26 = 0;
          if (v45->_logHandle)
          {
            logHandle = v45->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              inited = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              inited = init_default_corebrightness_log();
            logHandle = inited;
          }
          v26 = logHandle;
          v25 = 16;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            v6 = v26;
            v7 = v25;
            __os_log_helper_16_0_0(v24);
            _os_log_error_impl(&dword_1B5291000, v6, v7, "Failed to allocate memory for luxInfo member", v24, 2u);
          }
          v40 = -536870211;
          free(*(void **)v30);
          free(*((void **)v30 + 1));
          free(*((void **)v30 + 2));
          free(*((void **)v30 + 3));
          free(v30);
        }
        else
        {
          v29 = 0;
          if (v45->_logHandle)
          {
            v13 = v45->_logHandle;
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
          v28 = 16;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v10 = v29;
            v11 = v28;
            __os_log_helper_16_0_0(v27);
            _os_log_error_impl(&dword_1B5291000, v10, v11, "Failed to allocate memory for luxInfo", v27, 2u);
          }
          v40 = -536870211;
        }
        _Block_release(*v36);
      }
      else
      {
        v32 = 0;
        if (v45->_logHandle)
        {
          v15 = v45->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v14 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v14 = init_default_corebrightness_log();
          v15 = v14;
        }
        v32 = v15;
        v31 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v47, (uint64_t)v41);
          _os_log_error_impl(&dword_1B5291000, v32, v31, "Failed to copy block from %p", v47, 0xCu);
        }
        v40 = -536870211;
      }
      free(v36);
      return v40;
    }
    v35 = 0;
    if (v45->_logHandle)
    {
      v19 = v45->_logHandle;
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
      _os_log_error_impl(&dword_1B5291000, v16, v17, "Failed to allocate memory for APDSCallbackWrapper", v33, 2u);
    }
    return -536870211;
  }
  else
  {
    v39 = 0;
    if (v45->_logHandle)
    {
      v23 = v45->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v22 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v22 = init_default_corebrightness_log();
      v23 = v22;
    }
    v39 = v23;
    v38 = 16;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      log = v39;
      type = v38;
      __os_log_helper_16_0_0(v37);
      _os_log_error_impl(&dword_1B5291000, log, type, "Callback is NULL", v37, 2u);
    }
    return -536870911;
  }
}

- (int)getCoexFlags:(unsigned int *)a3
{
  return ApplePhotonDetectorServicesGetCoex();
}

- (int)getGlobalCorrectionFactor:(double *)a3
{
  return ApplePhotonDetectorServicesGetGlobalCorrectionFactor();
}

@end
