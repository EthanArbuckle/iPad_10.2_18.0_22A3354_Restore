@implementation HKQuery

+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("metadata.%K != nil"), key);
}

+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key allowedValues:(NSArray *)allowedValues
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("metadata.%K IN %@"), key, allowedValues);
}

+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key operatorType:(NSPredicateOperatorType)operatorType value:(id)value
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0CB35D0];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = value;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("metadata"), key);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressionForKeyPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v11, v12, 0, operatorType, 0);
  return (NSPredicate *)v13;
}

+ (NSPredicate)predicateForSamplesWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate options:(HKQueryOptions)options
{
  return (NSPredicate *)objc_msgSend(a1, "predicateForSamplesWithStartDate:endDate:inclusiveEndDates:options:", startDate, endDate, 0, options);
}

+ (NSPredicate)predicateForClinicalRecordsWithFHIRResourceType:(HKFHIRResourceType)resourceType
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("FHIRResource.resourceType"), resourceType);
}

+ (NSPredicate)predicateForClinicalRecordsFromSource:(HKSource *)source FHIRResourceType:(HKFHIRResourceType)resourceType identifier:(NSString *)identifier
{
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v8 = identifier;
  v9 = resourceType;
  objc_msgSend(a1, "predicateForObjectsFromSource:", source);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForClinicalRecordsWithFHIRResourceType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("FHIRResource.identifier"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v10;
  v17[1] = v11;
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v15;
}

+ (id)predicateForSamplesWithStartDate:(id)a3 endDate:(id)a4 inclusiveEndDates:(BOOL)a5 options:(unint64_t)a6
{
  char v6;
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  char v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  BOOL v18;
  const __CFString *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HKProgramSDKAtLeast(0x7E30901FFFFFFFFLL, v12);
  if (v9)
  {
    if ((v6 & 1) != 0)
      v14 = CFSTR("startDate >= %@");
    else
      v14 = CFSTR("endDate >= %@");
    if ((v6 & 1) != 0)
      v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

  }
  if (v10)
  {
    if ((v6 & 2) != 0)
    {
      v18 = !v7;
      if (v7)
        v19 = CFSTR("endDate <= %@");
      else
        v19 = CFSTR("endDate < %@");
      v20 = CFSTR("startDate < %@");
      if (!v18)
        v20 = CFSTR("startDate <= %@");
      v21 = (void *)MEMORY[0x1E0CB3880];
      v22 = v20;
      objc_msgSend(v21, "predicateWithFormat:", v19, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v23);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v22, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v7)
        v16 = CFSTR("startDate <= %@");
      else
        v16 = CFSTR("startDate < %@");
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v16, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "addObject:", v17);

    v24 = v13 ^ 1;
    if (!v9)
      v24 = 1;
    if ((v24 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("offsetFromStartDate >= %@"), v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v25);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (NSPredicate)predicateForObjectsFromSource:(HKSource *)source
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("source"), source);
}

+ (NSPredicate)predicateForObjectsFromSources:(NSSet *)sources
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("source"), sources);
}

+ (NSPredicate)predicateForObjectsFromSourceRevisions:(NSSet *)sourceRevisions
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("sourceRevision"), sourceRevisions);
}

+ (NSPredicate)predicateForObjectsFromDevices:(NSSet *)devices
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("device"), devices);
}

+ (NSPredicate)predicateForObjectsWithDeviceProperty:(NSString *)key allowedValues:(NSSet *)allowedValues
{
  NSString *v5;
  NSSet *v6;
  void *v7;

  v5 = key;
  v6 = allowedValues;
  if (!+[_HKObjectComparisonFilter isSupportedDevicePropertyKey:](_HKObjectComparisonFilter, "isSupportedDevicePropertyKey:", v5))objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unrecognized device property."));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K IN %@"), CFSTR("device"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v7;
}

+ (id)_predicateForObjectsFromAppleWatches
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == true"), CFSTR("appleWatch"));
}

+ (id)_predicateForObjectsWithMinOSBuildVersion:(id)a3 maxOSBuildVersion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("OSBuild"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("OSBuild"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSPredicate)predicateForObjectWithUUID:(NSUUID *)UUID
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("UUID"), UUID);
}

+ (NSPredicate)predicateForObjectsWithUUIDs:(NSSet *)UUIDs
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("UUID"), UUIDs);
}

+ (NSPredicate)predicateForObjectsWithNoCorrelation
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("correlation"), 0);
}

+ (NSPredicate)predicateForObjectsFromWorkout:(HKWorkout *)workout
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("workout"), workout);
}

+ (id)predicateForWorkoutEffortSamplesRelatedToWorkout:(id)a3 activity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "workoutActivities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      objc_msgSend(v6, "workoutConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _HKWorkoutActivityNameForActivityType(objc_msgSend(v12, "activityType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "raise:format:", v11, CFSTR("%@ must be sub activity of Workout"), v13);

    }
    objc_msgSend(v6, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v14, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v16);
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("ratingOfExertionAssociation"), v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v17);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)predicateForSamplesAssociatedWithSample:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("association"), a3);
}

