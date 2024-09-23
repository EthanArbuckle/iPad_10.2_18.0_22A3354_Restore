@implementation CBColorFilter

- (CBColorFilter)initWithQueue:(id)a3
{
  os_log_t v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint8_t v10[15];
  char v11;
  NSObject *v12;
  objc_super v13;
  id v14;
  SEL v15;
  CBColorFilter *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CBColorFilter;
  v16 = -[CBModule initWithQueue:](&v13, sel_initWithQueue_, a3);
  if (v16)
  {
    v3 = os_log_create("com.apple.CoreBrightness.CBColorFilter", "default");
    v16->super._logHandle = (OS_os_log *)v3;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16->_services = v4;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16->_validServices = v5;
    v16->_mode = 6;
    v16->_sensorPolicy = 255;
  }
  else
  {
    v12 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v12 = inited;
    v11 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v12;
      type = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1B5291000, log, type, "failed to initialise self", v10, 2u);
    }
  }
  return v16;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBColorFilter *v4;

  v4 = self;
  v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  if (v4->super._notificationBlock)
    _Block_release(v4->super._notificationBlock);
  v2.receiver = v4;
  v2.super_class = (Class)CBColorFilter;
  -[CBModule dealloc](&v2, sel_dealloc);
}

- (void)setMode:(unint64_t)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v9[32];
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3 == 1 || a3 == 5)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v10, a3);
      _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "invalid mode update (%lu)", v10, 0xCu);
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      v4 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v3 = init_default_corebrightness_log();
      v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v9, self->_mode, a3);
      _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "current=%lu new=%lu", v9, 0x16u);
    }
    if (self->_mode != a3)
    {
      self->_mode = a3;
      -[CBColorFilter updateSample](self, "updateSample");
    }
  }
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[15];
  char v9;
  NSObject *v10;
  CBALSService *v11;
  char v12;
  __IOHIDServiceClient *v13;
  SEL v14;
  CBColorFilter *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12 = 0;
  v11 = -[CBALSService initWithHIDALSServiceClient:]([CBALSService alloc], "initWithHIDALSServiceClient:", a3);
  if (v11)
  {
    -[NSMutableArray addObject:](v15->_services, "addObject:", v11);
    -[CBColorFilter updateValidServices](v15, "updateValidServices");

    v12 = 1;
  }
  else
  {
    v10 = 0;
    if (v15->super._logHandle)
    {
      logHandle = v15->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v10 = logHandle;
    v9 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v10;
      type = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1B5291000, log, type, "failed to create wrapper for the service", v8, 2u);
    }
  }
  return v12 & 1;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  NSMutableArray *services;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  __IOHIDServiceClient *v11;
  __IOHIDEvent *v12;
  char v13;
  __IOHIDServiceClient *v14;
  __IOHIDEvent *v15;
  SEL v16;
  CBColorFilter *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = 0;
  services = self->_services;
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __37__CBColorFilter_handleHIDEvent_from___block_invoke;
  v10 = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
  v11 = a4;
  v12 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](services, "enumerateObjectsUsingBlock:", &v6);
  -[CBColorFilter updateSample](v17, "updateSample");
  return v13 & 1;
}

uint64_t __37__CBColorFilter_handleHIDEvent_from___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToHIDService:", *(_QWORD *)(a1 + 32));
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "setEvent:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  NSMutableArray *services;
  id v4;
  char v6;
  char v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  uint64_t *v13;
  __IOHIDServiceClient *v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  __IOHIDServiceClient *v22;
  SEL v23;
  CBColorFilter *v24;

  v24 = self;
  v23 = a2;
  v22 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 1375731712;
  v18 = 48;
  v19 = __Block_byref_object_copy__20;
  v20 = __Block_byref_object_dispose__20;
  v21 = 0;
  services = self->_services;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __40__CBColorFilter_removeHIDServiceClient___block_invoke;
  v12 = &unk_1E68EA990;
  v14 = a3;
  v13 = &v15;
  -[NSMutableArray enumerateObjectsUsingBlock:](services, "enumerateObjectsUsingBlock:", &v8);
  if (v16[5])
  {
    v4 = (id)v16[5];
    -[NSMutableArray removeObject:](v24->_validServices, "removeObject:", v16[5]);
    -[NSMutableArray removeObject:](v24->_services, "removeObject:", v16[5]);
    v7 = -[CBColorFilter hasExtRearSensor](v24, "hasExtRearSensor");
    v6 = -[CBColorFilter hasExtFrontSensor](v24, "hasExtFrontSensor");
    if ((v7 & 1) == 0)
      +[CBAnalyticsManager stopReporting:](CBAnalyticsManager, "stopReporting:", 2);
    if ((v6 & 1) == 0)
    {
      +[CBAnalyticsManager stopReporting:](CBAnalyticsManager, "stopReporting:", 1);
      +[CBAnalyticsManager stopReporting:](CBAnalyticsManager, "stopReporting:", 3);
    }

  }
  _Block_object_dispose(&v15, 8);
  return 1;
}

