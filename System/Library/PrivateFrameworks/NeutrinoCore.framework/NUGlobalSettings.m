@implementation NUGlobalSettings

- (NUGlobalSettings)init
{
  NUGlobalSettings *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v5;
  NSMutableDictionary *settings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUGlobalSettings;
  v2 = -[NUGlobalSettings init](&v8, sel_init);
  v3 = dispatch_queue_create("NUGlobalSettings", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  settings = v2->_settings;
  v2->_settings = v5;

  return v2;
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__NUGlobalSettings_reset__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)settingForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__738;
  v21 = __Block_byref_object_dispose__739;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__NUGlobalSettings_settingForKey_defaultValue___block_invoke;
  v13[3] = &unk_1E50619E8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_settingForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_settings, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v7[2](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settings, "setObject:forKeyedSubscript:", v8, v6);
  }

  return v8;
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NUGlobalSettings_setSetting_forKey___block_invoke;
  block[3] = &unk_1E5062E88;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

- (BOOL)BOOLSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __51__NUGlobalSettings_BOOLSettingForKey_defaultValue___block_invoke;
  v16 = &unk_1E505FF68;
  v17 = v6;
  v18 = v7;
  v8 = v7;
  v9 = v6;
  -[NUGlobalSettings settingForKey:defaultValue:](self, "settingForKey:defaultValue:", v9, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue", v13, v14, v15, v16);

  return v11;
}

- (int64_t)integerSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__NUGlobalSettings_integerSettingForKey_defaultValue___block_invoke;
  v16 = &unk_1E505FF68;
  v17 = v6;
  v18 = v7;
  v8 = v7;
  v9 = v6;
  -[NUGlobalSettings settingForKey:defaultValue:](self, "settingForKey:defaultValue:", v9, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue", v13, v14, v15, v16);

  return v11;
}

- (double)doubleSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __53__NUGlobalSettings_doubleSettingForKey_defaultValue___block_invoke;
  v17 = &unk_1E505FF68;
  v18 = v6;
  v19 = v7;
  v8 = v7;
  v9 = v6;
  -[NUGlobalSettings settingForKey:defaultValue:](self, "settingForKey:defaultValue:", v9, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue", v14, v15, v16, v17);
  v12 = v11;

  return v12;
}

- (id)stringSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__NUGlobalSettings_stringSettingForKey_defaultValue___block_invoke;
  v12[3] = &unk_1E505FF90;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[NUGlobalSettings settingForKey:defaultValue:](self, "settingForKey:defaultValue:", v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)urlSettingForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__NUGlobalSettings_urlSettingForKey_defaultValue___block_invoke;
  v12[3] = &unk_1E505FFB8;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[NUGlobalSettings settingForKey:defaultValue:](self, "settingForKey:defaultValue:", v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

id __50__NUGlobalSettings_urlSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  getStringEnv(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __53__NUGlobalSettings_stringSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  getStringEnv(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

uint64_t __53__NUGlobalSettings_doubleSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  double (**v3)(_QWORD);
  void *v4;
  void *v5;
  double v6;
  double v7;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = *(void **)(a1 + 32);
  v3 = (double (**)(_QWORD))*(id *)(a1 + 40);
  getStringEnv(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "doubleValue");
  else
    v6 = v3[2](v3);
  v7 = v6;

  return objc_msgSend(v1, "numberWithDouble:", v7);
}

uint64_t __54__NUGlobalSettings_integerSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t (**v3)(_QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = *(void **)(a1 + 32);
  v3 = (uint64_t (**)(_QWORD))*(id *)(a1 + 40);
  getStringEnv(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = v3[2](v3);
  v7 = v6;

  return objc_msgSend(v1, "numberWithInteger:", v7);
}

uint64_t __51__NUGlobalSettings_BOOLSettingForKey_defaultValue___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t (**v3)(_QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = *(void **)(a1 + 32);
  v3 = (uint64_t (**)(_QWORD))*(id *)(a1 + 40);
  getStringEnv(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = v3[2](v3);
  v7 = v6;

  return objc_msgSend(v1, "numberWithBool:", v7);
}

uint64_t __38__NUGlobalSettings_setSetting_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

void __47__NUGlobalSettings_settingForKey_defaultValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_settingForKey:defaultValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __25__NUGlobalSettings_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

+ (id)globalSettings
{
  if (globalSettings_onceToken != -1)
    dispatch_once(&globalSettings_onceToken, &__block_literal_global_948);
  return (id)globalSettings_globalSettings;
}

+ (void)reset
{
  id v2;

  objc_msgSend(a1, "globalSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

+ (BOOL)renderJobDebug
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_JOB_DEBUG"), &__block_literal_global_10);

  return v3;
}

+ (void)setRenderJobDebug:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JOB_DEBUG"));

}

+ (BOOL)renderJobDisableResultCache
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_JOB_DISABLE_RESULT_CACHE"), &__block_literal_global_13);

  return v3;
}

+ (void)setRenderJobDisableResultCache:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JOB_DISABLE_RESULT_CACHE"));

}

+ (BOOL)renderJobDebugCaptureCanceledJobs
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_CANCELED_JOBS"), &__block_literal_global_16);

  return v3;
}

+ (void)setRenderJobDebugCaptureCanceledJobs:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_CANCELED_JOBS"));

}

