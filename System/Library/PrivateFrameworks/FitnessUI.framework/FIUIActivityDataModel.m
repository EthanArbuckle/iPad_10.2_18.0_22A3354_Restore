@implementation FIUIActivityDataModel

+ (id)lockedModel
{
  _BYTE *v2;

  v2 = (_BYTE *)objc_opt_new();
  v2[11] = 1;
  return v2;
}

+ (id)idealizedModel
{
  if (idealizedModel_onceToken != -1)
    dispatch_once(&idealizedModel_onceToken, &__block_literal_global_7);
  return (id)idealizedModel_idealizedModel;
}

uint64_t __39__FIUIActivityDataModel_idealizedModel__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v0 = objc_opt_new();
  v1 = (void *)idealizedModel_idealizedModel;
  idealizedModel_idealizedModel = v0;

  v2 = (void *)idealizedModel_idealizedModel;
  v3 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 500.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveEnergyGoal:", v5);

  v6 = (void *)idealizedModel_idealizedModel;
  objc_msgSend((id)idealizedModel_idealizedModel, "activeEnergyGoal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveEnergyTotal:", v7);

  objc_msgSend((id)idealizedModel_idealizedModel, "setAppleStandHoursGoal:", 12);
  objc_msgSend((id)idealizedModel_idealizedModel, "setAppleStandHoursTotal:", objc_msgSend((id)idealizedModel_idealizedModel, "appleStandHoursGoal"));
  objc_msgSend((id)idealizedModel_idealizedModel, "setAppleExerciseTimeGoal:", 30.0);
  v8 = (void *)idealizedModel_idealizedModel;
  objc_msgSend((id)idealizedModel_idealizedModel, "appleExerciseTimeGoal");
  return objc_msgSend(v8, "setAppleExerciseTimeTotal:");
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  -[FIUIActivityDataModel activeEnergyGoal](self, "activeEnergyGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _kilocalorieUnit();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  -[FIUIActivityDataModel activeEnergyTotal](self, "activeEnergyTotal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _kilocalorieUnit();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v8);
  v10 = v9;

  v11 = (void *)MEMORY[0x24BDD17C8];
  -[FIUIActivityDataModel date](self, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIActivityDataModel appleMoveTimeGoal](self, "appleMoveTimeGoal");
  v14 = v13;
  -[FIUIActivityDataModel appleMoveTimeTotal](self, "appleMoveTimeTotal");
  v16 = v15;
  -[FIUIActivityDataModel appleExerciseTimeGoal](self, "appleExerciseTimeGoal");
  v18 = v17;
  -[FIUIActivityDataModel appleExerciseTimeTotal](self, "appleExerciseTimeTotal");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Date: %@, Active Energy Goal: %f, Active Energy Total: %f, Apple Move Time Goal: %f, Apple Move Time Total: %f, Apple Exercise Time Goal: %f, Apple Exercise Time Total: %f, Apple Stand Hours Goal: %ld, Apple Stand Hours Total: %ld, databaseLoading %i, userHasDoneActivitySetup %i, deviceLocked %i, privacy %i areFitnessAppsRestricted %i paused %i"), v12, v6, v10, v14, v16, v18, v19, -[FIUIActivityDataModel appleStandHoursGoal](self, "appleStandHoursGoal"), -[FIUIActivityDataModel appleStandHoursTotal](self, "appleStandHoursTotal"), self->_databaseLoading, -[FIUIActivityDataModel userHasDoneActivitySetup](self, "userHasDoneActivitySetup"), self->_deviceLocked, 0, self->_areFitnessAppsRestricted, self->_paused);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)userHasDoneActivitySetup
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  if (-[FIUIActivityDataModel activityMoveMode](self, "activityMoveMode") == 2)
  {
    -[FIUIActivityDataModel appleMoveTimeGoal](self, "appleMoveTimeGoal");
    v4 = v3;
  }
  else
  {
    -[FIUIActivityDataModel activeEnergyGoal](self, "activeEnergyGoal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _kilocalorieUnit();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValueForUnit:", v6);
    v4 = v7;

  }
  return v4 > 0.0;
}

- (double)activeEnergyCompletionPercentage
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  double result;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[FIUIActivityDataModel deviceLocked](self, "deviceLocked")
    || -[FIUIActivityDataModel areFitnessAppsRestricted](self, "areFitnessAppsRestricted")
    || -[FIUIActivityDataModel activityMoveMode](self, "activityMoveMode") == 2
    || !-[FIUIActivityDataModel userHasDoneActivitySetup](self, "userHasDoneActivitySetup")
    || -[FIUIActivityDataModel databaseLoading](self, "databaseLoading")
    || -[FIUIActivityDataModel paused](self, "paused"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIUIActivityDataModel loggingString](self, "loggingString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_21307C000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v17, 0x16u);

    }
    return *MEMORY[0x24BE01C70];
  }
  else
  {
    -[FIUIActivityDataModel activeEnergyGoal](self, "activeEnergyGoal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _kilocalorieUnit();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValueForUnit:", v10);
    v12 = v11;

    -[FIUIActivityDataModel activeEnergyTotal](self, "activeEnergyTotal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _kilocalorieUnit();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", v14);
    v16 = v15;

    result = v16 / v12;
    if (v12 <= 0.0)
      return 0.0;
  }
  return result;
}

