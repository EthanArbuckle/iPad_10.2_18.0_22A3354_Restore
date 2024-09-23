@implementation CBRamp

+ (id)newLinearRampWithWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7
{
  CBRamp *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CBRamp *v13;

  v7 = [CBRamp alloc];
  *(float *)&v8 = a3;
  *(float *)&v9 = a4;
  *(float *)&v10 = a5;
  *(float *)&v11 = a6;
  v13 = -[CBRamp initWithOrigin:target:length:frequency:identifier:](v7, "initWithOrigin:target:length:frequency:identifier:", a7, v8, v9, v10, v11);
  -[CBRamp setRampProgressCallback:](v13, "setRampProgressCallback:", &__block_literal_global_8);
  return v13;
}

float __73__CBRamp_newLinearRampWithWithOrigin_target_length_frequency_identifier___block_invoke(float a1, uint64_t a2, _QWORD *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  NSObject *v23;
  uint8_t v27[56];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3[2])
  {
    v23 = a3[2];
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v23 = inited;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v20 = objc_msgSend(a3, "identifier");
    objc_msgSend(a3, "originalValue");
    *(double *)&v21 = v3;
    objc_msgSend(a3, "targetValue");
    __os_log_helper_16_2_4_8_64_8_0_8_0_8_0((uint64_t)v27, v20, v21, COERCE__INT64(v4), COERCE__INT64((float)(a1 * 100.0)));
    _os_log_debug_impl(&dword_1B5291000, v23, OS_LOG_TYPE_DEBUG, "%@ ramp clocked: %f -> %f - %f %%", v27, 0x2Au);
  }
  objc_msgSend(a3, "targetValue");
  v19 = v5;
  objc_msgSend(a3, "originalValue");
  v6 = *(float *)&v7;
  *(float *)&v7 = v19;
  if (v19 >= v6)
  {
    objc_msgSend(a3, "originalValue", v7);
    v15 = v11;
    objc_msgSend(a3, "targetValue");
    v16 = v12;
    objc_msgSend(a3, "originalValue");
    return v15 + (float)((float)(v16 - v13) * a1);
  }
  else
  {
    objc_msgSend(a3, "originalValue", v7);
    v17 = v8;
    objc_msgSend(a3, "originalValue");
    v18 = v9;
    objc_msgSend(a3, "targetValue");
    return v17 - (float)((float)(v18 - v10) * a1);
  }
}

+ (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CBRamp)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid initialiser for %@."), +[CBRamp className](CBRamp, "className"));
  return 0;
}

- (CBRamp)initWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7
{
  return -[CBRamp initWithOrigin:target:length:frequency:identifier:properties:](self, "initWithOrigin:target:length:frequency:identifier:properties:", a7, 0, *(double *)&a3, *(double *)&a4, *(double *)&a5, *(double *)&a6);
}

- (CBRamp)initWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7 properties:(id)a8
{
  uint64_t v8;
  uint64_t v9;
  os_log_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  id v15;
  mach_timebase_info info;
  id v17;
  objc_super v18;
  id v19;
  id v20;
  float v21;
  float v22;
  float v23;
  float v24;
  SEL v25;
  CBRamp *v26;

  v26 = self;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v20 = a7;
  v19 = a8;
  v18.receiver = self;
  v18.super_class = (Class)CBRamp;
  v26 = -[CBRamp init](&v18, sel_init);
  if (v26)
  {
    v8 = objc_msgSend(v20, "copy");
    v26->_identifier = (NSString *)v8;
    v26->_originalValue = v24;
    v26->_targetValue = v23;
    v26->_length = v22;
    v26->_frequency = v21;
    v9 = objc_msgSend(v19, "copy");
    v26->_properties = (NSDictionary *)v9;
    v17 = 0;
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = objc_msgSend(+[CBRamp className](CBRamp, "className"), "cStringUsingEncoding:");
    v17 = (id)objc_msgSend(v15, "initWithFormat:", CFSTR("%s.%s.%s"), "com.apple.CoreBrightness", v14, -[NSString cStringUsingEncoding:](v26->_identifier, "cStringUsingEncoding:", 1));
    v10 = os_log_create((const char *)objc_msgSend(v17, "cStringUsingEncoding:", 1), "default");
    v26->_logHandle = (OS_os_log *)v10;

    info = 0;
    mach_timebase_info(&info);
    LODWORD(v12) = info.denom;
    LODWORD(v11) = info.numer;
    v26->_sMachTimebaseFactor = (double)v11 / (double)v12 * 0.000000001;
    v26->_startTime = (double)mach_absolute_time() * v26->_sMachTimebaseFactor;
    v26->_currentTimestamp = v26->_startTime;
    v26->_startAbsoluteTime = CFAbsoluteTimeGetCurrent();
    v26->_currentAbsoluteTimestamp = v26->_startAbsoluteTime;
  }
  return v26;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBRamp *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)

  if (v4->_rampProgressCallback)
    _Block_release(v4->_rampProgressCallback);

  v2.receiver = v4;
  v2.super_class = (Class)CBRamp;
  -[CBRamp dealloc](&v2, sel_dealloc);
}

