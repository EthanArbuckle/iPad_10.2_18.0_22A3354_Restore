@implementation FIUnitManager

- (FIUnitManager)initWithHealthStore:(id)a3
{
  id v5;
  FIUnitManager *v6;
  FIUnitManager *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *preferredUnits;
  NSObject *v12;
  FIUnitManager *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  FIUnitManager *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FIUnitManager;
  v6 = -[FIUnitManager init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = (void *)MEMORY[0x24BDBCED8];
    -[FIUnitManager _loadPreferredUnitsFromDefaults](v7, "_loadPreferredUnitsFromDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    preferredUnits = v7->_preferredUnits;
    v7->_preferredUnits = (NSMutableDictionary *)v10;

    dispatch_get_global_queue(17, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__FIUnitManager_initWithHealthStore___block_invoke;
    block[3] = &unk_24CC4E880;
    v13 = v7;
    v18 = v13;
    dispatch_async(v12, block);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__userPreferencesDidChange_, *MEMORY[0x24BDD3838], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel__localeDidChange_, *MEMORY[0x24BDBCA70], 0);

  }
  return v7;
}

uint64_t __37__FIUnitManager_initWithHealthStore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredUnits");
}

- (void)_storePreferredUnitsInDefaults:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__FIUnitManager__storePreferredUnitsInDefaults___block_invoke;
  v8[3] = &unk_24CC4EBD8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("FICachedPreferredUnitsKey"));

}

void __48__FIUnitManager__storePreferredUnitsInDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unitString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
}

- (id)_loadPreferredUnitsFromDefaults
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("FICachedPreferredUnitsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__FIUnitManager__loadPreferredUnitsFromDefaults__block_invoke;
  v7[3] = &unk_24CC4EC00;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __48__FIUnitManager__loadPreferredUnitsFromDefaults__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

  }
}

- (void)_updatePreferredUnits
{
  HKHealthStore *healthStore;
  _QWORD v4[5];

  healthStore = self->_healthStore;
  if (_RelevantQuantityTypes_onceToken != -1)
    dispatch_once(&_RelevantQuantityTypes_onceToken, &__block_literal_global_290);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__FIUnitManager__updatePreferredUnits__block_invoke;
  v4[3] = &unk_24CC4EC50;
  v4[4] = self;
  -[HKHealthStore preferredUnitsForQuantityTypes:completion:](healthStore, "preferredUnitsForQuantityTypes:completion:", _RelevantQuantityTypes___relevantQuantityTypes, v4);
}

void __38__FIUnitManager__updatePreferredUnits__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      __38__FIUnitManager__updatePreferredUnits__block_invoke_cold_1();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__FIUnitManager__updatePreferredUnits__block_invoke_226;
    v7[3] = &unk_24CC4EC28;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t __38__FIUnitManager__updatePreferredUnits__block_invoke_226(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_storePreferredUnitsInDefaults:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return objc_msgSend(*(id *)(a1 + 32), "_notifyUnitPreferencesChanged");
}

- (void)_notifyUnitPreferencesChanged
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_228);
}

void __46__FIUnitManager__notifyUnitPreferencesChanged__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("FIFitnessUnitPreferencesDidChangeNotification"), 0);

}

- (id)_preferredHKUnitForQuantityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_preferredUnits, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (_IsValidUserUnitForQuantityType(v5, v4) & 1) == 0)
  {
    _HKGenerateDefaultUnitForQuantityType();
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (void)_setPreferredHKUnit:(id)a3 forQuantityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSMutableDictionary *preferredUnits;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v6);

    if ((v9 & 1) == 0)
    {
      preferredUnits = self->_preferredUnits;
      if (preferredUnits)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](preferredUnits, "setObject:forKeyedSubscript:", v6, v7);
        -[FIUnitManager _storePreferredUnitsInDefaults:](self, "_storePreferredUnitsInDefaults:", self->_preferredUnits);
      }
      if ((_IsValidUserUnitForQuantityType(v6, v7) & 1) != 0)
      {
        -[HKHealthStore _setPreferredUnit:forType:completion:](self->_healthStore, "_setPreferredUnit:forType:completion:", v6, v7, &__block_literal_global_230);
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
          -[FIUnitManager _setPreferredHKUnit:forQuantityType:].cold.1();
      }
    }
  }

}