uint64_t __40__CBColorFilter_removeHIDServiceClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "service");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)setSensorPolicy:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_sensorPolicy != a3)
  {
    self->_sensorPolicy = a3;
    -[CBColorFilter updateValidServices](self, "updateValidServices");
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
      __os_log_helper_16_2_2_8_0_8_66((uint64_t)v6, self->_sensorPolicy, (uint64_t)self->_validServices);
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "policy=0x%lX valid=%{public}@", v6, 0x16u);
    }
  }
}

- (unint64_t)evaluatedFilterMode
{
  return self->_mode;
}

- (id)newColorSampleLinearWeightedForServices:(id)a3
{
  double v3;
  double v4;
  CBColorSample *v6;
  CBColorSample *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  CBColorFilter *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD __b[8];
  id v26;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v29;
  double *v30;
  int v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  int v38;
  int v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double *v43;
  int v44;
  int v45;
  uint64_t v46;
  id v47;
  SEL v48;
  CBColorFilter *v49;
  _BYTE v50[128];
  uint8_t v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v49 = self;
  v48 = a2;
  v47 = a3;
  v42 = 0;
  v43 = (double *)&v42;
  v44 = 0x20000000;
  v45 = 32;
  v46 = 0;
  v41 = 0.0;
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x20000000;
  v39 = 32;
  v40 = 0;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x10000000;
  v32 = 48;
  v33 = &unk_1B54831B1;
  v34 = 0;
  v35 = 0;
  oslog = 0;
  if (self->super._logHandle)
  {
    logHandle = v49->super._logHandle;
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
    __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v47);
    _os_log_debug_impl(&dword_1B5291000, oslog, type, "ALS services: %@", v51, 0xCu);
  }
  memset(__b, 0, sizeof(__b));
  obj = v47;
  v13 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v26 = 0;
      v26 = *(id *)(__b[1] + 8 * v10);
      if ((objc_msgSend(v26, "validData") & 1) != 0)
      {
        objc_msgSend(v26, "lux");
        v37[3] = v37[3] + v3;
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
        if (!v11)
          break;
      }
    }
  }
  if (v37[3] != 0.0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = -1073741824;
    v18 = 0;
    v19 = __57__CBColorFilter_newColorSampleLinearWeightedForServices___block_invoke;
    v20 = &unk_1E68EBD88;
    v22 = &v36;
    v23 = &v29;
    v24 = &v42;
    v21 = v49;
    objc_msgSend(v47, "enumerateObjectsUsingBlock:", &v16);
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", v30[4], v30[5]);
    v41 = v4;
  }
  v7 = [CBColorSample alloc];
  v6 = -[CBColorSample initWithChromaticity:illuminance:andTempterature:](v7, "initWithChromaticity:illuminance:andTempterature:", v30[4], v30[5], v43[3], v41);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  return v6;
}

void __57__CBColorFilter_newColorSampleLinearWeightedForServices___block_invoke(_QWORD *a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  NSObject *v11;
  float v13;
  uint8_t v15[56];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "validData") & 1) != 0)
  {
    objc_msgSend(a2, "lux");
    *(float *)&v2 = v2 / *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
    v13 = *(float *)&v2;
    objc_msgSend(a2, "x");
    *(double *)(*(_QWORD *)(a1[6] + 8) + 32) = *(double *)(*(_QWORD *)(a1[6] + 8) + 32) + v3 * v13;
    objc_msgSend(a2, "y");
    *(double *)(*(_QWORD *)(a1[6] + 8) + 40) = *(double *)(*(_QWORD *)(a1[6] + 8) + 40) + v4 * v13;
    objc_msgSend(a2, "lux");
    *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[7] + 8) + 24) + v5 * v13;
    if (*(_QWORD *)(a1[4] + 16))
    {
      v11 = *(NSObject **)(a1[4] + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v11 = inited;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(a2, "service");
      objc_msgSend(a2, "x");
      v9 = v6;
      objc_msgSend(a2, "y");
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v15, v8, v9, v7, COERCE__INT64(v13));
      _os_log_debug_impl(&dword_1B5291000, v11, OS_LOG_TYPE_DEBUG, "service %p xy= %f | %f ratio=%f", v15, 0x2Au);
    }
  }
}

- (id)newColorSampleLinearWeightedForSamples:(id)a3
{
  double v3;
  double v4;
  CBColorSample *v6;
  CBColorSample *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(_QWORD *, void *);
  void *v18;
  CBColorFilter *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD __b[8];
  id v24;
  uint64_t v25;
  double *v26;
  int v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  int v34;
  int v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  double *v39;
  int v40;
  int v41;
  uint64_t v42;
  id v43;
  SEL v44;
  CBColorFilter *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v45 = self;
  v44 = a2;
  v43 = a3;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x20000000;
  v41 = 32;
  v42 = 0;
  v37 = 0.0;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x20000000;
  v35 = 32;
  v36 = 0;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x10000000;
  v28 = 48;
  v29 = &unk_1B54831B1;
  v30 = 0;
  v31 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v43;
  v13 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v24 = 0;
      v24 = *(id *)(__b[1] + 8 * v10);
      objc_msgSend(v24, "lux");
      v33[3] = v33[3] + v3;
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
        if (!v11)
          break;
      }
    }
  }
  if (v33[3] != 0.0)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = -1073741824;
    v16 = 0;
    v17 = __56__CBColorFilter_newColorSampleLinearWeightedForSamples___block_invoke;
    v18 = &unk_1E68EBDB0;
    v20 = &v32;
    v21 = &v25;
    v22 = &v38;
    v19 = v45;
    objc_msgSend(v43, "enumerateObjectsUsingBlock:", &v14);
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", v26[4], v26[5]);
    v37 = v4;
  }
  v7 = [CBColorSample alloc];
  v6 = -[CBColorSample initWithChromaticity:illuminance:andTempterature:](v7, "initWithChromaticity:illuminance:andTempterature:", v26[4], v26[5], v39[3], v37);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  return v6;
}

