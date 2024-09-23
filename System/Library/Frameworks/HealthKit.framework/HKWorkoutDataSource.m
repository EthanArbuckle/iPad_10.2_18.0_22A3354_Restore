@implementation HKWorkoutDataSource

+ (BOOL)shouldObserveRunningMetricsForActivityMode:(int64_t)a3 isIndoor:(BOOL)a4 isGymKit:(BOOL)a5
{
  if (a3 == 2 || a4 || a5)
    return 0;
  else
    return HKCoreMotionSupportsRunningMetrics();
}

+ (id)_distanceTypeForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;

  v4 = a4;
  _HKWorkoutDistanceTypeForActivityType(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 16 <= 0x35 && ((1 << (a3 - 16)) & 0x30000010000001) != 0)
  {

    v6 = 0;
  }
  if (a3 - 25 <= 0x2E && ((1 << (a3 - 25)) & 0x600800004441) != 0 && v4)
  {

    v6 = 0;
  }
  return v6;
}

+ (id)_speedTypeForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5
{
  void *v8;

  _HKWorkoutSpeedTypeForActivityType(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((uint64_t)a3 <= 36)
  {
    if (a3 != 31 && a3 != 35)
    {
LABEL_4:
      if (a3 != 13 || a4)
        return v8;
LABEL_10:

      v8 = 0;
      return v8;
    }
LABEL_9:
    if (!a4)
      return v8;
    goto LABEL_10;
  }
  if (a3 != 37)
  {
    if (a3 != 60)
      goto LABEL_4;
    goto LABEL_9;
  }
  if (a4 || a5)
    goto LABEL_10;
  return v8;
}

+ (id)observedTypesForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5
{
  return (id)objc_msgSend(a1, "observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:", a3, a4, a5, 1);
}

+ (id)observedTypesForActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 connectedToFitnessMachine:(BOOL)a5 activityMode:(int64_t)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const HKQuantityTypeIdentifier *v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = a5;
  v8 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (a3 != 84)
  {
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierHeartRate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  if (a6 != 2)
  {
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierActiveEnergyBurned"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierBasalEnergyBurned"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);
    if (HKCoreMotionSupportsEstimatedWorkoutEffortForActivityType(a3, v8))
    {
      +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

    }
  }
  objc_msgSend(a1, "_distanceTypeForActivityType:isIndoor:", a3, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v11, "addObject:", v16);
  objc_msgSend(a1, "_speedTypeForActivityType:isIndoor:connectedToFitnessMachine:", a3, v8, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v11, "addObject:", v17);
  if (a3 == 46)
  {
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierSwimmingStrokeCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v18);
    if (!HKCoreMotionSupportsWaterSubmersion())
    {
LABEL_25:

      goto LABEL_26;
    }
    goto LABEL_13;
  }
  if (a3 == 44 && v7)
  {
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierFlightsClimbed"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v18);
    v19 = &HKQuantityTypeIdentifierStepCount;
    goto LABEL_23;
  }
  if (a3 == 13)
  {
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierCyclingPower"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v18);
    v19 = &HKQuantityTypeIdentifierCyclingCadence;
    goto LABEL_23;
  }
  if (a3 == 84)
  {
    if (!HKCoreMotionSupportsWaterSubmersion())
      goto LABEL_26;
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierUnderwaterDepth"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v18);
LABEL_13:
    v19 = &HKQuantityTypeIdentifierWaterTemperature;
LABEL_23:
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", *v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v20);
    goto LABEL_24;
  }
  if (a3 == 37
    && objc_msgSend(a1, "shouldObserveRunningMetricsForActivityMode:isIndoor:isGymKit:", a6, v8, v7))
  {
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierRunningStrideLength"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v18);
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierRunningVerticalOscillation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v20);
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierRunningGroundContactTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v21);
    +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierRunningPower"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v22);

LABEL_24:
    goto LABEL_25;
  }
LABEL_26:

  return v11;
}

+ (id)defaultConfigurationWithWorkoutConfiguration:(id)a3 activityMoveMode:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  HKWorkoutDataSourceConfiguration *v31;
  void *v32;
  HKWorkoutDataSourceConfiguration *v33;
  HKWorkoutDataSourceConfiguration *v34;
  void *v35;
  void *v37;
  void *v38;
  id obj;
  uint64_t v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v40 = objc_msgSend(v5, "locationType");
    v37 = v6;
    +[HKWorkoutDataSource observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:](HKWorkoutDataSource, "observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:", objc_msgSend(v6, "activityType"), v40 == 2, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKSource _localDeviceSource](HKSource, "_localDeviceSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuery predicateForObjectsFromSource:](HKQuery, "predicateForObjectsFromSource:", v8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKSource _blePeripheralSource](HKSource, "_blePeripheralSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuery predicateForObjectsFromSource:](HKQuery, "predicateForObjectsFromSource:", v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v16 = v42;
          if (objc_msgSend(a1, "_isBLECollectedDataType:indoorWorkout:", v15, v40 == 2))
          {
            if (+[_HKBehavior isCollectBLETypesFromLocalSourceEnabled](_HKBehavior, "isCollectBLETypesFromLocalSourceEnabled"))
            {
              v17 = (void *)MEMORY[0x1E0CB3528];
              v48[0] = v16;
              v48[1] = v38;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
              v18 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "orPredicateWithSubpredicates:", v18);
              v19 = (id)objc_claimAutoreleasedReturnValue();

              v16 = (id)v18;
            }
            else
            {
              v19 = v38;
            }

            v16 = v19;
          }
          +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "features");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "pulse");

          if (v22 && objc_msgSend(v15, "code") == 5)
          {
            +[HKSource _blePeripheralSource](HKSource, "_blePeripheralSource");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[HKQuery predicateForObjectsFromSource:](HKQuery, "predicateForObjectsFromSource:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)MEMORY[0x1E0CB3528];
            v47[0] = v16;
            v47[1] = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "orPredicateWithSubpredicates:", v26);
            v27 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v27;
          }
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "hk_filterRepresentationForDataTypes:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, v15);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v12);
    }
    v30 = obj;

    v31 = [HKWorkoutDataSourceConfiguration alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v37;
    v33 = -[HKWorkoutDataSourceConfiguration initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:](v31, "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", v37, obj, v10, v32, 1);

  }
  else
  {
    v34 = [HKWorkoutDataSourceConfiguration alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HKWorkoutDataSourceConfiguration initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:](v34, "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", 0, v30, MEMORY[0x1E0C9AA70], v35, 1);

  }
  return v33;
}

+ (BOOL)_isBLECollectedDataType:(id)a3 indoorWorkout:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  __CFString *v9;

  v4 = a4;
  v5 = a3;
  if (_isBLECollectedDataType_indoorWorkout__onceToken != -1)
    dispatch_once(&_isBLECollectedDataType_indoorWorkout__onceToken, &__block_literal_global_28);
  v6 = (void *)_isBLECollectedDataType_indoorWorkout___bleCollectedTypes;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) == 0 && v4)
  {
    objc_msgSend(v5, "identifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = v9 == CFSTR("HKQuantityTypeIdentifierDistanceCycling");

  }
  return v8;
}

void __61__HKWorkoutDataSource__isBLECollectedDataType_indoorWorkout___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HKQuantityTypeIdentifierCyclingPower");
  v2[1] = CFSTR("HKQuantityTypeIdentifierCyclingCadence");
  v2[2] = CFSTR("HKQuantityTypeIdentifierCyclingSpeed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isBLECollectedDataType_indoorWorkout___bleCollectedTypes;
  _isBLECollectedDataType_indoorWorkout___bleCollectedTypes = v0;

}

@end
