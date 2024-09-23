@implementation HDCodableActivityCache

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (void)setCacheIndex:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cacheIndex = a3;
}

- (void)setEnergyBurned:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_energyBurned = a3;
}

- (void)setBriskMinutes:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_briskMinutes = a3;
}

- (void)setActiveHours:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_activeHours = a3;
}

- (void)setStepCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_stepCount = a3;
}

- (void)setPushCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_pushCount = a3;
}

- (void)setWheelchairUse:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_wheelchairUse = a3;
}

- (void)setWalkingAndRunningDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_walkingAndRunningDistance = a3;
}

- (void)setEnergyBurnedGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_energyBurnedGoal = a3;
}

- (void)setEnergyBurnedGoalDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_energyBurnedGoalDate = a3;
}

- (void)setDeepBreathingDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_deepBreathingDuration = a3;
}

- (void)setFlightsClimbed:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_flightsClimbed = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  $C9169E0A0C311E50A3922DEA03C68203 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $C9169E0A0C311E50A3922DEA03C68203 v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  $C9169E0A0C311E50A3922DEA03C68203 v22;
  __int128 v23;
  __int128 v24;
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
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_sample)
    PBDataWriterWriteSubmessage();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_53;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_61:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
LABEL_15:
    PBDataWriterWriteInt64Field();
LABEL_16:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = self->_dailyEnergyBurnedStatistics;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_dailyBriskMinutesStatistics;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v13);
  }

  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v16 = self->_has;
    if ((*(_BYTE *)&v16 & 0x20) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v16 & 2) == 0)
        goto LABEL_33;
      goto LABEL_65;
    }
  }
  else if ((*(_BYTE *)&v16 & 0x20) == 0)
  {
    goto LABEL_32;
  }
  PBDataWriterWriteDoubleField();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 2) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v16 & 0x2000) == 0)
      goto LABEL_34;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteDoubleField();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v16 & 0x4000) == 0)
      goto LABEL_35;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteDoubleField();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v16 & 0x8000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_67:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_36:
    PBDataWriterWriteDoubleField();
LABEL_37:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->_dailyMoveMinutesStatistics;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v19);
  }

  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    v22 = self->_has;
    if ((*(_BYTE *)&v22 & 4) == 0)
    {
LABEL_46:
      if ((*(_BYTE *)&v22 & 8) == 0)
        goto LABEL_47;
      goto LABEL_71;
    }
  }
  else if ((*(_BYTE *)&v22 & 4) == 0)
  {
    goto LABEL_46;
  }
  PBDataWriterWriteDoubleField();
  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 8) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v22 & 0x80000) == 0)
      goto LABEL_48;