+ (id)predicateForSamplesWithinDateInterval:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForSamplesForDayFromDate:(id)a3 calendar:(id)a4 options:(unint64_t)a5
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalForDayFromDate:calendar:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuery predicateForSamplesWithinDateInterval:options:](HKQuery, "predicateForSamplesWithinDateInterval:options:", v6, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForRecordsFromClinicalAccountIdentifier:(id)a3
{
  void *v4;
  void *v5;

  +[HKSource _privateSourceForClinicalAccountIdentifier:name:](HKSource, "_privateSourceForClinicalAccountIdentifier:name:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForObjectsFromSource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForRecordsFromGatewayWithExternalIdentifier:(id)a3
{
  void *v4;
  void *v5;

  +[HKSource _publicSourceForClinicalExternalIdentifier:name:](HKSource, "_publicSourceForClinicalExternalIdentifier:name:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForObjectsFromSource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForSamplesWithConceptIdentifier:(id)a3 keyPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), a4, a3);
}

+ (id)predicateForSamplesWithConceptIdentifiers:(id)a3 keyPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), a4, a3);
}

+ (NSPredicate)predicateForQuantitySamplesWithOperatorType:(NSPredicateOperatorType)operatorType quantity:(HKQuantity *)quantity
{
  void *v5;
  HKQuantity *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB35D0];
  v6 = quantity;
  objc_msgSend(v5, "expressionForKeyPath:", CFSTR("quantity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, operatorType, 0);
  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForCategorySamplesWithOperatorType:(NSPredicateOperatorType)operatorType value:(NSInteger)value
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressionForConstantValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v6, v9, 0, operatorType, 0);
  return (NSPredicate *)v10;
}

+ (NSPredicate)predicateForCategorySamplesEqualToValues:(NSSet *)values
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSSet hk_map:](values, "hk_map:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v6;
}

NSPredicate *__66__HKQuery_HKPredicates__predicateForCategorySamplesEqualToValues___block_invoke(uint64_t a1, void *a2)
{
  return +[HKQuery predicateForCategorySamplesWithOperatorType:value:](HKQuery, "predicateForCategorySamplesWithOperatorType:value:", 4, objc_msgSend(a2, "integerValue"));
}