void __53__FIUnitManager__setPreferredHKUnit_forQuantityType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      __53__FIUnitManager__setPreferredHKUnit_forQuantityType___block_invoke_cold_1();
  }

}

- (unint64_t)paceDistanceUnitForDistanceType:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  if (a3 == 9)
    return 1;
  if (a3 != 4)
    return -[FIUnitManager userDistanceUnitForDistanceType:](self, "userDistanceUnitForDistanceType:");
  -[FIUnitManager userLapLengthHKUnit](self, "userLapLengthHKUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FIDistanceUnitForHKUnit(v3);

  return v4;
}

- (unint64_t)userDistanceUnitForDistanceType:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[FIUnitManager userDistanceHKUnitForDistanceType:](self, "userDistanceHKUnitForDistanceType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FIDistanceUnitForHKUnit(v3);

  return v4;
}

- (id)userDistanceHKUnitForDistanceType:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v10;
  int v11;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      -[FIUnitManager userDistanceWalkingRunningHKUnit](self, "userDistanceWalkingRunningHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2uLL:
      -[FIUnitManager userDistanceCyclingHKUnit](self, "userDistanceCyclingHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3uLL:
      -[FIUnitManager userLapLengthHKUnit](self, "userLapLengthHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4uLL:
      -[FIUnitManager userLapLengthHKUnit](self, "userLapLengthHKUnit");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "yardUnit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v5, "isEqual:", v10);

        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = v5;
        }
      }
      v3 = v8;

      return v3;
    case 5uLL:
      -[FIUnitManager userDistanceElevationHKUnit](self, "userDistanceElevationHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6uLL:
      -[FIUnitManager userDistanceCrossCountrySkiingHKUnit](self, "userDistanceCrossCountrySkiingHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 7uLL:
      -[FIUnitManager userDistanceDownhillSnowSportsHKUnit](self, "userDistanceDownhillSnowSportsHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 8uLL:
      -[FIUnitManager userDistancePaddleSportsHKUnit](self, "userDistancePaddleSportsHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 9uLL:
      -[FIUnitManager userDistanceRowingHKUnit](self, "userDistanceRowingHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 0xAuLL:
      -[FIUnitManager userDistanceSkatingSportsHKUnit](self, "userDistanceSkatingSportsHKUnit");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v3 = (void *)v4;
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)userDistanceHKUnitForActivityType:(id)a3
{
  return -[FIUnitManager userDistanceHKUnitForDistanceType:](self, "userDistanceHKUnitForDistanceType:", FIDistanceTypeForActivityType(a3));
}

+ (id)quantityTypeForDistanceType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  v5 = a3 - 1;
  if (a3 - 1 <= 9 && ((0x3EFu >> v5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", **((_QWORD **)&unk_24CC4ED10 + v5), v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setUserDistanceUnit:(unint64_t)a3 forDistanceType:(unint64_t)a4
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  +[FIUnitManager quantityTypeForDistanceType:](FIUnitManager, "quantityTypeForDistanceType:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 4;
  if (a3 == 2)
    v8 = 1;
  else
    v8 = a3;
  if (a3 != 3)
    v7 = v8;
  if (a4 == 4)
    v9 = v7;
  else
    v9 = a3;
  FIHKUnitForDistanceUnit(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _setPreferredHKUnit:forQuantityType:](self, "_setPreferredHKUnit:forQuantityType:", v10, v11);

}

- (unint64_t)userDistanceWalkingRunningUnit
{
  void *v2;
  unint64_t v3;

  -[FIUnitManager userDistanceWalkingRunningHKUnit](self, "userDistanceWalkingRunningHKUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FIDistanceUnitForHKUnit(v2);

  return v3;
}

- (unint64_t)userDistanceElevationUnit
{
  if (-[FIUnitManager userDistanceWalkingRunningUnit](self, "userDistanceWalkingRunningUnit") - 1 < 2)
    return 1;
  else
    return 5;
}

- (id)userDistanceElevationHKUnit
{
  if (-[FIUnitManager userDistanceElevationUnit](self, "userDistanceElevationUnit") == 1)
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  else
    objc_msgSend(MEMORY[0x24BDD4048], "footUnit");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)userDistanceWalkingRunningHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3560]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userDistanceCrossCountrySkiingHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3528]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userDistanceDownhillSnowSportsHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3538]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userDistancePaddleSportsHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3540]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userDistanceRowingHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3548]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userDistanceSkatingSportsHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3550]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userLapLengthHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3558]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userDepthHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3698]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setUserDepthHKUnit:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD3E80];
  v5 = *MEMORY[0x24BDD3698];
  v6 = a3;
  objc_msgSend(v4, "quantityTypeForIdentifier:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _setPreferredHKUnit:forQuantityType:](self, "_setPreferredHKUnit:forQuantityType:", v6, v7);

}

