@implementation CBAdaptationClient

- (BOOL)animateFromWeakestAdaptationModeInArray:(int *)a3 withLength:(int)a4 toWeakestInArray:(int *)a5 withLength:(int)a6 withProgress:(float)a7 andPeriod:(float)a8
{
  double v8;
  double v9;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  uint64_t *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  CBAdaptationClient *v30;
  id v31;
  id v32;
  int j;
  id v34;
  id v35;
  id v36;
  id v37;
  int i;
  id v39;
  BOOL v40;
  float v41;
  float v42;
  int v43;
  int *v44;
  int v45;
  int *v46;
  SEL v47;
  CBAdaptationClient *v48;

  v48 = self;
  v47 = a2;
  v46 = a3;
  v45 = a4;
  v44 = a5;
  v43 = a6;
  v42 = a7;
  v41 = a8;
  v40 = 0;
  v30 = self;
  objc_sync_enter(self);
  if (v48->bsc && v44 && v43 > 0 && (!v45 || v46))
  {
    v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v28 = (void *)objc_msgSend(v29, "initWithCapacity:", v43);
    v39 = v28;
    if (v28)
    {
      for (i = 0; i < v43; ++i)
      {
        v37 = 0;
        v27 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v26 = (void *)objc_msgSend(v27, "initWithInt:", v44[i]);
        v37 = v26;
        if (v26)
        {
          objc_msgSend(v39, "setObject:atIndexedSubscript:", v37, i);

        }
      }
      v25 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v8 = v41;
      v24 = (void *)objc_msgSend(v25, "initWithFloat:", v8);
      v36 = v24;
      if (v24)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v9 = v42;
        v22 = (void *)objc_msgSend(v23, "initWithFloat:", v9);
        v35 = v22;
        if (v22)
        {
          v34 = 0;
          if (v45 > 0)
          {
            if (v46)
            {
              v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
              v20 = (void *)objc_msgSend(v21, "initWithCapacity:", v45);
              v34 = v20;
              if (v20)
              {
                for (j = 0; j < v45; ++j)
                {
                  v32 = 0;
                  v19 = objc_alloc(MEMORY[0x1E0CB37E8]);
                  v18 = (void *)objc_msgSend(v19, "initWithInt:", v46[j]);
                  v32 = v18;
                  if (v18)
                  {
                    objc_msgSend(v34, "setObject:atIndexedSubscript:", v32, j);

                  }
                }
              }
            }
          }
          v31 = 0;
          if (v34)
          {
            v17 = objc_alloc(MEMORY[0x1E0C99D80]);
            v15 = &v11;
            v16 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v34, CFSTR("ColorAdaptationModesInitialSub"), v35, CFSTR("ProgressRatio"), v39, CFSTR("ColorAdaptationModesTargetSub"), v36, CFSTR("ColorAdaptationStrengthPeriod"), 0);
            v31 = v16;
          }
          else
          {
            v14 = objc_alloc(MEMORY[0x1E0C99D80]);
            v13 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v35, CFSTR("ProgressRatio"), v39, CFSTR("ColorAdaptationModesTargetSub"), v36, CFSTR("ColorAdaptationStrengthPeriod"), 0);
            v31 = v13;
          }
          if (v31)
          {
            v12 = -[BrightnessSystemClient setProperty:forKey:](v48->bsc, "setProperty:forKey:", v31, CFSTR("WeakestColorAdaptationModeAnimated"));
            v40 = v12;
            v48->_modeSet = 0;

          }
          if (v34)

        }
      }

    }
  }
  objc_sync_exit(v30);
  return v40;
}

- (BOOL)setAdaptationMode:(int)a3 withPeriod:(float)a4
{
  double v4;
  char v7;
  int v9;
  SEL v10;
  CBAdaptationClient *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  objc_sync_enter(self);
  *(float *)&v4 = a4;
  v7 = -[CBAdaptationClient setWeakestAdaptationModeFromArray:withLength:andPeriod:](v11, "setWeakestAdaptationModeFromArray:withLength:andPeriod:", &v9, 1, v4);
  if (v7)
  {
    v11->_mode = v9;
    v11->_modeSet = 1;
  }
  objc_sync_exit(self);
  return v7 & 1;
}

