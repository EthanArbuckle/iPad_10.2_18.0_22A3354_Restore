@implementation JFXThermalMonitor

- (JFXThermalMonitor)init
{
  JFXThermalMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  NSObject *v8;
  uint64_t v9;
  JFXThermalMonitor *v10;
  uint32_t v11;
  NSObject *v12;
  JFXThermalMonitor *v13;
  NSObject *v14;
  JFXThermalMonitor *v15;
  _QWORD block[4];
  NSObject *p_super;
  uint8_t buf[8];
  _QWORD handler[4];
  JFXThermalMonitor *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)JFXThermalMonitor;
  v2 = -[JFXThermalMonitor init](&v22, sel_init);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.JFXThermalMonitor"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXThermalMonitor setHighestThermalLevel:](v2, "setHighestThermalLevel:", 0);
  -[JFXThermalMonitor setCurrentThermalLevel:](v2, "setCurrentThermalLevel:", 0);
  v6 = objc_retainAutorelease(v5);
  v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
  -[JFXThermalMonitor setQueue:](v2, "setQueue:", v7);

  -[JFXThermalMonitor queue](v2, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __25__JFXThermalMonitor_init__block_invoke;
  handler[3] = &unk_24EE58740;
  v10 = v2;
  v21 = v10;
  v11 = notify_register_dispatch("com.apple.system.thermalpressurelevel", &init_s_token, v8, handler);

  if (v11)
  {
    JFXLog_core();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEFAULT, "unable to notify_register_dispatch", buf, 2u);
    }
    v13 = 0;
  }
  else
  {
    -[JFXThermalMonitor queue](v10, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __25__JFXThermalMonitor_init__block_invoke_11;
    block[3] = &unk_24EE57B60;
    v15 = v10;
    p_super = &v15->super;
    dispatch_async(v14, block);

    v13 = v15;
    v12 = p_super;
  }

  return v13;
}

void __25__JFXThermalMonitor_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel");
  if (objc_msgSend(*(id *)(a1 + 32), "_updateThermalLevelsWithToken:", a2))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel");
    objc_msgSend(*(id *)(a1 + 32), "_analyticValueForThermalLevelBefore:after:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[JFXAnalyticsManager sharedInstance](JFXAnalyticsManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trackEventWithName:", v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "_postNotification:", v6);
    JFXLog_core();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringFromOSThermalPressureLevel:", v4);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "UTF8String");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringFromOSThermalPressureLevel:", v5);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringFromOSThermalPressureLevel:", objc_msgSend(*(id *)(a1 + 32), "highestThermalLevel"));
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = 136315650;
      v15 = v10;
      v16 = 2080;
      v17 = v12;
      v18 = 2080;
      v19 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "thermal change: %s => %s (highest: %s)", (uint8_t *)&v14, 0x20u);

    }
  }
}

uint64_t __25__JFXThermalMonitor_init__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateThermalLevelsWithToken:", init_s_token);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_38);
  return (id)sharedInstance_s_sharedInstance_1;
}

void __35__JFXThermalMonitor_sharedInstance__block_invoke()
{
  JFXThermalMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(JFXThermalMonitor);
  v1 = (void *)sharedInstance_s_sharedInstance_1;
  sharedInstance_s_sharedInstance_1 = (uint64_t)v0;

}

+ (void)enumerateThermalPressureLevel:(id)a3
{
  uint64_t v4;
  BOOL v5;
  char v6;

  v4 = 0;
  do
  {
    v6 = 0;
    (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, dword_226AB7500[v4], &v6);
    if (v6)
      v5 = 1;
    else
      v5 = v4 == 5;
    ++v4;
  }
  while (!v5);
}

+ (id)stringFromThermalPressureLevel:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("Nominal");
  v4 = CFSTR("Heavy");
  v5 = CFSTR("Trapping");
  v6 = CFSTR("Sleeping");
  if (a3 != 50)
    v6 = CFSTR("Nominal");
  if (a3 != 40)
    v5 = v6;
  if (a3 != 30)
    v4 = v5;
  if (a3 == 20)
    v3 = CFSTR("Moderate");
  if (a3 == 10)
    v3 = CFSTR("Light");
  if (a3 <= 29)
    return (id)v3;
  else
    return (id)v4;
}