LABEL_72:
    PBDataWriterWriteInt64Field();
    if ((*(_DWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_71:
  PBDataWriterWriteInt64Field();
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000) != 0)
    goto LABEL_72;
LABEL_48:
  if ((*(_DWORD *)&v22 & 0x400000) != 0)
LABEL_49:
    PBDataWriterWriteBOOLField();
LABEL_50:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_dailyMoveMinutesStatistics, 0);
  objc_storeStrong((id *)&self->_dailyEnergyBurnedStatistics, 0);
  objc_storeStrong((id *)&self->_dailyBriskMinutesStatistics, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
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
  int64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[HDCodableActivityCache sample](self, "sample"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "applyToObject:", v4),
        v5,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "activityCacheType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setSampleType:", v7);

    objc_msgSend(v4, "_setCacheIndex:", -[HDCodableActivityCache cacheIndex](self, "cacheIndex"));
    if (-[HDCodableActivityCache hasSequence](self, "hasSequence"))
      objc_msgSend(v4, "_setSequence:", -[HDCodableActivityCache sequence](self, "sequence"));
    -[HDCodableActivityCache decodedEnergyBurnedQuantity](self, "decodedEnergyBurnedQuantity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setEnergyBurned:", v8);

    -[HDCodableActivityCache decodedWalkingAndRunningDistanceQuantity](self, "decodedWalkingAndRunningDistanceQuantity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setWalkingAndRunningDistance:", v9);

    -[HDCodableActivityCache decodedEnergyBurnedGoalQuantity](self, "decodedEnergyBurnedGoalQuantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setEnergyBurnedGoal:", v10);

    if (-[HDCodableActivityCache hasMoveMinutes](self, "hasMoveMinutes"))
    {
      -[HDCodableActivityCache moveMinutes](self, "moveMinutes");
      objc_msgSend(v4, "_setMoveMinutes:");
    }
    if (-[HDCodableActivityCache hasMoveMinutesGoal](self, "hasMoveMinutesGoal"))
    {
      if (self && (*((_BYTE *)&self->_has + 1) & 0x40) != 0)
      {
        v13 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalMoveMinutesUnit();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14, self->_moveMinutesGoal);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v4, "_setMoveMinutesGoalOnly:", v11);

    }
    if (-[HDCodableActivityCache hasMoveMinutesGoalDate](self, "hasMoveMinutesGoalDate"))
    {
      -[HDCodableActivityCache moveMinutesGoalDate](self, "moveMinutesGoalDate");
      HDDecodeDateForValue();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setMoveMinutesGoalDateOnly:", v15);

    }
    if (-[HDCodableActivityCache hasBriskMinutes](self, "hasBriskMinutes"))
    {
      -[HDCodableActivityCache briskMinutes](self, "briskMinutes");
      objc_msgSend(v4, "_setBriskMinutes:");
    }
    if (-[HDCodableActivityCache hasBriskMinutesGoal](self, "hasBriskMinutesGoal"))
    {
      if (self && (*(_BYTE *)&self->_has & 0x20) != 0)
      {
        v17 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalBriskMinutesUnit();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "quantityWithUnit:doubleValue:", v18, self->_briskMinutesGoal);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v4, "_setBriskMinutesGoalOnly:", v16);

    }
    if (-[HDCodableActivityCache hasBriskMinutesGoalDate](self, "hasBriskMinutesGoalDate"))
    {
      -[HDCodableActivityCache briskMinutesGoalDate](self, "briskMinutesGoalDate");
      HDDecodeDateForValue();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setBriskMinutesGoalDateOnly:", v19);

    }
    if (-[HDCodableActivityCache hasActiveHours](self, "hasActiveHours"))
    {
      -[HDCodableActivityCache activeHours](self, "activeHours");
      objc_msgSend(v4, "_setActiveHours:");
    }
    if (-[HDCodableActivityCache hasActiveHoursGoal](self, "hasActiveHoursGoal"))
    {
      if (self && (*(_BYTE *)&self->_has & 2) != 0)
      {
        v21 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalActiveHoursUnit();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "quantityWithUnit:doubleValue:", v22, self->_activeHoursGoal);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(v4, "_setActiveHoursGoalOnly:", v20);

    }
    if (-[HDCodableActivityCache hasActiveHoursGoalDate](self, "hasActiveHoursGoalDate"))
    {
      -[HDCodableActivityCache activeHoursGoalDate](self, "activeHoursGoalDate");
      HDDecodeDateForValue();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setActiveHoursGoalDateOnly:", v23);

    }
    if (-[HDCodableActivityCache hasStepCount](self, "hasStepCount"))
      objc_msgSend(v4, "_setStepCount:", -[HDCodableActivityCache stepCount](self, "stepCount"));
    if (-[HDCodableActivityCache hasPushCount](self, "hasPushCount"))
      objc_msgSend(v4, "_setPushCount:", -[HDCodableActivityCache pushCount](self, "pushCount"));
    if (-[HDCodableActivityCache hasWheelchairUse](self, "hasWheelchairUse"))
      objc_msgSend(v4, "_setWheelchairUse:", -[HDCodableActivityCache wheelchairUse](self, "wheelchairUse"));
    if (-[HDCodableActivityCache hasEnergyBurnedGoalDate](self, "hasEnergyBurnedGoalDate"))
    {
      -[HDCodableActivityCache decodedEnergyBurnedGoalQuantity](self, "decodedEnergyBurnedGoalQuantity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableActivityCache energyBurnedGoalDate](self, "energyBurnedGoalDate");
      HDDecodeDateForValue();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setEnergyBurnedGoal:date:", v24, v25);

    }
    if (-[HDCodableActivityCache hasFlightsClimbed](self, "hasFlightsClimbed"))
      objc_msgSend(v4, "_setFlightsClimbed:", -[HDCodableActivityCache flightsClimbed](self, "flightsClimbed"));
    if (-[HDCodableActivityCache hasDeepBreathingDuration](self, "hasDeepBreathingDuration"))
    {
      -[HDCodableActivityCache deepBreathingDuration](self, "deepBreathingDuration");
      objc_msgSend(v4, "_setDeepBreathingDuration:");
    }
    if (-[HDCodableActivityCache activityMoveMode](self, "activityMoveMode"))
      v26 = -[HDCodableActivityCache activityMoveMode](self, "activityMoveMode");
    else
      v26 = 1;
    objc_msgSend(v4, "_setActivityMoveMode:", v26);
    objc_msgSend(v4, "_setVersion:", -[HDCodableActivityCache version](self, "version"));
    -[HDCodableActivityCache dailyEnergyBurnedStatistics](self, "dailyEnergyBurnedStatistics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      -[HDCodableActivityCache dailyEnergyBurnedStatistics](self, "dailyEnergyBurnedStatistics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableActivityCache _decodeCodableActivityStatisticsQuantityInfos:]((uint64_t)self, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "_setDailyEnergyBurnedStatistics:", v30);
    }
    -[HDCodableActivityCache dailyMoveMinutesStatistics](self, "dailyMoveMinutesStatistics");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      -[HDCodableActivityCache dailyMoveMinutesStatistics](self, "dailyMoveMinutesStatistics");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableActivityCache _decodeCodableActivityStatisticsQuantityInfos:]((uint64_t)self, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "_setDailyMoveMinutesStatistics:", v34);
    }
    -[HDCodableActivityCache dailyBriskMinutesStatistics](self, "dailyBriskMinutesStatistics");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
    {
      -[HDCodableActivityCache dailyBriskMinutesStatistics](self, "dailyBriskMinutesStatistics");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableActivityCache _decodeCodableActivityStatisticsQuantityInfos:]((uint64_t)self, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "_setDailyBriskMinutesStatistics:", v38);
    }
    objc_msgSend(v4, "_setPaused:", -[HDCodableActivityCache paused](self, "paused"));
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (int64_t)cacheIndex
{
  return self->_cacheIndex;
}

- (id)decodedEnergyBurnedQuantity
{
  void *v2;
  void *v4;
  void *v5;

  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB6A28];
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quantityWithUnit:doubleValue:", v5, self->_energyBurned);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)decodedWalkingAndRunningDistanceQuantity
{
  void *v2;
  void *v4;
  void *v5;

  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quantityWithUnit:doubleValue:", v5, self->_walkingAndRunningDistance);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)decodedEnergyBurnedGoalQuantity
{
  void *v2;
  void *v4;
  void *v5;

  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB6A28];
    _HKWorkoutCanonicalEnergyBurnedUnit();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quantityWithUnit:doubleValue:", v5, self->_energyBurnedGoal);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)hasBriskMinutes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (BOOL)hasActiveHours
{
  return *(_DWORD *)&self->_has & 1;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (BOOL)hasStepCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int64_t)stepCount
{
  return self->_stepCount;
}

- (BOOL)hasPushCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int64_t)pushCount
{
  return self->_pushCount;
}

- (BOOL)hasWheelchairUse
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (BOOL)hasEnergyBurnedGoalDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (double)energyBurnedGoalDate
{
  return self->_energyBurnedGoalDate;
}

- (BOOL)hasFlightsClimbed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int64_t)flightsClimbed
{
  return self->_flightsClimbed;
}

- (BOOL)hasDeepBreathingDuration
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (double)deepBreathingDuration
{
  return self->_deepBreathingDuration;
}

- (id)_decodeCodableActivityStatisticsQuantityInfos:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CB6EF0], "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasCacheIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCacheIndex
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasEnergyBurned:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasEnergyBurned
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasBriskMinutes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)setHasActiveHours:(BOOL)a3
{
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)setHasStepCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)setHasEnergyBurnedGoal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasEnergyBurnedGoal
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasWalkingAndRunningDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWalkingAndRunningDistance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasEnergyBurnedGoalDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)setHasDeepBreathingDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)setHasPushCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)setHasFlightsClimbed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)setHasWheelchairUse:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)clearDailyEnergyBurnedStatistics
{
  -[NSMutableArray removeAllObjects](self->_dailyEnergyBurnedStatistics, "removeAllObjects");
}

