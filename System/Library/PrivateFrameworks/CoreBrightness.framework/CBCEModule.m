@implementation CBCEModule

- (id)setModelInputWithXtalkArr:(id)a3 alsArr:(id)a4 alsRatioArr:(id)a5 X:(double)a6 Y:(double)a7 Z:(double)a8 CCT:(double)a9 u:(double)a10 v:(double)a11 lux:(double)a12 nits:(double)a13 iTime:(double)a14 gain:(double)a15 x:(double)a16 y:(double)a17 a:(double)a18 b:(double)a19 ceInput:(id)a20
{
  id v20;
  id v21;
  uint64_t inited;
  NSObject *v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  uint64_t v27;
  NSMutableDictionary *v28;
  uint64_t v29;
  NSMutableDictionary *currentInputDict;
  uint64_t v31;
  NSObject *logHandle;
  void *context;
  int k;
  int j;
  int i;
  int v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  id v58;
  id v59;
  SEL v60;
  CBCEModule *v61;
  uint8_t v62[16];
  uint8_t v63[24];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v61 = self;
  v60 = a2;
  v59 = a3;
  v58 = a4;
  v57 = a5;
  v56 = a6;
  v55 = a7;
  v54 = a8;
  v53 = a9;
  v52 = a10;
  v51 = a11;
  v50 = a12;
  v49 = a13;
  v48 = a14;
  v47 = a15;
  v46 = a16;
  v45 = a17;
  v44 = a18;
  v43 = a19;
  v42 = a20;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v41 = &unk_1E6917588;
  v40 = 0;
  v20 = objc_alloc((Class)getMLMultiArrayClass());
  v39 = (void *)objc_msgSend(v20, "initWithShape:dataType:error:", v41, 65568, &v40);
  if (v40)
  {
    if (v61->super._logHandle)
    {
      logHandle = v61->super._logHandle;
    }
    else
    {
      v31 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v31;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v63, v40);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "Error generating the input for CE: %@", v63, 0xCu);
    }
  }
  v37 = 0;
  for (i = 0; i < 5; ++i)
  {
    ++v37;
    objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(v59, "objectAtIndexedSubscript:", i));
    currentInputDict = v61->_currentInputDict;
    v29 = objc_msgSend(v59, "objectAtIndexedSubscript:", i);
    -[NSMutableDictionary setValue:forKey:](currentInputDict, "setValue:forKey:", v29, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xtalk%d"), i));
  }
  for (j = 0; j < 5; ++j)
  {
    ++v37;
    objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(v58, "objectAtIndexedSubscript:", j));
    v28 = v61->_currentInputDict;
    v27 = objc_msgSend(v58, "objectAtIndexedSubscript:", j);
    -[NSMutableDictionary setValue:forKey:](v28, "setValue:forKey:", v27, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("als%d"), j));
  }
  for (k = 0; k < 5; ++k)
  {
    ++v37;
    objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(v57, "objectAtIndexedSubscript:", k));
    v26 = v61->_currentInputDict;
    v25 = objc_msgSend(v57, "objectAtIndexedSubscript:", k);
    -[NSMutableDictionary setValue:forKey:](v26, "setValue:forKey:", v25, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alsRatio%d"), k));
  }
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44));
  v38 = v37 + 14;
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56), CFSTR("X"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55), CFSTR("Y"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54), CFSTR("Z"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53), CFSTR("CCT"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52), CFSTR("uPrime"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51), CFSTR("vPrime"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50), CFSTR("lux"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49), CFSTR("nits"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48), CFSTR("iTime"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47), CFSTR("gain"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46), CFSTR("x"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45), CFSTR("y"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44), CFSTR("a"));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43), CFSTR("b"));
  if (v61->super._logHandle)
  {
    v24 = v61->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v24 = inited;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v39);
    _os_log_impl(&dword_1B5291000, v24, OS_LOG_TYPE_DEFAULT, "mlmArrIn: %@", v62, 0xCu);
  }
  if (v38 != 29)
    __assert_rtn("-[CBCEModule setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:]", "CBCEModule.m", 304, "j == FEATURE_CNT");
  v42 = (id)objc_msgSend(v42, "initWithInput:", v39);
  v21 = v39;
  objc_autoreleasePoolPop(context);
  return v42;
}

