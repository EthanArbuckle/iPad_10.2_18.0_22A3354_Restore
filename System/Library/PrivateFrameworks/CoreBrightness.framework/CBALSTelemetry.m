@implementation CBALSTelemetry

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  BOOL v5;

  v5 = 0;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CBSystemDidWakeFromSleep")) & 1) != 0)
  {
    -[CBALSTelemetry handleSystemDidWakeFromSleepPropertyHandler:](self, "handleSystemDidWakeFromSleepPropertyHandler:", a3);
    return 1;
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CBSystemPrepareForSleep")) & 1) != 0)
  {
    -[CBALSTelemetry handleSystemPrepareForSleepPropertyHandler:](self, "handleSystemPrepareForSleepPropertyHandler:", a3);
    return 1;
  }
  return v5;
}

- (id)copyPropertyForKey:(id)a3
{
  double v3;
  uint64_t v5;
  void *v6;
  id v7;
  SEL v8;
  CBALSTelemetry *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CBAmbientLightTelemetry")) & 1) != 0)
  {
    v5 = 0;
    LODWORD(v3) = 1.0;
    return -[CBALSTelemetry copyALSSampleHistoryWithLength:frequency:lastTimestamp:](v9, "copyALSSampleHistoryWithLength:frequency:lastTimestamp:", 30, &v5, v3);
  }
  return v6;
}

- (CBALSTelemetry)initWithQueue:(id)a3
{
  os_log_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t inited;
  NSObject *logHandle;
  id v12;
  id v13;
  uint64_t v14;
  mach_timebase_info info;
  objc_super v16;
  id v17;
  SEL v18;
  CBALSTelemetry *v19;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CBALSTelemetry;
  v19 = -[CBModule initWithQueue:](&v16, sel_initWithQueue_, a3);
  if (v19)
  {
    v3 = os_log_create("com.apple.CoreBrightness.CBALSTelemetry", "Default");
    v19->super._logHandle = (OS_os_log *)v3;
    mach_timebase_info(&info);
    LODWORD(v4) = info.numer;
    LODWORD(v5) = info.denom;
    v19->_timeFactor = (double)v4 / (double)v5 * 0.000000001;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
    v19->_defaults = (NSUserDefaults *)v6;
    v7 = -[NSUserDefaults BOOLForKey:](v19->_defaults, "BOOLForKey:", CFSTR("CBAmbientLightTelemetry"));
    v19->_alsLiveOnTelemetryEnabled = v7;
    if (v19->_alsLiveOnTelemetryEnabled)
    {
      v14 = -[CBALSTelemetry getBootTimeInMicroSeconds](v19, "getBootTimeInMicroSeconds");
      if (v14 == objc_msgSend(-[NSUserDefaults objectForKey:](v19->_defaults, "objectForKey:", CFSTR("CBAmbientLightTelemetryBootTime")), "unsignedLongLongValue"))
      {
        v13 = -[NSUserDefaults objectForKey:](v19->_defaults, "objectForKey:", CFSTR("CBAmbientLightTelemetryLastTimestamp"));
        if (v13)
        {
          v8 = objc_msgSend(v13, "unsignedLongLongValue");
          v19->_lastTimestampInMicroseconds = v8;
        }
      }
      else
      {
        -[NSUserDefaults removeObjectForKey:](v19->_defaults, "removeObjectForKey:", CFSTR("CBAmbientLightTelemetryLastTimestamp"));
      }
      if (v19->super._logHandle)
      {
        logHandle = v19->super._logHandle;
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
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v21, v14, v19->_lastTimestampInMicroseconds);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "bootTime=%llu _lastTimestampInMicroseconds=%llu", v21, 0x16u);
      }
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v14);
      -[NSUserDefaults setObject:forKey:](v19->_defaults, "setObject:forKey:", v12, CFSTR("CBAmbientLightTelemetryBootTime"));

    }
    return v19;
  }
  else
  {

    return 0;
  }
}

