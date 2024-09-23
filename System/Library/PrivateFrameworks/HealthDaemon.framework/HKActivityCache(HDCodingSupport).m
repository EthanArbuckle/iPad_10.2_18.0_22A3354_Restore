@implementation HKActivityCache(HDCodingSupport)

- (uint64_t)addCodableRepresentationToCollectionForJournal:()HDCodingSupport
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (a1
    && (objc_msgSend(a1, "codableRepresentationForSync"), (a1 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "addActivityCaches:", a1);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HDCodableActivityCache)codableRepresentationForSync
{
  HDCodableActivityCache *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(HDCodableActivityCache);
  v37.receiver = a1;
  v37.super_class = (Class)&off_1EF224A58;
  objc_msgSendSuper2(&v37, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableActivityCache setSample:](v2, "setSample:", v3);
  -[HDCodableActivityCache setCacheIndex:](v2, "setCacheIndex:", objc_msgSend(a1, "cacheIndex"));
  -[HDCodableActivityCache setSequence:](v2, "setSequence:", objc_msgSend(a1, "sequence"));
  if (objc_msgSend(a1, "hasEnergyBurned"))
  {
    objc_msgSend(a1, "_energyBurnedInKilocalories");
    -[HDCodableActivityCache setEnergyBurned:](v2, "setEnergyBurned:");
  }
  if (objc_msgSend(a1, "hasMoveMinutes"))
  {
    objc_msgSend(a1, "moveMinutes");
    -[HDCodableActivityCache setMoveMinutes:](v2, "setMoveMinutes:");
  }
  if (objc_msgSend(a1, "hasBriskMinutes"))
  {
    objc_msgSend(a1, "briskMinutes");
    -[HDCodableActivityCache setBriskMinutes:](v2, "setBriskMinutes:");
  }
  if (objc_msgSend(a1, "hasActiveHours"))
  {
    objc_msgSend(a1, "activeHours");
    -[HDCodableActivityCache setActiveHours:](v2, "setActiveHours:");
  }
  if (objc_msgSend(a1, "hasStepCount"))
    -[HDCodableActivityCache setStepCount:](v2, "setStepCount:", objc_msgSend(a1, "stepCount"));
  if (objc_msgSend(a1, "hasEnergyBurnedGoal"))
  {
    objc_msgSend(a1, "_energyBurnedGoalInKilocalories");
    -[HDCodableActivityCache setEnergyBurnedGoal:](v2, "setEnergyBurnedGoal:");
    objc_msgSend(a1, "energyBurnedGoalDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    -[HDCodableActivityCache setEnergyBurnedGoalDate:](v2, "setEnergyBurnedGoalDate:");

  }
  if (objc_msgSend(a1, "hasMoveMinutesGoal"))
  {
    objc_msgSend(a1, "_moveMinutesGoalInMinutes");
    -[HDCodableActivityCache setMoveMinutesGoal:](v2, "setMoveMinutesGoal:");
    objc_msgSend(a1, "moveMinutesGoalDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    -[HDCodableActivityCache setMoveMinutesGoalDate:](v2, "setMoveMinutesGoalDate:");

  }
  if (objc_msgSend(a1, "hasBriskMinutesGoal"))
  {
    objc_msgSend(a1, "_briskMinutesGoalInMinutes");
    -[HDCodableActivityCache setBriskMinutesGoal:](v2, "setBriskMinutesGoal:");
  }
  if (objc_msgSend(a1, "hasActiveHoursGoal"))
  {
    objc_msgSend(a1, "_activeHoursGoalCount");
    -[HDCodableActivityCache setActiveHoursGoal:](v2, "setActiveHoursGoal:");
  }
  if (objc_msgSend(a1, "hasWalkingAndRunningDistance"))
  {
    objc_msgSend(a1, "_walkingAndRunningDistanceInMeters");
    -[HDCodableActivityCache setWalkingAndRunningDistance:](v2, "setWalkingAndRunningDistance:");
  }
  if (objc_msgSend(a1, "hasFlightsClimbed"))
    -[HDCodableActivityCache setFlightsClimbed:](v2, "setFlightsClimbed:", objc_msgSend(a1, "flightsClimbed"));
  if (objc_msgSend(a1, "hasDeepBreathingDuration"))
  {
    objc_msgSend(a1, "deepBreathingDuration");
    -[HDCodableActivityCache setDeepBreathingDuration:](v2, "setDeepBreathingDuration:");
  }
  if (objc_msgSend(a1, "hasPushCount"))
    -[HDCodableActivityCache setPushCount:](v2, "setPushCount:", objc_msgSend(a1, "pushCount"));
  if (objc_msgSend(a1, "hasWheelchairUse"))
    -[HDCodableActivityCache setWheelchairUse:](v2, "setWheelchairUse:", objc_msgSend(a1, "wheelchairUse"));
  -[HDCodableActivityCache setActivityMoveMode:](v2, "setActivityMoveMode:", objc_msgSend(a1, "activityMoveMode"));
  -[HDCodableActivityCache setPaused:](v2, "setPaused:", objc_msgSend(a1, "isPaused"));
  -[HDCodableActivityCache setVersion:](v2, "setVersion:", objc_msgSend(a1, "version"));
  if (objc_msgSend(a1, "hasDailyEnergyBurnedStatistics"))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(a1, "dailyEnergyBurnedStatistics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v10), "codableRepresentationForSync");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableActivityCache addDailyEnergyBurnedStatistics:](v2, "addDailyEnergyBurnedStatistics:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v8);
    }

  }
  if (objc_msgSend(a1, "hasDailyMoveMinutesStatistics"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(a1, "dailyMoveMinutesStatistics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "codableRepresentationForSync");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableActivityCache addDailyMoveMinutesStatistics:](v2, "addDailyMoveMinutesStatistics:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v14);
    }

  }
  if (objc_msgSend(a1, "hasDailyBriskMinutesStatistics"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(a1, "dailyBriskMinutesStatistics", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "codableRepresentationForSync");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableActivityCache addDailyBriskMinutesStatistics:](v2, "addDailyBriskMinutesStatistics:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
      }
      while (v20);
    }

  }
  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6)
      && (v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions(),
          objc_msgSend(v6, "_validateWithConfiguration:", v7, v8),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v9))
    {
      v10 = v6;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)addCodableRepresentationToCollectionForSync:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addActivityCaches:", v5);

  return v5 != 0;
}

@end
