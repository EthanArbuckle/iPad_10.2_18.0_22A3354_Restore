@implementation _HKFitnessFriendActivitySnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKFitnessFriendActivitySnapshot;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_friendUUID, CFSTR("FriendUUID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceUUID, CFSTR("SourceUUID"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_snapshotIndex, CFSTR("SnapshotIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_snapshotUploadedDate, CFSTR("SnapshotUploadedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_timeZoneOffsetFromUTCForNoon, CFSTR("TimeZoneOffsetForNoonFromUTC"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ActiveHours"), self->_activeHours);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ActiveHoursGoal"), self->_activeHoursGoal);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BriskMinutes"), self->_briskMinutes);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BriskMinutesGoal"), self->_briskMinutesGoal);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("EnergyBurned"), self->_energyBurned);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("EnergyBurnedGoal"), self->_energyBurnedGoal);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("MoveMinutes"), self->_mmv);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("MoveMinutesGoal"), self->_mmg);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_amm, CFSTR("ActivityMoveMode"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("StepCount"), self->_stepCount);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("PushCount"), self->_pushCount);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_wheelchairUse, CFSTR("WheelchairUse"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WalkingAndRunningDistance"), self->_walkingAndRunningDistance);

}

+ (id)snapshotWithActivitySummary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;

  v3 = a3;
  v4 = objc_msgSend(v3, "_activitySummaryIndex");
  objc_msgSend(v3, "_startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKFitnessFriendActivitySnapshot _fitnessFriendActivitySnapshotWithSnapshotIndex:startDate:endDate:sourceUUID:](_HKFitnessFriendActivitySnapshot, "_fitnessFriendActivitySnapshotWithSnapshotIndex:startDate:endDate:sourceUUID:", v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAmm:", objc_msgSend(v3, "activityMoveMode"));
  objc_msgSend(v3, "appleMoveTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v9);
  objc_msgSend(v7, "setMmv:");

  objc_msgSend(v3, "appleMoveTimeGoal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValueForUnit:", v11);
  objc_msgSend(v7, "setMmg:");

  objc_msgSend(v3, "activeEnergyBurned");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v13);
  objc_msgSend(v7, "setEnergyBurned:");

  objc_msgSend(v3, "activeEnergyBurnedGoal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValueForUnit:", v15);
  objc_msgSend(v7, "setEnergyBurnedGoal:");

  objc_msgSend(v3, "appleExerciseTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValueForUnit:", v17);
  objc_msgSend(v7, "setBriskMinutes:");

  objc_msgSend(v3, "exerciseTimeGoal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValueForUnit:", v19);
  objc_msgSend(v7, "setBriskMinutesGoal:");

  objc_msgSend(v3, "appleStandHours");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit countUnit](HKUnit, "countUnit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValueForUnit:", v21);
  objc_msgSend(v7, "setActiveHours:");

  objc_msgSend(v3, "standHoursGoal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit countUnit](HKUnit, "countUnit");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValueForUnit:", v23);
  objc_msgSend(v7, "setActiveHoursGoal:");

  objc_msgSend(v3, "stepCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit countUnit](HKUnit, "countUnit");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValueForUnit:", v25);
  objc_msgSend(v7, "setStepCount:", (double)(uint64_t)v26);

  objc_msgSend(v3, "distanceWalkingRunning");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValueForUnit:", v28);
  objc_msgSend(v7, "setWalkingAndRunningDistance:");

  objc_msgSend(v3, "_pushCount");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit countUnit](HKUnit, "countUnit");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValueForUnit:", v30);
  objc_msgSend(v7, "setPushCount:", (double)(uint64_t)v31);

  v32 = objc_msgSend(v3, "_wheelchairUse");
  objc_msgSend(v7, "setWheelchairUse:", v32);
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "components:fromDate:", 30, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "setHour:", 12);
  objc_msgSend(v33, "dateFromComponents:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeZone");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "secondsFromGMTForDate:", v36);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZoneOffsetFromUTCForNoon:", v39);

  return v7;
}

+ (id)_fitnessFriendActivitySnapshotWithSnapshotIndex:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 sourceUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  +[HKObjectType fitnessFriendActivitySnapshotType](HKObjectType, "fitnessFriendActivitySnapshotType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v15 = v14;

  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v17 = v16;

  v22[1] = 3221225472;
  v22[2] = __113___HKFitnessFriendActivitySnapshot__fitnessFriendActivitySnapshotWithSnapshotIndex_startDate_endDate_sourceUUID___block_invoke;
  v22[3] = &unk_1E37EC8D8;
  v23 = v10;
  v24 = a3;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS____HKFitnessFriendActivitySnapshot;
  v22[0] = MEMORY[0x1E0C809B0];
  v18 = v10;
  v19 = objc_msgSendSuper2(&v21, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v13, 0, 0, v22, v15, v17);

  return v19;
}