+ (NSPredicate)predicateForWorkoutsWithWorkoutActivityType:(HKWorkoutActivityType)workoutActivityType
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("workoutType"), workoutActivityType);
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType duration:(NSTimeInterval)duration
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("duration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", duration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressionForConstantValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v6, v9, 0, operatorType, 0);
  return (NSPredicate *)v10;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalEnergyBurned:(HKQuantity *)totalEnergyBurned
{
  void *v5;
  HKQuantity *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB35D0];
  v6 = totalEnergyBurned;
  objc_msgSend(v5, "expressionForKeyPath:", CFSTR("totalEnergyBurned"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, operatorType, 0);
  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalDistance:(HKQuantity *)totalDistance
{
  void *v5;
  HKQuantity *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB35D0];
  v6 = totalDistance;
  objc_msgSend(v5, "expressionForKeyPath:", CFSTR("totalDistance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, operatorType, 0);
  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalSwimmingStrokeCount:(HKQuantity *)totalSwimmingStrokeCount
{
  void *v5;
  HKQuantity *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB35D0];
  v6 = totalSwimmingStrokeCount;
  objc_msgSend(v5, "expressionForKeyPath:", CFSTR("totalSwimmingStrokeCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, operatorType, 0);
  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalFlightsClimbed:(HKQuantity *)totalFlightsClimbed
{
  void *v5;
  HKQuantity *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB35D0];
  v6 = totalFlightsClimbed;
  objc_msgSend(v5, "expressionForKeyPath:", CFSTR("totalFlightsClimbed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, operatorType, 0);
  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType sumQuantity:(HKQuantity *)sumQuantity
{
  return (NSPredicate *)objc_msgSend(a1, "_predicateForWorkoutStatisticsWithOperatorType:quantityType:keyPathPrefix:quantity:", operatorType, quantityType, CFSTR("sumQuantity"), sumQuantity);
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType minimumQuantity:(HKQuantity *)minimumQuantity
{
  return (NSPredicate *)objc_msgSend(a1, "_predicateForWorkoutStatisticsWithOperatorType:quantityType:keyPathPrefix:quantity:", operatorType, quantityType, CFSTR("minimumQuantity"), minimumQuantity);
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType maximumQuantity:(HKQuantity *)maximumQuantity
{
  return (NSPredicate *)objc_msgSend(a1, "_predicateForWorkoutStatisticsWithOperatorType:quantityType:keyPathPrefix:quantity:", operatorType, quantityType, CFSTR("maximumQuantity"), maximumQuantity);
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType averageQuantity:(HKQuantity *)averageQuantity
{
  return (NSPredicate *)objc_msgSend(a1, "_predicateForWorkoutStatisticsWithOperatorType:quantityType:keyPathPrefix:quantity:", operatorType, quantityType, CFSTR("averageQuantity"), averageQuantity);
}

+ (id)_predicateForWorkoutStatisticsWithOperatorType:(unint64_t)a3 quantityType:(id)a4 keyPathPrefix:(id)a5 quantity:(id)a6
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = (void *)MEMORY[0x1E0CB35D0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a6;
  v13 = a5;
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(a4, "code"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "expressionForKeyPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v16, v17, 0, a3, 0);
  return v18;
}

+ (NSPredicate)predicateForWorkoutActivitiesWithWorkoutActivityType:(HKWorkoutActivityType)workoutActivityType
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activityType"), workoutActivityType);
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType duration:(NSTimeInterval)duration
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("activityDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", duration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressionForConstantValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v6, v9, 0, operatorType, 0);
  return (NSPredicate *)v10;
}

+ (NSPredicate)predicateForWorkoutActivitiesWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate options:(HKQueryOptions)options
{
  char v5;
  NSDate *v7;
  NSDate *v8;
  void *v9;
  NSString *const *v10;
  void *v11;
  NSString *const *v12;
  void *v13;
  void *v14;

  v5 = options;
  v7 = startDate;
  v8 = endDate;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((v5 & 1) != 0)
      v10 = &HKPredicateKeyPathWorkoutActivityStartDate;
    else
      v10 = &HKPredicateKeyPathWorkoutActivityEndDate;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), *v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  if (v8)
  {
    if ((v5 & 2) != 0)
      v12 = &HKPredicateKeyPathWorkoutActivityEndDate;
    else
      v12 = &HKPredicateKeyPathWorkoutActivityStartDate;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), *v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v14;
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType sumQuantity:(HKQuantity *)sumQuantity
{
  return (NSPredicate *)objc_msgSend(a1, "_predicateForWorkoutStatisticsWithOperatorType:quantityType:keyPathPrefix:quantity:", operatorType, quantityType, CFSTR("activitySumQuantity"), sumQuantity);
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType minimumQuantity:(HKQuantity *)minimumQuantity
{
  return (NSPredicate *)objc_msgSend(a1, "_predicateForWorkoutStatisticsWithOperatorType:quantityType:keyPathPrefix:quantity:", operatorType, quantityType, CFSTR("activityMinimumQuantity"), minimumQuantity);
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType maximumQuantity:(HKQuantity *)maximumQuantity
{
  return (NSPredicate *)objc_msgSend(a1, "_predicateForWorkoutStatisticsWithOperatorType:quantityType:keyPathPrefix:quantity:", operatorType, quantityType, CFSTR("activityMaximumQuantity"), maximumQuantity);
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType averageQuantity:(HKQuantity *)averageQuantity
{
  return (NSPredicate *)objc_msgSend(a1, "_predicateForWorkoutStatisticsWithOperatorType:quantityType:keyPathPrefix:quantity:", operatorType, quantityType, CFSTR("activityAverageQuantity"), averageQuantity);
}

+ (NSPredicate)predicateForWorkoutsWithActivityPredicate:(NSPredicate *)activityPredicate
{
  void *v3;
  NSPredicate *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB35D0];
  v4 = activityPredicate;
  objc_msgSend(v3, "expressionForKeyPath:", CFSTR("workoutActivity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, 99, 0);
  return (NSPredicate *)v7;
}

+ (NSPredicate)predicateForActivitySummaryWithDateComponents:(NSDateComponents *)dateComponents
{
  NSDateComponents *v3;
  BOOL v4;
  id v5;
  void *v6;
  id v8;

  v3 = dateComponents;
  v8 = 0;
  v4 = +[HKActivitySummary _validateActivitySummaryDateComponents:errorMessage:](HKActivitySummary, "_validateActivitySummaryDateComponents:errorMessage:", v3, &v8);
  v5 = v8;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@"), v5);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("dateComponents"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v6;
}

+ (NSPredicate)predicateForActivitySummariesBetweenStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents
{
  NSDateComponents *v5;
  NSDateComponents *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = startDateComponents;
  v15 = 0;
  v6 = endDateComponents;
  v7 = +[HKActivitySummary _validateActivitySummaryDateComponentsRange:endDateComponents:errorMessage:](HKActivitySummary, "_validateActivitySummaryDateComponentsRange:endDateComponents:errorMessage:", v5, v6, &v15);
  v8 = v15;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@"), v8);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("dateComponents"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("dateComponents"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v13;
}

+ (id)predicateForActivitySummariesWithActivityMoveMode:(int64_t)a3
{
  if (!_HKActivityMoveModeIsValid(a3))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid activity move mode %ld"), a3);
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %ld"), CFSTR("activityMoveMode"), a3);
}

+ (NSPredicate)predicateForElectrocardiogramsWithClassification:(HKElectrocardiogramClassification)classification
{
  if (!_HKECGCPublicClassificationIsValid(classification))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid ECG classification provided %ld"), classification);
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %ld"), CFSTR("ecg_public_classification"), classification);
}

+ (id)predicateForElectrocardiogramsWithPrivateClassification:(unint64_t)a3
{
  if (!_HKECGCPrivateClassificationIsValid(a3))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid private ECG classification provided %ld"), a3);
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %ld"), CFSTR("ecg_private_classification"), a3);
}

+ (NSPredicate)predicateForElectrocardiogramsWithSymptomsStatus:(HKElectrocardiogramSymptomsStatus)symptomsStatus
{
  if (!_HKECGSymptomsStatusIsValid(symptomsStatus))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid ECG symptoms status provided %ld"), symptomsStatus);
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %ld"), CFSTR("ecg_symptoms_status"), symptomsStatus);
}

+ (id)predicateForObjectsFromContributorWithUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contributor"), a3);
}

+ (id)predicateForUserDomainConceptsWithSemanticIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("semanticIdentifier"), a3);
}

+ (id)predicateForUserDomainConceptsWithTypeIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("udcTypeIdentifier"), a3);
}

+ (id)predicateForUserDomainConceptsWithTypeIdentifiers:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("udcTypeIdentifier"), a3);
}

+ (id)predicateForUserDomainConceptWithUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("udcUUID"), a3);
}

+ (id)predicateForUserDomainConceptsWithUUIDs:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("udcUUID"), a3);
}

+ (id)predicateForListUserDomainConceptWithListType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("listType"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForListUserDomainConceptsWithListTypes:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("listType"), a3);
}

+ (id)predicateForMedicalUserDomainConceptWithCategoryType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("categoryTypes"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForMedicalUserDomainConceptsWithCategoryTypes:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("categoryTypes"), a3);
}

+ (id)predicateForMedicalUserDomainConceptsMappingToSampleWithUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("medicalRecordUUID"), a3);
}