- (double)appleMoveTimeCompletionPercentage
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  double result;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[FIUIActivityDataModel deviceLocked](self, "deviceLocked")
    || -[FIUIActivityDataModel areFitnessAppsRestricted](self, "areFitnessAppsRestricted")
    || !-[FIUIActivityDataModel userHasDoneActivitySetup](self, "userHasDoneActivitySetup")
    || -[FIUIActivityDataModel databaseLoading](self, "databaseLoading")
    || -[FIUIActivityDataModel activityMoveMode](self, "activityMoveMode") != 2
    || -[FIUIActivityDataModel paused](self, "paused"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIUIActivityDataModel loggingString](self, "loggingString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_21307C000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v14, 0x16u);

    }
    return *MEMORY[0x24BE01C70];
  }
  else
  {
    -[FIUIActivityDataModel appleMoveTimeGoal](self, "appleMoveTimeGoal");
    v10 = v9;
    result = 0.0;
    if (v10 > 0.0)
    {
      -[FIUIActivityDataModel appleMoveTimeTotal](self, "appleMoveTimeTotal", 0.0);
      v12 = v11;
      -[FIUIActivityDataModel appleMoveTimeGoal](self, "appleMoveTimeGoal");
      return v12 / v13;
    }
  }
  return result;
}

- (double)appleExerciseTimeCompletionPercentage
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  double result;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[FIUIActivityDataModel deviceLocked](self, "deviceLocked")
    || -[FIUIActivityDataModel areFitnessAppsRestricted](self, "areFitnessAppsRestricted")
    || !-[FIUIActivityDataModel userHasDoneActivitySetup](self, "userHasDoneActivitySetup")
    || -[FIUIActivityDataModel databaseLoading](self, "databaseLoading")
    || -[FIUIActivityDataModel paused](self, "paused"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIUIActivityDataModel loggingString](self, "loggingString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_21307C000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v14, 0x16u);

    }
    return *MEMORY[0x24BE01C70];
  }
  else
  {
    -[FIUIActivityDataModel appleExerciseTimeGoal](self, "appleExerciseTimeGoal");
    v10 = v9;
    result = 0.0;
    if (v10 > 0.0)
    {
      -[FIUIActivityDataModel appleExerciseTimeTotal](self, "appleExerciseTimeTotal", 0.0);
      v12 = v11;
      -[FIUIActivityDataModel appleExerciseTimeGoal](self, "appleExerciseTimeGoal");
      return v12 / v13;
    }
  }
  return result;
}

- (double)appleStandHourCompletionPercentage
{
  double v4;

  if (-[FIUIActivityDataModel deviceLocked](self, "deviceLocked")
    || -[FIUIActivityDataModel areFitnessAppsRestricted](self, "areFitnessAppsRestricted")
    || !-[FIUIActivityDataModel userHasDoneActivitySetup](self, "userHasDoneActivitySetup")
    || -[FIUIActivityDataModel databaseLoading](self, "databaseLoading")
    || -[FIUIActivityDataModel paused](self, "paused"))
  {
    return *MEMORY[0x24BE01C70];
  }
  if (-[FIUIActivityDataModel appleStandHoursGoal](self, "appleStandHoursGoal") < 1)
    return 0.0;
  v4 = (double)-[FIUIActivityDataModel appleStandHoursTotal](self, "appleStandHoursTotal");
  return v4 / (double)-[FIUIActivityDataModel appleStandHoursGoal](self, "appleStandHoursGoal");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_opt_new();
  objc_msgSend(v4, "setActivityMoveMode:", self->_activityMoveMode);
  objc_msgSend(v4, "setActiveEnergyTotal:", self->_activeEnergyTotal);
  objc_msgSend(v4, "setActiveEnergyGoal:", self->_activeEnergyGoal);
  objc_msgSend(v4, "setAppleMoveTimeTotal:", self->_appleMoveTimeTotal);
  objc_msgSend(v4, "setAppleMoveTimeGoal:", self->_appleMoveTimeGoal);
  objc_msgSend(v4, "setAppleExerciseTimeTotal:", self->_appleExerciseTimeTotal);
  objc_msgSend(v4, "setAppleExerciseTimeGoal:", self->_appleExerciseTimeGoal);
  objc_msgSend(v4, "setAppleStandHoursTotal:", self->_appleStandHoursTotal);
  objc_msgSend(v4, "setAppleStandHoursGoal:", self->_appleStandHoursGoal);
  objc_msgSend(v4, "setWheelchairUser:", self->_wheelchairUser);
  objc_msgSend(v4, "setPaused:", self->_paused);
  objc_msgSend(v4, "setActiveEnergyChartData:", self->_activeEnergyChartData);
  objc_msgSend(v4, "setAppleExerciseTimeChartData:", self->_appleExerciseTimeChartData);
  objc_msgSend(v4, "setAppleStandHourChartData:", self->_appleStandHourChartData);
  v4[11] = self->_deviceLocked;
  v4[12] = self->_areFitnessAppsRestricted;
  return v4;
}