- (void)setEnergyBurned:(double)a3
{
  self->_energyBurned = a3;
}

- (void)setEnergyBurnedGoal:(double)a3
{
  self->_energyBurnedGoal = a3;
}

- (void)setBriskMinutes:(double)a3
{
  self->_briskMinutes = a3;
}

- (void)setBriskMinutesGoal:(double)a3
{
  self->_briskMinutesGoal = a3;
}

- (void)setActiveHours:(double)a3
{
  self->_activeHours = a3;
}

- (void)setActiveHoursGoal:(double)a3
{
  self->_activeHoursGoal = a3;
}

- (void)setStepCount:(double)a3
{
  self->_stepCount = a3;
}

- (void)setWalkingAndRunningDistance:(double)a3
{
  self->_walkingAndRunningDistance = a3;
}

- (void)setPushCount:(double)a3
{
  self->_pushCount = a3;
}

- (void)setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
}

- (void)setTimeZoneOffsetFromUTCForNoon:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneOffsetFromUTCForNoon, a3);
}

- (void)setSourceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUUID, a3);
}

- (int64_t)snapshotIndex
{
  return self->_snapshotIndex;
}

- (NSUUID)sourceUUID
{
  return self->_sourceUUID;
}

- (NSNumber)timeZoneOffsetFromUTCForNoon
{
  return self->_timeZoneOffsetFromUTCForNoon;
}

- (double)energyBurned
{
  return self->_energyBurned;
}

