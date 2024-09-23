@implementation CBEDRModulator

- (CBEDRModulator)init
{
  os_log_t v2;
  objc_super v4;
  SEL v5;
  CBEDRModulator *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBEDRModulator;
  v6 = -[CBEDRModulator init](&v4, sel_init);
  if (v6)
  {
    v2 = os_log_create("com.apple.CoreBrightness.EDR", "modulator");
    v6->_logHandle = (OS_os_log *)v2;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBEDRModulator *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBEDRModulator;
  -[CBEDRModulator dealloc](&v2, sel_dealloc);
}

- (BOOL)isConfigured
{
  NSUInteger v3;
  BOOL v5;

  v5 = 0;
  if (self->_enabled)
  {
    if (self->_headroomDataPointsConfig)
    {
      if (self->_nitsDataPointsConfig)
      {
        v3 = -[NSArray count](self->_headroomDataPointsConfig, "count");
        if (v3 == -[NSArray count](self->_nitsDataPointsConfig, "count"))
          return 1;
      }
    }
  }
  return v5;
}

- (BOOL)modulatedHeadroom:(float *)a3 forHeadroom:(float)a4 forSDRNits:(float)a5
{
  float v5;
  double v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v17;
  uint64_t inited;
  NSObject *logHandle;
  float v20;
  float v21;
  float v22;
  NSUInteger v23;
  uint64_t v24;
  float v25;
  char v30;
  uint8_t v31[40];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  *a3 = a4;
  if (-[CBEDRModulator isConfigured](self, "isConfigured"))
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", 0), "floatValue");
    v5 = *(float *)&v6;
    *(float *)&v6 = a5;
    if (a5 > v5)
    {
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", -[NSArray count](self->_nitsDataPointsConfig, "count") - 1), "floatValue");
      v8 = *(float *)&v9;
      *(float *)&v9 = a5;
      if (a5 < v8)
      {
        v24 = 0;
        v23 = -[NSArray count](self->_nitsDataPointsConfig, "count", v9) - 1;
        while (v23 - v24 > 1)
        {
          objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", (v23 - v24) / 2 + v24), "floatValue");
          if (a5 > v11)
            v24 += (v23 - v24) / 2;
          else
            v23 = (v23 - v24) / 2 + v24;
        }
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", v24), "floatValue");
        v20 = v12;
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_headroomDataPointsConfig, "objectAtIndexedSubscript:", v24), "floatValue");
        v21 = v13;
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_nitsDataPointsConfig, "objectAtIndexedSubscript:", v23), "floatValue");
        v22 = v14;
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_headroomDataPointsConfig, "objectAtIndexedSubscript:", v23), "floatValue");
        v25 = linear_interpolation(a5, v20, v21, v22, v15);
      }
      else
      {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_headroomDataPointsConfig, "objectAtIndexedSubscript:", -[NSArray count](self->_nitsDataPointsConfig, "count", v9) - 1), "floatValue");
        v25 = v10;
      }
    }
    else
    {
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_headroomDataPointsConfig, "objectAtIndexedSubscript:", 0, v6), "floatValue");
      v25 = v7;
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v31, COERCE__INT64(a4), COERCE__INT64(a5), COERCE__INT64(v25));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "headroom = %f | SDR = %f | modulated cap = %f", v31, 0x20u);
    }
    if (a4 >= v25)
      v17 = v25;
    else
      v17 = a4;
    *a3 = v17;
    v30 = 1;
  }
  else
  {
    v30 = 0;
  }
  return v30 & 1;
}

- (id)description
{
  const char *v2;

  if (self->_enabled)
    v2 = "enabled";
  else
    v2 = "disabled";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CBEDRModulator: state = %s\n nits datapoints:    %@\n headroom datapoints:%@"), v2, self->_nitsDataPointsConfig, self->_headroomDataPointsConfig);
}

- (NSArray)headroomDataPointsConfig
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHeadroomDataPointsConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)nitsDataPointsConfig
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNitsDataPointsConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
