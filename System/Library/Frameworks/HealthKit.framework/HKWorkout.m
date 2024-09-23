@implementation HKWorkout

- (void)_setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)_setTotalEnergyBurned:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierActiveEnergyBurned"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKStatisticsForTotal(v8, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKWorkoutActivity _setStatistics:forType:](self->_primaryActivity, "_setStatistics:forType:", v7, v8);
}

- (void)_setTotalBasalEnergyBurned:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierBasalEnergyBurned"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKStatisticsForTotal(v8, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKWorkoutActivity _setStatistics:forType:](self->_primaryActivity, "_setStatistics:forType:", v7, v8);
}

- (void)_setTotalDistance:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  _HKWorkoutDistanceTypeForActivityType(-[HKWorkout workoutActivityType](self, "workoutActivityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HKSample startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSample endDate](self, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HKStatisticsForTotal(v4, v8, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKWorkoutActivity _setStatistics:forType:](self->_primaryActivity, "_setStatistics:forType:", v7, v4);
  }

}

- (void)_setWorkoutActivityType:(unint64_t)a3
{
  self->_workoutActivityType = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkout;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_workoutActivityType, CFSTR("workoutActivityType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_goalType, CFSTR("goalType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_goal, CFSTR("goal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutEvents, CFSTR("workoutEvents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subActivities, CFSTR("subActivities"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_primaryActivity, CFSTR("primaryActivity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_zonesByType, CFSTR("zonesByType"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonesByType, 0);
  objc_storeStrong((id *)&self->_subActivities, 0);
  objc_storeStrong((id *)&self->_primaryActivity, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_workoutEvents, 0);
}

- (HKWorkoutActivityType)workoutActivityType
{
  uint64_t v3;
  uint64_t v5;
  HKWorkoutActivityType workoutActivityType;
  BOOL v7;
  uint64_t v8;
  HKWorkoutActivityType v9;
  uint64_t v10;
  HKWorkoutActivityType v11;
  BOOL v12;
  uint64_t v13;
  int v14;

  if (HKProgramSDKAtLeast(0x7E70901FFFFFFFFLL, a2))
    return self->_workoutActivityType;
  if (HKProgramSDKAtLeast(0x7E60901FFFFFFFFLL, v3))
  {
    workoutActivityType = self->_workoutActivityType;
    v7 = workoutActivityType == HKWorkoutActivityTypeUnderwaterDiving;
LABEL_7:
    v9 = HKWorkoutActivityTypeOther;
LABEL_8:
    if (v7)
      return v9;
    else
      return workoutActivityType;
  }
  if (HKProgramSDKAtLeast(0x7E50901FFFFFFFFLL, v5))
  {
    workoutActivityType = self->_workoutActivityType;
    v7 = (workoutActivityType & 0xFFFFFFFFFFFFFFFELL) == 82;
    goto LABEL_7;
  }
  if (HKProgramSDKAtLeast(0x7E30901FFFFFFFFLL, v8))
  {
    v11 = self->_workoutActivityType;
    v12 = v11 - 77 >= 4;
  }
  else
  {
    if (!HKProgramSDKAtLeast(0x7E10901FFFFFFFFLL, v10))
    {
      v14 = HKProgramSDKAtLeast(0x7E00901FFFFFFFFLL, v13);
      workoutActivityType = self->_workoutActivityType;
      v9 = HKWorkoutActivityTypeOther;
      if (workoutActivityType - 58 >= 0xE)
        v9 = self->_workoutActivityType;
      if (workoutActivityType - 72 < 3)
        workoutActivityType = HKWorkoutActivityTypeOther;
      v7 = v14 == 0;
      goto LABEL_8;
    }
    v11 = self->_workoutActivityType;
    v12 = v11 - 75 >= 2;
  }
  if (v12)
    return v11;
  else
    return 3000;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (HKQuantity)totalEnergyBurned
{
  void *v3;
  void *v4;
  void *v5;

  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierActiveEnergyBurned"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutActivity statisticsForType:](self->_primaryActivity, "statisticsForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sumQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (HKQuantity)_totalBasalEnergyBurned
{
  void *v3;
  void *v4;
  void *v5;

  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierBasalEnergyBurned"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutActivity statisticsForType:](self->_primaryActivity, "statisticsForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sumQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (HKQuantity)totalDistance
{
  void *v3;
  void *v4;
  void *v5;

  _HKWorkoutDistanceTypeForActivityType(-[HKWorkout workoutActivityType](self, "workoutActivityType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKWorkoutActivity statisticsForType:](self->_primaryActivity, "statisticsForType:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sumQuantity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (HKQuantity *)v5;
}

- (unint64_t)_goalType
{
  return self->_goalType;
}

- (HKQuantity)_goal
{
  return self->_goal;
}

- (BOOL)_isWatchWorkout
{
  return self->_isWatchWorkout;
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 duration:(double)a7 totalActiveEnergyBurned:(id)a8 totalBasalEnergyBurned:(id)a9 totalDistance:(id)a10 goalType:(unint64_t)a11 goal:(id)a12 device:(id)a13 metadata:(id)a14
{
  return (id)objc_msgSend(a1, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:totalSwimmingStrokeCount:totalFlightsClimbed:goalType:goal:device:metadata:", a3, a4, a5, a6, 0, a8, a7, a9, a10, 0, 0, a11, a12, a13, a14);
}

- (void)_setIsWatchWorkout:(BOOL)a3
{
  self->_isWatchWorkout = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkout)initWithCoder:(id)a3
{
  id v4;
  HKWorkout *v5;
  double v6;
  uint64_t v7;
  HKQuantity *goal;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *workoutEvents;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *subActivities;
  uint64_t v19;
  HKWorkoutActivity *primaryActivity;
  uint64_t workoutActivityType;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  HKWorkoutActivity *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  double duration;
  void *v34;
  uint64_t v35;
  HKWorkoutActivity *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSDictionary *zonesByType;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)HKWorkout;
  v5 = -[HKSample initWithCoder:](&v50, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_workoutActivityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workoutActivityType"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v6;
    v5->_goalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("goalType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("goal"));
    v7 = objc_claimAutoreleasedReturnValue();
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("workoutEvents"));
    v12 = objc_claimAutoreleasedReturnValue();
    workoutEvents = v5->_workoutEvents;
    v5->_workoutEvents = (NSArray *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("subActivities"));
    v17 = objc_claimAutoreleasedReturnValue();
    subActivities = v5->_subActivities;
    v5->_subActivities = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryActivity"));
    v19 = objc_claimAutoreleasedReturnValue();
    primaryActivity = v5->_primaryActivity;
    v5->_primaryActivity = (HKWorkoutActivity *)v19;

    if (!v5->_primaryActivity)
    {
      workoutActivityType = v5->_workoutActivityType;
      -[HKObject metadata](v5, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _HKWorkoutConfigurationWithActivityTypeAndMetadata(workoutActivityType, v22);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalEnergyBurned"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalBasalEnergyBurned"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalDistance"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalSwimmingStrokeCount"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalFlightsClimbed"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_opt_class();
      v24 = v5->_workoutActivityType;
      -[HKSample startDate](v5, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSample endDate](v5, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_statisticsFromTotalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:totalSwimmingStrokeCount:totalFlightsClimbed:workoutActivityType:startDate:endDate:", v49, v48, v46, v45, v44, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = [HKWorkoutActivity alloc];
      -[HKObject UUID](v5, "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSample startDate](v5, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSample endDate](v5, "endDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v5->_workoutEvents;
      duration = v5->_duration;
      -[HKObject metadata](v5, "metadata");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HKWorkoutActivity _initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:](v28, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v29, v47, v30, v31, v32, 0, duration, v34, v27);
      v36 = v5->_primaryActivity;
      v5->_primaryActivity = (HKWorkoutActivity *)v35;

    }
    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("zonesByType"));
    v41 = objc_claimAutoreleasedReturnValue();
    zonesByType = v5->_zonesByType;
    v5->_zonesByType = (NSDictionary *)v41;

  }
  return v5;
}

- (HKQuantity)totalSwimmingStrokeCount
{
  void *v3;
  void *v4;
  void *v5;

  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierSwimmingStrokeCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutActivity statisticsForType:](self->_primaryActivity, "statisticsForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sumQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (HKQuantity)totalFlightsClimbed
{
  void *v3;
  void *v4;
  void *v5;

  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierFlightsClimbed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutActivity statisticsForType:](self->_primaryActivity, "statisticsForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sumQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (NSArray)workoutEvents
{
  int v3;
  NSArray *workoutEvents;
  NSArray *v5;
  void *v6;

  v3 = HKProgramSDKAtLeast(0x7E00901FFFFFFFFLL, a2);
  workoutEvents = self->_workoutEvents;
  if (v3)
  {
    v5 = workoutEvents;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_392);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](workoutEvents, "filteredArrayUsingPredicate:", v6);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_enumerateTimePeriodsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x2020000000;
  v35 = 0;
  -[HKWorkout workoutEvents](self, "workoutEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  if (v7)
  {
    -[HKSample startDate](self, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSample endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkout duration](self, "duration");
    v11 = v10;
    objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    v13 = v12;
    if (v11 <= 0.00000011920929 || v12 - v11 <= 0.00000011920929)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
      objc_msgSend(v5, "addObject:", v16);
      v11 = v13;
      v15 = v9;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99D68];
      -[HKWorkout duration](self, "duration", v12 - v11);
      objc_msgSend(v14, "dateWithTimeInterval:sinceDate:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v15);
      objc_msgSend(v5, "addObject:", v16);
    }

    v33[3] = v11;
  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __74__HKWorkout_HKWorkoutDataSourceUtilities___enumerateTimePeriodsWithBlock___block_invoke;
    v29[3] = &unk_1E37EFFA0;
    v30 = v5;
    v31 = &v32;
    -[HKWorkout _enumerateActiveTimePeriods:](self, "_enumerateActiveTimePeriods:", v29);
    v8 = v30;
  }

  -[HKWorkout duration](self, "duration");
  if (v17 - v33[3] <= 0.1)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v5;
    v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v18);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        }
        v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
      }
      while (v22);
    }
  }
  else
  {
    -[HKSample endDate](self, "endDate");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[HKWorkout duration](self, "duration");
    objc_msgSend(v18, "dateByAddingTimeInterval:", -v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v20, v18);
    ((void (**)(id, void *))v4)[2](v4, v21);

  }
  _Block_object_dispose(&v32, 8);

}

double __74__HKWorkout_HKWorkoutDataSourceUtilities___enumerateTimePeriodsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  double result;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x1E0CB3588];
  v7 = a3;
  v8 = a2;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithStartDate:endDate:", v8, v7);
  objc_msgSend(v5, "addObject:", v9);

  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v11 = v10;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v11 + *(double *)(v12 + 24);
  *(double *)(v12 + 24) = result;
  return result;
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return (HKWorkout *)objc_msgSend(a1, "workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:device:metadata:", workoutActivityType, startDate, endDate, 0, 0, 0, 0, 0);
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)objc_msgSend(a1, "workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:device:metadata:", workoutActivityType, startDate, endDate, workoutEvents, totalEnergyBurned, totalDistance, 0, metadata);
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate duration:(NSTimeInterval)duration totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)objc_msgSend(a1, "workoutWithActivityType:startDate:endDate:duration:totalEnergyBurned:totalDistance:device:metadata:", workoutActivityType, startDate, endDate, totalEnergyBurned, totalDistance, 0, duration, metadata);
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate duration:(NSTimeInterval)duration totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)objc_msgSend(a1, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:totalSwimmingStrokeCount:totalFlightsClimbed:goalType:goal:device:metadata:", workoutActivityType, startDate, endDate, 0, 0, totalEnergyBurned, duration, 0, totalDistance, 0, 0, 0, 0, device, metadata);
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)objc_msgSend(a1, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:totalSwimmingStrokeCount:totalFlightsClimbed:goalType:goal:device:metadata:", workoutActivityType, startDate, endDate, workoutEvents, 0, totalEnergyBurned, 0.0, 0, totalDistance, 0, 0, 0, 0, device, metadata);
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance totalSwimmingStrokeCount:(HKQuantity *)totalSwimmingStrokeCount device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)objc_msgSend(a1, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:totalSwimmingStrokeCount:totalFlightsClimbed:goalType:goal:device:metadata:", workoutActivityType, startDate, endDate, workoutEvents, 0, totalEnergyBurned, 0.0, 0, totalDistance, totalSwimmingStrokeCount, 0, 0, 0, device, metadata);
}

+ (HKWorkout)workoutWithActivityType:(HKWorkoutActivityType)workoutActivityType startDate:(NSDate *)startDate endDate:(NSDate *)endDate workoutEvents:(NSArray *)workoutEvents totalEnergyBurned:(HKQuantity *)totalEnergyBurned totalDistance:(HKQuantity *)totalDistance totalFlightsClimbed:(HKQuantity *)totalFlightsClimbed device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  return (HKWorkout *)objc_msgSend(a1, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:totalSwimmingStrokeCount:totalFlightsClimbed:goalType:goal:device:metadata:", workoutActivityType, startDate, endDate, workoutEvents, 0, totalEnergyBurned, 0.0, 0, totalDistance, 0, totalFlightsClimbed, 0, 0, device, metadata);
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5
{
  return (id)objc_msgSend(a1, "_workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:device:metadata:", a3, a4, a5, 0, 0, 0, 0, 0);
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 totalEnergyBurned:(id)a7 totalDistance:(id)a8 device:(id)a9 metadata:(id)a10
{
  return (id)objc_msgSend(a1, "_workoutWithActivityType:startDate:endDate:workoutEvents:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:device:metadata:", a3, a4, a5, a6, a7, 0, 0.0, a8, 0, 0, a9, a10);
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 workoutActivities:(id)a7 duration:(double)a8 totalActiveEnergyBurned:(id)a9 totalBasalEnergyBurned:(id)a10 totalDistance:(id)a11 totalSwimmingStrokeCount:(id)a12 totalFlightsClimbed:(id)a13 goalType:(unint64_t)a14 goal:(id)a15 device:(id)a16 metadata:(id)a17
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;

  v24 = a17;
  v25 = a16;
  v26 = a15;
  v27 = a7;
  v28 = a6;
  v29 = a5;
  v30 = a4;
  objc_msgSend(a1, "_statisticsFromTotalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:totalSwimmingStrokeCount:totalFlightsClimbed:workoutActivityType:startDate:endDate:", a9, a10, a11, a12, a13, a3, v30, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", a3, v30, v29, v28, v27, v31, a8, a14, v26, v25, v24);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)_statisticsFromTotalActiveEnergyBurned:(id)a3 totalBasalEnergyBurned:(id)a4 totalDistance:(id)a5 totalSwimmingStrokeCount:(id)a6 totalFlightsClimbed:(id)a7 workoutActivityType:(unint64_t)a8 startDate:(id)a9 endDate:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = &off_1E37E4000;
  if (v14)
  {
    +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierActiveEnergyBurned"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _HKStatisticsForTotal(v23, v14, v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, v23);

    v22 = &off_1E37E4000;
  }
  if (v15)
  {
    +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierBasalEnergyBurned"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _HKStatisticsForTotal(v25, v15, v19, v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, v25);

    v22 = &off_1E37E4000;
  }
  if (v16)
  {
    _HKWorkoutDistanceTypeForActivityType(a8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      _HKStatisticsForTotal(v27, v16, v19, v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v28);

      v22 = &off_1E37E4000;
    }

  }
  if (v17)
  {
    objc_msgSend(v22[502], "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierSwimmingStrokeCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _HKStatisticsForTotal(v30, v17, v19, v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, v30);

    v22 = &off_1E37E4000;
  }
  if (v18)
  {
    objc_msgSend(v22[502], "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierFlightsClimbed"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _HKStatisticsForTotal(v32, v18, v19, v20);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v33, v32);

  }
  return v21;
}

+ (id)_workoutWithActivityType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 workoutEvents:(id)a6 workoutActivities:(id)a7 duration:(double)a8 statistics:(id)a9 goalType:(unint64_t)a10 goal:(id)a11 device:(id)a12 metadata:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  unint64_t v50;
  double v51;
  unint64_t v52;

  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v23 = a11;
  v41 = a12;
  v24 = a13;
  +[HKObjectType workoutType](HKObjectType, "workoutType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v27 = 2.22507386e-308;
    if (v19)
      goto LABEL_3;
LABEL_5:
    v29 = 2.22507386e-308;
    goto LABEL_6;
  }
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v27 = v26;
  if (!v19)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v29 = v28;
LABEL_6:
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __138__HKWorkout__workoutWithActivityType_startDate_endDate_workoutEvents_workoutActivities_duration_statistics_goalType_goal_device_metadata___block_invoke;
  v42[3] = &unk_1E37F64E0;
  v51 = a8;
  v43 = v20;
  v44 = v18;
  v45 = v19;
  v46 = v21;
  v47 = v24;
  v48 = v22;
  v52 = a10;
  v49 = v23;
  v50 = a3;
  v30 = v23;
  v31 = v22;
  v32 = v24;
  v33 = v21;
  v34 = v19;
  v35 = v18;
  v36 = v20;
  v37 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v25, v41, v32, v42, v27, v29);

  return v37;
}

void __138__HKWorkout__workoutWithActivityType_startDate_endDate_workoutEvents_workoutActivities_duration_statistics_goalType_goal_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  int *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  HKWorkoutActivity *v26;
  void *v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v3[12] = *(id *)(a1 + 88);
  v4 = &OBJC_IVAR___HKStatistics__dataCountBySource;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingComparator:", &__block_literal_global_121);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      v11 = 2;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "type");
          if ((unint64_t)(v11 - 1) > 1 || v11 != v14)
          {
            v11 = objc_msgSend(v13, "type");
            objc_msgSend(v6, "addObject:", v13);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v9);
    }

    v4 = &OBJC_IVAR___HKStatistics__dataCountBySource;
    objc_storeStrong(v3 + 14, v6);

  }
  else
  {
    v6 = 0;
  }
  v15 = *(double *)(a1 + 96);
  if (v15 <= 0.0)
    v15 = _HKCalculateWorkoutDuration(*(void **)(a1 + 40), *(void **)(a1 + 48), v3[14]);
  *((double *)v3 + 13) = v15;
  if (objc_msgSend(v6, "count") && objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = *(id *)(a1 + 56);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copy");
          objc_msgSend(v22, "_filterAndSetWorkoutEvents:", v6);
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v19);
    }

    v23 = v3[19];
    v3[19] = v16;
    v4 = &OBJC_IVAR___HKStatistics__dataCountBySource;
  }
  else
  {
    v24 = objc_msgSend(*(id *)(a1 + 56), "copy");
    v23 = v3[19];
    v3[19] = (id)v24;
  }

  _HKWorkoutConfigurationWithActivityTypeAndMetadata(*(_QWORD *)(a1 + 88), *(void **)(a1 + 64));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [HKWorkoutActivity alloc];
  objc_msgSend(v3, "UUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HKWorkoutActivity _initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:](v26, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v27, v25, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(id *)((char *)v3 + v4[951]), 0, *((double *)v3 + 13), 0, *(_QWORD *)(a1 + 72));
  v29 = v3[18];
  v3[18] = (id)v28;

  v3[15] = *(id *)(a1 + 104);
  objc_storeStrong(v3 + 16, *(id *)(a1 + 80));

}

uint64_t __138__HKWorkout__workoutWithActivityType_startDate_endDate_workoutEvents_workoutActivities_duration_statistics_goalType_goal_device_metadata___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (id)_deepCopy
{
  void *v3;
  unint64_t workoutActivityType;
  void *v5;
  double duration;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  -[NSArray hk_map:](self->_subActivities, "hk_map:", &__block_literal_global_63_0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  workoutActivityType = self->_workoutActivityType;
  -[HKSample startDate](self, "startDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v24, "copy");
  -[HKSample endDate](self, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v23, "copy");
  v20 = (void *)-[NSArray copy](self->_workoutEvents, "copy");
  duration = self->_duration;
  -[HKWorkoutActivity allStatistics](self->_primaryActivity, "allStatistics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKWorkout _goalType](self, "_goalType");
  v8 = (void *)-[HKQuantity copy](self->_goal, "copy");
  -[HKObject device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[HKObject metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v3, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", workoutActivityType, v5, v22, v20, v25, v19, duration, v7, v8, v10, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKObject sourceRevision](self, "sourceRevision");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v21, "_setSourceRevision:", v14);

  -[HKWorkout _primaryActivity](self, "_primaryActivity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_deepCopy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setPrimaryActivity:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_zonesByType, 1);
  objc_msgSend(v21, "_setZonesByType:", v17);

  return v21;
}

uint64_t __22__HKWorkout__deepCopy__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_deepCopy");
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

+ (id)_activityTypeMappings
{
  return &unk_1E389D710;
}

+ (id)_stringFromWorkoutActivityType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a1, "_activityTypeMappings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__HKWorkout__stringFromWorkoutActivityType___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B32__0__NSString_8__NSNumber_16_B24l;
  v8[4] = a3;
  objc_msgSend(v4, "keysOfEntriesPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __44__HKWorkout__stringFromWorkoutActivityType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "unsignedIntegerValue") == *(_QWORD *)(a1 + 32);
}

+ (unint64_t)_workoutActivityTypeFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "_activityTypeMappings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

+ (id)_allWorkoutTypeNames
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_activityTypeMappings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_allWorkoutActivityTypes
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_activityTypeMappings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t workoutActivityType;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  workoutActivityType = self->_workoutActivityType;
  v9.receiver = self;
  v9.super_class = (Class)HKWorkout;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@> (%ld) %@"), v4, workoutActivityType, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)_detailedDescriptionComponents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  _HKWorkoutActivityNameForActivityType(self->_workoutActivityType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("activity=%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[HKSample startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("startDate=%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[HKSample endDate](self, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("endDate=%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[HKWorkout duration](self, "duration");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("duration=%f"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HKWorkout allStatistics](self, "allStatistics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __43__HKWorkout__detailedDescriptionComponents__block_invoke;
  v25 = &unk_1E37F6568;
  v17 = v3;
  v26 = v17;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &v22);

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[HKObject metadata](self, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("metadata=%@"), v19, v22, v23, v24, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v20);

  return v17;
}

void __43__HKWorkout__detailedDescriptionComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  v6 = objc_msgSend(v18, "aggregationStyle");
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (v6)
    {
      v8 = *(void **)(a1 + 32);
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v18, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=<Statistic output not set>"), v10);
      goto LABEL_8;
    }
    v11 = *(void **)(a1 + 32);
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sumQuantity");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v7 = objc_msgSend(v18, "code");
  if (v7 == 277)
  {
    v11 = *(void **)(a1 + 32);
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "minimumQuantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maximumQuantity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("waterTemperature=%@-%@"), v10, v15);
LABEL_12:
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v17);

    goto LABEL_13;
  }
  if (v7 != 269)
  {
    v11 = *(void **)(a1 + 32);
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "averageQuantity");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v15 = (void *)v13;
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@=%@"), v10, v13);
    goto LABEL_12;
  }
  v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "maximumQuantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("max_underwaterDepth=%@"), v10);
LABEL_8:
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v15);
LABEL_13:

}

- (id)_detailedDescriptionString
{
  void *v2;
  void *v3;

  -[HKWorkout _detailedDescriptionComponents](self, "_detailedDescriptionComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v7;
  void *v8;
  uint64_t isKindOfClass;
  void *v10;
  HKWorkoutActivity *primaryActivity;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  id obj;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  _QWORD v53[3];

  var1 = a3.var1;
  var0 = a3.var0;
  v53[1] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)HKWorkout;
  -[HKSample _validateWithConfiguration:](&v51, sel__validateWithConfiguration_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    return v7;
  -[HKSample sampleType](self, "sampleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = objc_opt_class();
    -[HKSample sampleType](self, "sampleType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v13, a2, CFSTR("Invalid workout type %@"), v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  -[HKWorkout _validateWorkoutEvents:withConfiguration:](self, "_validateWorkoutEvents:withConfiguration:", self->_workoutEvents, var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    return v7;
  -[HKWorkout _validateWorkoutActivities:withConfiguration:](self, "_validateWorkoutActivities:withConfiguration:", self->_subActivities, var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    return v7;
  if (!self->_primaryActivity)
  {
    primaryActivity = 0;
    goto LABEL_12;
  }
  v53[0] = self->_primaryActivity;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkout _validateWorkoutActivities:withConfiguration:](self, "_validateWorkoutActivities:withConfiguration:", v10, var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return v7;
  primaryActivity = self->_primaryActivity;
LABEL_12:
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[HKWorkoutActivity allStatistics](primaryActivity, "allStatistics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (!v16)
    goto LABEL_27;
  v17 = v16;
  v46 = *(_QWORD *)v48;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v48 != v46)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      -[HKWorkoutActivity statisticsForType:](self->_primaryActivity, "statisticsForType:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "canonicalUnit");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sumQuantity");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        objc_msgSend(v20, "sumQuantity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isCompatibleWithUnit:", v21);

        if ((v25 & 1) == 0)
        {
          v38 = (void *)MEMORY[0x1E0CB35C8];
          v39 = objc_opt_class();
          objc_msgSend(v19, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sumQuantity");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          v43 = CFSTR("Incompatible unit for %@ sum quantity, received %@");
LABEL_34:
          objc_msgSend(v38, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v39, a2, v43, v40, v41);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          return v44;
        }
      }
      objc_msgSend(v20, "averageQuantity");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        objc_msgSend(v20, "averageQuantity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isCompatibleWithUnit:", v21);

        if ((v29 & 1) == 0)
        {
          v38 = (void *)MEMORY[0x1E0CB35C8];
          v39 = objc_opt_class();
          objc_msgSend(v19, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "averageQuantity");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          v43 = CFSTR("Incompatible unit for %@ average quantity, received %@");
          goto LABEL_34;
        }
      }
      objc_msgSend(v20, "minimumQuantity");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        objc_msgSend(v20, "minimumQuantity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isCompatibleWithUnit:", v21);

        if ((v33 & 1) == 0)
        {
          v38 = (void *)MEMORY[0x1E0CB35C8];
          v39 = objc_opt_class();
          objc_msgSend(v19, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "minimumQuantity");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          v43 = CFSTR("Incompatible unit for %@ minimum quantity, received %@");
          goto LABEL_34;
        }
      }
      objc_msgSend(v20, "maximumQuantity");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        objc_msgSend(v20, "maximumQuantity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isCompatibleWithUnit:", v21);

        if ((v37 & 1) == 0)
        {
          v38 = (void *)MEMORY[0x1E0CB35C8];
          v39 = objc_opt_class();
          objc_msgSend(v19, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "maximumQuantity");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          v43 = CFSTR("Incompatible unit for %@ maximum quantity, received %@");
          goto LABEL_34;
        }
      }

    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v17)
      continue;
    break;
  }
LABEL_27:

  if ((_HKWorkoutGoalTypeAcceptsQuantity(self->_goalType, self->_goal) & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Incompatible goal (%@) for goal type %ld"), self->_goal, self->_goalType);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_validateWorkoutEvents:(id)a3 withConfiguration:(HKObjectValidationConfiguration)a4
{
  unint64_t var1;
  unint64_t var0;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[10];
  _QWORD v16[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__55;
  v21 = __Block_byref_object_dispose__55;
  v22 = 0;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "type") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("First event cannot be resume, workouts begin in the running state"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v18[5];
    v18[5] = v11;

  }
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__HKWorkout__validateWorkoutEvents_withConfiguration___block_invoke;
  v15[3] = &unk_1E37F6590;
  v15[6] = v16;
  v15[7] = var0;
  v15[4] = self;
  v15[5] = &v17;
  v15[8] = var1;
  v15[9] = a2;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);
  v13 = (id)v18[5];
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v17, 8);
  return v13;
}

void __54__HKWorkout__validateWorkoutEvents_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v28 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v28, "_validateWithConfiguration:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = objc_msgSend(v28, "type");
    v7 = v6;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if ((unint64_t)(v6 - 1) <= 1 && v6 == *(_QWORD *)(v8 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 72), CFSTR("Two pause/resume workout events with the same type occurred in a row: (%ld) and (%ld)"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(_QWORD *)(v8 + 24) = v7;
    v12 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v13, v14);

    objc_msgSend(v28, "dateInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "containsDate:", v17) & 1) != 0)
    {
      objc_msgSend(v28, "dateInterval");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "endDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v15, "containsDate:", v19);

      if ((v20 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 72), CFSTR("Workout event (%@) did not occur during this workout"), v28);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = objc_opt_class();
    objc_msgSend(v21, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v22, *(_QWORD *)(a1 + 72), CFSTR("Workout events must be of class %@, received (%@)"), objc_opt_class(), v28);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;
  }
LABEL_11:

}

- (id)_validateWorkoutActivities:(id)a3 withConfiguration:(HKObjectValidationConfiguration)a4
{
  unint64_t var1;
  unint64_t var0;
  id v8;
  id v9;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__55;
  v16 = __Block_byref_object_dispose__55;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HKWorkout__validateWorkoutActivities_withConfiguration___block_invoke;
  v11[3] = &unk_1E37F65B8;
  v11[6] = var0;
  v11[7] = var1;
  v11[4] = self;
  v11[5] = &v12;
  v11[8] = a2;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __58__HKWorkout__validateWorkoutActivities_withConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "_validateWithConfiguration:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v11, v12);

    objc_msgSend(v21, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsDate:", v14) & 1) != 0)
    {
      objc_msgSend(v21, "endDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
LABEL_8:

LABEL_9:
        v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        goto LABEL_10;
      }
      v16 = (void *)v15;
      objc_msgSend(v21, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v13, "containsDate:", v17);

      if ((v18 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 64), CFSTR("Workout activity (%@) did not occur during this workout"), v21);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;
    goto LABEL_8;
  }
LABEL_10:
  *a4 = v9 != 0;

}

- (void)_setUUID:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkout;
  v4 = a3;
  -[HKObject _setUUID:](&v5, sel__setUUID_, v4);
  -[HKWorkoutActivity _setUUID:](self->_primaryActivity, "_setUUID:", v4, v5.receiver, v5.super_class);

}

- (BOOL)acceptsAssociationWithObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierWorkoutEffortScore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "sampleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v5);

  }
  return v7;
}

- (id)subObjectFromUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HKWorkout _subActivities](self, "_subActivities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)_validateObjects:(id)a3 forClass:(Class)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class **v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  __objc2_class **v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  char v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id *v31;
  id v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("%@: %@ data cannot be nil or empty."), objc_opt_class(), a4);
    v23 = 0;
    goto LABEL_26;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v8)
  {
    v22 = 1;
    goto LABEL_25;
  }
  v9 = v8;
  v31 = a5;
  v10 = *(_QWORD *)v36;
  v32 = v7;
  v11 = off_1E37E5000;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v36 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = objc_opt_class();
        objc_msgSend(v24, "hk_assignError:code:format:", v31, 3, CFSTR("%@: Invalid object of type %@. Expecting %@."), v25, objc_opt_class(), a4);
        v22 = 0;
        LOBYTE(a5) = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        continue;
      v14 = v10;
      v15 = a4;
      v16 = v11;
      v17 = v13;
      +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierWorkoutEffortScore"));
      v18 = objc_claimAutoreleasedReturnValue();
      +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sampleType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v18;
      if (objc_msgSend(v20, "isEqual:", v18))
      {

LABEL_19:
        a5 = (id *)MEMORY[0x1E0CB35C8];
        v26 = objc_opt_class();
        objc_msgSend(v17, "sampleType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a5, "hk_error:format:", 3, CFSTR("%@: Sample of type %@ must be related to a workout"), v26, v27);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        LOBYTE(a5) = v28 == 0;
        if (v28)
        {
          if (v31)
            *v31 = objc_retainAutorelease(v28);
          else
            _HKLogDroppedError(v28);
        }

        v22 = 0;
LABEL_24:
        v7 = v32;
        goto LABEL_25;
      }
      objc_msgSend(v17, "sampleType");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(a5, "isEqual:", v19);

      if (v21)
        goto LABEL_19;

      v11 = v16;
      a4 = v15;
      v10 = v14;
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    v22 = 1;
    v7 = v32;
    if (v9)
      continue;
    break;
  }
LABEL_25:

  v23 = v22 | a5;
LABEL_26:

  return v23 & 1;
}