- (void)addDailyEnergyBurnedStatistics:(id)a3
{
  id v4;
  NSMutableArray *dailyEnergyBurnedStatistics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  v8 = v4;
  if (!dailyEnergyBurnedStatistics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dailyEnergyBurnedStatistics;
    self->_dailyEnergyBurnedStatistics = v6;

    v4 = v8;
    dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  }
  -[NSMutableArray addObject:](dailyEnergyBurnedStatistics, "addObject:", v4);

}

- (unint64_t)dailyEnergyBurnedStatisticsCount
{
  return -[NSMutableArray count](self->_dailyEnergyBurnedStatistics, "count");
}

- (id)dailyEnergyBurnedStatisticsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dailyEnergyBurnedStatistics, "objectAtIndex:", a3);
}

+ (Class)dailyEnergyBurnedStatisticsType
{
  return (Class)objc_opt_class();
}

- (void)clearDailyBriskMinutesStatistics
{
  -[NSMutableArray removeAllObjects](self->_dailyBriskMinutesStatistics, "removeAllObjects");
}

- (void)addDailyBriskMinutesStatistics:(id)a3
{
  id v4;
  NSMutableArray *dailyBriskMinutesStatistics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  v8 = v4;
  if (!dailyBriskMinutesStatistics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dailyBriskMinutesStatistics;
    self->_dailyBriskMinutesStatistics = v6;

    v4 = v8;
    dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  }
  -[NSMutableArray addObject:](dailyBriskMinutesStatistics, "addObject:", v4);

}

- (unint64_t)dailyBriskMinutesStatisticsCount
{
  return -[NSMutableArray count](self->_dailyBriskMinutesStatistics, "count");
}

- (id)dailyBriskMinutesStatisticsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dailyBriskMinutesStatistics, "objectAtIndex:", a3);
}

+ (Class)dailyBriskMinutesStatisticsType
{
  return (Class)objc_opt_class();
}

- (void)setSequence:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_sequence = a3;
}

- (void)setHasSequence:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSequence
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setBriskMinutesGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_briskMinutesGoal = a3;
}

- (void)setHasBriskMinutesGoal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBriskMinutesGoal
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setActiveHoursGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeHoursGoal = a3;
}

- (void)setHasActiveHoursGoal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveHoursGoal
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMoveMinutes:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_moveMinutes = a3;
}

- (void)setHasMoveMinutes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMoveMinutes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMoveMinutesGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_moveMinutesGoal = a3;
}

- (void)setHasMoveMinutesGoal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMoveMinutesGoal
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMoveMinutesGoalDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_moveMinutesGoalDate = a3;
}

- (void)setHasMoveMinutesGoalDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMoveMinutesGoalDate
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearDailyMoveMinutesStatistics
{
  -[NSMutableArray removeAllObjects](self->_dailyMoveMinutesStatistics, "removeAllObjects");
}

- (void)addDailyMoveMinutesStatistics:(id)a3
{
  id v4;
  NSMutableArray *dailyMoveMinutesStatistics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dailyMoveMinutesStatistics = self->_dailyMoveMinutesStatistics;
  v8 = v4;
  if (!dailyMoveMinutesStatistics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dailyMoveMinutesStatistics;
    self->_dailyMoveMinutesStatistics = v6;

    v4 = v8;
    dailyMoveMinutesStatistics = self->_dailyMoveMinutesStatistics;
  }
  -[NSMutableArray addObject:](dailyMoveMinutesStatistics, "addObject:", v4);

}

- (unint64_t)dailyMoveMinutesStatisticsCount
{
  return -[NSMutableArray count](self->_dailyMoveMinutesStatistics, "count");
}

- (id)dailyMoveMinutesStatisticsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dailyMoveMinutesStatistics, "objectAtIndex:", a3);
}

+ (Class)dailyMoveMinutesStatisticsType
{
  return (Class)objc_opt_class();
}

- (void)setBriskMinutesGoalDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_briskMinutesGoalDate = a3;
}

- (void)setHasBriskMinutesGoalDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBriskMinutesGoalDate
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setActiveHoursGoalDate:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_activeHoursGoalDate = a3;
}

- (void)setHasActiveHoursGoalDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasActiveHoursGoalDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_activityMoveMode = a3;
}

- (void)setHasActivityMoveMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasActivityMoveMode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setPaused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_paused = a3;
}

- (void)setHasPaused:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($C9169E0A0C311E50A3922DEA03C68203)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasPaused
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableActivityCache;
  -[HDCodableActivityCache description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableActivityCache dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  $C9169E0A0C311E50A3922DEA03C68203 has;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  $C9169E0A0C311E50A3922DEA03C68203 v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  $C9169E0A0C311E50A3922DEA03C68203 v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_cacheIndex);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("cacheIndex"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_59;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_energyBurned);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("energyBurned"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_briskMinutes);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("briskMinutes"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_activeHours);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("activeHours"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_stepCount);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("stepCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_energyBurnedGoal);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("energyBurnedGoal"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_walkingAndRunningDistance);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("walkingAndRunningDistance"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_energyBurnedGoalDate);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("energyBurnedGoalDate"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deepBreathingDuration);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("deepBreathingDuration"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_pushCount);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("pushCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_flightsClimbed);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("flightsClimbed"));

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_wheelchairUse);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("wheelchairUse"));

  }
LABEL_16:
  if (-[NSMutableArray count](self->_dailyEnergyBurnedStatistics, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_dailyEnergyBurnedStatistics, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v9 = self->_dailyEnergyBurnedStatistics;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v63 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dailyEnergyBurnedStatistics"));
  }
  if (-[NSMutableArray count](self->_dailyBriskMinutesStatistics, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_dailyBriskMinutesStatistics, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v16 = self->_dailyBriskMinutesStatistics;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v59 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("dailyBriskMinutesStatistics"));
  }
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sequence);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("sequence"));

    v22 = self->_has;
    if ((*(_BYTE *)&v22 & 0x20) == 0)
    {
LABEL_36:
      if ((*(_BYTE *)&v22 & 2) == 0)
        goto LABEL_37;
      goto LABEL_71;
    }
  }
  else if ((*(_BYTE *)&v22 & 0x20) == 0)
  {
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_briskMinutesGoal);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("briskMinutesGoal"));

  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 2) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v22 & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_activeHoursGoal);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("activeHoursGoal"));

  v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v22 & 0x4000) == 0)
      goto LABEL_39;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_moveMinutes);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("moveMinutes"));

  v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v22 & 0x8000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_moveMinutesGoal);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("moveMinutesGoal"));

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_moveMinutesGoalDate);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("moveMinutesGoalDate"));

  }