+ (id)predicateForMedicalUserDomainConceptsMappingToSampleWithUUIDs:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("medicalRecordUUID"), a3);
}

+ (id)predicateForMedicalUserDomainConceptsByResolvingConceptResolutionDefinition:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("unresolvedConceptResolutionDefinition"), a3);
}

+ (id)predicateForDiagnosticTestResultCategory:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("category"), a3);
}

+ (id)predicateForDiagnosticTestResultWithReferenceRangeStatus:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("referenceRangeStatus"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForRecordsWithSortDateFromStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16 = 0;
  +[HKMedicalRecord _sortDateIntervalFromStartDateComponents:endDateComponents:error:](HKMedicalRecord, "_sortDateIntervalFromStartDateComponents:endDateComponents:error:", a3, a4, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@"), v5);
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K  >= %@"), CFSTR("sortDate"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K  < %@"), CFSTR("sortDate"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v8;
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForCreationDateWithTodayViewRange:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(%K >= %@) AND (%K < %@)"), CFSTR("creationDate"), v5, CFSTR("creationDate"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForMedicalRecordWithOriginType:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("medicalRecordOriginType"), a3);
}

+ (id)predicateForMedicalRecordWithState:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("state"), a3);
}

+ (id)predicateForMedicalRecordsAssociatedWithMedicalUserDomainConcept:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("userDomainConcept"), a3);
}

+ (id)predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("signedClinicalDataOriginIdentifier"), a3);
}

+ (NSPredicate)predicateForVerifiableClinicalRecordsWithRelevantDateWithinDateInterval:(NSDateInterval *)dateInterval
{
  void *v3;
  NSDateInterval *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = dateInterval;
  -[NSDateInterval startDate](v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(%K >= %@) AND (%K <= %@)"), CFSTR("relevantDate"), v5, CFSTR("relevantDate"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v7;
}

+ (id)predicateForMedicationDoseEventWithStatus:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("status"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForMedicationDoseEventWithStatuses:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("status"), a3);
}

+ (id)predicateForMedicationDoseEventWithMedicationIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("medicationIdentifier"), a3);
}

+ (id)predicateForMedicationDoseEventWithMedicationIdentifiers:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("medicationIdentifier"), a3);
}

+ (id)predicateForMedicationDoseEventWithHashedMedicationIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("hashedMedicationIdentifier"), a3);
}

+ (id)predicateForMedicationDoseEventWithHashedMedicationIdentifiers:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("hashedMedicationIdentifier"), a3);
}

+ (id)predicateForMedicationDoseEventWithScheduleItemIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("scheduleItemIdentifier"), a3);
}

+ (id)predicateForMedicationDoseEventWithScheduleItemIdentifiers:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("scheduleItemIdentifier"), a3);
}

+ (id)predicateForStatesOfMindWithValence:(double)a3 operatorType:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("valence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressionForConstantValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v6, v9, 0, a4, 0);
  return v10;
}

+ (id)predicateForStatesOfMindWithKind:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("reflectiveInterval"), HKStateOfMindReflectiveIntervalFromKind(a3, a2));
}

+ (id)predicateForStatesOfMindWithLabel:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("labels"), a3);
}

+ (id)predicateForStatesOfMindWithAssociation:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("domains"), HKStateOfMindDomainFromAssociation(a3, a2));
}

+ (id)predicateForStatesOfMindWithLabels:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("labels"), a3);
}

+ (id)predicateForStatesOfMindWithAssociations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x1E0CB37E8];
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "integerValue");
        objc_msgSend(v10, "numberWithInteger:", HKStateOfMindDomainFromAssociation(v11, v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("domains"), v4, (_QWORD)v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForFitnessFriendActivitySnapshotsForFriendUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("friend_uuid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_initWithObjectType:(id)a3 predicate:(id)a4
{
  id v7;
  id v8;
  HKQuery *v9;
  HKQuery *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  _HKFilter *filter;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKQuery;
  v9 = -[HKQuery init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    HKCreateSerialDispatchQueue(v9, CFSTR("activation"));
    v11 = objc_claimAutoreleasedReturnValue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    atomic_store(0, (unsigned int *)&v10->_activationState);
    v10->_qualityOfService = -1;
    objc_storeStrong((id *)&v10->_objectType, a3);
    objc_storeStrong((id *)&v10->_predicate, a4);
    -[HKQuery _filterForPredicate:objectType:](v10, "_filterForPredicate:objectType:", v10->_predicate, v10->_objectType);
    v13 = objc_claimAutoreleasedReturnValue();
    filter = v10->_filter;
    v10->_filter = (_HKFilter *)v13;

  }
  return v10;
}

- (HKQuery)initWithQueryDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKQuery *v9;
  uint64_t v10;
  NSArray *queryDescriptors;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKQuery _initWithObjectType:predicate:](self, "_initWithObjectType:predicate:", v6, v8);

  if (v9)
  {
    v10 = objc_msgSend(v4, "copy");
    queryDescriptors = v9->_queryDescriptors;
    v9->_queryDescriptors = (NSArray *)v10;

  }
  return v9;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3A6728;
}

+ (id)serverInterfaceProtocol
{
  return &unk_1EE40ECE8;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_queryDidFinishActivation:(id)a3 success:(BOOL)a4 error:(id)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 1;
}

+ (BOOL)shouldApplyAdditionalPredicateForObjectType:(id)a3
{
  return 1;
}

- (void)queue_populateConfiguration:(id)a3
{
  _HKFilter *filter;
  id v5;

  filter = self->_filter;
  v5 = a3;
  objc_msgSend(v5, "setFilter:", filter);
  objc_msgSend(v5, "setObjectType:", self->_objectType);
  objc_msgSend(v5, "setDebugIdentifier:", self->_debugIdentifier);
  objc_msgSend(v5, "setQualityOfService:", self->_qualityOfService);
  objc_msgSend(v5, "setShouldDeactivateAfterInitialResults:", -[HKQuery queue_shouldDeactivateAfterInitialResults](self, "queue_shouldDeactivateAfterInitialResults"));
  objc_msgSend(v5, "setShouldSuppressDataCollection:", self->_shouldSuppressDataCollection);
  objc_msgSend(v5, "setActivationTime:", self->_activationTime);

}

- (void)_throwInvalidArgumentExceptionIfHasBeenExecuted:(SEL)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HKQuery__throwInvalidArgumentExceptionIfHasBeenExecuted___block_invoke;
  block[3] = &unk_1E37E6810;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v11 + 24))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = objc_opt_class();
    NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: %@ not callable after first execution"), v7, v8);

  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __59__HKQuery__throwInvalidArgumentExceptionIfHasBeenExecuted___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)queue_dispatchToClientForUUID:(id)a3 shouldDeactivate:(BOOL)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *clientQueue;
  _QWORD block[5];
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_clientQueue)
  {
    -[HKQuery activationUUID](self, "activationUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v8);

    if (v11)
    {
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__HKQuery_queue_dispatchToClientForUUID_shouldDeactivate_block___block_invoke;
      block[3] = &unk_1E37ED868;
      block[4] = self;
      v15 = a4;
      v14 = v9;
      dispatch_async(clientQueue, block);

    }
  }

}

