@implementation HKActivityCache

- (int64_t)cacheIndex
{
  return self->_cacheIndex;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKActivityCache;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_cacheIndex, CFSTR("cacheIndex"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_sequence, CFSTR("sequence"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_energyBurned, CFSTR("energyBurned"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_energyBurnedGoal, CFSTR("energyBurnedGoal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_energyBurnedGoalDate, CFSTR("energyBurnedGoalDate"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("moveMinutes"), self->_moveMinutes);
  objc_msgSend(v4, "encodeObject:forKey:", self->_moveMinutesGoal, CFSTR("moveMinutesGoalQuantity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_moveMinutesGoalDate, CFSTR("moveMinutesGoalDate"));
  if (-[HKActivityCache hasBriskMinutes](self, "hasBriskMinutes"))
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("briskMinutes"), self->_briskMinutes);
  if (-[HKActivityCache hasBriskMinutesGoal](self, "hasBriskMinutesGoal"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_briskMinutesGoal, CFSTR("briskMinutesGoalQuantity"));
  if (-[HKActivityCache hasBriskMinutesGoalDate](self, "hasBriskMinutesGoalDate"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_briskMinutesGoalDate, CFSTR("briskMinutesGoalDate"));
  if (-[HKActivityCache hasActiveHours](self, "hasActiveHours"))
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("activeHours"), self->_activeHours);
  if (-[HKActivityCache hasActiveHoursGoal](self, "hasActiveHoursGoal"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_activeHoursGoal, CFSTR("activeHoursGoalQuantity"));
  if (-[HKActivityCache hasActiveHoursGoalDate](self, "hasActiveHoursGoalDate"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_activeHoursGoalDate, CFSTR("activeHoursGoalDate"));
  if (-[HKActivityCache hasStepCount](self, "hasStepCount"))
    objc_msgSend(v4, "encodeInteger:forKey:", self->_stepCount, CFSTR("stepCount"));
  if (-[HKActivityCache hasPushCount](self, "hasPushCount"))
    objc_msgSend(v4, "encodeInteger:forKey:", self->_pushCount, CFSTR("pushCount"));
  if (-[HKActivityCache hasWheelchairUse](self, "hasWheelchairUse"))
    objc_msgSend(v4, "encodeInteger:forKey:", self->_wheelchairUse, CFSTR("wheelchairUse"));
  if (-[HKActivityCache hasDeepBreathingDuration](self, "hasDeepBreathingDuration"))
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("deepBreathingDuration"), self->_deepBreathingDuration);
  if (-[HKActivityCache hasFlightsClimbed](self, "hasFlightsClimbed"))
    objc_msgSend(v4, "encodeInteger:forKey:", self->_flightsClimbed, CFSTR("flightsClimbed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_walkingAndRunningDistance, CFSTR("walkRunDistance"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dailyEnergyBurnedStatistics, CFSTR("dailyEnergyBurnedStatistics"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dailyBriskMinutesStatistics, CFSTR("dailyBriskMinutesStatistics"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_activityMoveMode, CFSTR("activityMoveMode"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_paused, CFSTR("paused"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, CFSTR("version"));

}

- (BOOL)hasBriskMinutes
{
  return (LOBYTE(self->_knownFields) >> 2) & 1;
}

- (BOOL)hasActiveHours
{
  return (LOBYTE(self->_knownFields) >> 3) & 1;
}

- (BOOL)hasStepCount
{
  return LOBYTE(self->_knownFields) >> 7;
}

- (BOOL)hasPushCount
{
  return (BYTE1(self->_knownFields) >> 3) & 1;
}

- (BOOL)hasWheelchairUse
{
  return (BYTE1(self->_knownFields) >> 5) & 1;
}

- (BOOL)hasDeepBreathingDuration
{
  return (BYTE1(self->_knownFields) >> 2) & 1;
}

- (BOOL)hasFlightsClimbed
{
  return (BYTE1(self->_knownFields) >> 4) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
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

  -[HKSample startDate](self, "startDate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivityCache dateComponents](self, "dateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKActivityCache sequence](self, "sequence");
  -[HKObject metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKActivityCache _activityCacheWithStartDate:endDate:dateComponents:sequence:metadata:](HKActivityCache, "_activityCacheWithStartDate:endDate:dateComponents:sequence:metadata:", v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKObject UUID](self, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setUUID:", v10);

  if (-[HKActivityCache hasEnergyBurned](self, "hasEnergyBurned"))
  {
    -[HKActivityCache energyBurned](self, "energyBurned");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setEnergyBurned:", v11);

  }
  if (-[HKActivityCache hasMoveMinutes](self, "hasMoveMinutes"))
  {
    -[HKActivityCache moveMinutes](self, "moveMinutes");
    objc_msgSend(v9, "_setMoveMinutes:");
  }
  if (-[HKActivityCache hasBriskMinutes](self, "hasBriskMinutes"))
  {
    -[HKActivityCache briskMinutes](self, "briskMinutes");
    objc_msgSend(v9, "_setBriskMinutes:");
  }
  if (-[HKActivityCache hasActiveHours](self, "hasActiveHours"))
  {
    -[HKActivityCache activeHours](self, "activeHours");
    objc_msgSend(v9, "_setActiveHours:");
  }
  if (-[HKActivityCache hasStepCount](self, "hasStepCount"))
    objc_msgSend(v9, "_setStepCount:", -[HKActivityCache stepCount](self, "stepCount"));
  if (-[HKActivityCache hasPushCount](self, "hasPushCount"))
    objc_msgSend(v9, "_setPushCount:", -[HKActivityCache pushCount](self, "pushCount"));
  if (-[HKActivityCache hasWheelchairUse](self, "hasWheelchairUse"))
    objc_msgSend(v9, "_setWheelchairUse:", -[HKActivityCache wheelchairUse](self, "wheelchairUse"));
  if (-[HKActivityCache hasWalkingAndRunningDistance](self, "hasWalkingAndRunningDistance"))
  {
    -[HKActivityCache walkingAndRunningDistance](self, "walkingAndRunningDistance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setWalkingAndRunningDistance:", v12);

  }
  if (-[HKActivityCache hasDeepBreathingDuration](self, "hasDeepBreathingDuration"))
  {
    -[HKActivityCache deepBreathingDuration](self, "deepBreathingDuration");
    objc_msgSend(v9, "_setDeepBreathingDuration:");
  }
  if (-[HKActivityCache hasEnergyBurnedGoal](self, "hasEnergyBurnedGoal"))
  {
    -[HKActivityCache energyBurnedGoal](self, "energyBurnedGoal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivityCache energyBurnedGoalDate](self, "energyBurnedGoalDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setEnergyBurnedGoal:date:", v13, v14);

  }
  if (-[HKActivityCache hasMoveMinutesGoal](self, "hasMoveMinutesGoal"))
  {
    -[HKActivityCache moveMinutesGoal](self, "moveMinutesGoal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivityCache moveMinutesGoalDate](self, "moveMinutesGoalDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setMoveMinutesGoal:date:", v15, v16);

  }
  if (-[HKActivityCache hasBriskMinutesGoal](self, "hasBriskMinutesGoal"))
  {
    -[HKActivityCache briskMinutesGoal](self, "briskMinutesGoal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setBriskMinutesGoal:", v17);

  }
  if (-[HKActivityCache hasActiveHoursGoal](self, "hasActiveHoursGoal"))
  {
    -[HKActivityCache activeHoursGoal](self, "activeHoursGoal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setActiveHoursGoal:", v18);

  }
  if (-[HKActivityCache hasFlightsClimbed](self, "hasFlightsClimbed"))
    objc_msgSend(v9, "_setFlightsClimbed:", -[HKActivityCache flightsClimbed](self, "flightsClimbed"));
  -[HKActivityCache dailyEnergyBurnedStatistics](self, "dailyEnergyBurnedStatistics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDailyEnergyBurnedStatistics:", v19);

  -[HKActivityCache dailyMoveMinutesStatistics](self, "dailyMoveMinutesStatistics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDailyMoveMinutesStatistics:", v20);

  -[HKActivityCache dailyBriskMinutesStatistics](self, "dailyBriskMinutesStatistics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDailyBriskMinutesStatistics:", v21);

  objc_msgSend(v9, "_setActivityMoveMode:", -[HKActivityCache activityMoveMode](self, "activityMoveMode"));
  objc_msgSend(v9, "_setPaused:", -[HKActivityCache isPaused](self, "isPaused"));
  objc_msgSend(v9, "_setVersion:", -[HKActivityCache version](self, "version"));
  return v9;
}

- (NSDateComponents)dateComponents
{
  return (NSDateComponents *)(id)-[NSDateComponents copy](self->_dateComponents, "copy");
}

- (HKQuantity)energyBurned
{
  return self->_energyBurned;
}

- (HKQuantity)walkingAndRunningDistance
{
  return self->_walkingAndRunningDistance;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (void)_setBriskMinutes:(double)a3
{
  self->_briskMinutes = a3;
  self->_knownFields |= 4uLL;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (void)_setActiveHours:(double)a3
{
  self->_activeHours = a3;
  self->_knownFields |= 8uLL;
}

- (int64_t)stepCount
{
  return self->_stepCount;
}

- (void)_setStepCount:(int64_t)a3
{
  self->_stepCount = a3;
  self->_knownFields |= 0x80uLL;
}

- (int64_t)pushCount
{
  return self->_pushCount;
}

- (void)_setPushCount:(int64_t)a3
{
  self->_pushCount = a3;
  self->_knownFields |= 0x800uLL;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (void)_setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
  self->_knownFields |= 0x2000uLL;
}

- (double)deepBreathingDuration
{
  return self->_deepBreathingDuration;
}

- (void)_setDeepBreathingDuration:(double)a3
{
  self->_deepBreathingDuration = a3;
  self->_knownFields |= 0x400uLL;
}

- (BOOL)hasEnergyBurnedGoal
{
  return self->_energyBurnedGoal != 0;
}

- (HKQuantity)energyBurnedGoal
{
  return self->_energyBurnedGoal;
}

- (NSDate)energyBurnedGoalDate
{
  return self->_energyBurnedGoalDate;
}

- (void)_setEnergyBurnedGoal:(id)a3 date:(id)a4
{
  id v7;
  NSDate *energyBurnedGoalDate;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v7
    || (energyBurnedGoalDate = self->_energyBurnedGoalDate) == 0
    || -[NSDate compare:](energyBurnedGoalDate, "compare:", v7) == NSOrderedAscending
    && (-[HKSample endDate](self, "endDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v7, "compare:", v9),
        v9,
        v10 == -1))
  {
    objc_storeStrong((id *)&self->_energyBurnedGoal, a3);
    objc_storeStrong((id *)&self->_energyBurnedGoalDate, a4);
  }

}

- (int64_t)flightsClimbed
{
  return self->_flightsClimbed;
}

- (void)_setFlightsClimbed:(int64_t)a3
{
  self->_flightsClimbed = a3;
  self->_knownFields |= 0x1000uLL;
}

- (NSArray)dailyEnergyBurnedStatistics
{
  return self->_dailyEnergyBurnedStatistics;
}

- (void)_setDailyEnergyBurnedStatistics:(id)a3
{
  NSArray *v4;
  NSArray *dailyEnergyBurnedStatistics;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  self->_dailyEnergyBurnedStatistics = v4;

}

- (NSArray)dailyBriskMinutesStatistics
{
  return self->_dailyBriskMinutesStatistics;
}

- (void)_setDailyBriskMinutesStatistics:(id)a3
{
  NSArray *v4;
  NSArray *dailyBriskMinutesStatistics;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  self->_dailyBriskMinutesStatistics = v4;

}

- (BOOL)_isEqualToActivityCache:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int64_t v46;
  int64_t v47;
  int64_t v48;
  double v49;
  double v50;
  double v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  BOOL v77;
  int64_t v79;
  int v80;
  int64_t v81;

  v4 = a3;
  if (!v4)
    goto LABEL_55;
  -[HKActivityCache energyBurned](self, "energyBurned");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "energyBurned");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "energyBurned");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_54;
    v9 = (void *)v8;
    -[HKActivityCache energyBurned](self, "energyBurned");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "energyBurned");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_55;
  }
  -[HKActivityCache energyBurnedGoal](self, "energyBurnedGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "energyBurnedGoal");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v13)
  {

  }
  else
  {
    v7 = (void *)v13;
    objc_msgSend(v4, "energyBurnedGoal");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_54;
    v15 = (void *)v14;
    -[HKActivityCache energyBurnedGoal](self, "energyBurnedGoal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "energyBurnedGoal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_55;
  }
  -[HKActivityCache moveMinutes](self, "moveMinutes");
  v20 = v19;
  objc_msgSend(v4, "moveMinutes");
  if (v20 != v21)
    goto LABEL_55;
  -[HKActivityCache moveMinutesGoal](self, "moveMinutesGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moveMinutesGoal");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v22)
  {

  }
  else
  {
    v7 = (void *)v22;
    objc_msgSend(v4, "moveMinutesGoal");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_54;
    v24 = (void *)v23;
    -[HKActivityCache moveMinutesGoal](self, "moveMinutesGoal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveMinutesGoal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_55;
  }
  -[HKActivityCache briskMinutes](self, "briskMinutes");
  v29 = v28;
  objc_msgSend(v4, "briskMinutes");
  if (v29 != v30)
    goto LABEL_55;
  -[HKActivityCache briskMinutesGoal](self, "briskMinutesGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "briskMinutesGoal");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v31)
  {

  }
  else
  {
    v7 = (void *)v31;
    objc_msgSend(v4, "briskMinutesGoal");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
      goto LABEL_54;
    v33 = (void *)v32;
    -[HKActivityCache briskMinutesGoal](self, "briskMinutesGoal");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "briskMinutesGoal");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_55;
  }
  -[HKActivityCache activeHours](self, "activeHours");
  v38 = v37;
  objc_msgSend(v4, "activeHours");
  if (v38 != v39)
    goto LABEL_55;
  -[HKActivityCache activeHoursGoal](self, "activeHoursGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeHoursGoal");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v40)
  {

  }
  else
  {
    v7 = (void *)v40;
    objc_msgSend(v4, "activeHoursGoal");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!v41)
      goto LABEL_54;
    v42 = (void *)v41;
    -[HKActivityCache activeHoursGoal](self, "activeHoursGoal");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeHoursGoal");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_55;
  }
  v46 = -[HKActivityCache stepCount](self, "stepCount");
  if (v46 != objc_msgSend(v4, "stepCount"))
    goto LABEL_55;
  v47 = -[HKActivityCache pushCount](self, "pushCount");
  if (v47 != objc_msgSend(v4, "pushCount"))
    goto LABEL_55;
  v48 = -[HKActivityCache wheelchairUse](self, "wheelchairUse");
  if (v48 != objc_msgSend(v4, "wheelchairUse"))
    goto LABEL_55;
  -[HKActivityCache deepBreathingDuration](self, "deepBreathingDuration");
  v50 = v49;
  objc_msgSend(v4, "deepBreathingDuration");
  if (v50 != v51)
    goto LABEL_55;
  v52 = -[HKActivityCache flightsClimbed](self, "flightsClimbed");
  if (v52 != objc_msgSend(v4, "flightsClimbed"))
    goto LABEL_55;
  -[HKActivityCache walkingAndRunningDistance](self, "walkingAndRunningDistance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "walkingAndRunningDistance");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v53)
  {

  }
  else
  {
    v7 = (void *)v53;
    objc_msgSend(v4, "walkingAndRunningDistance");
    v54 = objc_claimAutoreleasedReturnValue();
    if (!v54)
      goto LABEL_54;
    v55 = (void *)v54;
    -[HKActivityCache walkingAndRunningDistance](self, "walkingAndRunningDistance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "walkingAndRunningDistance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_55;
  }
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v59)
  {

  }
  else
  {
    v7 = (void *)v59;
    objc_msgSend(v4, "startDate");
    v60 = objc_claimAutoreleasedReturnValue();
    if (!v60)
      goto LABEL_54;
    v61 = (void *)v60;
    -[HKSample startDate](self, "startDate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqual:", v63);

    if (!v64)
      goto LABEL_55;
  }
  -[HKSample endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v65 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v65)
  {

  }
  else
  {
    v7 = (void *)v65;
    objc_msgSend(v4, "endDate");
    v66 = objc_claimAutoreleasedReturnValue();
    if (!v66)
      goto LABEL_54;
    v67 = (void *)v66;
    -[HKSample endDate](self, "endDate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "isEqual:", v69);

    if (!v70)
      goto LABEL_55;
  }
  -[HKActivityCache dateComponents](self, "dateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateComponents");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v5 != (void *)v71)
  {
    v7 = (void *)v71;
    objc_msgSend(v4, "dateComponents");
    v72 = objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      v73 = (void *)v72;
      -[HKActivityCache dateComponents](self, "dateComponents");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateComponents");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v74, "isEqual:", v75);

      if (!v76)
        goto LABEL_55;
      goto LABEL_58;
    }
LABEL_54:

    goto LABEL_55;
  }

LABEL_58:
  v79 = -[HKActivityCache activityMoveMode](self, "activityMoveMode");
  if (v79 == objc_msgSend(v4, "activityMoveMode"))
  {
    v80 = -[HKActivityCache isPaused](self, "isPaused");
    if (v80 == objc_msgSend(v4, "isPaused"))
    {
      v81 = -[HKActivityCache version](self, "version");
      v77 = v81 == objc_msgSend(v4, "version");
      goto LABEL_56;
    }
  }
LABEL_55:
  v77 = 0;
LABEL_56:

  return v77;
}

- (void)_setEnergyBurned:(id)a3
{
  objc_storeStrong((id *)&self->_energyBurned, a3);
}

- (void)_setEnergyBurnedGoal:(id)a3
{
  -[HKActivityCache _setEnergyBurnedGoal:date:](self, "_setEnergyBurnedGoal:date:", a3, 0);
}

- (void)_setEnergyBurnedGoalDateOnly:(id)a3
{
  objc_storeStrong((id *)&self->_energyBurnedGoalDate, a3);
}

- (void)_setWalkingAndRunningDistance:(id)a3
{
  objc_storeStrong((id *)&self->_walkingAndRunningDistance, a3);
}

- (BOOL)hasActiveHoursGoal
{
  return self->_activeHoursGoal != 0;
}

- (HKQuantity)activeHoursGoal
{
  HKQuantity *activeHoursGoal;

  activeHoursGoal = self->_activeHoursGoal;
  if (activeHoursGoal)
    return activeHoursGoal;
  -[HKActivityCache _fallbackActiveHoursGoal](self, "_fallbackActiveHoursGoal");
  return (HKQuantity *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasEnergyBurned
{
  return self->_energyBurned != 0;
}

- (BOOL)hasBriskMinutesGoal
{
  return self->_briskMinutesGoal != 0;
}

- (HKQuantity)briskMinutesGoal
{
  HKQuantity *briskMinutesGoal;

  briskMinutesGoal = self->_briskMinutesGoal;
  if (briskMinutesGoal)
    return briskMinutesGoal;
  -[HKActivityCache _fallbackBriskMinutesGoal](self, "_fallbackBriskMinutesGoal");
  return (HKQuantity *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasWalkingAndRunningDistance
{
  return self->_walkingAndRunningDistance != 0;
}

- (BOOL)hasDailyEnergyBurnedStatistics
{
  return self->_dailyEnergyBurnedStatistics != 0;
}

- (BOOL)hasDailyBriskMinutesStatistics
{
  return self->_dailyBriskMinutesStatistics != 0;
}

- (id)_valueDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sequence);
  v3 = objc_claimAutoreleasedReturnValue();
  v31 = -[HKActivityCache hasEnergyBurned](self, "hasEnergyBurned");
  if (v31)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivityCache _energyBurnedInKilocalories](self, "_energyBurnedInKilocalories");
    objc_msgSend(v4, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
  v30 = -[HKActivityCache hasEnergyBurnedGoal](self, "hasEnergyBurnedGoal");
  if (v30)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivityCache _energyBurnedGoalInKilocalories](self, "_energyBurnedGoalInKilocalories");
    objc_msgSend(v5, "numberWithDouble:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }
  v29 = -[HKActivityCache hasMoveMinutes](self, "hasMoveMinutes");
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_moveMinutes);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
  }
  v27 = -[HKActivityCache hasMoveMinutesGoal](self, "hasMoveMinutesGoal");
  if (v27)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivityCache _moveMinutesGoalInMinutes](self, "_moveMinutesGoalInMinutes");
    objc_msgSend(v6, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  v26 = -[HKActivityCache hasBriskMinutes](self, "hasBriskMinutes");
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_briskMinutes);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  v25 = -[HKActivityCache hasBriskMinutesGoal](self, "hasBriskMinutesGoal");
  if (v25)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivityCache _briskMinutesGoalInMinutes](self, "_briskMinutesGoalInMinutes");
    objc_msgSend(v7, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
  v24 = -[HKActivityCache hasActiveHours](self, "hasActiveHours");
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_activeHours);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v23 = -[HKActivityCache hasActiveHoursGoal](self, "hasActiveHoursGoal");
  if (v23)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivityCache _activeHoursGoalCount](self, "_activeHoursGoalCount");
    objc_msgSend(v8, "numberWithDouble:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  v22 = -[HKActivityCache hasStepCount](self, "hasStepCount");
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_stepCount);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  v21 = -[HKActivityCache hasPushCount](self, "hasPushCount");
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_pushCount);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  v9 = -[HKActivityCache hasWalkingAndRunningDistance](self, "hasWalkingAndRunningDistance");
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[HKActivityCache _walkingAndRunningDistanceInMeters](self, "_walkingAndRunningDistanceInMeters");
    objc_msgSend(v10, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  v11 = -[HKActivityCache hasDeepBreathingDuration](self, "hasDeepBreathingDuration");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deepBreathingDuration);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = -[HKActivityCache hasFlightsClimbed](self, "hasFlightsClimbed");
  v14 = (void *)v3;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_flightsClimbed);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_activityMoveMode);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_paused)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_version);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("{HKActivityCache: Sequence=%@ EnergyBurned=(%@/%@) MoveMinutes=(%@/%@) BriskMinutes=(%@/%@) ActiveHours=(%@/%@) StepCount=(%@) PushCount=(%@) Meters=(%@) BreatheDuration=(%@) Flights=(%@) ActivityModeMode=(%@) Paused=(%@) Version=(%@)}"), v14, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v12, v15, v16, v17,
    v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {

    if (!v11)
    {
LABEL_45:
      if (!v9)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if (!v11)
  {
    goto LABEL_45;
  }

  if (v9)
LABEL_46:

LABEL_47:
  if (v21)

  if (v22)
  if (v23)

  if (v24)
  if (v25)

  if (v26)
  if (v27)

  if (v29)
  if (v30)

  if (v31)
  return v19;
}

- (double)_energyBurnedInKilocalories
{
  HKQuantity *energyBurned;
  void *v3;
  double v4;
  double v5;

  energyBurned = self->_energyBurned;
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](energyBurned, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_energyBurnedGoalInKilocalories
{
  HKQuantity *energyBurnedGoal;
  void *v3;
  double v4;
  double v5;

  energyBurnedGoal = self->_energyBurnedGoal;
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](energyBurnedGoal, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_walkingAndRunningDistanceInMeters
{
  HKQuantity *walkingAndRunningDistance;
  void *v3;
  double v4;
  double v5;

  walkingAndRunningDistance = self->_walkingAndRunningDistance;
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](walkingAndRunningDistance, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyBriskMinutesStatistics, 0);
  objc_storeStrong((id *)&self->_dailyMoveMinutesStatistics, 0);
  objc_storeStrong((id *)&self->_dailyEnergyBurnedStatistics, 0);
  objc_storeStrong((id *)&self->_walkingAndRunningDistance, 0);
  objc_storeStrong((id *)&self->_activeHoursGoalDate, 0);
  objc_storeStrong((id *)&self->_activeHoursGoal, 0);
  objc_storeStrong((id *)&self->_briskMinutesGoalDate, 0);
  objc_storeStrong((id *)&self->_briskMinutesGoal, 0);
  objc_storeStrong((id *)&self->_moveMinutesGoalDate, 0);
  objc_storeStrong((id *)&self->_moveMinutesGoal, 0);
  objc_storeStrong((id *)&self->_energyBurnedGoalDate, 0);
  objc_storeStrong((id *)&self->_energyBurnedGoal, 0);
  objc_storeStrong((id *)&self->_energyBurned, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

- (void)_setCacheIndex:(int64_t)a3
{
  NSDateComponents *v4;
  NSDateComponents *dateComponents;

  self->_cacheIndex = a3;
  _HKActivityCacheDateComponentsFromCacheIndex(a3);
  v4 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  dateComponents = self->_dateComponents;
  self->_dateComponents = v4;

}

- (void)_setEnergyBurnedGoalOnly:(id)a3
{
  objc_storeStrong((id *)&self->_energyBurnedGoal, a3);
}

+ (id)_activityCacheWithStartDate:(id)a3 endDate:(id)a4 dateComponents:(id)a5 sequence:(int64_t)a6 energyBurned:(id)a7 energyBurnedGoal:(id)a8 walkingAndRunningDistance:(id)a9 metadata:(id)a10
{
  id v17;
  id v18;
  id v19;
  void *v20;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  objc_msgSend(a1, "_activityCacheWithStartDate:endDate:dateComponents:sequence:metadata:", a3, a4, a5, a6, a10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setEnergyBurned:", v19);

  objc_msgSend(v20, "_setEnergyBurnedGoal:", v18);
  objc_msgSend(v20, "_setWalkingAndRunningDistance:", v17);

  return v20;
}

+ (id)_activityCacheWithStartDate:(id)a3 endDate:(id)a4 dateComponents:(id)a5 sequence:(int64_t)a6 metadata:(id)a7
{
  id v7;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  int64_t v31;
  id v32;

  v7 = 0;
  if (a4 && a3 && a5)
  {
    v13 = a7;
    v14 = a5;
    v15 = a4;
    v16 = a3;
    _HKCachedImmutableGregorianCalendarWithUTCTimeZone();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v18 = _HKDerivedCacheIndexAndDateComponents(v17, v14, &v32);

    v19 = v32;
    +[HKObjectType activityCacheType](HKObjectType, "activityCacheType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v22 = v21;

    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v24 = v23;

    v28[1] = 3221225472;
    v28[2] = __88__HKActivityCache__activityCacheWithStartDate_endDate_dateComponents_sequence_metadata___block_invoke;
    v28[3] = &unk_1E37F23B8;
    v29 = v19;
    v30 = v18;
    v31 = a6;
    v27.receiver = a1;
    v27.super_class = (Class)&OBJC_METACLASS___HKActivityCache;
    v28[0] = MEMORY[0x1E0C809B0];
    v25 = v19;
    v7 = objc_msgSendSuper2(&v27, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v20, 0, v13, v28, v22, v24);

  }
  return v7;
}

void __88__HKActivityCache__activityCacheWithStartDate_endDate_dateComponents_sequence_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  *(_QWORD *)(a2 + 96) = *(_QWORD *)(a1 + 40);
  objc_storeStrong((id *)(a2 + 104), *(id *)(a1 + 32));
  v4 = (id)a2;
  v4[39] = *(_QWORD *)(a1 + 48);
  v4[35] = 1;
  *((_BYTE *)v4 + 288) = 0;
  v4[37] = 2;

}

+ (id)_activityCacheWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 dateComponents:(id)a6 sequence:(int64_t)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  objc_super v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  int64_t v33;
  id v34;

  v12 = a3;
  v13 = v12;
  v14 = 0;
  if (a5 && a4 && v12 && a6)
  {
    v15 = a6;
    v16 = a5;
    v17 = a4;
    _HKCachedImmutableGregorianCalendarWithUTCTimeZone();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v19 = _HKDerivedCacheIndexAndDateComponents(v18, v15, &v34);

    v20 = v34;
    +[HKObjectType activityCacheType](HKObjectType, "activityCacheType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v23 = v22;

    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v25 = v24;

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __84__HKActivityCache__activityCacheWithUUID_startDate_endDate_dateComponents_sequence___block_invoke;
    v29[3] = &unk_1E37F23E0;
    v32 = v19;
    v33 = a7;
    v30 = v20;
    v31 = v13;
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_METACLASS___HKActivityCache;
    v26 = v20;
    v14 = objc_msgSendSuper2(&v28, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v21, 0, 0, v29, v23, v25);

  }
  return v14;
}

void __84__HKActivityCache__activityCacheWithUUID_startDate_endDate_dateComponents_sequence___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  *(_QWORD *)(a2 + 96) = *(_QWORD *)(a1 + 48);
  objc_storeStrong((id *)(a2 + 104), *(id *)(a1 + 32));
  v4 = (id)a2;
  v4[39] = *(_QWORD *)(a1 + 56);
  v4[35] = 1;
  *((_BYTE *)v4 + 288) = 0;
  v4[37] = 2;
  objc_msgSend(v4, "_setUUID:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (double)moveMinutes
{
  return self->_moveMinutes;
}

- (void)_setMoveMinutes:(double)a3
{
  self->_moveMinutes = a3;
  self->_knownFields |= 0x4000uLL;
}

- (BOOL)hasMoveMinutes
{
  return (BYTE1(self->_knownFields) >> 6) & 1;
}

- (HKQuantity)moveMinutesGoal
{
  return self->_moveMinutesGoal;
}

- (NSDate)moveMinutesGoalDate
{
  return self->_moveMinutesGoalDate;
}

- (void)_setMoveMinutesGoal:(id)a3
{
  -[HKActivityCache _setMoveMinutesGoal:date:](self, "_setMoveMinutesGoal:date:", a3, 0);
}

- (void)_setMoveMinutesGoal:(id)a3 date:(id)a4
{
  id v7;
  NSDate *moveMinutesGoalDate;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v7
    || (moveMinutesGoalDate = self->_moveMinutesGoalDate) == 0
    || -[NSDate compare:](moveMinutesGoalDate, "compare:", v7) == NSOrderedAscending
    && (-[HKSample endDate](self, "endDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v7, "compare:", v9),
        v9,
        v10 == -1))
  {
    objc_storeStrong((id *)&self->_moveMinutesGoal, a3);
    objc_storeStrong((id *)&self->_moveMinutesGoalDate, a4);
  }

}

- (void)_setMoveMinutesGoalOnly:(id)a3
{
  objc_storeStrong((id *)&self->_moveMinutesGoal, a3);
}

- (void)_setMoveMinutesGoalDateOnly:(id)a3
{
  objc_storeStrong((id *)&self->_moveMinutesGoalDate, a3);
}

- (BOOL)hasMoveMinutesGoal
{
  return self->_moveMinutesGoal != 0;
}

- (id)_fallbackBriskMinutesGoal
{
  void *v2;
  void *v3;

  if (self->_version <= 1)
  {
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v3, 30.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_setBriskMinutesGoal:(id)a3
{
  -[HKActivityCache _setBriskMinutesGoal:date:](self, "_setBriskMinutesGoal:date:", a3, 0);
}

- (void)_setBriskMinutesGoal:(id)a3 date:(id)a4
{
  id v8;
  NSDate *briskMinutesGoalDate;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  if (v13 && objc_msgSend(v13, "_isZero"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKActivityCache.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(briskMinutesGoal == nil) || ![briskMinutesGoal _isZero]"));

  }
  if (!v8
    || (briskMinutesGoalDate = self->_briskMinutesGoalDate) == 0
    || -[NSDate compare:](briskMinutesGoalDate, "compare:", v8) == NSOrderedAscending
    && (-[HKSample endDate](self, "endDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v8, "compare:", v10),
        v10,
        v11 == -1))
  {
    objc_storeStrong((id *)&self->_briskMinutesGoal, a3);
    objc_storeStrong((id *)&self->_briskMinutesGoalDate, a4);
  }

}

- (void)_setBriskMinutesGoalOnly:(id)a3
{
  objc_storeStrong((id *)&self->_briskMinutesGoal, a3);
}

- (void)_setBriskMinutesGoalDateOnly:(id)a3
{
  objc_storeStrong((id *)&self->_briskMinutesGoalDate, a3);
}

- (BOOL)hasBriskMinutesGoalDate
{
  return self->_briskMinutesGoalDate != 0;
}

- (id)_fallbackActiveHoursGoal
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;

  if (self->_version <= 1)
  {
    v3 = 12;
    if (self->_activityMoveMode == 2)
      v3 = 10;
    v4 = (double)v3;
    +[HKUnit countUnit](HKUnit, "countUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v5, v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_setActiveHoursGoal:(id)a3
{
  -[HKActivityCache _setActiveHoursGoal:date:](self, "_setActiveHoursGoal:date:", a3, 0);
}

- (void)_setActiveHoursGoal:(id)a3 date:(id)a4
{
  id v8;
  NSDate *activeHoursGoalDate;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  if (v13 && objc_msgSend(v13, "_isZero"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKActivityCache.m"), 400, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(activeHoursGoal == nil) || ![activeHoursGoal _isZero]"));

  }
  if (!v8
    || (activeHoursGoalDate = self->_activeHoursGoalDate) == 0
    || -[NSDate compare:](activeHoursGoalDate, "compare:", v8) == NSOrderedAscending
    && (-[HKSample endDate](self, "endDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v8, "compare:", v10),
        v10,
        v11 == -1))
  {
    objc_storeStrong((id *)&self->_activeHoursGoal, a3);
    objc_storeStrong((id *)&self->_activeHoursGoalDate, a4);
  }

}

- (void)_setActiveHoursGoalOnly:(id)a3
{
  objc_storeStrong((id *)&self->_activeHoursGoal, a3);
}

- (void)_setActiveHoursGoalDateOnly:(id)a3
{
  objc_storeStrong((id *)&self->_activeHoursGoalDate, a3);
}

- (BOOL)hasActiveHoursGoalDate
{
  return self->_activeHoursGoalDate != 0;
}

- (double)energyBurnedGoalPercentage
{
  double v3;
  double v4;
  double result;
  double v6;

  -[HKActivityCache _energyBurnedGoalInKilocalories](self, "_energyBurnedGoalInKilocalories");
  v4 = v3;
  result = 0.0;
  if (v4 > 0.0)
  {
    -[HKActivityCache _energyBurnedInKilocalories](self, "_energyBurnedInKilocalories", 0.0);
    return v6 / v4;
  }
  return result;
}

- (double)moveMinutesGoalPercentage
{
  double v3;
  double v4;

  -[HKActivityCache _moveMinutesGoalInMinutes](self, "_moveMinutesGoalInMinutes");
  v4 = 0.0;
  if (v3 > 0.0)
    return self->_moveMinutes / v3;
  return v4;
}

- (double)briskMinutesGoalPercentage
{
  _BOOL4 v3;
  double result;
  double briskMinutes;
  double v6;

  v3 = -[HKActivityCache hasBriskMinutesGoal](self, "hasBriskMinutesGoal");
  result = 0.0;
  if (v3)
  {
    briskMinutes = self->_briskMinutes;
    -[HKActivityCache _briskMinutesGoalInMinutes](self, "_briskMinutesGoalInMinutes", 0.0);
    return briskMinutes / v6;
  }
  return result;
}

- (double)activeHoursGoalPercentage
{
  _BOOL4 v3;
  double result;
  double activeHours;
  double v6;

  v3 = -[HKActivityCache hasActiveHoursGoal](self, "hasActiveHoursGoal");
  result = 0.0;
  if (v3)
  {
    activeHours = self->_activeHours;
    -[HKActivityCache _activeHoursGoalCount](self, "_activeHoursGoalCount", 0.0);
    return activeHours / v6;
  }
  return result;
}

- (BOOL)hasDateComponents
{
  return self->_dateComponents != 0;
}

- (BOOL)hasDailyMoveMinutesStatistics
{
  return self->_dailyMoveMinutesStatistics != 0;
}

- (NSArray)dailyMoveMinutesStatistics
{
  return self->_dailyMoveMinutesStatistics;
}

- (void)_setDailyMoveMinutesStatistics:(id)a3
{
  NSArray *v4;
  NSArray *dailyMoveMinutesStatistics;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  dailyMoveMinutesStatistics = self->_dailyMoveMinutesStatistics;
  self->_dailyMoveMinutesStatistics = v4;

}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (void)_setActivityMoveMode:(int64_t)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKActivityCache.m"), 587, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityMoveMode != 0"));

  }
  self->_activityMoveMode = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)_setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)_setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (unint64_t)knownFields
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;

  if (-[HKActivityCache hasEnergyBurned](self, "hasEnergyBurned"))
    v3 = 2;
  else
    v3 = 0;
  v4 = -[HKActivityCache hasBriskMinutes](self, "hasBriskMinutes");
  v5 = 4;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[HKActivityCache hasActiveHours](self, "hasActiveHours"))
    v7 = 8;
  else
    v7 = 0;
  v8 = -[HKActivityCache hasEnergyBurnedGoal](self, "hasEnergyBurnedGoal");
  v9 = 16;
  if (!v8)
    v9 = 0;
  v10 = v6 | v7 | v9;
  if (-[HKActivityCache hasBriskMinutesGoal](self, "hasBriskMinutesGoal"))
    v11 = 32;
  else
    v11 = 0;
  v12 = -[HKActivityCache hasActiveHoursGoal](self, "hasActiveHoursGoal");
  v13 = 64;
  if (!v12)
    v13 = 0;
  v14 = v11 | v13;
  v15 = -[HKActivityCache hasStepCount](self, "hasStepCount");
  v16 = 128;
  if (!v15)
    v16 = 0;
  v17 = v10 | v14 | v16;
  if (-[HKActivityCache hasDeepBreathingDuration](self, "hasDeepBreathingDuration"))
    v18 = 1024;
  else
    v18 = 0;
  v19 = -[HKActivityCache hasWalkingAndRunningDistance](self, "hasWalkingAndRunningDistance");
  v20 = 256;
  if (!v19)
    v20 = 0;
  v21 = v18 | v20;
  v22 = -[HKActivityCache hasPushCount](self, "hasPushCount");
  v23 = 2048;
  if (!v22)
    v23 = 0;
  v24 = v21 | v23;
  v25 = -[HKActivityCache hasWheelchairUse](self, "hasWheelchairUse");
  v26 = 0x2000;
  if (!v25)
    v26 = 0;
  v27 = v17 | v24 | v26;
  v28 = -[HKActivityCache hasFlightsClimbed](self, "hasFlightsClimbed");
  v29 = 4096;
  if (!v28)
    v29 = 0;
  return v27 | v29;
}

- (void)reset
{
  HKQuantity *energyBurned;
  HKQuantity *energyBurnedGoal;
  NSDate *energyBurnedGoalDate;
  HKQuantity *moveMinutesGoal;
  NSDate *moveMinutesGoalDate;
  HKQuantity *briskMinutesGoal;
  NSDate *briskMinutesGoalDate;
  HKQuantity *activeHoursGoal;
  NSDate *activeHoursGoalDate;
  HKQuantity *walkingAndRunningDistance;
  NSArray *dailyEnergyBurnedStatistics;
  NSArray *dailyBriskMinutesStatistics;

  energyBurned = self->_energyBurned;
  self->_energyBurned = 0;

  energyBurnedGoal = self->_energyBurnedGoal;
  self->_energyBurnedGoal = 0;

  energyBurnedGoalDate = self->_energyBurnedGoalDate;
  self->_energyBurnedGoalDate = 0;

  self->_moveMinutes = 0.0;
  moveMinutesGoal = self->_moveMinutesGoal;
  self->_moveMinutesGoal = 0;

  moveMinutesGoalDate = self->_moveMinutesGoalDate;
  self->_moveMinutesGoalDate = 0;

  self->_briskMinutes = 0.0;
  briskMinutesGoal = self->_briskMinutesGoal;
  self->_briskMinutesGoal = 0;

  briskMinutesGoalDate = self->_briskMinutesGoalDate;
  self->_briskMinutesGoalDate = 0;

  self->_activeHours = 0.0;
  activeHoursGoal = self->_activeHoursGoal;
  self->_activeHoursGoal = 0;

  activeHoursGoalDate = self->_activeHoursGoalDate;
  self->_activeHoursGoalDate = 0;

  self->_stepCount = 0;
  walkingAndRunningDistance = self->_walkingAndRunningDistance;
  self->_walkingAndRunningDistance = 0;

  self->_deepBreathingDuration = 0.0;
  self->_pushCount = 0;
  self->_wheelchairUse = 0;
  self->_flightsClimbed = 0;
  dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  self->_dailyEnergyBurnedStatistics = 0;

  dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  self->_dailyBriskMinutesStatistics = 0;

  self->_activityMoveMode = 2;
  self->_paused = 0;
  self->_knownFields = 0;
}

- (double)_moveMinutesGoalInMinutes
{
  HKQuantity *moveMinutesGoal;
  void *v3;
  double v4;
  double v5;

  moveMinutesGoal = self->_moveMinutesGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](moveMinutesGoal, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_briskMinutesGoalInMinutes
{
  HKQuantity *briskMinutesGoal;
  void *v3;
  double v4;
  double v5;

  briskMinutesGoal = self->_briskMinutesGoal;
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](briskMinutesGoal, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)_activeHoursGoalCount
{
  HKQuantity *activeHoursGoal;
  void *v3;
  double v4;
  double v5;

  activeHoursGoal = self->_activeHoursGoal;
  +[HKUnit countUnit](HKUnit, "countUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](activeHoursGoal, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKActivityCache)initWithCoder:(id)a3
{
  id v4;
  HKActivityCache *v5;
  uint64_t v6;
  HKQuantity *energyBurned;
  uint64_t v8;
  HKQuantity *energyBurnedGoal;
  uint64_t v10;
  NSDate *energyBurnedGoalDate;
  uint64_t v12;
  void *moveMinutesGoal;
  double v14;
  double v15;
  uint64_t v16;
  HKQuantity *v17;
  uint64_t v18;
  NSDate *moveMinutesGoalDate;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  HKQuantity *walkingAndRunningDistance;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSArray *dailyEnergyBurnedStatistics;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSArray *dailyMoveMinutesStatistics;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSArray *dailyBriskMinutesStatistics;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HKActivityCache;
  v5 = -[HKSample initWithCoder:](&v52, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_49;
  -[HKActivityCache _setCacheIndex:](v5, "_setCacheIndex:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("cacheIndex")));
  -[HKActivityCache _setSequence:](v5, "_setSequence:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sequence")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("energyBurned"));
  v6 = objc_claimAutoreleasedReturnValue();
  energyBurned = v5->_energyBurned;
  v5->_energyBurned = (HKQuantity *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("energyBurnedGoal"));
  v8 = objc_claimAutoreleasedReturnValue();
  energyBurnedGoal = v5->_energyBurnedGoal;
  v5->_energyBurnedGoal = (HKQuantity *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("energyBurnedGoalDate"));
  v10 = objc_claimAutoreleasedReturnValue();
  energyBurnedGoalDate = v5->_energyBurnedGoalDate;
  v5->_energyBurnedGoalDate = (NSDate *)v10;

  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("moveMinutes")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("moveMinutes"));
    -[HKActivityCache _setMoveMinutes:](v5, "_setMoveMinutes:");
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("moveMinutesGoalQuantity")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("moveMinutesGoalQuantity"));
    v12 = objc_claimAutoreleasedReturnValue();
    moveMinutesGoal = v5->_moveMinutesGoal;
    v5->_moveMinutesGoal = (HKQuantity *)v12;
  }
  else
  {
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("moveMinutesGoal")))
      goto LABEL_9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("moveMinutesGoal"));
    v15 = v14;
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    moveMinutesGoal = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", moveMinutesGoal, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v5->_moveMinutesGoal;
    v5->_moveMinutesGoal = (HKQuantity *)v16;

  }
LABEL_9:
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("moveMinutesGoalDate"));
  v18 = objc_claimAutoreleasedReturnValue();
  moveMinutesGoalDate = v5->_moveMinutesGoalDate;
  v5->_moveMinutesGoalDate = (NSDate *)v18;

  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("activeHours")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("activeHours"));
    -[HKActivityCache _setActiveHours:](v5, "_setActiveHours:");
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("activeHoursGoalQuantity")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeHoursGoalQuantity"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivityCache _setActiveHoursGoal:](v5, "_setActiveHoursGoal:", v20);
  }
  else
  {
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("activeHoursGoal")))
      goto LABEL_16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("activeHoursGoal"));
    v22 = v21;
    +[HKUnit countUnit](HKUnit, "countUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivityCache _setActiveHoursGoal:](v5, "_setActiveHoursGoal:", v23);

  }
LABEL_16:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("activeHoursGoalDate")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeHoursGoalDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivityCache _setActiveHoursGoalDateOnly:](v5, "_setActiveHoursGoalDateOnly:", v24);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("briskMinutes")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("briskMinutes"));
    -[HKActivityCache _setBriskMinutes:](v5, "_setBriskMinutes:");
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("briskMinutesGoalQuantity")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("briskMinutesGoalQuantity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivityCache _setBriskMinutesGoal:](v5, "_setBriskMinutesGoal:", v25);
LABEL_24:

    goto LABEL_25;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("briskMinutesGoal")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("briskMinutesGoal"));
    v27 = v26;
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivityCache _setBriskMinutesGoal:](v5, "_setBriskMinutesGoal:", v28);

    goto LABEL_24;
  }