- (BOOL)thermalLevelExceededNominal
{
  BOOL v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (-[JFXThermalMonitor _disabledThermalTracking](self, "_disabledThermalTracking"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[JFXThermalMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__JFXThermalMonitor_thermalLevelExceededNominal__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __48__JFXThermalMonitor_thermalLevelExceededNominal__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "highestThermalLevel");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

- (int)thermalLevel
{
  int v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  if (-[JFXThermalMonitor _disabledThermalTracking](self, "_disabledThermalTracking"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[JFXThermalMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__JFXThermalMonitor_thermalLevel__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __33__JFXThermalMonitor_thermalLevel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)highestThermalLevelReached
{
  int v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  if (-[JFXThermalMonitor _disabledThermalTracking](self, "_disabledThermalTracking"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[JFXThermalMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__JFXThermalMonitor_highestThermalLevelReached__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __47__JFXThermalMonitor_highestThermalLevelReached__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "highestThermalLevel");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)thermalLevelLabel
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[JFXThermalMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__JFXThermalMonitor_thermalLevelLabel__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__JFXThermalMonitor_thermalLevelLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel");
  v4 = objc_msgSend(*(id *)(a1 + 32), "_disabledThermalTracking");
  v5 = &stru_24EE5C428;
  if (v4)
    v5 = CFSTR("*");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("T %d%@"), v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (BOOL)_updateThermalLevelsWithToken:(int)a3
{
  uint32_t state;
  unsigned int v5;
  uint64_t state64;

  state64 = 0;
  state = notify_get_state(a3, &state64);
  if (!state)
  {
    -[JFXThermalMonitor setCurrentThermalLevel:](self, "setCurrentThermalLevel:", state64);
    v5 = -[JFXThermalMonitor currentThermalLevel](self, "currentThermalLevel");
    if (v5 > -[JFXThermalMonitor highestThermalLevel](self, "highestThermalLevel"))
      -[JFXThermalMonitor setHighestThermalLevel:](self, "setHighestThermalLevel:", -[JFXThermalMonitor currentThermalLevel](self, "currentThermalLevel"));
  }
  return state == 0;
}

- (void)_postNotification:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__JFXThermalMonitor__postNotification___block_invoke;
  block[3] = &unk_24EE57B60;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __39__JFXThermalMonitor__postNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v4 = CFSTR("JFXThermalMonitorLevelChangedKey");
    v5[0] = v1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("JFXThermalMonitorLevelChangedNotification"), 0, v2);

}

- (BOOL)_disabledThermalTracking
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("JFXDisableThermalTrackingKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)_analyticValueForThermalLevelBefore:(int)a3 after:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (_analyticValueForThermalLevelBefore_after__onceToken != -1)
    dispatch_once(&_analyticValueForThermalLevelBefore_after__onceToken, &__block_literal_global_35);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringFromOSThermalPressureLevel:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringFromOSThermalPressureLevel:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_analyticValueForThermalLevelBefore_after__s_thermalAnalyticValueLookup, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __63__JFXThermalMonitor__analyticValueForThermalLevelBefore_after___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[11];

  v11[10] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("thermalnominaltolight");
  v11[1] = CFSTR("thermallighttomoderate");
  v11[2] = CFSTR("thermalmoderatetoheavy");
  v11[3] = CFSTR("thermalheavytotrapping");
  v11[4] = CFSTR("thermaltrappingtosleeping");
  v11[5] = CFSTR("thermalsleepingtotrapping");
  v11[6] = CFSTR("thermaltrappingtoheavy");
  v11[7] = CFSTR("thermalheavytomoderate");
  v11[8] = CFSTR("thermalmoderatetolight");
  v11[9] = CFSTR("thermallighttonominal");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_analyticValueForThermalLevelBefore_after__s_thermalAnalyticValueLookup;
  _analyticValueForThermalLevelBefore_after__s_thermalAnalyticValueLookup = v1;

  if (objc_msgSend(v0, "count"))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = v5;
      v7 = v4;
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringFromOSThermalPressureLevel:", dword_226AB7518[v3]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringFromOSThermalPressureLevel:", dword_226AB7540[v3]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v0, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)_analyticValueForThermalLevelBefore_after__s_thermalAnalyticValueLookup, "setObject:forKeyedSubscript:", v4, v5);
      ++v3;
    }
    while (v3 < objc_msgSend(v0, "count"));

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)hasGoneAboveNominal
{
  return self->_hasGoneAboveNominal;
}

- (void)setHasGoneAboveNominal:(BOOL)a3
{
  self->_hasGoneAboveNominal = a3;
}

- (int)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setCurrentThermalLevel:(int)a3
{
  self->_currentThermalLevel = a3;
}

- (int)highestThermalLevel
{
  return self->_highestThermalLevel;
}

- (void)setHighestThermalLevel:(int)a3
{
  self->_highestThermalLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