void __56__CBColorFilter_newColorSampleLinearWeightedForSamples___block_invoke(_QWORD *a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  NSObject *v10;
  float v12;
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "lux");
  *(float *)&v2 = v2 / *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  v12 = *(float *)&v2;
  objc_msgSend(a2, "xy");
  *(double *)(*(_QWORD *)(a1[6] + 8) + 32) = *(double *)(*(_QWORD *)(a1[6] + 8) + 32) + v3 * v12;
  objc_msgSend(a2, "xy");
  *(double *)(*(_QWORD *)(a1[6] + 8) + 40) = *(double *)(*(_QWORD *)(a1[6] + 8) + 40) + v4 * v12;
  objc_msgSend(a2, "lux");
  *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[7] + 8) + 24) + v5 * v12;
  if (*(_QWORD *)(a1[4] + 16))
  {
    v10 = *(NSObject **)(a1[4] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v10 = inited;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a2, "xy");
    v8 = v6;
    objc_msgSend(a2, "xy");
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v14, v8, v7, COERCE__INT64(v12));
    _os_log_debug_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEBUG, "xy= %f | %f ratio=%f", v14, 0x20u);
  }
}

- (id)newColorSampleLogWeightedForSamples:(id)a3
{
  double v3;
  double v4;
  double v5;
  CBColorSample *v7;
  CBColorSample *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(_QWORD *, void *);
  void *v19;
  CBColorFilter *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD __b[8];
  id v25;
  uint64_t v26;
  double *v27;
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  int v35;
  int v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  double *v40;
  int v41;
  int v42;
  uint64_t v43;
  id v44;
  SEL v45;
  CBColorFilter *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v46 = self;
  v45 = a2;
  v44 = a3;
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x20000000;
  v42 = 32;
  v43 = 0;
  v38 = 0.0;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x20000000;
  v36 = 32;
  v37 = 0;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x10000000;
  v29 = 48;
  v30 = &unk_1B54831B1;
  v31 = 0;
  v32 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v44;
  v14 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
  if (v14)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v14;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(obj);
      v25 = 0;
      v25 = *(id *)(__b[1] + 8 * v11);
      objc_msgSend(v25, "lux");
      v4 = log10(v3 + 1.0);
      v34[3] = v34[3] + v4;
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
        if (!v12)
          break;
      }
    }
  }
  if (v34[3] != 0.0)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = -1073741824;
    v17 = 0;
    v18 = __53__CBColorFilter_newColorSampleLogWeightedForSamples___block_invoke;
    v19 = &unk_1E68EBDB0;
    v21 = &v33;
    v22 = &v26;
    v23 = &v39;
    v20 = v46;
    objc_msgSend(v44, "enumerateObjectsUsingBlock:", &v15);
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", v27[4], v27[5]);
    v38 = v5;
  }
  v8 = [CBColorSample alloc];
  v7 = -[CBColorSample initWithChromaticity:illuminance:andTempterature:](v8, "initWithChromaticity:illuminance:andTempterature:", v27[4], v27[5], v40[3], v38);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  return v7;
}

void __53__CBColorFilter_newColorSampleLogWeightedForSamples___block_invoke(_QWORD *a1, void *a2)
{
  double v2;
  float v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  NSObject *v11;
  float v13;
  uint8_t v15[40];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "lux");
  v3 = log10(v2 + 1.0) / *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  v13 = v3;
  objc_msgSend(a2, "xy");
  *(double *)(*(_QWORD *)(a1[6] + 8) + 32) = *(double *)(*(_QWORD *)(a1[6] + 8) + 32) + v4 * v13;
  objc_msgSend(a2, "xy");
  *(double *)(*(_QWORD *)(a1[6] + 8) + 40) = *(double *)(*(_QWORD *)(a1[6] + 8) + 40) + v5 * v13;
  objc_msgSend(a2, "lux");
  *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[7] + 8) + 24) + v6 * v13;
  if (*(_QWORD *)(a1[4] + 16))
  {
    v11 = *(NSObject **)(a1[4] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v11 = inited;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a2, "xy");
    v9 = v7;
    objc_msgSend(a2, "xy");
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v15, v9, v8, COERCE__INT64(v13));
    _os_log_debug_impl(&dword_1B5291000, v11, OS_LOG_TYPE_DEBUG, "xy= %f | %f ratio=%f", v15, 0x20u);
  }
}