LABEL_41:
  if (-[NSMutableArray count](self->_dailyMoveMinutesStatistics, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_dailyMoveMinutesStatistics, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v25 = self->_dailyMoveMinutesStatistics;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v55 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v54);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("dailyMoveMinutesStatistics"));
  }
  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_briskMinutesGoalDate);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("briskMinutesGoalDate"));

    v31 = self->_has;
    if ((*(_BYTE *)&v31 & 4) == 0)
    {
LABEL_52:
      if ((*(_BYTE *)&v31 & 8) == 0)
        goto LABEL_53;
      goto LABEL_77;
    }
  }
  else if ((*(_BYTE *)&v31 & 4) == 0)
  {
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_activeHoursGoalDate, (_QWORD)v54);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("activeHoursGoalDate"));

  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 8) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v31 & 0x80000) == 0)
      goto LABEL_54;
LABEL_78:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version, (_QWORD)v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("version"));

    if ((*(_DWORD *)&self->_has & 0x400000) == 0)
      return v3;
    goto LABEL_55;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_activityMoveMode, (_QWORD)v54);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("activityMoveMode"));

  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x80000) != 0)
    goto LABEL_78;
LABEL_54:
  if ((*(_DWORD *)&v31 & 0x400000) != 0)
  {
LABEL_55:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_paused, (_QWORD)v54);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("paused"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableActivityCacheReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  $C9169E0A0C311E50A3922DEA03C68203 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  $C9169E0A0C311E50A3922DEA03C68203 v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  $C9169E0A0C311E50A3922DEA03C68203 v19;
  id v20;

  v4 = a3;
  v20 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v20;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *((_QWORD *)v4 + 8) = self->_cacheIndex;
    *((_DWORD *)v4 + 55) |= 0x80u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_energyBurned;
  *((_DWORD *)v4 + 55) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_briskMinutes;
  *((_DWORD *)v4 + 55) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_activeHours;
  *((_DWORD *)v4 + 55) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)v4 + 19) = self->_stepCount;
  *((_DWORD *)v4 + 55) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_energyBurnedGoal;
  *((_DWORD *)v4 + 55) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)v4 + 21) = *(_QWORD *)&self->_walkingAndRunningDistance;
  *((_DWORD *)v4 + 55) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_energyBurnedGoalDate;
  *((_DWORD *)v4 + 55) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_deepBreathingDuration;
  *((_DWORD *)v4 + 55) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
LABEL_52:
    *((_QWORD *)v4 + 13) = self->_flightsClimbed;
    *((_DWORD *)v4 + 55) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_51:
  *((_QWORD *)v4 + 17) = self->_pushCount;
  *((_DWORD *)v4 + 55) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
    goto LABEL_52;
LABEL_14:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_15:
    *((_QWORD *)v4 + 22) = self->_wheelchairUse;
    *((_DWORD *)v4 + 55) |= 0x200000u;
  }
LABEL_16:
  if (-[HDCodableActivityCache dailyEnergyBurnedStatisticsCount](self, "dailyEnergyBurnedStatisticsCount"))
  {
    objc_msgSend(v20, "clearDailyEnergyBurnedStatistics");
    v6 = -[HDCodableActivityCache dailyEnergyBurnedStatisticsCount](self, "dailyEnergyBurnedStatisticsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableActivityCache dailyEnergyBurnedStatisticsAtIndex:](self, "dailyEnergyBurnedStatisticsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addDailyEnergyBurnedStatistics:", v9);

      }
    }
  }
  if (-[HDCodableActivityCache dailyBriskMinutesStatisticsCount](self, "dailyBriskMinutesStatisticsCount"))
  {
    objc_msgSend(v20, "clearDailyBriskMinutesStatistics");
    v10 = -[HDCodableActivityCache dailyBriskMinutesStatisticsCount](self, "dailyBriskMinutesStatisticsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[HDCodableActivityCache dailyBriskMinutesStatisticsAtIndex:](self, "dailyBriskMinutesStatisticsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addDailyBriskMinutesStatistics:", v13);

      }
    }
  }
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    *((_QWORD *)v20 + 18) = self->_sequence;
    *((_DWORD *)v20 + 55) |= 0x20000u;
    v14 = self->_has;
    if ((*(_BYTE *)&v14 & 0x20) == 0)
    {
LABEL_26:
      if ((*(_BYTE *)&v14 & 2) == 0)
        goto LABEL_27;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&v14 & 0x20) == 0)
  {
    goto LABEL_26;
  }
  *((_QWORD *)v20 + 6) = *(_QWORD *)&self->_briskMinutesGoal;
  *((_DWORD *)v20 + 55) |= 0x20u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 2) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)v20 + 2) = *(_QWORD *)&self->_activeHoursGoal;
  *((_DWORD *)v20 + 55) |= 2u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_29;
LABEL_58:
    *((_QWORD *)v20 + 15) = *(_QWORD *)&self->_moveMinutesGoal;
    *((_DWORD *)v20 + 55) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_57:
  *((_QWORD *)v20 + 14) = *(_QWORD *)&self->_moveMinutes;
  *((_DWORD *)v20 + 55) |= 0x2000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
    goto LABEL_58;
LABEL_29:
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
LABEL_30:
    *((_QWORD *)v20 + 16) = *(_QWORD *)&self->_moveMinutesGoalDate;
    *((_DWORD *)v20 + 55) |= 0x8000u;
  }
LABEL_31:
  if (-[HDCodableActivityCache dailyMoveMinutesStatisticsCount](self, "dailyMoveMinutesStatisticsCount"))
  {
    objc_msgSend(v20, "clearDailyMoveMinutesStatistics");
    v15 = -[HDCodableActivityCache dailyMoveMinutesStatisticsCount](self, "dailyMoveMinutesStatisticsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[HDCodableActivityCache dailyMoveMinutesStatisticsAtIndex:](self, "dailyMoveMinutesStatisticsAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addDailyMoveMinutesStatistics:", v18);

      }
    }
  }
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 0x40) != 0)
  {
    *((_QWORD *)v20 + 7) = *(_QWORD *)&self->_briskMinutesGoalDate;
    *((_DWORD *)v20 + 55) |= 0x40u;
    v19 = self->_has;
    if ((*(_BYTE *)&v19 & 4) == 0)
    {
LABEL_37:
      if ((*(_BYTE *)&v19 & 8) == 0)
        goto LABEL_38;
      goto LABEL_62;
    }
  }
  else if ((*(_BYTE *)&v19 & 4) == 0)
  {
    goto LABEL_37;
  }
  *((_QWORD *)v20 + 3) = *(_QWORD *)&self->_activeHoursGoalDate;
  *((_DWORD *)v20 + 55) |= 4u;
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 8) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v19 & 0x80000) == 0)
      goto LABEL_39;