- (id)description
{
  SEL v3;
  CBRamp *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CBRamp: %@ | %f -> %f (%f) | %f sec | %f Hz"), self->_identifier, self->_originalValue, self->_targetValue, self->_currentValue, self->_length, self->_frequency, a2, self);
}

- (void)clockRamp
{
  -[CBRamp clockRamp:](self, "clockRamp:", (double)mach_absolute_time() * self->_sMachTimebaseFactor);
}

- (void)clockRamp:(double)a3
{
  float v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[7];
  os_log_type_t v11;
  os_log_t v12;
  os_log_type_t type;
  os_log_t oslog;
  double v15;
  double v16;
  SEL v17;
  CBRamp *v18;
  uint8_t v19[56];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = self;
  v17 = a2;
  v16 = a3;
  if (self->_isFinished)
    __assert_rtn("-[CBRamp clockRamp:]", "CBRamp.m", 97, "!_isFinished");
  if (!v18->_rampProgressCallback)
    __assert_rtn("-[CBRamp clockRamp:]", "CBRamp.m", 98, "_rampProgressCallback");
  v18->_currentTimestamp = v16;
  v15 = 0.0;
  v15 = (v18->_currentTimestamp - v18->_startTime) / v18->_length;
  v18->_currentAbsoluteTimestamp = v18->_startAbsoluteTime + v18->_currentTimestamp - v18->_startTime;
  v15 = fmin(v15, 1.0);
  oslog = 0;
  if (v18->_logHandle)
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
  oslog = logHandle;
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v19, *(uint64_t *)&v15, *(_QWORD *)&v18->_startTime, *(_QWORD *)&v18->_currentTimestamp, COERCE__INT64(v18->_currentTimestamp - v18->_startTime), COERCE__INT64(v18->_length));
    _os_log_debug_impl(&dword_1B5291000, oslog, type, "progress: %f, start = %f, current = %f, diff = %f, length = %f", v19, 0x34u);
  }
  if (v15 < 0.0)
    __assert_rtn("-[CBRamp clockRamp:]", "CBRamp.m", 111, "progress >= MIN_RAMP_PROGRESS");
  if (v15 > 1.0)
    __assert_rtn("-[CBRamp clockRamp:]", "CBRamp.m", 112, "progress <= MAX_RAMP_PROGRESS");
  v3 = v15;
  v18->_currentValue = (*((float (**)(float))v18->_rampProgressCallback + 2))(v3);
  if (v15 >= 1.0)
  {
    v18->_isFinished = 1;
    v12 = 0;
    if (v18->_logHandle)
    {
      v7 = v18->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    v12 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v12;
      v5 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_impl(&dword_1B5291000, v4, v5, "Ramp has been finished", v10, 2u);
    }
  }
}

- (void)updateTargetValue:(float)a3
{
  self->_targetValue = a3;
}

- (id)rampProgressCallback
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setRampProgressCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (float)length
{
  return self->_length;
}

- (float)frequency
{
  return self->_frequency;
}

- (float)targetValue
{
  return self->_targetValue;
}

- (float)originalValue
{
  return self->_originalValue;
}

- (float)currentValue
{
  return self->_currentValue;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)currentTimestamp
{
  return self->_currentTimestamp;
}

- (double)startAbsoluteTime
{
  return self->_startAbsoluteTime;
}

- (double)currentAbsoluteTimestamp
{
  return self->_currentAbsoluteTimestamp;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)properties
{
  return self->_properties;
}

@end