- (BOOL)setWeakestAdaptationModeFromArray:(int *)a3 withLength:(int)a4 andPeriod:(float)a5
{
  double v5;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  CBAdaptationClient *v16;
  id v17;
  id v18;
  id v19;
  int i;
  id v21;
  BOOL v22;
  float v23;
  int v24;
  int *v25;
  SEL v26;
  CBAdaptationClient *v27;

  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = 0;
  v16 = self;
  objc_sync_enter(self);
  if (v27->bsc)
  {
    if (v25)
    {
      if (v24 > 0)
      {
        v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v14 = (void *)objc_msgSend(v15, "initWithCapacity:", v24);
        v21 = v14;
        if (v14)
        {
          for (i = 0; i < v24; ++i)
          {
            v19 = 0;
            v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
            v12 = (void *)objc_msgSend(v13, "initWithInt:", v25[i]);
            v19 = v12;
            if (v12)
            {
              objc_msgSend(v21, "setObject:atIndexedSubscript:", v19, i);

            }
          }
          v11 = objc_alloc(MEMORY[0x1E0CB37E8]);
          *(float *)&v5 = v23;
          v10 = (void *)objc_msgSend(v11, "initWithFloat:", v5);
          v18 = v10;
          if (v10)
          {
            v17 = 0;
            v9 = objc_alloc(MEMORY[0x1E0C99D80]);
            v8 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v21, CFSTR("ColorAdaptationModesTargetSub"), v18, CFSTR("ColorAdaptationStrengthPeriod"), 0);
            v17 = v8;
            if (v8)
            {
              v7 = -[BrightnessSystemClient setProperty:forKey:](v27->bsc, "setProperty:forKey:", v17, CFSTR("WeakestColorAdaptationMode"));
              v22 = v7;
              v27->_modeSet = 0;

            }
          }

        }
      }
    }
  }
  objc_sync_exit(v16);
  return v22;
}

+ (BOOL)supportsAdaptation
{
  id v3;
  BrightnessSystemClient *v4;
  BOOL v5;

  v5 = 0;
  v4 = objc_alloc_init(BrightnessSystemClient);
  if (v4)
  {
    v3 = -[BrightnessSystemClient copyPropertyForKey:](v4, "copyPropertyForKey:", CFSTR("SupportedColorFX"));
    if (v3)
    {
      v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("SupportsAmbientColorAdaptation")), "BOOLValue") & 1;

    }
  }
  return v5;
}

- (CBAdaptationClient)initWithClientObj:(id)a3
{
  BrightnessSystemClient *v3;
  BrightnessSystemClient *bsc;
  NSObject *log;
  os_log_type_t type;
  NSObject *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  _QWORD *v14;
  _QWORD v15[2];
  int v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  CBAdaptationClient *v20;
  id v21;
  uint8_t v22[7];
  char v23;
  NSObject *v24;
  objc_super v25;
  BrightnessSystemClient *v26;
  SEL v27;
  CBAdaptationClient *v28;

  v28 = self;
  v27 = a2;
  v26 = (BrightnessSystemClient *)a3;
  if (!a3)
    return 0;
  v25.receiver = v28;
  v25.super_class = (Class)CBAdaptationClient;
  v28 = -[CBAdaptationClient init](&v25, sel_init);
  if (v28)
  {
    v28->bsc = v26;
    v3 = v28->bsc;
    v28->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.Client.Adaptation", "default");
    if (!v28->_logHandle)
    {
      v24 = 0;
      v8 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v24 = v8;
      v23 = 16;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        log = v24;
        type = v23;
        __os_log_helper_16_0_0(v22);
        _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create log handle", v22, 2u);
      }
    }
    v21 = 0;
    v21 = -[BrightnessSystemClient copyPropertyForKey:](v28->bsc, "copyPropertyForKey:", CFSTR("SupportedColorFX"));
    if (v21)
    {
      v28->_supported = objc_msgSend((id)objc_msgSend(v21, "objectForKey:", CFSTR("SupportsAmbientColorAdaptation")), "BOOLValue") & 1;

    }
    v28->ownsClient = 0;
    v15[0] = 0;
    v15[1] = v15;
    v16 = 1375731712;
    v17 = 48;
    v18 = __Block_byref_object_copy__9;
    v19 = __Block_byref_object_dispose__9;
    v20 = v28;
    bsc = v28->bsc;
    v9 = MEMORY[0x1E0C809B0];
    v10 = -1073741824;
    v11 = 0;
    v12 = __40__CBAdaptationClient_initWithClientObj___block_invoke;
    v13 = &unk_1E68EA5E0;
    v14 = v15;
    -[BrightnessSystemClient registerNotificationBlock:](bsc, "registerNotificationBlock:", &v9);
    _Block_object_dispose(v15, 8);
  }
  return v28;
}

uint64_t __40__CBAdaptationClient_initWithClientObj___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "handleBrightnessSystemNotificationForKey:withValue:", a2, a3, a1, a3, a2, a1);
}

