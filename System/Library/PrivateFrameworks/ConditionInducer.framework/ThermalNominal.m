@implementation ThermalNominal

+ (id)thermalStateEnumToCLTMStringKey:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return *(&off_24E471530 + a3);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    +[ThermalNominal thermalStateEnumToCLTMStringKey:].cold.1();
  return 0;
}

- (id)identifierName
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;

  v8 = 0;
  v2 = CFSTR("ThermalCondition");
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("ThermalCondition"), &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ConditionIdentifierName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
    v2 = v4;

  return v2;
}

- (id)userFriendlyName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("ThermalCondition"), &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("ConditionUserFriendlyName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isDestructive
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("ThermalCondition"), &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("ConditionIsDestructive"));

  }
  return 1;
}

- (BOOL)isInternalOnly
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("ThermalCondition"), &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("ConditionIsInternalOnly"));

  }
  return 1;
}

+ (id)description
{
  return CFSTR("Simulate nominal thermal pressure");
}

+ (id)profileFriendlyName
{
  return CFSTR("Thermal State: Nominal");
}

- (ThermalNominal)init
{
  return -[ThermalNominal initWithThermalLevel:](self, "initWithThermalLevel:", 0);
}

- (ThermalNominal)initWithThermalLevel:(int64_t)a3
{
  ThermalNominal *v4;
  ThermalNominal *v5;
  uint64_t v6;
  NSString *thermalLevelKey;
  ThermalNominal *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ThermalNominal;
  v4 = -[COCondition init](&v10, sel_init);
  v5 = v4;
  if (v4
    && (v4->_desiredState = a3,
        +[ThermalNominal thermalStateEnumToCLTMStringKey:](ThermalNominal, "thermalStateEnumToCLTMStringKey:", a3), v6 = objc_claimAutoreleasedReturnValue(), thermalLevelKey = v5->_thermalLevelKey, v5->_thermalLevelKey = (NSString *)v6, thermalLevelKey, !v5->_thermalLevelKey))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ThermalNominal initWithThermalLevel:].cold.1(a3);
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (BOOL)setUp
{
  void *v3;
  int v4;
  NSObject *v5;
  __int128 v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  __int128 v15;
  uint8_t buf[4];
  ThermalNominal *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Starting Setup - %@ Condition", buf, 0xCu);
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cltm"));
  objc_msgSend(v3, "setObject:forKey:", self->_thermalLevelKey, CFSTR("thermalSimulationMode"));
  v4 = 30;
  v5 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v6 = 134218240;
  v15 = v6;
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ThermalNominal setActualState:](self, "setActualState:", objc_msgSend(v7, "thermalState"));

    v8 = -[ThermalNominal actualState](self, "actualState");
    if (v8 >= -[ThermalNominal desiredState](self, "desiredState"))
      break;
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = -[ThermalNominal actualState](self, "actualState");
      v10 = -[ThermalNominal desiredState](self, "desiredState");
      *(_DWORD *)buf = v15;
      v17 = (ThermalNominal *)v9;
      v18 = 2048;
      v19 = v10;
      _os_log_debug_impl(&dword_21F8CF000, v5, OS_LOG_TYPE_DEBUG, "Thermal state is at currently at %lu, and the desired state is %lu", buf, 0x16u);
    }
    if (!--v4)
      goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = -[ThermalNominal actualState](self, "actualState");
    v12 = -[ThermalNominal desiredState](self, "desiredState");
    *(_DWORD *)buf = v15;
    v17 = (ThermalNominal *)v11;
    v18 = 2048;
    v19 = v12;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Thermal state is at %lu, which is at or above the desired state of %lu", buf, 0x16u);
  }
LABEL_11:
  v13 = -[ThermalNominal actualState](self, "actualState");
  if (v13 < -[ThermalNominal desiredState](self, "desiredState")
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    -[ThermalNominal setUp].cold.1(self);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Finished Setup - %@ Condition", buf, 0xCu);
  }

  return 1;
}

- (void)tearDown
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cltm"));
  objc_msgSend(v2, "setObject:forKey:", CFSTR("off"), CFSTR("thermalSimulationMode"));
  sleep(5u);

}

- (BOOL)active
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cltm"));
  objc_msgSend(v3, "objectForKey:", CFSTR("thermalSimulationMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isEqualToString:", self->_thermalLevelKey);

  return (char)self;
}

- (int64_t)actualState
{
  return self->_actualState;
}

- (void)setActualState:(int64_t)a3
{
  self->_actualState = a3;
}

- (int64_t)desiredState
{
  return self->_desiredState;
}

- (void)setDesiredState:(int64_t)a3
{
  self->_desiredState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalLevelKey, 0);
}

+ (void)thermalStateEnumToCLTMStringKey:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "We should not have reached this log line! It means we got an NSProcessInfoThermalState that is not handled in our switch!", v0, 2u);
}

- (void)initWithThermalLevel:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unknown thermal state passed to enum translator: %lu", (uint8_t *)&v1, 0xCu);
}

- (void)setUp
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218240;
  v3 = objc_msgSend(a1, "desiredState");
  v4 = 2048;
  v5 = objc_msgSend(a1, "actualState");
  _os_log_fault_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Timed out waiting for thermal mitigation to reach %lu. Last known level was %lu, but we will assume that we actually reached it and move on", (uint8_t *)&v2, 0x16u);
}

@end
