@implementation CBABCurve

- (CBABCurve)init
{
  objc_super v3;
  SEL v4;
  CBABCurve *v5;

  v5 = self;
  v4 = a2;
  self->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBABCurve", "default");
  v3.receiver = v5;
  v3.super_class = (Class)CBABCurve;
  v5 = -[CBABCurve init](&v3, sel_init);
  if (v5)
  {
    v5->pref.e1 = 0.0;
    v5->pref.e2 = 262.5;
    v5->pref.bl1 = 0.1;
    v5->pref.bl2 = 0.625;
    v5->pref.eThresh = 78.5;
    v5->pref.maximumBrightness = 1.0;
    v5->pref.minimumBrightness = 0.001;
    v5->currentLux = 300.0;
    v5->_scaleFactor = 1.0;
    v5->shouldClampLowLux = 0;
  }
  return v5;
}

- (CBABCurve)initWithUUID:(id)a3
{
  return -[CBABCurve initWithUUID:vendorID:andProductID:](self, "initWithUUID:vendorID:andProductID:", a3, 0);
}

- (CBABCurve)initWithUUID:(id)a3 vendorID:(id)a4 andProductID:(id)a5
{
  void *context;
  CBABCurve *v7;
  CBABCurveConfiguration *v8;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  v8 = objc_alloc_init(CBABCurveConfiguration);
  -[CBABCurveConfiguration setVendorID:](v8, "setVendorID:", a4);
  -[CBABCurveConfiguration setProductID:](v8, "setProductID:", a5);
  -[CBABCurveConfiguration setUuid:](v8, "setUuid:", a3);
  v7 = -[CBABCurve initWithConfiguration:](self, "initWithConfiguration:", v8);
  objc_autoreleasePoolPop(context);
  return v7;
}