- (CBAdaptationClient)init
{
  BrightnessSystemClient *bsc;
  NSObject *log;
  os_log_type_t type;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  _QWORD *v12;
  _QWORD v13[2];
  int v14;
  int v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  CBAdaptationClient *v18;
  id v19;
  uint8_t v20[15];
  char v21;
  NSObject *v22;
  objc_super v23;
  SEL v24;
  CBAdaptationClient *v25;

  v25 = self;
  v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)CBAdaptationClient;
  v25 = -[CBAdaptationClient init](&v23, sel_init);
  if (!v25)
    return v25;
  v25->bsc = objc_alloc_init(BrightnessSystemClient);
  if (v25->bsc)
  {
    v25->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.Client.Adaptation", "default");
    if (!v25->_logHandle)
    {
      v22 = 0;
      v6 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v22 = v6;
      v21 = 16;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        log = v22;
        type = v21;
        __os_log_helper_16_0_0(v20);
        _os_log_error_impl(&dword_1B5291000, log, type, "Failed to create log handle", v20, 2u);
      }
    }
    v19 = 0;
    v19 = -[BrightnessSystemClient copyPropertyForKey:](v25->bsc, "copyPropertyForKey:", CFSTR("SupportedColorFX"));
    if (v19)
    {
      v25->_supported = objc_msgSend((id)objc_msgSend(v19, "objectForKey:", CFSTR("SupportsAmbientColorAdaptation")), "BOOLValue") & 1;

    }
    v25->ownsClient = 1;
    v13[0] = 0;
    v13[1] = v13;
    v14 = 1375731712;
    v15 = 48;
    v16 = __Block_byref_object_copy__9;
    v17 = __Block_byref_object_dispose__9;
    v18 = v25;
    bsc = v25->bsc;
    v7 = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __26__CBAdaptationClient_init__block_invoke;
    v11 = &unk_1E68EA5E0;
    v12 = v13;
    -[BrightnessSystemClient registerNotificationBlock:](bsc, "registerNotificationBlock:", &v7);
    _Block_object_dispose(v13, 8);
    return v25;
  }
  return 0;
}

uint64_t __26__CBAdaptationClient_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "handleBrightnessSystemNotificationForKey:withValue:", a2, a3, a1, a3, a2, a1);
}

- (void)dealloc
{
  objc_super v3;
  SEL v4;
  CBAdaptationClient *v5;

  v5 = self;
  v4 = a2;
  objc_sync_enter(self);
  if (v5->_logHandle)
  {

    v5->_logHandle = 0;
  }
  if (v5->bsc)
  {
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](v5->bsc, "registerNotificationBlock:forProperties:", 0);

  }
  objc_sync_exit(self);
  v3.receiver = v5;
  v3.super_class = (Class)CBAdaptationClient;
  -[CBAdaptationClient dealloc](&v3, sel_dealloc);
}

- (BOOL)setEnabled:(BOOL)a3
{
  void *v4;
  char v5;
  BOOL v6;

  v6 = a3;
  v5 = 0;
  if (!self->bsc)
    return 0;
  objc_sync_enter(self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v6);
  if (v4)
  {
    v5 = -[BrightnessSystemClient setProperty:forKey:](self->bsc, "setProperty:forKey:", v4, CFSTR("ColorAdaptationEnabled"));

  }
  objc_sync_exit(self);
  return v5 & 1;
}

- (BOOL)getEnabled
{
  BOOL v3;
  id v5;
  int v6;
  BOOL v7;
  BOOL v9;

  v7 = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    v5 = -[BrightnessSystemClient copyPropertyForKey:](self->bsc, "copyPropertyForKey:", CFSTR("ColorAdaptationEnabled"));
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = 0;
        if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
          v3 = -[CBAdaptationClient available](self, "available");
        v7 = v3;
      }

    }
    v6 = 0;
  }
  else
  {
    v9 = 0;
    v6 = 1;
  }
  objc_sync_exit(self);
  if (!v6)
    return v7;
  return v9;
}

- (BOOL)available
{
  id v4;
  int v5;
  char v6;
  char v8;

  v6 = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    v4 = -[BrightnessSystemClient copyPropertyForKey:](self->bsc, "copyPropertyForKey:", CFSTR("ColorAdaptationAvailable"));
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = objc_msgSend(v4, "BOOLValue") & 1;

    }
    v5 = 0;
  }
  else
  {
    v8 = 0;
    v5 = 1;
  }
  objc_sync_exit(self);
  if (!v5)
    v8 = v6;
  return v8 & 1;
}