LABEL_63:
    *((_QWORD *)v20 + 20) = self->_version;
    *((_DWORD *)v20 + 55) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_62:
  *((_QWORD *)v20 + 4) = self->_activityMoveMode;
  *((_DWORD *)v20 + 55) |= 8u;
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x80000) != 0)
    goto LABEL_63;
LABEL_39:
  if ((*(_DWORD *)&v19 & 0x400000) != 0)
  {
LABEL_40:
    *((_BYTE *)v20 + 216) = self->_paused;
    *((_DWORD *)v20 + 55) |= 0x400000u;
  }
LABEL_41:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  $C9169E0A0C311E50A3922DEA03C68203 has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  $C9169E0A0C311E50A3922DEA03C68203 v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  $C9169E0A0C311E50A3922DEA03C68203 v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v6;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_cacheIndex;
    *(_DWORD *)(v5 + 220) |= 0x80u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 80) = self->_energyBurned;
  *(_DWORD *)(v5 + 220) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 40) = self->_briskMinutes;
  *(_DWORD *)(v5 + 220) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 8) = self->_activeHours;
  *(_DWORD *)(v5 + 220) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  *(_QWORD *)(v5 + 152) = self->_stepCount;
  *(_DWORD *)(v5 + 220) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  *(double *)(v5 + 88) = self->_energyBurnedGoal;
  *(_DWORD *)(v5 + 220) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  *(double *)(v5 + 168) = self->_walkingAndRunningDistance;
  *(_DWORD *)(v5 + 220) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  *(double *)(v5 + 96) = self->_energyBurnedGoalDate;
  *(_DWORD *)(v5 + 220) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  *(double *)(v5 + 72) = self->_deepBreathingDuration;
  *(_DWORD *)(v5 + 220) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  *(_QWORD *)(v5 + 136) = self->_pushCount;
  *(_DWORD *)(v5 + 220) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_59:
  *(_QWORD *)(v5 + 104) = self->_flightsClimbed;
  *(_DWORD *)(v5 + 220) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_13:
    *(_QWORD *)(v5 + 176) = self->_wheelchairUse;
    *(_DWORD *)(v5 + 220) |= 0x200000u;
  }
LABEL_14:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = self->_dailyEnergyBurnedStatistics;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v13), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDailyEnergyBurnedStatistics:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v11);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = self->_dailyBriskMinutesStatistics;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v35;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v19), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDailyBriskMinutesStatistics:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v17);
  }

  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x20000) != 0)
  {
    *(_QWORD *)(v5 + 144) = self->_sequence;
    *(_DWORD *)(v5 + 220) |= 0x20000u;
    v21 = self->_has;
    if ((*(_BYTE *)&v21 & 0x20) == 0)
    {
LABEL_30:
      if ((*(_BYTE *)&v21 & 2) == 0)
        goto LABEL_31;
      goto LABEL_63;
    }
  }
  else if ((*(_BYTE *)&v21 & 0x20) == 0)
  {
    goto LABEL_30;
  }
  *(double *)(v5 + 48) = self->_briskMinutesGoal;
  *(_DWORD *)(v5 + 220) |= 0x20u;
  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v21 & 0x2000) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  *(double *)(v5 + 16) = self->_activeHoursGoal;
  *(_DWORD *)(v5 + 220) |= 2u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v21 & 0x4000) == 0)
      goto LABEL_33;
    goto LABEL_65;
  }
LABEL_64:
  *(double *)(v5 + 112) = self->_moveMinutes;
  *(_DWORD *)(v5 + 220) |= 0x2000u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v21 & 0x8000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_65:
  *(double *)(v5 + 120) = self->_moveMinutesGoal;
  *(_DWORD *)(v5 + 220) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_34:
    *(double *)(v5 + 128) = self->_moveMinutesGoalDate;
    *(_DWORD *)(v5 + 220) |= 0x8000u;
  }
LABEL_35:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = self->_dailyMoveMinutesStatistics;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v26), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v5, "addDailyMoveMinutesStatistics:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v24);
  }

  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_briskMinutesGoalDate;
    *(_DWORD *)(v5 + 220) |= 0x40u;
    v28 = self->_has;
    if ((*(_BYTE *)&v28 & 4) == 0)
    {
LABEL_44:
      if ((*(_BYTE *)&v28 & 8) == 0)
        goto LABEL_45;
      goto LABEL_69;
    }
  }
  else if ((*(_BYTE *)&v28 & 4) == 0)
  {
    goto LABEL_44;
  }
  *(double *)(v5 + 24) = self->_activeHoursGoalDate;
  *(_DWORD *)(v5 + 220) |= 4u;
  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 8) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v28 & 0x80000) == 0)
      goto LABEL_46;
LABEL_70:
    *(_QWORD *)(v5 + 160) = self->_version;
    *(_DWORD *)(v5 + 220) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x400000) == 0)
      return (id)v5;
    goto LABEL_47;
  }
LABEL_69:
  *(_QWORD *)(v5 + 32) = self->_activityMoveMode;
  *(_DWORD *)(v5 + 220) |= 8u;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x80000) != 0)
    goto LABEL_70;