+ (id)formattingManager
{
  if (formattingManager_onceToken != -1)
    dispatch_once(&formattingManager_onceToken, &__block_literal_global_189);
  return (id)formattingManager___formattingManager;
}

void __42__FIUIActivityDataModel_formattingManager__block_invoke()
{
  FIUIUnitManager *v0;
  FIUIFormattingManager *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD3C40], "fiui_sharedHealthStoreForCarousel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[FIUIUnitManager initWithHealthStore:]([FIUIUnitManager alloc], "initWithHealthStore:", v3);
  v1 = -[FIUIFormattingManager initWithUnitManager:]([FIUIFormattingManager alloc], "initWithUnitManager:", v0);
  v2 = (void *)formattingManager___formattingManager;
  formattingManager___formattingManager = (uint64_t)v1;

}

- (id)loggingString
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%s returning ARUIRingPercentageValueNoRing, with reason deviceLocked: %u, hasDoneActivitySetup: %i, databaseLoading: %u"), "-[FIUIActivityDataModel loggingString]", -[FIUIActivityDataModel deviceLocked](self, "deviceLocked"), -[FIUIActivityDataModel userHasDoneActivitySetup](self, "userHasDoneActivitySetup"), -[FIUIActivityDataModel databaseLoading](self, "databaseLoading"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", activityMoveMode: %ld"), -[FIUIActivityDataModel activityMoveMode](self, "activityMoveMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", paused: %u"), -[FIUIActivityDataModel paused](self, "paused"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  self->_activityMoveMode = a3;
}

- (HKQuantity)activeEnergyTotal
{
  return self->_activeEnergyTotal;
}

- (void)setActiveEnergyTotal:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnergyTotal, a3);
}

- (HKQuantity)activeEnergyGoal
{
  return self->_activeEnergyGoal;
}

- (void)setActiveEnergyGoal:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnergyGoal, a3);
}

- (double)appleMoveTimeTotal
{
  return self->_appleMoveTimeTotal;
}

- (void)setAppleMoveTimeTotal:(double)a3
{
  self->_appleMoveTimeTotal = a3;
}

- (double)appleMoveTimeGoal
{
  return self->_appleMoveTimeGoal;
}

- (void)setAppleMoveTimeGoal:(double)a3
{
  self->_appleMoveTimeGoal = a3;
}

- (double)appleExerciseTimeTotal
{
  return self->_appleExerciseTimeTotal;
}

- (void)setAppleExerciseTimeTotal:(double)a3
{
  self->_appleExerciseTimeTotal = a3;
}

- (double)appleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal;
}

- (void)setAppleExerciseTimeGoal:(double)a3
{
  self->_appleExerciseTimeGoal = a3;
}

- (BOOL)wheelchairUser
{
  return self->_wheelchairUser;
}

- (void)setWheelchairUser:(BOOL)a3
{
  self->_wheelchairUser = a3;
}

- (int64_t)appleStandHoursTotal
{
  return self->_appleStandHoursTotal;
}

- (void)setAppleStandHoursTotal:(int64_t)a3
{
  self->_appleStandHoursTotal = a3;
}

- (int64_t)appleStandHoursGoal
{
  return self->_appleStandHoursGoal;
}

- (void)setAppleStandHoursGoal:(int64_t)a3
{
  self->_appleStandHoursGoal = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (NSArray)activeEnergyChartData
{
  return self->_activeEnergyChartData;
}

- (void)setActiveEnergyChartData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)appleMoveTimeChartData
{
  return self->_appleMoveTimeChartData;
}

- (void)setAppleMoveTimeChartData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)appleExerciseTimeChartData
{
  return self->_appleExerciseTimeChartData;
}

- (void)setAppleExerciseTimeChartData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)appleStandHourChartData
{
  return self->_appleStandHourChartData;
}

- (void)setAppleStandHourChartData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)databaseLoading
{
  return self->_databaseLoading;
}

- (void)setDatabaseLoading:(BOOL)a3
{
  self->_databaseLoading = a3;
}

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (BOOL)areFitnessAppsRestricted
{
  return self->_areFitnessAppsRestricted;
}

- (void)setAreFitnessAppsRestricted:(BOOL)a3
{
  self->_areFitnessAppsRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleStandHourChartData, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeChartData, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeChartData, 0);
  objc_storeStrong((id *)&self->_activeEnergyChartData, 0);
  objc_storeStrong((id *)&self->_activeEnergyGoal, 0);
  objc_storeStrong((id *)&self->_activeEnergyTotal, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