uint64_t __64__HKQuery_queue_dispatchToClientForUUID_shouldDeactivate_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deactivating");
  if ((result & 1) == 0)
  {
    if (!*(_BYTE *)(a1 + 48))
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    result = objc_msgSend(*(id *)(a1 + 32), "deactivate");
    if ((_DWORD)result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

- (BOOL)hasQueryUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HKQuery activationUUID](self, "activationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (void)activateWithClientQueue:(id)a3 healthStore:(id)a4 delegate:(id)a5 time:(double)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  double v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD aBlock[4];
  id v51;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKQuery.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientQueue"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKQuery.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

      if (v16)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKQuery.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("healthStore"));

  if (!v15)
    goto LABEL_12;
LABEL_4:
  if (v16)
    goto LABEL_5;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKQuery.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_5:
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke;
  aBlock[3] = &unk_1E37E6AE8;
  v51 = v16;
  v19 = _Block_copy(aBlock);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__18;
  v44 = __Block_byref_object_dispose__18;
  v45 = 0;
  queue = self->_queue;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_76;
  block[3] = &unk_1E37ED890;
  block[4] = self;
  v37 = &v46;
  v21 = v15;
  v32 = v21;
  v22 = v13;
  v33 = v22;
  v23 = v17;
  v34 = v23;
  v24 = v14;
  v39 = a6;
  v35 = v24;
  v38 = &v40;
  v25 = v19;
  v36 = v25;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v47 + 24))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ has already been executed and cannot be executed again."), self);
  v26 = (void *)v41[5];
  if (v26)
    objc_msgSend(v26, "raise");

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

}

void __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_2;
  v8[3] = &unk_1E37E6798;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue(0x15u, v8);

}

uint64_t __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

_BYTE *__72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_76(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  _QWORD *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = *(_BYTE **)(a1 + 32);
  if (result[8] || (result = (_BYTE *)objc_msgSend(result, "activationState")) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
  else
  {
    v3 = a1 + 32;
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setActivationUUID:", *(_QWORD *)(a1 + 56));
    *(_QWORD *)(*(_QWORD *)v3 + 136) = objc_msgSend(*(id *)(a1 + 64), "applicationSDKVersionToken");
    *(_QWORD *)(*(_QWORD *)v3 + 40) = *(_QWORD *)(a1 + 96);
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count");
    _HKInitializeLogging();
    v5 = HKLogQuery;
    v6 = os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT);
    if (v4 < 2)
    {
      if (v6)
      {
        v9 = *(void **)(a1 + 32);
        v10 = v5;
        objc_msgSend(v9, "objectType");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (const __CFString *)v11;
        else
          v13 = CFSTR("()");
        objc_msgSend(*(id *)(a1 + 32), "predicate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v9;
        v17 = 2114;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "Executing query %{public}@ for type %{public}@ with predicate %@", (uint8_t *)&v15, 0x20u);

      }
    }
    else if (v6)
    {
      v7 = *(_QWORD **)(a1 + 32);
      v8 = (const __CFString *)v7[13];
      v15 = 138543618;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "Executing multi-type query %{public}@ with descriptors %@", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "queue_validate");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_queue_activateWithHealthStore:activationUUID:isReactivating:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 72));
  }
  return result;
}

