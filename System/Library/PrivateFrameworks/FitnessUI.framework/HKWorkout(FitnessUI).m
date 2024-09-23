@implementation HKWorkout(FitnessUI)

+ (uint64_t)fiui_isHeartRateSupportedForActivityType:()FitnessUI isIndoor:
{
  int v6;

  if ((objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode") & 1) != 0)
    return 1;
  v6 = objc_msgSend(a1, "_isHeartRateSupportedInPowerSettingsForActivityType:", a3);
  return v6 & objc_msgSend(a1, "_isHeartRateSupportedInPrivacySettings");
}

+ (uint64_t)_isHeartRateSupportedInPowerSettingsForActivityType:()FitnessUI
{
  return 1;
}

+ (uint64_t)_isHeartRateSupportedInPrivacySettings
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "persistentDomainForName:", *MEMORY[0x24BDD46C0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDD46D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

+ (uint64_t)fiui_shouldTrackPaceWithOdometerForActivityType:()FitnessUI
{
  return ((unint64_t)(a3 - 13) < 0x3B) & (0x600000000000001uLL >> (a3 - 13));
}

- (uint64_t)fiui_isConnectedGymWorkout
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "device");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_isConnectedGymDevice");

  return v2;
}

- (id)fiui_activityType
{
  if (_os_feature_enabled_impl())
    +[FIUIWorkoutActivityType effectiveActivityTypeWithWorkout:](FIUIWorkoutActivityType, "effectiveActivityTypeWithWorkout:", a1);
  else
    +[FIUIWorkoutActivityType activityTypeWithWorkout:](FIUIWorkoutActivityType, "activityTypeWithWorkout:", a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)fiui_strokeStyle
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  uint64_t j;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v32;
  uint64_t k;
  void *v34;
  void *v35;
  float v36;
  float v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDD3208];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD3208]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(a1, "fiui_eventsOfType:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v48 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "metadata");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = v14;
              v16 = objc_msgSend(v14, "integerValue");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16 + 1);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v17 = &unk_24CF4FCE0;
            }
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v9);
    }

    v18 = objc_msgSend(v6, "count");
    v5 = v18;
    if (v18)
    {
      if (v18 == 1)
      {
        objc_msgSend(v6, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v20, "integerValue");

        v4 = 0;
      }
      else
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v6, "allValues");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v44;
          v25 = 0.0;
          v4 = 0;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v44 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "floatValue");
              v25 = v25 + v27;
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v23);
        }
        else
        {
          v25 = 0.0;
          v4 = 0;
        }

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v6, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v40;
          if (v25 >= 10.9999999 || v25 <= 2.00000012)
            v32 = v25;
          else
            v32 = v25 + -1.0;
          v5 = 1;
          while (2)
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v40 != v30)
                objc_enumerationMutation(v19);
              v34 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
              objc_msgSend(v6, "objectForKeyedSubscript:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "floatValue");
              v37 = v36;

              if ((float)(v37 / v32) > 0.9)
              {
                v5 = objc_msgSend(v34, "integerValue");
                goto LABEL_45;
              }
            }
            v29 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            if (v29)
              continue;
            break;
          }
        }
        else
        {
          v5 = 1;
        }
      }
LABEL_45:

    }
    else
    {
      v4 = 0;
    }

  }
  return v5;
}

- (id)fiui_eventsOfType:()FitnessUI
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a1, "workoutEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__HKWorkout_FitnessUI__fiui_eventsOfType___block_invoke;
  v8[3] = &__block_descriptor_40_e41_B24__0__HKWorkoutEvent_8__NSDictionary_16l;
  v8[4] = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)fiui_completionFactor
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  v2 = 0.0;
  switch(objc_msgSend(a1, "_goalType"))
  {
    case 0:
      v2 = 1.0;
      break;
    case 1:
      objc_msgSend(a1, "totalDistance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "doubleValueForUnit:", v4);
      v6 = v5;

      objc_msgSend(a1, "_goal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(a1, "_goal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValueForUnit:", v10);
      v12 = v11;

      if (v12 > 2.22044605e-16)
      {
        objc_msgSend(a1, "duration");
        v2 = v13 / v12;
      }
      break;
    case 3:
      objc_msgSend(a1, "totalEnergyBurned");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "jouleUnit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValueForUnit:", v15);
      v6 = v16;

      objc_msgSend(a1, "_goal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "jouleUnit");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v17 = (void *)v8;
      objc_msgSend(v7, "doubleValueForUnit:", v8);
      v19 = v18;

      if (v19 <= 2.22044605e-16)
        v2 = 0.0;
      else
        v2 = v6 / v19;
      break;
    default:
      return v2;
  }
  return v2;
}

+ (double)fiui_weightedAverageHeartRateWithSamples:()FitnessUI startDate:endDate:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v24 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "quantity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValueForUnit:", v18);
        v20 = v19;

        objc_msgSend(v9, "fiui_appendHeartRate:date:", v16, v20);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "fiui_weightedAverageHeartRateWithStartDate:endDate:", v24, v8);
  v22 = v21;

  return v22;
}