- (CBABCurve)initWithConfiguration:(id)a3
{
  float v3;
  const char *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  float v11;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t inited;
  NSObject *v38;
  uint8_t v39[15];
  os_log_type_t v40;
  os_log_t v41;
  os_log_type_t v42;
  os_log_t v43;
  os_log_type_t v44;
  os_log_t v45;
  uint64_t v46;
  uint8_t v47[7];
  os_log_type_t v48;
  os_log_t v49;
  os_log_type_t v50;
  os_log_t v51;
  os_log_type_t v52;
  os_log_t v53;
  uint8_t v54[15];
  os_log_type_t v55;
  os_log_t v56;
  os_log_type_t v57;
  os_log_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  char v63;
  os_log_type_t type;
  os_log_t oslog;
  float v66;
  objc_super v67;
  id v68;
  SEL v69;
  void *v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  uint8_t v76[32];
  uint8_t v77[16];
  uint8_t v78[16];
  uint8_t v79[16];
  uint8_t v80[16];
  uint8_t v81[24];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v70 = self;
  v69 = a2;
  v68 = a3;
  self->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBABCurve", "default");
  v67.receiver = v70;
  v67.super_class = (Class)CBABCurve;
  v70 = -[CBABCurve init](&v67, sel_init);
  if (v70)
  {
    *((float *)v70 + 3) = 1.0;
    *((_DWORD *)v70 + 2) = 981668463;
    *((_DWORD *)v70 + 9) = 1133903872;
    *((float *)v70 + 14) = 1.0;
    objc_msgSend((id)objc_msgSend(v68, "minBrightness"), "floatValue");
    v66 = v3;
    *((_BYTE *)v70 + 44) = float_equal(v3, 1.0);
    oslog = 0;
    if (*((_QWORD *)v70 + 6))
    {
      v38 = *((_QWORD *)v70 + 6);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v38 = inited;
    }
    oslog = v38;
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      if ((*((_BYTE *)v70 + 44) & 1) != 0)
        v4 = "YES";
      else
        v4 = "NO";
      __os_log_helper_16_2_2_8_0_8_32((uint64_t)v81, COERCE__INT64(v66), (uint64_t)v4);
      _os_log_impl(&dword_1B5291000, oslog, type, "Panel min brightness from curve configuration: %f; should clamp low lux: %s",
        v81,
        0x16u);
    }
    v63 = 1;
    v62 = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", CFSTR("DisplayPreferences"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = (id)objc_msgSend(v62, "objectForKey:", objc_msgSend(v68, "uuid"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v60 = (id)objc_msgSend(v61, "objectForKey:", CFSTR("AutoBrightnessCurve"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v59 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("Version"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = objc_msgSend(v59, "unsignedIntValue");
            *((_QWORD *)v70 + 8) = v36;
            if (v36 == 1)
            {
              v58 = 0;
              if (*((_QWORD *)v70 + 6))
              {
                v35 = *((_QWORD *)v70 + 6);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v34 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v34 = init_default_corebrightness_log();
                v35 = v34;
              }
              v58 = v35;
              v57 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_0_1_8_0((uint64_t)v80, *((_QWORD *)v70 + 8));
                _os_log_impl(&dword_1B5291000, v58, v57, "upgrading curve from version %lu", v80, 0xCu);
              }
              if ((objc_msgSend(v68, "isBuiltin") & 1) != 0 && (objc_msgSend(v68, "isEnergySaving") & 1) != 0)
                v63 = 0;
              else
                *((_QWORD *)v70 + 8) = 2;
            }
            else if (v36 != 2)
            {
              v56 = 0;
              if (*((_QWORD *)v70 + 6))
              {
                v33 = *((_QWORD *)v70 + 6);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                  v32 = _COREBRIGHTNESS_LOG_DEFAULT;
                else
                  v32 = init_default_corebrightness_log();
                v33 = v32;
              }
              v56 = v33;
              v55 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v30 = v56;
                v31 = v55;
                __os_log_helper_16_0_0(v54);
                _os_log_error_impl(&dword_1B5291000, v30, v31, "curve version mismatch", v54, 2u);
              }
              v63 = 0;
            }
          }
          else
          {
            v63 = 0;
          }
          v59 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("Lux1"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v59, "floatValue");
            *((_DWORD *)v70 + 6) = v5;
          }
          else
          {
            v63 = 0;
          }
          v59 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("Lux2"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v59, "floatValue");
            *((_DWORD *)v70 + 7) = v6;
          }
          else
          {
            v63 = 0;
          }
          v59 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("Backlight1"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v59, "floatValue");
            *((_DWORD *)v70 + 4) = v7;
          }
          else
          {
            v63 = 0;
          }
          v59 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("Backlight2"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v59, "floatValue");
            *((_DWORD *)v70 + 5) = v8;
          }
          else
          {
            v63 = 0;
          }
          v59 = (id)objc_msgSend(v60, "objectForKey:", CFSTR("LuxThreshold"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v59, "floatValue");
            *((_DWORD *)v70 + 8) = v9;
          }
          else
          {
            v63 = 0;
          }
        }
        else
        {
          v53 = 0;
          if (*((_QWORD *)v70 + 6))
          {
            v29 = *((_QWORD *)v70 + 6);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v28 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v28 = init_default_corebrightness_log();
            v29 = v28;
          }
          v53 = v29;
          v52 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v79, objc_msgSend(v68, "productID"));
            _os_log_impl(&dword_1B5291000, v53, v52, "no curve preferences for the display %{public}@", v79, 0xCu);
          }
          v63 = 0;
        }
      }
      else
      {
        v51 = 0;
        if (*((_QWORD *)v70 + 6))
        {
          v27 = *((_QWORD *)v70 + 6);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v26 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v26 = init_default_corebrightness_log();
          v27 = v26;
        }
        v51 = v27;
        v50 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v78, objc_msgSend(v68, "productID"));
          _os_log_impl(&dword_1B5291000, v51, v50, "no preferences for the display %{public}@", v78, 0xCu);
        }
        v63 = 0;
      }
    }
    else
    {
      v49 = 0;
      if (*((_QWORD *)v70 + 6))
      {
        v25 = *((_QWORD *)v70 + 6);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v24 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v24 = init_default_corebrightness_log();
        v25 = v24;
      }
      v49 = v25;
      v48 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v49;
        v23 = v48;
        __os_log_helper_16_0_0(v47);
        _os_log_impl(&dword_1B5291000, v22, v23, "no display preferences", v47, 2u);
      }
      v63 = 0;
    }

    if ((v63 & 1) != 0)
    {
      v75 = *((_DWORD *)v70 + 6);
      v74 = *((_DWORD *)v70 + 7);
      v73 = *((_DWORD *)v70 + 4);
      v72 = *((_DWORD *)v70 + 5);
      v71 = *((_DWORD *)v70 + 8);
    }
    else
    {
      *((_QWORD *)v70 + 8) = 2;
      *((_DWORD *)v70 + 6) = 0;
      *((_DWORD *)v70 + 7) = 1132675072;
      *((_DWORD *)v70 + 8) = 1117585408;
      if ((objc_msgSend(v68, "isBuiltin") & 1) != 0 && (objc_msgSend(v68, "isEnergySaving") & 1) != 0)
      {
        objc_msgSend((id)objc_msgSend(v68, "maxBrightness"), "doubleValue");
        *(double *)&v46 = v10;
        v11 = 0.107505 * (500.0 / v10);
        *((float *)v70 + 4) = v11;
        *(float *)&v10 = 0.341785 * (500.0 / *(double *)&v46);
        *((_DWORD *)v70 + 5) = LODWORD(v10);
        v45 = 0;
        if (*((_QWORD *)v70 + 6))
        {
          v21 = *((_QWORD *)v70 + 6);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v20 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v20 = init_default_corebrightness_log();
          v21 = v20;
        }
        v45 = v21;
        v44 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v77, v46);
          _os_log_impl(&dword_1B5291000, v45, v44, "using default curve based on max brighness %f", v77, 0xCu);
        }
      }
      else if (objc_msgSend((id)objc_msgSend(v68, "vendorID"), "unsignedIntegerValue") == 1552
             && (objc_msgSend((id)objc_msgSend(v68, "productID"), "unsignedIntegerValue") == 44606
              || objc_msgSend((id)objc_msgSend(v68, "productID"), "unsignedIntegerValue") == 44602))
      {
        v43 = 0;
        if (*((_QWORD *)v70 + 6))
        {
          v19 = *((_QWORD *)v70 + 6);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v18 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v18 = init_default_corebrightness_log();
          v19 = v18;
        }
        v43 = v19;
        v42 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_msgSend(v68, "productID");
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v76, v17, objc_msgSend(v68, "vendorID"));
          _os_log_impl(&dword_1B5291000, v43, v42, "using default curve configuration (productID=%@ | vendorID=%@)", v76, 0x16u);
        }
        *((_DWORD *)v70 + 4) = 1032174594;
        *((_DWORD *)v70 + 5) = 1057803469;
      }
      else
      {
        v41 = 0;
        if (*((_QWORD *)v70 + 6))
        {
          v16 = *((_QWORD *)v70 + 6);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v15 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v15 = init_default_corebrightness_log();
          v16 = v15;
        }
        v41 = v16;
        v40 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v41;
          v14 = v40;
          __os_log_helper_16_0_0(v39);
          _os_log_impl(&dword_1B5291000, v13, v14, "using default curve configuration", v39, 2u);
        }
        *((_DWORD *)v70 + 4) = 1036831949;
        *((float *)v70 + 5) = 0.625;
      }
    }
  }
  return (CBABCurve *)v70;
}