- (void)reactivateWithHealthStore:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__HKQuery_reactivateWithHealthStore___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __37__HKQuery_reactivateWithHealthStore___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "activationState") == 3)
    {
      _HKInitializeLogging();
      v3 = HKLogQuery;
      if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v14 = v4;
        v5 = "%{public}@: Query deactivated before reactivation was requested; ignoring reactivation request.";
LABEL_10:
        _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
      }
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 32), "activationState") != 1)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 24);
        *(_QWORD *)(v8 + 24) = 0;

        v10 = *(void **)(a1 + 32);
        v11 = *(_QWORD *)(a1 + 40);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __37__HKQuery_reactivateWithHealthStore___block_invoke_81;
        v12[3] = &unk_1E37E6BD8;
        v12[4] = v10;
        objc_msgSend(v10, "_queue_activateWithHealthStore:activationUUID:isReactivating:completion:", v11, v2, 1, v12);
        goto LABEL_12;
      }
      _HKInitializeLogging();
      v3 = HKLogQuery;
      if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v14 = v7;
        v5 = "%{public}@: Query is activation in progress; ignoring reactivation request.";
        goto LABEL_10;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v3 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      v5 = "%{public}@: Query reactivated with nil UUID; ignoring reactivation request.";
      goto LABEL_10;
    }
  }
LABEL_12:

}

void __37__HKQuery_reactivateWithHealthStore___block_invoke_81(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 120);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__HKQuery_reactivateWithHealthStore___block_invoke_2;
    v9[3] = &unk_1E37E6980;
    v9[4] = v7;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

uint64_t __37__HKQuery_reactivateWithHealthStore___block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
    __37__HKQuery_reactivateWithHealthStore___block_invoke_2_cold_1();
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deactivateWithError:", *(_QWORD *)(a1 + 40));
}

- (int64_t)activationState
{
  return (int)atomic_load((unsigned int *)&self->_activationState);
}

- (BOOL)deactivating
{
  return -[HKQuery activationState](self, "activationState") == 3;
}

- (BOOL)deactivate
{
  int *p_deactivateCallCount;
  unsigned int v4;
  BOOL v5;
  NSObject *queue;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  p_deactivateCallCount = &self->_deactivateCallCount;
  do
    v4 = __ldaxr((unsigned int *)p_deactivateCallCount);
  while (__stlxr(v4 + 1, (unsigned int *)p_deactivateCallCount));
  if (-[HKQuery deactivating](self, "deactivating"))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __21__HKQuery_deactivate__block_invoke;
  v8[3] = &unk_1E37E6810;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  v5 = *((_BYTE *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __21__HKQuery_deactivate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_deactivateWithError:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)queue_deactivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HKQuery _queue_deactivateWithError:](self, "_queue_deactivateWithError:", 0);
}

- (void)_queue_activateWithHealthStore:(id)a3 activationUUID:(id)a4 isReactivating:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  HKQueryServerProxyProvider **p_proxyProvider;
  id v19;
  HKQueryServerProxyProvider *v20;
  HKQueryServerProxyProvider *proxyProvider;
  HKQueryServerProxyProvider *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  _QWORD aBlock[5];
  id v32;
  id v33;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  atomic_store(1u, (unsigned int *)&self->_activationState);
  objc_storeStrong((id *)&self->_strongHealthStore, a3);
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke;
  aBlock[3] = &unk_1E37ED8E0;
  aBlock[4] = self;
  v15 = v12;
  v32 = v15;
  v16 = v13;
  v33 = v16;
  v17 = _Block_copy(aBlock);
  p_proxyProvider = &self->_proxyProvider;
  if (!self->_proxyProvider)
  {
    v19 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "configurationClass"));
    -[HKQuery queue_populateConfiguration:](self, "queue_populateConfiguration:", v19);
    v20 = -[HKQueryServerProxyProvider initWithHealthStore:query:configuration:queryUUID:]([HKQueryServerProxyProvider alloc], "initWithHealthStore:query:configuration:queryUUID:", v11, self, v19, v15);
    proxyProvider = self->_proxyProvider;
    self->_proxyProvider = v20;

    -[HKQueryServerProxyProvider setShouldForceReactivation:](self->_proxyProvider, "setShouldForceReactivation:", v7);
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEBUG))
    -[HKQuery _queue_activateWithHealthStore:activationUUID:isReactivating:completion:].cold.1();
  objc_initWeak(&location, *p_proxyProvider);
  v22 = *p_proxyProvider;
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_84;
  v27[3] = &unk_1E37ED930;
  v28 = v17;
  objc_copyWeak(&v29, &location);
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_3;
  v24[3] = &unk_1E37ED958;
  v23 = v28;
  v25 = v23;
  objc_copyWeak(&v26, &location);
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v22, "fetchProxyWithHandler:errorHandler:", v27, v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2;
  v16[3] = &unk_1E37ED8B8;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(v10 + 120);
  v16[1] = 3221225472;
  v16[4] = v10;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = *(id *)(a1 + 48);
  v13 = v9;
  v14 = v8;
  v15 = v7;
  dispatch_async(v12, v16);

}

uint64_t __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEBUG))
    __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2_cold_1();
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishActivationWithServerProxy:activationUUID:error:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2_85;
  v5[3] = &unk_1E37ED908;
  v7 = *(id *)(a1 + 32);
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v4 = v3;
  v6 = v4;
  objc_msgSend(v4, "remote_startQueryWithCompletion:", v5);

  objc_destroyWeak(&v8);
}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2_85(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id *v4;
  id v5;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (id *)(a1 + 48);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  (*(void (**)(uint64_t))(v3 + 16))(v3);

}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, _QWORD, id))(v2 + 16))(v2, WeakRetained, 0, v4);

}