- (id)newColorSampleLogWeighted
{
  double v2;
  double v3;
  NSMutableArray *validServices;
  double v5;
  CBColorSample *v7;
  CBColorSample *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSMutableArray *obj;
  uint64_t v14;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(_QWORD *, void *);
  void *v21;
  CBColorFilter *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD __b[8];
  id v27;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v30;
  double *v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  int v39;
  int v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double *v44;
  int v45;
  int v46;
  uint64_t v47;
  SEL v48;
  CBColorFilter *v49;
  _BYTE v50[128];
  uint8_t v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v49 = self;
  v48 = a2;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x20000000;
  v46 = 32;
  v47 = 0;
  v42 = 0.0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x20000000;
  v40 = 32;
  v41 = 0;
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x10000000;
  v33 = 48;
  v34 = &unk_1B54831B1;
  v35 = 0;
  v36 = 0;
  oslog = 0;
  if (self->super._logHandle)
  {
    logHandle = v49->super._logHandle;
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
    __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v49->_validServices);
    _os_log_debug_impl(&dword_1B5291000, oslog, type, "ALS services: %@", v51, 0xCu);
  }
  memset(__b, 0, sizeof(__b));
  obj = v49->_validServices;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
  if (v14)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v14;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(obj);
      v27 = 0;
      v27 = *(id *)(__b[1] + 8 * v11);
      if ((objc_msgSend(v27, "validData") & 1) != 0)
      {
        objc_msgSend(v27, "lux");
        v3 = log10(v2 + 1.0);
        v38[3] = v38[3] + v3;
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
        if (!v12)
          break;
      }
    }
  }
  if (v38[3] != 0.0)
  {
    validServices = v49->_validServices;
    v17 = MEMORY[0x1E0C809B0];
    v18 = -1073741824;
    v19 = 0;
    v20 = __42__CBColorFilter_newColorSampleLogWeighted__block_invoke;
    v21 = &unk_1E68EBD88;
    v23 = &v37;
    v24 = &v30;
    v25 = &v43;
    v22 = v49;
    -[NSMutableArray enumerateObjectsUsingBlock:](validServices, "enumerateObjectsUsingBlock:", &v17);
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", v31[4], v31[5]);
    v42 = v5;
  }
  v8 = [CBColorSample alloc];
  v7 = -[CBColorSample initWithChromaticity:illuminance:andTempterature:](v8, "initWithChromaticity:illuminance:andTempterature:", v31[4], v31[5], v44[3], v42);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  return v7;
}

void __42__CBColorFilter_newColorSampleLogWeighted__block_invoke(_QWORD *a1, void *a2)
{
  double v2;
  float v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  NSObject *v12;
  float v14;
  uint8_t v16[56];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "validData") & 1) != 0)
  {
    objc_msgSend(a2, "lux");
    v3 = log10(v2 + 1.0) / *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
    v14 = v3;
    objc_msgSend(a2, "x");
    *(double *)(*(_QWORD *)(a1[6] + 8) + 32) = *(double *)(*(_QWORD *)(a1[6] + 8) + 32) + v4 * v14;
    objc_msgSend(a2, "y");
    *(double *)(*(_QWORD *)(a1[6] + 8) + 40) = *(double *)(*(_QWORD *)(a1[6] + 8) + 40) + v5 * v14;
    objc_msgSend(a2, "lux");
    *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[7] + 8) + 24) + v6 * v14;
    if (*(_QWORD *)(a1[4] + 16))
    {
      v12 = *(NSObject **)(a1[4] + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v12 = inited;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(a2, "service");
      objc_msgSend(a2, "x");
      v10 = v7;
      objc_msgSend(a2, "y");
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v16, v9, v10, v8, COERCE__INT64(v14));
      _os_log_debug_impl(&dword_1B5291000, v12, OS_LOG_TYPE_DEBUG, "service %p xy= %f | %f ratio=%f", v16, 0x2Au);
    }
  }
}

- (id)newColorSampleWinnerTakesAll
{
  NSMutableArray *validServices;
  CBColorSample *v4;
  CBColorSample *v5;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(_QWORD *, void *);
  void *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v18;
  double *v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  int v33;
  int v34;
  uint64_t v35;
  SEL v36;
  CBColorFilter *v37;
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v37 = self;
  v36 = a2;
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x20000000;
  v34 = 32;
  v35 = 0;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x20000000;
  v29 = 32;
  v30 = 0;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x10000000;
  v21 = 56;
  v22 = &unk_1B54831B1;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  oslog = 0;
  if (self->super._logHandle)
  {
    logHandle = v37->super._logHandle;
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
    __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)v37->_validServices);
    _os_log_debug_impl(&dword_1B5291000, oslog, type, "ALS services: %@", v38, 0xCu);
  }
  validServices = v37->_validServices;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __45__CBColorFilter_newColorSampleWinnerTakesAll__block_invoke;
  v12 = &unk_1E68EBDD8;
  v13 = &v31;
  v14 = &v26;
  v15 = &v18;
  -[NSMutableArray enumerateObjectsUsingBlock:](validServices, "enumerateObjectsUsingBlock:", &v8);
  v5 = [CBColorSample alloc];
  v4 = -[CBColorSample initWithTristimulus:illuminance:andTempterature:](v5, "initWithTristimulus:illuminance:andTempterature:", v19[4], v19[5], v19[6], v32[3], v27[3]);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);
  return v4;
}