LABEL_46:
  if ((*(_DWORD *)&v28 & 0x400000) != 0)
  {
LABEL_47:
    *(_BYTE *)(v5 + 216) = self->_paused;
    *(_DWORD *)(v5 + 220) |= 0x400000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  $C9169E0A0C311E50A3922DEA03C68203 has;
  int v7;
  NSMutableArray *dailyEnergyBurnedStatistics;
  NSMutableArray *dailyBriskMinutesStatistics;
  $C9169E0A0C311E50A3922DEA03C68203 v10;
  int v11;
  NSMutableArray *dailyMoveMinutesStatistics;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_124;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 26))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_124;
  }
  has = self->_has;
  v7 = *((_DWORD *)v4 + 55);
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_cacheIndex != *((_QWORD *)v4 + 8))
      goto LABEL_124;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_energyBurned != *((double *)v4 + 10))
      goto LABEL_124;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_briskMinutes != *((double *)v4 + 5))
      goto LABEL_124;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_activeHours != *((double *)v4 + 1))
      goto LABEL_124;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_stepCount != *((_QWORD *)v4 + 19))
      goto LABEL_124;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_energyBurnedGoal != *((double *)v4 + 11))
      goto LABEL_124;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_walkingAndRunningDistance != *((double *)v4 + 21))
      goto LABEL_124;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_energyBurnedGoalDate != *((double *)v4 + 12))
      goto LABEL_124;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_deepBreathingDuration != *((double *)v4 + 9))
      goto LABEL_124;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_pushCount != *((_QWORD *)v4 + 17))
      goto LABEL_124;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_flightsClimbed != *((_QWORD *)v4 + 13))
      goto LABEL_124;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_wheelchairUse != *((_QWORD *)v4 + 22))
      goto LABEL_124;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_124;
  }
  dailyEnergyBurnedStatistics = self->_dailyEnergyBurnedStatistics;
  if ((unint64_t)dailyEnergyBurnedStatistics | *((_QWORD *)v4 + 24)
    && !-[NSMutableArray isEqual:](dailyEnergyBurnedStatistics, "isEqual:"))
  {
    goto LABEL_124;
  }
  dailyBriskMinutesStatistics = self->_dailyBriskMinutesStatistics;
  if ((unint64_t)dailyBriskMinutesStatistics | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](dailyBriskMinutesStatistics, "isEqual:"))
      goto LABEL_124;
  }
  v10 = self->_has;
  v11 = *((_DWORD *)v4 + 55);
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_sequence != *((_QWORD *)v4 + 18))
      goto LABEL_124;
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_briskMinutesGoal != *((double *)v4 + 6))
      goto LABEL_124;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_activeHoursGoal != *((double *)v4 + 2))
      goto LABEL_124;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_moveMinutes != *((double *)v4 + 14))
      goto LABEL_124;
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_moveMinutesGoal != *((double *)v4 + 15))
      goto LABEL_124;
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_moveMinutesGoalDate != *((double *)v4 + 16))
      goto LABEL_124;
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_124;
  }
  dailyMoveMinutesStatistics = self->_dailyMoveMinutesStatistics;
  if ((unint64_t)dailyMoveMinutesStatistics | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](dailyMoveMinutesStatistics, "isEqual:"))
      goto LABEL_124;
    v10 = self->_has;
    v11 = *((_DWORD *)v4 + 55);
  }
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_briskMinutesGoalDate != *((double *)v4 + 7))
      goto LABEL_124;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_activeHoursGoalDate != *((double *)v4 + 3))
      goto LABEL_124;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_activityMoveMode != *((_QWORD *)v4 + 4))
      goto LABEL_124;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    if ((v11 & 0x80000) == 0 || self->_version != *((_QWORD *)v4 + 20))
      goto LABEL_124;
  }
  else if ((v11 & 0x80000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&v10 & 0x400000) != 0)
  {
    if ((v11 & 0x400000) != 0)
    {
      if (self->_paused)
      {
        if (!*((_BYTE *)v4 + 216))
          goto LABEL_124;
      }
      else if (*((_BYTE *)v4 + 216))
      {
        goto LABEL_124;
      }
      v13 = 1;
      goto LABEL_125;
    }
LABEL_124:
    v13 = 0;
    goto LABEL_125;
  }
  v13 = (v11 & 0x400000) == 0;
LABEL_125:

  return v13;
}

- (unint64_t)hash
{
  $C9169E0A0C311E50A3922DEA03C68203 has;
  double energyBurned;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double briskMinutes;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double activeHours;
  double v16;
  long double v17;
  double v18;
  double energyBurnedGoal;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  double walkingAndRunningDistance;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double energyBurnedGoalDate;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double deepBreathingDuration;
  double v36;
  long double v37;
  double v38;
  $C9169E0A0C311E50A3922DEA03C68203 v39;
  double briskMinutesGoal;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  double activeHoursGoal;
  double v47;
  long double v48;
  double v49;
  unint64_t v50;
  double moveMinutes;
  double v52;
  long double v53;
  double v54;
  unint64_t v55;
  unint64_t v56;
  double moveMinutesGoal;
  double v58;
  long double v59;
  double v60;
  unint64_t v61;
  unint64_t v62;
  double moveMinutesGoalDate;
  double v64;
  long double v65;
  double v66;
  uint64_t v67;
  $C9169E0A0C311E50A3922DEA03C68203 v68;
  unint64_t v69;
  double briskMinutesGoalDate;
  double v71;
  long double v72;
  double v73;
  unint64_t v74;
  double activeHoursGoalDate;
  double v76;
  long double v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;

  v98 = -[HDCodableSample hash](self->_sample, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v97 = 2654435761 * self->_cacheIndex;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v97 = 0;
  if ((*(_WORD *)&has & 0x200) == 0)
    goto LABEL_8;
LABEL_3:
  energyBurned = self->_energyBurned;
  v5 = -energyBurned;
  if (energyBurned >= 0.0)
    v5 = self->_energyBurned;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    briskMinutes = self->_briskMinutes;
    v11 = -briskMinutes;
    if (briskMinutes >= 0.0)
      v11 = self->_briskMinutes;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    activeHours = self->_activeHours;
    v16 = -activeHours;
    if (activeHours >= 0.0)
      v16 = self->_activeHours;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v94 = 2654435761 * self->_stepCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_29;
LABEL_34:
    v23 = 0;
    goto LABEL_37;
  }
  v94 = 0;
  if ((*(_WORD *)&has & 0x400) == 0)
    goto LABEL_34;
LABEL_29:
  energyBurnedGoal = self->_energyBurnedGoal;
  v20 = -energyBurnedGoal;
  if (energyBurnedGoal >= 0.0)
    v20 = self->_energyBurnedGoal;
  v21 = floor(v20 + 0.5);
  v22 = (v20 - v21) * 1.84467441e19;
  v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
  if (v22 >= 0.0)
  {
    if (v22 > 0.0)
      v23 += (unint64_t)v22;
  }
  else
  {
    v23 -= (unint64_t)fabs(v22);
  }
LABEL_37:
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    walkingAndRunningDistance = self->_walkingAndRunningDistance;
    v26 = -walkingAndRunningDistance;
    if (walkingAndRunningDistance >= 0.0)
      v26 = self->_walkingAndRunningDistance;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    energyBurnedGoalDate = self->_energyBurnedGoalDate;
    v31 = -energyBurnedGoalDate;
    if (energyBurnedGoalDate >= 0.0)
      v31 = self->_energyBurnedGoalDate;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    deepBreathingDuration = self->_deepBreathingDuration;
    v36 = -deepBreathingDuration;
    if (deepBreathingDuration >= 0.0)
      v36 = self->_deepBreathingDuration;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    v91 = 2654435761 * self->_pushCount;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_63;
  }
  else
  {
    v91 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_63:
      v90 = 2654435761 * self->_flightsClimbed;
      goto LABEL_66;
    }
  }
  v90 = 0;