- (id)description
{
  SEL v3;
  CBABCurve *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nCurrent Lux: %f\nPreferences\ne1: %f, e2: %f \nbl1: %f, bl2: %f\nminBrightness: %f\nmaxBrightness: %f scaler: %f"), self->currentLux, self->pref.e1, self->pref.e2, self->pref.bl1, self->pref.bl2, self->pref.minimumBrightness, self->pref.maximumBrightness, self->_scaleFactor, a2, self);
}

- (void)setLinearBrightnessMin:(float)a3 andMax:(float)a4
{
  self->pref.maximumBrightness = a4;
  self->pref.minimumBrightness = a3;
}

- (BOOL)setLux:(float)a3
{
  float v3;
  float v4;
  float v5;
  uint64_t v7;
  NSObject *v8;
  float v9;
  float currentLux;
  float v11;
  uint64_t v12;
  NSObject *logHandle;
  uint64_t inited;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  float v18;
  char v20;
  uint8_t v21[32];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  if (a3 >= 0.0)
  {
    if (a3 <= 5000.0)
    {
      if (self->shouldClampLowLux && a3 < 1.0)
      {
        v18 = 1.0;
        if (self->_logHandle)
        {
          logHandle = self->_logHandle;
        }
        else
        {
          v12 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          logHandle = v12;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v22, 0x3FF0000000000000);
          _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Cap lux on %f (lower bound)\n", v22, 0xCu);
        }
      }
    }
    else
    {
      v18 = 5000.0;
      if (self->_logHandle)
      {
        v15 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v15 = inited;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v23, 5000);
        _os_log_debug_impl(&dword_1B5291000, v15, OS_LOG_TYPE_DEBUG, "Cap lux on %d\n", v23, 8u);
      }
    }
    self->currentLux = v18;
    -[CBABCurve getScaledBL2](self, "getScaledBL2");
    v9 = v3;
    -[CBABCurve getScaledBL1](self, "getScaledBL1");
    v11 = (float)(v9 - v4) / (float)(self->pref.e2 - self->pref.e1);
    currentLux = self->currentLux;
    -[CBABCurve getScaledBL1](self, "getScaledBL1");
    self->mappedBrightness = v5 + (float)(v11 * currentLux);
    self->mappedBrightness = fmaxf(self->mappedBrightness, self->pref.minimumBrightness);
    self->mappedBrightness = fminf(self->mappedBrightness, self->pref.maximumBrightness);
    if (self->_logHandle)
    {
      v8 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v21, COERCE__INT64(self->currentLux), COERCE__INT64(self->mappedBrightness), COERCE__INT64(self->_scaleFactor));
      _os_log_debug_impl(&dword_1B5291000, v8, OS_LOG_TYPE_DEBUG, "setLux=%f, mappedBrightness=%f, scaler=%f", v21, 0x20u);
    }
    v20 = 1;
  }
  else
  {
    if (self->_logHandle)
    {
      v17 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v16 = init_default_corebrightness_log();
      v17 = v16;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v24, COERCE__INT64(v18));
      _os_log_error_impl(&dword_1B5291000, v17, OS_LOG_TYPE_ERROR, "lux value (%f) is < 0", v24, 0xCu);
    }
    v20 = 0;
  }
  return v20 & 1;
}

