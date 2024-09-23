@implementation FIUIUnitManager

- (FIUIUnitManager)initWithHealthStore:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  FIUIUnitManager *v7;

  v4 = (objc_class *)MEMORY[0x24BE32818];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithHealthStore:", v5);

  v7 = -[FIUIUnitManager initWithUnitManager:](self, "initWithUnitManager:", v6);
  return v7;
}

- (void)_notifyUnitPreferencesChanged
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_191_0);
}

void __48__FIUIUnitManager__notifyUnitPreferencesChanged__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("FitnessUnitPreferencesDidChangeNotification"), 0);

}

- (unint64_t)userDistanceUnitForDistanceType:(unint64_t)a3
{
  return -[FIUnitManager userDistanceUnitForDistanceType:](self->_unitManager, "userDistanceUnitForDistanceType:", a3);
}

- (id)userDistanceHKUnitForDistanceType:(unint64_t)a3
{
  return (id)-[FIUnitManager userDistanceHKUnitForDistanceType:](self->_unitManager, "userDistanceHKUnitForDistanceType:", a3);
}

- (id)userDistanceWalkingRunningHKUnit
{
  return (id)-[FIUnitManager userDistanceWalkingRunningHKUnit](self->_unitManager, "userDistanceWalkingRunningHKUnit");
}

- (id)userActiveEnergyBurnedUnit
{
  return (id)-[FIUnitManager userActiveEnergyBurnedUnit](self->_unitManager, "userActiveEnergyBurnedUnit");
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_11);
  return (id)sharedManager___unitPreferencesManager;
}

void __32__FIUIUnitManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;
  FIUIUnitManager *v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v1 = (void *)sharedManager___healthStore;
  sharedManager___healthStore = (uint64_t)v0;

  v2 = [FIUIUnitManager alloc];
  v3 = -[FIUIUnitManager initWithHealthStore:](v2, "initWithHealthStore:", sharedManager___healthStore);
  v4 = (void *)sharedManager___unitPreferencesManager;
  sharedManager___unitPreferencesManager = v3;

}

- (FIUIUnitManager)init
{
  id v3;
  FIUIUnitManager *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE32818]);
  v4 = -[FIUIUnitManager initWithUnitManager:](self, "initWithUnitManager:", v3);

  return v4;
}

- (FIUIUnitManager)initWithUnitManager:(id)a3
{
  id v5;
  FIUIUnitManager *v6;
  FIUIUnitManager *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FIUIUnitManager;
  v6 = -[FIUIUnitManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unitManager, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__notifyUnitPreferencesChanged, *MEMORY[0x24BE32878], 0);

  }
  return v7;
}

- (unint64_t)paceDistanceUnitForDistanceType:(unint64_t)a3
{
  return -[FIUnitManager paceDistanceUnitForDistanceType:](self->_unitManager, "paceDistanceUnitForDistanceType:", a3);
}

+ (id)quantityTypeForDistanceType:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE32818], "quantityTypeForDistanceType:", a3);
}