- (void)start
{
  NSObject *timer;
  uint64_t handler;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  CBALSTelemetry *v8;
  SEL v9;
  CBALSTelemetry *v10;

  v10 = self;
  v9 = a2;
  if (self->_alsService && !v10->_timer && v10->_alsLiveOnTelemetryEnabled)
  {
    v10->_timer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v10->super._queue);
    if (v10->_timer)
    {
      dispatch_source_set_timer((dispatch_source_t)v10->_timer, 0, 0x29E8D60800uLL, 0x77359400uLL);
      timer = v10->_timer;
      handler = MEMORY[0x1E0C809B0];
      v4 = -1073741824;
      v5 = 0;
      v6 = __23__CBALSTelemetry_start__block_invoke;
      v7 = &unk_1E68E9E60;
      v8 = v10;
      dispatch_source_set_event_handler(timer, &handler);
      dispatch_activate((dispatch_object_t)v10->_timer);
    }
  }
}

uint64_t __23__CBALSTelemetry_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerFired", a1, a1);
}

- (void)stop
{
  if (self->_timer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_timer);
    dispatch_release((dispatch_object_t)self->_timer);
    self->_timer = 0;
  }
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBALSTelemetry *v4;

  v4 = self;
  v3 = a2;
  -[CBALSTelemetry stop](self, "stop");
  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v4->_defaults = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBALSTelemetry;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBALSTelemetry copyPropertyForKey:](self, "copyPropertyForKey:", a3, a4, a3, a2, self);
}

- (unint64_t)getBootTimeInMicroSeconds
{
  unint64_t v3;
  int v4;
  size_t v5[3];
  int v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5[2] = (size_t)self;
  v5[1] = (size_t)a2;
  *(_QWORD *)v7 = 0x1500000001;
  v5[0] = 16;
  if (sysctl(v7, 2u, &v3, v5, 0, 0) == -1)
    return 0;
  else
    return (unint64_t)((double)v4 + (double)v3 * 1000000.0);
}

- (BOOL)setALSService:(__IOHIDServiceClient *)a3
{
  id v4;

  if (self->_alsService)
    return 0;
  v4 = (id)IOHIDServiceClientCopyProperty(a3, CFSTR("ALSSensorType"));
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v4, "intValue") == 8 || objc_msgSend(v4, "intValue") == 9))
    {
      self->_alsService = a3;
    }

  }
  return self->_alsService != 0;
}

- (void)timerFired
{
  double v2;
  id v3;

  if (self->_alsLiveOnTelemetryEnabled)
  {
    LODWORD(v2) = 0.5;
    v3 = -[CBALSTelemetry copyALSSampleHistoryWithLength:frequency:lastTimestamp:](self, "copyALSSampleHistoryWithLength:frequency:lastTimestamp:", 20, &self->_lastTimestampInMicroseconds, v2);
    if (v3)
    {
      -[CBALSTelemetry sendNotificationForKey:andValue:](self, "sendNotificationForKey:andValue:", CFSTR("CBAmbientLightTelemetry"), v3);

    }
    -[CBALSTelemetry updateLastTimestampInDefaults](self, "updateLastTimestampInDefaults");
  }
}