+ (BOOL)renderJobDebugCaptureNodeGraphs
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_NODE_GRAPHS"), &__block_literal_global_19);

  return v3;
}

+ (void)setRenderJobDebugCaptureNodeGraphs:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_NODE_GRAPHS"));

}

+ (BOOL)renderJobDebugCaptureNodeCache
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_NODE_CACHE"), &__block_literal_global_22);

  return v3;
}

+ (void)setRenderJobDebugCaptureNodeCache:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_NODE_CACHE"));

}

+ (BOOL)renderJobDebugCapturePerfStatHistory
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_PERF_STAT_HISTORY"), &__block_literal_global_25);

  return v3;
}

+ (void)setRenderJobDebugCapturePerfStatHistory:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_PERF_STAT_HISTORY"));

}

+ (BOOL)renderJobDebugCaptureOnlyPerfStats
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_ONLY_PERF_STATS"), &__block_literal_global_28);

  return v3;
}

+ (void)setRenderJobDebugCaptureOnlyPerfStats:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_ONLY_PERF_STATS"));

}

+ (BOOL)renderJobDebugCapture5PercentOfJobs
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_5_PERCENT_OF_JOBS"), &__block_literal_global_31);

  return v3;
}

+ (void)setRenderJobDebugCapture5PercentOfJobs:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JOB_DEBUG_CAPTURE_5_PERCENT_OF_JOBS"));

}

+ (NSString)tempDir
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringSettingForKey:defaultValue:", CFSTR("NU_TEMP_DIR"), &__block_literal_global_34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setTempDir:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_TEMP_DIR"));

}

+ (BOOL)deviceDisableMetal
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DEVICE_DISABLE_METAL"), &__block_literal_global_42);

  return v3;
}

+ (BOOL)devicePrintRenderer
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DEVICE_PRINT_RENDERER"), &__block_literal_global_45);

  return v3;
}

+ (void)setDevicePrintRenderer:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DEVICE_PRINT_RENDERER"));

}

+ (int64_t)deviceDefaultSampleMode
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_DEVICE_DEFAULT_SAMPLE_MODE"), &__block_literal_global_50);

  return v3;
}

+ (void)setDeviceDefaultSampleMode:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DEVICE_DEFAULT_SAMPLE_MODE"));

}

+ (int64_t)storagePoolNonPurgeableLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_STORAGE_POOL_NONPURGEABLE_LIMIT"), &__block_literal_global_53);

  return v3;
}

+ (void)setStoragePoolNonPurgeableLimit:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STORAGE_POOL_NONPURGEABLE_LIMIT"));

}

+ (int64_t)storagePoolPurgeableLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_STORAGE_POOL_PURGEABLE_LIMIT"), &__block_literal_global_56);

  return v3;
}

+ (void)setStoragePoolPurgeableLimit:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STORAGE_POOL_PURGEABLE_LIMIT"));

}

+ (double)storagePoolMigrationDelay
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_STORAGE_POOL_MIGRATION_DELAY"), &__block_literal_global_60);
  v4 = v3;

  return v4;
}

+ (void)setStoragePoolMigrationDelay:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STORAGE_POOL_MIGRATION_DELAY"));

}

+ (BOOL)surfaceStorageFactoryUsePool
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_SURFACE_STORAGE_FACTORY_USE_POOL"), &__block_literal_global_63);

  return v3;
}

+ (void)setSurfaceStorageFactoryUsePool:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_SURFACE_STORAGE_FACTORY_USE_POOL"));

}

+ (BOOL)bufferStorageFactoryUsePool
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_BUFFER_STORAGE_FACTORY_USE_POOL"), &__block_literal_global_66);

  return v3;
}

+ (void)setBufferStorageFactoryUsePool:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_BUFFER_STORAGE_FACTORY_USE_POOL"));

}

+ (BOOL)imageRenderJobUseSurfaceRenderer
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_IMAGE_RENDER_JOB_USE_SURFACE_RENDERER"), &__block_literal_global_69);

  return v3;
}

+ (void)setImageRenderJobUseSurfaceRenderer:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_IMAGE_RENDER_JOB_USE_SURFACE_RENDERER"));

}

+ (BOOL)imageRenderJobUseTextureRenderer
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_IMAGE_RENDER_JOB_USE_TEXTURE_RENDERER"), &__block_literal_global_72);

  return v3;
}

+ (void)setImageRenderJobUseTextureRenderer:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_IMAGE_RENDER_JOB_USE_TEXTURE_RENDERER"));

}

+ (double)renderJSPipelineTimeout
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_RENDER_JS_TIMEOUT"), &__block_literal_global_75);
  v4 = v3;

  return v4;
}

+ (void)setRenderJSPipelineTimeout:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_JS_TIMEOUT"));

}

+ (BOOL)rendererUseHalfFloat
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDERER_USE_HALF_FLOAT"), &__block_literal_global_78);

  return v3;
}

+ (void)setRendererUseHalfFloat:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDERER_USE_HALF_FLOAT"));

}

+ (BOOL)rendererClampToAlpha
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDERER_CLAMP_TO_ALPHA"), &__block_literal_global_82);

  return v3;
}

+ (void)setRendererClampToAlpha:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDERER_CLAMP_TO_ALPHA"));

}

+ (BOOL)rendererUseP3Linear
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDERER_USE_P3_LINEAR"), &__block_literal_global_85);

  return v3;
}