BOOL __26__HKWorkout_workoutEvents__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "type") - 1) < 2;
}

- (void)_setWorkoutEvents:(id)a3
{
  NSArray *v4;
  NSArray *workoutEvents;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_393);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  workoutEvents = self->_workoutEvents;
  self->_workoutEvents = v4;

}

uint64_t __31__HKWorkout__setWorkoutEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_setTotalSwimmingStrokeCount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierSwimmingStrokeCount"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKStatisticsForTotal(v8, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKWorkoutActivity _setStatistics:forType:](self->_primaryActivity, "_setStatistics:forType:", v7, v8);
}

- (void)_setTotalFlightsClimbed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierFlightsClimbed"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKStatisticsForTotal(v8, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKWorkoutActivity _setStatistics:forType:](self->_primaryActivity, "_setStatistics:forType:", v7, v8);
}

- (double)_totalEnergyBurnedInCanonicalUnit
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HKWorkout totalEnergyBurned](self, "totalEnergyBurned");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_totalBasalEnergyBurnedInCanonicalUnit
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HKWorkout _totalBasalEnergyBurned](self, "_totalBasalEnergyBurned");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_totalDistanceInCanonicalUnit
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HKWorkout totalDistance](self, "totalDistance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_totalDistanceIncludingAllTypesForUnit:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[7];

  v22[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22[0] = CFSTR("HKQuantityTypeIdentifierDistanceCycling");
  v22[1] = CFSTR("HKQuantityTypeIdentifierDistanceWalkingRunning");
  v22[2] = CFSTR("HKQuantityTypeIdentifierDistanceSwimming");
  v22[3] = CFSTR("HKQuantityTypeIdentifierDistanceDownhillSnowSports");
  v22[4] = CFSTR("HKQuantityTypeIdentifierDistanceWheelchair");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        +[HKObjectType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKWorkout statisticsForType:](self, "statisticsForType:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sumQuantity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValueForUnit:", v4);
        v15 = v14;

        v9 = v9 + v15;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (double)_totalSwimmingStrokeCountInCanonicalUnit
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HKWorkout totalSwimmingStrokeCount](self, "totalSwimmingStrokeCount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit countUnit](HKUnit, "countUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_totalFlightsClimbedInCanonicalUnit
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HKWorkout totalFlightsClimbed](self, "totalFlightsClimbed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit countUnit](HKUnit, "countUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_goalInCanonicalUnit
{
  HKQuantity *goal;
  void *v3;
  double v4;
  double v5;

  goal = self->_goal;
  _HKWorkoutCanonicalUnitForGoalType(self->_goalType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](goal, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (int64_t)_activityMoveMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[HKObject metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_HKPrivateWorkoutActivityMoveMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (NSArray)workoutActivities
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_subActivities, "count"))
    return self->_subActivities;
  v4[0] = self->_primaryActivity;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)allStatistics
{
  return -[HKWorkoutActivity allStatistics](self->_primaryActivity, "allStatistics");
}

- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType
{
  return -[HKWorkoutActivity statisticsForType:](self->_primaryActivity, "statisticsForType:", quantityType);
}

- (id)zonesForType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_zonesByType, "objectForKeyedSubscript:", a3);
}