- (id)copyALSSampleHistoryWithLength:(int)a3 frequency:(float)a4 lastTimestamp:(unint64_t *)a5
{
  double v5;
  double v6;
  double v7;
  void *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  CFTypeRef v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  os_log_t *v17;
  char *v18;
  char *v19;
  os_log_t *v20;
  char *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  os_log_t v39;
  os_log_type_t v40[4];
  uint8_t *v41;
  NSObject *v42;
  os_log_t v43;
  double v44;
  int *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  os_log_t v53;
  os_log_type_t v54[4];
  uint8_t *v55;
  NSObject *inited;
  os_log_t v57;
  id v58;
  id v59;
  id v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  int v64;
  uint64_t v65;
  unint64_t v66;
  os_log_t v67;
  os_log_type_t v68[4];
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  os_log_t log;
  os_log_type_t type[4];
  uint8_t *buf;
  uint64_t v75;
  uint64_t v76;
  void *context;
  char *v78;
  os_log_type_t v79;
  os_log_t v80;
  double v81;
  double v82;
  id v83;
  os_log_type_t v84;
  os_log_t oslog;
  double v86;
  double v87;
  int v88;
  unsigned int i;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  id v94;
  double v95;
  id v96;
  char v97;
  uint8_t v98[15];
  unsigned __int8 v99;
  uint8_t v100[15];
  unsigned __int8 v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t *v104;
  float v105;
  int v106;
  SEL v107;
  CBALSTelemetry *v108;
  _BYTE v109[48];
  uint8_t v110[40];
  uint64_t v111;

  v78 = &v97;
  v111 = *MEMORY[0x1E0C80C00];
  v108 = self;
  v107 = a2;
  v106 = a3;
  v105 = a4;
  v104 = a5;
  v103 = 0;
  v6 = std::__math::fmin[abi:ne180100]<float,unsigned int,0>(2, a4, v5);
  *(float *)&v6 = v6;
  v105 = *(float *)&v6;
  LODWORD(v7) = 1232348160;
  *(float *)&v6 = (float)((float)(1.0 / *(float *)&v6) * 1000000.0) + -50000.0;
  v102 = (unint64_t)*(float *)&v6;
  v106 = (int)std::__math::fmin[abi:ne180100]<int,unsigned int,0>(v106, 20, v6, v7);
  if (v108->_alsService)
  {
    v8 = (void *)MEMORY[0x1B5E4A8B0]();
    v9 = v78;
    context = v8;
    *((_DWORD *)v78 + 23) = 0;
    *((_DWORD *)v9 + 23) = 0;
    *((_QWORD *)v9 + 10) = 0;
    v10 = mach_continuous_time();
    v11 = v78;
    *((_QWORD *)v78 + 10) = v10;
    *((_QWORD *)v11 + 9) = 0;
    v12 = (id)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)v11 + 17) + 32), CFSTR("CBALSHistory"));
    v13 = v78;
    *((_QWORD *)v78 + 9) = v12;
    *((_QWORD *)v13 + 8) = 0;
    v14 = mach_continuous_time();
    v15 = v78;
    *((double *)v78 + 8) = (double)(v14 - *((_QWORD *)v78 + 10)) * *(double *)(*((_QWORD *)v78 + 17) + 56);
    if (*((_QWORD *)v15 + 9))
    {
      if (objc_msgSend(*((id *)v78 + 9), "length") == 684)
      {
        v65 = 0;
        *(_QWORD *)v78 = 0;
        *(double *)v78 = (double)mach_continuous_time() * *(double *)(*((_QWORD *)v78 + 17) + 56);
        v96 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
        objc_msgSend(v96, "timeIntervalSinceReferenceDate");
        v95 = v22;
        v94 = 0;
        v66 = 0x1E0C99000uLL;
        v94 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((int *)v78 + 31));
        v93 = 0;
        v93 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((int *)v78 + 31));
        v92 = 0;
        v92 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((int *)v78 + 31));
        v91 = 0;
        v91 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((int *)v78 + 31));
        v90 = 0;
        v90 = objc_msgSend(*((id *)v78 + 9), "bytes");
        for (i = 0; i < 0x14; ++i)
        {
          v88 = 0;
          v88 = (int)(*(_DWORD *)(v90 + 680) - (i + 1)) % 20;
          v64 = v88 >= 0 ? v88 : v88 + 20;
          v25 = std::__math::fmin[abi:ne180100]<int,unsigned int,0>(v64, 19, v23, v24);
          v23 = std::__math::fmax[abi:ne180100]<int,int,0>((int)v25, 0);
          v88 = (int)v23;
          if ((!**((_QWORD **)v78 + 14)
             || *(_QWORD *)(v90 + 34 * v88 + 4) < **((_QWORD **)v78 + 14) - *((_QWORD *)v78 + 12))
            && ((*(_BYTE *)(v90 + 34 * v88 + 28) & 1) == 0 || *(_BYTE *)(v90 + 34 * v88 + 31) != 65))
          {
            v87 = 0.0;
            v62 = 34;
            v87 = (double)*(unint64_t *)(v90 + 34 * v88 + 4) / 1000000.0;
            v86 = 0.0;
            v86 = v95 + v87 - *(double *)v78;
            v58 = v94;
            v61 = 0x1E0CB3000uLL;
            objc_msgSend(v94, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v86));
            v59 = v93;
            LODWORD(v26) = *(_DWORD *)(v90 + 34 * v88 + 12);
            objc_msgSend(v93, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26));
            v60 = v92;
            LODWORD(v27) = *(_DWORD *)(v90 + 34 * v88 + 20);
            objc_msgSend(v92, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27));
            v63 = v91;
            LODWORD(v28) = *(_DWORD *)(v90 + 34 * v88 + 24);
            objc_msgSend(v91, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28));
            oslog = 0;
            if (*(_QWORD *)(*((_QWORD *)v78 + 17) + 16))
            {
              v57 = *(os_log_t *)(*((_QWORD *)v78 + 17) + 16);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT)
                inited = _COREBRIGHTNESS_LOG_DEFAULT;
              else
                inited = init_default_corebrightness_log();
              v57 = inited;
            }
            oslog = v57;
            v84 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              v53 = oslog;
              *(_DWORD *)v54 = v84;
              *(double *)&v29 = *(float *)(v90 + 34 * v88 + 12);
              v55 = v110;
              __os_log_helper_16_0_4_4_0_8_0_4_0_8_0((uint64_t)v110, i, v29, v88, *(uint64_t *)&v86);
              _os_log_debug_impl(&dword_1B5291000, oslog, v84, "ALS samples history [%d]: lux = %f, index = %d, timestamp = %f", v110, 0x22u);
            }
            v30 = v78;
            ++*((_DWORD *)v78 + 23);
            **((_QWORD **)v30 + 14) = *(_QWORD *)(v90 + 34 * v88 + 4);
            if (objc_msgSend(v94, "count") >= (unint64_t)*((int *)v78 + 31))
              break;
          }
        }
        v52 = MEMORY[0x1E0CB37E8];
        v83 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v94, "count"));
        if (objc_msgSend(v83, "unsignedIntValue"))
        {
          v50 = objc_alloc(MEMORY[0x1E0C99D80]);
          v49 = v83;
          v46 = objc_msgSend((id)objc_msgSend(v94, "reverseObjectEnumerator"), "allObjects");
          v47 = objc_msgSend((id)objc_msgSend(v93, "reverseObjectEnumerator"), "allObjects");
          v48 = objc_msgSend((id)objc_msgSend(v92, "reverseObjectEnumerator"), "allObjects");
          v51 = &v38;
          v31 = objc_msgSend(v50, "initWithObjectsAndKeys:", v83, CFSTR("count"), v46, CFSTR("timestamp"), v47, CFSTR("lux"), v48, CFSTR("color_x"), objc_msgSend((id)objc_msgSend(v91, "reverseObjectEnumerator"), "allObjects"), CFSTR("color_y"), 0);
          *((_QWORD *)v78 + 13) = v31;
        }
        v44 = 0.0;
        v82 = 0.0;
        v32 = (double)(mach_continuous_time() - *((_QWORD *)v78 + 10));
        v33 = *((_QWORD *)v78 + 17);
        v45 = &OBJC_IVAR___BLControl__clientDisplayMap;
        v82 = v32 * *(double *)(v33 + 56);
        v81 = v44;
        v81 = (double)(mach_continuous_time() - *((_QWORD *)v78 + 10)) * *(double *)(*((_QWORD *)v78 + 17) + 56);
        v80 = 0;
        if (*(_QWORD *)(*((_QWORD *)v78 + 17) + 16))
        {
          v43 = *(os_log_t *)(*((_QWORD *)v78 + 17) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v42 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v42 = init_default_corebrightness_log();
          v43 = v42;
        }
        v80 = v43;
        v79 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v39 = v80;
          *(_DWORD *)v40 = v79;
          v34 = *((_DWORD *)v78 + 23);
          v35 = *(_QWORD *)(*((_QWORD *)v78 + 17) + 64);
          v36 = *((_QWORD *)v78 + 8);
          v41 = v109;
          __os_log_helper_16_0_5_4_0_8_0_8_0_8_0_8_0((uint64_t)v109, v34, v35, v36, *(uint64_t *)&v82, *(uint64_t *)&v81);
          _os_log_impl(&dword_1B5291000, v39, v40[0], "ALS samples history: itemsProcessed=%u newLastTimestamp=%lluus durations=(dataRetrieval=%fs partial=%fs overall=%fs)", v41, 0x30u);
        }
        *((_DWORD *)v78 + 9) = 0;
      }
      else
      {
        v19 = v78;
        *((_QWORD *)v78 + 3) = 0;
        if (*(_QWORD *)(*((_QWORD *)v19 + 17) + 16))
        {
          v71 = *(_QWORD *)(*((_QWORD *)v78 + 17) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v70 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v70 = init_default_corebrightness_log();
          v71 = v70;
        }
        v20 = (os_log_t *)v78;
        *((_QWORD *)v78 + 3) = v71;
        v99 = 16;
        if (os_log_type_enabled(v20[3], OS_LOG_TYPE_ERROR))
        {
          v67 = (os_log_t)*((_QWORD *)v78 + 3);
          *(_DWORD *)v68 = v99;
          v69 = v98;
          __os_log_helper_16_0_0(v98);
          _os_log_error_impl(&dword_1B5291000, v67, v68[0], "Unexpected size!", v98, 2u);
        }
        v21 = v78;
        *((_QWORD *)v78 + 18) = 0;
        *((_DWORD *)v21 + 9) = 1;
      }
    }
    else
    {
      v16 = v78;
      *((_QWORD *)v78 + 7) = 0;
      if (*(_QWORD *)(*((_QWORD *)v16 + 17) + 16))
      {
        v76 = *(_QWORD *)(*((_QWORD *)v78 + 17) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v75 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v75 = init_default_corebrightness_log();
        v76 = v75;
      }
      v17 = (os_log_t *)v78;
      *((_QWORD *)v78 + 7) = v76;
      v101 = 16;
      if (os_log_type_enabled(v17[7], OS_LOG_TYPE_ERROR))
      {
        log = (os_log_t)*((_QWORD *)v78 + 7);
        *(_DWORD *)type = v101;
        buf = v100;
        __os_log_helper_16_0_0(v100);
        _os_log_error_impl(&dword_1B5291000, log, type[0], "Unable to retrieve history from ALS!", v100, 2u);
      }
      v18 = v78;
      *((_QWORD *)v78 + 18) = 0;
      *((_DWORD *)v18 + 9) = 1;
    }
    objc_autoreleasePoolPop(context);
    if (!*((_DWORD *)v78 + 9))
      *((_QWORD *)v78 + 18) = *((_QWORD *)v78 + 13);
  }
  else
  {
    *((_QWORD *)v78 + 18) = 0;
  }
  return (id)*((_QWORD *)v78 + 18);
}

- (void)updateLastTimestampInDefaults
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", self->_lastTimestampInMicroseconds);
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v2, CFSTR("CBAmbientLightTelemetryLastTimestamp"));
  -[NSUserDefaults synchronize](self->_defaults, "synchronize");

}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (void)handleSystemDidWakeFromSleepPropertyHandler:(id)a3
{
  -[CBALSTelemetry timerFired](self, "timerFired");
}

- (void)handleSystemPrepareForSleepPropertyHandler:(id)a3
{
  -[CBALSTelemetry timerFired](self, "timerFired");
}

@end