- (float)getLux
{
  return self->currentLux;
}

- (float)getLinearBrightness
{
  return self->mappedBrightness;
}

- (float)getScaledBL1
{
  return self->pref.bl1 * self->_scaleFactor;
}

- (float)getScaledBL2
{
  return self->pref.bl2 * self->_scaleFactor;
}

- (void)setScaledBL1:(float)a3
{
  self->pref.bl1 = a3 / self->_scaleFactor;
}

- (void)setScaledBL2:(float)a3
{
  self->pref.bl2 = a3 / self->_scaleFactor;
}

- (void)updateALSParametersForDisplayBrightness:(float)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  float v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  float v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *logHandle;
  uint64_t inited;
  NSObject *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  uint8_t v40[64];
  uint8_t v41[64];
  uint8_t v42[48];
  uint8_t v43[16];
  uint8_t v44[8];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (self->currentLux <= 5000.0)
  {
    if (self->shouldClampLowLux && self->currentLux < 1.0)
    {
      self->currentLux = 1.0;
      if (self->_logHandle)
      {
        logHandle = self->_logHandle;
      }
      else
      {
        v26 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v26;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v43, 0x3FF0000000000000);
        _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Cap lux on %f (lower bound)\n", v43, 0xCu);
      }
    }
  }
  else
  {
    self->currentLux = 5000.0;
    if (self->_logHandle)
    {
      v29 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v29 = inited;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v44, 5000);
      _os_log_debug_impl(&dword_1B5291000, v29, OS_LOG_TYPE_DEBUG, "Cap lux on %d\n", v44, 8u);
    }
  }
  v3 = (float)(a3 * 500.0) * 72.0 / (500.0 - (self->currentLux - 72.0 * self->currentLux));
  v31 = v3;
  v4 = (float)(a3 * 500.0) * 3.0 / (500.0 - (self->currentLux - 3.0 * self->currentLux));
  v30 = v4;
  v5 = (float)(a3 * 500.0) / (500.0 - (self->currentLux - 3.0 * self->currentLux));
  v6 = (float)(a3 * 500.0) / (500.0 - (self->currentLux - 72.0 * self->currentLux));
  v34 = (float)(v31 - v6) / 500.0;
  v32 = (float)(v30 - v5) / 500.0;
  if (self->_logHandle)
  {
    v25 = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v24 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v24 = init_default_corebrightness_log();
    v25 = v24;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v42, COERCE__INT64(v34), COERCE__INT64(v32), 0x3F6A16D3F97A4B02, 0x3F3730BC6BFAED56);
    _os_log_debug_impl(&dword_1B5291000, v25, OS_LOG_TYPE_DEBUG, "slope_min: %f slope_max: %f definemax: %f definemin: %f\n", v42, 0x2Au);
  }
  v33 = fmaxf(v32, 0.00035386);
  v35 = fmaxf(v34, 0.0031847);
  if (self->currentLux <= self->pref.eThresh)
  {
    -[CBABCurve getScaledBL2](self, "getScaledBL2");
    v37 = fmaxf(fminf((float)(v12 - a3) / (float)(self->pref.e2 - self->currentLux), v35), v33);
    *(float *)&v13 = a3 + (float)(v37 * (float)(self->pref.e1 - self->currentLux));
    -[CBABCurve setScaledBL1:](self, "setScaledBL1:", v13);
    *(float *)&v14 = a3 + (float)(v37 * (float)(self->pref.e2 - self->currentLux));
    -[CBABCurve setScaledBL2:](self, "setScaledBL2:", v14);
    if (self->_logHandle)
    {
      v19 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v18 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v18 = init_default_corebrightness_log();
      v19 = v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      -[CBABCurve getScaledBL1](self, "getScaledBL1");
      *(double *)&v17 = v15;
      -[CBABCurve getScaledBL2](self, "getScaledBL2");
      __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v40, v17, COERCE__INT64(v16), COERCE__INT64(self->_scaleFactor), COERCE__INT64(v37), COERCE__INT64(a3), COERCE__INT64(self->currentLux));
      _os_log_impl(&dword_1B5291000, v19, OS_LOG_TYPE_INFO, "BELOW Bl1: %f BL2: %f (scaler=%f) slope: %f linBT: %f lux: %f\n", v40, 0x3Eu);
    }
  }
  else
  {
    -[CBABCurve getScaledBL1](self, "getScaledBL1");
    v36 = fmaxf(fminf((float)(a3 - *(float *)&v7) / (float)(self->currentLux - self->pref.e1), v35), v33);
    if (self->currentLux < 150.0)
    {
      self->pref.e2 = 150.0;
      *(float *)&v7 = a3 + (float)(v36 * (float)(self->pref.e2 - self->currentLux));
    }
    else
    {
      self->pref.e2 = self->currentLux;
      *(float *)&v7 = a3;
    }
    -[CBABCurve setScaledBL2:](self, "setScaledBL2:", v7);
    v23 = self->pref.e1 - self->pref.e2;
    -[CBABCurve getScaledBL2](self, "getScaledBL2");
    *(float *)&v9 = v8 + (float)(v36 * v23);
    -[CBABCurve setScaledBL1:](self, "setScaledBL1:", v9);
    if (self->_logHandle)
    {
      v22 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v21 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v21 = init_default_corebrightness_log();
      v22 = v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      -[CBABCurve getScaledBL1](self, "getScaledBL1");
      *(double *)&v20 = v10;
      -[CBABCurve getScaledBL2](self, "getScaledBL2");
      __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v41, v20, COERCE__INT64(v11), COERCE__INT64(v36), COERCE__INT64(a3), COERCE__INT64(self->currentLux));
      _os_log_debug_impl(&dword_1B5291000, v22, OS_LOG_TYPE_DEBUG, "ABOVE Bl1: %f BL2: %f slope: %f linBT: %f lux: %f\n", v41, 0x34u);
    }
  }
}