+ (void)setRendererUseP3Linear:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDERER_USE_P3_LINEAR"));

}

+ (int64_t)rendererContextLargeMemoryTarget
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_RENDERER_CONTEXT_LARGE_MEMORY_TARGET"), &__block_literal_global_88);

  return v3;
}

+ (void)setRendererContextLargeMemoryTarget:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDERER_CONTEXT_LARGE_MEMORY_TARGET"));

}

+ (int64_t)rendererContextLowMemoryTarget
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_RENDERER_CONTEXT_LOW_MEMORY_TARGET"), &__block_literal_global_91);

  return v3;
}

+ (void)setRendererContextLowMemoryTarget:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDERER_CONTEXT_LOW_MEMORY_TARGET"));

}

+ (int64_t)imageTileSize
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_IMAGE_TILE_SIZE"), &__block_literal_global_94);

  return v3;
}

+ (void)setImageTileSize:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_IMAGE_TILE_SIZE"));

}

+ (int64_t)imageTileBorder
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_IMAGE_TILE_BORDER"), &__block_literal_global_97);

  return v3;
}

+ (void)setImageTileBorder:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_IMAGE_TILE_BORDER"));

}

+ (BOOL)imageSourceDisableRAW
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_IMAGE_SOURCE_DISABLE_RAW"), &__block_literal_global_100);

  return v3;
}

+ (void)setImageSourceDisableRAW:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_IMAGE_SOURCE_DISABLE_RAW"));

}

+ (BOOL)imageSourceDisableCacheImmediately
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_IMAGE_SOURCE_DISABLE_CACHE_IMMEDIATELY"), &__block_literal_global_103);

  return v3;
}

+ (void)setImageSourceDisableCacheImmediately:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_IMAGE_SOURCE_DISABLE_CACHE_IMMEDIATELY"));

}

+ (int64_t)cacheNodeCacheSizeLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_CACHE_NODE_CACHE_SIZE_LIMIT"), &__block_literal_global_106);

  return v3;
}

+ (void)setCacheNodeCacheSizeLimit:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_CACHE_NODE_CACHE_SIZE_LIMIT"));

}

+ (int64_t)cacheNodeFilePermissions
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_CACHE_NODE_FILE_PERMISSIONS"), &__block_literal_global_109);

  return v3;
}

+ (void)setCacheNodeFilePermissions:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_CACHE_NODE_FILE_PERMISSIONS"));

}

+ (double)cacheNodeImageCompression
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_CACHE_NODE_IMAGE_COMPRESSION"), &__block_literal_global_112);
  v4 = v3;

  return v4;
}

+ (void)setCacheNodeImageCompression:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_CACHE_NODE_IMAGE_COMPRESSION"));

}

+ (BOOL)isViewDebugEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_VIEW_DEBUG_ENABLED"), &__block_literal_global_115);

  return v3;
}

+ (void)setViewDebugEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_VIEW_DEBUG_ENABLED"));

}

+ (NSURL)cacheNodeDirectoryURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlSettingForKey:defaultValue:", CFSTR("NU_CACHE_NODE_DIRECTORY"), &__block_literal_global_118);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (void)setCacheNodeDirectoryURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_CACHE_NODE_DIRECTORY"));

}

+ (BOOL)renderVideoLive
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_PLATFORM_RENDER_VIDEO_LIVE"), &__block_literal_global_124);

  return v3;
}

+ (void)setRenderVideoLive:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_PLATFORM_RENDER_VIDEO_LIVE"));

}

+ (BOOL)platformHasWideColor
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_PLATFORM_HAS_WIDE_COLOR"), &__block_literal_global_128);

  return v3;
}

+ (void)setPlatformHasWideColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_PLATFORM_HAS_WIDE_COLOR"));

}

+ (NSURL)pipelineSourceURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlSettingForKey:defaultValue:", CFSTR("NU_PIPELINE_SOURCE_URL"), &__block_literal_global_133);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (void)setPipelineSourceURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_PIPELINE_SOURCE_URL"));

}

+ (BOOL)imageLayerDebug
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_IMAGE_LAYER_DEBUG"), &__block_literal_global_136);

  return v3;
}

+ (void)setImageLayerDebug:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_IMAGE_LAYER_DEBUG"));

}

+ (BOOL)displayDisableDeepColor
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DISPLAY_DISABLE_DEEP_COLOR"), &__block_literal_global_139);

  return v3;
}

+ (void)setDisplayDisableDeepColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DISPLAY_DISABLE_DEEP_COLOR"));

}

+ (BOOL)displayForceDeepColor
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DISPLAY_FORCE_DEEP_COLOR"), &__block_literal_global_142);

  return v3;
}

+ (void)setDisplayForceDeepColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DISPLAY_FORCE_DEEP_COLOR"));

}

+ (BOOL)displayDisableColorMatching
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DISPLAY_DISABLE_COLOR_MATCHING"), &__block_literal_global_145);

  return v3;
}

+ (void)setDisplayDisableColorMatching:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DISPLAY_DISABLE_COLOR_MATCHING"));

}

+ (BOOL)renderTransparencyOverBlack
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_TRANSPARENCY_OVER_BLACK"), &__block_literal_global_148);

  return v3;
}