uint64_t __45__CBColorFilter_newColorSampleWinnerTakesAll__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  result = objc_msgSend(a2, "validData");
  if ((result & 1) != 0)
  {
    v9 = *(double *)(*(_QWORD *)(a1[4] + 8) + 24);
    result = objc_msgSend(a2, "lux");
    if (v9 < v3)
    {
      objc_msgSend(a2, "lux", v9);
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v4;
      objc_msgSend(a2, "CCT");
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
      objc_msgSend(a2, "event");
      IOHIDEventGetDoubleValue();
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32) = v6;
      objc_msgSend(a2, "event");
      IOHIDEventGetDoubleValue();
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = v7;
      objc_msgSend(a2, "event");
      result = IOHIDEventGetDoubleValue();
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 48) = v8;
    }
  }
  return result;
}

- (id)newColorSampleConditionWeighted
{
  NSMutableArray *validServices;
  NSMutableArray *v3;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  NSObject *v37;
  double v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v54[7];
  os_log_type_t v55;
  os_log_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  os_log_type_t v62;
  os_log_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  os_log_type_t v68;
  os_log_t v69;
  os_log_type_t v70;
  os_log_t v71;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v74;
  int v75;
  int v76;
  uint64_t (*v77)(uint64_t, void *);
  void *v78;
  uint64_t *v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t (*v83)(uint64_t, void *);
  void *v84;
  uint64_t *v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t *v89;
  int v90;
  int v91;
  void (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  int v97;
  int v98;
  void (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  id v102;
  SEL v103;
  CBColorFilter *v104;
  uint8_t v105[48];
  uint8_t v106[48];
  uint8_t v107[48];
  uint8_t v108[48];
  uint8_t v109[16];
  uint8_t v110[24];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v104 = self;
  v103 = a2;
  v102 = 0;
  v95 = 0;
  v96 = &v95;
  v97 = 1375731712;
  v98 = 48;
  v99 = __Block_byref_object_copy__20;
  v100 = __Block_byref_object_dispose__20;
  v101 = 0;
  v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v88 = 0;
  v89 = &v88;
  v90 = 1375731712;
  v91 = 48;
  v92 = __Block_byref_object_copy__20;
  v93 = __Block_byref_object_dispose__20;
  v94 = 0;
  v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v87 = 0;
  v86 = 0;
  validServices = v104->_validServices;
  v80 = MEMORY[0x1E0C809B0];
  v81 = -1073741824;
  v82 = 0;
  v83 = __48__CBColorFilter_newColorSampleConditionWeighted__block_invoke;
  v84 = &unk_1E68EAFC8;
  v85 = &v88;
  -[NSMutableArray enumerateObjectsUsingBlock:](validServices, "enumerateObjectsUsingBlock:", &v80);
  v3 = v104->_validServices;
  v74 = MEMORY[0x1E0C809B0];
  v75 = -1073741824;
  v76 = 0;
  v77 = __48__CBColorFilter_newColorSampleConditionWeighted__block_invoke_2;
  v78 = &unk_1E68EAFC8;
  v79 = &v95;
  -[NSMutableArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", &v74);
  oslog = 0;
  if (v104->super._logHandle)
  {
    logHandle = v104->super._logHandle;
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
    __os_log_helper_16_2_1_8_64((uint64_t)v110, v96[5]);
    _os_log_debug_impl(&dword_1B5291000, oslog, type, "rear sensors: %@", v110, 0xCu);
  }
  v71 = 0;
  if (v104->super._logHandle)
  {
    v51 = v104->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v50 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v50 = init_default_corebrightness_log();
    v51 = v50;
  }
  v71 = v51;
  v70 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v109, v89[5]);
    _os_log_debug_impl(&dword_1B5291000, v71, v70, "front sensors: %@", v109, 0xCu);
  }
  if (objc_msgSend((id)v96[5], "count"))
  {
    v87 = -[CBColorFilter newColorSampleLinearWeightedForServices:](v104, "newColorSampleLinearWeightedForServices:", v96[5]);
    if (-[CBColorFilter hasExtRearSensor](v104, "hasExtRearSensor"))
    {
      objc_msgSend(v87, "setType:", 2);
      +[CBAnalyticsManager handleColorSample:](CBAnalyticsManager, "handleColorSample:", v87);
    }
    v69 = 0;
    if (v104->super._logHandle)
    {
      v49 = v104->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v48 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v48 = init_default_corebrightness_log();
      v49 = v48;
    }
    v69 = v49;
    v68 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v87, "lux");
      v47 = v4;
      objc_msgSend(v87, "xy");
      v66 = v5;
      v67 = v6;
      v46 = v5;
      objc_msgSend(v87, "xy");
      v64 = v7;
      v65 = v8;
      v45 = v8;
      objc_msgSend(v87, "CCT");
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v108, v47, v46, v45, v9);
      _os_log_debug_impl(&dword_1B5291000, v69, v68, "rear consolidated sample: lux=%f x=%f y=%f CCT=%f", v108, 0x2Au);
    }
  }
  if (objc_msgSend((id)v89[5], "count"))
  {
    v86 = -[CBColorFilter newColorSampleLinearWeightedForServices:](v104, "newColorSampleLinearWeightedForServices:", v89[5]);
    if (-[CBColorFilter hasExtFrontSensor](v104, "hasExtFrontSensor"))
    {
      objc_msgSend(v86, "setType:", 1);
      +[CBAnalyticsManager handleColorSample:](CBAnalyticsManager, "handleColorSample:", v86);
    }
    v63 = 0;
    if (v104->super._logHandle)
    {
      v44 = v104->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v43 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v43 = init_default_corebrightness_log();
      v44 = v43;
    }
    v63 = v44;
    v62 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v86, "lux");
      v42 = v10;
      objc_msgSend(v86, "xy");
      v60 = v11;
      v61 = v12;
      v41 = v11;
      objc_msgSend(v86, "xy");
      v58 = v13;
      v59 = v14;
      v40 = v14;
      objc_msgSend(v86, "CCT");
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v107, v42, v41, v40, v15);
      _os_log_debug_impl(&dword_1B5291000, v63, v62, "front consolidated sample: lux=%f x=%f y=%f CCT=%f", v107, 0x2Au);
    }
  }
  if (v87 && v86)
  {
    objc_msgSend(v86, "lux");
    if (v16 > 15.0)
    {
      objc_msgSend(v87, "lux", v16);
      if (v17 > 15.0)
      {
        v39 = objc_alloc(MEMORY[0x1E0C99D20]);
        v57 = (id)objc_msgSend(v39, "initWithObjects:", v87, v86, 0);
        if (v57)
        {
          objc_msgSend(v87, "lux");
          v38 = v18;
          objc_msgSend(v86, "lux");
          if (v38 <= v19)
            v102 = -[CBColorFilter newColorSampleLogWeightedForSamples:](v104, "newColorSampleLogWeightedForSamples:", v57, v38);
          else
            v102 = -[CBColorFilter newColorSampleLinearWeightedForSamples:](v104, "newColorSampleLinearWeightedForSamples:", v57, v38);
        }
        else
        {
          v56 = 0;
          if (v104->super._logHandle)
          {
            v37 = v104->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v36 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v36 = init_default_corebrightness_log();
            v37 = v36;
          }
          v56 = v37;
          v55 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v34 = v56;
            v35 = v55;
            __os_log_helper_16_0_0(v54);
            _os_log_error_impl(&dword_1B5291000, v34, v35, "error: couldn't allocate samples array", v54, 2u);
          }
        }

        goto LABEL_71;
      }
LABEL_62:
      v102 = v86;
      goto LABEL_71;
    }
    objc_msgSend(v87, "lux", v16);
    if (v20 <= 10.0)
      goto LABEL_62;