- (id)userDistanceHKUnitForActivityType:(id)a3
{
  FIUnitManager *unitManager;
  void *v4;
  void *v5;

  unitManager = self->_unitManager;
  objc_msgSend(a3, "workoutActivityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager userDistanceHKUnitForActivityType:](unitManager, "userDistanceHKUnitForActivityType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setUserDistanceUnit:(unint64_t)a3 forDistanceType:(unint64_t)a4
{
  -[FIUnitManager setUserDistanceUnit:forDistanceType:](self->_unitManager, "setUserDistanceUnit:forDistanceType:", a3, a4);
}

- (unint64_t)userDistanceWalkingRunningUnit
{
  return -[FIUnitManager userDistanceWalkingRunningUnit](self->_unitManager, "userDistanceWalkingRunningUnit");
}

- (unint64_t)userDistanceElevationUnit
{
  return -[FIUnitManager userDistanceElevationUnit](self->_unitManager, "userDistanceElevationUnit");
}

- (id)userDistanceElevationHKUnit
{
  if (-[FIUIUnitManager userDistanceElevationUnit](self, "userDistanceElevationUnit") == 1)
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  else
    objc_msgSend(MEMORY[0x24BDD4048], "footUnit");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)userDistanceCrossCountrySkiingHKUnit
{
  return (id)-[FIUnitManager userDistanceCrossCountrySkiingHKUnit](self->_unitManager, "userDistanceCrossCountrySkiingHKUnit");
}

- (id)userDistanceDownhillSnowSportsHKUnit
{
  return (id)-[FIUnitManager userDistanceDownhillSnowSportsHKUnit](self->_unitManager, "userDistanceDownhillSnowSportsHKUnit");
}

- (id)userDistancePaddleSportsHKUnit
{
  return (id)-[FIUnitManager userDistancePaddleSportsHKUnit](self->_unitManager, "userDistancePaddleSportsHKUnit");
}

- (id)userDistanceRowingHKUnit
{
  return (id)-[FIUnitManager userDistanceRowingHKUnit](self->_unitManager, "userDistanceRowingHKUnit");
}

- (id)userDistanceSkatingSportsHKUnit
{
  return (id)-[FIUnitManager userDistanceSkatingSportsHKUnit](self->_unitManager, "userDistanceSkatingSportsHKUnit");
}

- (id)userLapLengthHKUnit
{
  return (id)-[FIUnitManager userLapLengthHKUnit](self->_unitManager, "userLapLengthHKUnit");
}

- (id)userDepthHKUnit
{
  return (id)-[FIUnitManager userDepthHKUnit](self->_unitManager, "userDepthHKUnit");
}

- (void)setUserDepthHKUnit:(id)a3
{
  -[FIUnitManager setUserDepthHKUnit:](self->_unitManager, "setUserDepthHKUnit:", a3);
}

- (id)userWaterTemperatureHKUnit
{
  return (id)-[FIUnitManager userWaterTemperatureHKUnit](self->_unitManager, "userWaterTemperatureHKUnit");
}

- (void)setUserWaterTemperatureHKUnit:(id)a3
{
  -[FIUnitManager setUserWaterTemperatureHKUnit:](self->_unitManager, "setUserWaterTemperatureHKUnit:", a3);
}

- (void)setUserDistanceWalkingRunningUnit:(unint64_t)a3
{
  -[FIUnitManager setUserDistanceWalkingRunningUnit:](self->_unitManager, "setUserDistanceWalkingRunningUnit:", a3);
}

- (unint64_t)userDistanceCyclingUnit
{
  return -[FIUnitManager userDistanceCyclingUnit](self->_unitManager, "userDistanceCyclingUnit");
}

- (id)userDistanceCyclingHKUnit
{
  return (id)-[FIUnitManager userDistanceCyclingHKUnit](self->_unitManager, "userDistanceCyclingHKUnit");
}

- (void)setUserDistanceCyclingUnit:(unint64_t)a3
{
  -[FIUnitManager setUserDistanceCyclingUnit:](self->_unitManager, "setUserDistanceCyclingUnit:", a3);
}

- (double)paceWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6
{
  double result;

  -[FIUnitManager paceWithDistance:overDuration:paceFormat:distanceType:](self->_unitManager, "paceWithDistance:overDuration:paceFormat:distanceType:", a3, a5, a6, a4);
  return result;
}

- (double)distanceInMetersForDistanceInUserUnit:(double)a3 distanceType:(unint64_t)a4
{
  double result;

  -[FIUnitManager distanceInMetersForDistanceInUserUnit:distanceType:](self->_unitManager, "distanceInMetersForDistanceInUserUnit:distanceType:", a4, a3);
  return result;
}

- (double)distanceInUserDistanceUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4
{
  double result;

  -[FIUnitManager distanceInUserDistanceUnitForDistanceInMeters:distanceType:](self->_unitManager, "distanceInUserDistanceUnitForDistanceInMeters:distanceType:", a4, a3);
  return result;
}

- (double)distanceInDistanceUnit:(unint64_t)a3 forDistanceInMeters:(double)a4
{
  double result;

  -[FIUnitManager distanceInDistanceUnit:forDistanceInMeters:](self->_unitManager, "distanceInDistanceUnit:forDistanceInMeters:", a3, a4);
  return result;
}

- (void)setUserActiveEnergyBurnedUnit:(id)a3
{
  -[FIUnitManager setUserActiveEnergyBurnedUnit:](self->_unitManager, "setUserActiveEnergyBurnedUnit:", a3);
}

- (id)userBasalEnergyBurnedUnit
{
  return (id)-[FIUnitManager userBasalEnergyBurnedUnit](self->_unitManager, "userBasalEnergyBurnedUnit");
}

- (void)setUserBasalEnergyBurnedUnit:(id)a3
{
  -[FIUnitManager setUserBasalEnergyBurnedUnit:](self->_unitManager, "setUserBasalEnergyBurnedUnit:", a3);
}

- (void)setPreferredUnitsForTesting:(id)a3
{
  -[FIUnitManager setPreferredUnitsForTesting:](self->_unitManager, "setPreferredUnitsForTesting:", a3);
}

- (FIUnitManager)unitManager
{
  return self->_unitManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitManager, 0);
}

@end
