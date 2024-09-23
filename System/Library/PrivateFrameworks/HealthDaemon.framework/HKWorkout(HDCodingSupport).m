@implementation HKWorkout(HDCodingSupport)

- (HDCodableWorkout)codableRepresentationForSync
{
  HDCodableWorkout *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(HDCodableWorkout);
  v23.receiver = a1;
  v23.super_class = (Class)&off_1EF2252E8;
  objc_msgSendSuper2(&v23, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkout setSample:](v2, "setSample:", v3);

  -[HDCodableWorkout setType:](v2, "setType:", objc_msgSend(a1, "workoutActivityType"));
  if (a1)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(a1, "workoutEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v10, "codableRepresentationForSync");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v7, "addObject:", v11);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  -[HDCodableWorkout setEvents:](v2, "setEvents:", v7);

  objc_msgSend(a1, "duration");
  -[HDCodableWorkout setDuration:](v2, "setDuration:");
  objc_msgSend(a1, "totalEnergyBurned");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "_totalEnergyBurnedInCanonicalUnit");
    -[HDCodableWorkout setTotalEnergyBurnedInCanonicalUnit:](v2, "setTotalEnergyBurnedInCanonicalUnit:");
  }
  objc_msgSend(a1, "_totalBasalEnergyBurned");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(a1, "_totalBasalEnergyBurnedInCanonicalUnit");
    -[HDCodableWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v2, "setTotalBasalEnergyBurnedInCanonicalUnit:");
  }
  objc_msgSend(a1, "totalDistance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(a1, "_totalDistanceInCanonicalUnit");
    -[HDCodableWorkout setTotalDistanceInCanonicalUnit:](v2, "setTotalDistanceInCanonicalUnit:");
  }
  objc_msgSend(a1, "totalSwimmingStrokeCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1, "_totalSwimmingStrokeCountInCanonicalUnit");
    -[HDCodableWorkout setTotalSwimmingStrokeCountInCanonicalUnit:](v2, "setTotalSwimmingStrokeCountInCanonicalUnit:");
  }
  objc_msgSend(a1, "totalFlightsClimbed");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(a1, "_totalFlightsClimbedInCanonicalUnit");
    -[HDCodableWorkout setTotalFlightsClimbedInCanonicalUnit:](v2, "setTotalFlightsClimbedInCanonicalUnit:");
  }
  objc_msgSend(a1, "_goal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HDCodableWorkout setGoalType:](v2, "setGoalType:", objc_msgSend(a1, "_goalType"));
    objc_msgSend(a1, "_goalInCanonicalUnit");
    -[HDCodableWorkout setGoal:](v2, "setGoal:");
  }
  objc_msgSend(a1, "_primaryActivity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableWorkoutActivity codableForWorkoutActivity:](HDCodableWorkoutActivity, "codableForWorkoutActivity:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkout setPrimaryActivity:](v2, "setPrimaryActivity:", v19);

  objc_msgSend(a1, "_subActivities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableWorkoutActivity codablesForWorkoutActivities:](HDCodableWorkoutActivity, "codablesForWorkoutActivities:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkout setSubActivities:](v2, "setSubActivities:", v21);

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addWorkouts:", v5);

  return v5 != 0;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6))
    {
      v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = 0;
      else
        v10 = v6;
      v11 = v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