+ (void)setRenderTransparencyOverBlack:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_TRANSPARENCY_OVER_BLACK"));

}

+ (BOOL)renderTransparencyOpaque
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_TRANSPARENCY_OPAQUE"), &__block_literal_global_151);

  return v3;
}

+ (void)setRenderTransparencyOpaque:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_TRANSPARENCY_OPAQUE"));

}

+ (void)setUpCacheNodeDirectoryWithComponent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporaryDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[NUGlobalSettings setCacheNodeDirectoryURL:](NUGlobalSettings, "setCacheNodeDirectoryURL:", v7);
  +[NUGlobalSettings setCacheNodeFilePermissions:](NUGlobalSettings, "setCacheNodeFilePermissions:", 511);
  +[NUCacheNode clearCacheDirectory](NUCacheNode, "clearCacheDirectory");

}

+ (BOOL)logPeakRenderCIUsuage
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_SHOW_PEAK_RENDER_MEMORY"), &__block_literal_global_155);

  return v3;
}

+ (void)setLogPeakRenderCIUsuage:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_SHOW_PEAK_RENDER_MEMORY"));

}

+ (BOOL)runNeutrinoSynchronously
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RUN_SYNCHRONOUSLY"), &__block_literal_global_158);

  return v3;
}

+ (void)setRunNeutrinoSynchronously:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RUN_SYNCHRONOUSLY"));

}

+ (BOOL)disableIOSurfacePortaitExport
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DISABLE_IOSURFACE_PORTRAIT_EXPORT"), &__block_literal_global_161);

  return v3;
}

+ (void)setDisableIOSurfacePortaitExport:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DISABLE_IOSURFACE_PORTRAIT_EXPORT"));

}

+ (BOOL)enableHDRSupport
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_ENABLE_HDR_SUPPORT"), &__block_literal_global_164_881);

  return v3;
}

+ (void)setEnableHDRSupport:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_ENABLE_HDR_SUPPORT"));

}

+ (BOOL)allAssetsCanUseHDRPipeline
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_ALL_ASSETS_CAN_USE_HDR_PIPELINE"), &__block_literal_global_167);

  return v3;
}

+ (void)setAllAssetsCanUseHDRPipeline:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_ALL_ASSETS_CAN_USE_HDR_PIPELINE"));

}

+ (double)HLGOpticalScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_HLG_OPTICAL_SCALE"), &__block_literal_global_170);
  v4 = v3;

  return v4;
}

+ (double)maxGainMapHeadroom
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_MAX_GAINMAP_HEADROOM"), &__block_literal_global_173);
  v4 = v3;

  return v4;
}

+ (void)setMaxGainMapHeadroom:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_MAX_GAINMAP_HEADROOM"));

}

+ (BOOL)enableDash5
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_ENABLE_DASH5"), &__block_literal_global_176);

  return v3;
}

+ (void)setEnableDash5:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_ENABLE_DASH5"));

}

+ (BOOL)enableFlexRange
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_ENABLE_FLEX_RANGE"), &__block_literal_global_181);

  return v3;
}

+ (void)setEnableFlexRange:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_ENABLE_FLEX_RANGE"));

}

+ (BOOL)renderMeteorPlusAsHDR
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_METEOR_PLUS_AS_HDR"), &__block_literal_global_185);

  return v3;
}

+ (void)setRenderMeteorPlusAsHDR:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_METEOR_PLUS_AS_HDR"));

}

+ (BOOL)renderEDRAsPQ
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_RENDER_EDR_AS_PQ"), &__block_literal_global_188);

  return v3;
}

+ (void)setRenderEDRAsPQ:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_EDR_AS_PQ"));

}

+ (BOOL)forceMeteorPlusPlus
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_FORCE_METEOR_PLUS_PLUS"), &__block_literal_global_191);

  return v3;
}

+ (void)setForceMeteorPlusPlus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_FORCE_METEOR_PLUS_PLUS"));

}

+ (BOOL)forceMeteorPlusLinear
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_FORCE_METEOR_PLUS_LINEAR"), &__block_literal_global_194);

  return v3;
}

+ (void)setForceMeteorPlusLinear:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_FORCE_METEOR_PLUS_LINEAR"));

}

+ (BOOL)disablePacked10BitPixelFormats
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DISABLE_PACKED_10BIT_PIXEL_FORMATS"), &__block_literal_global_197);

  return v3;
}

+ (void)setDisablePacked10BitPixelFormats:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DISABLE_PACKED_10BIT_PIXEL_FORMATS"));

}

+ (double)overrideDisplayHeadroom
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_OVERRIDE_DISPLAY_HEADROOM"), &__block_literal_global_200);
  v4 = v3;

  return v4;
}

+ (void)setOverrideDisplayHeadroom:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_OVERRIDE_DISPLAY_HEADROOM"));

}

+ (double)thresholdDisplayHeadroom
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_THRESHOLD_DISPLAY_HEADROOM"), &__block_literal_global_203);
  v4 = v3;

  return v4;
}

+ (void)setThresholdDisplayHeadroom:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_THRESHOLD_DISPLAY_HEADROOM"));

}

+ (unint64_t)videoCompositorDebugMode
{
  void *v2;
  unint64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_VIDEO_COMPOSITOR_DEBUG_MODE"), &__block_literal_global_206);

  return v3;
}