- (id)userWaterTemperatureHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD36D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setUserWaterTemperatureHKUnit:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD3E80];
  v5 = *MEMORY[0x24BDD36D8];
  v6 = a3;
  objc_msgSend(v4, "quantityTypeForIdentifier:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _setPreferredHKUnit:forQuantityType:](self, "_setPreferredHKUnit:forQuantityType:", v6, v7);

}

- (void)setUserDistanceWalkingRunningUnit:(unint64_t)a3
{
  void *v4;
  id v5;

  FIHKUnitForDistanceUnit(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3560]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _setPreferredHKUnit:forQuantityType:](self, "_setPreferredHKUnit:forQuantityType:", v5, v4);

}

- (unint64_t)userDistanceCyclingUnit
{
  void *v2;
  unint64_t v3;

  -[FIUnitManager userDistanceCyclingHKUnit](self, "userDistanceCyclingHKUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FIDistanceUnitForHKUnit(v2);

  return v3;
}

- (id)userDistanceCyclingHKUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3530]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setUserDistanceCyclingUnit:(unint64_t)a3
{
  void *v4;
  id v5;

  FIHKUnitForDistanceUnit(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3530]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _setPreferredHKUnit:forQuantityType:](self, "_setPreferredHKUnit:forQuantityType:", v5, v4);

}

- (double)paceWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6
{
  id v10;
  void *v11;
  double v12;

  v10 = a3;
  FIHKUnitForDistanceUnit(-[FIUnitManager paceDistanceUnitForDistanceType:](self, "paceDistanceUnitForDistanceType:", a6));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = FIPace(v10, v11, a5, a4);

  return v12;
}

- (double)distanceInMetersForDistanceInUserUnit:(double)a3 distanceType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[FIUnitManager userDistanceHKUnitForDistanceType:](self, "userDistanceHKUnitForDistanceType:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v7);
  v9 = v8;

  return v9;
}

- (double)distanceInUserDistanceUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4
{
  double result;

  -[FIUnitManager distanceInDistanceUnit:forDistanceInMeters:](self, "distanceInDistanceUnit:forDistanceInMeters:", -[FIUnitManager userDistanceUnitForDistanceType:](self, "userDistanceUnitForDistanceType:", a4), a3);
  return result;
}

- (double)distanceInDistanceUnit:(unint64_t)a3 forDistanceInMeters:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quantityWithUnit:doubleValue:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  FIHKUnitForDistanceUnit(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v9);
  v11 = v10;

  return v11;
}

- (id)userActiveEnergyBurnedUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3340]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setUserActiveEnergyBurnedUnit:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD3E80];
  v5 = *MEMORY[0x24BDD3340];
  v6 = a3;
  objc_msgSend(v4, "quantityTypeForIdentifier:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _setPreferredHKUnit:forQuantityType:](self, "_setPreferredHKUnit:forQuantityType:", v6, v7);

}

- (id)userBasalEnergyBurnedUnit
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _preferredHKUnitForQuantityType:](self, "_preferredHKUnitForQuantityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setUserBasalEnergyBurnedUnit:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD3E80];
  v5 = *MEMORY[0x24BDD3388];
  v6 = a3;
  objc_msgSend(v4, "quantityTypeForIdentifier:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUnitManager _setPreferredHKUnit:forQuantityType:](self, "_setPreferredHKUnit:forQuantityType:", v6, v7);

}

- (void)setPreferredUnitsForTesting:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *preferredUnits;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  preferredUnits = self->_preferredUnits;
  self->_preferredUnits = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredUnits, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __38__FIUnitManager__updatePreferredUnits__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21168F000, v0, v1, "[Fitness] Error fetching preferred units: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setPreferredHKUnit:forQuantityType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21168F000, v0, v1, "[FitnessUI] Attempting to set an invalid user unit: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __53__FIUnitManager__setPreferredHKUnit_forQuantityType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21168F000, v0, v1, "[FitnessUI] Error setting preferred units: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