- (void)_queue_finishActivationWithServerProxy:(id)a3 activationUUID:(id)a4 error:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, _QWORD);
  int64_t v15;
  void *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, uint64_t, _QWORD))a6;
  v15 = -[HKQuery activationState](self, "activationState");
  if (v15 == 1)
  {
    if (v11)
    {
      objc_storeStrong((id *)&self->_serverProxy, a3);
      atomic_store(2u, (unsigned int *)&self->_activationState);
      v14[2](v14, 1, 0);
    }
    else
    {
      -[HKQuery _queue_deactivateWithError:](self, "_queue_deactivateWithError:", v13);
      ((void (**)(id, uint64_t, id))v14)[2](v14, 0, v13);
    }
    -[HKQuery queue_queryDidFinishActivation:success:error:](self, "queue_queryDidFinishActivation:success:error:", v12, v11 != 0, v13);
  }
  else if (v15 != 3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      -[HKQuery _queue_finishActivationWithServerProxy:activationUUID:error:completion:].cold.1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Invalid query activation state upon completing connection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuery _queue_deactivateWithError:](self, "_queue_deactivateWithError:", v16);
    ((void (**)(id, uint64_t, void *))v14)[2](v14, 0, v16);

  }
}

- (BOOL)_queue_deactivateWithError:(id)a3
{
  __CFString *v4;
  int *p_activationState;
  unsigned int v6;
  NSObject *v7;
  const char *v8;
  const __CFString *v9;
  id WeakRetained;
  OS_dispatch_queue *clientQueue;
  void *v12;
  HKQueryServerInterface *serverProxy;
  HKQueryServerProxyProvider *proxyProvider;
  int v16;
  HKQuery *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_activationState = &self->_activationState;
  do
    v6 = __ldaxr((unsigned int *)p_activationState);
  while (__stlxr(3u, (unsigned int *)p_activationState));
  if (v6 != 3)
  {
    _HKInitializeLogging();
    v7 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
    {
      v8 = " with error: ";
      if (!v4)
        v8 = "";
      v16 = 138543874;
      v17 = self;
      v9 = &stru_1E37FD4C0;
      if (v4)
        v9 = v4;
      v18 = 2080;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "Stopping query %{public}@%s%{public}@", (uint8_t *)&v16, 0x20u);
    }
    if (v4)
      -[HKQuery queue_deliverError:](self, "queue_deliverError:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0);
    objc_msgSend(WeakRetained, "queryDidFinishExecuting:", self);
    clientQueue = self->_clientQueue;
    self->_clientQueue = 0;

    -[HKQuery activationUUID](self, "activationUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuery setActivationUUID:](self, "setActivationUUID:", 0);
    -[HKQueryServerInterface remote_deactivateServer](self->_serverProxy, "remote_deactivateServer");
    serverProxy = self->_serverProxy;
    self->_serverProxy = 0;

    -[HKQuery queue_queryDidDeactivate:](self, "queue_queryDidDeactivate:", v12);
    proxyProvider = self->_proxyProvider;
    self->_proxyProvider = 0;

  }
  return v6 != 3;
}

- (int64_t)deactivateCallCount
{
  return (int)atomic_load((unsigned int *)&self->_deactivateCallCount);
}

- (void)client_deliverError:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HKQuery *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HKQuery_client_deliverError_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __40__HKQuery_client_deliverError_forQuery___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _HKInitializeLogging();
  v3 = HKLogQuery;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v9 = 138543874;
      v10 = v4;
      v11 = 2114;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Received error for query %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
  {
    __40__HKQuery_client_deliverError_forQuery___block_invoke_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 40), "activationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 48));

  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "_queue_deactivateWithError:", *(_QWORD *)(a1 + 32));
}

+ (NSString)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HKSampleType)sampleType
{
  HKObjectType *v3;

  if (-[NSArray count](self->_queryDescriptors, "count") >= 2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      -[HKQuery sampleType].cold.1();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    v3 = 0;
    return (HKSampleType *)v3;
  }
  v3 = self->_objectType;
  return (HKSampleType *)v3;
}

- (HKObjectType)objectType
{
  HKObjectType *v3;

  if (-[NSArray count](self->_queryDescriptors, "count") < 2)
  {
    v3 = self->_objectType;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      -[HKQuery objectType].cold.1();
    v3 = 0;
  }
  return v3;
}

- (NSPredicate)predicate
{
  NSPredicate *v3;

  if (-[NSArray count](self->_queryDescriptors, "count") < 2)
  {
    v3 = self->_predicate;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      -[HKQuery predicate].cold.1();
    v3 = 0;
  }
  return v3;
}

- (HKQueryDelegate)delegate
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

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  -[HKQuery queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __19__HKQuery_delegate__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HKQueryDelegate *)v4;
}

void __19__HKQuery_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setPredicate:(id)a3
{
  NSPredicate *v5;
  NSPredicate *predicate;
  _HKFilter *v7;
  _HKFilter *filter;
  NSPredicate *v9;

  v5 = (NSPredicate *)a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  predicate = self->_predicate;
  self->_predicate = v5;
  v9 = v5;

  -[HKQuery _filterForPredicate:objectType:](self, "_filterForPredicate:objectType:", self->_predicate, self->_objectType);
  v7 = (_HKFilter *)objc_claimAutoreleasedReturnValue();
  filter = self->_filter;
  self->_filter = v7;

}

- (void)setObjectType:(id)a3
{
  HKObjectType *v5;
  HKObjectType *objectType;
  _HKFilter *v7;
  _HKFilter *filter;
  HKObjectType *v9;

  v5 = (HKObjectType *)a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  objectType = self->_objectType;
  self->_objectType = v5;
  v9 = v5;

  -[HKQuery _filterForPredicate:objectType:](self, "_filterForPredicate:objectType:", self->_predicate, self->_objectType);
  v7 = (_HKFilter *)objc_claimAutoreleasedReturnValue();
  filter = self->_filter;
  self->_filter = v7;

}

