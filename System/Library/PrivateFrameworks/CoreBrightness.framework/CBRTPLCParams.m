@implementation CBRTPLCParams

- (BOOL)loadParametersFromService:(unsigned int)a3
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t inited;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  NSObject *v15;
  uint8_t v16[7];
  os_log_type_t v17;
  NSObject *v18;
  uint8_t v19[15];
  os_log_type_t v20;
  NSObject *v21;
  char v22;
  int v23;
  uint8_t v24[7];
  char v25;
  NSObject *v26;
  io_registry_entry_t v27;
  SEL v28;
  CBRTPLCParams *v29;

  v29 = self;
  v28 = a2;
  v27 = a3;
  if (a3)
  {
    v23 = 0;
    v22 = load_int_from_edt(v27, CFSTR("supports-rtplc"), &v23) & 1;
    if (v22 && v23)
    {
      v18 = 0;
      if (v29->_log)
      {
        v7 = v29->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v7 = inited;
      }
      v18 = v7;
      v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v18;
        v5 = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_impl(&dword_1B5291000, v4, v5, "RTPLC is supported", v16, 2u);
      }
      return 1;
    }
    else
    {
      v21 = 0;
      if (v29->_log)
      {
        v11 = v29->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v10 = init_default_corebrightness_log();
        v11 = v10;
      }
      v21 = v11;
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v21;
        v9 = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_impl(&dword_1B5291000, v8, v9, "RTPLC is not supported", v19, 2u);
      }
      return 0;
    }
  }
  else
  {
    v26 = 0;
    if (v29->_log)
    {
      v15 = v29->_log;
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
    v25 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      log = v26;
      type = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_error_impl(&dword_1B5291000, log, type, "Service is null", v24, 2u);
    }
    return 0;
  }
}

- (CBRTPLCParams)initWithService:(unsigned int)a3
{
  os_log_t v3;
  CBRTPLCRecoveryCurveParams *v4;
  uint64_t v5;
  objc_super v7;
  unsigned int v8;
  SEL v9;
  CBRTPLCParams *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CBRTPLCParams;
  v10 = -[CBRTPLCParams init](&v7, sel_init);
  if (!v10)
    return v10;
  v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "RTPLC");
  v10->_log = (OS_os_log *)v3;
  if (-[CBRTPLCParams loadParametersFromService:](v10, "loadParametersFromService:", v8))
  {
    v4 = [CBRTPLCRecoveryCurveParams alloc];
    v5 = -[CBRTPLCRecoveryCurveParams initWithService:](v4, "initWithService:", v8);
    v10->_recoveryCurve = (CBRTPLCRecoveryCurveParams *)v5;
    if (v10->_recoveryCurve)
      return v10;
  }

  v10 = 0;
  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBRTPLCParams *v4;

  v4 = self;
  v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBRTPLCParams;
  -[CBRTPLCParams dealloc](&v2, sel_dealloc);
}

- (CBRTPLCRecoveryCurveParams)recoveryCurve
{
  return self->_recoveryCurve;
}

@end