- (BOOL)fiui_hasAveragePace
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_fiui_averagePaceQty");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)_fiui_averagePaceQty
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDD4468]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)fiui_numberOfEventsOfType:()FitnessUI
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "fiui_eventsOfType:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");

  return v2;
}

- (id)fiui_keyValueSummary
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[8];
  _QWORD v40[10];

  v40[8] = *MEMORY[0x24BDAC8D0];
  v39[0] = CFSTR("activityType");
  objc_msgSend(a1, "workoutActivityType");
  _HKWorkoutActivityNameForActivityType();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v38;
  v39[1] = CFSTR("duration");
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "duration");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%f"), v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v37;
  v39[2] = CFSTR("distance");
  objc_msgSend(a1, "totalDistance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v36, "doubleValueForUnit:", v35);
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%f"), v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v34;
  v39[3] = CFSTR("activeCalories");
  objc_msgSend(a1, "totalEnergyBurned");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v33, "doubleValueForUnit:", v32);
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%f"), v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v31;
  v39[4] = CFSTR("basalCalories");
  objc_msgSend(a1, "_totalBasalEnergyBurned");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v30, "doubleValueForUnit:", v29);
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%f"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v10;
  v39[5] = CFSTR("flightsClimbed");
  objc_msgSend(a1, "totalFlightsClimbed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "doubleValueForUnit:", v12);
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%f"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v15;
  v39[6] = CFSTR("strokeCount");
  objc_msgSend(a1, "totalSwimmingStrokeCount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v16, "doubleValueForUnit:", v17);
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%f"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v20;
  v39[7] = CFSTR("uuid");
  objc_msgSend(a1, "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BDD17C8];
  _KeyValueStringFromDictionary(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _KeyValueStringFromDictionary(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ metadata={ %@ }"), v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (BOOL)fiui_hasWeatherData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD4458]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD3240]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "metadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD3238]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)fiui_hasNonZeroElevationGain
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fiui_elevationGain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "fiui_isNonzero");
  else
    v3 = 0;

  return v3;
}

- (id)fiui_elevationGain
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD3188]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(a1, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD4480]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (double)fiui_duration
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD3198]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", v4);
    v6 = v5;

  }
  else
  {
    objc_msgSend(a1, "duration");
    v6 = v7;
  }

  return v6;
}

- (id)fiui_totalDistance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD31B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD3178]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = v3;
  }
  else if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(a1, "totalDistance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (double)fiui_totalStepCount
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDD4490]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)fiui_averageCadence
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDD4460]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)fiui_averagePower
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDD4470]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4048], "wattUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isCompatibleWithUnit:", v3);

  if (v4)
    objc_msgSend(MEMORY[0x24BDD4048], "wattUnit");
  else
    objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", CFSTR("J/s"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v5);
  v7 = v6;

  return v7;
}

- (double)fiui_averagePace
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_fiui_averagePaceQty");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", CFSTR("m/s"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValueForUnit:", v2);
  v4 = v3;

  return v4;
}