+ (void)setVideoCompositorDebugMode:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_VIDEO_COMPOSITOR_DEBUG_MODE"));

}

+ (BOOL)forceSoftwareVideoEncoder
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_FORCE_SOFTWARE_VIDEO_ENCODER"), &__block_literal_global_209);

  return v3;
}

+ (void)setForceSoftwareVideoEncoder:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_FORCE_SOFTWARE_VIDEO_ENCODER"));

}

+ (BOOL)alwaysRequireHardwareVideoEncoder
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_ALWAYS_REQUIRE_HARDWARE_VIDEO_ENCODER"), &__block_literal_global_212);

  return v3;
}

+ (void)setAlwaysRequireHardwareVideoEncoder:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_ALWAYS_REQUIRE_HARDWARE_VIDEO_ENCODER"));

}

+ (NSString)debugRenderBlue
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringSettingForKey:defaultValue:", CFSTR("NU_DEBUG_RENDER_BLUE"), &__block_literal_global_215);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setDebugRenderBlue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DEBUG_RENDER_BLUE"));

}

+ (NSString)debugRenderPurple
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringSettingForKey:defaultValue:", CFSTR("NU_DEBUG_RENDER_PURPLE"), &__block_literal_global_218);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setDebugRenderPurple:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DEBUG_RENDER_PURPLE"));

}

+ (NSString)debugRenderYellow
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringSettingForKey:defaultValue:", CFSTR("NU_DEBUG_RENDER_YELLOW"), &__block_literal_global_221_866);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setDebugRenderYellow:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DEBUG_RENDER_YELLOW"));

}

+ (BOOL)disableMeteorGainMapGeneration
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DISABLE_METEOR_GAIN_MAP_GENERATION"), &__block_literal_global_224);

  return v3;
}

+ (void)setDisableMeteorGainMapGeneration:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DISABLE_METEOR_GAIN_MAP_GENERATION"));

}

+ (BOOL)forceMeteorGainMapGeneration
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_FORCE_METEOR_GAIN_MAP_GENERATION"), &__block_literal_global_227);

  return v3;
}

+ (void)setForceMeteorGainMapGeneration:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_FORCE_METEOR_GAIN_MAP_GENERATION"));

}

+ (NSString)meteorGainMapExposureCompensationMode
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringSettingForKey:defaultValue:", CFSTR("NU_METEOR_GAIN_MAP_EXPOSURE_COMPENSATION_MODE"), &__block_literal_global_230);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)setMeteorGainMapExposureCompensationMode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_METEOR_GAIN_MAP_EXPOSURE_COMPENSATION_MODE"));

}

+ (BOOL)enforceMinimumBitRateForExportedVideos
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_ENFORCE_MIN_BITRATE_FOR_VIDEO"), &__block_literal_global_233);

  return v3;
}

+ (void)setEnforceMinimumBitRateForExportedVideos:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_ENFORCE_MIN_BITRATE_FOR_VIDEO"));

}

+ (BOOL)enforceMinimumBitRateForCinematicVideos
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_ENFORCE_MIN_BITRATE_FOR_CINEMATIC_VIDEO"), &__block_literal_global_236);

  return v3;
}

+ (void)setEnforceMinimumBitRateForCinematicVideos:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_ENFORCE_MIN_BITRATE_FOR_CINEMATIC_VIDEO"));

}

+ (BOOL)disableAuxiliaryImageCacheFromSource
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DISABLE_AUXILIARY_IMAGE_CACHE_FROM_SOURCE"), &__block_literal_global_239);

  return v3;
}

+ (void)setDisableAuxiliaryImageCacheFromSource:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DISABLE_AUXILIARY_IMAGE_CACHE_FROM_SOURCE"));

}

+ (double)mediaViewRenderCoalescingInterval
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_MEDIAVIEW_COALESCED_UPDATES_PER_SECOND"), &__block_literal_global_242);
  v4 = v3;

  return 1.0 / v4;
}

+ (void)setMediaViewRenderCoalescingInterval:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_MEDIAVIEW_COALESCED_UPDATES_PER_SECOND"));

}

+ (BOOL)mediaViewDisableLivePhoto
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_MEDIAVIEW_DISABLE_LIVE_PHOTO"), &__block_literal_global_245);

  return v3;
}

+ (void)setMediaViewDisableLivePhoto:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_MEDIAVIEW_DISABLE_LIVE_PHOTO"));

}

+ (BOOL)enableSpatialMediaEditing
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_ENABLE_SPATIAL_MEDIA_EDITING"), &__block_literal_global_248);

  return v3;
}

+ (void)setEnableSpatialMediaEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_ENABLE_SPATIAL_MEDIA_EDITING"));

}

+ (BOOL)shouldRevertStyledOriginalIfPossible
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_SHOULD_REVERT"), &__block_literal_global_251);

  return v3;
}

+ (void)setShouldRevertStyledOriginalIfPossible:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_SHOULD_REVERT"));

}

+ (BOOL)shouldEnableStylesForProRaw
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_SHOULD_ENABLE_ON_PRORAW"), &__block_literal_global_254);

  return v3;
}

+ (void)setShouldEnableStylesForProRaw:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_SHOULD_ENABLE_ON_PRORAW"));

}

+ (int64_t)semanticStyleTemporalWindowSize
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_STYLES_TEMPORAL_WINDOW_SIZE"), &__block_literal_global_257);

  return v3;
}