LABEL_66:
  v95 = v9;
  v92 = v34;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    v89 = 2654435761 * self->_wheelchairUse;
  else
    v89 = 0;
  v88 = -[NSMutableArray hash](self->_dailyEnergyBurnedStatistics, "hash");
  v87 = -[NSMutableArray hash](self->_dailyBriskMinutesStatistics, "hash");
  v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x20000) != 0)
  {
    v86 = 2654435761 * self->_sequence;
    if ((*(_BYTE *)&v39 & 0x20) != 0)
      goto LABEL_71;
LABEL_76:
    v44 = 0;
    goto LABEL_79;
  }
  v86 = 0;
  if ((*(_BYTE *)&v39 & 0x20) == 0)
    goto LABEL_76;
LABEL_71:
  briskMinutesGoal = self->_briskMinutesGoal;
  v41 = -briskMinutesGoal;
  if (briskMinutesGoal >= 0.0)
    v41 = self->_briskMinutesGoal;
  v42 = floor(v41 + 0.5);
  v43 = (v41 - v42) * 1.84467441e19;
  v44 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
  if (v43 >= 0.0)
  {
    if (v43 > 0.0)
      v44 += (unint64_t)v43;
  }
  else
  {
    v44 -= (unint64_t)fabs(v43);
  }
LABEL_79:
  if ((*(_BYTE *)&v39 & 2) != 0)
  {
    activeHoursGoal = self->_activeHoursGoal;
    v47 = -activeHoursGoal;
    if (activeHoursGoal >= 0.0)
      v47 = self->_activeHoursGoal;
    v48 = floor(v47 + 0.5);
    v49 = (v47 - v48) * 1.84467441e19;
    v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0)
        v45 += (unint64_t)v49;
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    v45 = 0;
  }
  v83 = v45;
  v96 = v8;
  if ((*(_WORD *)&v39 & 0x2000) != 0)
  {
    moveMinutes = self->_moveMinutes;
    v52 = -moveMinutes;
    if (moveMinutes >= 0.0)
      v52 = self->_moveMinutes;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0)
        v50 += (unint64_t)v54;
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    v50 = 0;
  }
  v93 = v14;
  v85 = v44;
  if ((*(_WORD *)&v39 & 0x4000) != 0)
  {
    moveMinutesGoal = self->_moveMinutesGoal;
    v58 = -moveMinutesGoal;
    if (moveMinutesGoal >= 0.0)
      v58 = self->_moveMinutesGoal;
    v59 = floor(v58 + 0.5);
    v60 = (v58 - v59) * 1.84467441e19;
    v56 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
    v55 = v29;
    if (v60 >= 0.0)
    {
      if (v60 > 0.0)
        v56 += (unint64_t)v60;
    }
    else
    {
      v56 -= (unint64_t)fabs(v60);
    }
  }
  else
  {
    v55 = v29;
    v56 = 0;
  }
  v61 = v24;
  if ((*(_WORD *)&v39 & 0x8000) != 0)
  {
    moveMinutesGoalDate = self->_moveMinutesGoalDate;
    v64 = -moveMinutesGoalDate;
    if (moveMinutesGoalDate >= 0.0)
      v64 = self->_moveMinutesGoalDate;
    v65 = floor(v64 + 0.5);
    v66 = (v64 - v65) * 1.84467441e19;
    v62 = 2654435761u * (unint64_t)fmod(v65, 1.84467441e19);
    if (v66 >= 0.0)
    {
      if (v66 > 0.0)
        v62 += (unint64_t)v66;
    }
    else
    {
      v62 -= (unint64_t)fabs(v66);
    }
  }
  else
  {
    v62 = 0;
  }
  v67 = -[NSMutableArray hash](self->_dailyMoveMinutesStatistics, "hash", v83);
  v68 = self->_has;
  if ((*(_BYTE *)&v68 & 0x40) != 0)
  {
    briskMinutesGoalDate = self->_briskMinutesGoalDate;
    v71 = -briskMinutesGoalDate;
    if (briskMinutesGoalDate >= 0.0)
      v71 = self->_briskMinutesGoalDate;
    v72 = floor(v71 + 0.5);
    v73 = (v71 - v72) * 1.84467441e19;
    v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0)
        v69 += (unint64_t)v73;
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    v69 = 0;
  }
  if ((*(_BYTE *)&v68 & 4) != 0)
  {
    activeHoursGoalDate = self->_activeHoursGoalDate;
    v76 = -activeHoursGoalDate;
    if (activeHoursGoalDate >= 0.0)
      v76 = self->_activeHoursGoalDate;
    v77 = floor(v76 + 0.5);
    v78 = (v76 - v77) * 1.84467441e19;
    v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0)
        v74 += (unint64_t)v78;
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    v74 = 0;
  }
  if ((*(_BYTE *)&v68 & 8) == 0)
  {
    v79 = 0;
    if ((*(_DWORD *)&v68 & 0x80000) != 0)
      goto LABEL_129;
LABEL_132:
    v80 = 0;
    if ((*(_DWORD *)&v68 & 0x400000) != 0)
      goto LABEL_130;
LABEL_133:
    v81 = 0;
    return v97 ^ v98 ^ v96 ^ v95 ^ v93 ^ v94 ^ v23 ^ v61 ^ v55 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v50 ^ v56 ^ v62 ^ v67 ^ v69 ^ v74 ^ v79 ^ v80 ^ v81;
  }
  v79 = 2654435761 * self->_activityMoveMode;
  if ((*(_DWORD *)&v68 & 0x80000) == 0)
    goto LABEL_132;
LABEL_129:
  v80 = 2654435761 * self->_version;
  if ((*(_DWORD *)&v68 & 0x400000) == 0)
    goto LABEL_133;