LABEL_58:
    v102 = v87;
    goto LABEL_71;
  }
  if (v87)
    goto LABEL_58;
  if (v86)
    goto LABEL_62;
  if (v104->super._logHandle)
  {
    v33 = v104->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v32 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v32 = init_default_corebrightness_log();
    v33 = v32;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_4_8_66_8_66_8_66_8_66((uint64_t)v106, v96[5], (uint64_t)v87, v89[5], (uint64_t)v86);
    _os_log_error_impl(&dword_1B5291000, v33, OS_LOG_TYPE_ERROR, "ERROR: no samples (rear: %{public}@ -> %{public}@ | front: %{public}@ -> %{public}@)", v106, 0x2Au);
  }
LABEL_71:
  if (-[CBColorFilter hasExtFrontSensor](v104, "hasExtFrontSensor")
    || -[CBColorFilter hasExtRearSensor](v104, "hasExtRearSensor"))
  {
    objc_msgSend(v102, "setType:", 3);
    +[CBAnalyticsManager handleColorSample:](CBAnalyticsManager, "handleColorSample:", v102);
  }

  if (v104->super._logHandle)
  {
    v31 = v104->super._logHandle;
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
    objc_msgSend(v102, "lux");
    v29 = v21;
    objc_msgSend(v102, "xy");
    v28 = v22;
    objc_msgSend(v102, "xy");
    v27 = v23;
    objc_msgSend(v102, "CCT");
    __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v105, v29, v28, v27, v24);
    _os_log_debug_impl(&dword_1B5291000, v31, OS_LOG_TYPE_DEBUG, "result sample: lux=%f x=%f y=%f CCT=%f", v105, 0x2Au);
  }
  v26 = v102;
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v95, 8);
  return v26;
}

uint64_t __48__CBColorFilter_newColorSampleConditionWeighted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (objc_msgSend(a2, "location") == 257 || (result = objc_msgSend(a2, "builtIn"), (result & 1) != 0))
  {
    result = objc_msgSend(a2, "validData");
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  }
  return result;
}

uint64_t __48__CBColorFilter_newColorSampleConditionWeighted__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "location");
  if (result == 258)
  {
    result = objc_msgSend(a2, "validData");
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  }
  return result;
}