+ (void)setSemanticStyleTemporalWindowSize:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_TEMPORAL_WINDOW_SIZE"));

}

+ (BOOL)overrideSemanticStylesHardwareCheck
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_OVERRIDE_HARDWARE"), &__block_literal_global_260);

  return v3;
}

+ (void)setOverrideSemanticStylesHardwareCheck:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_OVERRIDE_HARDWARE"));

}

+ (BOOL)semanticStyleDisableDeltaMap
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_DISABLE_DELTA_MAP"), &__block_literal_global_263);

  return v3;
}

+ (void)setSemanticStyleDisableDeltaMap:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_DISABLE_DELTA_MAP"));

}

+ (BOOL)semanticStyleDisableResiduals
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_DISABLE_RESIDUALS"), &__block_literal_global_266);

  return v3;
}

+ (void)setSemanticStyleDisableResiduals:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_DISABLE_RESIDUALS"));

}

+ (BOOL)semanticStyleForceResiduals
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_FORCE_RESIDUALS"), &__block_literal_global_269);

  return v3;
}

+ (void)setSemanticStyleForceResiduals:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_FORCE_RESIDUALS"));

}

+ (BOOL)semanticStyleAllowResidualsMismatch
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_ALLOW_RESIDUALS_MISMATCH"), &__block_literal_global_272);

  return v3;
}

+ (void)setSemanticStyleAllowResidualsMismatch:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_ALLOW_RESIDUALS_MISMATCH"));

}

+ (BOOL)semanticStyleForceSyntheticNoise
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_FORCE_SYNTHETIC_NOISE"), &__block_literal_global_275);

  return v3;
}

+ (void)setSemanticStyleForceSyntheticNoise:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_FORCE_SYNTHETIC_NOISE"));

}

+ (BOOL)debugDumpStyleEngineInputs
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_DEBUG_DUMP_STYLE_ENGINE_INPUTS"), &__block_literal_global_278);

  return v3;
}

+ (void)setDebugDumpStyleEngineInputs:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DEBUG_DUMP_STYLE_ENGINE_INPUTS"));

}

+ (BOOL)semanticStyleUseDynamicConfig
{
  void *v2;
  char v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("NU_STYLES_USE_DYNAMIC_CONFIG"), &__block_literal_global_281);

  return v3;
}

+ (void)setSemanticStyleUseDynamicConfig:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_STYLES_USE_DYNAMIC_CONFIG"));

}

+ (double)renderResourceEvictionDelay
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleSettingForKey:defaultValue:", CFSTR("NU_RENDER_RESOURCE_EVICTION_DELAY"), &__block_literal_global_287);
  v4 = v3;

  return v4;
}

+ (void)setRenderResourceEvictionDelay:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_RENDER_RESOURCE_EVICTION_DELAY"));

}

+ (int64_t)debugSoftMemoryLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerSettingForKey:defaultValue:", CFSTR("NU_DEBUG_SOFT_MEMORY_LIMIT"), &__block_literal_global_290);

  return v3;
}

+ (void)setDebugSoftMemoryLimit:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "globalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetting:forKey:", v4, CFSTR("NU_DEBUG_SOFT_MEMORY_LIMIT"));

}

uint64_t __40__NUGlobalSettings_debugSoftMemoryLimit__block_invoke()
{
  return 0;
}

double __47__NUGlobalSettings_renderResourceEvictionDelay__block_invoke()
{
  return 3.0;
}

uint64_t __49__NUGlobalSettings_semanticStyleUseDynamicConfig__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Preferences"));

  return v2;
}

uint64_t __46__NUGlobalSettings_debugDumpStyleEngineInputs__block_invoke()
{
  return 0;
}

uint64_t __52__NUGlobalSettings_semanticStyleForceSyntheticNoise__block_invoke()
{
  return 0;
}

uint64_t __55__NUGlobalSettings_semanticStyleAllowResidualsMismatch__block_invoke()
{
  return 1;
}

uint64_t __47__NUGlobalSettings_semanticStyleForceResiduals__block_invoke()
{
  return 0;
}

uint64_t __49__NUGlobalSettings_semanticStyleDisableResiduals__block_invoke()
{
  return 0;
}

uint64_t __48__NUGlobalSettings_semanticStyleDisableDeltaMap__block_invoke()
{
  return 0;
}

uint64_t __55__NUGlobalSettings_overrideSemanticStylesHardwareCheck__block_invoke()
{
  return 0;
}

uint64_t __51__NUGlobalSettings_semanticStyleTemporalWindowSize__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NU_STYLES_TEMPORAL_WINDOW_SIZE"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 10;

  return v2;
}

uint64_t __47__NUGlobalSettings_shouldEnableStylesForProRaw__block_invoke()
{
  return 0;
}

uint64_t __56__NUGlobalSettings_shouldRevertStyledOriginalIfPossible__block_invoke()
{
  return 1;
}

uint64_t __45__NUGlobalSettings_enableSpatialMediaEditing__block_invoke()
{
  return 0;
}

uint64_t __45__NUGlobalSettings_mediaViewDisableLivePhoto__block_invoke()
{
  return 0;
}

double __53__NUGlobalSettings_mediaViewRenderCoalescingInterval__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NU_MEDIAVIEW_COALESCED_UPDATES_PER_SECOND"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    v3 = v2;
  }
  else
  {
    v3 = 30.0;
  }

  return v3;
}