- (void)resetToDefaultState
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[7];
  os_log_type_t v7;
  NSObject *v8;
  SEL v9;
  CBABCurve *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  if (self->_logHandle)
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
    _os_log_impl(&dword_1B5291000, log, type, (const char *)&unk_1B546AB41, v6, 2u);
  }
  v10->pref.e1 = 0.0;
  v10->pref.e2 = 262.5;
  v10->pref.bl1 = 0.1;
  v10->pref.bl2 = 0.625;
  v10->pref.eThresh = 78.5;
}

- (id)copyUserPrefState
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(float *)&v2 = self->pref.bl1;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2), CFSTR("Backlight1"));
  *(float *)&v3 = self->pref.bl2;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3), CFSTR("Backlight2"));
  *(float *)&v4 = self->pref.e1;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("Lux1"));
  *(float *)&v5 = self->pref.e2;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("Lux2"));
  *(float *)&v6 = self->pref.eThresh;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("LuxThreshold"));
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_version), CFSTR("Version"));
  return v8;
}

- (void)setSavedPrefences:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;

  if (a3)
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Lux1")), "floatValue");
    self->pref.e1 = v3;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Lux2")), "floatValue");
    self->pref.e2 = v4;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Backlight1")), "floatValue");
    self->pref.bl1 = v5;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Backlight2")), "floatValue");
    self->pref.bl2 = v6;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LuxThreshold")), "floatValue");
    self->pref.eThresh = v7;
  }
}

- (unint64_t)version
{
  return self->_version;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

@end