LABEL_25:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("briskMinutesGoalDate")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("briskMinutesGoalDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivityCache _setBriskMinutesGoalDateOnly:](v5, "_setBriskMinutesGoalDateOnly:", v29);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("stepCount")))
    -[HKActivityCache _setStepCount:](v5, "_setStepCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stepCount")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pushCount")))
    -[HKActivityCache _setPushCount:](v5, "_setPushCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pushCount")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("wheelchairUse")))
    -[HKActivityCache _setWheelchairUse:](v5, "_setWheelchairUse:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wheelchairUse")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("deepBreathingDuration")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("deepBreathingDuration"));
    -[HKActivityCache _setDeepBreathingDuration:](v5, "_setDeepBreathingDuration:");
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("walkRunDistance"));
  v30 = objc_claimAutoreleasedReturnValue();
  walkingAndRunningDistance = v5->_walkingAndRunningDistance;
  v5->_walkingAndRunningDistance = (HKQuantity *)v30;

  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("flightsClimbed")))
    -[HKActivityCache _setFlightsClimbed:](v5, "_setFlightsClimbed:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flightsClimbed")));
  v32 = (void *)MEMORY[0x1E0C99E60];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setWithArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("dailyEnergyBurnedStatistics"));
  v35 = objc_claimAutoreleasedReturnValue();
  dailyEnergyBurnedStatistics = v5->_dailyEnergyBurnedStatistics;
  v5->_dailyEnergyBurnedStatistics = (NSArray *)v35;

  v37 = (void *)MEMORY[0x1E0C99E60];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWithArray:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("dailyMoveMinutesStatistics"));
  v40 = objc_claimAutoreleasedReturnValue();
  dailyMoveMinutesStatistics = v5->_dailyMoveMinutesStatistics;
  v5->_dailyMoveMinutesStatistics = (NSArray *)v40;

  v42 = (void *)MEMORY[0x1E0C99E60];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setWithArray:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("dailyBriskMinutesStatistics"));
  v45 = objc_claimAutoreleasedReturnValue();
  dailyBriskMinutesStatistics = v5->_dailyBriskMinutesStatistics;
  v5->_dailyBriskMinutesStatistics = (NSArray *)v45;

  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("activityMoveMode")))
  {
    v47 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activityMoveMode"));
    if (v47 <= 1)
      v48 = 1;
    else
      v48 = v47;
  }
  else
  {
    v48 = 1;
  }
  -[HKActivityCache _setActivityMoveMode:](v5, "_setActivityMoveMode:", v48);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("paused")))
    v49 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("paused"));
  else
    v49 = 0;
  -[HKActivityCache _setPaused:](v5, "_setPaused:", v49);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("version")))
    v50 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  else
    v50 = 1;
  -[HKActivityCache _setVersion:](v5, "_setVersion:", v50);
LABEL_49:

  return v5;
}

- (int64_t)sequence
{
  return self->_sequence;
}

- (void)_setSequence:(int64_t)a3
{
  self->_sequence = a3;
}

- (NSDate)briskMinutesGoalDate
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (NSDate)activeHoursGoalDate
{
  return (NSDate *)objc_getProperty(self, a2, 232, 1);
}

@end