uint64_t __56__NUGlobalSettings_disableAuxiliaryImageCacheFromSource__block_invoke()
{
  return 0;
}

uint64_t __59__NUGlobalSettings_enforceMinimumBitRateForCinematicVideos__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NU_ENFORCE_MIN_BITRATE_FOR_CINEMATIC_VIDEO"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("NU_ENFORCE_MIN_BITRATE_FOR_CINEMATIC_VIDEO"));

  return v3;
}

uint64_t __58__NUGlobalSettings_enforceMinimumBitRateForExportedVideos__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_ENFORCE_MIN_BITRATE_FOR_VIDEO"));

  return v1;
}

uint64_t __57__NUGlobalSettings_meteorGainMapExposureCompensationMode__block_invoke()
{
  return 0;
}

uint64_t __48__NUGlobalSettings_forceMeteorGainMapGeneration__block_invoke()
{
  return 0;
}

uint64_t __50__NUGlobalSettings_disableMeteorGainMapGeneration__block_invoke()
{
  return 0;
}

uint64_t __37__NUGlobalSettings_debugRenderYellow__block_invoke()
{
  return 0;
}

uint64_t __37__NUGlobalSettings_debugRenderPurple__block_invoke()
{
  return 0;
}

uint64_t __35__NUGlobalSettings_debugRenderBlue__block_invoke()
{
  return 0;
}

uint64_t __53__NUGlobalSettings_alwaysRequireHardwareVideoEncoder__block_invoke()
{
  return 0;
}

uint64_t __45__NUGlobalSettings_forceSoftwareVideoEncoder__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_FORCE_SOFTWARE_VIDEO_ENCODER"));

  return v1;
}

uint64_t __44__NUGlobalSettings_videoCompositorDebugMode__block_invoke()
{
  return 0;
}

double __44__NUGlobalSettings_thresholdDisplayHeadroom__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NU_THRESHOLD_DISPLAY_HEADROOM"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    v3 = v2;
  }
  else
  {
    v3 = 2.0;
  }

  return v3;
}

double __43__NUGlobalSettings_overrideDisplayHeadroom__block_invoke()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("NU_OVERRIDE_DISPLAY_HEADROOM"));
  v2 = v1;

  return v2;
}

uint64_t __50__NUGlobalSettings_disablePacked10BitPixelFormats__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_DISABLE_PACKED_10BIT_PIXEL_FORMATS"));

  return v1;
}

uint64_t __41__NUGlobalSettings_forceMeteorPlusLinear__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_FORCE_METEOR_PLUS_LINEAR"));

  return v1;
}

uint64_t __39__NUGlobalSettings_forceMeteorPlusPlus__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_FORCE_METEOR_PLUS_PLUS"));

  return v1;
}

uint64_t __33__NUGlobalSettings_renderEDRAsPQ__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_RENDER_EDR_AS_PQ"));

  return v1;
}

uint64_t __41__NUGlobalSettings_renderMeteorPlusAsHDR__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NU_RENDER_METEOR_PLUS_AS_HDR"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = _os_feature_enabled_impl();
  if (v1)
    v2 = objc_msgSend(v1, "BOOLValue");
  v3 = v2;

  return v3;
}

uint64_t __35__NUGlobalSettings_enableFlexRange__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NU_ENABLE_FLEX_RANGE"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = _os_feature_enabled_impl();
  if (v1)
    v2 = objc_msgSend(v1, "BOOLValue");
  v3 = v2;

  return v3;
}

uint64_t __31__NUGlobalSettings_enableDash5__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NU_ENABLE_DASH5"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = _os_feature_enabled_impl();
  if (v1)
    v2 = objc_msgSend(v1, "BOOLValue");
  v3 = v2;

  return v3;
}

double __38__NUGlobalSettings_maxGainMapHeadroom__block_invoke()
{
  return 8.0;
}

double __35__NUGlobalSettings_HLGOpticalScale__block_invoke()
{
  return 2.0;
}

uint64_t __46__NUGlobalSettings_allAssetsCanUseHDRPipeline__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_ALL_ASSETS_CAN_USE_HDR_PIPELINE"));

  return v1;
}

uint64_t __36__NUGlobalSettings_enableHDRSupport__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NU_ENABLE_HDR_SUPPORT"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 1;

  return v2;
}

uint64_t __49__NUGlobalSettings_disableIOSurfacePortaitExport__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_DISABLE_IOSURFACE_PORTRAIT_EXPORT"));

  return v1;
}

uint64_t __44__NUGlobalSettings_runNeutrinoSynchronously__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_RUN_SYNCHRONOUSLY"));

  return v1;
}

uint64_t __41__NUGlobalSettings_logPeakRenderCIUsuage__block_invoke()
{
  return 0;
}

uint64_t __44__NUGlobalSettings_renderTransparencyOpaque__block_invoke()
{
  return 1;
}

uint64_t __47__NUGlobalSettings_renderTransparencyOverBlack__block_invoke()
{
  return 0;
}

uint64_t __47__NUGlobalSettings_displayDisableColorMatching__block_invoke()
{
  return 0;
}

uint64_t __41__NUGlobalSettings_displayForceDeepColor__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_DISPLAY_FORCE_DEEP_COLOR"));

  return v1;
}