- (void)updateSample
{
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v4;
  CBColorSample *v5;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v4 = -[CBColorFilter evaluatedFilterMode](self, "evaluatedFilterMode");
  switch(v4)
  {
    case 3:
      v5 = -[CBColorFilter newColorSampleLinearWeightedForServices:](self, "newColorSampleLinearWeightedForServices:", self->_validServices);
      break;
    case 4:
      v5 = -[CBColorFilter newColorSampleLogWeighted](self, "newColorSampleLogWeighted");
      break;
    case 2:
      v5 = -[CBColorFilter newColorSampleWinnerTakesAll](self, "newColorSampleWinnerTakesAll");
      break;
    case 6:
      v5 = -[CBColorFilter newColorSampleConditionWeighted](self, "newColorSampleConditionWeighted");
      break;
    default:
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v7, v4);
        _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "ERROR: unsupported mode %lu", v7, 0xCu);
      }
      break;
  }
  if (v5)
  {

    self->_sample = v5;
    -[CBColorSample setMode:](self->_sample, "setMode:", v4);
  }
  -[CBColorFilter reportSampleUpdate](self, "reportSampleUpdate");
}

- (void)reportSampleUpdate
{
  uint64_t v2;
  uint64_t v3;
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
  NSMutableArray *validServices;
  uint64_t mode;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
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
  os_log_type_t v51;
  os_log_t v52;
  SEL v53;
  CBColorFilter *v54;
  uint8_t v55[88];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v54 = self;
  v53 = a2;
  v52 = 0;
  if (self->super._logHandle)
  {
    logHandle = v54->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v52 = logHandle;
  v51 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    mode = v54->_mode;
    -[CBColorSample lux](v54->_sample, "lux");
    v19 = v2;
    -[CBColorSample CCT](v54->_sample, "CCT");
    v20 = v3;
    -[CBColorSample XYZ](v54->_sample, "XYZ");
    v48 = v4;
    v49 = v5;
    v50 = v6;
    v21 = v4;
    -[CBColorSample XYZ](v54->_sample, "XYZ");
    v45 = v7;
    v46 = v8;
    v47 = v9;
    v22 = v8;
    -[CBColorSample XYZ](v54->_sample, "XYZ");
    v42 = v10;
    v43 = v11;
    v44 = v12;
    v24 = v12;
    -[CBColorSample xy](v54->_sample, "xy");
    v40 = v13;
    v41 = v14;
    v23 = v13;
    -[CBColorSample xy](v54->_sample, "xy");
    v38 = v15;
    v39 = v16;
    __os_log_helper_16_0_8_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v55, mode, v19, v20, v21, v22, v24, v23, v16);
    _os_log_impl(&dword_1B5291000, v52, v51, "sample update (mode %lu): lux=%f CCT=%f X=%f Y=%f Z=%f (xy = %f | %f)", v55, 0x52u);
  }
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v37)
  {
    v36 = 0;
    v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v54->_sensorPolicy);
    v35 = 0;
    v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v54->_mode);
    if (v36 && v35)
    {
      v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v36, CFSTR("policy"), v35, CFSTR("mode"), 0);
      if (v34)
        objc_msgSend(v37, "setObject:forKey:", v34, CFSTR("cfg"));

    }
    v33 = 0;
    v33 = -[CBColorSample copyDataInDictionary](v54->_sample, "copyDataInDictionary");
    if (v33)
      objc_msgSend(v37, "setObject:forKey:", v33, CFSTR("sample"));

    validServices = v54->_validServices;
    v27 = MEMORY[0x1E0C809B0];
    v28 = -1073741824;
    v29 = 0;
    v30 = __35__CBColorFilter_reportSampleUpdate__block_invoke;
    v31 = &unk_1E68EA068;
    v32 = v37;
    -[NSMutableArray enumerateObjectsUsingBlock:](validServices, "enumerateObjectsUsingBlock:", &v27);
    -[CBColorFilter sendNotificationForKey:withValue:](v54, "sendNotificationForKey:withValue:", CFSTR("ColorSample"), v37);
  }

}

void __35__CBColorFilter_reportSampleUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = (id)objc_msgSend(a2, "copyDataInDictionary");
  if (v4)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), objc_msgSend(a2, "registryID"));
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v3);

  }
}

- (void)registerNotificationBlock:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CBColorFilter unregisterNotificationBlock](self, "unregisterNotificationBlock");
  if (a3)
    self->super._notificationBlock = _Block_copy(a3);
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
    __os_log_helper_16_0_1_8_0((uint64_t)v7, (uint64_t)self->super._notificationBlock);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "notificationBlock = %p", v7, 0xCu);
  }
}

- (void)unregisterNotificationBlock
{
  if (self->super._notificationBlock)
  {
    _Block_release(self->super._notificationBlock);
    self->super._notificationBlock = 0;
  }
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock)
    (*((void (**)(void))self->super._notificationBlock + 2))();
}