- (id)fiui_finalWorkoutUUID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD4498]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
  }
  else
  {
    objc_msgSend(a1, "UUID");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)fiui_connectedGymBrandName
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isConnectedGymDevice");

  if (v3)
  {
    objc_msgSend(a1, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manufacturer");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDD4488];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD4488]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = 0;
      return v9;
    }
    objc_msgSend(a1, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v5;

  return v9;
}

- (double)fiui_averageTimePerLap
{
  uint64_t v2;
  uint64_t v3;
  double v4;

  v2 = objc_msgSend(a1, "fiui_numberOfEventsOfType:", 3);
  if (v2 < 1)
    return 0.0;
  v3 = v2;
  objc_msgSend(a1, "duration");
  return v4 / (double)v3;
}

- (id)fiui_lapLength
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "workoutActivityType") == 46)
  {
    objc_msgSend(a1, "metadata");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD31D0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)fiui_splitsFromDistanceSamples:()FitnessUI distanceInMetersPerSplit:workoutStartDate:
{
  id v8;
  id v9;
  id v10;
  id v11;
  FIUIWorkoutSplit *v12;
  FIUIWorkoutSplit *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  double v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[4];
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;

  v8 = a4;
  v9 = a5;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__0;
  v35[4] = __Block_byref_object_dispose__0;
  v36 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke;
  v19 = &unk_24CF310D0;
  v22 = v35;
  v23 = v34;
  v10 = v8;
  v20 = v10;
  v24 = &v37;
  v11 = v9;
  v21 = v11;
  v25 = &v41;
  v26 = &v28;
  v27 = a2;
  objc_msgSend(a1, "_enumerateActiveTimePeriods:", &v16);
  if (v42[3] != 0.0)
  {
    v12 = [FIUIWorkoutSplit alloc];
    v13 = -[FIUIWorkoutSplit initWithDistance:duration:](v12, "initWithDistance:duration:", v42[3], v38[3], v16, v17, v18, v19, v20);
    objc_msgSend((id)v29[5], "addObject:", v13);

  }
  v14 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v14;
}

- (uint64_t)supportsMetric:()FitnessUI
{
  void *v5;
  int64_t v6;
  FIUIWorkoutDefaultMetricsProvider *v7;
  uint64_t v8;
  uint64_t v9;
  FIUIWorkoutDefaultMetricsProvider *v10;
  uint64_t v11;

  objc_msgSend(a1, "fiui_activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:](FIUIWorkoutDefaultMetricsProvider, "metricsVersionForWorkout:", a1);
  v7 = [FIUIWorkoutDefaultMetricsProvider alloc];
  v8 = objc_msgSend(a1, "_activityMoveMode");
  v9 = FIUIDeviceSupportsElevationGain();
  v10 = -[FIUIWorkoutDefaultMetricsProvider initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:](v7, "initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:", v6, v5, v8, v9, FIUIDeviceSupportsGroundElevation());
  v11 = -[FIUIWorkoutDefaultMetricsProvider isMetricTypeSupported:isMachineWorkout:activityType:](v10, "isMetricTypeSupported:isMachineWorkout:activityType:", a3, objc_msgSend(a1, "fiui_isConnectedGymWorkout"), v5);

  return v11;
}

+ (id)fiui_supportedMetricsForActivityType:()FitnessUI activityMoveMode:
{
  id v5;
  FIUIWorkoutSettingsManager *v6;
  void *v7;

  v5 = a3;
  v6 = -[FIUIWorkoutSettingsManager initWithWorkoutActivityType:activityMoveMode:]([FIUIWorkoutSettingsManager alloc], "initWithWorkoutActivityType:activityMoveMode:", v5, a4);

  -[FIUIWorkoutSettingsManager orderedSupportedMetrics](v6, "orderedSupportedMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fiui_supportedGoalTypesForActivityType:()FitnessUI activityMoveMode:
{
  id v6;
  FIUIWorkoutSettingsManager *v7;
  void *v8;

  v6 = a3;
  v7 = -[FIUIWorkoutSettingsManager initWithWorkoutActivityType:activityMoveMode:]([FIUIWorkoutSettingsManager alloc], "initWithWorkoutActivityType:activityMoveMode:", v6, a4);

  objc_msgSend(a1, "fiui_supportedGoalTypesForWorkoutSettingsManager:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fiui_supportedGoalTypesForWorkoutSettingsManager:()FitnessUI
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  objc_msgSend(a3, "orderedSupportedMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BDD4118], "fiui_associatedMetricForGoalType:", 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  if (v6)
    objc_msgSend(v4, "addObject:", &unk_24CF4FCF8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BDD4118], "fiui_associatedMetricForGoalType:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "containsObject:", v7);

  if (v8)
    objc_msgSend(v4, "addObject:", &unk_24CF4FD10);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BDD4118], "fiui_associatedMetricForGoalType:", 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "containsObject:", v9);

  if (v10)
    objc_msgSend(v4, "addObject:", &unk_24CF4FD28);
  objc_msgSend(v4, "addObject:", &unk_24CF4FD40);

  return v4;
}

+ (uint64_t)fiui_associatedMetricForGoalType:()FitnessUI
{
  if (a3 > 2)
    return 2;
  else
    return qword_21310DFE8[a3];
}

+ (uint64_t)fiui_activitySupportsMetricType:()FitnessUI activityType:activityMoveMode:
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDD4118], "fiui_supportedMetricsForActivityType:activityMoveMode:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  return v8;
}

@end