uint64_t __43__NUGlobalSettings_displayDisableDeepColor__block_invoke()
{
  return 0;
}

uint64_t __35__NUGlobalSettings_imageLayerDebug__block_invoke()
{
  return 0;
}

uint64_t __37__NUGlobalSettings_pipelineSourceURL__block_invoke()
{
  return 0;
}

uint64_t __40__NUGlobalSettings_platformHasWideColor__block_invoke()
{
  return MGGetBoolAnswer();
}

uint64_t __35__NUGlobalSettings_renderVideoLive__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[NUPlatform currentPlatform](NUPlatform, "currentPlatform");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "defaultSupportsLiveVideoRendering");

  return v1;
}

id __41__NUGlobalSettings_cacheNodeDirectoryURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 13, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "temporaryDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("com.apple.neutrino.cache.node"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __38__NUGlobalSettings_isViewDebugEnabled__block_invoke()
{
  return 0;
}

double __45__NUGlobalSettings_cacheNodeImageCompression__block_invoke()
{
  return 0.9;
}

uint64_t __44__NUGlobalSettings_cacheNodeFilePermissions__block_invoke()
{
  return 493;
}

uint64_t __43__NUGlobalSettings_cacheNodeCacheSizeLimit__block_invoke()
{
  return 0x4000000;
}

uint64_t __54__NUGlobalSettings_imageSourceDisableCacheImmediately__block_invoke()
{
  return 0;
}

uint64_t __41__NUGlobalSettings_imageSourceDisableRAW__block_invoke()
{
  return 0;
}

uint64_t __35__NUGlobalSettings_imageTileBorder__block_invoke()
{
  return 0;
}

uint64_t __33__NUGlobalSettings_imageTileSize__block_invoke()
{
  return 1024;
}

uint64_t __50__NUGlobalSettings_rendererContextLowMemoryTarget__block_invoke()
{
  return 64;
}

uint64_t __52__NUGlobalSettings_rendererContextLargeMemoryTarget__block_invoke()
{
  return 256;
}

uint64_t __39__NUGlobalSettings_rendererUseP3Linear__block_invoke()
{
  return 0;
}

uint64_t __40__NUGlobalSettings_rendererClampToAlpha__block_invoke()
{
  return 0;
}

BOOL __40__NUGlobalSettings_rendererUseHalfFloat__block_invoke()
{
  return +[NURenderer defaultUseHalfFloat](NURenderer, "defaultUseHalfFloat");
}

double __43__NUGlobalSettings_renderJSPipelineTimeout__block_invoke()
{
  return 1.0;
}

uint64_t __52__NUGlobalSettings_imageRenderJobUseTextureRenderer__block_invoke()
{
  return 1;
}

uint64_t __52__NUGlobalSettings_imageRenderJobUseSurfaceRenderer__block_invoke()
{
  return 0;
}

uint64_t __47__NUGlobalSettings_bufferStorageFactoryUsePool__block_invoke()
{
  return 1;
}

uint64_t __48__NUGlobalSettings_surfaceStorageFactoryUsePool__block_invoke()
{
  return 1;
}

double __45__NUGlobalSettings_storagePoolMigrationDelay__block_invoke()
{
  return 0.25;
}

uint64_t __45__NUGlobalSettings_storagePoolPurgeableLimit__block_invoke()
{
  return 15;
}

uint64_t __48__NUGlobalSettings_storagePoolNonPurgeableLimit__block_invoke()
{
  return 10;
}

uint64_t __43__NUGlobalSettings_deviceDefaultSampleMode__block_invoke()
{
  return 0;
}

uint64_t __39__NUGlobalSettings_devicePrintRenderer__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NU_DEVICE_PRINT_RENDERER"));

  return v1;
}

uint64_t __38__NUGlobalSettings_deviceDisableMetal__block_invoke()
{
  return 0;
}

id __27__NUGlobalSettings_tempDir__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@%@"), v1, CFSTR("/Neutrino"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __55__NUGlobalSettings_renderJobDebugCapture5PercentOfJobs__block_invoke()
{
  return 0;
}

uint64_t __54__NUGlobalSettings_renderJobDebugCaptureOnlyPerfStats__block_invoke()
{
  return 0;
}

uint64_t __56__NUGlobalSettings_renderJobDebugCapturePerfStatHistory__block_invoke()
{
  return 0;
}

uint64_t __50__NUGlobalSettings_renderJobDebugCaptureNodeCache__block_invoke()
{
  return 0;
}

uint64_t __51__NUGlobalSettings_renderJobDebugCaptureNodeGraphs__block_invoke()
{
  return 0;
}

uint64_t __53__NUGlobalSettings_renderJobDebugCaptureCanceledJobs__block_invoke()
{
  return 0;
}

uint64_t __47__NUGlobalSettings_renderJobDisableResultCache__block_invoke()
{
  return 0;
}

uint64_t __34__NUGlobalSettings_renderJobDebug__block_invoke()
{
  return 0;
}

void __34__NUGlobalSettings_globalSettings__block_invoke()
{
  NUGlobalSettings *v0;
  void *v1;

  v0 = objc_alloc_init(NUGlobalSettings);
  v1 = (void *)globalSettings_globalSettings;
  globalSettings_globalSettings = (uint64_t)v0;

}

@end