- (id)copyInference:(id)a3
{
  float v3;
  float v4;
  float v5;
  double v6;
  float v7;
  float v8;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t inited;
  NSObject *v15;
  uint64_t v16;
  NSObject *logHandle;
  void *context;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  SEL v28;
  CBCEModule *v29;
  uint8_t v30[32];
  uint8_t v31[16];
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29 = self;
  v28 = a2;
  v27 = a3;
  v26 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v27;
    context = (void *)MEMORY[0x1B5E4A8B0](-[NSMutableDictionary setObject:forKey:](v29->_alsEvents, "setObject:forKey:", v27, objc_msgSend(v27, "serviceRegistryID")));
    v24 = 0;
    if (v29->_overriding)
      v29->_currentInput = v29->_overriddenInput;
    else
      v29->_currentInput = -[CBCEModule setModelInputWithAlsEvent:ceInput:](v29, "setModelInputWithAlsEvent:ceInput:", v25, v29->_currentInput);
    v23 = (void *)objc_msgSend(v29->_model, "predictionFromFeatures:error:", v29->_currentInput, &v24);
    if (v24)
    {
      if (v29->super._logHandle)
      {
        logHandle = v29->super._logHandle;
      }
      else
      {
        v16 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v16;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v32, v24);
        _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "prediction_error: %@", v32, 0xCu);
      }
    }
    if (v29->super._logHandle)
    {
      v15 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v15 = inited;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v29->_currentInputDict);
      _os_log_impl(&dword_1B5291000, v15, OS_LOG_TYPE_DEFAULT, "[V2.1] Input features: %@", v31, 0xCu);
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "featureValueForName:", CFSTR("strength_output")), "multiArrayValue"), "objectAtIndexedSubscript:"), "floatValue");
    v22 = v3;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "featureValueForName:", CFSTR("uncertainty")), "multiArrayValue"), "objectAtIndexedSubscript:", 0), "floatValue");
    v21 = v4;
    v5 = v22 * 100.0;
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(uint64_t)llroundf(v5) / 100.0);
    v6 = 1.0 - v21;
    *(float *)&v6 = 1.0 - v21;
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v20, CFSTR("CEStrength"), v19, CFSTR("CEConfidence"), 0);
    objc_msgSend(v20, "floatValue");
    objc_msgSend(v25, "setStrength:");
    objc_msgSend(v19, "floatValue");
    objc_msgSend(v25, "setConfidence:");
    if (v29->super._logHandle)
    {
      v13 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v12 = init_default_corebrightness_log();
      v13 = v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromClass(-[CBCEModule modelClass](v29, "modelClass"));
      objc_msgSend(v25, "strength");
      *(double *)&v11 = v7;
      objc_msgSend(v25, "confidence");
      __os_log_helper_16_2_3_8_64_8_0_8_0((uint64_t)v30, (uint64_t)v10, v11, COERCE__INT64(v8));
      _os_log_impl(&dword_1B5291000, v13, OS_LOG_TYPE_DEFAULT, "[%@]strength: %.2f, confidence: %f", v30, 0x20u);
    }
    if (v29->_overriding)
      -[CBCEModule sendNotificationForKey:withValue:](v29, "sendNotificationForKey:withValue:", CFSTR("CEOverride"), v29->_currentInputDict);
    -[CBCEModule sendNotificationForKey:withValue:](v29, "sendNotificationForKey:withValue:", CFSTR("CEInput"), v29->_currentInputDict);
    -[CBCEModule sendNotificationForKey:withValue:](v29, "sendNotificationForKey:withValue:", CFSTR("CEOutput"), v26);
    objc_autoreleasePoolPop(context);
  }
  -[NSMutableDictionary setDictionary:](v29->_currentOutputDict, "setDictionary:", v26);
  return v26;
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (id)setModelInputWithAlsEvent:(id)a3 ceInput:(id)a4
{
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  float v9;
  float v10;
  float v11;
  double v12;
  void *context;
  float v14[15];
  uint64_t v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _DWORD v24[15];
  _QWORD v25[16];
  double v26;
  float v27[30];
  double v28;
  float v29[30];
  double v30;
  double v31;
  int k;
  id v33;
  int j;
  id v35;
  int v36;
  int i;
  id v38;
  _BYTE __b[137];
  id v40;
  id v41;
  SEL v42;
  CBCEModule *v43;

  v43 = self;
  v42 = a2;
  v41 = a3;
  v40 = a4;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  memset(__b, 0, sizeof(__b));
  if (v41)
    objc_msgSend(v41, "vendorData");
  else
    memset(__b, 0, sizeof(__b));
  v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  for (i = 0; i < 5; ++i)
    objc_msgSend(v38, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(unsigned int *)&__b[4 * i + 83]));
  v36 = __b[4];
  v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", __b[4]);
  for (j = 0; j < v36; ++j)
  {
    *(float *)&v4 = fmaxf(1.0, *(float *)&__b[4 * j + 28]);
    objc_msgSend(v35, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4));
  }
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  for (k = 0; k < 5; ++k)
  {
    objc_msgSend((id)objc_msgSend(v38, "objectAtIndexedSubscript:", k), "doubleValue");
    v12 = v5;
    objc_msgSend((id)objc_msgSend(v35, "objectAtIndexedSubscript:", k), "doubleValue");
    v31 = v12 / v6;
    objc_msgSend(v33, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 / v6));
  }
  v30 = 0.0;
  if (v41)
    objc_msgSend(v41, "colorSample");
  else
    memset(&v29[15], 0, 0x3CuLL);
  v11 = v29[15];
  if (v41)
    objc_msgSend(v41, "colorSample");
  else
    memset(v29, 0, 0x3CuLL);
  v30 = (float)(v11 / v29[1]);
  v28 = 0.0;
  if (v41)
    objc_msgSend(v41, "colorSample");
  else
    memset(&v27[15], 0, 0x3CuLL);
  v10 = v27[16];
  if (v41)
    objc_msgSend(v41, "colorSample");
  else
    memset(v27, 0, 0x3CuLL);
  v28 = (float)(v10 / v27[1]);
  v26 = 0.0;
  if (v41)
    objc_msgSend(v41, "colorSample");
  else
    memset((char *)&v25[8] + 4, 0, 0x3CuLL);
  v9 = *((float *)&v25[9] + 1);
  if (v41)
    objc_msgSend(v41, "colorSample");
  else
    memset(&v25[1], 0, 0x3CuLL);
  v26 = (float)(v9 / *((float *)&v25[1] + 1));
  v25[0] = 0;
  if (v41)
    objc_msgSend(v41, "colorSample");
  else
    memset(v24, 0, sizeof(v24));
  v25[0] = *(_QWORD *)&v24[3];
  v23 = CFXChromaticity2CCT((float *)v25);
  v22 = 4.0 * v30 / (v30 + 15.0 * v28 + 3.0 * v26);
  v21 = 9.0 * v28 / (v30 + 15.0 * v28 + 3.0 * v26);
  v20 = *(float *)&__b[20];
  v19 = (double)*(unsigned __int16 *)&__b[6];
  v18 = *(float *)v25;
  v17 = *((float *)v25 + 1);
  v15 = 0;
  v16 = 0.0;
  if (v41)
    objc_msgSend(v41, "colorSample");
  else
    memset(v14, 0, sizeof(v14));
  CFXTristimulus2Lab(v14, (float *)&v15);
  *(double *)&v7 = v16;
  LODWORD(v7) = *(_DWORD *)&__b[8];
  v40 = -[CBCEModule setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:](v43, "setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:", v38, v35, v33, v40, v30, v28, v26, v23, v22, v21, v20, v19, (double)v7 / 1000.0, (double)(*(int *)&__b[16] >> 16), *(_QWORD *)&v18, *(_QWORD *)&v17, *((float *)&v15 + 1),
          v16);
  objc_autoreleasePoolPop(context);
  return v40;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (CBCEModule)initWithQueue:(id)a3 ceModelID:(unsigned int)a4
{
  os_log_t v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  Class v8;
  uint64_t v9;
  id v10;
  Class v11;
  id v12;
  id v13;
  uint64_t inited;
  NSObject *logHandle;
  id v17;
  uint64_t v18;
  os_log_type_t v19;
  os_log_t v20;
  NSString *v21;
  objc_super v22;
  unsigned int v23;
  id v24;
  SEL v25;
  CBCEModule *v26;
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = self;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CBCEModule;
  v26 = -[CBModule initWithQueue:](&v22, sel_initWithQueue_, a3);
  if (v26)
  {
    v4 = os_log_create("com.apple.CoreBrightness.CBCEModule", "default");
    v26->super._logHandle = (OS_os_log *)v4;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26->_alsEvents = v5;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26->_currentInputDict = v6;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26->_currentOutputDict = v7;
    v21 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CBCE%d"), v23);
    v20 = 0;
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
    v20 = logHandle;
    v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v21);
      _os_log_impl(&dword_1B5291000, v20, v19, "Modelname: %@", v27, 0xCu);
    }
    v8 = NSClassFromString(v21);
    -[CBCEModule setModelClass:](v26, "setModelClass:", v8);
    v18 = 0;
    v17 = objc_alloc_init((Class)getMLModelConfigurationClass());
    objc_msgSend(v17, "setComputeUnits:", 0);
    v9 = objc_msgSend(objc_alloc(-[CBCEModule modelClass](v26, "modelClass")), "initWithConfiguration:error:", v17, &v18);
    v26->_model = (id)v9;

    v10 = v26->_model;
    v11 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Input"), v21));
    -[CBCEModule setModelInputClass:](v26, "setModelInputClass:", v11);
    v12 = objc_alloc(-[CBCEModule modelInputClass](v26, "modelInputClass"));
    v26->_overriddenInput = v12;
    v13 = objc_alloc(-[CBCEModule modelInputClass](v26, "modelInputClass"));
    v26->_currentInput = v13;
  }
  return v26;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBCEModule *v4;

  v4 = self;
  v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBCEModule;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (id)copyPropertyForKey:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  void *v10;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "copyPropertyForKey called with key: %@", v15, 0xCu);
  }
  v10 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CEOutput")) & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_currentOutputDict, 1);
    if (self->super._logHandle)
    {
      v7 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)v10);
      _os_log_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEFAULT, "copyPropertyForKey returning value: %@", v14, 0xCu);
    }
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CEInput")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("CEOverride")) & 1) != 0 && self->_overriding)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_currentInputDict, 1);
    if (self->super._logHandle)
    {
      v5 = self->super._logHandle;
    }
    else
    {
      v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)self->_currentInputDict);
      _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "copyPropertyForKey returning value: %@", v13, 0xCu);
    }
  }
  return v10;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id overriddenInput;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *context;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int k;
  id v52;
  int j;
  id v54;
  int i;
  id v56;
  uint8_t v60[16];
  uint8_t v61[112];
  uint8_t v62[32];
  uint8_t v63[16];
  uint8_t v64[16];
  uint8_t v65[16];
  uint8_t v66[16];
  uint8_t v67[24];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v67, (uint64_t)a3, (uint64_t)a4);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "setProperty called with property: %@ and key: %@", v67, 0x16u);
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CEOverride")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_overriding = 1;
      context = (void *)MEMORY[0x1B5E4A8B0]();
      if (self->super._logHandle)
      {
        v33 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v32 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v32 = init_default_corebrightness_log();
        v33 = v32;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)a3);
        _os_log_debug_impl(&dword_1B5291000, v33, OS_LOG_TYPE_DEBUG, "Property: %@", v66, 0xCu);
      }
      v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
      for (i = 0; i < 5; ++i)
        objc_msgSend(v56, "addObject:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("crossTalk")), "objectAtIndexedSubscript:", i));
      if (self->super._logHandle)
      {
        v31 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v30 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v30 = init_default_corebrightness_log();
        v31 = v30;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v56);
        _os_log_debug_impl(&dword_1B5291000, v31, OS_LOG_TYPE_DEBUG, "xtalk: %@", v65, 0xCu);
      }
      v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
      for (j = 0; j < 5; ++j)
        objc_msgSend(v54, "addObject:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ALSRaw")), "objectAtIndexedSubscript:", j));
      if (self->super._logHandle)
      {
        v29 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v28 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v28 = init_default_corebrightness_log();
        v29 = v28;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v54);
        _os_log_debug_impl(&dword_1B5291000, v29, OS_LOG_TYPE_DEBUG, "alsraw: %@", v64, 0xCu);
      }
      v52 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
      for (k = 0; k < 5; ++k)
        objc_msgSend(v52, "addObject:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ALSRatio")), "objectAtIndexedSubscript:", k));
      if (self->super._logHandle)
      {
        v27 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v26 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v26 = init_default_corebrightness_log();
        v27 = v26;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v52);
        _os_log_debug_impl(&dword_1B5291000, v27, OS_LOG_TYPE_DEBUG, "alsRatio: %@", v63, 0xCu);
      }
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("X")), "doubleValue");
      v50 = v4;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Y")), "doubleValue");
      v49 = v5;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Z")), "doubleValue");
      v48 = v6;
      if (self->super._logHandle)
      {
        v25 = self->super._logHandle;
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
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v62, v50, v49, v48);
        _os_log_debug_impl(&dword_1B5291000, v25, OS_LOG_TYPE_DEBUG, "XYZ: %f,%f,%f", v62, 0x20u);
      }
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CCT")), "doubleValue");
      v47 = v7;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uPrime")), "doubleValue");
      v46 = v8;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vPrime")), "doubleValue");
      v45 = v9;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("lux")), "doubleValue");
      v44 = v10;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("nits")), "doubleValue");
      v43 = v11;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("iTime")), "doubleValue");
      v42 = v12;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("gain")), "doubleValue");
      v41 = v13;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("x")), "doubleValue");
      v40 = v14;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("y")), "doubleValue");
      v39 = v15;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("a")), "doubleValue");
      v38 = v16;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("b")), "doubleValue");
      v37 = v17;
      if (self->super._logHandle)
      {
        v23 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v22 = init_default_corebrightness_log();
        v23 = v22;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_11_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v61, v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37);
        _os_log_debug_impl(&dword_1B5291000, v23, OS_LOG_TYPE_DEBUG, "CCT: %f, uPrime:%f, vPrime:%f, lux:%f, nits:%f, iTime:%f, gain: %f, x:%f, y:%f, a:%f, b:%f", v61, 0x70u);
      }
      self->_overriddenInput = -[CBCEModule setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:](self, "setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:", v56, v54, v52, self->_overriddenInput, *(double *)&v50, *(double *)&v49, *(double *)&v48, *(double *)&v47, *(double *)&v46, *(double *)&v45, *(double *)&v44, *(double *)&v43, v42, v41, v40, v39, v38,
                                 v37);
      objc_autoreleasePoolPop(context);
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CEOverrideEnabled")) & 1) != 0)
  {
    self->_overriding = objc_msgSend(a3, "BOOLValue") & 1;
    if (self->super._logHandle)
    {
      v21 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v20 = init_default_corebrightness_log();
      v21 = v20;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v60, self->_overriding);
      _os_log_impl(&dword_1B5291000, v21, OS_LOG_TYPE_INFO, "Setting CEOverride to %d", v60, 8u);
    }
    if (self->_overriding)
      overriddenInput = self->_overriddenInput;
    else
      overriddenInput = 0;
    self->_overriddenInput = overriddenInput;
  }
  return 0;
}

- (void)setModelClass:(Class)a3
{
  self->_modelClass = a3;
}

- (Class)modelInputClass
{
  return self->_modelInputClass;
}

- (void)setModelInputClass:(Class)a3
{
  self->_modelInputClass = a3;
}

@end