LABEL_130:
  v81 = 2654435761 * self->_paused;
  return v97 ^ v98 ^ v96 ^ v95 ^ v93 ^ v94 ^ v23 ^ v61 ^ v55 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v50 ^ v56 ^ v62 ^ v67 ^ v69 ^ v74 ^ v79 ^ v80 ^ v81;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  int v24;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 26);
  if (sample)
  {
    if (v6)
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableActivityCache setSample:](self, "setSample:");
  }
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x80) != 0)
  {
    self->_cacheIndex = *((_QWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    v7 = *((_DWORD *)v4 + 55);
    if ((v7 & 0x200) == 0)
    {
LABEL_8:
      if ((v7 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_56;
    }
  }
  else if ((v7 & 0x200) == 0)
  {
    goto LABEL_8;
  }
  self->_energyBurned = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x10) == 0)
  {
LABEL_9:
    if ((v7 & 1) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  self->_briskMinutes = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 1) == 0)
  {
LABEL_10:
    if ((v7 & 0x40000) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  self->_activeHours = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x40000) == 0)
  {
LABEL_11:
    if ((v7 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  self->_stepCount = *((_QWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x400) == 0)
  {
LABEL_12:
    if ((v7 & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  self->_energyBurnedGoal = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x100000) == 0)
  {
LABEL_13:
    if ((v7 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  self->_walkingAndRunningDistance = *((double *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x800) == 0)
  {
LABEL_14:
    if ((v7 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  self->_energyBurnedGoalDate = *((double *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x100) == 0)
  {
LABEL_15:
    if ((v7 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  self->_deepBreathingDuration = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x10000) == 0)
  {
LABEL_16:
    if ((v7 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  self->_pushCount = *((_QWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v7 = *((_DWORD *)v4 + 55);
  if ((v7 & 0x1000) == 0)
  {
LABEL_17:
    if ((v7 & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_64:
  self->_flightsClimbed = *((_QWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 55) & 0x200000) != 0)
  {
LABEL_18:
    self->_wheelchairUse = *((_QWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_19:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = *((id *)v4 + 24);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        -[HDCodableActivityCache addDailyEnergyBurnedStatistics:](self, "addDailyEnergyBurnedStatistics:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = *((id *)v4 + 23);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        -[HDCodableActivityCache addDailyBriskMinutesStatistics:](self, "addDailyBriskMinutesStatistics:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v15);
  }

  v18 = *((_DWORD *)v4 + 55);
  if ((v18 & 0x20000) != 0)
  {
    self->_sequence = *((_QWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x20000u;
    v18 = *((_DWORD *)v4 + 55);
    if ((v18 & 0x20) == 0)
    {
LABEL_35:
      if ((v18 & 2) == 0)
        goto LABEL_36;
      goto LABEL_68;
    }
  }
  else if ((v18 & 0x20) == 0)
  {
    goto LABEL_35;
  }
  self->_briskMinutesGoal = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v18 = *((_DWORD *)v4 + 55);
  if ((v18 & 2) == 0)
  {
LABEL_36:
    if ((v18 & 0x2000) == 0)
      goto LABEL_37;
    goto LABEL_69;
  }
LABEL_68:
  self->_activeHoursGoal = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v18 = *((_DWORD *)v4 + 55);
  if ((v18 & 0x2000) == 0)
  {
LABEL_37:
    if ((v18 & 0x4000) == 0)
      goto LABEL_38;
    goto LABEL_70;
  }
LABEL_69:
  self->_moveMinutes = *((double *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v18 = *((_DWORD *)v4 + 55);
  if ((v18 & 0x4000) == 0)
  {
LABEL_38:
    if ((v18 & 0x8000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_70:
  self->_moveMinutesGoal = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 55) & 0x8000) != 0)
  {
LABEL_39:
    self->_moveMinutesGoalDate = *((double *)v4 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_40:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = *((id *)v4 + 25);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        -[HDCodableActivityCache addDailyMoveMinutesStatistics:](self, "addDailyMoveMinutesStatistics:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k), (_QWORD)v25);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v21);
  }

  v24 = *((_DWORD *)v4 + 55);
  if ((v24 & 0x40) != 0)
  {
    self->_briskMinutesGoalDate = *((double *)v4 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
    v24 = *((_DWORD *)v4 + 55);
    if ((v24 & 4) == 0)
    {
LABEL_49:
      if ((v24 & 8) == 0)
        goto LABEL_50;
      goto LABEL_74;
    }
  }
  else if ((v24 & 4) == 0)
  {
    goto LABEL_49;
  }
  self->_activeHoursGoalDate = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v24 = *((_DWORD *)v4 + 55);
  if ((v24 & 8) == 0)
  {
LABEL_50:
    if ((v24 & 0x80000) == 0)
      goto LABEL_51;
LABEL_75:
    self->_version = *((_QWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x80000u;
    if ((*((_DWORD *)v4 + 55) & 0x400000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_74:
  self->_activityMoveMode = *((_QWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v24 = *((_DWORD *)v4 + 55);
  if ((v24 & 0x80000) != 0)
    goto LABEL_75;
LABEL_51:
  if ((v24 & 0x400000) != 0)
  {
LABEL_52:
    self->_paused = *((_BYTE *)v4 + 216);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_53:

}

- (double)energyBurned
{
  return self->_energyBurned;
}

- (double)energyBurnedGoal
{
  return self->_energyBurnedGoal;
}

- (double)walkingAndRunningDistance
{
  return self->_walkingAndRunningDistance;
}

- (NSMutableArray)dailyEnergyBurnedStatistics
{
  return self->_dailyEnergyBurnedStatistics;
}

- (void)setDailyEnergyBurnedStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyEnergyBurnedStatistics, a3);
}

- (NSMutableArray)dailyBriskMinutesStatistics
{
  return self->_dailyBriskMinutesStatistics;
}

- (void)setDailyBriskMinutesStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyBriskMinutesStatistics, a3);
}

- (int64_t)sequence
{
  return self->_sequence;
}

- (double)briskMinutesGoal
{
  return self->_briskMinutesGoal;
}

- (double)activeHoursGoal
{
  return self->_activeHoursGoal;
}

- (double)moveMinutes
{
  return self->_moveMinutes;
}

- (double)moveMinutesGoal
{
  return self->_moveMinutesGoal;
}

- (double)moveMinutesGoalDate
{
  return self->_moveMinutesGoalDate;
}

- (NSMutableArray)dailyMoveMinutesStatistics
{
  return self->_dailyMoveMinutesStatistics;
}

- (void)setDailyMoveMinutesStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyMoveMinutesStatistics, a3);
}

- (double)briskMinutesGoalDate
{
  return self->_briskMinutesGoalDate;
}

- (double)activeHoursGoalDate
{
  return self->_activeHoursGoalDate;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)paused
{
  return self->_paused;
}

@end