- (int)getAdaptationMode
{
  id v4;
  int v5;
  int mode;
  int v8;

  mode = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    if (self->_modeSet)
    {
      mode = self->_mode;
    }
    else
    {
      v4 = -[BrightnessSystemClient copyPropertyForKey:](self->bsc, "copyPropertyForKey:", CFSTR("ColorAdaptationMode"));
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          mode = objc_msgSend(v4, "intValue");

        self->_mode = mode;
        self->_modeSet = 1;
      }
    }
    v5 = 0;
  }
  else
  {
    v8 = 0;
    v5 = 1;
  }
  objc_sync_exit(self);
  if (!v5)
    return mode;
  return v8;
}

- (BOOL)overrideStrengths:(float *)a3 forModes:(int *)a4 nModes:(int)a5
{
  double v5;
  id v7;
  id v9;
  void *v10;
  int i;
  void *v12;
  char v13;

  v13 = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    if (a3)
    {
      if (a4)
      {
        if (a5 > 0 && a5 <= 6)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a5);
          if (v12)
          {
            for (i = 0; i < a5; ++i)
            {
              v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a4[i]);
              if (v10)
              {
                v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
                *(float *)&v5 = a3[i];
                v9 = (id)objc_msgSend(v7, "initWithFloat:", v5);
                if (v9)
                {
                  objc_msgSend(v12, "setObject:forKey:", v9, v10);

                }
              }
            }
            v13 = -[BrightnessSystemClient setProperty:forKey:](self->bsc, "setProperty:forKey:", v12, CFSTR("ColorAdaptationModeMapping"));

          }
        }
      }
    }
  }
  objc_sync_exit(self);
  return v13 & 1;
}

- (BOOL)getStrengths:(float *)a3 nStrengths:(int)a4
{
  float v4;
  int v6;
  void *v8;
  id v9;
  int i;
  int v11;
  id v12;
  int v13;
  char v14;
  char v18;

  v14 = 0;
  objc_sync_enter(self);
  if (self->bsc && a3 && a4)
  {
    __memset_chk();
    v12 = -[BrightnessSystemClient copyPropertyForKey:](self->bsc, "copyPropertyForKey:", CFSTR("ColorAdaptationModeMapping"));
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = a4 <= 6 ? a4 : 6;
        v11 = 0;
        for (i = 0; i < v6; ++i)
        {
          v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", i);
          if (v9)
          {
            v8 = (void *)objc_msgSend(v12, "objectForKey:", v9);

            objc_msgSend(v8, "floatValue");
            a3[i] = v4;
            ++v11;
          }
        }
        if (v11 == v6)
          v14 = 1;
      }
    }
    if (v12)

    v13 = 0;
  }
  else
  {
    v18 = 0;
    v13 = 1;
  }
  objc_sync_exit(self);
  if (!v13)
    v18 = v14;
  return v18 & 1;
}

- (void)handleBrightnessSystemNotificationForKey:(id)a3 withValue:(id)a4
{
  NSObject *notificationQueue;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  CBAdaptationClient *obj;
  uint64_t v10;
  NSObject *v11;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v14[7];
  os_log_type_t v15;
  os_log_t oslog;
  uint64_t block;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  os_log_type_t v26;
  os_log_t v27;
  os_log_type_t v28;
  os_log_t v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  SEL v34;
  CBAdaptationClient *v35;
  uint8_t v36[64];
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35 = self;
  v34 = a2;
  v33 = a3;
  v32 = a4;
  v31 = 0;
  v30 = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ColorAdaptationAvailable")) & 1) != 0)
  {
    v31 = 1;
    v30 = v32;
  }
  else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ColorAdaptationEnabled")) & 1) != 0)
  {
    v31 = 2;
    v30 = v32;
  }
  else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("SupportedColorFX")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (id)objc_msgSend(v32, "objectForKey:", CFSTR("SupportsAmbientColorAdaptation"));
      v31 = 3;
    }
  }
  else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ColorAdaptationIntegratedSupport ")) & 1) != 0)
  {
    v31 = 4;
    v30 = v32;
  }
  else
  {
    v29 = 0;
    if (v35->_logHandle)
    {
      logHandle = v35->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v29 = logHandle;
    v28 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v33);
      _os_log_error_impl(&dword_1B5291000, v29, v28, "error: unknown notification type (%@)", v37, 0xCu);
    }
  }
  v27 = 0;
  if (v35->_logHandle)
  {
    v11 = v35->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v10 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v10 = init_default_corebrightness_log();
    v11 = v10;
  }
  v27 = v11;
  v26 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_5_8_64_8_0_8_64_8_0_8_0((uint64_t)v36, (uint64_t)v33, v31, (uint64_t)v30, (uint64_t)v35->_notificationBlock, (uint64_t)v35->_notificationQueue);
    _os_log_debug_impl(&dword_1B5291000, v27, v26, "key=%@ (type=%tu) value=%@  block=%p queue=%p", v36, 0x34u);
  }
  obj = v35;
  objc_sync_enter(v35);
  if (v35->_notificationBlock && v35->_notificationQueue)
  {
    v25 = 0;
    v25 = _Block_copy(v35->_notificationBlock);
    notificationQueue = v35->_notificationQueue;
    block = MEMORY[0x1E0C809B0];
    v18 = -1073741824;
    v19 = 0;
    v20 = __73__CBAdaptationClient_handleBrightnessSystemNotificationForKey_withValue___block_invoke;
    v21 = &unk_1E68EA850;
    v23 = v25;
    v24 = v31;
    v22 = v30;
    dispatch_async(notificationQueue, &block);
  }
  else
  {
    oslog = 0;
    if (v35->_logHandle)
    {
      v8 = v35->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v7 = init_default_corebrightness_log();
      v8 = v7;
    }
    oslog = v8;
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog;
      v6 = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_1B5291000, v5, v6, "no callback or queue available - ignoring notification", v14, 2u);
    }
  }
  objc_sync_exit(obj);
}