- (double)energyBurnedGoal
{
  return self->_energyBurnedGoal;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (double)briskMinutesGoal
{
  return self->_briskMinutesGoal;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (double)activeHoursGoal
{
  return self->_activeHoursGoal;
}

- (double)walkingAndRunningDistance
{
  return self->_walkingAndRunningDistance;
}

- (double)stepCount
{
  return self->_stepCount;
}

- (double)pushCount
{
  return self->_pushCount;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneOffsetFromUTCForNoon, 0);
  objc_storeStrong((id *)&self->_snapshotUploadedDate, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (void)setSnapshotUploadedDate:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotUploadedDate, a3);
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

- (NSTimeZone)timeZone
{
  void *v3;
  NSNumber *timeZoneOffsetFromUTCForNoon;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeZoneOffsetFromUTCForNoon = self->_timeZoneOffsetFromUTCForNoon;
  if (timeZoneOffsetFromUTCForNoon)
  {
    v5 = -[NSNumber integerValue](timeZoneOffsetFromUTCForNoon, "integerValue");
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return (NSTimeZone *)v3;
}

- (NSDate)snapshotUploadedDate
{
  return self->_snapshotUploadedDate;
}

- (void)setSnapshotIndex:(int64_t)a3
{
  self->_snapshotIndex = a3;
}

+ (id)_mostSignificantSnapshotAmongSnapshots:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v10, "_mostSignificantSnapshot:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_fitnessFriendActivitySnapshotWithFriendUUID:(id)a3 sourceUUID:(id)a4 startDate:(id)a5 endDate:(id)a6 snapshotIndex:(int64_t)a7 snapshotUploadedDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  int64_t v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  if (v15)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKFitnessFriendActivitySnapshot.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("friendUUID != nil"));

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKFitnessFriendActivitySnapshot.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate != nil"));

      if (v19)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKFitnessFriendActivitySnapshot.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotUploadedDate != nil"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKFitnessFriendActivitySnapshot.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate != nil"));

  if (!v18)
    goto LABEL_8;
LABEL_4:
  if (!v19)
    goto LABEL_9;
LABEL_5:
  +[HKObjectType fitnessFriendActivitySnapshotType](HKObjectType, "fitnessFriendActivitySnapshotType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v22 = v21;
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v24 = v23;
  v35[1] = 3221225472;
  v35[2] = __145___HKFitnessFriendActivitySnapshot__fitnessFriendActivitySnapshotWithFriendUUID_sourceUUID_startDate_endDate_snapshotIndex_snapshotUploadedDate___block_invoke;
  v35[3] = &unk_1E37EC8B0;
  v36 = v15;
  v37 = v19;
  v38 = v16;
  v39 = a7;
  v34.receiver = a1;
  v34.super_class = (Class)&OBJC_METACLASS____HKFitnessFriendActivitySnapshot;
  v35[0] = MEMORY[0x1E0C809B0];
  v25 = v16;
  v26 = v19;
  v27 = v15;
  v28 = objc_msgSendSuper2(&v34, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v20, 0, 0, v35, v22, v24);

  return v28;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FFActivitySnapshot(%f/%f, %f/%f, %f/%f, %f/%f, %lu, %f)"), *(_QWORD *)&self->_energyBurned, *(_QWORD *)&self->_energyBurnedGoal, *(_QWORD *)&self->_mmv, *(_QWORD *)&self->_mmg, *(_QWORD *)&self->_briskMinutes, *(_QWORD *)&self->_briskMinutesGoal, *(_QWORD *)&self->_activeHours, *(_QWORD *)&self->_activeHoursGoal, (unint64_t)self->_stepCount, *(_QWORD *)&self->_walkingAndRunningDistance);
}

- (id)activitySummary
{
  HKActivitySummary *v3;
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
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = objc_alloc_init(HKActivitySummary);
  -[HKActivitySummary _setActivitySummaryIndex:](v3, "_setActivitySummaryIndex:", -[_HKFitnessFriendActivitySnapshot snapshotIndex](self, "snapshotIndex"));
  -[HKSample startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _setStartDate:](v3, "_setStartDate:", v4);

  -[HKSample endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _setEndDate:](v3, "_setEndDate:", v5);

  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot energyBurned](self, "energyBurned");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary setActiveEnergyBurned:](v3, "setActiveEnergyBurned:", v7);

  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot energyBurnedGoal](self, "energyBurnedGoal");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary setActiveEnergyBurnedGoal:](v3, "setActiveEnergyBurnedGoal:", v9);

  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot mmv](self, "mmv");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary setAppleMoveTime:](v3, "setAppleMoveTime:", v11);

  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot mmg](self, "mmg");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary setAppleMoveTimeGoal:](v3, "setAppleMoveTimeGoal:", v13);

  -[HKActivitySummary setActivityMoveMode:](v3, "setActivityMoveMode:", -[_HKFitnessFriendActivitySnapshot amm](self, "amm"));
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot briskMinutes](self, "briskMinutes");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary setAppleExerciseTime:](v3, "setAppleExerciseTime:", v15);

  -[_HKFitnessFriendActivitySnapshot briskMinutesGoal](self, "briskMinutesGoal");
  if (v16 > 0.0)
  {
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKFitnessFriendActivitySnapshot briskMinutesGoal](self, "briskMinutesGoal");
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary setExerciseTimeGoal:](v3, "setExerciseTimeGoal:", v18);

  }
  +[HKUnit countUnit](HKUnit, "countUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot activeHours](self, "activeHours");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary setAppleStandHours:](v3, "setAppleStandHours:", v20);

  -[_HKFitnessFriendActivitySnapshot activeHoursGoal](self, "activeHoursGoal");
  if (v21 > 0.0)
  {
    +[HKUnit countUnit](HKUnit, "countUnit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKFitnessFriendActivitySnapshot activeHoursGoal](self, "activeHoursGoal");
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummary setStandHoursGoal:](v3, "setStandHoursGoal:", v23);

  }
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot walkingAndRunningDistance](self, "walkingAndRunningDistance");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary setDistanceWalkingRunning:](v3, "setDistanceWalkingRunning:", v25);

  +[HKUnit countUnit](HKUnit, "countUnit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot stepCount](self, "stepCount");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary setStepCount:](v3, "setStepCount:", v27);

  +[HKUnit countUnit](HKUnit, "countUnit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendActivitySnapshot pushCount](self, "pushCount");
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary _setPushCount:](v3, "_setPushCount:", v29);

  -[HKActivitySummary _setWheelchairUse:](v3, "_setWheelchairUse:", -[_HKFitnessFriendActivitySnapshot wheelchairUse](self, "wheelchairUse"));
  return v3;
}

