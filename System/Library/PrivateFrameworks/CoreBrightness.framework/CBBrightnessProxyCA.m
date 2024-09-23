@implementation CBBrightnessProxyCA

- (id)brightnessNotificationPowerOff
{
  return self->_brightnessNotificationPowerOff;
}

- (id)brightnessNotificationSecureIndicatorOn
{
  return self->_brightnessNotificationSecureIndicatorOn;
}

- (id)brightnessNotificationSecureIndicatorOff
{
  return self->_brightnessNotificationSecureIndicatorOff;
}

- (id)brightnessNotificationRequestEDR
{
  return self->_brightnessNotificationRequestEDR;
}

- (id)brightnessNotificationAttached
{
  return (id)*MEMORY[0x1E0CD2968];
}

- (BOOL)setWhitePoint:(id)a3 rampDuration:(double)a4 error:(id *)a5
{
  float v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t inited;
  NSObject *logHandle;
  int i;
  float __b[9];
  char v13;
  id *v14;
  double v15;
  id v16;
  SEL v17;
  CBBrightnessProxyCA *v18;
  uint8_t v19[96];
  uint8_t v20[104];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  v13 = 0;
  memset(__b, 0, sizeof(__b));
  for (i = 0; i < (unint64_t)objc_msgSend(v16, "count"); ++i)
  {
    objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", i), "floatValue");
    __b[i] = v5;
  }
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
  if (os_signpost_enabled(logHandle))
  {
    __os_log_helper_16_0_9_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v20, COERCE__INT64(__b[0]), COERCE__INT64(__b[1]), COERCE__INT64(__b[2]), COERCE__INT64(__b[3]), COERCE__INT64(__b[4]), COERCE__INT64(__b[5]), COERCE__INT64(__b[6]), COERCE__INT64(__b[7]), COERCE__INT64(__b[8]));
    _os_signpost_emit_with_name_impl(&dword_1B5291000, logHandle, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "setWhitePoint", "[(%f;%f;%f),(%f;%f;%f),(%f;%f;%f)]",
      v20,
      0x5Cu);
  }
  if (-[CBBrightnessProxyCA allowUpdates](v18, "allowUpdates"))
    v13 = -[CABrightnessControl setWhitePoint:rampDuration:error:](v18->_brightnessControl, "setWhitePoint:rampDuration:error:", __b, v14, v15) & 1;
  if (v18->_logHandle)
  {
    v8 = v18->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v7 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v7 = init_default_corebrightness_log();
    v8 = v7;
  }
  if (os_signpost_enabled(v8))
  {
    __os_log_helper_16_0_9_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v19, COERCE__INT64(__b[0]), COERCE__INT64(__b[1]), COERCE__INT64(__b[2]), COERCE__INT64(__b[3]), COERCE__INT64(__b[4]), COERCE__INT64(__b[5]), COERCE__INT64(__b[6]), COERCE__INT64(__b[7]), COERCE__INT64(__b[8]));
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "setWhitePoint", "[(%f;%f;%f),(%f;%f;%f),(%f;%f;%f)]",
      v19,
      0x5Cu);
  }
  return v13 & 1;
}

- (BOOL)allowUpdates
{
  return self->_allowUpdates;
}

- (void)setAmbient:(float)a3
{
  double v3;

  if (-[CBBrightnessProxyCA allowUpdates](self, "allowUpdates"))
  {
    *(float *)&v3 = a3;
    -[CABrightnessControl setAmbient:](self->_brightnessControl, "setAmbient:", v3);
  }
}

- (void)setSDRBrightness:(float)a3
{
  double v3;

  if (-[CBBrightnessProxyCA allowUpdates](self, "allowUpdates"))
  {
    *(float *)&v3 = a3;
    -[CABrightnessControl setSDRBrightness:](self->_brightnessControl, "setSDRBrightness:", v3);
  }
}

- (void)setPotentialHeadroom:(float)a3
{
  double v3;

  if (-[CBBrightnessProxyCA allowUpdates](self, "allowUpdates"))
  {
    *(float *)&v3 = a3;
    -[CABrightnessControl setPotentialHeadroom:](self->_brightnessControl, "setPotentialHeadroom:", v3);
  }
}