void __73__CBAdaptationClient_handleBrightnessSystemNotificationForKey_withValue___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
}

- (BOOL)registerNotificationCallbackBlock:(id)a3 withQueue:(id)a4
{
  CBAdaptationClient *obj;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[15];
  char v11;
  NSObject *v12;
  OS_dispatch_queue *v13;
  id v14;
  SEL v15;
  CBAdaptationClient *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = (OS_dispatch_queue *)a4;
  if (a3 && v13)
  {
    -[CBAdaptationClient unregisterNotificationCallbackBlock](v16, "unregisterNotificationCallbackBlock");
    obj = v16;
    objc_sync_enter(v16);
    v16->_notificationQueue = v13;
    dispatch_retain((dispatch_object_t)v13);
    v16->_notificationBlock = _Block_copy(v14);
    objc_sync_exit(obj);
    return 1;
  }
  else
  {
    v12 = 0;
    if (v16->_logHandle)
    {
      logHandle = v16->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v12 = logHandle;
    v11 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v12;
      type = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1B5291000, log, type, "error: invalid parameter(s)", v10, 2u);
    }
    return 0;
  }
}

- (void)unregisterNotificationCallbackBlock
{
  objc_sync_enter(self);
  if (self->_notificationQueue)
  {
    dispatch_release((dispatch_object_t)self->_notificationQueue);
    self->_notificationQueue = 0;
  }
  if (self->_notificationBlock)
  {
    _Block_release(self->_notificationBlock);
    self->_notificationBlock = 0;
  }
  objc_sync_exit(self);
}

- (BOOL)registerNotificationForType:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  __CFString *v6;
  char v7;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 0;
  switch(a3)
  {
    case 1uLL:
      v6 = CFSTR("ColorAdaptationAvailable");
      break;
    case 2uLL:
      v6 = CFSTR("ColorAdaptationEnabled");
      break;
    case 3uLL:
      v6 = CFSTR("SupportedColorFX");
      break;
    case 4uLL:
      v6 = CFSTR("ColorAdaptationIntegratedSupport ");
      break;
    default:
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v10, a3);
        _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "error: unknown notification type (%tu)", v10, 0xCu);
      }
      break;
  }
  if (v6)
  {
    -[BrightnessSystemClient registerNotificationForKey:](self->bsc, "registerNotificationForKey:", v6);

    v7 = 1;
  }
  return v7 & 1;
}

- (void)unregisterNotificationForType:(unint64_t)a3
{
  uint64_t inited;
  NSObject *logHandle;
  __CFString *v5;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  switch(a3)
  {
    case 1uLL:
      v5 = CFSTR("ColorAdaptationAvailable");
      break;
    case 2uLL:
      v5 = CFSTR("ColorAdaptationEnabled");
      break;
    case 3uLL:
      v5 = CFSTR("SupportedColorFX");
      break;
    case 4uLL:
      v5 = CFSTR("ColorAdaptationIntegratedSupport ");
      break;
    default:
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v8, a3);
        _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "error: unknown notification type (%tu)", v8, 0xCu);
      }
      break;
  }
  if (v5)
  {
    -[BrightnessSystemClient unregisterNotificationForKey:](self->bsc, "unregisterNotificationForKey:", v5);

  }
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

@end