- (BOOL)ALSServiceConformsToPolicy:(id)a3
{
  uint64_t inited;
  NSObject *logHandle;
  BOOL v6;
  uint8_t v9[56];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 1;
  if ((objc_msgSend(a3, "builtIn") & 1) != 0)
    v6 = (self->_sensorPolicy & 8) != 0;
  if ((objc_msgSend(a3, "builtIn") & 1) == 0 && (self->_sensorPolicy & 4) == 0)
    v6 = 0;
  if ((objc_msgSend(a3, "builtIn") & 1) == 0)
  {
    if (objc_msgSend(a3, "location") == 257 && (self->_sensorPolicy & 1) == 0)
      v6 = 0;
    if (objc_msgSend(a3, "location") == 258 && (self->_sensorPolicy & 2) == 0)
      v6 = 0;
  }
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
    __os_log_helper_16_0_5_8_0_4_0_8_0_8_0_4_0((uint64_t)v9, objc_msgSend(a3, "registryID"), objc_msgSend(a3, "builtIn") & 1, objc_msgSend(a3, "location"), self->_sensorPolicy, v6);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "ID=0x%lX internal=%d location=0x%lX | policy=0x%lX | OK=%d", v9, 0x2Cu);
  }
  return v6;
}

- (void)updateValidServices
{
  NSMutableArray *services;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void *v7;
  CBColorFilter *v8;
  SEL v9;
  CBColorFilter *v10;

  v10 = self;
  v9 = a2;
  -[NSMutableArray removeAllObjects](self->_validServices, "removeAllObjects");
  services = v10->_services;
  v3 = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __36__CBColorFilter_updateValidServices__block_invoke;
  v7 = &unk_1E68EBE00;
  v8 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](services, "enumerateObjectsUsingBlock:", &v3);
  -[CBColorFilter updateSample](v10, "updateSample");
}

uint64_t __36__CBColorFilter_updateValidServices__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "ALSServiceConformsToPolicy:", a2);
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", a2);
  return result;
}

+ (double)calculateCCTForChromaticity:(id)a3
{
  double v4;
  long double __x;

  __x = (a3.var0 - 0.332) / (a3.var1 - 0.1858);
  v4 = pow(__x, 3.0);
  return 3525.0 * pow(__x, 2.0) + -449.0 * v4 + -6823.3 * __x + 5520.33;
}

+ (double)calculateCCTForTristimulus:(id)a3
{
  double v3;
  double v5;
  double v6;

  v6 = -1.0;
  v5 = a3.var0 + a3.var1 + a3.var2;
  if (v5 != 0.0)
  {
    +[CBColorFilter calculateCCTForChromaticity:](CBColorFilter, "calculateCCTForChromaticity:", a3.var0 / v5, a3.var1 / v5);
    return v3;
  }
  return v6;
}

+ ($1AB5FA073B851C12C2339EC22442E995)calculateTristimulusForChromaticity:(id)a3 andLux:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if (a3.var1 > 0.0 && a4 > 0.0)
  {
    v7 = a3.var0 / a3.var1 * a4;
    v8 = a4;
    v9 = (1.0 - a3.var0 - a3.var1) / a3.var1 * a4;
  }
  v4 = v7;
  v5 = v8;
  v6 = v9;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (BOOL)forceSampleUpdate
{
  NSMutableArray *validServices;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, void *);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  CBColorFilter *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  validServices = self->_validServices;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __34__CBColorFilter_forceSampleUpdate__block_invoke;
  v9 = &unk_1E68EAFC8;
  v10 = &v11;
  -[NSMutableArray enumerateObjectsUsingBlock:](validServices, "enumerateObjectsUsingBlock:", &v5);
  if ((v12[3] & 1) != 0)
    -[CBColorFilter updateSample](v17, "updateSample");
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __34__CBColorFilter_forceSampleUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "updateEventData");
  if ((result & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)hasExtRearSensor
{
  NSMutableArray *validServices;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, void *, uint64_t, _BYTE *);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  CBColorFilter *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  validServices = self->_validServices;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __33__CBColorFilter_hasExtRearSensor__block_invoke;
  v9 = &unk_1E68EAFC8;
  v10 = &v11;
  -[NSMutableArray enumerateObjectsUsingBlock:](validServices, "enumerateObjectsUsingBlock:", &v5);
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __33__CBColorFilter_hasExtRearSensor__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "location");
  if (result == 258)
  {
    result = objc_msgSend(a2, "validData");
    if ((result & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)hasExtFrontSensor
{
  NSMutableArray *validServices;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t, void *, uint64_t, _BYTE *);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  CBColorFilter *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  validServices = self->_validServices;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __34__CBColorFilter_hasExtFrontSensor__block_invoke;
  v9 = &unk_1E68EAFC8;
  v10 = &v11;
  -[NSMutableArray enumerateObjectsUsingBlock:](validServices, "enumerateObjectsUsingBlock:", &v5);
  v4 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __34__CBColorFilter_hasExtFrontSensor__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "location");
  if (result == 257)
  {
    result = objc_msgSend(a2, "validData");
    if ((result & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (unint64_t)sensorPolicy
{
  return self->_sensorPolicy;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (CBColorSample)sample
{
  return self->_sample;
}

@end