- (void)setLowAmbientAdaptation:(float)a3
{
  double v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v3 = a3;
    -[CABrightnessControl setLowAmbientAdaptation:](self->_brightnessControl, "setLowAmbientAdaptation:", v3);
  }
}

- (void)setIndicatorBrightness:(float)a3
{
  double v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v3 = a3;
    -[CABrightnessControl setIndicatorBrightness:](self->_brightnessControl, "setIndicatorBrightness:", v3);
  }
}

- (void)setHighAmbientAdaptation:(float)a3
{
  double v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v3 = a3;
    -[CABrightnessControl setHighAmbientAdaptation:](self->_brightnessControl, "setHighAmbientAdaptation:", v3);
  }
}

- (void)setHeadroom:(float)a3
{
  double v3;

  if (-[CBBrightnessProxyCA allowUpdates](self, "allowUpdates"))
  {
    *(float *)&v3 = a3;
    -[CABrightnessControl setHeadroom:](self->_brightnessControl, "setHeadroom:", v3);
  }
}

- (void)setContrastEnhancer:(float)a3
{
  -[CABrightnessControl setContrastEnhancer:](self->_brightnessControl, "setContrastEnhancer:", *(double *)&a3);
}

- (void)setBrightnessLimit:(float)a3
{
  double v3;

  if (-[CBBrightnessProxyCA allowUpdates](self, "allowUpdates"))
  {
    *(float *)&v3 = a3;
    -[CABrightnessControl setBrightnessLimit:](self->_brightnessControl, "setBrightnessLimit:", v3);
  }
}

- (unint64_t)getDisplayType
{
  return -[CABrightnessControl displayType](self->_brightnessControl, "displayType", a2, self);
}

- (unint64_t)CBDispTypeIntegrated
{
  return self->_CBDispTypeIntegrated;
}

- (BOOL)commitBrightness:(id *)a3
{
  NSObject *v4;
  os_signpost_type_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v14[16];
  unint64_t v15;
  char v16;
  NSObject *v17;
  char v18;
  uint8_t v19[16];
  unint64_t v20;
  char v21;
  NSObject *v22;
  id *v23;
  SEL v24;
  CBBrightnessProxyCA *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = 0;
  if (self->_logHandle)
  {
    logHandle = v25->_logHandle;
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
  v21 = 1;
  v20 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v22;
    type = v21;
    spid = v20;
    __os_log_helper_16_0_0(v19);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "commitBrightness", (const char *)&unk_1B546AB41, v19, 2u);
  }
  v18 = 0;
  if (-[CBBrightnessProxyCA allowUpdates](v25, "allowUpdates"))
    v18 = -[CABrightnessControl commitBrightness:](v25->_brightnessControl, "commitBrightness:", v23) & 1;
  v17 = 0;
  if (v25->_logHandle)
  {
    v8 = v25->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v7 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v7 = init_default_corebrightness_log();
    v8 = v7;
  }
  v17 = v8;
  v16 = 2;
  v15 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v8))
  {
    v4 = v17;
    v5 = v16;
    v6 = v15;
    __os_log_helper_16_0_0(v14);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v4, v5, v6, "commitBrightness", (const char *)&unk_1B546AB41, v14, 2u);
  }
  return v18 & 1;
}

- (BOOL)commitBrightness:(id *)a3 withBlock:(id)a4
{
  NSObject *v5;
  os_signpost_type_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v15[16];
  unint64_t v16;
  char v17;
  NSObject *v18;
  char v19;
  uint8_t v20[8];
  unint64_t v21;
  char v22;
  NSObject *v23;
  id v24;
  id *v25;
  SEL v26;
  CBBrightnessProxyCA *v27;

  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  v23 = 0;
  if (self->_logHandle)
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
  v23 = logHandle;
  v22 = 1;
  v21 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v23;
    type = v22;
    spid = v21;
    __os_log_helper_16_0_0(v20);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "commitBrightness withBlock", (const char *)&unk_1B546AB41, v20, 2u);
  }
  v19 = 0;
  if (-[CBBrightnessProxyCA allowUpdates](v27, "allowUpdates"))
    v19 = -[CABrightnessControl commitBrightness:withBlock:](v27->_brightnessControl, "commitBrightness:withBlock:", v25, v24) & 1;
  v18 = 0;
  if (v27->_logHandle)
  {
    v9 = v27->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v8 = init_default_corebrightness_log();
    v9 = v8;
  }
  v18 = v9;
  v17 = 2;
  v16 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v9))
  {
    v5 = v18;
    v6 = v17;
    v7 = v16;
    __os_log_helper_16_0_0(v15);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v5, v6, v7, "commitBrightness withBlock", (const char *)&unk_1B546AB41, v15, 2u);
  }
  return v19 & 1;
}