- (void)_enumerateActiveTimePeriods:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKSample startDate](self, "startDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSample endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKEnumerateActiveWorkoutIntervalsStartingPaused(v6, v5, self->_workoutEvents, 0, v4);

}

+ (BOOL)_workoutWithActivityType:(unint64_t)a3 acceptsSubActivityType:(unint64_t)a4
{
  BOOL result;

  if (a3 != 82)
    return a3 == a4;
  result = 1;
  if (a4 - 37 > 0x2E || ((1 << (a4 - 37)) & 0x400000000201) == 0)
    return a4 == 13;
  return result;
}

- (HKWorkoutActivity)_primaryActivity
{
  return self->_primaryActivity;
}

- (void)_setPrimaryActivity:(id)a3
{
  objc_storeStrong((id *)&self->_primaryActivity, a3);
}

- (NSArray)_subActivities
{
  return self->_subActivities;
}

- (void)_setSubActivities:(id)a3
{
  objc_storeStrong((id *)&self->_subActivities, a3);
}

- (NSDictionary)_zonesByType
{
  return self->_zonesByType;
}

- (void)_setZonesByType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)_setGoalType:(unint64_t)a3
{
  self->_goalType = a3;
}

- (void)_setGoal:(id)a3
{
  objc_storeStrong((id *)&self->_goal, a3);
}

@end