- (id)_mostSignificantSnapshot:(id)a3
{
  _HKFitnessFriendActivitySnapshot *v4;
  _HKFitnessFriendActivitySnapshot *v5;
  double v6;
  double v7;
  _HKFitnessFriendActivitySnapshot *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _HKFitnessFriendActivitySnapshot *v13;

  v4 = (_HKFitnessFriendActivitySnapshot *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  -[_HKFitnessFriendActivitySnapshot mmv](v4, "mmv");
  v7 = v6;
  -[_HKFitnessFriendActivitySnapshot mmv](self, "mmv");
  v8 = v5;
  if (v7 <= v9)
  {
    -[_HKFitnessFriendActivitySnapshot energyBurned](v5, "energyBurned");
    v11 = v10;
    -[_HKFitnessFriendActivitySnapshot energyBurned](self, "energyBurned");
    v8 = v5;
    if (v11 <= v12)
LABEL_4:
      v8 = self;
  }
  v13 = v8;

  return v13;
}

- (double)energyBurnedGoalPercentage
{
  double energyBurnedGoal;
  double result;

  energyBurnedGoal = self->_energyBurnedGoal;
  result = 0.0;
  if (energyBurnedGoal > 0.0)
    return self->_energyBurned / energyBurnedGoal;
  return result;
}

- (double)mmgp
{
  double mmg;
  double result;

  mmg = self->_mmg;
  result = 0.0;
  if (mmg > 0.0)
    return self->_mmv / mmg;
  return result;
}

- (double)briskMinutesGoalPercentage
{
  double briskMinutesGoal;
  double result;

  briskMinutesGoal = self->_briskMinutesGoal;
  result = 0.0;
  if (briskMinutesGoal > 0.0)
    return self->_briskMinutes / briskMinutesGoal;
  return result;
}

- (double)activeHoursGoalPercentage
{
  double activeHoursGoal;
  double result;

  activeHoursGoal = self->_activeHoursGoal;
  result = 0.0;
  if (activeHoursGoal > 0.0)
    return self->_activeHours / activeHoursGoal;
  return result;
}

- (_HKFitnessFriendActivitySnapshot)initWithCoder:(id)a3
{
  id v4;
  _HKFitnessFriendActivitySnapshot *v5;
  uint64_t v6;
  NSUUID *friendUUID;
  uint64_t v8;
  NSUUID *sourceUUID;
  uint64_t v10;
  NSDate *snapshotUploadedDate;
  uint64_t v12;
  NSNumber *timeZoneOffsetFromUTCForNoon;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_HKFitnessFriendActivitySnapshot;
  v5 = -[HKSample initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FriendUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    friendUUID = v5->_friendUUID;
    v5->_friendUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceUUID = v5->_sourceUUID;
    v5->_sourceUUID = (NSUUID *)v8;

    v5->_snapshotIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SnapshotIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SnapshotUploadedDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    snapshotUploadedDate = v5->_snapshotUploadedDate;
    v5->_snapshotUploadedDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimeZoneOffsetForNoonFromUTC"));
    v12 = objc_claimAutoreleasedReturnValue();
    timeZoneOffsetFromUTCForNoon = v5->_timeZoneOffsetFromUTCForNoon;
    v5->_timeZoneOffsetFromUTCForNoon = (NSNumber *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ActiveHours"));
    v5->_activeHours = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ActiveHoursGoal"));
    v5->_activeHoursGoal = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BriskMinutes"));
    v5->_briskMinutes = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BriskMinutesGoal"));
    v5->_briskMinutesGoal = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EnergyBurned"));
    v5->_energyBurned = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EnergyBurnedGoal"));
    v5->_energyBurnedGoal = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MoveMinutes"));
    v5->_mmv = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MoveMinutesGoal"));
    v5->_mmg = v21;
    v5->_amm = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ActivityMoveMode"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("StepCount"));
    v5->_stepCount = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PushCount"));
    v5->_pushCount = v23;
    v5->_wheelchairUse = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WheelchairUse"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("WalkingAndRunningDistance"));
    v5->_walkingAndRunningDistance = v24;
  }

  return v5;
}

- (double)mmv
{
  return self->_mmv;
}

- (void)setMmv:(double)a3
{
  self->_mmv = a3;
}

- (double)mmg
{
  return self->_mmg;
}

- (void)setMmg:(double)a3
{
  self->_mmg = a3;
}

- (int64_t)amm
{
  return self->_amm;
}

- (void)setAmm:(int64_t)a3
{
  self->_amm = a3;
}

- (BOOL)hasCarriedForwardGoals
{
  return self->_hasCarriedForwardGoals;
}

- (void)setHasCarriedForwardGoals:(BOOL)a3
{
  self->_hasCarriedForwardGoals = a3;
}

@end