- (void)setQualityOfService:(int64_t)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  self->_qualityOfService = a3;
}

- (NSString)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;

  if (-[HKQuery activationState](self, "activationState"))
  {
    v3 = -[HKQuery activationState](self, "activationState") - 1;
    if (v3 > 2)
      v4 = CFSTR("inactive");
    else
      v4 = *(&off_1E37ED998 + v3);
  }
  else
  {
    v4 = 0;
  }
  -[HKQuery activationUUID](self, "activationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKCopyQueryDescription(self, v5, 0, self->_debugIdentifier, self->_qualityOfService, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)clientInterface
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "clientInterfaceProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__HKQuery_clientInterface__block_invoke;
  v6[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v6[4] = a1;
  objc_msgSend(a1, "_cachedInterfaceForProtocol:configurationHandler:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __26__HKQuery_clientInterface__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureClientInterface:", a2);
}

+ (id)serverInterface
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "serverInterfaceProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__HKQuery_serverInterface__block_invoke;
  v6[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v6[4] = a1;
  objc_msgSend(a1, "_cachedInterfaceForProtocol:configurationHandler:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __26__HKQuery_serverInterface__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureServerInterface:", a2);
}

+ (id)_cachedInterfaceForProtocol:(id)a3 configurationHandler:(id)a4
{
  Protocol *v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = (Protocol *)a3;
  v6 = (void (**)(id, void *))a4;
  NSStringFromProtocol(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_cachedInterfaceForProtocol_configurationHandler__lock);
  v8 = (void *)_cachedInterfaceForProtocol_configurationHandler__interfacesCache;
  if (!_cachedInterfaceForProtocol_configurationHandler__interfacesCache)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)_cachedInterfaceForProtocol_configurationHandler__interfacesCache;
    _cachedInterfaceForProtocol_configurationHandler__interfacesCache = (uint64_t)v9;

    v8 = (void *)_cachedInterfaceForProtocol_configurationHandler__interfacesCache;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_cachedInterfaceForProtocol_configurationHandler__lock);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);
    os_unfair_lock_lock((os_unfair_lock_t)&_cachedInterfaceForProtocol_configurationHandler__lock);
    objc_msgSend((id)_cachedInterfaceForProtocol_configurationHandler__interfacesCache, "objectForKeyedSubscript:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v12;
    v11 = v15;

    objc_msgSend((id)_cachedInterfaceForProtocol_configurationHandler__interfacesCache, "setObject:forKeyedSubscript:", v11, v7);
    os_unfair_lock_unlock((os_unfair_lock_t)&_cachedInterfaceForProtocol_configurationHandler__lock);
  }

  return v11;
}

- (id)_filterForPredicate:(id)a3 objectType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (objc_msgSend((id)objc_opt_class(), "shouldApplyAdditionalPredicateForObjectType:", v7))
  {
    objc_msgSend(v7, "_predicateForSDKVersionToken:", HKApplicationSDKVersionToken());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v9 = v8;
    if (v10)
    {
      if (v8)
      {
        v12 = (void *)MEMORY[0x1E0CB3528];
        v17[0] = self->_predicate;
        v17[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = v10;
      }
    }

  }
  if (v7)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_filterRepresentationForDataTypes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (void)connectionInvalidated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_19A0E6000, v0, v1, "%{public}@: Connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connectionInterrupted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_19A0E6000, v0, v1, "%{public}@: Connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (NSUUID)activationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setActivationUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (_HKFilter)_filter
{
  return self->_filter;
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (BOOL)shouldSuppressDataCollection
{
  return self->_shouldSuppressDataCollection;
}

- (void)setShouldSuppressDataCollection:(BOOL)a3
{
  self->_shouldSuppressDataCollection = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (unint64_t)applicationSDKVersionToken
{
  return self->_applicationSDKVersionToken;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_activationUUID, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_strongHealthStore, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)predicateForActivityCachesBetweenStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0;
  v6 = a4;
  v7 = +[HKActivitySummary _validateActivitySummaryDateComponentsRange:endDateComponents:errorMessage:](HKActivitySummary, "_validateActivitySummaryDateComponentsRange:endDateComponents:errorMessage:", v5, v6, &v15);
  v8 = v15;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@"), v8);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("dateComponents"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("dateComponents"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)predicateForFitnessFriendAchievementsForFriendUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("friend_uuid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForFitnessFriendWorkoutsForFriendUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("friend_uuid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)queue_deliverError:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

void __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_76_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = objc_begin_catch(a1);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 88) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_end_catch();
}

void __37__HKQuery_reactivateWithHealthStore___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_5_0(&dword_19A0E6000, v0, v1, "%{public}@: Error reactivating query: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_queue_activateWithHealthStore:activationUUID:isReactivating:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_19A0E6000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: Initiating connection to query server via %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2_cold_1()
{
  int v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[22];
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  v5 = 1024;
  v6 = v0;
  v7 = v1;
  v8 = v2;
  _os_log_debug_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Connection to query server via %{public}@ complete with success=%{BOOL}d, error=%{public}@", v4, 0x26u);
}

- (void)_queue_finishActivationWithServerProxy:activationUUID:error:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Invalid query activation state upon completing connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__HKQuery_client_deliverError_forQuery___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_5_0(&dword_19A0E6000, v0, v1, "%{public}@: Received nil error for query %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sampleType
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Attempt to access 'sampleType' property on a multi-type query.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)objectType
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Attempt to access 'objectType' property on a multi-type query.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)predicate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Attempt to access 'predicate' property on a multi-type query.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