- (CBBrightnessProxyCA)initWithCABrightnessControl:(id)a3
{
  os_log_t v3;
  CABrightnessControl *v4;
  objc_super v6;
  id v7;
  SEL v8;
  CBBrightnessProxyCA *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CBBrightnessProxyCA;
  v9 = -[CBBrightnessProxyCA init](&v6, sel_init);
  if (v9)
  {
    v9->_brightnessNotificationRequestEDR = (id)*MEMORY[0x1E0CD2980];
    v9->_brightnessRequestEDRHeadroom = (NSString *)*MEMORY[0x1E0CD29A8];
    v9->_brightnessRequestRampDuration = (NSString *)*MEMORY[0x1E0CD29B0];
    v9->_brightnessSecureIndicatorType = (NSString *)*MEMORY[0x1E0CD29A0];
    v9->_brightnessSecureIndicatorActiveCount = (NSString *)*MEMORY[0x1E0CD2988];
    v9->_brightnessNotificationSecureIndicatorOn = (id)*MEMORY[0x1E0CD2998];
    v9->_brightnessNotificationSecureIndicatorOff = (id)*MEMORY[0x1E0CD2990];
    v9->_brightnessNotificationPowerOn = (id)*MEMORY[0x1E0CD2978];
    v9->_brightnessNotificationPowerOff = (id)*MEMORY[0x1E0CD2970];
    v9->_CBDispTypeIntegrated = 0;
    v9->_CBDispTypeExternal = 1;
    v9->_CBDispTypeWireless = 2;
    v9->_CBDispTypeVirtual = 3;
    v9->_CBDispTypeDFR = 4;
    v3 = os_log_create("com.apple.CoreBrightness.CBBrightnessProxyCA", "default");
    v9->_logHandle = (OS_os_log *)v3;
    v4 = (CABrightnessControl *)v7;
    v9->_brightnessControl = v4;
    v9->_allowUpdates = 1;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBBrightnessProxyCA *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)

  v2.receiver = v4;
  v2.super_class = (Class)CBBrightnessProxyCA;
  -[CBBrightnessProxyCA dealloc](&v2, sel_dealloc);
}

- (void)registerForNotifications:(id)a3 withBlock:(id)a4
{
  -[CABrightnessControl registerForNotifications:withBlock:](self->_brightnessControl, "registerForNotifications:withBlock:", a3, a4, a4, a3, a2, self);
}

- (void)unregisterNotificationBlocks
{
  -[CABrightnessControl unregisterNotificationBlocks](self->_brightnessControl, "unregisterNotificationBlocks", a2, self);
}

- (void)setNotificationQueue:(id)a3
{
  -[CABrightnessControl setNotificationQueue:](self->_brightnessControl, "setNotificationQueue:", a3);
}

- (BOOL)isBrightnessAvailable
{
  return -[CABrightnessControl brightnessAvailable](self->_brightnessControl, "brightnessAvailable", a2, self) & 1;
}

- (BOOL)isWhitePointAvailable
{
  return -[CABrightnessControl whitePointAvailable](self->_brightnessControl, "whitePointAvailable", a2, self) & 1;
}

- (BOOL)isWhitePointD50XYZ
{
  return -[CABrightnessControl whitePointD50XYZ](self->_brightnessControl, "whitePointD50XYZ", a2, self) & 1;
}

- (id)getBrightnessCapabilities
{
  return (id)-[CABrightnessControl brightnessCapabilities](self->_brightnessControl, "brightnessCapabilities", a2, self);
}

- (unsigned)getDisplayId
{
  return -[CABrightnessControl displayId](self->_brightnessControl, "displayId", a2, self);
}

- (unint64_t)getVendorId
{
  return -[CABrightnessControl vendorId](self->_brightnessControl, "vendorId", a2, self);
}

- (unint64_t)getProductId
{
  return -[CABrightnessControl productId](self->_brightnessControl, "productId", a2, self);
}

- (id)getUUID
{
  return (id)-[CABrightnessControl uuid](self->_brightnessControl, "uuid", a2, self);
}

- (BOOL)forceCommitBrightness:(id *)a3 withBlock:(id)a4
{
  NSObject *v5;
  os_signpost_type_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v19[8];
  unint64_t v20;
  char v21;
  NSObject *v22;
  uint8_t v23[15];
  char v24;
  NSObject *v25;
  char v26;
  uint8_t v27[8];
  unint64_t v28;
  char v29;
  NSObject *v30;
  id v31;
  id *v32;
  SEL v33;
  CBBrightnessProxyCA *v34;

  v34 = self;
  v33 = a2;
  v32 = a3;
  v31 = a4;
  v30 = 0;
  if (self->_logHandle)
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
  v30 = logHandle;
  v29 = 1;
  v28 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v30;
    type = v29;
    spid = v28;
    __os_log_helper_16_0_0(v27);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "forceCommitBrightness", (const char *)&unk_1B546AB41, v27, 2u);
  }
  v26 = 0;
  if (-[CBBrightnessProxyCA allowUpdates](v34, "allowUpdates"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26 = -[CABrightnessControl forceCommitBrightness:withBlock:](v34->_brightnessControl, "forceCommitBrightness:withBlock:", v32, v31) & 1;
    }
    else
    {
      v25 = 0;
      if (v34->_logHandle)
      {
        v13 = v34->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v12 = init_default_corebrightness_log();
        v13 = v12;
      }
      v25 = v13;
      v24 = 16;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v10 = v25;
        v11 = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_error_impl(&dword_1B5291000, v10, v11, "CABrightnessControl forceCommitBrightness SPI does not exist -> use normal commitBrightness.", v23, 2u);
      }
      v26 = -[CABrightnessControl commitBrightness:withBlock:](v34->_brightnessControl, "commitBrightness:withBlock:", v32, v31) & 1;
    }
  }
  v22 = 0;
  if (v34->_logHandle)
  {
    v9 = v34->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v8 = init_default_corebrightness_log();
    v9 = v8;
  }
  v22 = v9;
  v21 = 2;
  v20 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v9))
  {
    v5 = v22;
    v6 = v21;
    v7 = v20;
    __os_log_helper_16_0_0(v19);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v5, v6, v7, "forceCommitBrightness", (const char *)&unk_1B546AB41, v19, 2u);
  }
  return v26 & 1;
}

- (void)setBrightnessControlDisabled:(BOOL)a3
{
  const char *v3;
  uint64_t inited;
  NSObject *logHandle;
  BOOL v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CABrightnessControl setBrightnessControlDisabled:](self->_brightnessControl, "setBrightnessControlDisabled:", a3);
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
    if (v6)
      v3 = "Disabled";
    else
      v3 = "Enabled";
    __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "%s brightness control updates.", v8, 0xCu);
  }
}

- (id)brightnessNotificationPowerOn
{
  return self->_brightnessNotificationPowerOn;
}

- (NSString)brightnessSecureIndicatorType
{
  return self->_brightnessSecureIndicatorType;
}

- (NSString)brightnessSecureIndicatorActiveCount
{
  return self->_brightnessSecureIndicatorActiveCount;
}

- (NSString)brightnessRequestEDRHeadroom
{
  return self->_brightnessRequestEDRHeadroom;
}

- (NSString)brightnessRequestRampDuration
{
  return self->_brightnessRequestRampDuration;
}

- (unint64_t)CBDispTypeExternal
{
  return self->_CBDispTypeExternal;
}

- (unint64_t)CBDispTypeWireless
{
  return self->_CBDispTypeWireless;
}

- (unint64_t)CBDispTypeVirtual
{
  return self->_CBDispTypeVirtual;
}

- (unint64_t)CBDispTypeDFR
{
  return self->_CBDispTypeDFR;
}

- (void)setAllowUpdates:(BOOL)a3
{
  self->_allowUpdates = a3;
}

@end
